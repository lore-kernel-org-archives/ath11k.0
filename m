Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2GW-0003PT-0b
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 18:58:33 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Remove unnecessary whitespaces
Date: Fri, 21 Jun 2019 00:28:12 +0530
Message-Id: <1561057092-32581-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/dp_tx.c:463: unnecessary whitespace before a quoted newline
drivers/net/wireless/ath/ath11k/wmi.c:2503: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2512: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2519: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2521: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2523: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2528: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2530: trailing whitespace
drivers/net/wireless/ath/ath11k/wmi.c:2724: trailing whitespace

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index ad67457..f7de1fb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -460,7 +460,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	if ((ath11k_hal_srng_dst_peek(ab, status_ring) != NULL) &&
 	    kfifo_is_full(&tx_ring->tx_status_fifo)) {
 		/* TODO: Process pending tx_status messages when kfifo_is_full() */
-		ath11k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full \n");
+		ath11k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full\n");
 	}
 
 	spin_unlock_bh(&tx_ring->tx_status_lock);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9778a02..c9a239e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2501,7 +2501,7 @@ static inline void ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 	wmi_cfg->scan_max_pending_req = tg_cfg->scan_max_pending_req;
 	wmi_cfg->bmiss_offload_max_vdev = tg_cfg->bmiss_offload_max_vdev;
 	wmi_cfg->roam_offload_max_vdev = tg_cfg->roam_offload_max_vdev;
-	wmi_cfg->roam_offload_max_ap_profiles = 
+	wmi_cfg->roam_offload_max_ap_profiles =
 		tg_cfg->roam_offload_max_ap_profiles;
 	wmi_cfg->num_mcast_groups = tg_cfg->num_mcast_groups;
 	wmi_cfg->num_mcast_table_elems = tg_cfg->num_mcast_table_elems;
@@ -2510,25 +2510,25 @@ static inline void ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 	wmi_cfg->num_wds_entries = tg_cfg->num_wds_entries;
 	wmi_cfg->dma_burst_size = tg_cfg->dma_burst_size;
 	wmi_cfg->mac_aggr_delim = tg_cfg->mac_aggr_delim;
-	wmi_cfg->rx_skip_defrag_timeout_dup_detection_check = 
+	wmi_cfg->rx_skip_defrag_timeout_dup_detection_check =
 		tg_cfg->rx_skip_defrag_timeout_dup_detection_check;
 	wmi_cfg->vow_config = tg_cfg->vow_config;
 	wmi_cfg->gtk_offload_max_vdev = tg_cfg->gtk_offload_max_vdev;
 	wmi_cfg->num_msdu_desc = tg_cfg->num_msdu_desc;
 	wmi_cfg->max_frag_entries = tg_cfg->max_frag_entries;
 	wmi_cfg->num_tdls_vdevs = tg_cfg->num_tdls_vdevs;
-	wmi_cfg->num_tdls_conn_table_entries = 
+	wmi_cfg->num_tdls_conn_table_entries =
 		tg_cfg->num_tdls_conn_table_entries;
-	wmi_cfg->beacon_tx_offload_max_vdev = 
+	wmi_cfg->beacon_tx_offload_max_vdev =
 		tg_cfg->beacon_tx_offload_max_vdev;
-	wmi_cfg->num_multicast_filter_entries = 
+	wmi_cfg->num_multicast_filter_entries =
 		tg_cfg->num_multicast_filter_entries;
 	wmi_cfg->num_wow_filters = tg_cfg->num_wow_filters;
 	wmi_cfg->num_keep_alive_pattern = tg_cfg->num_keep_alive_pattern;
 	wmi_cfg->keep_alive_pattern_size = tg_cfg->keep_alive_pattern_size;
-	wmi_cfg->max_tdls_concurrent_sleep_sta = 
+	wmi_cfg->max_tdls_concurrent_sleep_sta =
 		tg_cfg->max_tdls_concurrent_sleep_sta;
-	wmi_cfg->max_tdls_concurrent_buffer_sta = 
+	wmi_cfg->max_tdls_concurrent_buffer_sta =
 		tg_cfg->max_tdls_concurrent_buffer_sta;
 	wmi_cfg->wmi_send_separate = tg_cfg->wmi_send_separate;
 	wmi_cfg->num_ocb_vdevs = tg_cfg->num_ocb_vdevs;
@@ -2722,7 +2722,7 @@ int ath11k_wmi_cmd_init(struct ath11k_base *sc)
 	config.tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
 	config.num_wds_entries = TARGET_NUM_WDS_ENTRIES;
 	config.dma_burst_size = TARGET_DMA_BURST_SIZE;
-	config.rx_skip_defrag_timeout_dup_detection_check = 
+	config.rx_skip_defrag_timeout_dup_detection_check =
 		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
 	config.vow_config = TARGET_VOW_CONFIG;
 	config.gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
