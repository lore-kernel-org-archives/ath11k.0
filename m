Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RKx-0006ik-0m
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 09:12:26 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/4] ath11k: add TWT support
Date: Wed,  4 Sep 2019 11:12:09 +0200
Message-Id: <20190904091211.26868-3-john@phrozen.org>
In-Reply-To: <20190904091211.26868-1-john@phrozen.org>
References: <20190904091211.26868-1-john@phrozen.org>
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

Add target wait time wmi calls to the driver. En/disable the support
from when the bss_config changes. We ignore the cmd completion events.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++
 drivers/net/wireless/ath/ath11k/wmi.c | 91 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 71 +++++++++++++++++++++
 3 files changed, 174 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8abbff35ee21..d036c50bb43f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1188,6 +1188,11 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		}
 	}
 
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
+		arg->twt_responder = true;
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
+		arg->twt_requester = true;
+
 	switch (sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
 		if (he_cap->he_cap_elem.phy_cap_info[0] &
@@ -1897,6 +1902,13 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	    !ath11k_mac_vif_chan(arvif->vif, &def))
 		ath11k_recalculate_mgmt_rate(ar, vif, &def);
 
+	if (changed & BSS_CHANGED_TWT) {
+		if (info->twt_requester || info->twt_responder)
+			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev_idx);
+		else
+			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev_idx);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b721e5142f6c..019d2f45e51d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1622,6 +1622,10 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 			cmd->peer_flags |= WMI_PEER_VHT;
 		if (param->he_flag)
 			cmd->peer_flags |= WMI_PEER_HE;
+		if (param->twt_requester)
+			cmd->peer_flags |= WMI_PEER_TWT_REQ;
+		if (param->twt_responder)
+			cmd->peer_flags |= WMI_PEER_TWT_RESP;
 	}
 
 	/* Suppress authorization for all AUTH modes that need 4-way handshake
@@ -2457,6 +2461,86 @@ int ath11k_wmi_pdev_pktlog_disable(struct ath11k *ar)
 	return ret;
 }
 
+int
+ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_sc->ab;
+	struct wmi_twt_enable_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (void *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ENABLE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = pdev_id;
+	cmd->sta_cong_timer_ms = ATH11K_TWT_DEF_STA_CONG_TIMER_MS;
+	cmd->default_slot_size = ATH11K_TWT_DEF_DEFAULT_SLOT_SIZE;
+	cmd->congestion_thresh_setup = ATH11K_TWT_DEF_CONGESTION_THRESH_SETUP;
+	cmd->congestion_thresh_teardown =
+		ATH11K_TWT_DEF_CONGESTION_THRESH_TEARDOWN;
+	cmd->congestion_thresh_critical =
+		ATH11K_TWT_DEF_CONGESTION_THRESH_CRITICAL;
+	cmd->interference_thresh_teardown =
+		ATH11K_TWT_DEF_INTERFERENCE_THRESH_TEARDOWN;
+	cmd->interference_thresh_setup =
+		ATH11K_TWT_DEF_INTERFERENCE_THRESH_SETUP;
+	cmd->min_no_sta_setup = ATH11K_TWT_DEF_MIN_NO_STA_SETUP;
+	cmd->min_no_sta_teardown = ATH11K_TWT_DEF_MIN_NO_STA_TEARDOWN;
+	cmd->no_of_bcast_mcast_slots = ATH11K_TWT_DEF_NO_OF_BCAST_MCAST_SLOTS;
+	cmd->min_no_twt_slots = ATH11K_TWT_DEF_MIN_NO_TWT_SLOTS;
+	cmd->max_no_sta_twt = ATH11K_TWT_DEF_MAX_NO_STA_TWT;
+	cmd->mode_check_interval = ATH11K_TWT_DEF_MODE_CHECK_INTERVAL;
+	cmd->add_sta_slot_interval = ATH11K_TWT_DEF_ADD_STA_SLOT_INTERVAL;
+	cmd->remove_sta_slot_interval =
+		ATH11K_TWT_DEF_REMOVE_STA_SLOT_INTERVAL;
+	/* TODO add MBSSID support */
+	cmd->mbss_support = 0;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_ENABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_ENABLE_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
+int
+ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_sc->ab;
+	struct wmi_twt_disable_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (void *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_DISABLE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = pdev_id;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_TWT_DISABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_DIeABLE_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
 static void
 ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 			      struct wmi_host_pdev_band_to_mac *band_to_mac)
@@ -2548,6 +2632,9 @@ ath11k_wmi_copy_resource_config(struct wmi_resource_config *wmi_cfg,
 	wmi_cfg->use_pdev_id = tg_cfg->use_pdev_id;
 	wmi_cfg->flag1 = tg_cfg->atf_config;
 	wmi_cfg->peer_map_unmap_v2_support = tg_cfg->peer_map_unmap_v2_support;
+	wmi_cfg->sched_params = tg_cfg->sched_params;
+	wmi_cfg->twt_ap_pdev_count = tg_cfg->twt_ap_pdev_count;
+	wmi_cfg->twt_ap_sta_count = tg_cfg->twt_ap_sta_count;
 }
 
 static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
@@ -2739,6 +2826,8 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	config.beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
 	config.rx_batchmode = TARGET_RX_BATCHMODE;
 	config.peer_map_unmap_v2_support = 1;
+	config.twt_ap_pdev_count = 2;
+	config.twt_ap_sta_count = 1000;
 
 	memcpy(&wmi_sc->wlan_resource_config, &config, sizeof(config));
 
@@ -5421,6 +5510,8 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_VDEV_DELETE_RESP_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
+	case WMI_TWT_ENABLE_EVENTID:
+	case WMI_TWT_DISABLE_EVENTID:
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index c03cbe4a0f71..c880d10ff2e9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -169,6 +169,10 @@ enum wmi_cmd_group {
 	WMI_GRP_MONITOR,        /* 0x39 */
 	WMI_GRP_REGULATORY,     /* 0x3a */
 	WMI_GRP_HW_DATA_FILTER, /* 0x3b */
+	WMI_GRP_WLM,            /* 0x3c */
+	WMI_GRP_11K_OFFLOAD,    /* 0x3d */
+	WMI_GRP_TWT,            /* 0x3e */
+
 };
 
 #define WMI_CMD_GRP(grp_id) (((grp_id) << 12) | 0x1)
@@ -530,6 +534,12 @@ enum wmi_tlv_cmd_id {
 	WMI_NDP_RESPONDER_REQ_CMDID,
 	WMI_NDP_END_REQ_CMDID,
 	WMI_HW_DATA_FILTER_CMDID = WMI_TLV_CMD(WMI_GRP_HW_DATA_FILTER),
+	WMI_TWT_ENABLE_CMDID = WMI_TLV_CMD(WMI_GRP_TWT),
+	WMI_TWT_DISABLE_CMDID,
+	WMI_TWT_ADD_DIALOG_CMDID,
+	WMI_TWT_DEL_DIALOG_CMDID,
+	WMI_TWT_PAUSE_DIALOG_CMDID,
+	WMI_TWT_RESUME_DIALOG_CMDID,
 };
 
 enum wmi_tlv_event_id {
@@ -724,6 +734,13 @@ enum wmi_tlv_event_id {
 	WMI_NDP_INDICATION_EVENTID,
 	WMI_NDP_CONFIRM_EVENTID,
 	WMI_NDP_END_INDICATION_EVENTID,
+
+	WMI_TWT_ENABLE_EVENTID = WMI_TLV_CMD(WMI_GRP_TWT),
+	WMI_TWT_DISABLE_EVENTID,
+	WMI_TWT_ADD_DIALOG_EVENTID,
+	WMI_TWT_DEL_DIALOG_EVENTID,
+	WMI_TWT_PAUSE_DIALOG_EVENTID,
+	WMI_TWT_RESUME_DIALOG_EVENTID,
 };
 
 enum wmi_tlv_pdev_param {
@@ -2183,6 +2200,9 @@ struct wmi_resource_config {
 	u32 max_num_dbs_scan_duty_cycle;
 	u32 max_num_group_keys;
 	u32 peer_map_unmap_v2_support;
+	u32 sched_params;
+	u32 twt_ap_pdev_count;
+	u32 twt_ap_sta_count;
 } __packed;
 
 struct wmi_service_ready_event {
@@ -3401,6 +3421,8 @@ struct peer_assoc_params {
 	u32 peer_he_mcs_count;
 	u32 peer_he_rx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
 	u32 peer_he_tx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
+	bool twt_responder;
+	bool twt_requester;
 	struct ath11k_ppe_threshold peer_ppet;
 };
 
@@ -3652,6 +3674,8 @@ struct wmi_unit_test_cmd {
 #define WMI_PEER_DYN_MIMOPS	0x00020000
 #define WMI_PEER_STATIC_MIMOPS	0x00040000
 #define WMI_PEER_SPATIAL_MUX	0x00200000
+#define WMI_PEER_TWT_REQ	0x00400000
+#define WMI_PEER_TWT_RESP	0x00800000
 #define WMI_PEER_VHT		0x02000000
 #define WMI_PEER_80MHZ		0x04000000
 #define WMI_PEER_PMF		0x08000000
@@ -4494,6 +4518,48 @@ struct wmi_wmm_params_all_arg {
 	struct wmi_wmm_params_arg ac_vo;
 };
 
+#define ATH11K_TWT_DEF_STA_CONG_TIMER_MS		5000
+#define ATH11K_TWT_DEF_DEFAULT_SLOT_SIZE		10
+#define ATH11K_TWT_DEF_CONGESTION_THRESH_SETUP		50
+#define ATH11K_TWT_DEF_CONGESTION_THRESH_TEARDOWN	20
+#define ATH11K_TWT_DEF_CONGESTION_THRESH_CRITICAL	100
+#define ATH11K_TWT_DEF_INTERFERENCE_THRESH_TEARDOWN	80
+#define ATH11K_TWT_DEF_INTERFERENCE_THRESH_SETUP	50
+#define ATH11K_TWT_DEF_MIN_NO_STA_SETUP			10
+#define ATH11K_TWT_DEF_MIN_NO_STA_TEARDOWN		2
+#define ATH11K_TWT_DEF_NO_OF_BCAST_MCAST_SLOTS		2
+#define ATH11K_TWT_DEF_MIN_NO_TWT_SLOTS			2
+#define ATH11K_TWT_DEF_MAX_NO_STA_TWT			500
+#define ATH11K_TWT_DEF_MODE_CHECK_INTERVAL		10000
+#define ATH11K_TWT_DEF_ADD_STA_SLOT_INTERVAL		1000
+#define ATH11K_TWT_DEF_REMOVE_STA_SLOT_INTERVAL		5000
+
+struct wmi_twt_enable_params_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+	u32 sta_cong_timer_ms;
+	u32 mbss_support;
+	u32 default_slot_size;
+	u32 congestion_thresh_setup;
+	u32 congestion_thresh_teardown;
+	u32 congestion_thresh_critical;
+	u32 interference_thresh_teardown;
+	u32 interference_thresh_setup;
+	u32 min_no_sta_setup;
+	u32 min_no_sta_teardown;
+	u32 no_of_bcast_mcast_slots;
+	u32 min_no_twt_slots;
+	u32 max_no_sta_twt;
+	u32 mode_check_interval;
+	u32 add_sta_slot_interval;
+	u32 remove_sta_slot_interval;
+};
+
+struct wmi_twt_disable_params_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+};
+
 struct target_resource_config {
 	u32 num_vdevs;
 	u32 num_peers;
@@ -4553,6 +4619,9 @@ struct target_resource_config {
 	u32 max_bssid_rx_filters;
 	u32 use_pdev_id;
 	u32 peer_map_unmap_v2_support;
+	u32 sched_params;
+	u32 twt_ap_pdev_count;
+	u32 twt_ap_sta_count;
 };
 
 #define WMI_MAX_MEM_REQS 32
@@ -4676,4 +4745,6 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 			      struct ath11k_fw_stats *fw_stats, u32 stats_id,
 			      char *buf);
 int ath11k_wmi_simulate_radar(struct ath11k *ar);
+int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id);
+int ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id);
 #endif
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
