Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgtMS-0007Gc-GI
 for ath11k@lists.infradead.org; Fri, 28 Jun 2019 16:04:29 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH v2 2/4] ath11k: changed parameter from u8 * to struct sk_buff *
Date: Fri, 28 Jun 2019 09:04:12 -0700
Message-Id: <1561737854-19003-2-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
References: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
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

Changed ath11k_hal_rx_parse_mon_status() to take sk_buff pointer instead of
opaque u8 pointer. Removed variables that became unused.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 8 ++------
 drivers/net/wireless/ath/ath11k/hal_rx.c | 6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.h | 2 +-
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9a1c24705a32..df15e446b76f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2602,8 +2602,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (ath11k_debug_is_pktlog_rx_stats_enabled(ar))
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 
-		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info,
-							    (u8 *)skb->data);
+		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
 
 		if (ppdu_info.peer_id == HAL_INVALID_PEERID ||
 		    hal_status != HAL_RX_MON_STATUS_PPDU_DONE) {
@@ -4026,7 +4025,6 @@ static void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	struct hal_rx_mon_ppdu_info *ppdu_info;
 	struct sk_buff *status_skb;
-	u8 *rx_tlv;
 	u32 tlv_status = HAL_TLV_STATUS_BUF_DONE;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 
@@ -4039,10 +4037,8 @@ static void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	while (!skb_queue_empty(&pmon->rx_status_q)) {
 		status_skb = skb_dequeue(&pmon->rx_status_q);
 
-		rx_tlv = status_skb->data;
-
 		tlv_status = ath11k_hal_rx_parse_mon_status(ar->ab, ppdu_info,
-							    rx_tlv);
+							    status_skb);
 		if (tlv_status == HAL_TLV_STATUS_PPDU_DONE) {
 			rx_mon_stats->status_ppdu_done++;
 			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index f3c0e3e13dfd..347e485e60c7 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1158,13 +1158,13 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
-			       u8 *data)
+			       struct sk_buff *skb)
 {
 	struct hal_tlv_hdr *tlv;
 	enum hal_rx_mon_status hal_status = HAL_RX_MON_STATUS_BUF_DONE;
 	u16 tlv_tag;
 	u16 tlv_len;
-	u8 *ptr = data;
+	u8 *ptr = skb->data;
 
 	do {
 		tlv = (struct hal_tlv_hdr *)ptr;
@@ -1185,7 +1185,7 @@ ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 		ptr += tlv_len;
 		ptr = PTR_ALIGN(ptr, HAL_TLV_ALIGN);
 
-		if ((ptr - data) >= DP_RX_BUFFER_SIZE)
+		if ((ptr - skb->data) >= DP_RX_BUFFER_SIZE)
 			break;
 	} while (hal_status == HAL_RX_MON_STATUS_PPDU_NOT_DONE);
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index bd6b8d2e9d5e..2c9b19194149 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -336,7 +336,7 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc,
 enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
-			       u8 *data);
+			       struct sk_buff *skb);
 #define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0 0xDDBEEF
 #define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1 0xADBEEF
 #define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2 0xBDBEEF
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
