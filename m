Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfqGH-0002xM-CM
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 18:33:46 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 2/4] ath11k: changed parameter from u8 * to struct sk_buff *
Date: Tue, 25 Jun 2019 11:33:32 -0700
Message-Id: <1561487614-24577-2-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561487614-24577-1-git-send-email-msinada@codeaurora.org>
References: <1561487614-24577-1-git-send-email-msinada@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 10 ++--------
 drivers/net/wireless/ath/ath11k/hal_rx.c |  6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.h |  2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 41f6d4115e06..02195f506e7a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2406,8 +2406,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 		}
 
-		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info,
-							    (u8 *)skb->data);
+		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
 
 		if (ppdu_info.peer_id == HAL_INVALID_PEERID ||
 		    hal_status != HAL_RX_MON_STATUS_PPDU_DONE) {
@@ -3843,8 +3842,6 @@ static inline void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	struct hal_rx_mon_ppdu_info *ppdu_info;
 	struct sk_buff *status_skb;
-	u8 *rx_tlv;
-	u8 *rx_tlv_start;
 	u32 tlv_status = HAL_TLV_STATUS_BUF_DONE;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 
@@ -3857,11 +3854,8 @@ static inline void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	while (!skb_queue_empty(&pmon->rx_status_q)) {
 		status_skb = skb_dequeue(&pmon->rx_status_q);
 
-		rx_tlv = status_skb->data;
-		rx_tlv_start = rx_tlv;
-
 		tlv_status = ath11k_hal_rx_parse_mon_status(ar->ab, ppdu_info,
-							    rx_tlv);
+							    status_skb);
 		if (tlv_status == HAL_TLV_STATUS_PPDU_DONE) {
 			rx_mon_stats->status_ppdu_done++;
 			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 2d2d5cd5ea5f..3f59b8a75c2a 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1156,13 +1156,13 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
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
@@ -1183,7 +1183,7 @@ ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
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
