Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1BU-0000tT-DD
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:27:44 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CDF560721
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:27:34 +0000 (UTC)
Subject: [PATCH 11/15] ath11k: debug_htt_stats: pass stats_req as a properly
 typed pointer
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:32 +0300
Message-ID: <156534285262.30736.7433719659818667430.stgit@x230>
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

Void pointers are bad. And this reduces line count anyway.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  435 ++++++++-------------
 1 file changed, 175 insertions(+), 260 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 0ba91dbdccaf..a01f3d5ec54e 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -31,10 +31,9 @@
 
 static inline void htt_print_stats_string_tlv(const void *tag_buf,
 					      u16 tag_len,
-					      void *user_data)
+					      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_stats_string_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = user_data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -64,10 +63,9 @@ static inline void htt_print_stats_string_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_cmn_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -184,10 +182,9 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, void *da
 
 static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
 						      u16 tag_len,
-						      void *data)
+						      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_urrn_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -209,10 +206,9 @@ static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
 						       u16 tag_len,
-						       void *data)
+						       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_flush_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -234,10 +230,9 @@ static inline void htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
 						      u16 tag_len,
-						      void *data)
+						      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sifs_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -260,10 +255,9 @@ static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
 							 u16 tag_len,
-							 void *data)
+							 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_phy_err_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -285,10 +279,9 @@ static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   void *data)
+							   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sifs_hist_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -311,10 +304,9 @@ static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
 }
 
 static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_buf,
-							       void *data)
+							       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -348,10 +340,9 @@ static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_b
 static inline void
 htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 						  u16 tag_len,
-						  void *data)
+						  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -383,10 +374,9 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, void *data)
+static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_intr_misc_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -409,10 +399,9 @@ static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, void *data)
+static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_wd_timeout_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -434,10 +423,9 @@ static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, void *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, void *data)
+static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_pdev_errs_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -474,10 +462,9 @@ static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_msdu_flow_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -520,10 +507,9 @@ static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, void *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tid_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -570,10 +556,9 @@ static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tid_stats_v1_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -624,10 +609,9 @@ static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, void *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_tid_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -657,10 +641,9 @@ static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_counter_tlv(const void *tag_buf, void *data)
+static inline void htt_print_counter_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_counter_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -683,10 +666,9 @@ static inline void htt_print_counter_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_peer_stats_cmn_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -729,10 +711,9 @@ static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_details_tlv(const void *tag_buf, void *data)
+static inline void htt_print_peer_details_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_peer_details_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -769,10 +750,9 @@ static inline void htt_print_peer_details_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -853,10 +833,9 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -943,10 +922,9 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -968,10 +946,9 @@ static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, v
 }
 
 static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
-							   void *data)
+							   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1002,10 +979,9 @@ static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
-							  void *data)
+							  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_cmn_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1024,10 +1000,9 @@ static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_stats_cmn_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1089,10 +1064,9 @@ static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, void *dat
 
 static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf,
 							     u16 tag_len,
-							     void *data)
+							     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_difs_latency_stats_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1119,10 +1093,9 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf
 
 static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   void *data)
+							   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_cmd_result_stats_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1148,10 +1121,9 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
 							  u16 tag_len,
-							  void *data)
+							  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_cmd_stall_stats_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1176,10 +1148,9 @@ static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   void *data)
+							   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_fes_result_stats_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1204,10 +1175,9 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 							      u16 tag_len,
-							      void *data)
+							      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1243,10 +1213,9 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_bu
 
 static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf,
 							     u16 tag_len,
-							     void *data)
+							     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1275,11 +1244,10 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	s32 i;
 	const struct htt_tx_sounding_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1380,10 +1348,9 @@ static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, void *da
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_cmn_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1422,10 +1389,9 @@ static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, void
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ac_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1454,10 +1420,9 @@ static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, void *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ax_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1502,10 +1467,9 @@ static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, void *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ac_err_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1534,10 +1498,9 @@ static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, vo
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ax_err_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1583,10 +1546,9 @@ static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, vo
 }
 
 static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
-							   void *data)
+							   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1630,10 +1592,9 @@ static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_mpdu_stats_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1761,10 +1722,9 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 
 static inline void htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							void *data)
+							struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_cmd_posted_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1788,10 +1748,9 @@ static inline void htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
 
 static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							void *data)
+							struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_cmd_reaped_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1815,10 +1774,9 @@ static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
 
 static inline void htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
 							    u16 tag_len,
-							    void *data)
+							    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_sched_order_su_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1845,10 +1803,9 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
 
 static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag_buf,
 								 u16 tag_len,
-								 void *data)
+								 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_sched_ineligibility_tlv_v *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1873,10 +1830,9 @@ static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag
 }
 
 static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf,
-							     void *data)
+							     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sched_per_txq_tlv *htt_stats_buf = tag_buf;
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1939,9 +1895,8 @@ static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf
 }
 
 static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
-						    void *data)
+						    struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1963,9 +1918,8 @@ static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
 
 static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
 							 u16 tag_len,
-							 void *data)
+							 struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1991,9 +1945,8 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
 							  u16 tag_len,
-							  void *data)
+							  struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2018,9 +1971,8 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							void *data)
+							struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2044,9 +1996,8 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, void *data)
+static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2124,9 +2075,8 @@ static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, void *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2158,9 +2108,8 @@ static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, void *dat
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2182,9 +2131,8 @@ static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2226,9 +2174,8 @@ static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2257,9 +2204,8 @@ static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2302,9 +2248,8 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2386,9 +2331,8 @@ static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, void
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2421,9 +2365,8 @@ static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2446,9 +2389,8 @@ static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2471,9 +2413,8 @@ static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2501,9 +2442,8 @@ static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, void *da
 
 static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf,
 							     u16 tag_len,
-							     void *data)
+							     struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2535,9 +2475,8 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2567,9 +2506,8 @@ static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, void *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2629,9 +2567,8 @@ static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2653,9 +2590,8 @@ static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, void *data)
 
 static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 						   u16 tag_len,
-						   void *data)
+						   struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2679,9 +2615,8 @@ static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_client_tlv(const void *tag_buf, void *data)
+static inline void htt_print_sfm_client_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2711,9 +2646,8 @@ static inline void htt_print_sfm_client_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2739,9 +2673,8 @@ static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_sring_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2792,9 +2725,8 @@ static inline void htt_print_sring_stats_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_cmn_tlv(const void *tag_buf, void *data)
+static inline void htt_print_sring_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2812,9 +2744,8 @@ static inline void htt_print_sring_cmn_tlv(const void *tag_buf, void *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2988,9 +2919,8 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3110,9 +3040,8 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, void *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, void *data)
+static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3157,9 +3086,8 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, void *data
 
 static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_buf,
 							       u16 tag_len,
-							       void *data)
+							       struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3187,9 +3115,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_b
 static inline void
 htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 						    u16 tag_len,
-						    void *data)
+						    struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3216,9 +3143,8 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 
 static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void *tag_buf,
 								     u16 tag_len,
-								     void *data)
+								     struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3244,9 +3170,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void
 }
 
 static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
-						      void *data)
+						      struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3284,9 +3209,8 @@ static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
 
 static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *tag_buf,
 								    u16 tag_len,
-								    void *data)
+								    struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3312,9 +3236,8 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *
 }
 
 static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
-						  void *data)
+						  struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3436,9 +3359,8 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
-							    void *data)
+							    struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3464,9 +3386,8 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
 
 static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							void *data)
+							struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3490,9 +3411,8 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 }
 
 static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
-							  void *data)
+							  struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3519,9 +3439,8 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
-						     void *data)
+						     struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3550,9 +3469,8 @@ static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, void *data)
+static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3578,9 +3496,8 @@ static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, vo
 }
 
 static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
-						  void *data)
+						  struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3622,9 +3539,8 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
-							 void *data)
+							 struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3645,9 +3561,8 @@ static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
-							void *data)
+							struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3684,9 +3599,8 @@ static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
 }
 
 static inline void htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
-						      void *data)
+						      struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3705,9 +3619,8 @@ static inline void htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 }
 
 static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
-					    void *data)
+					    struct debug_htt_stats_req *stats_req)
 {
-	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3753,347 +3666,349 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
 {
+	struct debug_htt_stats_req *stats_req = user_data;
+
 	switch (tag) {
 	case HTT_STATS_TX_PDEV_CMN_TAG:
-		htt_print_tx_pdev_stats_cmn_tlv(tag_buf, user_data);
+		htt_print_tx_pdev_stats_cmn_tlv(tag_buf, stats_req);
 		break;
 	case HTT_STATS_TX_PDEV_UNDERRUN_TAG:
-		htt_print_tx_pdev_stats_urrn_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_pdev_stats_urrn_tlv_v(tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_TX_PDEV_SIFS_TAG:
-		htt_print_tx_pdev_stats_sifs_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_pdev_stats_sifs_tlv_v(tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_TX_PDEV_FLUSH_TAG:
-		htt_print_tx_pdev_stats_flush_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_pdev_stats_flush_tlv_v(tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_TX_PDEV_PHY_ERR_TAG:
-		htt_print_tx_pdev_stats_phy_err_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_pdev_stats_phy_err_tlv_v(tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_TX_PDEV_SIFS_HIST_TAG:
-		htt_print_tx_pdev_stats_sifs_hist_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_pdev_stats_sifs_hist_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_TX_PPDU_STATS_TAG:
-		htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_TRIED_MPDU_CNT_HIST_TAG:
 		htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(tag_buf, len,
-								  user_data);
+								  stats_req);
 		break;
 
 	case HTT_STATS_STRING_TAG:
-		htt_print_stats_string_tlv(tag_buf, len, user_data);
+		htt_print_stats_string_tlv(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMN_TAG:
-		htt_print_tx_hwq_stats_cmn_tlv(tag_buf, user_data);
+		htt_print_tx_hwq_stats_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_DIFS_LATENCY_TAG:
-		htt_print_tx_hwq_difs_latency_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_difs_latency_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMD_RESULT_TAG:
-		htt_print_tx_hwq_cmd_result_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_cmd_result_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMD_STALL_TAG:
-		htt_print_tx_hwq_cmd_stall_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_cmd_stall_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_FES_STATUS_TAG:
-		htt_print_tx_hwq_fes_result_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_fes_result_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_TRIED_MPDU_CNT_HIST_TAG:
-		htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_TXOP_USED_CNT_HIST_TAG:
-		htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_TX_TQM_GEN_MPDU_TAG:
-		htt_print_tx_tqm_gen_mpdu_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_tqm_gen_mpdu_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_LIST_MPDU_TAG:
-		htt_print_tx_tqm_list_mpdu_stats_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_tqm_list_mpdu_stats_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_LIST_MPDU_CNT_TAG:
-		htt_print_tx_tqm_list_mpdu_cnt_tlv_v(tag_buf, len, user_data);
+		htt_print_tx_tqm_list_mpdu_cnt_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_CMN_TAG:
-		htt_print_tx_tqm_cmn_stats_tlv(tag_buf, user_data);
+		htt_print_tx_tqm_cmn_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_PDEV_TAG:
-		htt_print_tx_tqm_pdev_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_tqm_pdev_stats_tlv_v(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_CMDQ_STATUS_TAG:
-		htt_print_tx_tqm_cmdq_status_tlv(tag_buf, user_data);
+		htt_print_tx_tqm_cmdq_status_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_EAPOL_PACKETS_TAG:
-		htt_print_tx_de_eapol_packets_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_eapol_packets_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_CLASSIFY_FAILED_TAG:
-		htt_print_tx_de_classify_failed_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_classify_failed_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_CLASSIFY_STATS_TAG:
-		htt_print_tx_de_classify_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_classify_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_CLASSIFY_STATUS_TAG:
-		htt_print_tx_de_classify_status_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_classify_status_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_ENQUEUE_PACKETS_TAG:
-		htt_print_tx_de_enqueue_packets_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_enqueue_packets_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_ENQUEUE_DISCARD_TAG:
-		htt_print_tx_de_enqueue_discard_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_enqueue_discard_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_FW2WBM_RING_FULL_HIST_TAG:
-		htt_print_tx_de_fw2wbm_ring_full_hist_tlv(tag_buf, len, user_data);
+		htt_print_tx_de_fw2wbm_ring_full_hist_tlv(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_CMN_TAG:
-		htt_print_tx_de_cmn_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_cmn_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RING_IF_TAG:
-		htt_print_ring_if_stats_tlv(tag_buf, user_data);
+		htt_print_ring_if_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG:
-		htt_print_tx_pdev_mu_mimo_sch_stats_tlv(tag_buf, user_data);
+		htt_print_tx_pdev_mu_mimo_sch_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SFM_CMN_TAG:
-		htt_print_sfm_cmn_tlv(tag_buf, user_data);
+		htt_print_sfm_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SRING_STATS_TAG:
-		htt_print_sring_stats_tlv(tag_buf, user_data);
+		htt_print_sring_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_PDEV_FW_STATS_TAG:
-		htt_print_rx_pdev_fw_stats_tlv(tag_buf, user_data);
+		htt_print_rx_pdev_fw_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_PDEV_FW_RING_MPDU_ERR_TAG:
-		htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(tag_buf, user_data);
+		htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_PDEV_FW_MPDU_DROP_TAG:
-		htt_print_rx_pdev_fw_mpdu_drop_tlv_v(tag_buf, len, user_data);
+		htt_print_rx_pdev_fw_mpdu_drop_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_RX_SOC_FW_STATS_TAG:
-		htt_print_rx_soc_fw_stats_tlv(tag_buf, user_data);
+		htt_print_rx_soc_fw_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_SOC_FW_REFILL_RING_EMPTY_TAG:
-		htt_print_rx_soc_fw_refill_ring_empty_tlv_v(tag_buf, len, user_data);
+		htt_print_rx_soc_fw_refill_ring_empty_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_RX_SOC_FW_REFILL_RING_NUM_REFILL_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(
-				tag_buf, len, user_data);
+				tag_buf, len, stats_req);
 		break;
 	case HTT_STATS_RX_REFILL_RXDMA_ERR_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(
-				tag_buf, len, user_data);
+				tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_RX_REFILL_REO_ERR_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(
-				tag_buf, len, user_data);
+				tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_RX_REO_RESOURCE_STATS_TAG:
 		htt_print_rx_reo_debug_stats_tlv_v(
-				tag_buf, user_data);
+				tag_buf, stats_req);
 		break;
 	case HTT_STATS_RX_PDEV_FW_STATS_PHY_ERR_TAG:
-		htt_print_rx_pdev_fw_stats_phy_err_tlv(tag_buf, user_data);
+		htt_print_rx_pdev_fw_stats_phy_err_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_RATE_STATS_TAG:
-		htt_print_tx_pdev_rate_stats_tlv(tag_buf, user_data);
+		htt_print_tx_pdev_rate_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_PDEV_RATE_STATS_TAG:
-		htt_print_rx_pdev_rate_stats_tlv(tag_buf, user_data);
+		htt_print_rx_pdev_rate_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG:
-		htt_print_tx_pdev_stats_sched_per_txq_tlv(tag_buf, user_data);
+		htt_print_tx_pdev_stats_sched_per_txq_tlv(tag_buf, stats_req);
 		break;
 	case HTT_STATS_TX_SCHED_CMN_TAG:
-		htt_print_stats_tx_sched_cmn_tlv(tag_buf, user_data);
+		htt_print_stats_tx_sched_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_PDEV_MPDU_STATS_TAG:
-		htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(tag_buf, user_data);
+		htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SCHED_TXQ_CMD_POSTED_TAG:
-		htt_print_sched_txq_cmd_posted_tlv_v(tag_buf, len, user_data);
+		htt_print_sched_txq_cmd_posted_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_RING_IF_CMN_TAG:
-		htt_print_ring_if_cmn_tlv(tag_buf, user_data);
+		htt_print_ring_if_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SFM_CLIENT_USER_TAG:
-		htt_print_sfm_client_user_tlv_v(tag_buf, len, user_data);
+		htt_print_sfm_client_user_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_SFM_CLIENT_TAG:
-		htt_print_sfm_client_tlv(tag_buf, user_data);
+		htt_print_sfm_client_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_TQM_ERROR_STATS_TAG:
-		htt_print_tx_tqm_error_stats_tlv(tag_buf, user_data);
+		htt_print_tx_tqm_error_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SCHED_TXQ_CMD_REAPED_TAG:
-		htt_print_sched_txq_cmd_reaped_tlv_v(tag_buf, len, user_data);
+		htt_print_sched_txq_cmd_reaped_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_SRING_CMN_TAG:
-		htt_print_sring_cmn_tlv(tag_buf, user_data);
+		htt_print_sring_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SOUNDING_STATS_TAG:
-		htt_print_tx_sounding_stats_tlv(tag_buf, user_data);
+		htt_print_tx_sounding_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SELFGEN_AC_ERR_STATS_TAG:
-		htt_print_tx_selfgen_ac_err_stats_tlv(tag_buf, user_data);
+		htt_print_tx_selfgen_ac_err_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SELFGEN_CMN_STATS_TAG:
-		htt_print_tx_selfgen_cmn_stats_tlv(tag_buf, user_data);
+		htt_print_tx_selfgen_cmn_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SELFGEN_AC_STATS_TAG:
-		htt_print_tx_selfgen_ac_stats_tlv(tag_buf, user_data);
+		htt_print_tx_selfgen_ac_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SELFGEN_AX_STATS_TAG:
-		htt_print_tx_selfgen_ax_stats_tlv(tag_buf, user_data);
+		htt_print_tx_selfgen_ax_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_SELFGEN_AX_ERR_STATS_TAG:
-		htt_print_tx_selfgen_ax_err_stats_tlv(tag_buf, user_data);
+		htt_print_tx_selfgen_ax_err_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_MUMIMO_SCH_STATS_TAG:
-		htt_print_tx_hwq_mu_mimo_sch_stats_tlv(tag_buf, user_data);
+		htt_print_tx_hwq_mu_mimo_sch_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_MUMIMO_MPDU_STATS_TAG:
-		htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(tag_buf, user_data);
+		htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_HWQ_MUMIMO_CMN_STATS_TAG:
-		htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(tag_buf, user_data);
+		htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_HW_INTR_MISC_TAG:
-		htt_print_hw_stats_intr_misc_tlv(tag_buf, user_data);
+		htt_print_hw_stats_intr_misc_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_HW_WD_TIMEOUT_TAG:
-		htt_print_hw_stats_wd_timeout_tlv(tag_buf, user_data);
+		htt_print_hw_stats_wd_timeout_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_HW_PDEV_ERRS_TAG:
-		htt_print_hw_stats_pdev_errs_tlv(tag_buf, user_data);
+		htt_print_hw_stats_pdev_errs_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_COUNTER_NAME_TAG:
-		htt_print_counter_tlv(tag_buf, user_data);
+		htt_print_counter_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_TID_DETAILS_TAG:
-		htt_print_tx_tid_stats_tlv(tag_buf, user_data);
+		htt_print_tx_tid_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_TID_DETAILS_V1_TAG:
-		htt_print_tx_tid_stats_v1_tlv(tag_buf, user_data);
+		htt_print_tx_tid_stats_v1_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_RX_TID_DETAILS_TAG:
-		htt_print_rx_tid_stats_tlv(tag_buf, user_data);
+		htt_print_rx_tid_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PEER_STATS_CMN_TAG:
-		htt_print_peer_stats_cmn_tlv(tag_buf, user_data);
+		htt_print_peer_stats_cmn_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PEER_DETAILS_TAG:
-		htt_print_peer_details_tlv(tag_buf, user_data);
+		htt_print_peer_details_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PEER_MSDU_FLOWQ_TAG:
-		htt_print_msdu_flow_stats_tlv(tag_buf, user_data);
+		htt_print_msdu_flow_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PEER_TX_RATE_STATS_TAG:
-		htt_print_tx_peer_rate_stats_tlv(tag_buf, user_data);
+		htt_print_tx_peer_rate_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PEER_RX_RATE_STATS_TAG:
-		htt_print_rx_peer_rate_stats_tlv(tag_buf, user_data);
+		htt_print_rx_peer_rate_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_TX_DE_COMPL_STATS_TAG:
-		htt_print_tx_de_compl_stats_tlv(tag_buf, user_data);
+		htt_print_tx_de_compl_stats_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PDEV_CCA_1SEC_HIST_TAG:
 	case HTT_STATS_PDEV_CCA_100MSEC_HIST_TAG:
 	case HTT_STATS_PDEV_CCA_STAT_CUMULATIVE_TAG:
-		htt_print_pdev_cca_stats_hist_tlv(tag_buf, user_data);
+		htt_print_pdev_cca_stats_hist_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PDEV_CCA_COUNTERS_TAG:
-		htt_print_pdev_stats_cca_counters_tlv(tag_buf, user_data);
+		htt_print_pdev_stats_cca_counters_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_WHAL_TX_TAG:
-		htt_print_hw_stats_whal_tx_tlv(tag_buf, user_data);
+		htt_print_hw_stats_whal_tx_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PDEV_TWT_SESSIONS_TAG:
-		htt_print_pdev_stats_twt_sessions_tlv(tag_buf, user_data);
+		htt_print_pdev_stats_twt_sessions_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_PDEV_TWT_SESSION_TAG:
-		htt_print_pdev_stats_twt_session_tlv(tag_buf, user_data);
+		htt_print_pdev_stats_twt_session_tlv(tag_buf, stats_req);
 		break;
 
 	case HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG:
-		htt_print_sched_txq_sched_order_su_tlv_v(tag_buf, len, user_data);
+		htt_print_sched_txq_sched_order_su_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG:
-		htt_print_sched_txq_sched_ineligibility_tlv_v(tag_buf, len, user_data);
+		htt_print_sched_txq_sched_ineligibility_tlv_v(tag_buf, len, stats_req);
 		break;
 
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
-		htt_print_pdev_obss_pd_stats_tlv_v(tag_buf, user_data);
+		htt_print_pdev_obss_pd_stats_tlv_v(tag_buf, stats_req);
 		break;
 	default:
 		break;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
