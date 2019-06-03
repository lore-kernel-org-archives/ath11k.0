Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlIH-0003lU-8k
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 11:38:26 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Remove probe response offload template setup
Date: Mon,  3 Jun 2019 17:08:10 +0530
Message-Id: <1559561890-27984-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Probe response offload support is not supported by
IPQ8074 firmware. Hence do not advertise or set probe
response template to the firmware.

This would avoid the below error during template setup.
'failed to update prb tmpl -1'

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 40 ------------------------
 drivers/net/wireless/ath/ath11k/wmi.c | 58 -----------------------------------
 drivers/net/wireless/ath/ath11k/wmi.h |  8 -----
 3 files changed, 106 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 87a420e..9cb8ea3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -828,34 +828,6 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	return ret;
 }
 
-static int ath11k_mac_setup_prb_tmpl(struct ath11k_vif *arvif)
-{
-	struct ath11k *ar = arvif->ar;
-	struct ieee80211_hw *hw = ar->hw;
-	struct ieee80211_vif *vif = arvif->vif;
-	struct sk_buff *prb;
-	int ret;
-
-	/* Interface validation is part of the below function, need not
-	 * check here.
-	 */
-	prb = ieee80211_proberesp_get(hw, vif);
-	if (!prb) {
-		ath11k_warn(ar->ab, "failed to get probe resp template from mac80211\n");
-		return -EPERM;
-	}
-
-	ret = ath11k_wmi_prb_tmpl(ar, arvif->vdev_id, prb);
-	kfree_skb(prb);
-
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to submit probe resp template command: %d\n",
-			    ret);
-	}
-
-	return ret;
-}
-
 static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
@@ -1697,13 +1669,6 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 				    ret);
 	}
 
-	if (changed & BSS_CHANGED_AP_PROBE_RESP) {
-		ret = ath11k_mac_setup_prb_tmpl(arvif);
-		if (ret)
-			ath11k_warn(ar->ab, "failed to setup probe resp template on vdev %i: %d\n",
-				    arvif->vdev_id, ret);
-	}
-
 	if (changed & (BSS_CHANGED_BEACON_INFO | BSS_CHANGED_BEACON)) {
 		arvif->dtim_period = info->dtim_period;
 
@@ -4120,11 +4085,6 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
-		ret = ath11k_mac_setup_prb_tmpl(arvif);
-		if (ret)
-			ath11k_warn(ar->ab, "failed to update prb tmpl: %d\n",
-				    ret);
-
 		ret = ath11k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
 		if (ret) {
 			ath11k_warn(ab, "failed to restart vdev %d: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3ac1e1c..25a45af 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1514,64 +1514,6 @@ int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
-int ath11k_wmi_prb_tmpl(struct ath11k *ar, u32 vdev_id,
-			struct sk_buff *prb)
-{
-	struct ath11k_pdev_wmi *wmi = ar->wmi;
-	struct wmi_prb_tmpl_cmd *cmd;
-	struct wmi_bcn_prb_info *bcn_prb_info;
-	struct wmi_tlv *tlv;
-	struct sk_buff *skb;
-	void *ptr;
-	int len, ret;
-	size_t aligned_len = roundup(prb->len, 4);
-
-	len = sizeof(*cmd) + sizeof(*bcn_prb_info) + TLV_HDR_SIZE + aligned_len;
-	if (len > WMI_BEACON_TX_BUFFER_SIZE) {
-		ath11k_warn(ar->ab, "Can't send wmi cmd\n");
-		return -EINVAL;
-	}
-
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (struct wmi_prb_tmpl_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PRB_TMPL_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->buf_len = prb->len;
-
-	ptr = (void *)skb->data + sizeof(*cmd);
-	len = sizeof(*bcn_prb_info);
-
-	bcn_prb_info = (struct wmi_bcn_prb_info *)ptr;
-	bcn_prb_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					      WMI_TAG_BCN_PRB_INFO) |
-				   FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	bcn_prb_info->caps = 0;
-	bcn_prb_info->erp = 0;
-
-	ptr += sizeof(*bcn_prb_info);
-
-	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, aligned_len);
-
-	memcpy(tlv->value, prb->data, prb->len);
-
-	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
-		   "WMI prb tmpl vdev id %d len %d\n", vdev_id, prb->len);
-
-	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PRB_TMPL_CMDID);
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to send WMI_PRB_TMPL_CMDID\n");
-		dev_kfree_skb(skb);
-	}
-
-	return ret;
-}
-
 int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 				struct wmi_vdev_install_key_arg *arg)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0d36c8a..fdaf63b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3792,12 +3792,6 @@ struct wmi_bcn_tmpl_cmd {
 	u32 esp_ie_offset;
 } __packed;
 
-struct wmi_prb_tmpl_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 buf_len;
-} __packed;
-
 struct wmi_key_seq_counter {
 	u32 key_seq_counter_l;
 	u32 key_seq_counter_h;
@@ -5143,8 +5137,6 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn);
-int ath11k_wmi_prb_tmpl(struct ath11k *ar, u32 vdev_id,
-			struct sk_buff *prb);
 int ath11k_wmi_vdev_down(struct ath11k *ar, u8 vdev_id);
 int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid,
 		       const u8 *bssid);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
