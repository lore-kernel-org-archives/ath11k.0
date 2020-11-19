Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kflWx-0001gF-Ma
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 15:07:28 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 1/2] ath11k: Don't cast ath11k_skb_cb to
 ieee80211_tx_info.control
Date: Thu, 19 Nov 2020 16:06:13 +0100
Message-Id: <20201119150614.216644-1-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <sven@narfation.org>

The driver_data area of ieee80211_tx_info is used in ath11k for
ath11k_skb_cb. The first function in the TX patch which rewrites it to
ath11k_skb_cb is already ath11k_mac_op_tx. No one else in the code path
must use it for something else before it reinitializes it. Otherwise the
data has to be considered uninitialized or corrupt.

But the ieee80211_tx_info.control shares exactly the same area as
ieee80211_tx_info.driver_data and ath11k is still using it. This results in
best case in a

  ath11k c000000.wifi1: no vif found for mgmt frame, flags 0x0

or (slightly worse) in a kernel oops.

Instead, the interesting data must be moved first into the ath11k_skb_cb
and ieee80211_tx_info.control must then not be used anymore.

Tested-on: IPQ8074 hw2.0 WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f8dd47d2333..0296ba925455 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3977,21 +3977,20 @@ static void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 {
 	struct ath11k *ar = container_of(work, struct ath11k, wmi_mgmt_tx_work);
-	struct ieee80211_tx_info *info;
+	struct ath11k_skb_cb *skb_cb;
 	struct ath11k_vif *arvif;
 	struct sk_buff *skb;
 	int ret;
 
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL) {
-		info = IEEE80211_SKB_CB(skb);
-		if (!info->control.vif) {
-			ath11k_warn(ar->ab, "no vif found for mgmt frame, flags 0x%x\n",
-				    info->control.flags);
+		skb_cb = ATH11K_SKB_CB(skb);
+		if (!skb_cb->vif) {
+			ath11k_warn(ar->ab, "no vif found for mgmt frame\n");
 			ieee80211_free_txskb(ar->hw, skb);
 			continue;
 		}
 
-		arvif = ath11k_vif_to_arvif(info->control.vif);
+		arvif = ath11k_vif_to_arvif(skb_cb->vif);
 		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id) &&
 		    arvif->is_started) {
 			ret = ath11k_mac_mgmt_tx_wmi(ar, arvif, skb);
@@ -4004,8 +4003,8 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 			}
 		} else {
 			ath11k_warn(ar->ab,
-				    "dropping mgmt frame for vdev %d, flags 0x%x is_started %d\n",
-				    arvif->vdev_id, info->control.flags,
+				    "dropping mgmt frame for vdev %d, is_started %d\n",
+				    arvif->vdev_id,
 				    arvif->is_started);
 			ieee80211_free_txskb(ar->hw, skb);
 		}
@@ -4053,10 +4052,13 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	u32 info_flags = info->flags;
 	bool is_prb_rsp;
 	int ret;
 
-	if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
+	skb_cb->vif = vif;
+
+	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
 		skb_cb->flags |= ATH11K_SKB_HW_80211_ENCAP;
 	} else if (ieee80211_is_mgmt(hdr->frame_control)) {
 		is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
