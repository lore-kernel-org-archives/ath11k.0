Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Bu-000113-B5
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:28:09 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B32E460C72
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:28:01 +0000 (UTC)
Subject: [PATCH 14/15] ath11k: debug_htt_stats: fix line over 90 char warnings
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:59 +0300
Message-ID: <156534287946.30736.14445804936898575779.stgit@x230>
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

Fix checkpatch warnings about too long lines. I fix these separate as I didn't
the cleanup in systematic way.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  372 +++++++++++++--------
 1 file changed, 234 insertions(+), 138 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index ce49edf664ec..4e2894ee3cc6 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -63,7 +63,8 @@ static inline void htt_print_stats_string_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf,
+						   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -180,9 +181,10 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, struct d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
-						      u16 tag_len,
-						      struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
+				   u16 tag_len,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_urrn_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -204,9 +206,10 @@ static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
-						       u16 tag_len,
-						       struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
+				    u16 tag_len,
+				    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_flush_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -228,9 +231,10 @@ static inline void htt_print_tx_pdev_stats_flush_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
-						      u16 tag_len,
-						      struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
+				   u16 tag_len,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sifs_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -253,9 +257,10 @@ static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
-							 u16 tag_len,
-							 struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
+				      u16 tag_len,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_phy_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -277,9 +282,10 @@ static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
-							   u16 tag_len,
-							   struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
+					u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sifs_hist_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -303,8 +309,9 @@ static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_buf,
-							       struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_buf,
+					    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -374,7 +381,8 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_intr_misc_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -399,7 +407,9 @@ static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf,
+				  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_wd_timeout_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -423,7 +433,8 @@ static inline void htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_hw_stats_pdev_errs_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -462,7 +473,8 @@ static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf,
+						 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_msdu_flow_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -507,7 +519,8 @@ static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf, struct deb
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf,
+					      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tid_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -556,7 +569,8 @@ static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf, struct debug_
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf,
+						 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tid_stats_v1_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -609,7 +623,8 @@ static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf, struct deb
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf,
+					      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_tid_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -641,7 +656,8 @@ static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf, struct debug_
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_counter_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_counter_tlv(const void *tag_buf,
+					 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_counter_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -666,7 +682,8 @@ static inline void htt_print_counter_tlv(const void *tag_buf, struct debug_htt_s
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf,
+						struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_peer_stats_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -711,7 +728,8 @@ static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf, struct debu
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_peer_details_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_peer_details_tlv(const void *tag_buf,
+					      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_peer_details_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -750,7 +768,8 @@ static inline void htt_print_peer_details_tlv(const void *tag_buf, struct debug_
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -833,7 +852,8 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_peer_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -922,7 +942,9 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf,
+				       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -945,8 +967,9 @@ static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf, s
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
-							   struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -978,8 +1001,9 @@ static inline void htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
-							  struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
+				       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_mu_mimo_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1000,7 +1024,8 @@ static inline void htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_stats_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1062,9 +1087,10 @@ static inline void htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, struct de
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf,
-							     u16 tag_len,
-							     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf,
+					  u16 tag_len,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_difs_latency_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1091,9 +1117,10 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
-							   u16 tag_len,
-							   struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
+					u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_cmd_result_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1119,9 +1146,10 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
-							  u16 tag_len,
-							  struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
+				       u16 tag_len,
+				       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_cmd_stall_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1146,9 +1174,10 @@ static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
-							   u16 tag_len,
-							   struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
+					u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_fes_result_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1173,9 +1202,10 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
-							      u16 tag_len,
-							      struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
+					   u16 tag_len,
+					   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1211,9 +1241,10 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_bu
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf,
-							     u16 tag_len,
-							     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf,
+					  u16 tag_len,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1244,7 +1275,8 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf,
+						   struct debug_htt_stats_req *stats_req)
 {
 	s32 i;
 	const struct htt_tx_sounding_stats_tlv *htt_stats_buf = tag_buf;
@@ -1348,7 +1380,9 @@ static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf, struct d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1389,7 +1423,9 @@ static inline void htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf, struc
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf,
+				  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ac_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1420,7 +1456,9 @@ static inline void htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf,
+				  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ax_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1467,7 +1505,9 @@ static inline void htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ac_err_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1498,7 +1538,9 @@ static inline void htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf, st
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_selfgen_ax_err_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1545,8 +1587,9 @@ static inline void htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, st
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
-							   struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1592,7 +1635,9 @@ static inline void htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
+					 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_mpdu_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1720,9 +1765,10 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
-							u16 tag_len,
-							struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
+				     u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_cmd_posted_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1746,9 +1792,10 @@ static inline void htt_print_sched_txq_cmd_posted_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
-							u16 tag_len,
-							struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
+				     u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_cmd_reaped_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1772,9 +1819,10 @@ static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
-							    u16 tag_len,
-							    struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
+					 u16 tag_len,
+					 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_sched_order_su_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1801,9 +1849,10 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag_buf,
-								 u16 tag_len,
-								 struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag_buf,
+					      u16 tag_len,
+					      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sched_txq_sched_ineligibility_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1829,8 +1878,9 @@ static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const void *tag
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf,
-							     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_stats_sched_per_txq_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1916,9 +1966,10 @@ static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
-							 u16 tag_len,
-							 struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
+				      u16 tag_len,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1943,9 +1994,10 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
-							  u16 tag_len,
-							  struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
+				       u16 tag_len,
+				       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1969,9 +2021,10 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
-							u16 tag_len,
-							struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
+				     u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -1996,7 +2049,9 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf,
+				  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_pdev_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2075,7 +2130,8 @@ static inline void htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf,
+						  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2108,7 +2164,8 @@ static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf, struct de
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_error_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2131,7 +2188,8 @@ static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_tqm_cmdq_status_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2174,7 +2232,9 @@ static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf,
+					struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_eapol_packets_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2204,7 +2264,9 @@ static inline void htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_classify_failed_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2248,7 +2310,9 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_classify_stats_tlv(const void *tag_buf,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_classify_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2331,7 +2395,9 @@ static inline void htt_print_tx_de_classify_stats_tlv(const void *tag_buf, struc
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_classify_status_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2365,7 +2431,9 @@ static inline void htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_enqueue_packets_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2389,7 +2457,9 @@ static inline void htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_enqueue_discard_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2413,7 +2483,8 @@ static inline void htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf,
+						   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_compl_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2440,9 +2511,10 @@ static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf, struct d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf,
-							     u16 tag_len,
-							     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf,
+					  u16 tag_len,
+					  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2475,7 +2547,8 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const void *tag_buf
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_de_cmn_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2506,7 +2579,8 @@ static inline void htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct deb
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_ring_if_stats_tlv(const void *tag_buf,
+					       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_ring_if_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2567,7 +2641,8 @@ static inline void htt_print_ring_if_stats_tlv(const void *tag_buf, struct debug
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf,
+					     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_ring_if_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2615,7 +2690,8 @@ static inline void htt_print_sfm_client_user_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_client_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_sfm_client_tlv(const void *tag_buf,
+					    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sfm_client_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2646,7 +2722,8 @@ static inline void htt_print_sfm_client_tlv(const void *tag_buf, struct debug_ht
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_sfm_cmn_tlv(const void *tag_buf,
+					 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sfm_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2673,7 +2750,8 @@ static inline void htt_print_sfm_cmn_tlv(const void *tag_buf, struct debug_htt_s
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_sring_stats_tlv(const void *tag_buf,
+					     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sring_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2725,7 +2803,8 @@ static inline void htt_print_sring_stats_tlv(const void *tag_buf, struct debug_h
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sring_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_sring_cmn_tlv(const void *tag_buf,
+					   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_sring_cmn_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2744,7 +2823,8 @@ static inline void htt_print_sring_cmn_tlv(const void *tag_buf, struct debug_htt
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -2919,7 +2999,8 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
+						    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3040,7 +3121,8 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, struct
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf,
+						 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_soc_fw_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3084,9 +3166,10 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, struct deb
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_buf,
-							       u16 tag_len,
-							       struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const void *tag_buf,
+					    u16 tag_len,
+					    struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3117,7 +3200,8 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 						    u16 tag_len,
 						    struct debug_htt_stats_req *stats_req)
 {
-	const struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf = tag_buf;
+	const struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf =
+		tag_buf;
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
@@ -3141,9 +3225,10 @@ htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void *tag_buf,
-								     u16 tag_len,
-								     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void *tag_buf,
+						  u16 tag_len,
+						  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3169,8 +3254,9 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const void
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
-						      struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_reo_resource_stats_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3207,9 +3293,10 @@ static inline void htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *tag_buf,
-								    u16 tag_len,
-								    struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const void *tag_buf,
+						 u16 tag_len,
+						 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3358,8 +3445,9 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
-							    struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
+					 struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3384,9 +3472,10 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
-							u16 tag_len,
-							struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
+				     u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3410,8 +3499,9 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
-							  struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
+				       struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3438,8 +3528,9 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
-						     struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
+				  struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_pdev_cca_stats_hist_v1_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3469,7 +3560,9 @@ static inline void htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_pdev_stats_cca_counters_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3538,8 +3631,9 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
-							 struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
+				      struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_pdev_stats_twt_sessions_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3560,8 +3654,9 @@ static inline void htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
-							struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
+				     struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_pdev_stats_twt_session_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;
@@ -3598,8 +3693,9 @@ static inline void htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
-						      struct debug_htt_stats_req *stats_req)
+static inline void
+htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
+				   struct debug_htt_stats_req *stats_req)
 {
 	const struct htt_pdev_obss_pd_stats_tlv *htt_stats_buf = tag_buf;
 	u8 *buf = stats_req->buf;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
