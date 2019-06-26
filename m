Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg6ik-0001bp-UM
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 12:08:17 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BBD660A05
 for <ath11k@lists.infradead.org>; Wed, 26 Jun 2019 12:08:12 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 4/4] ath11k/wmi: Clean up function parameter list in wmi event
 handlers
Date: Wed, 26 Jun 2019 17:37:40 +0530
Message-Id: <1561550860-2928-4-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1561550860-2928-1-git-send-email-vthiagar@codeaurora.org>
References: <1561550860-2928-1-git-send-email-vthiagar@codeaurora.org>
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

Instead of passing skb->data and skb->len to the wmi event handlers
pass skb itself and retrieve data and len from inside the handlers from
skb.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c |   4 +-
 drivers/net/wireless/ath/ath11k/debug.h |   7 +-
 drivers/net/wireless/ath/ath11k/wmi.c   | 212 +++++++++++++++-----------------
 drivers/net/wireless/ath/ath11k/wmi.h   |   2 +-
 4 files changed, 103 insertions(+), 122 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 6aa260c..76cbd22 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -166,7 +166,7 @@ static void ath11k_debug_fw_stats_reset(struct ath11k *ar)
 	spin_unlock_bh(&ar->data_lock);
 }
 
-void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+void ath11k_debug_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct ath11k_fw_stats stats = {};
 	struct ath11k *ar;
@@ -184,7 +184,7 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	INIT_LIST_HEAD(&stats.bcn);
 	INIT_LIST_HEAD(&stats.peers_extd);
 
-	ret = ath11k_wmi_pull_fw_stats(ab, evt_buf, len, &stats);
+	ret = ath11k_wmi_pull_fw_stats(ab, skb, &stats);
 	if (ret) {
 		ath11k_warn(ab, "failed to pull fw stats: %d\n", ret);
 		goto free;
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index d0c69c4..e73a4f7 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -136,8 +136,7 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 void ath11k_debug_unregister(struct ath11k *ar);
 void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 				      struct sk_buff *skb);
-void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf,
-				   u32 len);
+void ath11k_debug_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb);
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar);
 int ath11k_dbg_htt_stats_req(struct ath11k *ar);
@@ -191,8 +190,8 @@ static inline void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 {
 }
 
-static inline void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf,
-						 u32 len)
+static inline void ath11k_debug_fw_stats_process(struct ath11k_base *ab,
+						 struct sk_buff *skb)
 {
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 713f8b3..1de2299 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -258,9 +258,8 @@ static int ath11k_pull_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 				     const void *ptr,
 				     struct ath11k_service_ext_param *param)
 {
-	struct wmi_service_ready_ext_event *ev;
+	const struct wmi_service_ready_ext_event *ev = ptr;
 
-	ev = (struct wmi_service_ready_ext_event *)ptr;
 	if (!ev)
 		return -EINVAL;
 
@@ -408,7 +407,7 @@ static int ath11k_pull_service_ready_tlv(struct ath11k_base *ab,
 					 const void *evt_buf,
 					 struct ath11k_targ_cap *cap)
 {
-	struct wmi_service_ready_event *ev = (struct wmi_service_ready_event *)evt_buf;
+	const struct wmi_service_ready_event *ev = evt_buf;
 
 	if (!ev) {
 		ath11k_err(ab, "%s: failed by NULL param\n",
@@ -488,12 +487,12 @@ static int ath11k_wmi_tlv_svc_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len
 	return 0;
 }
 
-static int ath11k_service_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_tlv_svc_ready_parse svc_ready = { };
 	int ret;
 
-	ret = ath11k_wmi_tlv_iter(ab, evt_buf, len,
+	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_parse,
 				  &svc_ready);
 	if (ret) {
@@ -1360,7 +1359,7 @@ int ath11k_send_crash_inject_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	if (!skb)
 		return -ENOMEM;
 
-	cmd = (void *)skb->data;
+	cmd = (struct wmi_force_fw_hang_cmd *)skb->data;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_FORCE_FW_HANG_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
 
@@ -2324,7 +2323,7 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 	cmd->num_mac = 1;
 	cmd->enable = enable;
 
-	ptr = (void *)skb->data + sizeof(*cmd);
+	ptr = skb->data + sizeof(*cmd);
 
 	tlv = ptr;
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
@@ -3000,12 +2999,12 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 }
 
 static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
-					  u8 *evt_buf, u32 len)
+					  struct sk_buff *skb)
 {
 	struct wmi_tlv_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
 
-	ret = ath11k_wmi_tlv_iter(ab, evt_buf, len,
+	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_ext_parse,
 				  &svc_rdy_ext);
 	if (ret) {
@@ -3016,14 +3015,14 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 	return 0;
 }
 
-static int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+static int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, struct sk_buff *skb,
 					   struct wmi_vdev_start_resp_event *vdev_rsp)
 {
 	const void **tb;
 	const struct wmi_vdev_start_resp_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3091,9 +3090,8 @@ static int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, u8 *evt_buf,
 }
 
 static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
-					       u8 *evt_buf,
-					       struct cur_regulatory_info *reg_info,
-					       u32 len)
+					       struct sk_buff *skb,
+					       struct cur_regulatory_info *reg_info)
 {
 	const void **tb;
 	const struct wmi_reg_chan_list_cc_event *chan_list_event_hdr;
@@ -3103,7 +3101,7 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "processing regulatory channel list\n");
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3197,14 +3195,14 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 	return 0;
 }
 
-static int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+static int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, struct sk_buff *skb,
 					struct wmi_peer_delete_resp_event *peer_del_resp)
 {
 	const void **tb;
 	const struct wmi_peer_delete_resp_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3257,14 +3255,14 @@ static int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab, void *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, u8 *evt_buf,
-					      u32 len, u32 *vdev_id)
+static int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, struct sk_buff *skb,
+					      u32 *vdev_id)
 {
 	const void **tb;
 	const struct wmi_vdev_stopped_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3372,14 +3370,14 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 }
 
 static int ath11k_pull_mgmt_tx_compl_param_tlv(struct ath11k_base *ab,
-					       u8 *evt_buf, u32 len,
+					       struct sk_buff *skb,
 					       struct wmi_mgmt_tx_compl_event *param)
 {
 	const void **tb;
 	const struct wmi_mgmt_tx_compl_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3543,14 +3541,14 @@ static void ath11k_wmi_event_scan_foreign_chan(struct ath11k *ar, u32 freq)
 	}
 }
 
-static int ath11k_pull_scan_ev(struct ath11k_base *ab, u8 *evt_buf,
-			       u32 len, struct wmi_scan_event *scan_evt_param)
+static int ath11k_pull_scan_ev(struct ath11k_base *ab, struct sk_buff *skb,
+			       struct wmi_scan_event *scan_evt_param)
 {
 	const void **tb;
 	const struct wmi_scan_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3576,14 +3574,14 @@ static int ath11k_pull_scan_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, u8 *evt_buf,
-					   u32 len, struct wmi_peer_sta_kickout_arg *arg)
+static int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, struct sk_buff *skb,
+					   struct wmi_peer_sta_kickout_arg *arg)
 {
 	const void **tb;
 	const struct wmi_peer_sta_kickout_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3603,14 +3601,14 @@ static int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_roam_ev(struct ath11k_base *ab, u8 *evt_buf,
-			       u32 len, struct wmi_roam_event *roam_ev)
+static int ath11k_pull_roam_ev(struct ath11k_base *ab, struct sk_buff *skb,
+			       struct wmi_roam_event *roam_ev)
 {
 	const void **tb;
 	const struct wmi_roam_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3690,14 +3688,14 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 }
 
 static int
-ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
+ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, struct sk_buff *skb,
 				  struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
 {
 	const void **tb;
 	const struct wmi_pdev_bss_chan_info_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3730,14 +3728,14 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 }
 
 static int
-ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, struct sk_buff *skb,
 				      struct wmi_vdev_install_key_complete_arg *arg)
 {
 	const void **tb;
 	const struct wmi_vdev_install_key_compl_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3761,15 +3759,14 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, u8 *evt_buf,
-					  u32 len,
+static int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, struct sk_buff *skb,
 					  struct wmi_peer_assoc_conf_arg *peer_assoc_conf)
 {
 	const void **tb;
 	const struct wmi_peer_assoc_conf_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -3914,15 +3911,16 @@ static void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
 	dst->rx_mc_bc_cnt = src->rx_mc_bc_cnt;
 }
 
-int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 			     struct ath11k_fw_stats *stats)
 {
 	const void **tb;
 	const struct wmi_stats_event *ev;
 	const void *data;
 	int i, ret;
+	u32 len = skb->len;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -4510,7 +4508,7 @@ static bool ath11k_reg_is_world_alpha(char *alpha)
 	return alpha[0] == '0' && alpha[1] == '0';
 }
 
-static int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct cur_regulatory_info *reg_info = NULL;
 	struct ieee80211_regdomain *regd = NULL;
@@ -4524,7 +4522,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 l
 		goto fallback;
 	}
 
-	ret = ath11k_pull_reg_chan_list_update_ev(ab, evt_buf, reg_info, len);
+	ret = ath11k_pull_reg_chan_list_update_ev(ab, skb, reg_info);
 	if (ret) {
 		ath11k_warn(ab, "failed to extract regulatory info from received event\n");
 		goto fallback;
@@ -4654,12 +4652,12 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 	return 0;
 }
 
-static int ath11k_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_ready_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_tlv_rdy_parse rdy_parse = { };
 	int ret;
 
-	ret = ath11k_wmi_tlv_iter(ab, evt_buf, len,
+	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_rdy_parse, &rdy_parse);
 	if (ret) {
 		ath11k_warn(ab, "failed to parse tlv %d\n", ret);
@@ -4670,12 +4668,11 @@ static int ath11k_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	return 0;
 }
 
-static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_peer_delete_resp_event peer_del_resp;
 
-	if (ath11k_pull_peer_del_resp_ev(ab, evt_buf, len,
-					 &peer_del_resp) != 0) {
+	if (ath11k_pull_peer_del_resp_ev(ab, skb, &peer_del_resp) != 0) {
 		ath11k_warn(ab, "failed to extract peer delete resp");
 		return;
 	}
@@ -4701,14 +4698,13 @@ static inline const char *ath11k_wmi_vdev_resp_print(u32 vdev_resp_status)
 	}
 }
 
-static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_vdev_start_resp_event vdev_start_resp;
 	struct ath11k *ar;
 	u32 status;
 
-	if (ath11k_pull_vdev_start_resp_tlv(ab, evt_buf, len,
-					    &vdev_start_resp) != 0) {
+	if (ath11k_pull_vdev_start_resp_tlv(ab, skb, &vdev_start_resp) != 0) {
 		ath11k_warn(ab, "failed to extract vdev start resp");
 		return;
 	}
@@ -4740,24 +4736,23 @@ static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u3
 		   vdev_start_resp.vdev_id);
 }
 
-static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	u32 vdev_id, tx_status;
 
-	if (ath11k_pull_bcn_tx_status_ev(ab, evt_buf, len,
+	if (ath11k_pull_bcn_tx_status_ev(ab, skb->data, skb->len,
 					 &vdev_id, &tx_status) != 0) {
 		ath11k_warn(ab, "failed to extract bcn tx status");
 		return;
 	}
 }
 
-static void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_vdev_stopped_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct ath11k *ar;
 	u32 vdev_id = 0;
 
-	if (ath11k_pull_vdev_stopped_param_tlv(ab, evt_buf, len,
-					       &vdev_id) != 0) {
+	if (ath11k_pull_vdev_stopped_param_tlv(ab, skb, &vdev_id) != 0) {
 		ath11k_warn(ab, "failed to extract vdev stopped event");
 		return;
 	}
@@ -4894,8 +4889,7 @@ static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *s
 	struct wmi_mgmt_tx_compl_event tx_compl_param = {0};
 	struct ath11k *ar;
 
-	if (ath11k_pull_mgmt_tx_compl_param_tlv(ab, skb->data, skb->len,
-						&tx_compl_param) != 0) {
+	if (ath11k_pull_mgmt_tx_compl_param_tlv(ab, skb, &tx_compl_param) != 0) {
 		ath11k_warn(ab, "failed to extract mgmt tx compl event");
 		return;
 	}
@@ -4944,12 +4938,12 @@ static struct ath11k *ath11k_get_ar_on_scan_abort(struct ath11k_base *ab,
 	return NULL;
 }
 
-static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct ath11k *ar;
 	struct wmi_scan_event scan_ev = {0};
 
-	if (ath11k_pull_scan_ev(ab, evt_buf, len, &scan_ev) != 0) {
+	if (ath11k_pull_scan_ev(ab, skb, &scan_ev) != 0) {
 		ath11k_warn(ab, "failed to extract scan event");
 		return;
 	}
@@ -5013,14 +5007,14 @@ static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_peer_sta_kickout_arg arg = {};
 	struct ieee80211_sta *sta;
 	struct ath11k_peer *peer;
 	struct ath11k *ar;
 
-	if (ath11k_pull_peer_sta_kickout_ev(ab, evt_buf, len, &arg) != 0) {
+	if (ath11k_pull_peer_sta_kickout_ev(ab, skb, &arg) != 0) {
 		ath11k_warn(ab, "failed to extract peer sta kickout event");
 		return;
 	}
@@ -5062,12 +5056,12 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u
 	rcu_read_unlock();
 }
 
-static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_roam_event roam_ev = {};
 	struct ath11k *ar;
 
-	if (ath11k_pull_roam_ev(ab, evt_buf, len, &roam_ev) != 0) {
+	if (ath11k_pull_roam_ev(ab, skb, &roam_ev) != 0) {
 		ath11k_warn(ab, "failed to extract roam event");
 		return;
 	}
@@ -5108,7 +5102,7 @@ static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_chan_info_event ch_info_ev = {0};
 	struct ath11k *ar;
@@ -5117,7 +5111,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	/* HW channel counters frequency value in hertz */
 	u32 cc_freq_hz = ab->cc_freq_hz;
 
-	if (ath11k_pull_chan_info_ev(ab, evt_buf, len, &ch_info_ev) != 0) {
+	if (ath11k_pull_chan_info_ev(ab, skb->data, skb->len, &ch_info_ev) != 0) {
 		ath11k_warn(ab, "failed to extract chan info event");
 		return;
 	}
@@ -5182,7 +5176,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 }
 
 static void
-ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_pdev_bss_chan_info_event bss_ch_info_ev = {};
 	struct survey_info *survey;
@@ -5191,8 +5185,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	u64 busy, total, tx, rx, rx_bss;
 	int idx;
 
-	if (ath11k_pull_pdev_bss_chan_info_ev(ab, evt_buf, len,
-					      &bss_ch_info_ev) != 0) {
+	if (ath11k_pull_pdev_bss_chan_info_ev(ab, skb, &bss_ch_info_ev) != 0) {
 		ath11k_warn(ab, "failed to extract pdev bss chan info event");
 		return;
 	}
@@ -5255,14 +5248,13 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_buf,
-						u32 len)
+static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab,
+						struct sk_buff *skb)
 {
 	struct wmi_vdev_install_key_complete_arg install_key_compl = {0};
 	struct ath11k *ar;
 
-	if (ath11k_pull_vdev_install_key_compl_ev(ab, evt_buf, len,
-						  &install_key_compl) != 0) {
+	if (ath11k_pull_vdev_install_key_compl_ev(ab, skb, &install_key_compl) != 0) {
 		ath11k_warn(ab, "failed to extract install key compl event");
 		return;
 	}
@@ -5293,15 +5285,14 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_
 	rcu_read_unlock();
 }
 
-static void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
-					   u32 len)
+static void ath11k_service_available_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	const void **tb;
 	const struct wmi_service_available_event *ev;
 	int ret;
 	int i, j;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5337,13 +5328,12 @@ static void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
 	kfree(tb);
 }
 
-static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_peer_assoc_conf_arg peer_assoc_conf = {0};
 	struct ath11k *ar;
 
-	if (ath11k_pull_peer_assoc_conf_ev(ab, evt_buf, len,
-					   &peer_assoc_conf) != 0) {
+	if (ath11k_pull_peer_assoc_conf_ev(ab, skb, &peer_assoc_conf) != 0) {
 		ath11k_warn(ab, "failed to extract peer assoc conf event");
 		return;
 	}
@@ -5363,22 +5353,22 @@ static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u3
 	complete(&ar->peer_assoc_done);
 }
 
-static void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
-	ath11k_debug_fw_stats_process(ab, evt_buf, len);
+	ath11k_debug_fw_stats_process(ab, skb);
 }
 
 /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the frequency scanned
  * is not part of BDF CTL(Conformance test limits) table entries.
  */
-static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt_buf,
-						 u32 len)
+static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab,
+						 struct sk_buff *skb)
 {
 	const void **tb;
 	const struct wmi_pdev_ctl_failsafe_chk_event *ev;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5436,15 +5426,14 @@ static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt
 
 static void
 ath11k_wmi_pdev_csa_switch_count_status_event(struct ath11k_base *ab,
-					      u8 *evt_buf,
-					      u32 len)
+					      struct sk_buff *skb)
 {
 	const void **tb;
 	const struct wmi_pdev_csa_switch_ev *ev;
 	const u32 *vdev_ids;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5471,16 +5460,14 @@ static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt
 }
 
 static void
-ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
-					 u8 *evt_buf,
-					 u32 len)
+ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	const void **tb;
 	const struct wmi_pdev_radar_ev *ev;
 	struct ath11k *ar;
 	int ret;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5525,8 +5512,6 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_tlv_event_id id;
-	u8 *data;
-	u32 len;
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
@@ -5534,34 +5519,31 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
 		goto out;
 
-	data = (u8 *)skb->data;
-	len = skb->len;
-
 	switch (id) {
 		/* Process all the WMI events here */
 	case WMI_SERVICE_READY_EVENTID:
-		ath11k_service_ready_event(ab, data, len);
+		ath11k_service_ready_event(ab, skb);
 		break;
 	case WMI_SERVICE_READY_EXT_EVENTID:
-		ath11k_service_ready_ext_event(ab, data, len);
+		ath11k_service_ready_ext_event(ab, skb);
 		break;
 	case WMI_REG_CHAN_LIST_CC_EVENTID:
-		ath11k_reg_chan_list_event(ab, data, len);
+		ath11k_reg_chan_list_event(ab, skb);
 		break;
 	case WMI_READY_EVENTID:
-		ath11k_ready_event(ab, data, len);
+		ath11k_ready_event(ab, skb);
 		break;
 	case WMI_PEER_DELETE_RESP_EVENTID:
-		ath11k_peer_delete_resp_event(ab, data, len);
+		ath11k_peer_delete_resp_event(ab, skb);
 		break;
 	case WMI_VDEV_START_RESP_EVENTID:
-		ath11k_vdev_start_resp_event(ab, data, len);
+		ath11k_vdev_start_resp_event(ab, skb);
 		break;
 	case WMI_OFFLOAD_BCN_TX_STATUS_EVENTID:
-		ath11k_bcn_tx_status_event(ab, data, len);
+		ath11k_bcn_tx_status_event(ab, skb);
 		break;
 	case WMI_VDEV_STOPPED_EVENTID:
-		ath11k_vdev_stopped_event(ab, data, len);
+		ath11k_vdev_stopped_event(ab, skb);
 		break;
 	case WMI_MGMT_RX_EVENTID:
 		ath11k_mgmt_rx_event(ab, skb);
@@ -5571,37 +5553,37 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 		ath11k_mgmt_tx_compl_event(ab, skb);
 		break;
 	case WMI_SCAN_EVENTID:
-		ath11k_scan_event(ab, data, len);
+		ath11k_scan_event(ab, skb);
 		break;
 	case WMI_PEER_STA_KICKOUT_EVENTID:
-		ath11k_peer_sta_kickout_event(ab, data, len);
+		ath11k_peer_sta_kickout_event(ab, skb);
 		break;
 	case WMI_ROAM_EVENTID:
-		ath11k_roam_event(ab, data, len);
+		ath11k_roam_event(ab, skb);
 		break;
 	case WMI_CHAN_INFO_EVENTID:
-		ath11k_chan_info_event(ab, data, len);
+		ath11k_chan_info_event(ab, skb);
 		break;
 	case WMI_PDEV_BSS_CHAN_INFO_EVENTID:
-		ath11k_pdev_bss_chan_info_event(ab, data, len);
+		ath11k_pdev_bss_chan_info_event(ab, skb);
 		break;
 	case WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID:
-		ath11k_vdev_install_key_compl_event(ab, data, len);
+		ath11k_vdev_install_key_compl_event(ab, skb);
 		break;
 	case WMI_SERVICE_AVAILABLE_EVENTID:
-		ath11k_service_available_event(ab, data, len);
+		ath11k_service_available_event(ab, skb);
 		break;
 	case WMI_PEER_ASSOC_CONF_EVENTID:
-		ath11k_peer_assoc_conf_event(ab, data, len);
+		ath11k_peer_assoc_conf_event(ab, skb);
 		break;
 	case WMI_UPDATE_STATS_EVENTID:
-		ath11k_update_stats_event(ab, data, len);
+		ath11k_update_stats_event(ab, skb);
 		break;
 	case WMI_PDEV_CTL_FAILSAFE_CHECK_EVENTID:
-		ath11k_pdev_ctl_failsafe_check_event(ab, data, len);
+		ath11k_pdev_ctl_failsafe_check_event(ab, skb);
 		break;
 	case WMI_PDEV_CSA_SWITCH_COUNT_STATUS_EVENTID:
-		ath11k_wmi_pdev_csa_switch_count_status_event(ab, data, len);
+		ath11k_wmi_pdev_csa_switch_count_status_event(ab, skb);
 		break;
 	/* add Unsupported events here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
@@ -5610,7 +5592,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
 	case WMI_PDEV_DFS_RADAR_DETECTION_EVENTID:
-		ath11k_wmi_pdev_dfs_radar_detected_event(ab, data, len);
+		ath11k_wmi_pdev_dfs_radar_detected_event(ab, skb);
 		break;
 	/* TODO: Add remaining events */
 	default:
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 248326e..e6566f7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4703,7 +4703,7 @@ int ath11k_wmi_send_bcn_offload_control_cmd(struct ath11k *ar,
 				 struct rx_reorder_queue_remove_params *param);
 int ath11k_wmi_send_pdev_set_regdomain(struct ath11k *ar,
 				       struct pdev_set_regdomain_params *param);
-int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 			     struct ath11k_fw_stats *stats);
 size_t ath11k_wmi_fw_stats_num_peers(struct list_head *head);
 size_t ath11k_wmi_fw_stats_num_peers_extd(struct list_head *head);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
