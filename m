Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsSWp-0007QT-QL
 for ath11k@lists.infradead.org; Tue, 30 Jul 2019 13:51:01 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath11k: Remove dead code while handling amsdu packets
Date: Tue, 30 Jul 2019 19:20:02 +0530
Message-Id: <1564494602-5380-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: Tamizh chelvam <tamizhr@codeaurora.org>

Remove unexecuted code while handling amsdu packets.
The same logic is done before calling ath11k_dp_rx_msdu_coalesce

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3794cac..6b22003 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1371,12 +1371,6 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	int rem_len;
 	int buf_len;
 
-	if (!rxcb->is_continuation) {
-		skb_put(first, HAL_RX_DESC_SIZE + l3pad_bytes + msdu_len);
-		skb_pull(first, HAL_RX_DESC_SIZE + l3pad_bytes);
-		return 0;
-	}
-
 	if (WARN_ON_ONCE(msdu_len <= (DP_RX_BUFFER_SIZE -
 			 (HAL_RX_DESC_SIZE + l3pad_bytes)))) {
 		skb_put(first, HAL_RX_DESC_SIZE + l3pad_bytes + msdu_len);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
