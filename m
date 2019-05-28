Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVYHr-0005u1-23
 for ath11k@lists.infradead.org; Tue, 28 May 2019 09:20:53 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: Allow station connections up to max supported only
Date: Tue, 28 May 2019 14:50:46 +0530
Message-Id: <1559035246-3833-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

This patch add support to allow station connection request up to max
number of stations supported by target.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 43 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 148c9a4..b10d81f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -448,6 +448,7 @@ struct ath11k {
 	u32 txpower_scale;
 	u32 power_scale;
 	u32 chan_tx_pwr;
+	u32 num_stations;
 	u32 max_num_stations;
 	bool monitor_present;
 	struct mutex conf_mutex;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e..7de1832 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -744,6 +744,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	spin_unlock_bh(&ab->data_lock);
 
 	ar->num_peers = 0;
+	ar->num_stations = 0;
 }
 
 static void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
@@ -2530,6 +2531,37 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static int ath11k_mac_inc_num_stations(struct ath11k_vif *arvif,
+				       struct ieee80211_sta *sta)
+{
+	struct ath11k *ar = arvif->ar;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (arvif->vdev_type == WMI_VDEV_TYPE_STA && !sta->tdls)
+		return 0;
+
+	if (ar->num_stations >= ar->max_num_stations)
+		return -ENOBUFS;
+
+	ar->num_stations++;
+
+	return 0;
+}
+
+static void ath11k_mac_dec_num_stations(struct ath11k_vif *arvif,
+					struct ieee80211_sta *sta)
+{
+	struct ath11k *ar = arvif->ar;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (arvif->vdev_type == WMI_VDEV_TYPE_STA && !sta->tdls)
+		return;
+
+	ar->num_stations--;
+}
+
 static int ath11k_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
@@ -2555,6 +2587,13 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 		arsta->arvif = arvif;
 		INIT_WORK(&arsta->update_wk, ath11k_sta_rc_update_wk);
 
+		ret = ath11k_mac_inc_num_stations(arvif, sta);
+		if (ret) {
+			ath11k_warn(ar->ab, "refusing to associate station: too many connected already (%d)\n",
+				    ar->max_num_stations);
+			goto exit;
+		}
+
 		if (ath11k_debug_is_extd_rx_stats_enabled(ar)) {
 			arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats),
 						  GFP_KERNEL);
@@ -2571,6 +2610,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 		if (ret) {
 			ath11k_warn(ar->ab, "Failed to add peer: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
+			ath11k_mac_dec_num_stations(arvif, sta);
 			goto exit;
 		}
 
@@ -2600,6 +2640,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "failed to setup dp for peer %pM on vdev %i (%d)\n",
 				    sta->addr, arvif->vdev_id, ret);
 			ath11k_peer_delete(ar, arvif->vdev_id, sta->addr);
+			ath11k_mac_dec_num_stations(arvif, sta);
 		}
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
@@ -2614,6 +2655,8 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 				    "Removed peer: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
 
+		ath11k_mac_dec_num_stations(arvif, sta);
+
 		if (ath11k_debug_is_extd_tx_stats_enabled(ar))
 			kfree(arsta->tx_stats);
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
