Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzV-0006Bi-2r
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 8/8] ath11k: remove unnecessary casts to u32
Date: Thu,  1 Oct 2020 12:34:50 +0300
Message-Id: <1601544890-13450-9-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
References: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

These casts are not needed. No changes in functionality.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 20f9cebc86d2..9904c0eb7587 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -330,7 +330,7 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *ab,
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
 		ath11k_hif_write32(ab, reg_base +
 				   HAL_REO1_RING_MSI1_BASE_LSB_OFFSET(ab),
-				   (u32)srng->msi_addr);
+				   srng->msi_addr);
 
 		val = FIELD_PREP(HAL_REO1_RING_MSI1_BASE_MSB_ADDR,
 				 ((u64)srng->msi_addr >>
@@ -344,7 +344,7 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *ab,
 				   srng->msi_data);
 	}
 
-	ath11k_hif_write32(ab, reg_base, (u32)srng->ring_base_paddr);
+	ath11k_hif_write32(ab, reg_base, srng->ring_base_paddr);
 
 	val = FIELD_PREP(HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB,
 			 ((u64)srng->ring_base_paddr >>
@@ -409,7 +409,7 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *ab,
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
 		ath11k_hif_write32(ab, reg_base +
 				   HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET(ab),
-				   (u32)srng->msi_addr);
+				   srng->msi_addr);
 
 		val = FIELD_PREP(HAL_TCL1_RING_MSI1_BASE_MSB_ADDR,
 				 ((u64)srng->msi_addr >>
@@ -424,7 +424,7 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *ab,
 				   srng->msi_data);
 	}
 
-	ath11k_hif_write32(ab, reg_base, (u32)srng->ring_base_paddr);
+	ath11k_hif_write32(ab, reg_base, srng->ring_base_paddr);
 
 	val = FIELD_PREP(HAL_TCL1_RING_BASE_MSB_RING_BASE_ADDR_MSB,
 			 ((u64)srng->ring_base_paddr >>
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
