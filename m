Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4k-0008BH-Kz
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:28 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 10/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 dp_rx.c
Date: Thu,  8 Aug 2019 18:33:07 +0530
Message-Id: <1565269392-2838-11-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in dp_rx.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 7d6b0c3689b9..cc3bf25c9a91 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -505,10 +505,10 @@ static void ath11k_dp_reo_cmd_free(struct ath11k_dp *dp, void *ctx,
 	struct dp_rx_tid *rx_tid = ctx;
 
 	if (status != HAL_REO_CMD_SUCCESS)
-		ath11k_warn(dp->sc, "failed to flush rx tid hw desc, tid %d status %d\n",
+		ath11k_warn(dp->ab, "failed to flush rx tid hw desc, tid %d status %d\n",
 			    rx_tid->tid, status);
 
-	dma_unmap_single(dp->sc->dev, rx_tid->paddr, rx_tid->size,
+	dma_unmap_single(dp->ab->dev, rx_tid->paddr, rx_tid->size,
 			 DMA_BIDIRECTIONAL);
 	kfree(rx_tid->vaddr);
 }
@@ -555,7 +555,7 @@ static void ath11k_dp_reo_cache_flush(struct ath11k_base *ab,
 static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 				      enum hal_reo_cmd_status status)
 {
-	struct ath11k_base *ab = dp->sc;
+	struct ath11k_base *ab = dp->ab;
 	struct dp_rx_tid *rx_tid = ctx;
 	struct dp_reo_cache_flush_elem *elem, *tmp;
 
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
