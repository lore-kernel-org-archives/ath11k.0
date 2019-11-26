Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeP-0003Mm-Gi
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 08/10] ath11k: Fix skb_panic observed during msdu coalescing
Date: Tue, 26 Nov 2019 11:04:56 +0000
Message-ID: <0101016ea762bd2f-3ff38ca6-39f9-44b0-9d1b-f0e2449c9800-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Sriram R <srirrama@codeaurora.org>

skb_panic is hit during msdu coalescing whenever
enough tailroom is not allocated based on the remaining
msdu length which is spread across in different rx buffers.

Compute the extra length for resizing the skb based on
the total msdu length and the msdu length of the first buffer.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 321a2bb657e8..acad74658e64 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1344,15 +1344,22 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 {
 	struct sk_buff *skb;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(first);
+	int buf_first_hdr_len, buf_first_len;
 	struct hal_rx_desc *ldesc;
 	int space_extra;
 	int rem_len;
 	int buf_len;
 
-	if (WARN_ON_ONCE(msdu_len <= (DP_RX_BUFFER_SIZE -
-			 (HAL_RX_DESC_SIZE + l3pad_bytes)))) {
-		skb_put(first, HAL_RX_DESC_SIZE + l3pad_bytes + msdu_len);
-		skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
+	/* As the msdu is spread across multiple rx buffers,
+	 * find the offset to the start of msdu for computing
+	 * the length of the msdu in the first buffer.
+	 */
+	buf_first_hdr_len = HAL_RX_DESC_SIZE + l3pad_bytes;
+	buf_first_len = DP_RX_BUFFER_SIZE - buf_first_hdr_len;
+
+	if (WARN_ON_ONCE(msdu_len <= buf_first_len)) {
+		skb_put(first, buf_first_hdr_len + msdu_len);
+		skb_pull(first, buf_first_hdr_len);
 		return 0;
 	}
 
@@ -1365,9 +1372,9 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	 * in the first buf is of length DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE.
 	 */
 	skb_put(first, DP_RX_BUFFER_SIZE);
-	skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
+	skb_pull(first, buf_first_hdr_len);
 
-	space_extra = msdu_len - (DP_RX_BUFFER_SIZE + skb_tailroom(first));
+	space_extra = msdu_len - (buf_first_len + skb_tailroom(first));
 	if (space_extra > 0 &&
 	    (pskb_expand_head(first, 0, space_extra, GFP_ATOMIC) < 0)) {
 		/* Free up all buffers of the MSDU */
@@ -1387,8 +1394,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	 */
 	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, ldesc);
 
-	rem_len = msdu_len -
-		  (DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE - l3pad_bytes);
+	rem_len = msdu_len - buf_first_len;
 	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
 		rxcb = ATH11K_SKB_RXCB(skb);
 		if (rxcb->is_continuation)
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
