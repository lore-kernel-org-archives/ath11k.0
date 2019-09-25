Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzD2-0003Ga-20
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:25 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A0C3D602E1
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:22 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 5/5] ath11k: Few clean ups in comments
Date: Wed, 25 Sep 2019 10:13:59 +0530
Message-Id: <1569386639-1242-5-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
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

Remove stale comments and fix spelling typo.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 29157fb..8efbecc 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -392,7 +392,7 @@
 	ATH11K_HOST2RXDMA_RING_MASK_2,
 };
 
-/* enum ext_irq_num - irq nubers that can be used by external modules
+/* enum ext_irq_num - irq numbers that can be used by external modules
  * like datapath
  */
 enum ext_irq_num {
@@ -584,8 +584,6 @@ int ath11k_ahb_start(struct ath11k_base *ab)
 	ath11k_ahb_ce_irqs_enable(ab);
 	ath11k_ce_rx_post_buf(ab);
 
-	/* Bring up other components as appropriate */
-
 	return 0;
 }
 
@@ -615,7 +613,6 @@ void ath11k_ahb_stop(struct ath11k_base *ab)
 	ath11k_ahb_kill_tasklets(ab);
 	del_timer_sync(&ab->rx_replenish_retry);
 	ath11k_ce_cleanup_pipes(ab);
-	/* Shutdown other components as appropriate */
 }
 
 int ath11k_ahb_power_up(struct ath11k_base *ab)
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
