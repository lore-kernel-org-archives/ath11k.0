Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg6ii-0001b2-PH
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 12:08:14 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 55468609F3
 for <ath11k@lists.infradead.org>; Wed, 26 Jun 2019 12:08:11 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 3/4] ath11k/wmi: Remove unnecessary type casting
Date: Wed, 26 Jun 2019 17:37:39 +0530
Message-Id: <1561550860-2928-3-git-send-email-vthiagar@codeaurora.org>
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

- Remove unnecessary type cast of void *
- Remove type casting in ether_addr_copy() and use u8 *mac_addr.addri
  directly.
- Remove the type cast in ath11k_wmi_vdev_install_key() with memcpy().

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 58 +++++++++++++++++------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6807ee5..713f8b3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -604,7 +604,7 @@ int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 	cmd->vdev_subtype = param->subtype;
 	cmd->num_cfg_txrx_streams = WMI_NUM_SUPPORTED_BAND_MAX;
 	cmd->pdev_id = param->pdev_id;
-	ether_addr_copy((u8 *)&cmd->vdev_macaddr, macaddr);
+	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
 
 	ptr = skb->data + sizeof(*cmd);
 	len = WMI_NUM_SUPPORTED_BAND_MAX * sizeof(*txrx_streams);
@@ -614,7 +614,7 @@ int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 		      FIELD_PREP(WMI_TLV_LEN, len);
 
 	ptr += TLV_HDR_SIZE;
-	txrx_streams = (void *)ptr;
+	txrx_streams = ptr;
 	len = sizeof(*txrx_streams);
 	txrx_streams->tlv_header =
 		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_TXRX_STREAMS) |
@@ -822,8 +822,8 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 
 	cmd->flags |= WMI_VDEV_START_LDPC_RX_ENABLED;
 
-	ptr = (void *)skb->data + sizeof(*cmd);
-	chan = (struct wmi_channel *)ptr;
+	ptr = skb->data + sizeof(*cmd);
+	chan = ptr;
 
 	ath11k_wmi_put_wmi_channel(chan, arg);
 
@@ -910,7 +910,7 @@ int ath11k_wmi_send_peer_create_cmd(struct ath11k *ar,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_CREATE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, param->peer_addr);
+	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_addr);
 	cmd->peer_type = param->peer_type;
 	cmd->vdev_id = param->vdev_id;
 
@@ -943,7 +943,7 @@ int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_DELETE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, peer_addr);
+	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
 	cmd->vdev_id = vdev_id;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
@@ -1049,7 +1049,7 @@ int ath11k_wmi_send_peer_flush_tids_cmd(struct ath11k *ar,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_FLUSH_TIDS_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, peer_addr);
+	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
 	cmd->peer_tid_bitmap = param->peer_tid_bitmap;
 	cmd->vdev_id = param->vdev_id;
 
@@ -1086,7 +1086,7 @@ int ath11k_wmi_peer_rx_reorder_queue_setup(struct ath11k *ar,
 				     WMI_TAG_REORDER_QUEUE_SETUP_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, (u8 *)addr);
+	ether_addr_copy(cmd->peer_macaddr.addr, addr);
 	cmd->vdev_id = vdev_id;
 	cmd->tid = tid;
 	cmd->queue_ptr_lo = lower_32_bits(paddr);
@@ -1128,7 +1128,7 @@ int ath11k_wmi_peer_rx_reorder_queue_setup(struct ath11k *ar,
 				     WMI_TAG_REORDER_QUEUE_REMOVE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, param->peer_macaddr);
+	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_macaddr);
 	cmd->vdev_id = param->vdev_id;
 	cmd->tid_mask = param->peer_tid_bitmap;
 
@@ -1294,7 +1294,7 @@ int ath11k_wmi_send_set_ap_ps_param_cmd(struct ath11k *ar, u8 *peer_addr,
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
 	cmd->vdev_id = param->vdev_id;
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, peer_addr);
+	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
 	cmd->param = param->param;
 	cmd->value = param->value;
 
@@ -1552,7 +1552,7 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_INSTALL_KEY_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 	cmd->vdev_id = arg->vdev_id;
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, arg->macaddr);
+	ether_addr_copy(cmd->peer_macaddr.addr, arg->macaddr);
 	cmd->key_idx = arg->key_idx;
 	cmd->key_flags = arg->key_flags;
 	cmd->key_cipher = arg->key_cipher;
@@ -1561,7 +1561,7 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 	cmd->key_rxmic_len = arg->key_rxmic_len;
 
 	if (arg->key_rsc_counter)
-		memcpy((u8 *)&cmd->key_rsc_counter, (u8 *)&arg->key_rsc_counter,
+		memcpy(&cmd->key_rsc_counter, &arg->key_rsc_counter,
 		       sizeof(struct wmi_key_seq_counter));
 
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
@@ -1692,7 +1692,7 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 
 	ptr = skb->data;
 
-	cmd = (struct wmi_peer_assoc_complete_cmd *)ptr;
+	cmd = ptr;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
 				     WMI_TAG_PEER_ASSOC_COMPLETE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
@@ -1704,7 +1704,7 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 
 	ath11k_wmi_copy_peer_flags(cmd, param);
 
-	ether_addr_copy((u8 *)&cmd->peer_macaddr, param->peer_mac);
+	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_mac);
 
 	cmd->peer_rate_caps = param->peer_rate_caps;
 	cmd->peer_caps = param->peer_caps;
@@ -1752,7 +1752,7 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	/* VHT Rates */
 	ptr += peer_ht_rates_align;
 
-	mcs = (struct wmi_vht_rate_set *)ptr;
+	mcs = ptr;
 
 	mcs->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VHT_RATE_SET) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*mcs) - TLV_HDR_SIZE);
@@ -1784,7 +1784,7 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 
 	/* Loop through the HE rate set */
 	for (i = 0; i < param->peer_he_mcs_count; i++) {
-		he_mcs = (struct wmi_he_rate_set *)ptr;
+		he_mcs = ptr;
 		he_mcs->tlv_header = FIELD_PREP(WMI_TLV_TAG,
 						WMI_TAG_HE_RATE_SET) |
 				     FIELD_PREP(WMI_TLV_LEN,
@@ -1949,7 +1949,7 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 
 	ptr = skb->data;
 
-	cmd = (struct wmi_start_scan_cmd *)ptr;
+	cmd = ptr;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_START_SCAN_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
@@ -2001,7 +2001,7 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	ptr += TLV_HDR_SIZE;
 
 	if (params->num_ssids) {
-		ssid = (struct wmi_ssid *)ptr;
+		ssid = ptr;
 		for (i = 0; i < params->num_ssids; ++i) {
 			ssid->ssid_len = params->ssid[i].length;
 			memcpy(ssid->ssid, params->ssid[i].ssid,
@@ -2017,12 +2017,12 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 		      FIELD_PREP(WMI_TLV_LEN, len);
 
 	ptr += TLV_HDR_SIZE;
-	bssid = (struct wmi_mac_addr *)ptr;
+	bssid = ptr;
 
 	if (params->num_bssid) {
 		for (i = 0; i < params->num_bssid; ++i) {
-			ether_addr_copy((u8 *)bssid,
-					(u8 *)&params->bssid_list[i]);
+			ether_addr_copy(bssid->addr,
+					params->bssid_list[i].addr);
 			bssid++;
 		}
 	}
@@ -2139,7 +2139,7 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	tchan_info = &chan_list->ch_param[0];
 
 	for (i = 0; i < chan_list->nallchans; ++i) {
-		chan_info = (struct wmi_channel *)ptr;
+		chan_info = ptr;
 		memset(chan_info, 0, sizeof(*chan_info));
 		len = sizeof(*chan_info);
 		chan_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
@@ -2331,7 +2331,7 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 		      FIELD_PREP(WMI_TLV_LEN, 0);
 
 	ptr += TLV_HDR_SIZE;
-	info = (struct wmi_pdev_pktlog_filter_info *)ptr;
+	info = ptr;
 
 	ether_addr_copy(info->peer_macaddr.addr, addr);
 	info->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO) |
@@ -2586,7 +2586,7 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
 	ptr = skb->data + sizeof(*cmd);
-	cfg = (struct wmi_resource_config *)ptr;
+	cfg = ptr;
 
 	ath11k_wmi_copy_resource_config(cfg, param->res_cfg);
 
@@ -2594,7 +2594,7 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cfg) - TLV_HDR_SIZE);
 
 	ptr += sizeof(*cfg);
-	host_mem_chunks = (struct wlan_host_mem_chunk *)(ptr + TLV_HDR_SIZE);
+	host_mem_chunks = ptr + TLV_HDR_SIZE;
 	len = sizeof(struct wlan_host_mem_chunk);
 
 	for (idx = 0; idx < param->num_mem_chunks; ++idx) {
@@ -3221,8 +3221,8 @@ static int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, u8 *evt_buf, u32
 	memset(peer_del_resp, 0, sizeof(*peer_del_resp));
 
 	peer_del_resp->vdev_id = ev->vdev_id;
-	ether_addr_copy((u8 *)&peer_del_resp->peer_macaddr,
-			(u8 *)&ev->peer_macaddr);
+	ether_addr_copy(peer_del_resp->peer_macaddr.addr,
+			ev->peer_macaddr.addr);
 
 	kfree(tb);
 	return 0;
@@ -4631,7 +4631,7 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 		ab->wlan_init_status = fixed_param->status;
 		rdy_parse->num_extra_mac_addr = fixed_param->num_extra_mac_addr;
 
-		ether_addr_copy(ab->mac_addr, (u8 *)&fixed_param->mac_addr);
+		ether_addr_copy(ab->mac_addr, fixed_param->mac_addr.addr);
 		ab->wmi_ready = true;
 		break;
 	case WMI_TAG_ARRAY_FIXED_STRUCT:
@@ -4643,7 +4643,7 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
-			ether_addr_copy(pdev->mac_addr, (u8 *)&addr_list[i]);
+			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);
 		}
 		ab->pdevs_macaddr_valid = true;
 		break;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
