Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJGCM-00066h-Iy
 for ath11k@lists.infradead.org; Fri, 18 Sep 2020 13:13:12 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath11k: Remove unused function ath11k_htc_restore_tx_skb()
Date: Fri, 18 Sep 2020 21:12:42 +0800
Message-ID: <20200918131242.24000-1-yuehaibing@huawei.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

There is no caller in tree, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath11k/htc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index e9e354fc11fa..4de2350dfbf3 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -50,15 +50,6 @@ static struct sk_buff *ath11k_htc_build_tx_ctrl_skb(void *ab)
 	return skb;
 }
 
-static inline void ath11k_htc_restore_tx_skb(struct ath11k_htc *htc,
-					     struct sk_buff *skb)
-{
-	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
-
-	dma_unmap_single(htc->ab->dev, skb_cb->paddr, skb->len, DMA_TO_DEVICE);
-	skb_pull(skb, sizeof(struct ath11k_htc_hdr));
-}
-
 static void ath11k_htc_prepare_tx_skb(struct ath11k_htc_ep *ep,
 				      struct sk_buff *skb)
 {
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
