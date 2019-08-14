Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxkZo-0007Aa-V0
 for ath11k@lists.infradead.org; Wed, 14 Aug 2019 04:07:58 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix skb_panic observed during msdu coalescing
Date: Wed, 14 Aug 2019 09:37:41 +0530
Message-Id: <1565755661-811-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

skb_panic is hit during msdu coalescing whenever
enough tailroom is not allocated based on the remaining
msdu length which is spread across in different rx buffers.

Compute the extra length for resizing the skb based on
the total msdu length and the msdu length of the first buffer.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 7d6b0c3..27d526b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1362,25 +1362,32 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 				      struct sk_buff_head *msdu_list,
 				      struct sk_buff *first, struct sk_buff *last,
-				      u8 l3pad_bytes, int msdu_len)
+				      u8 l3pad_bytes, int msdu_total_len)
 {
 	struct sk_buff *skb;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(first);
+	int msdu_first_offset, msdu_first_len;
 	struct hal_rx_desc *ldesc;
 	int space_extra;
 	int rem_len;
 	int buf_len;
 
+	/* As the msdu is spread across multiple rx buffers,
+	 * find the offset to the start of msdu for computing
+	 * the length of the msdu in the first buffer.
+	 */
+	msdu_first_offset = HAL_RX_DESC_SIZE + l3pad_bytes;
+	msdu_first_len = DP_RX_BUFFER_SIZE - msdu_first_offset;
+
 	if (!rxcb->is_continuation) {
-		skb_put(first, HAL_RX_DESC_SIZE + l3pad_bytes + msdu_len);
-		skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
+		skb_put(first, msdu_first_offset + msdu_total_len);
+		skb_pull(first, msdu_first_offset);
 		return 0;
 	}
 
-	if (WARN_ON_ONCE(msdu_len <= (DP_RX_BUFFER_SIZE -
-			 (HAL_RX_DESC_SIZE + l3pad_bytes)))) {
-		skb_put(first, HAL_RX_DESC_SIZE + l3pad_bytes + msdu_len);
-		skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
+	if (WARN_ON_ONCE(msdu_total_len <= msdu_first_len)) {
+		skb_put(first, msdu_first_offset + msdu_total_len);
+		skb_pull(first, msdu_first_offset);
 		return 0;
 	}
 
@@ -1393,9 +1400,9 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	 * in the first buf is of length DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE.
 	 */
 	skb_put(first, DP_RX_BUFFER_SIZE);
-	skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
+	skb_pull(first, msdu_first_offset);
 
-	space_extra = msdu_len - (DP_RX_BUFFER_SIZE + skb_tailroom(first));
+	space_extra = msdu_total_len - (msdu_first_len + skb_tailroom(first));
 	if (space_extra > 0 &&
 	    (pskb_expand_head(first, 0, space_extra, GFP_ATOMIC) < 0)) {
 		/* Free up all buffers of the MSDU */
@@ -1415,8 +1422,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	 */
 	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, ldesc);
 
-	rem_len = msdu_len -
-		  (DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE - l3pad_bytes);
+	rem_len = msdu_total_len - msdu_first_len;
 	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
 		rxcb = ATH11K_SKB_RXCB(skb);
 		if (rxcb->is_continuation)
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
