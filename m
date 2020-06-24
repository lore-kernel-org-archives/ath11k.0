Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo0Nb-0001M5-1R
 for ath11k@lists.infradead.org; Wed, 24 Jun 2020 08:03:36 +0000
From: John Crispin <john@phrozen.org>
Subject: [RESEND 1/2] ath11k: add WMI calls to manually add/del/pause/resume
Date: Wed, 24 Jun 2020 10:03:20 +0200
Message-Id: <20200624080321.2271943-1-john@phrozen.org>
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
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

These calls are used for debugging and will be required for WFA
certification tests.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 210 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 114 ++++++++++++++
 2 files changed, 324 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8e3437a65673..ecdcdec7d9b0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -122,6 +122,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		= { .min_len = sizeof(struct wmi_stats_event) },
 	[WMI_TAG_PDEV_CTL_FAILSAFE_CHECK_EVENT]
 		= { .min_len = sizeof(struct wmi_pdev_ctl_failsafe_chk_event) },
+	[WMI_TAG_TWT_ADD_DIALOG_COMPLETE_EVENT]
+		= { .min_len = sizeof(struct wmi_twt_add_dialog_event) },
 };
 
 #define PRIMAP(_hw_mode_) \
@@ -2945,6 +2947,177 @@ ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
 	return ret;
 }
 
+int
+ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
+				   struct wmi_twt_add_dialog_params *params)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_twt_add_dialog_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_twt_add_dialog_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_TWT_ADD_DIALOG_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+
+	cmd->vdev_id = params->vdev_id;
+	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
+	cmd->dialog_id = params->dialog_id;
+	cmd->wake_intvl_us = params->wake_intvl_us;
+	cmd->wake_intvl_mantis = params->wake_intvl_mantis;
+	cmd->wake_dura_us = params->wake_dura_us;
+	cmd->sp_offset_us = params->sp_offset_us;
+	cmd->flags = params->twt_cmd;
+	if (params->flag_bcast)
+		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_BCAST;
+	if (params->flag_trigger)
+		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_TRIGGER;
+	if (params->flag_flow_type)
+		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_FLOW_TYPE;
+	if (params->flag_protection)
+		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_PROTECTION;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_twt_add_dialog id %d dialog id %d wake_intvl_us %d"
+		   " wake_intvl_mantis %d wake_dura_us %d sp_offset_us %d "
+		   "flags %x\n",
+		   cmd->vdev_id, cmd->dialog_id, cmd->wake_intvl_us,
+		   cmd->wake_intvl_mantis, cmd->wake_dura_us, cmd->sp_offset_us,
+		   cmd->flags);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_ADD_DIALOG_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_ADD_DIALOG_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
+int
+ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
+				   struct wmi_twt_del_dialog_params *params)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_twt_del_dialog_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_twt_del_dialog_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_TWT_DEL_DIALOG_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+
+	cmd->vdev_id = params->vdev_id;
+	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
+	cmd->dialog_id = params->dialog_id;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_twt_del_dialog id %d dialog id %d\n",
+		   cmd->vdev_id, cmd->dialog_id);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_DEL_DIALOG_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_DEL_DIALOG_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
+int
+ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
+				     struct wmi_twt_pause_dialog_params *params)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_twt_pause_dialog_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_twt_pause_dialog_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_TWT_PAUSE_DIALOG_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+
+	cmd->vdev_id = params->vdev_id;
+	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
+	cmd->dialog_id = params->dialog_id;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_twt_pause_dialog id %d dialog id %d\n",
+		   cmd->vdev_id, cmd->dialog_id);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_PAUSE_DIALOG_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_PAUSE_DIALOG_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
+int
+ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
+				      struct wmi_twt_resume_dialog_params *params)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_twt_resume_dialog_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_twt_resume_dialog_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_TWT_RESUME_DIALOG_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+
+	cmd->vdev_id = params->vdev_id;
+	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
+	cmd->dialog_id = params->dialog_id;
+	cmd->sp_offset_us = params->sp_offset_us;
+	cmd->next_twt_size = params->next_twt_size;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_twt_resume_dialog id %d dialog id %d sp_offset_us %d next_twt_size %d\n",
+		   cmd->vdev_id, cmd->dialog_id, cmd->sp_offset_us, cmd->next_twt_size);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_RESUME_DIALOG_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_RESUME_DIALOG_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
 int
 ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 			     struct ieee80211_he_obss_pd *he_obss_pd)
@@ -6437,6 +6610,37 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 	ath11k_thermal_event_temperature(ar, ev.temp);
 }
 
+static void ath11k_wmi_twt_add_dialog_event(struct ath11k_base *ab, struct sk_buff *skb)
+{
+	static const char * const status[] = {
+		"OK", "TWT_NOT_ENABLED", "USED_DIALOG_ID", "INVALID_PARAM",
+		"NOT_READY", "NO_RESOURCE", "NO_ACK", "NO_RESPONSE",
+		"DENIED", "UNKNOWN_ERROR"
+	};
+	const void **tb;
+	const struct wmi_twt_add_dialog_event *ev;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_TWT_ADD_DIALOG_COMPLETE_EVENT];
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch twt add dialog ev");
+		goto exit;
+	}
+
+	ath11k_info(ab, "TWT Add Dialog Event - Status: %s, DialogId: %d, VdevId: %d\n",
+		    status[ev->status], ev->vdev_id, ev->dialog_id);
+
+exit:
+	kfree(tb);
+}
+
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -6523,6 +6727,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_PDEV_DMA_RING_BUF_RELEASE_EVENTID:
 		ath11k_wmi_pdev_dma_ring_buf_release_event(ab, skb);
 		break;
+	case WMI_TWT_ADD_DIALOG_EVENTID:
+		ath11k_wmi_twt_add_dialog_event(ab, skb);
+		break;
 	/* add Unsupported events here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_VDEV_DELETE_RESP_EVENTID:
@@ -6530,6 +6737,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_TWT_ENABLE_EVENTID:
 	case WMI_TWT_DISABLE_EVENTID:
 	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
+	case WMI_TWT_DEL_DIALOG_EVENTID:
+	case WMI_TWT_PAUSE_DIALOG_EVENTID:
+	case WMI_TWT_RESUME_DIALOG_EVENTID:
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 5a32ba0eb4f5..add82253ce87 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4752,6 +4752,112 @@ struct wmi_twt_disable_params_cmd {
 	u32 pdev_id;
 } __packed;
 
+enum WMI_HOST_TWT_COMMAND {
+	WMI_HOST_TWT_COMMAND_REQUEST_TWT = 0,
+	WMI_HOST_TWT_COMMAND_SUGGEST_TWT,
+	WMI_HOST_TWT_COMMAND_DEMAND_TWT,
+	WMI_HOST_TWT_COMMAND_TWT_GROUPING,
+	WMI_HOST_TWT_COMMAND_ACCEPT_TWT,
+	WMI_HOST_TWT_COMMAND_ALTERNATE_TWT,
+	WMI_HOST_TWT_COMMAND_DICTATE_TWT,
+	WMI_HOST_TWT_COMMAND_REJECT_TWT,
+};
+
+#define WMI_TWT_ADD_DIALOG_FLAG_BCAST		BIT(8)
+#define WMI_TWT_ADD_DIALOG_FLAG_TRIGGER		BIT(9)
+#define WMI_TWT_ADD_DIALOG_FLAG_FLOW_TYPE	BIT(10)
+#define WMI_TWT_ADD_DIALOG_FLAG_PROTECTION	BIT(11)
+
+struct wmi_twt_add_dialog_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 dialog_id;
+	u32 wake_intvl_us;
+	u32 wake_intvl_mantis;
+	u32 wake_dura_us;
+	u32 sp_offset_us;
+	u32 flags;
+} __packed;
+
+struct wmi_twt_add_dialog_params {
+	u32 vdev_id;
+	u8 peer_macaddr[ETH_ALEN];
+	u32 dialog_id;
+	u32 wake_intvl_us;
+	u32 wake_intvl_mantis;
+	u32 wake_dura_us;
+	u32 sp_offset_us;
+	u8 twt_cmd;
+	u8 flag_bcast;
+	u8 flag_trigger;
+	u8 flag_flow_type;
+	u8 flag_protection;
+} __packed;
+
+enum  wmi_twt_add_dialog_status {
+	WMI_ADD_TWT_STATUS_OK,
+	WMI_ADD_TWT_STATUS_TWT_NOT_ENABLED,
+	WMI_ADD_TWT_STATUS_USED_DIALOG_ID,
+	WMI_ADD_TWT_STATUS_INVALID_PARAM,
+	WMI_ADD_TWT_STATUS_NOT_READY,
+	WMI_ADD_TWT_STATUS_NO_RESOURCE,
+	WMI_ADD_TWT_STATUS_NO_ACK,
+	WMI_ADD_TWT_STATUS_NO_RESPONSE,
+	WMI_ADD_TWT_STATUS_DENIED,
+	WMI_ADD_TWT_STATUS_UNKNOWN_ERROR,
+};
+
+struct wmi_twt_add_dialog_event {
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 dialog_id;
+	u32 status;
+} __packed;
+
+struct wmi_twt_del_dialog_params {
+	u32 vdev_id;
+	u8 peer_macaddr[ETH_ALEN];
+	u32 dialog_id;
+} __packed;
+
+struct wmi_twt_del_dialog_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 dialog_id;
+} __packed;
+
+struct wmi_twt_pause_dialog_params {
+	u32 vdev_id;
+	u8 peer_macaddr[ETH_ALEN];
+	u32 dialog_id;
+} __packed;
+
+struct wmi_twt_pause_dialog_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 dialog_id;
+} __packed;
+
+struct wmi_twt_resume_dialog_params {
+	u32 vdev_id;
+	u8 peer_macaddr[ETH_ALEN];
+	u32 dialog_id;
+	u32 sp_offset_us;
+	u32 next_twt_size;
+} __packed;
+
+struct wmi_twt_resume_dialog_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 dialog_id;
+	u32 sp_offset_us;
+	u32 next_twt_size;
+} __packed;
+
 struct wmi_obss_spatial_reuse_params_cmd {
 	u32 tlv_header;
 	u32 pdev_id;
@@ -5107,6 +5213,14 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 int ath11k_wmi_simulate_radar(struct ath11k *ar);
 int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id);
+int ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
+				       struct wmi_twt_add_dialog_params *params);
+int ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
+				       struct wmi_twt_del_dialog_params *params);
+int ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
+					 struct wmi_twt_pause_dialog_params *params);
+int ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
+					  struct wmi_twt_resume_dialog_params *params);
 int ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 				 struct ieee80211_he_obss_pd *he_obss_pd);
 int ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
