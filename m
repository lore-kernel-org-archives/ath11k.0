Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4u-0008Kn-9t
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:38 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 14/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 wmi.c
Date: Thu,  8 Aug 2019 18:33:11 +0530
Message-Id: <1565269392-2838-15-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in wmi.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 94 +++++++++++++--------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7a74e0e0b80..a873ca1782c8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -205,7 +205,7 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 				      u32 cmd_id)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
-	struct ath11k_base *sc = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_sc->ab;
 	struct wmi_cmd_hdr *cmd_hdr;
 	int ret;
 	u32 cmd = 0;
@@ -219,7 +219,7 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	cmd_hdr->cmd_id = cmd;
 
 	memset(skb_cb, 0, sizeof(*skb_cb));
-	ret = ath11k_htc_send(&sc->htc, wmi->eid, skb);
+	ret = ath11k_htc_send(&ab->htc, wmi->eid, skb);
 
 	if (ret)
 		goto err_pull;
@@ -242,14 +242,14 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 	wait_event_timeout(wmi_sc->tx_credits_wq, ({
 		ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
-		if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH, &wmi_sc->sc->dev_flags))
+		if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH, &wmi_sc->ab->dev_flags))
 			ret = -ESHUTDOWN;
 
 		(ret != -EAGAIN);
 	}), WMI_SEND_TIMEOUT_HZ);
 
 	if (ret == -EAGAIN)
-		ath11k_warn(wmi_sc->sc, "wmi command %d timeout\n", cmd_id);
+		ath11k_warn(wmi_sc->ab, "wmi command %d timeout\n", cmd_id);
 
 	return ret;
 }
@@ -506,7 +506,7 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len)
 {
 	struct sk_buff *skb;
-	struct ath11k_base *ab = wmi_sc->sc;
+	struct ath11k_base *ab = wmi_sc->ab;
 	u32 round_len = roundup(len, 4);
 
 	skb = ath11k_htc_alloc_skb(ab, WMI_SKB_HEADROOM + round_len);
@@ -1346,7 +1346,7 @@ int ath11k_wmi_set_sta_ps_param(struct ath11k *ar, u32 vdev_id,
 int ath11k_send_crash_inject_cmd(struct ath11k_pdev_wmi *wmi_handle,
 				 struct crash_inject *param)
 {
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
+	struct ath11k_base *ab = wmi_handle->wmi_sc->ab;
 	struct wmi_force_fw_hang_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
@@ -2551,7 +2551,7 @@ ath11k_wmi_copy_resource_config(struct wmi_resource_config *wmi_cfg,
 static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 				struct wmi_init_cmd_param *param)
 {
-	struct ath11k_base *ab = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_sc->ab;
 	struct sk_buff *skb;
 	struct wmi_init_cmd *cmd;
 	struct wmi_resource_config *cfg;
@@ -2662,11 +2662,11 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 	return ret;
 }
 
-int ath11k_wmi_wait_for_service_ready(struct ath11k_base *sc)
+int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab)
 {
 	unsigned long time_left;
 
-	time_left = wait_for_completion_timeout(&sc->wmi_sc.service_ready,
+	time_left = wait_for_completion_timeout(&ab->wmi_sc.service_ready,
 						WMI_SERVICE_READY_TIMEOUT_HZ);
 	if (!time_left)
 		return -ETIMEDOUT;
@@ -2674,11 +2674,11 @@ int ath11k_wmi_wait_for_service_ready(struct ath11k_base *sc)
 	return 0;
 }
 
-int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *sc)
+int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab)
 {
 	unsigned long time_left;
 
-	time_left = wait_for_completion_timeout(&sc->wmi_sc.unified_ready,
+	time_left = wait_for_completion_timeout(&ab->wmi_sc.unified_ready,
 						WMI_SERVICE_READY_TIMEOUT_HZ);
 	if (!time_left)
 		return -ETIMEDOUT;
@@ -2686,21 +2686,21 @@ int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *sc)
 	return 0;
 }
 
-int ath11k_wmi_cmd_init(struct ath11k_base *sc)
+int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 {
-	struct ath11k_wmi_base *wmi_sc = &sc->wmi_sc;
+	struct ath11k_wmi_base *wmi_sc = &ab->wmi_sc;
 	struct wmi_init_cmd_param init_param;
 	struct target_resource_config  config;
 
 	memset(&init_param, 0, sizeof(init_param));
 	memset(&config, 0, sizeof(config));
 
-	config.num_vdevs = sc->num_radios * TARGET_NUM_VDEVS;
+	config.num_vdevs = ab->num_radios * TARGET_NUM_VDEVS;
 
-	if (sc->num_radios == 2) {
+	if (ab->num_radios == 2) {
 		config.num_peers = TARGET_NUM_PEERS(DBS);
 		config.num_tids = TARGET_NUM_TIDS(DBS);
-	} else if (sc->num_radios == 3) {
+	} else if (ab->num_radios == 3) {
 		config.num_peers = TARGET_NUM_PEERS(DBS_SBS);
 		config.num_tids = TARGET_NUM_TIDS(DBS_SBS);
 	} else {
@@ -2712,8 +2712,8 @@ int ath11k_wmi_cmd_init(struct ath11k_base *sc)
 	config.num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
 	config.num_peer_keys = TARGET_NUM_PEER_KEYS;
 	config.ast_skid_limit = TARGET_AST_SKID_LIMIT;
-	config.tx_chain_mask = (1 << sc->target_caps.num_rf_chains) - 1;
-	config.rx_chain_mask = (1 << sc->target_caps.num_rf_chains) - 1;
+	config.tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config.rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
 	config.rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
 	config.rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
 	config.rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
@@ -2734,7 +2734,7 @@ int ath11k_wmi_cmd_init(struct ath11k_base *sc)
 	config.vow_config = TARGET_VOW_CONFIG;
 	config.gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
 	config.num_msdu_desc = TARGET_NUM_MSDU_DESC;
-	config.beacon_tx_offload_max_vdev = sc->num_radios * TARGET_MAX_BCN_OFFLD;
+	config.beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
 	config.rx_batchmode = TARGET_RX_BATCHMODE;
 	config.peer_map_unmap_v2_support = 1;
 
@@ -2748,9 +2748,9 @@ int ath11k_wmi_cmd_init(struct ath11k_base *sc)
 	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE)
 		init_param.hw_mode_id = WMI_HOST_HW_MODE_MAX;
 
-	init_param.num_band_to_mac = sc->num_radios;
+	init_param.num_band_to_mac = ab->num_radios;
 
-	ath11k_fill_band_to_mac_param(sc, init_param.band_to_mac);
+	ath11k_fill_band_to_mac_param(ab, init_param.band_to_mac);
 
 	return ath11k_init_cmd_send(&wmi_sc->wmi[0], &init_param);
 }
@@ -4322,13 +4322,13 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 		buf[len] = 0;
 }
 
-static void ath11k_wmi_op_ep_tx_credits(struct ath11k_base *sc)
+static void ath11k_wmi_op_ep_tx_credits(struct ath11k_base *ab)
 {
 	/* try to send pending beacons first. they take priority */
-	wake_up(&sc->wmi_sc.tx_credits_wq);
+	wake_up(&ab->wmi_sc.tx_credits_wq);
 }
 
-static void ath11k_wmi_htc_tx_complete(struct ath11k_base *sc,
+static void ath11k_wmi_htc_tx_complete(struct ath11k_base *ab,
 				       struct sk_buff *skb)
 {
 	dev_kfree_skb(skb);
@@ -5434,7 +5434,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	dev_kfree_skb(skb);
 }
 
-static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
+static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 					   u32 pdev_idx)
 {
 	int status;
@@ -5456,16 +5456,16 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
 	/* connect to control service */
 	conn_req.service_id = svc_id[pdev_idx];
 
-	status = ath11k_htc_connect_service(&sc->htc, &conn_req, &conn_resp);
+	status = ath11k_htc_connect_service(&ab->htc, &conn_req, &conn_resp);
 	if (status) {
-		ath11k_warn(sc, "failed to connect to WMI CONTROL service status: %d\n",
+		ath11k_warn(ab, "failed to connect to WMI CONTROL service status: %d\n",
 			    status);
 		return status;
 	}
 
-	sc->wmi_sc.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
-	sc->wmi_sc.wmi[pdev_idx].eid = conn_resp.eid;
-	sc->wmi_sc.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
+	ab->wmi_sc.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
+	ab->wmi_sc.wmi[pdev_idx].eid = conn_resp.eid;
+	ab->wmi_sc.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
 
 	return 0;
 }
@@ -5564,22 +5564,22 @@ int ath11k_wmi_simulate_radar(struct ath11k *ar)
 	return ath11k_wmi_send_unit_test_cmd(ar, wmi_ut, dfs_args);
 }
 
-int ath11k_wmi_connect(struct ath11k_base *sc)
+int ath11k_wmi_connect(struct ath11k_base *ab)
 {
 	u32 i;
 	u8 wmi_ep_count;
 
-	wmi_ep_count = sc->htc.wmi_ep_count;
+	wmi_ep_count = ab->htc.wmi_ep_count;
 	if (wmi_ep_count > MAX_RADIOS)
 		return -1;
 
 	for (i = 0; i < wmi_ep_count; i++)
-		ath11k_connect_pdev_htc_service(sc, i);
+		ath11k_connect_pdev_htc_service(ab, i);
 
 	return 0;
 }
 
-static void ath11k_wmi_pdev_detach(struct ath11k_base *sc, u8 pdev_id)
+static void ath11k_wmi_pdev_detach(struct ath11k_base *ab, u8 pdev_id)
 {
 	if (WARN_ON(pdev_id >= MAX_RADIOS))
 		return;
@@ -5587,7 +5587,7 @@ static void ath11k_wmi_pdev_detach(struct ath11k_base *sc, u8 pdev_id)
 	/* TODO: Deinit any pdev specific wmi resource */
 }
 
-int ath11k_wmi_pdev_attach(struct ath11k_base *sc,
+int ath11k_wmi_pdev_attach(struct ath11k_base *ab,
 			   u8 pdev_id)
 {
 	struct ath11k_pdev_wmi *wmi_handle;
@@ -5595,40 +5595,40 @@ int ath11k_wmi_pdev_attach(struct ath11k_base *sc,
 	if (pdev_id >= MAX_RADIOS)
 		return -EINVAL;
 
-	wmi_handle = &sc->wmi_sc.wmi[pdev_id];
+	wmi_handle = &ab->wmi_sc.wmi[pdev_id];
 
-	wmi_handle->wmi_sc = &sc->wmi_sc;
+	wmi_handle->wmi_sc = &ab->wmi_sc;
 
-	sc->wmi_sc.sc = sc;
+	ab->wmi_sc.ab = ab;
 	/* TODO: Init remaining resource specific to pdev */
 
 	return 0;
 }
 
-int ath11k_wmi_attach(struct ath11k_base *sc)
+int ath11k_wmi_attach(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_wmi_pdev_attach(sc, 0);
+	ret = ath11k_wmi_pdev_attach(ab, 0);
 	if (ret)
 		return ret;
 
-	sc->wmi_sc.sc = sc;
-	sc->wmi_sc.preferred_hw_mode = WMI_HOST_HW_MODE_MAX;
+	ab->wmi_sc.ab = ab;
+	ab->wmi_sc.preferred_hw_mode = WMI_HOST_HW_MODE_MAX;
 
 	/* TODO: Init remaining wmi soc resources required */
-	init_completion(&sc->wmi_sc.service_ready);
-	init_completion(&sc->wmi_sc.unified_ready);
+	init_completion(&ab->wmi_sc.service_ready);
+	init_completion(&ab->wmi_sc.unified_ready);
 
 	return 0;
 }
 
-void ath11k_wmi_detach(struct ath11k_base *sc)
+void ath11k_wmi_detach(struct ath11k_base *ab)
 {
 	int i;
 
 	/* TODO: Deinit wmi resource specific to SOC as required */
 
-	for (i = 0; i < sc->htc.wmi_ep_count; i++)
-		ath11k_wmi_pdev_detach(sc, i);
+	for (i = 0; i < ab->htc.wmi_ep_count; i++)
+		ath11k_wmi_pdev_detach(ab, i);
 }
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
