Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2XJ-0001so-PA
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:15:55 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 2/4] ath11k: Use macros for magic arguments
Date: Thu, 20 Jun 2019 12:15:27 -0700
Message-Id: <1561058129-25625-2-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
References: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
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

Created macros to provide clarity in the use of the magic parameter

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 12 ++++++++----
 drivers/net/wireless/ath/ath11k/hal_rx.h |  4 ++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 329ecc6566f8..622f4dfa5535 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -753,7 +753,8 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 	memset(qdesc, 0, sizeof(*qdesc));
 
 	ath11k_hal_reo_set_desc_hdr(&qdesc->desc_hdr, HAL_DESC_REO_OWNED,
-				    HAL_DESC_REO_QUEUE_DESC, 0xDDBEEF);
+				    HAL_DESC_REO_QUEUE_DESC,
+				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0);
 
 	qdesc->rx_queue_num = FIELD_PREP(HAL_RX_REO_QUEUE_RX_QUEUE_NUMBER, tid);
 
@@ -800,13 +801,16 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 	 */
 	memset(ext_desc, 0, 3 * sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
-				    HAL_DESC_REO_QUEUE_EXT_DESC, 0xADBEEF);
+				    HAL_DESC_REO_QUEUE_EXT_DESC,
+				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1);
 	ext_desc++;
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
-				    HAL_DESC_REO_QUEUE_EXT_DESC, 0xBDBEEF);
+				    HAL_DESC_REO_QUEUE_EXT_DESC,
+				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2);
 	ext_desc++;
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
-				    HAL_DESC_REO_QUEUE_EXT_DESC, 0xCDBEEF);
+				    HAL_DESC_REO_QUEUE_EXT_DESC,
+				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3);
 }
 
 void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 650ebe5d952c..bd6b8d2e9d5e 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -337,4 +337,8 @@ enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
 			       u8 *data);
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0 0xDDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1 0xADBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2 0xBDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3 0xCDBEEF
 #endif
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
