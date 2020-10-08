Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQTop-00089f-H6
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 11:10:45 +0000
Received: from CHECSTEX0180100-LIN.qca.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vthiagar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 39FC7C433FE
 for <ath11k@lists.infradead.org>; Thu,  8 Oct 2020 11:10:37 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k: Remove unnecessary data sync to cpu on monitor buffer
Date: Thu,  8 Oct 2020 16:40:29 +0530
Message-Id: <1602155429-15755-1-git-send-email-vthiagar@codeaurora.org>
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

Monitor ring Rx buffer is not really modified between dma map
and unmap. So remove the unnecssary data sync before dma unmap.
This does not fix any visible issue, found in code review.

Compile tested only.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0162532..4455e5af 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2856,10 +2856,6 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 
 			rxcb = ATH11K_SKB_RXCB(skb);
 
-			dma_sync_single_for_cpu(ab->dev, rxcb->paddr,
-						skb->len + skb_tailroom(skb),
-						DMA_FROM_DEVICE);
-
 			dma_unmap_single(ab->dev, rxcb->paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_BIDIRECTIONAL);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
