Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZy01-0002Qy-D5
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:08:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 06/10] ath11k: avoid use_after_free in
 ath11k_dp_rx_msdu_coalesce API
Date: Wed, 27 Nov 2019 14:08:54 +0000
Message-ID: <0101016ead31856c-9a981fbf-c803-49d3-84e6-11bf72bd38c7-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Accessing already stored first msdu data after the skb expand trigger
use_after_free, since first msdu got deleted. so do the descriptor copy
operation before the skb expand operation.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 67efa247bf65..f87bd327b082 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1376,6 +1376,11 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	skb_put(first, DP_RX_BUFFER_SIZE);
 	skb_pull(first, buf_first_hdr_len);
 
+	/* When an MSDU spread over multiple buffers attention, MSDU_END and
+	 * MPDU_END tlvs are valid only in the last buffer. Copy those tlvs.
+	 */
+	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, ldesc);
+
 	space_extra = msdu_len - (buf_first_len + skb_tailroom(first));
 	if (space_extra > 0 &&
 	    (pskb_expand_head(first, 0, space_extra, GFP_ATOMIC) < 0)) {
@@ -1391,11 +1396,6 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 		return -ENOMEM;
 	}
 
-	/* When an MSDU spread over multiple buffers attention, MSDU_END and
-	 * MPDU_END tlvs are valid only in the last buffer. Copy those tlvs.
-	 */
-	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, ldesc);
-
 	rem_len = msdu_len - buf_first_len;
 	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
 		rxcb = ATH11K_SKB_RXCB(skb);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
