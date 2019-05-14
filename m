Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPrj-00057C-MX
 for ath11k@lists.infradead.org; Tue, 14 May 2019 05:20:42 +0000
Received: from x230.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9151460128
 for <ath11k@lists.infradead.org>; Tue, 14 May 2019 05:20:36 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/3] ath11k: fix sparse symbol should be static warnings
Date: Tue, 14 May 2019 08:20:32 +0300
Message-Id: <1557811234-5439-1-git-send-email-kvalo@codeaurora.org>
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

Fixes warnings like:

drivers/net/wireless/ath/ath11k/wmi.c:203:5: warning: symbol 'ath11k_wmi_cmd_send_nowait' was not declared. Should it be static?

Also ath11k_dp_htt_rx_filter_setup() was declared in the wrong header file, fix that as well.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c |   2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |  31 +++---
 drivers/net/wireless/ath/ath11k/dp_rx.h |   4 -
 drivers/net/wireless/ath/ath11k/dp_tx.h |   6 ++
 drivers/net/wireless/ath/ath11k/wmi.c   | 170 ++++++++++++++++----------------
 5 files changed, 107 insertions(+), 106 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index b6e18938ba5e..441229ddd358 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -8,7 +8,7 @@
 #include "debug.h"
 #include "wmi.h"
 #include "hal_rx.h"
-#include "dp_rx.h"
+#include "dp_tx.h"
 
 void ath11k_info(struct ath11k_base *sc, const char *fmt, ...)
 {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c7582ce08899..f67b52bd40a7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2150,10 +2150,9 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
 }
 
-struct sk_buff *
-ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
-				  struct dp_rxdma_ring *rx_ring,
-				  int *buf_id, gfp_t gfp)
+static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
+							 struct dp_rxdma_ring *rx_ring,
+							 int *buf_id, gfp_t gfp)
 {
 	struct sk_buff *skb;
 	dma_addr_t paddr;
@@ -2261,8 +2260,8 @@ int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 }
 
-int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
-				      int *budget, struct sk_buff_head *skb_list)
+static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
+					     int *budget, struct sk_buff_head *skb_list)
 {
 	struct ath11k *ar = ab->pdevs[mac_id].ar;
 	struct ath11k_pdev_dp *dp = &ar->dp;
@@ -3680,10 +3679,10 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 	return NULL;
 }
 
-int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
-			     struct sk_buff *head_msdu,
-			     struct sk_buff *tail_msdu,
-			     struct napi_struct *napi)
+static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
+				    struct sk_buff *head_msdu,
+				    struct sk_buff *tail_msdu,
+				    struct napi_struct *napi)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct sk_buff *mon_skb, *skb_next, *header;
@@ -3731,8 +3730,8 @@ int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	return -EINVAL;
 }
 
-void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, u32 quota,
-				   struct napi_struct *napi)
+static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, u32 quota,
+					  struct napi_struct *napi)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
@@ -3837,8 +3836,8 @@ static inline void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	}
 }
 
-int ath11k_dp_mon_process_rx(struct ath11k_base *ab, int mac_id,
-			     struct napi_struct *napi, int budget)
+static int ath11k_dp_mon_process_rx(struct ath11k_base *ab, int mac_id,
+				    struct napi_struct *napi, int budget)
 {
 	struct ath11k *ar = ab->pdevs[mac_id].ar;
 	struct ath11k_pdev_dp *dp = &ar->dp;
@@ -3866,7 +3865,7 @@ int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
 	return ret;
 }
 
-int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
+static int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
@@ -3914,7 +3913,7 @@ int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar)
 	return 0;
 }
 
-int ath11k_dp_mon_link_free(struct ath11k *ar)
+static int ath11k_dp_mon_link_free(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = &dp->mon_data;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index cc66bc96b3db..5fe6e6d0431c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -374,10 +374,6 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 			   int (*iter)(struct ath11k_base *ar, u16 tag, u16 len,
 				       const void *ptr, void *data),
 			   void *data);
-int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
-				  int mac_id, enum hal_ring_type ring_type,
-				  int rx_buf_size,
-				  struct htt_rx_ring_tlv_filter *tlv_filter);
 int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
 				   struct napi_struct *napi, int budget);
 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index b2f33327ae30..751a0cec4997 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -30,4 +30,10 @@ int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 				    struct htt_ext_stats_cfg_params *cfg_params,
 				    u64 cookie);
 int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset);
+
+int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
+				  int mac_id, enum hal_ring_type ring_type,
+				  int rx_buf_size,
+				  struct htt_rx_ring_tlv_filter *tlv_filter);
+
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5712ac030419..a8ef1be6e7de 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -200,8 +200,8 @@ ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab, const void *ptr,
 	return tb;
 }
 
-int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
-			       u32 cmd_id)
+static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
+				      u32 cmd_id)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k_base *sc = wmi->wmi_sc->sc;
@@ -471,7 +471,7 @@ static int ath11k_wmi_tlv_svc_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len
 	return 0;
 }
 
-int ath11k_service_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_service_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_tlv_svc_ready_parse svc_ready = { };
 	int ret;
@@ -717,8 +717,8 @@ int ath11k_wmi_vdev_down(struct ath11k *ar, u8 vdev_id)
 	return ret;
 }
 
-void ath11k_wmi_put_wmi_channel(struct wmi_channel *chan,
-				struct wmi_vdev_start_req_arg *arg)
+static void ath11k_wmi_put_wmi_channel(struct wmi_channel *chan,
+				       struct wmi_vdev_start_req_arg *arg)
 {
 	memset(chan, 0, sizeof(*chan));
 
@@ -940,8 +940,8 @@ int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 	return ret;
 }
 
-int  ath11k_send_green_ap_ps_enable_cmd(struct ath11k_pdev_wmi *wmi_handle,
-					u32 value, u8 mac_id)
+static int ath11k_send_green_ap_ps_enable_cmd(struct ath11k_pdev_wmi *wmi_handle,
+					      u32 value, u8 mac_id)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_pdev_green_ap_ps_enable_cmd_param *cmd;
@@ -971,8 +971,8 @@ int  ath11k_send_green_ap_ps_enable_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	return ret;
 }
 
-int  ath11k_send_gpio_config_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				 struct gpio_config_params *param)
+static int ath11k_send_gpio_config_cmd(struct ath11k_pdev_wmi *wmi_handle,
+				       struct gpio_config_params *param)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_gpio_config_cmd_param *cmd;
@@ -1009,8 +1009,8 @@ int  ath11k_send_gpio_config_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	return ret;
 }
 
-int ath11k_send_gpio_output_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				struct gpio_output_params *param)
+static int ath11k_send_gpio_output_cmd(struct ath11k_pdev_wmi *wmi_handle,
+				       struct gpio_output_params *param)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_gpio_output_cmd_param *cmd;
@@ -1039,8 +1039,8 @@ int ath11k_send_gpio_output_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	return ret;
 }
 
-int ath11k_send_vdev_set_fwtest_param_cmd(struct ath11k_pdev_wmi *wmi_handle,
-					  struct set_fwtest_params *param)
+static int ath11k_send_vdev_set_fwtest_param_cmd(struct ath11k_pdev_wmi *wmi_handle,
+						 struct set_fwtest_params *param)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_fwtest_set_param_cmd_param *cmd;
@@ -2359,8 +2359,8 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	return ret;
 }
 
-int ath11k_send_set_sta_ps_mode_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				    u32 vdev_id, u8 val)
+static int ath11k_send_set_sta_ps_mode_cmd(struct ath11k_pdev_wmi *wmi_handle,
+					   u32 vdev_id, u8 val)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_sta_powersave_mode_cmd *cmd;
@@ -2393,8 +2393,8 @@ int ath11k_send_set_sta_ps_mode_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	return ret;
 }
 
-int ath11k_send_set_mimops_cmd(struct ath11k_pdev_wmi *wmi_handle,
-			       u8 vdev_id, int value)
+static int ath11k_send_set_mimops_cmd(struct ath11k_pdev_wmi *wmi_handle,
+				      u8 vdev_id, int value)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_sta_smps_force_mode_cmd *cmd;
@@ -2450,8 +2450,8 @@ int ath11k_send_set_mimops_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	return ret;
 }
 
-int ath11k_send_set_smps_params_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				    u8 vdev_id, int value)
+static int ath11k_send_set_smps_params_cmd(struct ath11k_pdev_wmi *wmi_handle,
+					   u8 vdev_id, int value)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_sta_smps_param_cmd *cmd;
@@ -2556,8 +2556,8 @@ int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
-int ath11k_send_bcn_buf_ll_cmd(struct ath11k_pdev_wmi *wmi_handle,
-			       struct wmi_bcn_send_from_host_cmd *param)
+static int ath11k_send_bcn_buf_ll_cmd(struct ath11k_pdev_wmi *wmi_handle,
+				      struct wmi_bcn_send_from_host_cmd *param)
 {
 	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
 	struct wmi_bcn_send_from_host_cmd *cmd;
@@ -3324,8 +3324,8 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 	return 0;
 }
 
-int ath11k_service_ready_ext_event(struct ath11k_base *ab,
-				   u8 *evt_buf, u32 len)
+static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
+					  u8 *evt_buf, u32 len)
 {
 	struct wmi_tlv_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
@@ -3341,8 +3341,8 @@ int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 	return 0;
 }
 
-int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, u8 *evt_buf, u32 len,
-				    struct wmi_vdev_start_resp_event *vdev_rsp)
+static int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+					   struct wmi_vdev_start_resp_event *vdev_rsp)
 {
 	const void **tb;
 	const struct wmi_vdev_start_resp_event *ev;
@@ -3415,10 +3415,10 @@ static struct cur_reg_rule
 	return reg_rule_ptr;
 }
 
-int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
-					u8 *evt_buf,
-					struct cur_regulatory_info *reg_info,
-					u32 len)
+static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
+					       u8 *evt_buf,
+					       struct cur_regulatory_info *reg_info,
+					       u32 len)
 {
 	const void **tb;
 	const struct wmi_reg_chan_list_cc_event *chan_list_event_hdr;
@@ -3529,8 +3529,8 @@ int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 	return 0;
 }
 
-int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
-				 struct wmi_peer_delete_resp_event *peer_del_resp)
+static int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
+					struct wmi_peer_delete_resp_event *peer_del_resp)
 {
 	const void **tb;
 	const struct wmi_peer_delete_resp_event *ev;
@@ -3560,9 +3560,9 @@ int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, u8 *evt_buf, u32 len,
 	return 0;
 }
 
-int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab, void *evt_buf,
-				 u32 len, u32 *vdev_id,
-				 u32 *tx_status)
+static int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab, void *evt_buf,
+					u32 len, u32 *vdev_id,
+					u32 *tx_status)
 {
 	const void **tb;
 	const struct wmi_bcn_tx_status_event *ev;
@@ -3589,8 +3589,8 @@ int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab, void *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, u8 *evt_buf,
-				       u32 len, u32 *vdev_id)
+static int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, u8 *evt_buf,
+					      u32 len, u32 *vdev_id)
 {
 	const void **tb;
 	const struct wmi_vdev_stopped_event *ev;
@@ -3616,9 +3616,9 @@ int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
-				   struct sk_buff *skb,
-				   struct mgmt_rx_event_params *hdr)
+static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
+					  struct sk_buff *skb,
+					  struct mgmt_rx_event_params *hdr)
 {
 	const void **tb;
 	const struct wmi_mgmt_rx_hdr *ev;
@@ -3703,9 +3703,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 	return 0;
 }
 
-int ath11k_pull_mgmt_tx_compl_param_tlv(struct ath11k_base *ab,
-					u8 *evt_buf, u32 len,
-					struct wmi_mgmt_tx_compl_event *param)
+static int ath11k_pull_mgmt_tx_compl_param_tlv(struct ath11k_base *ab,
+					       u8 *evt_buf, u32 len,
+					       struct wmi_mgmt_tx_compl_event *param)
 {
 	const void **tb;
 	const struct wmi_mgmt_tx_compl_event *ev;
@@ -3875,8 +3875,8 @@ ath11k_wmi_event_scan_type_str(enum wmi_scan_event_type type,
 	}
 }
 
-int ath11k_pull_scan_ev(struct ath11k_base *ab, u8 *evt_buf,
-			u32 len, struct wmi_scan_event *scan_evt_param)
+static int ath11k_pull_scan_ev(struct ath11k_base *ab, u8 *evt_buf,
+			       u32 len, struct wmi_scan_event *scan_evt_param)
 {
 	const void **tb;
 	const struct wmi_scan_event *ev;
@@ -3908,8 +3908,8 @@ int ath11k_pull_scan_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, u8 *evt_buf,
-				    u32 len, struct wmi_peer_sta_kickout_arg *arg)
+static int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, u8 *evt_buf,
+					   u32 len, struct wmi_peer_sta_kickout_arg *arg)
 {
 	const void **tb;
 	const struct wmi_peer_sta_kickout_event *ev;
@@ -3935,8 +3935,8 @@ int ath11k_pull_peer_sta_kickout_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_roam_ev(struct ath11k_base *ab, u8 *evt_buf,
-			u32 len, struct wmi_roam_event *roam_ev)
+static int ath11k_pull_roam_ev(struct ath11k_base *ab, u8 *evt_buf,
+			       u32 len, struct wmi_roam_event *roam_ev)
 {
 	const void **tb;
 	const struct wmi_roam_event *ev;
@@ -3983,8 +3983,8 @@ static int freq_to_idx(struct ath11k *ar, int freq)
 	return idx;
 }
 
-int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
-			     u32 len, struct wmi_chan_info_event *ch_info_ev)
+static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
+				    u32 len, struct wmi_chan_info_event *ch_info_ev)
 {
 	const void **tb;
 	const struct wmi_chan_info_event *ev;
@@ -4021,9 +4021,9 @@ int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
-				      u32 len,
-				      struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
+static int ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
+					     u32 len,
+					     struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
 {
 	const void **tb;
 	const struct wmi_pdev_bss_chan_info_event *ev;
@@ -4061,9 +4061,9 @@ int ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf,
-					  u32 len,
-					  struct wmi_vdev_install_key_complete_arg *install_key_compl)
+static int ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf,
+						 u32 len,
+						 struct wmi_vdev_install_key_complete_arg *install_key_compl)
 {
 	const void **tb;
 	const struct wmi_vdev_install_key_compl_event *ev;
@@ -4093,9 +4093,9 @@ int ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, u8 *evt_buf,
-				   u32 len,
-				   struct wmi_peer_assoc_conf_arg *peer_assoc_conf)
+static int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, u8 *evt_buf,
+					  u32 len,
+					  struct wmi_peer_assoc_conf_arg *peer_assoc_conf)
 {
 	const void **tb;
 	const struct wmi_peer_assoc_conf_event *ev;
@@ -4122,8 +4122,8 @@ int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-void ath11k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
-				     struct ath11k_fw_stats_pdev *dst)
+static void ath11k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
+					    struct ath11k_fw_stats_pdev *dst)
 {
 	dst->ch_noise_floor = src->chan_nf;
 	dst->tx_frame_count = src->tx_frame_count;
@@ -4163,8 +4163,8 @@ ath11k_wmi_pull_pdev_stats_tx(const struct wmi_pdev_stats_tx *src,
 	dst->txop_ovf = src->txop_ovf;
 }
 
-void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
-				   struct ath11k_fw_stats_pdev *dst)
+static void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
+					  struct ath11k_fw_stats_pdev *dst)
 {
 	dst->mid_ppdu_route_change = src->mid_ppdu_route_change;
 	dst->status_rcvd = src->status_rcvd;
@@ -4439,7 +4439,7 @@ size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head)
 	return num;
 }
 
-size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
+static size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
 {
 	struct ath11k_fw_stats_bcn *i;
 	size_t num = 0;
@@ -4853,7 +4853,7 @@ static bool ath11k_reg_is_world_alpha(char *alpha)
 	return alpha[0] == '0' && alpha[1] == '0';
 }
 
-int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct cur_regulatory_info *reg_info = NULL;
 	struct ieee80211_regdomain *regd = NULL;
@@ -4998,7 +4998,7 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 	return 0;
 }
 
-int ath11k_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static int ath11k_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_tlv_rdy_parse rdy_parse = { };
 	int ret;
@@ -5014,7 +5014,7 @@ int ath11k_ready_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	return 0;
 }
 
-void ath11k_peer_delete_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_peer_delete_resp_event peer_del_resp;
 
@@ -5044,7 +5044,7 @@ static inline const char *ath11k_wmi_vdev_resp_print(u32 vdev_resp_status)
 	}
 }
 
-void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_vdev_start_resp_event vdev_start_resp;
 	struct ath11k *ar;
@@ -5083,7 +5083,7 @@ void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 		   vdev_start_resp.vdev_id);
 }
 
-void ath11k_bcn_tx_status_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	u32 vdev_id, tx_status;
 
@@ -5094,7 +5094,7 @@ void ath11k_bcn_tx_status_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	}
 }
 
-void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct ath11k *ar;
 	u32 vdev_id;
@@ -5121,7 +5121,7 @@ void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "vdev stopped for vdev id %d", vdev_id);
 }
 
-void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
+static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct mgmt_rx_event_params rx_ev;
 	struct ath11k *ar;
@@ -5230,7 +5230,7 @@ void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 	rcu_read_unlock();
 }
 
-void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *skb)
+static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_mgmt_tx_compl_event tx_compl_param;
 	struct ath11k *ar;
@@ -5261,7 +5261,7 @@ void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *skb)
 	rcu_read_unlock();
 }
 
-void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct ath11k *ar;
 	struct wmi_scan_event scan_ev;
@@ -5320,7 +5320,7 @@ void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_peer_sta_kickout_arg arg = {};
 	struct ieee80211_sta *sta;
@@ -5369,7 +5369,7 @@ void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_roam_event roam_ev;
 	struct ath11k *ar;
@@ -5415,7 +5415,7 @@ void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_chan_info_event ch_info_ev;
 	struct ath11k *ar;
@@ -5488,7 +5488,7 @@ void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
+static void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
 				     u32 len)
 {
 	struct wmi_pdev_bss_chan_info_event bss_ch_info_ev;
@@ -5562,8 +5562,8 @@ void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
 	rcu_read_unlock();
 }
 
-void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_buf,
-					 u32 len)
+static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_buf,
+						u32 len)
 {
 	struct wmi_vdev_install_key_complete_arg install_key_compl;
 	struct ath11k *ar;
@@ -5601,8 +5601,8 @@ void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_buf,
 	rcu_read_unlock();
 }
 
-void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
-				    u32 len)
+static void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
+					   u32 len)
 {
 	const void **tb;
 	const struct wmi_service_available_event *ev;
@@ -5637,7 +5637,7 @@ void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
 	kfree(tb);
 }
 
-void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_peer_assoc_conf_arg peer_assoc_conf;
 	struct ath11k *ar;
@@ -5663,7 +5663,7 @@ void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	complete(&ar->peer_assoc_done);
 }
 
-void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	ath11k_debug_fw_stats_process(ab, evt_buf, len);
 }
@@ -5671,8 +5671,8 @@ void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the frequency scanned
  * is not part of BDF CTL(Conformance test limits) table entries.
  */
-void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt_buf,
-					  u32 len)
+static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt_buf,
+						 u32 len)
 {
 	const void **tb;
 	const struct wmi_pdev_ctl_failsafe_chk_event *ev;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
