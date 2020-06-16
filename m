Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9c-0002u8-6j
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 09/12] ath11k: remove useless info messages
Date: Tue, 16 Jun 2020 17:00:52 +0300
Message-Id: <1592316055-24958-10-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

ath11k should not be spamming these to the logs. If these are important they
should be debug messages, but I just remove them for now.

Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c      | 8 --------
 drivers/net/wireless/ath/ath11k/peer.c     | 3 ---
 drivers/net/wireless/ath/ath11k/qmi.c      | 1 -
 drivers/net/wireless/ath/ath11k/spectral.c | 8 ++------
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cdedb2ea7d87..0fd1f714429c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3039,10 +3039,6 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "Failed to associate station: %pM\n",
 				    sta->addr);
-		else
-			ath11k_info(ar->ab,
-				    "Station %pM moved to assoc state\n",
-				    sta->addr);
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH &&
 		   (vif->type == NL80211_IFTYPE_AP ||
@@ -3052,10 +3048,6 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "Failed to disassociate station: %pM\n",
 				    sta->addr);
-		else
-			ath11k_info(ar->ab,
-				    "Station %pM moved to disassociated state\n",
-				    sta->addr);
 	}
 
 	mutex_unlock(&ar->conf_mutex);
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 297172538620..61ad9300eafb 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -223,9 +223,6 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	peer = ath11k_peer_find_by_pdev_idx(ar->ab, ar->pdev_idx, param->peer_addr);
 	if (peer) {
 		spin_unlock_bh(&ar->ab->base_lock);
-		ath11k_info(ar->ab,
-			    "ignoring the peer %pM creation on same pdev idx %d\n",
-			    param->peer_addr, ar->pdev_idx);
 		return -EINVAL;
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d9ffdf84ccae..bbdbf1ed19dc 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1901,7 +1901,6 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 			goto out_qmi_bdf;
 		}
 	}
-	ath11k_info(ab, "qmi BDF downloaded\n");
 
 out_qmi_bdf:
 	iounmap(bdf_addr);
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 1c5d65bb411f..6cbe6f4e2864 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -954,10 +954,8 @@ int ath11k_spectral_init(struct ath11k_base *ab)
 	int i;
 
 	if (!test_bit(WMI_TLV_SERVICE_FREQINFO_IN_METADATA,
-		      ab->wmi_ab.svc_map)) {
-		ath11k_info(ab, "spectral not supported\n");
+		      ab->wmi_ab.svc_map))
 		return 0;
-	}
 
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
@@ -966,10 +964,8 @@ int ath11k_spectral_init(struct ath11k_base *ab)
 		ret = ath11k_dbring_get_cap(ar->ab, ar->pdev_idx,
 					    WMI_DIRECT_BUF_SPECTRAL,
 					    &db_cap);
-		if (ret) {
-			ath11k_info(ab, "spectral not enabled for pdev %d\n", i);
+		if (ret)
 			continue;
-		}
 
 		idr_init(&sp->rx_ring.bufs_idr);
 		spin_lock_init(&sp->rx_ring.idr_lock);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
