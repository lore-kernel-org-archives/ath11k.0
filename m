Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heDkM-0002zn-N6
 for ath11k@lists.infradead.org; Fri, 21 Jun 2019 07:14:11 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: fix line over 90 characters warnings
Date: Fri, 21 Jun 2019 12:43:53 +0530
Message-Id: <1561101233-19618-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

This patch fix line over 90 characters warings.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 261 ++++++++++++++--------
 drivers/net/wireless/ath/ath11k/debugfs_sta.c     |  12 +-
 drivers/net/wireless/ath/ath11k/dp.c              |   7 +-
 drivers/net/wireless/ath/ath11k/dp.h              |  61 ++---
 drivers/net/wireless/ath/ath11k/dp_rx.c           |  18 +-
 drivers/net/wireless/ath/ath11k/wmi.c             |  20 +-
 6 files changed, 243 insertions(+), 136 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index cd8510c..190e87e 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -309,7 +309,8 @@ static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const u32 *tag_buf,
 	char sifs_hist_status[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_SIFS_BURST_HIST_STATS);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_SIFS_HIST_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_PDEV_STATS_SIFS_HIST_TLV_V:");
 
 	ARRAY_TO_STRING(sifs_hist_status, htt_stats_buf->sifs_hist_status, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sifs_hist_status = %s\n",
@@ -334,7 +335,8 @@ static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const u32 *tag_bu
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_TX_PPDU_STATS_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_PDEV_STATS_TX_PPDU_STATS_TLV_V:");
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "num_data_ppdus_legacy_su = %u",
 			   htt_stats_buf->num_data_ppdus_legacy_su);
@@ -375,7 +377,8 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
 	u32  num_elements = ((tag_len - sizeof(htt_stats_buf->hist_bin_size)) >> 2);
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_TRIED_MPDU_CNT_HIST_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_PDEV_STATS_TRIED_MPDU_CNT_HIST_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u",
 			   htt_stats_buf->hist_bin_size);
 
@@ -386,7 +389,8 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "tried_mpdu_cnt_hist = %s\n",
 				   tried_mpdu_cnt_hist);
 	} else {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "INSUFFICIENT PRINT BUFFER\n");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "INSUFFICIENT PRINT BUFFER\n");
 	}
 
 	if (len >= buf_len)
@@ -782,7 +786,8 @@ static inline void htt_print_peer_details_tlv(const u32 *tag_buf, u8 *data)
 			   (htt_stats_buf->vdev_pdev_ast_idx & 0xFF00) >> 8);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ast_idx = %u",
 			   (htt_stats_buf->vdev_pdev_ast_idx & 0xFFFF0000) >> 16);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_addr = %02x:%02x:%02x:%02x:%02x:%02x",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "mac_addr = %02x:%02x:%02x:%02x:%02x:%02x",
 			   htt_stats_buf->mac_addr.mac_addr_l32 & 0xFF,
 			   (htt_stats_buf->mac_addr.mac_addr_l32 & 0xFF00) >> 8,
 			   (htt_stats_buf->mac_addr.mac_addr_l32 & 0xFF0000) >> 16,
@@ -1017,7 +1022,8 @@ static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_MU_MIMO_MPDU_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_MU_MIMO_MPDU_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mu_mimo_mpdus_queued_usr = %u",
 			   htt_stats_buf->mu_mimo_mpdus_queued_usr);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mu_mimo_mpdus_tried_usr = %u",
@@ -1145,7 +1151,8 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
 	u16 data_len = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS);
 	char difs_latency_hist[HTT_MAX_STRING_LEN] = {0};
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_DIFS_LATENCY_STATS_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_DIFS_LATENCY_STATS_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "hist_intvl = %u",
 			htt_stats_buf->hist_intvl);
 
@@ -1178,7 +1185,8 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
 
 	data_len = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_CMD_RESULT_STATS);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_CMD_RESULT_STATS_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_CMD_RESULT_STATS_TLV_V:");
 
 	ARRAY_TO_STRING(cmd_result, htt_stats_buf->cmd_result, data_len);
 
@@ -1238,7 +1246,8 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf,
 
 	num_elems = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_FES_RESULT_STATS);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_FES_RESULT_STATS_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_FES_RESULT_STATS_TLV_V:");
 
 	ARRAY_TO_STRING(fes_result, htt_stats_buf->fes_result, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fes_result = %s\n", fes_result);
@@ -1267,7 +1276,8 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 			    sizeof(htt_stats_buf->hist_bin_size)) >> 2);
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_TRIED_MPDU_CNT_HIST_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_TRIED_MPDU_CNT_HIST_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u",
 			   htt_stats_buf->hist_bin_size);
 
@@ -1279,7 +1289,8 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 				   "tried_mpdu_cnt_hist = %s\n",
 				   tried_mpdu_cnt_hist);
 	} else {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "INSUFFICIENT PRINT BUFFER ");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "INSUFFICIENT PRINT BUFFER ");
 	}
 
 	if (len >= buf_len)
@@ -1305,7 +1316,8 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
 	u32 num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_TXOP_USED_CNT_HIST_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_HWQ_TXOP_USED_CNT_HIST_TLV_V:");
 
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
 		ARRAY_TO_STRING(txop_used_cnt_hist,
@@ -1314,7 +1326,8 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "txop_used_cnt_hist = %s\n",
 				   txop_used_cnt_hist);
 	} else {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "INSUFFICIENT PRINT BUFFER ");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "INSUFFICIENT PRINT BUFFER ");
 	}
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1340,26 +1353,31 @@ static inline void htt_print_tx_sounding_stats_tlv(const u32 *tag_buf, u8 *data)
 	u32 *cbf_160 = htt_stats_buf->cbf_160;
 
 	if (htt_stats_buf->tx_sounding_mode == HTT_TX_AC_SOUNDING_MODE) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "\nHTT_TX_AC_SOUNDING_STATS_TLV:\n");
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_cbf_20 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u ",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "\nHTT_TX_AC_SOUNDING_STATS_TLV:\n");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_cbf_20 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u ",
 				   cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS],
 				   cbf_20[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
 				   cbf_20[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
 				   cbf_20[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
 				   cbf_20[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_cbf_40 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_cbf_40 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
 				   cbf_40[HTT_IMPLICIT_TXBF_STEER_STATS],
 				   cbf_40[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
 				   cbf_40[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
 				   cbf_40[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
 				   cbf_40[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_cbf_80 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_cbf_80 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
 				   cbf_80[HTT_IMPLICIT_TXBF_STEER_STATS],
 				   cbf_80[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
 				   cbf_80[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
 				   cbf_80[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
 				   cbf_80[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_cbf_160 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_cbf_160 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u",
 				   cbf_160[HTT_IMPLICIT_TXBF_STEER_STATS],
 				   cbf_160[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
 				   cbf_160[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
@@ -1376,7 +1394,8 @@ static inline void htt_print_tx_sounding_stats_tlv(const u32 *tag_buf, u8 *data)
 					   htt_stats_buf->sounding[3]);
 		}
 	} else if (htt_stats_buf->tx_sounding_mode == HTT_TX_AX_SOUNDING_MODE) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "\nHTT_TX_AX_SOUNDING_STATS_TLV:\n");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "\nHTT_TX_AX_SOUNDING_STATS_TLV:\n");
 		len += HTT_DBG_OUT(buf + len, buf_len - len,
 				   "ax_cbf_20 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u ",
 				   cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS],
@@ -1649,7 +1668,8 @@ static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	u8 i;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mu_mimo_sch_posted = %u",
 			   htt_stats_buf->mu_mimo_sch_posted);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mu_mimo_sch_failed = %u",
@@ -1660,19 +1680,22 @@ static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "11ac MU_MIMO SCH STATS:");
 
 	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS; i++)
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_sch_nusers_%u = %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_mu_mimo_sch_nusers_%u = %u",
 				   i, htt_stats_buf->ac_mu_mimo_sch_nusers[i]);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "\n11ax MU_MIMO SCH STATS:");
 
 	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS; i++)
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_sch_nusers_%u = %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ax_mu_mimo_sch_nusers_%u = %u",
 				   i, htt_stats_buf->ax_mu_mimo_sch_nusers[i]);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "\n11ax OFDMA SCH STATS:");
 
 	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS; i++)
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_ofdma_sch_nusers_%u = %u",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ax_ofdma_sch_nusers_%u = %u",
 				   i, htt_stats_buf->ax_ofdma_sch_nusers[i]);
 
 	if (len >= buf_len)
@@ -1695,29 +1718,37 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 
 	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC) {
 		if (!htt_stats_buf->user_index)
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:\n");
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:\n");
 
 		if (htt_stats_buf->user_index <
 		    HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS) {
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_mpdus_queued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_mpdus_queued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_queued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_mpdus_tried_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_mpdus_tried_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_tried_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_mpdus_failed_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_mpdus_failed_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_failed_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_mpdus_requeued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_mpdus_requeued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_requeued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_err_no_ba_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_err_no_ba_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->err_no_ba_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_mpdu_underrun_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_mpdu_underrun_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdu_underrun_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_ampdu_underrun_usr_%u = %u\n",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ac_mu_mimo_ampdu_underrun_usr_%u = %u\n",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->ampdu_underrun_usr);
 		}
@@ -1725,29 +1756,37 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 
 	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AX) {
 		if (!htt_stats_buf->user_index)
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:\n");
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:\n");
 
 		if (htt_stats_buf->user_index <
 		    HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS) {
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_mpdus_queued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_mpdus_queued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_queued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_mpdus_tried_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_mpdus_tried_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_tried_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_mpdus_failed_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_mpdus_failed_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_failed_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_mpdus_requeued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_mpdus_requeued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_requeued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_err_no_ba_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_err_no_ba_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->err_no_ba_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_mpdu_underrun_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_mpdu_underrun_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdu_underrun_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_ampdu_underrun_usr_%u = %u\n",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_mimo_ampdu_underrun_usr_%u = %u\n",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->ampdu_underrun_usr);
 		}
@@ -1755,28 +1794,36 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 
 	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX) {
 		if (!htt_stats_buf->user_index)
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:\n");
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:\n");
 
 		if (htt_stats_buf->user_index < HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS) {
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_mpdus_queued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_mpdus_queued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_queued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_mpdus_tried_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_mpdus_tried_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_tried_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_mpdus_failed_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_mpdus_failed_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_failed_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_mpdus_requeued_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_mpdus_requeued_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdus_requeued_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_err_no_ba_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_err_no_ba_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->err_no_ba_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_mpdu_underrun_usr_%u = %u",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_mpdu_underrun_usr_%u = %u",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->mpdu_underrun_usr);
-			len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_ofdma_ampdu_underrun_usr_%u = %u\n",
+			len += HTT_DBG_OUT(buf + len, buf_len - len,
+					   "ax_mu_ofdma_ampdu_underrun_usr_%u = %u\n",
 					   htt_stats_buf->user_index,
 					   htt_stats_buf->ampdu_underrun_usr);
 		}
@@ -1864,7 +1911,8 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
 	u32 sched_order_su_num_entries =
 		min_t(u32, (tag_len >> 2), HTT_TX_PDEV_NUM_SCHED_ORDER_LOG);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_SCHED_ORDER_SU_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_SCHED_TXQ_SCHED_ORDER_SU_TLV_V:");
 
 	ARRAY_TO_STRING(sched_order_su, htt_stats_buf->sched_order_su,
 			sched_order_su_num_entries);
@@ -1894,7 +1942,8 @@ static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const u32 *tag_
 	/* each entry is u32, i.e. 4 bytes */
 	u32 sched_ineligibility_num_entries = tag_len >> 2;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_SCHED_INELIGIBILITY_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_SCHED_TXQ_SCHED_INELIGIBILITY_V:");
 
 	ARRAY_TO_STRING(sched_ineligibility, htt_stats_buf->sched_ineligibility,
 			sched_ineligibility_num_entries);
@@ -1920,16 +1969,19 @@ static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const u32 *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_SCHED_PER_TXQ_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_PDEV_STATS_SCHED_PER_TXQ_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
 			   htt_stats_buf->mac_id__txq_id__word & 0xFF);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "txq_id = %u",
 			   (htt_stats_buf->mac_id__txq_id__word & 0xFF00) >> 8);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_policy = %u",
 			   htt_stats_buf->sched_policy);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "last_sched_cmd_posted_timestamp = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "last_sched_cmd_posted_timestamp = %u",
 			   htt_stats_buf->last_sched_cmd_posted_timestamp);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "last_sched_cmd_compl_timestamp = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "last_sched_cmd_compl_timestamp = %u",
 			   htt_stats_buf->last_sched_cmd_compl_timestamp);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_2_tac_lwm_count = %u",
 			   htt_stats_buf->sched_2_tac_lwm_count);
@@ -2011,7 +2063,8 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf,
 	struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf =
 		(struct htt_tx_tqm_gen_mpdu_stats_tlv_v *)tag_buf;
 	char gen_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
-	u16 num_elements = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
+	u16 num_elements = min_t(u16, (tag_len >> 2),
+				 HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_GEN_MPDU_STATS_TLV_V:");
 
@@ -2042,7 +2095,8 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf,
 	char list_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_LIST_MPDU_STATS_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_TQM_LIST_MPDU_STATS_TLV_V:");
 
 	ARRAY_TO_STRING(list_mpdu_end_reason, htt_stats_buf->list_mpdu_end_reason,
 			num_elems);
@@ -2286,7 +2340,8 @@ static inline void htt_print_tx_de_eapol_packets_stats_tlv(const u32 *tag_buf, u
 	struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf =
 		(struct htt_tx_de_eapol_packets_stats_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "m1_packets = %u",
 			   htt_stats_buf->m1_packets);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "m2_packets = %u",
@@ -2318,7 +2373,8 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const u32 *tag_buf,
 	struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf =
 		(struct htt_tx_de_classify_failed_stats_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ap_bss_peer_not_found = %u",
 			   htt_stats_buf->ap_bss_peer_not_found);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ap_bcast_mcast_no_peer = %u",
@@ -2450,7 +2506,8 @@ static inline void htt_print_tx_de_classify_status_stats_tlv(const u32 *tag_buf,
 	struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf =
 		(struct htt_tx_de_classify_status_stats_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "eok = %u",
 			   htt_stats_buf->eok);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "classify_done = %u",
@@ -2486,7 +2543,8 @@ static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const u32 *tag_buf,
 	struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf =
 		(struct htt_tx_de_enqueue_packets_stats_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "enqueued_pkts = %u",
 			htt_stats_buf->enqueued_pkts);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "to_tqm = %u",
@@ -2512,7 +2570,8 @@ static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const u32 *tag_buf,
 	struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf =
 		(struct htt_tx_de_enqueue_discard_stats_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "discarded_pkts = %u",
 			   htt_stats_buf->discarded_pkts);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "local_frames = %u",
@@ -2573,16 +2632,19 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf,
 	u16  num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_FW2WBM_RING_FULL_HIST_TLV");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_TX_DE_FW2WBM_RING_FULL_HIST_TLV");
 
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
 		ARRAY_TO_STRING(fw2wbm_ring_full_hist,
 				htt_stats_buf->fw2wbm_ring_full_hist,
 				num_elements);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "fw2wbm_ring_full_hist = %s\n",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "fw2wbm_ring_full_hist = %s\n",
 				   fw2wbm_ring_full_hist);
 	} else {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "INSUFFICIENT PRINT BUFFER ");
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "INSUFFICIENT PRINT BUFFER ");
 	}
 
 	if (len >= buf_len)
@@ -2920,13 +2982,15 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ack_rssi = %u",
 			   htt_stats_buf->ack_rssi);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "Legacy CCK Rates: 1 Mbps: %u, 2 Mbps: %u, 5.5 Mbps: %u, 11 Mbps: %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "Legacy CCK Rates: 1 Mbps: %u, 2 Mbps: %u, 5.5 Mbps: %u, 11 Mbps: %u",
 			   htt_stats_buf->tx_legacy_cck_rate[0],
 			   htt_stats_buf->tx_legacy_cck_rate[1],
 			   htt_stats_buf->tx_legacy_cck_rate[2],
 			   htt_stats_buf->tx_legacy_cck_rate[3]);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "Legacy OFDM Rates: 6 Mbps: %u, 9 Mbps: %u, 12 Mbps: %u, 18 Mbps: %u\n"
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "Legacy OFDM Rates: 6 Mbps: %u, 9 Mbps: %u, 12 Mbps: %u, 18 Mbps: %u\n"
 			   "                   24 Mbps: %u, 36 Mbps: %u, 48 Mbps: %u, 54 Mbps: %u",
 			   htt_stats_buf->tx_legacy_ofdm_rate[0],
 			   htt_stats_buf->tx_legacy_ofdm_rate[1],
@@ -3024,7 +3088,8 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
 		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->ac_mu_mimo_tx_gi[j],
 				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_tx_gi[%u] = %s ",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ac_mu_mimo_tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
@@ -3032,7 +3097,8 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
 		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->ax_mu_mimo_tx_gi[j],
 				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_tx_gi[%u] = %s ",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "ax_mu_mimo_tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
@@ -3201,13 +3267,17 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
 			   htt_stats_buf->fw_to_host_data_msdu_bcmc);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_to_host_data_msdu_uc = %u",
 			   htt_stats_buf->fw_to_host_data_msdu_uc);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofld_remote_data_buf_recycle_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "ofld_remote_data_buf_recycle_cnt = %u",
 			   htt_stats_buf->ofld_remote_data_buf_recycle_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofld_remote_free_buf_indication_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "ofld_remote_free_buf_indication_cnt = %u",
 			   htt_stats_buf->ofld_remote_free_buf_indication_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofld_buf_to_host_data_msdu_uc = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "ofld_buf_to_host_data_msdu_uc = %u",
 			   htt_stats_buf->ofld_buf_to_host_data_msdu_uc);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "reo_fw_ring_to_host_data_msdu_uc = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "reo_fw_ring_to_host_data_msdu_uc = %u",
 			   htt_stats_buf->reo_fw_ring_to_host_data_msdu_uc);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "wbm_sw_ring_reap = %u",
 			   htt_stats_buf->wbm_sw_ring_reap);
@@ -3215,7 +3285,8 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
 			   htt_stats_buf->wbm_forward_to_host_cnt);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "wbm_target_recycle_cnt = %u",
 			   htt_stats_buf->wbm_target_recycle_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "target_refill_ring_recycle_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "target_refill_ring_recycle_cnt = %u",
 			   htt_stats_buf->target_refill_ring_recycle_cnt);
 
 	if (len >= buf_len)
@@ -3240,7 +3311,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_bu
 	char refill_ring_empty_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV_V:");
 
 	ARRAY_TO_STRING(refill_ring_empty_cnt,
 			htt_stats_buf->refill_ring_empty_cnt,
@@ -3271,7 +3343,8 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32 *tag_buf,
 	char rxdma_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_RXDMA_MAX_ERR_CODE);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV_V:");
 
 	ARRAY_TO_STRING(rxdma_err_cnt,
 			htt_stats_buf->rxdma_err,
@@ -3301,7 +3374,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const u32 *
 	char reo_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_REO_MAX_ERR_CODE);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV_V:");
 
 	ARRAY_TO_STRING(reo_err_cnt,
 			htt_stats_buf->reo_err,
@@ -3372,7 +3446,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const u32 *t
 	char refill_ring_num_refill[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV_V:");
 
 	ARRAY_TO_STRING(refill_ring_num_refill,
 			htt_stats_buf->refill_ring_num_refill,
@@ -3445,11 +3520,13 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 			   htt_stats_buf->fw_ring_mpdu_drop);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofld_local_data_ind_cnt = %u",
 			   htt_stats_buf->ofld_local_data_ind_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofld_local_data_buf_recycle_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "ofld_local_data_buf_recycle_cnt = %u",
 			   htt_stats_buf->ofld_local_data_buf_recycle_cnt);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "drx_local_data_ind_cnt = %u",
 			   htt_stats_buf->drx_local_data_ind_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "drx_local_data_buf_recycle_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "drx_local_data_buf_recycle_cnt = %u",
 			   htt_stats_buf->drx_local_data_buf_recycle_cnt);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "local_nondata_ind_cnt = %u",
 			   htt_stats_buf->local_nondata_ind_cnt);
@@ -3475,7 +3552,8 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 			   htt_stats_buf->mon_pkt_buf_ring_refill_cnt);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mon_pkt_buf_ring_empty_cnt = %u",
 			   htt_stats_buf->mon_pkt_buf_ring_empty_cnt);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "mon_status_buf_ring_refill_cnt = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "mon_status_buf_ring_refill_cnt = %u",
 			   htt_stats_buf->mon_status_buf_ring_refill_cnt);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mon_status_buf_ring_empty_cnt = %u",
 			   htt_stats_buf->mon_status_buf_ring_empty_cnt);
@@ -3524,7 +3602,8 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const u32 *tag_buf,
 		(struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *)tag_buf;
 	char fw_ring_mpdu_err[HTT_MAX_STRING_LEN] = {0};
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV_V:");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV_V:");
 
 	ARRAY_TO_STRING(fw_ring_mpdu_err,
 			htt_stats_buf->fw_ring_mpdu_err,
@@ -3621,7 +3700,8 @@ static inline void htt_print_pdev_cca_stats_hist_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "collection_interval = %u\n",
 			   htt_stats_buf->collection_interval);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_CCA_COUNTERS_TLV:(in usec)");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HTT_PDEV_STATS_CCA_COUNTERS_TLV:(in usec)");
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "|  tx_frame|   rx_frame|   rx_clear| my_rx_frame|        cnt| med_rx_idle| med_tx_idle_global|   cca_obss|");
 
@@ -3643,7 +3723,8 @@ static inline void htt_print_pdev_stats_cca_counters_tlv(const u32 *tag_buf, u8
 	struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf =
 			(struct htt_pdev_stats_cca_counters_tlv *)tag_buf;
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "|%10u| %10u| %10u| %11u| %10u| %11u| %18u| %10u|",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "|%10u| %10u| %10u| %11u| %10u| %11u| %18u| %10u|",
 			   htt_stats_buf->tx_frame_usec,
 			   htt_stats_buf->rx_frame_usec,
 			   htt_stats_buf->rx_clear_usec,
@@ -3681,7 +3762,8 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const u32 *tag_buf,
 			   htt_stats_buf->hwsch_unpause_wait_tqm_write);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "hwsch_dummy_tlv_skipped = %u",
 			   htt_stats_buf->hwsch_dummy_tlv_skipped);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "hwsch_misaligned_offset_received = %u",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "hwsch_misaligned_offset_received = %u",
 			   htt_stats_buf->hwsch_misaligned_offset_received);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "hwsch_reset_count = %u",
 			   htt_stats_buf->hwsch_reset_count);
@@ -3745,7 +3827,8 @@ static inline void htt_print_pdev_stats_twt_session_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSION_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "vdev_id = %u",
 			   htt_stats_buf->vdev_id);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "peer_mac = %02x:%02x:%02x:%02x:%02x:%02x",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "peer_mac = %02x:%02x:%02x:%02x:%02x:%02x",
 			   htt_stats_buf->peer_mac.mac_addr_l32 & 0xFF,
 			   (htt_stats_buf->peer_mac.mac_addr_l32 & 0xFF00) >> 8,
 			   (htt_stats_buf->peer_mac.mac_addr_l32 & 0xFF0000) >> 16,
@@ -3806,12 +3889,15 @@ static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
 
 	tlv_len  = FIELD_GET(HTT_TLV_LEN, *tag_buf) + HTT_TLV_HDR_LEN;
 	word_len = (tlv_len % 4) == 0 ? (tlv_len / 4) : ((tlv_len / 4) + 1);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "============================================");
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HKDBG TLV DUMP: (tag_len=%u bytes, words=%u)",
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "============================================");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "HKDBG TLV DUMP: (tag_len=%u bytes, words=%u)",
 			   tlv_len, word_len);
 
 	for (i = 0; i + 3 < word_len; i += 4) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "0x%08x 0x%08x 0x%08x 0x%08x",
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "0x%08x 0x%08x 0x%08x 0x%08x",
 				   tag_buf[i], tag_buf[i + 1],
 				   tag_buf[i + 2], tag_buf[i + 3]);
 	}
@@ -3826,7 +3912,8 @@ static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "0x%08x ",
 				tag_buf[i]);
 	}
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "============================================");
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "============================================");
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 5529c06..4a30293 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -361,19 +361,23 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 			 rx_stats->num_mpdu_fcs_ok);
 	len += scnprintf(buf + len, size - len, "Num of MPDUs with FCS error: %llu\n",
 			 rx_stats->num_mpdu_fcs_err);
-	len += scnprintf(buf + len, size - len, "GI: 0.8us %llu 0.4us %llu 1.6us %llu 3.2us %llu\n",
+	len += scnprintf(buf + len, size - len,
+			 "GI: 0.8us %llu 0.4us %llu 1.6us %llu 3.2us %llu\n",
 			 rx_stats->gi_count[0], rx_stats->gi_count[1],
 			 rx_stats->gi_count[2], rx_stats->gi_count[3]);
-	len += scnprintf(buf + len, size - len, "BW: 20Mhz %llu 40Mhz %llu 80Mhz %llu 160Mhz %llu\n",
+	len += scnprintf(buf + len, size - len,
+			 "BW: 20Mhz %llu 40Mhz %llu 80Mhz %llu 160Mhz %llu\n",
 			 rx_stats->bw_count[0], rx_stats->bw_count[1],
 			 rx_stats->bw_count[2], rx_stats->bw_count[3]);
 	len += scnprintf(buf + len, size - len, "BCC %llu LDPC %llu\n",
 			 rx_stats->coding_count[0], rx_stats->coding_count[1]);
-	len += scnprintf(buf + len, size - len, "preamble: 11A %llu 11B %llu 11N %llu 11AC %llu 11AX %llu\n",
+	len += scnprintf(buf + len, size - len,
+			 "preamble: 11A %llu 11B %llu 11N %llu 11AC %llu 11AX %llu\n",
 			 rx_stats->pream_cnt[0], rx_stats->pream_cnt[1],
 			 rx_stats->pream_cnt[2], rx_stats->pream_cnt[3],
 			 rx_stats->pream_cnt[4]);
-	len += scnprintf(buf + len, size - len, "reception type: SU %llu MU_MIMO %llu MU_OFDMA %llu MU_OFDMA_MIMO %llu\n",
+	len += scnprintf(buf + len, size - len,
+			 "reception type: SU %llu MU_MIMO %llu MU_OFDMA %llu MU_OFDMA_MIMO %llu\n",
 			 rx_stats->reception_type[0], rx_stats->reception_type[1],
 			 rx_stats->reception_type[2], rx_stats->reception_type[3]);
 	len += scnprintf(buf + len, size - len, "TID(0-15) Legacy TID(16):");
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index c4770bb..2d61daf 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -435,9 +435,10 @@ static int ath11k_dp_link_desc_bank_alloc(struct ath11k_base *ab,
 		if (i == (n_link_desc_bank - 1) && last_bank_sz)
 			desc_sz = last_bank_sz;
 
-		desc_bank[i].vaddr_unaligned = dma_alloc_coherent(ab->dev, desc_sz,
-								  &desc_bank[i].paddr_unaligned,
-								  GFP_KERNEL);
+		desc_bank[i].vaddr_unaligned =
+					dma_alloc_coherent(ab->dev, desc_sz,
+							   &desc_bank[i].paddr_unaligned,
+							   GFP_KERNEL);
 		if (!desc_bank[i].vaddr_unaligned) {
 			ret = -ENOMEM;
 			goto err;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 8e32ef6..2cb2b05 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -723,35 +723,38 @@ enum htt_rx_data_pkt_filter_tlv_flasg3 {
 	HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(26),
 };
 
-#define HTT_RX_FP_MGMT_FILTER_FLAGS0 (HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
-				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
-
-#define HTT_RX_MD_MGMT_FILTER_FLAGS0 (HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
-				     | HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
-
-#define HTT_RX_MO_MGMT_FILTER_FLAGS0 (HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
-				     | HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
+#define HTT_RX_FP_MGMT_FILTER_FLAGS0 \
+	(HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
+	| HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
+
+#define HTT_RX_MD_MGMT_FILTER_FLAGS0 \
+	(HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
+	| HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
+
+#define HTT_RX_MO_MGMT_FILTER_FLAGS0 \
+	(HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_RESP \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_REQ \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_REASSOC_RESP \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_REQ \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_RESP \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON \
+	| HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_ATIM)
 
 #define HTT_RX_FP_MGMT_FILTER_FLAGS1 (HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS1_DISASSOC \
 				     | HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS1_AUTH \
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 7654f9a..081a239 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1521,7 +1521,8 @@ static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
 							 msdu, last_buf,
 							 l3_pad_bytes, msdu_len);
 			if (ret) {
-				ath11k_warn(ar->ab, "failed to coalesce msdu rx buffer%d\n", ret);
+				ath11k_warn(ar->ab,
+					    "failed to coalesce msdu rx buffer%d\n", ret);
 				goto free_out;
 			}
 		}
@@ -1925,7 +1926,9 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 	case RX_MSDU_START_PKT_TYPE_11N:
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH11K_HT_MCS_MAX) {
-			ath11k_warn(ar->ab, "Received with invalid mcs in HT mode %d\n", rate_mcs);
+			ath11k_warn(ar->ab,
+				    "Received with invalid mcs in HT mode %d\n",
+				     rate_mcs);
 			break;
 		}
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
@@ -1937,7 +1940,9 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->encoding = RX_ENC_VHT;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH11K_VHT_MCS_MAX) {
-			ath11k_warn(ar->ab, "Received with invalid mcs in VHT mode %d\n", rate_mcs);
+			ath11k_warn(ar->ab,
+				    "Received with invalid mcs in VHT mode %d\n",
+				     rate_mcs);
 			break;
 		}
 		rx_status->nss = nss;
@@ -3120,7 +3125,9 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 
 		ret = ath11k_hal_wbm_desc_parse_err(ab, rx_desc, &err_info);
 		if (ret) {
-			ath11k_warn(ab, "failed to parse rx error in wbm_rel ring desc %d\n", ret);
+			ath11k_warn(ab,
+				    "failed to parse rx error in wbm_rel ring desc %d\n",
+				    ret);
 			continue;
 		}
 
@@ -3255,7 +3262,8 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 			spin_lock_bh(&rx_ring->idr_lock);
 			skb = idr_find(&rx_ring->bufs_idr, buf_id);
 			if (!skb) {
-				ath11k_warn(ab, "rxdma error with invalid buf_id %d\n", buf_id);
+				ath11k_warn(ab, "rxdma error with invalid buf_id %d\n",
+					    buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
 				continue;
 			}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9778a02..ff65cf6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2931,9 +2931,10 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 
 	switch (tag) {
 	case WMI_TAG_SERVICE_READY_EXT_EVENT:
-		ret = ath11k_pull_service_ready_ext(wmi_handle,
-						    (struct wmi_service_ready_ext_event *)ptr,
-						    &svc_rdy_ext->param);
+		ret =
+		 ath11k_pull_service_ready_ext(wmi_handle,
+					       (struct wmi_service_ready_ext_event *)ptr,
+					       &svc_rdy_ext->param);
 		if (ret) {
 			ath11k_warn(ab, "unable to extract ext params\n");
 			return ret;
@@ -2962,7 +2963,8 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 			svc_rdy_ext->hw_mode_done = true;
 		} else if (!svc_rdy_ext->mac_phy_done) {
 			svc_rdy_ext->n_mac_phy_caps = 0;
-			svc_rdy_ext->mac_phy_caps = (struct wmi_mac_phy_capabilities *)ptr;
+			svc_rdy_ext->mac_phy_caps =
+					(struct wmi_mac_phy_capabilities *)ptr;
 			ret = ath11k_wmi_tlv_iter(ab, ptr, len,
 						  ath11k_wmi_tlv_mac_phy_caps_parse,
 						  svc_rdy_ext);
@@ -3686,9 +3688,10 @@ static int ath11k_pull_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-static int ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
-					     u32 len,
-					     struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
+static int
+ath11k_pull_pdev_bss_chan_info_ev(struct ath11k_base *ab, u8 *evt_buf,
+				  u32 len,
+				  struct wmi_pdev_bss_chan_info_event *bss_ch_info_ev)
 {
 	const void **tb;
 	const struct wmi_pdev_bss_chan_info_event *ev;
@@ -4477,7 +4480,8 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 	}
 
 	if (stats_id & WMI_REQUEST_PEER_EXTD_STAT) {
-		num_peers_extd = ath11k_wmi_fw_stats_num_peers_extd(&fw_stats->peers_extd);
+		num_peers_extd =
+			ath11k_wmi_fw_stats_num_peers_extd(&fw_stats->peers_extd);
 		len += scnprintf(buf + len, buf_len - len, "\n");
 		len += scnprintf(buf + len, buf_len - len, "%30s (%zu)\n",
 				 "ath11k PEER extd stats", num_peers_extd);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
