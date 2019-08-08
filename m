Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4c-00084N-Np
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:20 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 05/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 core.h
Date: Thu,  8 Aug 2019 18:33:02 +0530
Message-Id: <1565269392-2838-6-git-send-email-mkenna@codeaurora.org>
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
ath11k_base struct from 'sc' to 'ab' in core.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 79134c4fb2e7..55c636e33367 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -104,7 +104,7 @@ extern const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 
 struct ath11k_ext_irq_grp {
-	struct ath11k_base *sc;
+	struct ath11k_base *ab;
 	u32 irqs[ATH11K_EXT_IRQ_NUM_MAX];
 	u32 num_irq;
 	u32 grp_id;
@@ -783,7 +783,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev);
 void ath11k_core_free(struct ath11k_base *ath11k);
 int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
-void ath11k_core_free_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd);
+void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 
 void ath11k_core_halt(struct ath11k *ar);
 u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx);
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
