Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Bn-0000zc-41
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:28:01 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34B056115B
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:27:52 +0000 (UTC)
Subject: [PATCH 13/15] ath11k: debug_htt_stats: move tag_buf assignment to
 the first
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:50 +0300
Message-ID: <156534287052.30736.9447900788202472849.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

This is more intuitive and makes the file consistent as half of the functions
already used the same style.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |   85 +++++++++++----------
 1 file changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 8265b255b27f..ce49edf664ec 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -1897,10 +1897,10 @@ static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf
 static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
 						    struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_stats_tx_sched_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_stats_tx_sched_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_STATS_TX_SCHED_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -1920,10 +1920,10 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
 							 u16 tag_len,
 							 struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	char gen_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elements = min_t(u16, (tag_len >> 2),
 				 HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
@@ -1947,10 +1947,10 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
 							  u16 tag_len,
 							  struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	char list_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
@@ -1973,10 +1973,10 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 							u16 tag_len,
 							struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf = tag_buf;
 	char list_mpdu_cnt_hist[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2),
 			      HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS);
@@ -1998,10 +1998,10 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_pdev_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_pdev_stats_tlv_v *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_PDEV_STATS_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "msdu_count = %u",
@@ -2077,10 +2077,10 @@ static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, struct
 
 static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_cmn_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_CMN_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2110,10 +2110,10 @@ static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, struct de
 
 static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_error_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_error_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_ERROR_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "q_empty_failure = %u",
@@ -2133,10 +2133,10 @@ static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, struct
 
 static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_tqm_cmdq_status_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_tqm_cmdq_status_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_CMDQ_STATUS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2176,10 +2176,10 @@ static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, struct
 
 static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:");
@@ -2206,10 +2206,10 @@ static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf,
 
 static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:");
@@ -2250,10 +2250,10 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf
 
 static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_classify_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_classify_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CLASSIFY_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "arp_packets = %u",
@@ -2333,10 +2333,10 @@ static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, struc
 
 static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:");
@@ -2367,10 +2367,10 @@ static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf
 
 static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:");
@@ -2391,10 +2391,10 @@ static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf
 
 static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:");
@@ -2415,10 +2415,10 @@ static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf
 
 static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_compl_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_compl_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_COMPL_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tcl_dummy_frame = %u",
@@ -2444,10 +2444,10 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf
 							     u16 tag_len,
 							     struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf = tag_buf;
 	char fw2wbm_ring_full_hist[HTT_MAX_STRING_LEN] = {0};
 	u16  num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
@@ -2477,10 +2477,10 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf
 
 static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_de_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_de_cmn_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CMN_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2508,10 +2508,10 @@ static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct deb
 
 static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_ring_if_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_ring_if_stats_tlv *htt_stats_buf = tag_buf;
 	char low_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 	char high_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 
@@ -2569,10 +2569,10 @@ static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, struct debug
 
 static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_ring_if_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_ring_if_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RING_IF_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2592,10 +2592,10 @@ static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 						   u16 tag_len,
 						   struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_sfm_client_user_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_sfm_client_user_tlv_v *htt_stats_buf = tag_buf;
 	char dwords_used_by_user_n[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = tag_len >> 2;
 
@@ -2617,10 +2617,10 @@ static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 
 static inline void htt_print_sfm_client_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_sfm_client_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_sfm_client_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SFM_CLIENT_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "client_id = %u",
@@ -2648,10 +2648,10 @@ static inline void htt_print_sfm_client_tlv(const void *tag_buf, struct debug_ht
 
 static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_sfm_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_sfm_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SFM_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2675,10 +2675,10 @@ static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, struct debug_htt_s
 
 static inline void htt_print_sring_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_sring_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_sring_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SRING_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2727,10 +2727,10 @@ static inline void htt_print_sring_stats_tlv(const void *tag_buf, struct debug_h
 
 static inline void htt_print_sring_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_sring_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_sring_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SRING_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "num_records = %u\n",
@@ -2746,10 +2746,10 @@ static inline void htt_print_sring_cmn_tlv(const void *tag_buf, struct debug_htt
 
 static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 j;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
@@ -2921,10 +2921,10 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, struct
 
 static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 j;
 	char *rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	char *rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS];
@@ -3042,10 +3042,10 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, struct
 
 static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_soc_fw_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_soc_fw_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_reo_ring_data_msdu = %u",
@@ -3088,10 +3088,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_b
 							       u16 tag_len,
 							       struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf = tag_buf;
 	char refill_ring_empty_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
@@ -3117,10 +3117,10 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 						    u16 tag_len,
 						    struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf = tag_buf;
 	char rxdma_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_RXDMA_MAX_ERR_CODE);
 
@@ -3145,10 +3145,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void
 								     u16 tag_len,
 								     struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf = tag_buf;
 	char reo_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_REO_MAX_ERR_CODE);
 
@@ -3172,10 +3172,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void
 static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
 						      struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_reo_resource_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_reo_resource_stats_tlv_v *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_REO_RESOURCE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sample_id = %u",
@@ -3211,10 +3211,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *
 								    u16 tag_len,
 								    struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf = tag_buf;
 	char refill_ring_num_refill[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
@@ -3238,10 +3238,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *
 static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 						  struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf = tag_buf;
 	char fw_ring_mgmt_subtype[HTT_MAX_STRING_LEN] = {0};
 	char fw_ring_ctrl_subtype[HTT_MAX_STRING_LEN] = {0};
 
@@ -3361,10 +3361,10 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
 							    struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf = tag_buf;
 	char fw_ring_mpdu_err[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
@@ -3388,10 +3388,10 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 							u16 tag_len,
 							struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf = tag_buf;
 	char fw_mpdu_drop[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_FW_DROP_REASON_MAX);
 
@@ -3413,10 +3413,10 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
 							  struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf = tag_buf;
 	char phy_errs[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:");
@@ -3441,10 +3441,10 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
 static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
 						     struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_pdev_cca_stats_hist_v1_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_pdev_cca_stats_hist_v1_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "\nHTT_PDEV_CCA_STATS_HIST_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "chan_num = %u",
@@ -3471,10 +3471,10 @@ static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
 
 static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "|%10u| %10u| %10u| %11u| %10u| %11u| %18u| %10u|",
@@ -3498,10 +3498,10 @@ static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, st
 static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
 						  struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_hw_stats_whal_tx_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_hw_stats_whal_tx_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_HW_STATS_WHAL_TX_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3541,10 +3541,10 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
 static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
 							 struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_pdev_stats_twt_sessions_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_pdev_stats_twt_sessions_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSIONS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "pdev_id = %u",
@@ -3563,10 +3563,10 @@ static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
 static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
 							struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_pdev_stats_twt_session_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_pdev_stats_twt_session_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSION_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "vdev_id = %u",
@@ -3601,10 +3601,11 @@ static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
 static inline void htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 						      struct debug_htt_stats_req *stats_req)
 {
+	const struct htt_pdev_obss_pd_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const struct htt_pdev_obss_pd_stats_tlv *htt_stats_buf = tag_buf;
+
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "OBSS Tx success PPDU = %u",
 			   htt_stats_buf->num_obss_tx_ppdu_success);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "OBSS Tx failures PPDU = %u\n",


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
