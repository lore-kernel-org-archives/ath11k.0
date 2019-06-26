Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg6ii-0001ar-Rj
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 12:08:16 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F46860A05
 for <ath11k@lists.infradead.org>; Wed, 26 Jun 2019 12:08:10 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 2/4] ath11k/wmi: Clean up few indentations in wmi
Date: Wed, 26 Jun 2019 17:37:38 +0530
Message-Id: <1561550860-2928-2-git-send-email-vthiagar@codeaurora.org>
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

Also make ath11k_hw_mode_pri_map[] static const.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 187 +++++++++++++++-------------------
 1 file changed, 80 insertions(+), 107 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9b0c7d4..6807ee5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -102,7 +102,7 @@ struct wmi_tlv_rdy_parse {
 #define PRIMAP(_hw_mode_) \
 	[_hw_mode_] = _hw_mode_##_PRI
 
-static int ath11k_hw_mode_pri_map[] = {
+static const int ath11k_hw_mode_pri_map[] = {
 	PRIMAP(WMI_HOST_HW_MODE_SINGLE),
 	PRIMAP(WMI_HOST_HW_MODE_DBS),
 	PRIMAP(WMI_HOST_HW_MODE_SBS_PASSIVE),
@@ -254,17 +254,18 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 	return ret;
 }
 
-static int ath11k_pull_service_ready_ext(
-		struct ath11k_pdev_wmi *wmi_handle,
-		struct wmi_service_ready_ext_event *ev,
-		struct ath11k_service_ext_param *param)
+static int ath11k_pull_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
+				     const void *ptr,
+				     struct ath11k_service_ext_param *param)
 {
+	struct wmi_service_ready_ext_event *ev;
+
+	ev = (struct wmi_service_ready_ext_event *)ptr;
 	if (!ev)
 		return -EINVAL;
 
 	/* Move this to host based bitmap */
-	param->default_conc_scan_config_bits =
-		 ev->default_conc_scan_config_bits;
+	param->default_conc_scan_config_bits = ev->default_conc_scan_config_bits;
 	param->default_fw_config_bits =	ev->default_fw_config_bits;
 	param->he_cap_info = ev->he_cap_info;
 	param->mpdu_density = ev->mpdu_density;
@@ -274,14 +275,14 @@ static int ath11k_pull_service_ready_ext(
 	return 0;
 }
 
-static int ath11k_pull_mac_phy_cap_service_ready_ext(
-		struct ath11k_pdev_wmi *wmi_handle,
-		struct wmi_soc_mac_phy_hw_mode_caps *hw_caps,
-		struct wmi_hw_mode_capabilities *wmi_hw_mode_caps,
-		struct wmi_soc_hal_reg_capabilities *soc_hal_reg_caps,
-		struct wmi_mac_phy_capabilities *wmi_mac_phy_caps,
-		u8 hw_mode_id, u8 phy_id,
-		struct ath11k_pdev *pdev)
+static int
+ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
+				      struct wmi_soc_mac_phy_hw_mode_caps *hw_caps,
+				      struct wmi_hw_mode_capabilities *wmi_hw_mode_caps,
+				      struct wmi_soc_hal_reg_capabilities *hal_reg_caps,
+				      struct wmi_mac_phy_capabilities *wmi_mac_phy_caps,
+				      u8 hw_mode_id, u8 phy_id,
+				      struct ath11k_pdev *pdev)
 {
 	struct wmi_mac_phy_capabilities *mac_phy_caps;
 	struct ath11k_band_cap *cap_band;
@@ -289,7 +290,7 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	u32 phy_map;
 	u32 hw_idx, phy_idx = 0;
 
-	if (!hw_caps || !wmi_hw_mode_caps || !soc_hal_reg_caps)
+	if (!hw_caps || !wmi_hw_mode_caps || !hal_reg_caps)
 		return -EINVAL;
 
 	for (hw_idx = 0; hw_idx < hw_caps->num_hw_modes; hw_idx++) {
@@ -307,7 +308,7 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 		return -EINVAL;
 
 	phy_idx += phy_id;
-	if (phy_id >= soc_hal_reg_caps->num_phy)
+	if (phy_id >= hal_reg_caps->num_phy)
 		return -EINVAL;
 
 	mac_phy_caps = &wmi_mac_phy_caps[phy_idx];
@@ -371,12 +372,12 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	return 0;
 }
 
-static int ath11k_pull_reg_cap_svc_rdy_ext(
-		struct ath11k_pdev_wmi *wmi_handle,
-		struct wmi_soc_hal_reg_capabilities *reg_caps,
-		struct wmi_hal_reg_capabilities_ext *wmi_ext_reg_cap,
-		u8 phy_idx,
-		struct ath11k_hal_reg_capabilities_ext *param)
+static int
+ath11k_pull_reg_cap_svc_rdy_ext(struct ath11k_pdev_wmi *wmi_handle,
+				struct wmi_soc_hal_reg_capabilities *reg_caps,
+				struct wmi_hal_reg_capabilities_ext *wmi_ext_reg_cap,
+				u8 phy_idx,
+				struct ath11k_hal_reg_capabilities_ext *param)
 {
 	struct wmi_hal_reg_capabilities_ext *ext_reg_cap;
 
@@ -407,11 +408,10 @@ static int ath11k_pull_service_ready_tlv(struct ath11k_base *ab,
 					 const void *evt_buf,
 					 struct ath11k_targ_cap *cap)
 {
-	struct wmi_service_ready_event *ev;
+	struct wmi_service_ready_event *ev = (struct wmi_service_ready_event *)evt_buf;
 
-	ev = (struct wmi_service_ready_event *)evt_buf;
 	if (!ev) {
-		ath11k_err(ab, "%s: failed by Null Param\n",
+		ath11k_err(ab, "%s: failed by NULL param\n",
 			   __func__);
 		return -EINVAL;
 	}
@@ -2460,7 +2460,7 @@ int ath11k_wmi_pdev_pktlog_disable(struct ath11k *ar)
 	return ret;
 }
 
-static inline void
+static void
 ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 			      struct wmi_host_pdev_band_to_mac *band_to_mac)
 {
@@ -2574,7 +2574,7 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 			      (param->num_band_to_mac * sizeof(*band_to_mac));
 
 	len = sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*cfg) + hw_mode_len +
-		(sizeof(*host_mem_chunks) * WMI_MAX_MEM_REQS);
+	      (sizeof(*host_mem_chunks) * WMI_MAX_MEM_REQS);
 
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
 	if (!skb)
@@ -2878,11 +2878,10 @@ static int ath11k_wmi_tlv_ext_hal_reg_caps(struct ath11k_base *soc,
 	}
 
 	for (i = 0; i < svc_rdy_ext->param.num_phy; i++) {
-		ret = ath11k_pull_reg_cap_svc_rdy_ext
-				(wmi_handle,
-				 svc_rdy_ext->soc_hal_reg_caps,
-				 svc_rdy_ext->ext_hal_reg_caps, i,
-				 &reg_cap);
+		ret = ath11k_pull_reg_cap_svc_rdy_ext(wmi_handle,
+						      svc_rdy_ext->soc_hal_reg_caps,
+						      svc_rdy_ext->ext_hal_reg_caps, i,
+						      &reg_cap);
 		if (ret) {
 			ath11k_warn(soc, "failed to extract reg cap %d\n", i);
 			return ret;
@@ -2900,6 +2899,7 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 {
 	struct ath11k_pdev_wmi *wmi_handle = &soc->wmi_sc.wmi[0];
 	struct wmi_tlv_svc_rdy_ext_parse *svc_rdy_ext = data;
+	u8 hw_mode_id = svc_rdy_ext->pref_hw_mode_caps.hw_mode_id;
 	u32 phy_id_map;
 	int ret;
 
@@ -2910,15 +2910,13 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 	phy_id_map = svc_rdy_ext->pref_hw_mode_caps.phy_id_map;
 
 	while (phy_id_map && soc->num_radios < MAX_RADIOS) {
-		ret = ath11k_pull_mac_phy_cap_service_ready_ext
-			(wmi_handle,
-			 svc_rdy_ext->hw_caps,
-			 svc_rdy_ext->hw_mode_caps,
-			 svc_rdy_ext->soc_hal_reg_caps,
-			 svc_rdy_ext->mac_phy_caps,
-			 svc_rdy_ext->pref_hw_mode_caps.hw_mode_id,
-			 soc->num_radios,
-			 &soc->pdevs[soc->num_radios]);
+		ret = ath11k_pull_mac_phy_cap_svc_ready_ext(wmi_handle,
+							    svc_rdy_ext->hw_caps,
+							    svc_rdy_ext->hw_mode_caps,
+							    svc_rdy_ext->soc_hal_reg_caps,
+							    svc_rdy_ext->mac_phy_caps,
+							    hw_mode_id, soc->num_radios,
+							    &soc->pdevs[soc->num_radios]);
 		if (ret) {
 			ath11k_warn(soc, "failed to extract mac caps, idx :%d\n",
 				    soc->num_radios);
@@ -2943,10 +2941,8 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 
 	switch (tag) {
 	case WMI_TAG_SERVICE_READY_EXT_EVENT:
-		ret =
-		 ath11k_pull_service_ready_ext(wmi_handle,
-					       (struct wmi_service_ready_ext_event *)ptr,
-					       &svc_rdy_ext->param);
+		ret = ath11k_pull_svc_ready_ext(wmi_handle, ptr,
+						&svc_rdy_ext->param);
 		if (ret) {
 			ath11k_warn(ab, "unable to extract ext params\n");
 			return ret;
@@ -3140,20 +3136,15 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 	reg_info->reg_dmn_pair = chan_list_event_hdr->domain_code;
 	if (chan_list_event_hdr->status_code == WMI_REG_SET_CC_STATUS_PASS)
 		reg_info->status_code = REG_SET_CC_STATUS_PASS;
-	else if (chan_list_event_hdr->status_code ==
-		 WMI_REG_CURRENT_ALPHA2_NOT_FOUND)
+	else if (chan_list_event_hdr->status_code == WMI_REG_CURRENT_ALPHA2_NOT_FOUND)
 		reg_info->status_code = REG_CURRENT_ALPHA2_NOT_FOUND;
-	else if (chan_list_event_hdr->status_code ==
-		 WMI_REG_INIT_ALPHA2_NOT_FOUND)
+	else if (chan_list_event_hdr->status_code == WMI_REG_INIT_ALPHA2_NOT_FOUND)
 		reg_info->status_code = REG_INIT_ALPHA2_NOT_FOUND;
-	else if (chan_list_event_hdr->status_code ==
-		 WMI_REG_SET_CC_CHANGE_NOT_ALLOWED)
+	else if (chan_list_event_hdr->status_code == WMI_REG_SET_CC_CHANGE_NOT_ALLOWED)
 		reg_info->status_code = REG_SET_CC_CHANGE_NOT_ALLOWED;
-	else if (chan_list_event_hdr->status_code ==
-		 WMI_REG_SET_CC_STATUS_NO_MEMORY)
+	else if (chan_list_event_hdr->status_code == WMI_REG_SET_CC_STATUS_NO_MEMORY)
 		reg_info->status_code = REG_SET_CC_STATUS_NO_MEMORY;
-	else if (chan_list_event_hdr->status_code ==
-		 WMI_REG_SET_CC_STATUS_FAIL)
+	else if (chan_list_event_hdr->status_code == WMI_REG_SET_CC_STATUS_FAIL)
 		reg_info->status_code = REG_SET_CC_STATUS_FAIL;
 
 	reg_info->min_bw_2g = chan_list_event_hdr->min_bw_2g;
@@ -3180,9 +3171,8 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 						+ sizeof(struct wmi_tlv));
 
 	if (num_2g_reg_rules) {
-		reg_info->reg_rules_2g_ptr =
-			create_reg_rules_from_wmi(num_2g_reg_rules,
-						  wmi_reg_rule);
+		reg_info->reg_rules_2g_ptr = create_reg_rules_from_wmi(num_2g_reg_rules,
+								       wmi_reg_rule);
 		if (!reg_info->reg_rules_2g_ptr) {
 			kfree(tb);
 			ath11k_warn(ab, "Unable to Allocate memory for 2g rules\n");
@@ -3192,9 +3182,8 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 
 	if (num_5g_reg_rules) {
 		wmi_reg_rule += num_2g_reg_rules;
-		reg_info->reg_rules_5g_ptr =
-			create_reg_rules_from_wmi(num_5g_reg_rules,
-						  wmi_reg_rule);
+		reg_info->reg_rules_5g_ptr = create_reg_rules_from_wmi(num_5g_reg_rules,
+								       wmi_reg_rule);
 		if (!reg_info->reg_rules_5g_ptr) {
 			kfree(tb);
 			ath11k_warn(ab, "Unable to Allocate memory for 5g rules\n");
@@ -3702,7 +3691,6 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 
 static int
 ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
-				  u32 len,
 				  struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
 {
 	const void **tb;
@@ -3741,9 +3729,9 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf,
-						 u32 len,
-						 struct wmi_vdev_install_key_complete_arg *install_key_compl)
+static int
+ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+				      struct wmi_vdev_install_key_complete_arg *arg)
 {
 	const void **tb;
 	const struct wmi_vdev_install_key_compl_event *ev;
@@ -3763,11 +3751,11 @@ static int ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt
 		return -EPROTO;
 	}
 
-	install_key_compl->vdev_id = ev->vdev_id;
-	install_key_compl->macaddr = ev->peer_macaddr.addr;
-	install_key_compl->key_idx = ev->key_idx;
-	install_key_compl->key_flags = ev->key_flags;
-	install_key_compl->status = ev->status;
+	arg->vdev_id = ev->vdev_id;
+	arg->macaddr = ev->peer_macaddr.addr;
+	arg->key_idx = ev->key_idx;
+	arg->key_flags = ev->key_flags;
+	arg->status = ev->status;
 
 	kfree(tb);
 	return 0;
@@ -3879,24 +3867,19 @@ static void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
 	dst->num_tx_not_acked = src->num_tx_not_acked;
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames); i++)
-		dst->num_tx_frames[i] =
-			src->num_tx_frames[i];
+		dst->num_tx_frames[i] = src->num_tx_frames[i];
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames_retries); i++)
-		dst->num_tx_frames_retries[i] =
-			src->num_tx_frames_retries[i];
+		dst->num_tx_frames_retries[i] = src->num_tx_frames_retries[i];
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames_failures); i++)
-		dst->num_tx_frames_failures[i] =
-			src->num_tx_frames_failures[i];
+		dst->num_tx_frames_failures[i] = src->num_tx_frames_failures[i];
 
 	for (i = 0; i < ARRAY_SIZE(src->tx_rate_history); i++)
-		dst->tx_rate_history[i] =
-			src->tx_rate_history[i];
+		dst->tx_rate_history[i] = src->tx_rate_history[i];
 
 	for (i = 0; i < ARRAY_SIZE(src->beacon_rssi_history); i++)
-		dst->beacon_rssi_history[i] =
-			src->beacon_rssi_history[i];
+		dst->beacon_rssi_history[i] = src->beacon_rssi_history[i];
 }
 
 static void
@@ -4399,14 +4382,14 @@ static size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
 	struct ath11k_vif *arvif = ath11k_mac_get_arvif(ar, bcn->vdev_id);
 	u8 *vdev_macaddr;
 
-	if (arvif) {
-		vdev_macaddr = arvif->vif->addr;
-	} else {
+	if (!arvif) {
 		ath11k_warn(ar->ab, "invalid vdev id %d in bcn stats",
 			    bcn->vdev_id);
 		return;
 	}
 
+	vdev_macaddr = arvif->vif->addr;
+
 	len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
 			 "VDEV ID", bcn->vdev_id);
 	len += scnprintf(buf + len, buf_len - len, "%30s %pM\n",
@@ -4459,9 +4442,8 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 		len += scnprintf(buf + len, buf_len - len, "%30s\n\n",
 				 "=================");
 
-		list_for_each_entry(vdev, &fw_stats->vdevs, list) {
+		list_for_each_entry(vdev, &fw_stats->vdevs, list)
 			ath11k_wmi_fw_vdev_stats_fill(ar, vdev, buf, &len);
-		}
 	}
 
 	if (stats_id == WMI_REQUEST_BCN_STAT) {
@@ -4473,9 +4455,8 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 		len += scnprintf(buf + len, buf_len - len, "%30s\n\n",
 				 "===================");
 
-		list_for_each_entry(bcn, &fw_stats->bcn, list) {
+		list_for_each_entry(bcn, &fw_stats->bcn, list)
 			ath11k_wmi_fw_bcn_stats_fill(ar, bcn, buf, &len);
-		}
 	}
 
 	if (stats_id & WMI_REQUEST_PEER_STAT) {
@@ -4486,9 +4467,8 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 		len += scnprintf(buf + len, buf_len - len, "%30s\n\n",
 				 "=================");
 
-		list_for_each_entry(peer, &fw_stats->peers, list) {
+		list_for_each_entry(peer, &fw_stats->peers, list)
 			ath11k_wmi_fw_peer_stats_fill(peer, buf, &len);
-		}
 	}
 
 	if (stats_id & WMI_REQUEST_PEER_EXTD_STAT) {
@@ -4500,9 +4480,8 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 		len += scnprintf(buf + len, buf_len - len, "%30s\n\n",
 				 "======================");
 
-		list_for_each_entry(peer_extd, &fw_stats->peers_extd, list) {
+		list_for_each_entry(peer_extd, &fw_stats->peers_extd, list)
 			ath11k_wmi_fw_peer_extd_stats_fill(peer_extd, buf, &len);
-		}
 	}
 
 unlock:
@@ -4970,8 +4949,7 @@ static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	struct ath11k *ar;
 	struct wmi_scan_event scan_ev = {0};
 
-	if (ath11k_pull_scan_ev(ab, evt_buf, len,
-				&scan_ev) != 0) {
+	if (ath11k_pull_scan_ev(ab, evt_buf, len, &scan_ev) != 0) {
 		ath11k_warn(ab, "failed to extract scan event");
 		return;
 	}
@@ -5000,8 +4978,7 @@ static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "scan event %s type %d reason %d freq %d req_id %d scan_id %d vdev_id %d state %s (%d)\n",
-		   ath11k_wmi_event_scan_type_str(scan_ev.event_type,
-						  scan_ev.reason),
+		   ath11k_wmi_event_scan_type_str(scan_ev.event_type, scan_ev.reason),
 		   scan_ev.event_type, scan_ev.reason, scan_ev.channel_freq,
 		   scan_ev.scan_req_id, scan_ev.scan_id, scan_ev.vdev_id,
 		   ath11k_scan_state_str(ar->scan.state), ar->scan.state);
@@ -5306,8 +5283,7 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_
 
 	ar->install_key_status = 0;
 
-	if (install_key_compl.status !=
-		WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS) {
+	if (install_key_compl.status != WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS) {
 		ath11k_warn(ab, "install key failed for %pM status %d\n",
 			    install_key_compl.macaddr, install_key_compl.status);
 		ar->install_key_status = install_key_compl.status;
@@ -5697,7 +5673,7 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
 	int ret;
 	int i;
 
-	arg_len = (sizeof(u32) * ut_cmd.num_args);
+	arg_len = sizeof(u32) * ut_cmd.num_args;
 	buf_len = sizeof(ut_cmd) + arg_len + TLV_HDR_SIZE;
 
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, buf_len);
@@ -5705,10 +5681,8 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
 		return -ENOMEM;
 
 	cmd = (struct wmi_unit_test_cmd *)skb->data;
-	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_UNIT_TEST_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(ut_cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_UNIT_TEST_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(ut_cmd) - TLV_HDR_SIZE);
 
 	cmd->vdev_id = ut_cmd.vdev_id;
 	cmd->module_id = ut_cmd.module_id;
@@ -5727,15 +5701,14 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
 	for (i = 0; i < ut_cmd.num_args; i++)
 		ut_cmd_args[i] = test_args[i];
 
-	ret = ath11k_wmi_cmd_send(wmi, skb,
-				  WMI_UNIT_TEST_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_UNIT_TEST_CMDID);
 
 	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to send WMI_UNIT_TEST CMD :%d\n",
+		ath11k_warn(ar->ab, "failed to send WMI_UNIT_TEST CMD :%d\n",
 			    ret);
 		dev_kfree_skb(skb);
 	}
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "WMI unit test : module %d vdev %d n_args %d token %d\n",
 		   cmd->module_id, cmd->vdev_id, cmd->num_args,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
