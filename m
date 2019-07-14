Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmfDa-0002JH-LO
 for ath11k@lists.infradead.org; Sun, 14 Jul 2019 14:11:12 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: add tx hw 802.11 encapusaltion offloading support
Date: Sun, 14 Jul 2019 16:10:55 +0200
Message-Id: <20190714141055.2469-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This patch adds support for ethernet rxtx mode to the driver. The feature
is enabled via a new module parameter. If enabled to driver will enable
the feature on a per vif basis if all other requirements were met.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
This patch depends on https://patchwork.kernel.org/patch/11003671/

 drivers/net/wireless/ath/ath11k/core.h  |  5 +++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 19 ++++++++---
 drivers/net/wireless/ath/ath11k/mac.c   | 42 ++++++++++++++++++++-----
 3 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7a0f306f2a9e..abf7ff016b6f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -54,9 +54,14 @@ static inline enum wme_ac ath11k_tid_to_ac(u32 tid)
 		WME_AC_VO);
 }
 
+enum ath11k_skb_flags {
+	ATH11K_SKB_HW_80211_ENCAP = BIT(0),
+};
+
 struct ath11k_skb_cb {
 	dma_addr_t paddr;
 	u8 eid;
+	u8 flags;
 	struct ath11k *ar;
 	struct ieee80211_vif *vif;
 } __packed;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8c5db3c88a87..80b0fd380d81 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -16,7 +16,11 @@ ath11k_txq_tcl_ring_map[ATH11K_HW_MAX_QUEUES] = { 0x0, 0x1, 0x2, 0x2 };
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
-	/* TODO: Determine encap type based on vif_type and configuration */
+	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(skb);
+
+	if (tx_info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)
+		return HAL_TCL_ENCAP_TYPE_ETHERNET;
+
 	return HAL_TCL_ENCAP_TYPE_NATIVE_WIFI;
 }
 
@@ -40,8 +44,11 @@ static void ath11k_dp_tx_encap_nwifi(struct sk_buff *skb)
 static u8 ath11k_dp_tx_get_tid(struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (void *)skb->data;
+	struct ath11k_skb_cb *cb = ATH11K_SKB_CB(skb);
 
-	if (!ieee80211_is_data_qos(hdr->frame_control))
+	if (cb->flags & ATH11K_SKB_HW_80211_ENCAP)
+		return skb->priority % IEEE80211_QOS_CTL_TID_MASK;
+	else if (!ieee80211_is_data_qos(hdr->frame_control))
 		return HAL_DESC_REO_NON_QOS_TID;
 	else
 		return skb->priority & IEEE80211_QOS_CTL_TID_MASK;
@@ -89,7 +96,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
 
-	if (!ieee80211_is_data(hdr->frame_control))
+	if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) &&
+	    !ieee80211_is_data(hdr->frame_control))
 		return -ENOTSUPP;
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
@@ -142,12 +150,14 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
 		ath11k_dp_tx_encap_nwifi(skb);
 		break;
+	case HAL_TCL_ENCAP_TYPE_ETHERNET:
+		/* no need to encap */
+		break;
 	case HAL_TCL_ENCAP_TYPE_RAW:
 		/*  TODO: for CHECKSUM_PARTIAL case in raw mode, HW checksum offload
 		 *	  is not applicable, hence manual checksum calculation using
 		 *	  skb_checksum_help() is needed
 		 */
-	case HAL_TCL_ENCAP_TYPE_ETHERNET:
 	case HAL_TCL_ENCAP_TYPE_802_3:
 		/* TODO: Take care of other encap modes as well */
 		ret = -EINVAL;
@@ -433,6 +443,7 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	status.info = info;
 	status.rate = &arsta->last_txrate;
 	rcu_read_unlock();
+
 	ieee80211_tx_status_ext(ar->hw, &status);
 	spin_unlock_bh(&ab->data_lock);
 	return;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8cdc08f42cc6..e4fdbf490974 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -33,6 +33,10 @@
 	.max_power              = 30, \
 }
 
+static unsigned int ath11k_ethernet_mode;
+module_param_named(ethernet_mode, ath11k_ethernet_mode, uint, 0644);
+MODULE_PARM_DESC(ethernet_mode, "Use ethernet frame datapath");
+
 static const struct ieee80211_channel ath11k_2ghz_channels[] = {
 	CHAN2G(1, 2412, 0),
 	CHAN2G(2, 2417, 0),
@@ -3409,6 +3413,7 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_tx_info *info;
 	dma_addr_t paddr;
 	int buf_id;
 	int ret;
@@ -3420,11 +3425,14 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (buf_id < 0)
 		return -ENOSPC;
 
-	if ((ieee80211_is_action(hdr->frame_control) ||
-	     ieee80211_is_deauth(hdr->frame_control) ||
-	     ieee80211_is_disassoc(hdr->frame_control)) &&
-	     ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(skb, IEEE80211_CCMP_MIC_LEN);
+	info = IEEE80211_SKB_CB(skb);
+	if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)) {
+		if ((ieee80211_is_action(hdr->frame_control) ||
+		     ieee80211_is_deauth(hdr->frame_control) ||
+		     ieee80211_is_disassoc(hdr->frame_control)) &&
+		     ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(skb, IEEE80211_CCMP_MIC_LEN);
+		}
 	}
 
 	paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
@@ -3506,6 +3514,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 			     struct ieee80211_tx_control *control,
 			     struct sk_buff *skb)
 {
+	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
 	struct ath11k *ar = hw->priv;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
@@ -3513,7 +3522,10 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	int ret;
 
-	if (ieee80211_is_mgmt(hdr->frame_control)) {
+	skb_cb->flags = 0;
+	if (info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) {
+		skb_cb->flags = ATH11K_SKB_HW_80211_ENCAP;
+	} else if (ieee80211_is_mgmt(hdr->frame_control)) {
 		ret = ath11k_mac_mgmt_tx(ar, skb);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to queue management frame %d\n",
@@ -3785,6 +3797,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	struct vdev_create_params vdev_param = {0};
 	struct peer_create_params peer_param;
 	u32 param_id, param_value;
+	int hw_encap = 0;
 	u16 nss;
 	int i;
 	int ret;
@@ -3876,7 +3889,20 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 	param_id = WMI_VDEV_PARAM_TX_ENCAP_TYPE;
-	param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
+	switch (vif->type) {
+	case NL80211_IFTYPE_STATION:
+	case NL80211_IFTYPE_AP_VLAN:
+	case NL80211_IFTYPE_AP:
+		hw_encap = 1;
+		break;
+	default:
+		break;
+	}
+
+	if (ieee80211_set_hw_80211_encap(vif, ath11k_ethernet_mode & hw_encap))
+		param_value = ATH11K_HW_TXRX_ETHERNET;
+	else
+		param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
 	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 					    param_id, param_value);
 	if (ret) {
@@ -5421,6 +5447,8 @@ static int ath11k_mac_register(struct ath11k *ar)
 		ieee80211_hw_set(ar->hw, SUPPORTS_REORDERING_BUFFER);
 		ieee80211_hw_set(ar->hw, SUPPORTS_AMSDU_IN_AMPDU);
 	}
+	if (ath11k_ethernet_mode)
+		ieee80211_hw_set(ar->hw, SUPPORTS_80211_ENCAP);
 
 	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
 	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
