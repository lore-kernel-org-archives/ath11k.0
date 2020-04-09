Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMSZw-0007NJ-P3
 for ath11k@lists.infradead.org; Thu, 09 Apr 2020 08:30:30 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH] ath11k: set IRQ_DISABLE_UNLAZY flag for DP interrupts
Date: Thu,  9 Apr 2020 14:00:13 +0530
Message-Id: <1586421013-23025-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org

Unlike CE interrupts, DP interrupts are not enabled/disabled at
source; they are enabled/disabled only at GIC level, therefore
it is required to set IRQ_DISABLE_UNLAZY flag to avoid spurious
interrupts.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 59342d2..3b2b76d 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -788,7 +788,7 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *ab)
 			irq = platform_get_irq_byname(ab->pdev,
 						      irq_name[irq_idx]);
 			ab->irq_num[irq_idx] = irq;
-			irq_set_status_flags(irq, IRQ_NOAUTOEN);
+			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
 			ret = request_irq(irq, ath11k_ahb_ext_interrupt_handler,
 					  IRQF_TRIGGER_RISING,
 					  irq_name[irq_idx], irq_grp);
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
