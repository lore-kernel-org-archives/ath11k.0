Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLd-0006rD-VP
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/8] ath11k: Remove dead code while handling amsdu packets
Date: Mon, 25 Nov 2019 16:36:23 +0000
Message-ID: <0101016ea36bd65c-fca10b66-bfe9-4338-9c4d-fac674f68cb6-000000@us-west-2.amazonses.com>
In-Reply-To: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
References: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
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

From: Tamizh chelvam <tamizhr@codeaurora.org>

Remove unexecuted code while handling amsdu packets.
The same logic is done before calling ath11k_dp_rx_msdu_coalesce

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0ff0ff81adeb..7aade0314e61 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1349,12 +1349,6 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
