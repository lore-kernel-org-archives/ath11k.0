Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1BN-0000sg-LN
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:27:38 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0252760AA3
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:27:24 +0000 (UTC)
Subject: [PATCH 10/15] ath11k: avoid excessive casting in debug_htt_stats.c
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:22 +0300
Message-ID: <156534284256.30736.15867686415548970681.stgit@x230>
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

There is a lots of casting in debug_htt_stats.c, avoid that using void
pointers. Because of the excessive casting in lots of places const attribute
was discarded which caused a compiler warning, fix that at the same time.

No functional changes, code compiled only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  785 ++++++++-------------
 1 file changed, 306 insertions(+), 479 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index a9dffd168309..0ba91dbdccaf 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -29,14 +29,12 @@
 		}									\
 	} while (0)
 
-static inline void htt_print_stats_string_tlv(const u32 *tag_buf,
+static inline void htt_print_stats_string_tlv(const void *tag_buf,
 					      u16 tag_len,
-					      u8 *user_data)
+					      void *user_data)
 {
-	struct htt_stats_string_tlv *htt_stats_buf =
-			(struct htt_stats_string_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)user_data;
+	const struct htt_stats_string_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = user_data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -66,12 +64,10 @@ static inline void htt_print_stats_string_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_pdev_stats_cmn_tlv *htt_stats_buf =
-			(struct htt_tx_pdev_stats_cmn_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_cmn_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -186,14 +182,12 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
 						      u16 tag_len,
-						      u8 *data)
+						      void *data)
 {
-	struct htt_tx_pdev_stats_urrn_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_urrn_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_urrn_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -213,14 +207,12 @@ static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
 						       u16 tag_len,
-						       u8 *data)
+						       void *data)
 {
-	struct htt_tx_pdev_stats_flush_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_flush_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_flush_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -240,14 +232,12 @@ static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
 						      u16 tag_len,
-						      u8 *data)
+						      void *data)
 {
-	struct htt_tx_pdev_stats_sifs_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_sifs_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_sifs_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -268,14 +258,12 @@ static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
 							 u16 tag_len,
-							 u8 *data)
+							 void *data)
 {
-	struct htt_tx_pdev_stats_phy_err_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_phy_err_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_phy_err_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -295,14 +283,12 @@ static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   u8 *data)
+							   void *data)
 {
-	struct htt_tx_pdev_stats_sifs_hist_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_sifs_hist_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_sifs_hist_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -324,13 +310,11 @@ static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const u32 *tag_buf,
-							       u8 *data)
+static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_buf,
+							       void *data)
 {
-	struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v *htt_stats_buf =
-			(struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -362,14 +346,12 @@ static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const u32 *tag_bu
 }
 
 static inline void
-htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
+htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 						  u16 tag_len,
-						  u8 *data)
+						  void *data)
 {
-	struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf =
-		(struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-		(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -401,12 +383,10 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_intr_misc_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, void *data)
 {
-	struct htt_hw_stats_intr_misc_tlv *htt_stats_buf =
-			(struct htt_hw_stats_intr_misc_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_hw_stats_intr_misc_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -429,12 +409,10 @@ static inline void htt_print_hw_stats_intr_misc_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_wd_timeout_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, void *data)
 {
-	struct htt_hw_stats_wd_timeout_tlv *htt_stats_buf =
-			(struct htt_hw_stats_wd_timeout_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_hw_stats_wd_timeout_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -456,12 +434,10 @@ static inline void htt_print_hw_stats_wd_timeout_tlv(const u32 *tag_buf, u8 *dat
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_pdev_errs_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, void *data)
 {
-	struct htt_hw_stats_pdev_errs_tlv *htt_stats_buf =
-			(struct htt_hw_stats_pdev_errs_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_hw_stats_pdev_errs_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -498,12 +474,10 @@ static inline void htt_print_hw_stats_pdev_errs_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_msdu_flow_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_msdu_flow_stats_tlv *htt_stats_buf =
-			(struct htt_msdu_flow_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_msdu_flow_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -546,12 +520,10 @@ static inline void htt_print_msdu_flow_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_tid_stats_tlv *htt_stats_buf =
-			(struct htt_tx_tid_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_tid_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -598,12 +570,10 @@ static inline void htt_print_tx_tid_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_v1_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_tid_stats_v1_tlv *htt_stats_buf =
-			(struct htt_tx_tid_stats_v1_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_tid_stats_v1_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -654,12 +624,10 @@ static inline void htt_print_tx_tid_stats_v1_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_tid_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_rx_tid_stats_tlv *htt_stats_buf =
-			(struct htt_rx_tid_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_rx_tid_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -689,12 +657,10 @@ static inline void htt_print_rx_tid_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_counter_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_counter_tlv(const void *tag_buf, void *data)
 {
-	struct htt_counter_tlv *htt_stats_buf =
-			(struct htt_counter_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_counter_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -717,12 +683,10 @@ static inline void htt_print_counter_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct htt_peer_stats_cmn_tlv *htt_stats_buf =
-			(struct htt_peer_stats_cmn_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_peer_stats_cmn_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -765,12 +729,10 @@ static inline void htt_print_peer_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_details_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_peer_details_tlv(const void *tag_buf, void *data)
 {
-	struct htt_peer_details_tlv *htt_stats_buf =
-			(struct htt_peer_details_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_peer_details_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -807,12 +769,10 @@ static inline void htt_print_peer_details_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_peer_rate_stats_tlv *htt_stats_buf =
-			(struct htt_tx_peer_rate_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -893,12 +853,10 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_rx_peer_rate_stats_tlv *htt_stats_buf =
-			(struct htt_rx_peer_rate_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_rx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -985,12 +943,10 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_hwq_mu_mimo_sch_stats_tlv *htt_stats_buf =
-			(struct htt_tx_hwq_mu_mimo_sch_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1011,13 +967,11 @@ static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const u32 *tag_buf, u8
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
-							   u8 *data)
+static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
+							   void *data)
 {
-	struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv *htt_stats_buf =
-			(struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1047,13 +1001,11 @@ static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const u32 *tag_buf,
-							  u8 *data)
+static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
+							  void *data)
 {
-	struct htt_tx_hwq_mu_mimo_cmn_stats_tlv *htt_stats_buf =
-			(struct htt_tx_hwq_mu_mimo_cmn_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_mu_mimo_cmn_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1072,12 +1024,10 @@ static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_hwq_stats_cmn_tlv *htt_stats_buf =
-			(struct htt_tx_hwq_stats_cmn_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_stats_cmn_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1137,14 +1087,12 @@ static inline void htt_print_tx_hwq_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf,
 							     u16 tag_len,
-							     u8 *data)
+							     void *data)
 {
-	struct htt_tx_hwq_difs_latency_stats_tlv_v *htt_stats_buf =
-			(struct htt_tx_hwq_difs_latency_stats_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_difs_latency_stats_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1169,14 +1117,12 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   u8 *data)
+							   void *data)
 {
-	struct htt_tx_hwq_cmd_result_stats_tlv_v *htt_stats_buf =
-		(struct htt_tx_hwq_cmd_result_stats_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_cmd_result_stats_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1200,14 +1146,12 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
 							  u16 tag_len,
-							  u8 *data)
+							  void *data)
 {
-	struct htt_tx_hwq_cmd_stall_stats_tlv_v *htt_stats_buf =
-			(struct htt_tx_hwq_cmd_stall_stats_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_cmd_stall_stats_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1230,14 +1174,12 @@ static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
 							   u16 tag_len,
-							   u8 *data)
+							   void *data)
 {
-	struct htt_tx_hwq_fes_result_stats_tlv_v *htt_stats_buf =
-			(struct htt_tx_hwq_fes_result_stats_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_fes_result_stats_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1260,14 +1202,12 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 							      u16 tag_len,
-							      u8 *data)
+							      void *data)
 {
-	struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf =
-			(struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1301,14 +1241,12 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf,
 							     u16 tag_len,
-							     u8 *data)
+							     void *data)
 {
-	struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *htt_stats_buf =
-			(struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1337,20 +1275,18 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_sounding_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, void *data)
 {
 	s32 i;
-	struct htt_tx_sounding_stats_tlv *htt_stats_buf =
-			(struct htt_tx_sounding_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_sounding_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u32 *cbf_20 = htt_stats_buf->cbf_20;
-	u32 *cbf_40 = htt_stats_buf->cbf_40;
-	u32 *cbf_80 = htt_stats_buf->cbf_80;
-	u32 *cbf_160 = htt_stats_buf->cbf_160;
+	const u32 *cbf_20 = htt_stats_buf->cbf_20;
+	const u32 *cbf_40 = htt_stats_buf->cbf_40;
+	const u32 *cbf_80 = htt_stats_buf->cbf_80;
+	const u32 *cbf_160 = htt_stats_buf->cbf_160;
 
 	if (htt_stats_buf->tx_sounding_mode == HTT_TX_AC_SOUNDING_MODE) {
 		len += HTT_DBG_OUT(buf + len, buf_len - len,
@@ -1444,12 +1380,10 @@ static inline void htt_print_tx_sounding_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_cmn_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_selfgen_cmn_stats_tlv *htt_stats_buf =
-		(struct htt_tx_selfgen_cmn_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_selfgen_cmn_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1488,12 +1422,10 @@ static inline void htt_print_tx_selfgen_cmn_stats_tlv(const u32 *tag_buf, u8 *da
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_selfgen_ac_stats_tlv *htt_stats_buf =
-			(struct htt_tx_selfgen_ac_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_selfgen_ac_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1522,12 +1454,10 @@ static inline void htt_print_tx_selfgen_ac_stats_tlv(const u32 *tag_buf, u8 *dat
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_selfgen_ax_stats_tlv *htt_stats_buf =
-		(struct htt_tx_selfgen_ax_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_selfgen_ax_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1572,12 +1502,10 @@ static inline void htt_print_tx_selfgen_ax_stats_tlv(const u32 *tag_buf, u8 *dat
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_selfgen_ac_err_stats_tlv *htt_stats_buf =
-			(struct htt_tx_selfgen_ac_err_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_selfgen_ac_err_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1606,12 +1534,10 @@ static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const u32 *tag_buf, u8
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_selfgen_ax_err_stats_tlv *htt_stats_buf =
-			(struct htt_tx_selfgen_ax_err_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_selfgen_ax_err_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1656,13 +1582,11 @@ static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const u32 *tag_buf, u8
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const u32 *tag_buf,
-							   u8 *data)
+static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
+							   void *data)
 {
-	struct htt_tx_pdev_mu_mimo_sch_stats_tlv *htt_stats_buf =
-			(struct htt_tx_pdev_mu_mimo_sch_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1706,12 +1630,10 @@ static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf, void *data)
 {
-	struct htt_tx_pdev_mpdu_stats_tlv *htt_stats_buf =
-			(struct htt_tx_pdev_mpdu_stats_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_mpdu_stats_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1837,14 +1759,12 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf,
+static inline void htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							u8 *data)
+							void *data)
 {
-	struct htt_sched_txq_cmd_posted_tlv_v *htt_stats_buf =
-			(struct htt_sched_txq_cmd_posted_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_sched_txq_cmd_posted_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1866,14 +1786,12 @@ static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf,
+static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							u8 *data)
+							void *data)
 {
-	struct htt_sched_txq_cmd_reaped_tlv_v *htt_stats_buf =
-			(struct htt_sched_txq_cmd_reaped_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_sched_txq_cmd_reaped_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1895,14 +1813,12 @@ static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
+static inline void htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
 							    u16 tag_len,
-							    u8 *data)
+							    void *data)
 {
-	struct htt_sched_txq_sched_order_su_tlv_v *htt_stats_buf =
-		(struct htt_sched_txq_sched_order_su_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_sched_txq_sched_order_su_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1927,14 +1843,12 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const u32 *tag_buf,
+static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag_buf,
 								 u16 tag_len,
-								 u8 *data)
+								 void *data)
 {
-	struct htt_sched_txq_sched_ineligibility_tlv_v *htt_stats_buf =
-		(struct htt_sched_txq_sched_ineligibility_tlv_v *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_sched_txq_sched_ineligibility_tlv_v *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -1958,13 +1872,11 @@ static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const u32 *tag_
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const u32 *tag_buf,
-							     u8 *data)
+static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf,
+							     void *data)
 {
-	struct htt_tx_pdev_stats_sched_per_txq_tlv *htt_stats_buf =
-		(struct htt_tx_pdev_stats_sched_per_txq_tlv *)tag_buf;
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	const struct htt_tx_pdev_stats_sched_per_txq_tlv *htt_stats_buf = tag_buf;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -2026,16 +1938,14 @@ static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_stats_tx_sched_cmn_tlv(const u32 *tag_buf,
-						    u8 *data)
+static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
+						    void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_stats_tx_sched_cmn_tlv *htt_stats_buf =
-		(struct htt_stats_tx_sched_cmn_tlv *)tag_buf;
+	const struct htt_stats_tx_sched_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_STATS_TX_SCHED_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2051,17 +1961,15 @@ static inline void htt_print_stats_tx_sched_cmn_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
 							 u16 tag_len,
-							 u8 *data)
+							 void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf =
-		(struct htt_tx_tqm_gen_mpdu_stats_tlv_v *)tag_buf;
+	const struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	char gen_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elements = min_t(u16, (tag_len >> 2),
 				 HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
@@ -2081,17 +1989,15 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
 							  u16 tag_len,
-							  u8 *data)
+							  void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf =
-		(struct htt_tx_tqm_list_mpdu_stats_tlv_v *)tag_buf;
+	const struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	char list_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
@@ -2110,17 +2016,15 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const u32 *tag_buf,
+static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							u8 *data)
+							void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf =
-		(struct htt_tx_tqm_list_mpdu_cnt_tlv_v *)tag_buf;
+	const struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf = tag_buf;
 	char list_mpdu_cnt_hist[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2),
 			      HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS);
@@ -2140,15 +2044,13 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_pdev_stats_tlv_v *htt_stats_buf =
-			(struct htt_tx_tqm_pdev_stats_tlv_v *)tag_buf;
+	const struct htt_tx_tqm_pdev_stats_tlv_v *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_PDEV_STATS_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "msdu_count = %u",
@@ -2222,15 +2124,13 @@ static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const u32 *tag_buf, u8 *dat
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmn_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_cmn_stats_tlv *htt_stats_buf =
-			(struct htt_tx_tqm_cmn_stats_tlv *)tag_buf;
+	const struct htt_tx_tqm_cmn_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_CMN_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2258,15 +2158,13 @@ static inline void htt_print_tx_tqm_cmn_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_error_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_error_stats_tlv *htt_stats_buf =
-		(struct htt_tx_tqm_error_stats_tlv *)tag_buf;
+	const struct htt_tx_tqm_error_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_ERROR_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "q_empty_failure = %u",
@@ -2284,15 +2182,13 @@ static inline void htt_print_tx_tqm_error_stats_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmdq_status_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_tqm_cmdq_status_tlv *htt_stats_buf =
-		(struct htt_tx_tqm_cmdq_status_tlv *)tag_buf;
+	const struct htt_tx_tqm_cmdq_status_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_CMDQ_STATUS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2330,15 +2226,13 @@ static inline void htt_print_tx_tqm_cmdq_status_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_eapol_packets_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_eapol_packets_stats_tlv *)tag_buf;
+	const struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:");
@@ -2363,15 +2257,13 @@ static inline void htt_print_tx_de_eapol_packets_stats_tlv(const u32 *tag_buf, u
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_failed_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_classify_failed_stats_tlv *)tag_buf;
+	const struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:");
@@ -2410,15 +2302,13 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_classify_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_classify_stats_tlv *)tag_buf;
+	const struct htt_tx_de_classify_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CLASSIFY_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "arp_packets = %u",
@@ -2496,15 +2386,13 @@ static inline void htt_print_tx_de_classify_stats_tlv(const u32 *tag_buf, u8 *da
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_status_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_classify_status_stats_tlv *)tag_buf;
+	const struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:");
@@ -2533,15 +2421,13 @@ static inline void htt_print_tx_de_classify_status_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_enqueue_packets_stats_tlv *)tag_buf;
+	const struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:");
@@ -2560,15 +2446,13 @@ static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_enqueue_discard_stats_tlv *)tag_buf;
+	const struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:");
@@ -2587,15 +2471,13 @@ static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_compl_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_compl_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_compl_stats_tlv *)tag_buf;
+	const struct htt_tx_de_compl_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_COMPL_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tcl_dummy_frame = %u",
@@ -2617,17 +2499,15 @@ static inline void htt_print_tx_de_compl_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf,
+static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf,
 							     u16 tag_len,
-							     u8 *data)
+							     void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf =
-		(struct htt_tx_de_fw2wbm_ring_full_hist_tlv *)tag_buf;
+	const struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf = tag_buf;
 	char fw2wbm_ring_full_hist[HTT_MAX_STRING_LEN] = {0};
 	u16  num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
@@ -2655,15 +2535,13 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_cmn_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_de_cmn_stats_tlv *htt_stats_buf =
-		(struct htt_tx_de_cmn_stats_tlv *)tag_buf;
+	const struct htt_tx_de_cmn_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_CMN_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2689,15 +2567,13 @@ static inline void htt_print_tx_de_cmn_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_ring_if_stats_tlv *htt_stats_buf =
-		(struct htt_ring_if_stats_tlv *)tag_buf;
+	const struct htt_ring_if_stats_tlv *htt_stats_buf = tag_buf;
 	char low_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 	char high_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 
@@ -2753,15 +2629,13 @@ static inline void htt_print_ring_if_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_ring_if_cmn_tlv *htt_stats_buf =
-		(struct htt_ring_if_cmn_tlv *)tag_buf;
+	const struct htt_ring_if_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RING_IF_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2777,17 +2651,15 @@ static inline void htt_print_ring_if_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_client_user_tlv_v(const u32 *tag_buf,
+static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 						   u16 tag_len,
-						   u8 *data)
+						   void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_sfm_client_user_tlv_v *htt_stats_buf =
-		(struct htt_sfm_client_user_tlv_v *)tag_buf;
+	const struct htt_sfm_client_user_tlv_v *htt_stats_buf = tag_buf;
 	char dwords_used_by_user_n[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = tag_len >> 2;
 
@@ -2807,15 +2679,13 @@ static inline void htt_print_sfm_client_user_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_client_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sfm_client_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_sfm_client_tlv *htt_stats_buf =
-		(struct htt_sfm_client_tlv *)tag_buf;
+	const struct htt_sfm_client_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SFM_CLIENT_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "client_id = %u",
@@ -2841,15 +2711,13 @@ static inline void htt_print_sfm_client_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_sfm_cmn_tlv *htt_stats_buf =
-		(struct htt_sfm_cmn_tlv *)tag_buf;
+	const struct htt_sfm_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SFM_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2871,15 +2739,13 @@ static inline void htt_print_sfm_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sring_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_sring_stats_tlv *htt_stats_buf =
-		(struct htt_sring_stats_tlv *)tag_buf;
+	const struct htt_sring_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SRING_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -2926,15 +2792,13 @@ static inline void htt_print_sring_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_cmn_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sring_cmn_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_sring_cmn_tlv *htt_stats_buf =
-		(struct htt_sring_cmn_tlv *)tag_buf;
+	const struct htt_sring_cmn_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SRING_CMN_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "num_records = %u\n",
@@ -2948,15 +2812,13 @@ static inline void htt_print_sring_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf =
-		(struct htt_tx_pdev_rate_stats_tlv *)tag_buf;
+	const struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 j;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
@@ -3126,15 +2988,13 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf =
-		(struct htt_rx_pdev_rate_stats_tlv *)tag_buf;
+	const struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 j;
 	char *rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	char *rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS];
@@ -3250,15 +3110,13 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_soc_fw_stats_tlv *htt_stats_buf =
-			(struct htt_rx_soc_fw_stats_tlv *)tag_buf;
+	const struct htt_rx_soc_fw_stats_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_reo_ring_data_msdu = %u",
@@ -3297,17 +3155,15 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_buf,
+static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_buf,
 							       u16 tag_len,
-							       u8 *data)
+							       void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf =
-			(struct htt_rx_soc_fw_refill_ring_empty_tlv_v *)tag_buf;
+	const struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf = tag_buf;
 	char refill_ring_empty_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
@@ -3329,17 +3185,15 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_bu
 }
 
 static inline void
-htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32 *tag_buf,
+htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 						    u16 tag_len,
-						    u8 *data)
+						    void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf =
-			(struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *)tag_buf;
+	const struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf = tag_buf;
 	char rxdma_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_RXDMA_MAX_ERR_CODE);
 
@@ -3360,17 +3214,15 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const u32 *tag_buf,
+static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void *tag_buf,
 								     u16 tag_len,
-								     u8 *data)
+								     void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf =
-			(struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *)tag_buf;
+	const struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf = tag_buf;
 	char reo_err_cnt[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_REO_MAX_ERR_CODE);
 
@@ -3391,16 +3243,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const u32 *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_reo_debug_stats_tlv_v(const u32 *tag_buf,
-						      u8 *data)
+static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
+						      void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_reo_resource_stats_tlv_v *htt_stats_buf =
-			(struct htt_rx_reo_resource_stats_tlv_v *)tag_buf;
+	const struct htt_rx_reo_resource_stats_tlv_v *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_REO_RESOURCE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sample_id = %u",
@@ -3432,17 +3282,15 @@ static inline void htt_print_rx_reo_debug_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const u32 *tag_buf,
+static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *tag_buf,
 								    u16 tag_len,
-								    u8 *data)
+								    void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf =
-			(struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *)tag_buf;
+	const struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf = tag_buf;
 	char refill_ring_num_refill[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
@@ -3463,16 +3311,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const u32 *t
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
-						  u8 *data)
+static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
+						  void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf =
-		(struct htt_rx_pdev_fw_stats_tlv *)tag_buf;
+	const struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf = tag_buf;
 	char fw_ring_mgmt_subtype[HTT_MAX_STRING_LEN] = {0};
 	char fw_ring_ctrl_subtype[HTT_MAX_STRING_LEN] = {0};
 
@@ -3589,16 +3435,14 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const u32 *tag_buf,
-							    u8 *data)
+static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
+							    void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf =
-		(struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *)tag_buf;
+	const struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf = tag_buf;
 	char fw_ring_mpdu_err[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
@@ -3618,17 +3462,15 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const u32 *tag_buf,
+static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 							u16 tag_len,
-							u8 *data)
+							void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf =
-		(struct htt_rx_pdev_fw_mpdu_drop_tlv_v *)tag_buf;
+	const struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf = tag_buf;
 	char fw_mpdu_drop[HTT_MAX_STRING_LEN] = {0};
 	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_FW_DROP_REASON_MAX);
 
@@ -3647,16 +3489,14 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const u32 *tag_buf,
-							  u8 *data)
+static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
+							  void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf =
-		(struct htt_rx_pdev_fw_stats_phy_err_tlv *)tag_buf;
+	const struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf = tag_buf;
 	char phy_errs[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:");
@@ -3678,16 +3518,14 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_cca_stats_hist_tlv(const u32 *tag_buf,
-						     u8 *data)
+static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
+						     void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_pdev_cca_stats_hist_v1_tlv *htt_stats_buf =
-			(struct htt_pdev_cca_stats_hist_v1_tlv *)tag_buf;
+	const struct htt_pdev_cca_stats_hist_v1_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "\nHTT_PDEV_CCA_STATS_HIST_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "chan_num = %u",
@@ -3712,15 +3550,13 @@ static inline void htt_print_pdev_cca_stats_hist_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_cca_counters_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf =
-			(struct htt_pdev_stats_cca_counters_tlv *)tag_buf;
+	const struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len,
 			   "|%10u| %10u| %10u| %11u| %10u| %11u| %18u| %10u|",
@@ -3741,16 +3577,14 @@ static inline void htt_print_pdev_stats_cca_counters_tlv(const u32 *tag_buf, u8
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_whal_tx_tlv(const u32 *tag_buf,
-						  u8 *data)
+static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
+						  void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_hw_stats_whal_tx_tlv *htt_stats_buf =
-			(struct htt_hw_stats_whal_tx_tlv *)tag_buf;
+	const struct htt_hw_stats_whal_tx_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_HW_STATS_WHAL_TX_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3787,16 +3621,14 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_twt_sessions_tlv(const u32 *tag_buf,
-							 u8 *data)
+static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
+							 void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_pdev_stats_twt_sessions_tlv *htt_stats_buf =
-			(struct htt_pdev_stats_twt_sessions_tlv *)tag_buf;
+	const struct htt_pdev_stats_twt_sessions_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSIONS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "pdev_id = %u",
@@ -3812,16 +3644,14 @@ static inline void htt_print_pdev_stats_twt_sessions_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_twt_session_tlv(const u32 *tag_buf,
-							u8 *data)
+static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
+							void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_pdev_stats_twt_session_tlv *htt_stats_buf =
-		(struct htt_pdev_stats_twt_session_tlv *)tag_buf;
+	const struct htt_pdev_stats_twt_session_tlv *htt_stats_buf = tag_buf;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSION_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "vdev_id = %u",
@@ -3853,16 +3683,14 @@ static inline void htt_print_pdev_stats_twt_session_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_obss_pd_stats_tlv_v(const u32 *tag_buf,
-						      u8 *data)
+static inline void htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
+						      void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	struct htt_pdev_obss_pd_stats_tlv *htt_stats_buf =
-			(struct htt_pdev_obss_pd_stats_tlv *)tag_buf;
+	const struct htt_pdev_obss_pd_stats_tlv *htt_stats_buf = tag_buf;
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "OBSS Tx success PPDU = %u",
 			   htt_stats_buf->num_obss_tx_ppdu_success);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "OBSS Tx failures PPDU = %u\n",
@@ -3877,10 +3705,9 @@ static inline void htt_print_pdev_obss_pd_stats_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
-					    u8 *data)
+					    void *data)
 {
-	struct debug_htt_stats_req *stats_req =
-			(struct debug_htt_stats_req *)data;
+	struct debug_htt_stats_req *stats_req = data;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
