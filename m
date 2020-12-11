Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knaks-0004H7-9G
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 05:14:11 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH] ath11k: start vdev if a bss peer is already created
Date: Fri, 11 Dec 2020 00:13:58 -0500
Message-Id: <20201211051358.9191-1-cjhuang@codeaurora.org>
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

For QCA6390, bss peer must be created before vdev is to start. This
change is to start vdev if a bss peer is created. Otherwise, ath11k
delays to start vdev.

This fixes an issue in a case where HT/VHT/HE settings change between
authentication and association, e.g., due to the user space request
to disable HT.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c  |  8 ++++++--
 drivers/net/wireless/ath/ath11k/peer.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/peer.h |  2 ++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c3072b5005f8..0c27cd7929a7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2986,6 +2986,7 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 	}
 
 	if (ab->hw_params.vdev_start_delay &&
+	    !arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_start_vdev_delay(ar->hw, vif);
 		if (ret) {
@@ -5255,7 +5256,8 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	/* for QCA6390 bss peer must be created before vdev_start */
 	if (ab->hw_params.vdev_start_delay &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
-	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
+	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
+	    !ath11k_peer_find_by_vdev_id(ab, arvif->vdev_id)) {
 		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
 		mutex_unlock(&ar->conf_mutex);
 		return 0;
@@ -5266,7 +5268,9 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		return -EBUSY;
 	}
 
-	if (ab->hw_params.vdev_start_delay) {
+	if (ab->hw_params.vdev_start_delay &&
+	    (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
+	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)) {
 		param.vdev_id = arvif->vdev_id;
 		param.peer_type = WMI_PEER_TYPE_DEFAULT;
 		param.peer_addr = ar->mac_addr;
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 1866d82678fa..b69e7ebfa930 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -76,6 +76,23 @@ struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
 	return NULL;
 }
 
+struct ath11k_peer *ath11k_peer_find_by_vdev_id(struct ath11k_base *ab,
+						int vdev_id)
+{
+	struct ath11k_peer *peer;
+
+	spin_lock_bh(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (vdev_id == peer->vdev_id) {
+			spin_unlock_bh(&ab->base_lock);
+			return peer;
+		}
+	}
+	spin_unlock_bh(&ab->base_lock);
+	return NULL;
+}
+
 void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
 {
 	struct ath11k_peer *peer;
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index bba2e00b6944..8553ed061aea 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -43,5 +43,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		       struct ieee80211_sta *sta, struct peer_create_params *param);
 int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
 				     const u8 *addr);
+struct ath11k_peer *ath11k_peer_find_by_vdev_id(struct ath11k_base *ab,
+						int vdev_id);
 
 #endif /* _PEER_H_ */
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
