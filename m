Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht377-0005fh-I1
 for ath11k@lists.infradead.org; Thu, 01 Aug 2019 04:54:55 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix resource leak in ath11k_mac_sta_state
Date: Thu,  1 Aug 2019 10:24:19 +0530
Message-Id: <1564635259-27502-1-git-send-email-periyasa@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Handled the error case with proper resource cleanup and
moved the handling into a separate function from
ath11k_mac_sta_state.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 144 ++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6a3b1a1..5b00f16 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2540,6 +2540,87 @@ static void ath11k_mac_dec_num_stations(struct ath11k_vif *arvif,
 	ar->num_stations--;
 }
 
+static int ath11k_mac_station_add(struct ath11k *ar,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_sta *sta)
+{
+	struct ath11k_base *ab = ar->ab;
+	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct peer_create_params peer_param;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	ret = ath11k_mac_inc_num_stations(arvif, sta);
+	if (ret) {
+		ath11k_warn(ab, "refusing to associate station: too many connected already (%d)\n",
+			    ar->max_num_stations);
+		goto exit;
+	}
+
+	arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+	if (!arsta->rx_stats) {
+		ret = -ENOMEM;
+		goto dec_num_station;
+	}
+
+	peer_param.vdev_id = arvif->vdev_id;
+	peer_param.peer_addr = sta->addr;
+	peer_param.peer_type = WMI_PEER_TYPE_DEFAULT;
+
+	ret = ath11k_peer_create(ar, arvif, sta, &peer_param);
+	if (ret) {
+		ath11k_warn(ab, "Failed to add peer: %pM for VDEV: %d\n",
+			    sta->addr, arvif->vdev_id);
+		goto free_rx_stats;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "Added peer: %pM for VDEV: %d\n",
+		   sta->addr, arvif->vdev_id);
+
+	if (ath11k_debug_is_extd_tx_stats_enabled(ar)) {
+		arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats), GFP_KERNEL);
+		if (!arsta->tx_stats) {
+			ret = -ENOMEM;
+			goto free_peer;
+		}
+	}
+
+	if (ieee80211_vif_is_mesh(vif)) {
+		ret = ath11k_wmi_set_peer_param(ar, sta->addr,
+						arvif->vdev_id,
+						WMI_PEER_USE_4ADDR, 1);
+		if (ret) {
+			ath11k_warn(ab, "failed to STA %pM 4addr capability: %d\n",
+				    sta->addr, ret);
+			goto free_tx_stats;
+		}
+	}
+
+	ret = ath11k_dp_peer_setup(ar, arvif->vdev_id, sta->addr);
+	if (ret) {
+		ath11k_warn(ab, "failed to setup dp for peer %pM on vdev %i (%d)\n",
+			    sta->addr, arvif->vdev_id, ret);
+		goto free_tx_stats;
+	}
+
+	return 0;
+
+free_tx_stats:
+	kfree(arsta->tx_stats);
+	arsta->tx_stats = NULL;
+free_peer:
+	ath11k_peer_delete(ar, arvif->vdev_id, sta->addr);
+free_rx_stats:
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
+dec_num_station:
+	ath11k_mac_dec_num_stations(arvif, sta);
+exit:
+	return ret;
+}
+
 static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -2549,7 +2630,6 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
-	struct peer_create_params peer_param;
 	int ret = 0;
 
 	/* cancel must be done outside the mutex to avoid deadlock */
@@ -2565,60 +2645,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		arsta->arvif = arvif;
 		INIT_WORK(&arsta->update_wk, ath11k_sta_rc_update_wk);
 
-		ret = ath11k_mac_inc_num_stations(arvif, sta);
-		if (ret) {
-			ath11k_warn(ar->ab, "refusing to associate station: too many connected already (%d)\n",
-				    ar->max_num_stations);
-			goto exit;
-		}
-
-		arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
-		if (!arsta->rx_stats) {
-			ret = -ENOMEM;
-			goto exit;
-		}
-
-		peer_param.vdev_id = arvif->vdev_id;
-		peer_param.peer_addr = sta->addr;
-		peer_param.peer_type = WMI_PEER_TYPE_DEFAULT;
-		ret = ath11k_peer_create(ar, arvif, sta, &peer_param);
-		if (ret) {
-			ath11k_warn(ar->ab, "Failed to add peer: %pM for VDEV: %d\n",
+		ret = ath11k_mac_station_add(ar, vif, sta);
+		if (ret)
+			ath11k_warn(ar->ab, "Failed to add station: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
-			ath11k_mac_dec_num_stations(arvif, sta);
-			goto exit;
-		}
-
-		ath11k_info(ar->ab, "Added peer: %pM for VDEV: %d\n",
-			    sta->addr, arvif->vdev_id);
-
-		if (ath11k_debug_is_extd_tx_stats_enabled(ar)) {
-			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
-						  GFP_KERNEL);
-			if (!arsta->tx_stats) {
-				ret = -ENOMEM;
-				goto exit;
-			}
-		}
-
-		if (ieee80211_vif_is_mesh(vif)) {
-			ret = ath11k_wmi_set_peer_param(ar, sta->addr,
-							arvif->vdev_id,
-							WMI_PEER_USE_4ADDR, 1);
-			if (ret) {
-				ath11k_warn(ar->ab, "failed to STA %pM 4addr capability: %d\n",
-					    sta->addr, ret);
-				goto exit;
-			}
-		}
-
-		ret = ath11k_dp_peer_setup(ar, arvif->vdev_id, sta->addr);
-		if (ret) {
-			ath11k_warn(ar->ab, "failed to setup dp for peer %pM on vdev %i (%d)\n",
-				    sta->addr, arvif->vdev_id, ret);
-			ath11k_peer_delete(ar, arvif->vdev_id, sta->addr);
-			ath11k_mac_dec_num_stations(arvif, sta);
-		}
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
 		ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
@@ -2628,9 +2658,8 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to delete peer: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
 		else
-			ath11k_info(ar->ab,
-				    "Removed peer: %pM for VDEV: %d\n",
-				    sta->addr, arvif->vdev_id);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "Removed peer: %pM for VDEV: %d\n",
+				   sta->addr, arvif->vdev_id);
 
 		ath11k_mac_dec_num_stations(arvif, sta);
 
@@ -2667,7 +2696,6 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
-exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
