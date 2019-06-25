Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfqIU-0004JX-VW
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 18:36:04 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH] ath11k: add hal dbg mask and utilized for hal stats
Date: Tue, 25 Jun 2019 11:35:52 -0700
Message-Id: <1561487752-24827-1-git-send-email-msinada@codeaurora.org>
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
Cc: Muna Sinada <msinada@codeaurora.org>

Added HAL debug mask. Replaced use of ath11k_info() in
ath11k_hal_reo_status_queue_stats() with ath11k_dbg(), which utilizes new
HAL debug mask.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h  |  1 +
 drivers/net/wireless/ath/ath11k/hal_rx.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 13973d972169..4cfabed9d235 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -21,6 +21,7 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_MGMT		= 0x00000100,
 	ATH11K_DBG_REG		= 0x00000200,
 	ATH11K_DBG_TESTMODE	= 0x00000400,
+	ATH11k_DBG_HAL		= 0x00000800,
 	ATH11K_DBG_ANY		= 0xffffffff,
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 3f59b8a75c2a..fde25a186a20 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -482,30 +482,30 @@ void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
 					  desc->hdr.info0);
 
-	ath11k_info(ab, "Queue stats status:\n");
-	ath11k_info(ab, "header: cmd_num %d status %d\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "Queue stats status:\n");
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "header: cmd_num %d status %d\n",
 		    status->uniform_hdr.cmd_num,
 		    status->uniform_hdr.cmd_status);
-	ath11k_info(ab, "ssn %ld cur_idx %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "ssn %ld cur_idx %ld\n",
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_SSN,
 			      desc->info0),
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_CUR_IDX,
 			      desc->info0));
-	ath11k_info(ab, "pn = [%08x, %08x, %08x, %08x]\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "pn = [%08x, %08x, %08x, %08x]\n",
 		    desc->pn[0], desc->pn[1], desc->pn[2], desc->pn[3]);
-	ath11k_info(ab, "last_rx: enqueue_tstamp %08x dequeue_tstamp %08x\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "last_rx: enqueue_tstamp %08x dequeue_tstamp %08x\n",
 		    desc->last_rx_enqueue_timestamp,
 		    desc->last_rx_dequeue_timestamp);
-	ath11k_info(ab, "rx_bitmap [%08x %08x %08x %08x %08x %08x %08x %08x]\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "rx_bitmap [%08x %08x %08x %08x %08x %08x %08x %08x]\n",
 		    desc->rx_bitmap[0], desc->rx_bitmap[1], desc->rx_bitmap[2],
 		    desc->rx_bitmap[3], desc->rx_bitmap[4], desc->rx_bitmap[5],
 		    desc->rx_bitmap[6], desc->rx_bitmap[7]);
-	ath11k_info(ab, "count: cur_mpdu %ld cur_msdu %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "count: cur_mpdu %ld cur_msdu %ld\n",
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MPDU_COUNT,
 			      desc->info1),
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MSDU_COUNT,
 			      desc->info1));
-	ath11k_info(ab, "fwd_timeout %ld fwd_bar %ld dup_count %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "fwd_timeout %ld fwd_bar %ld dup_count %ld\n",
 		    FIELD_GET(
 			    HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_TIMEOUT_COUNT,
 			    desc->info2),
@@ -514,22 +514,22 @@ void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 		    FIELD_GET(
 			   HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_DUPLICATE_COUNT,
 			   desc->info2));
-	ath11k_info(ab, "frames_in_order %ld bar_rcvd %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "frames_in_order %ld bar_rcvd %ld\n",
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_FIO_COUNT,
 			      desc->info3),
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_BAR_RCVD_CNT,
 			      desc->info3));
-	ath11k_info(ab, "num_mpdus %d num_msdus %d total_bytes %d\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "num_mpdus %d num_msdus %d total_bytes %d\n",
 		    desc->num_mpdu_frames, desc->num_msdu_frames,
 		    desc->total_bytes);
-	ath11k_info(ab, "late_rcvd %ld win_jump_2k %ld hole_cnt %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "late_rcvd %ld win_jump_2k %ld hole_cnt %ld\n",
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_LATE_RX_MPDU,
 			      desc->info4),
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_WINDOW_JMP2K,
 			      desc->info4),
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_HOLE_COUNT,
 			      desc->info4));
-	ath11k_info(ab, "looping count %ld\n",
+	ath11k_dbg(ab, ATH11k_DBG_HAL, "looping count %ld\n",
 		    FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO5_LOOPING_CNT,
 			      desc->info5));
 }
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
