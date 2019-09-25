Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzCy-0003FF-0e
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:21 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B611560A05
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:18 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 2/5] ath11k: Remove ring mask macros defined for 0
Date: Wed, 25 Sep 2019 10:13:56 +0530
Message-Id: <1569386639-1242-2-git-send-email-vthiagar@codeaurora.org>
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

We'll define these macros with non-zero ring mask when
required in future.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index db67bab..a5e6956 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -323,7 +323,6 @@
 #define ATH11K_TX_RING_MASK_0 0x1
 #define ATH11K_TX_RING_MASK_1 0x2
 #define ATH11K_TX_RING_MASK_2 0x4
-#define ATH11K_TX_RING_MASK_3 0x0
 
 #define ATH11K_RX_RING_MASK_0 0x1
 #define ATH11K_RX_RING_MASK_1 0x2
@@ -331,40 +330,27 @@
 #define ATH11K_RX_RING_MASK_3 0x8
 
 #define ATH11K_RX_ERR_RING_MASK_0 0x1
-#define ATH11K_RX_ERR_RING_MASK_1 0x0
-#define ATH11K_RX_ERR_RING_MASK_2 0x0
-#define ATH11K_RX_ERR_RING_MASK_3 0x0
 
 #define ATH11K_RX_WBM_REL_RING_MASK_0 0x1
-#define ATH11K_RX_WBM_REL_RING_MASK_1 0x0
-#define ATH11K_RX_WBM_REL_RING_MASK_2 0x0
-#define ATH11K_RX_WBM_REL_RING_MASK_3 0x0
 
 #define ATH11K_REO_STATUS_RING_MASK_0 0x1
-#define ATH11K_REO_STATUS_RING_MASK_1 0x0
-#define ATH11K_REO_STATUS_RING_MASK_2 0x0
-#define ATH11K_REO_STATUS_RING_MASK_3 0x0
 
 #define ATH11K_RXDMA2HOST_RING_MASK_0 0x1
 #define ATH11K_RXDMA2HOST_RING_MASK_1 0x2
 #define ATH11K_RXDMA2HOST_RING_MASK_2 0x4
-#define ATH11K_RXDMA2HOST_RING_MASK_3 0x0
 
 #define ATH11K_HOST2RXDMA_RING_MASK_0 0x1
 #define ATH11K_HOST2RXDMA_RING_MASK_1 0x2
 #define ATH11K_HOST2RXDMA_RING_MASK_2 0x4
-#define ATH11K_HOST2RXDMA_RING_MASK_3 0x0
 
 #define ATH11K_RX_MON_STATUS_RING_MASK_0 0x1
 #define ATH11K_RX_MON_STATUS_RING_MASK_1 0x2
 #define ATH11K_RX_MON_STATUS_RING_MASK_2 0x4
-#define ATH11K_RX_MON_STATUS_RING_MASK_3 0x0
 
 const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_TX_RING_MASK_0,
 	ATH11K_TX_RING_MASK_1,
 	ATH11K_TX_RING_MASK_2,
-	ATH11K_TX_RING_MASK_3,
 };
 
 const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
@@ -384,37 +370,26 @@
 
 const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_RX_ERR_RING_MASK_0,
-	ATH11K_RX_ERR_RING_MASK_1,
-	ATH11K_RX_ERR_RING_MASK_2,
-	ATH11K_RX_ERR_RING_MASK_3,
 };
 
 const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_RX_WBM_REL_RING_MASK_0,
-	ATH11K_RX_WBM_REL_RING_MASK_1,
-	ATH11K_RX_WBM_REL_RING_MASK_2,
-	ATH11K_RX_WBM_REL_RING_MASK_3,
 };
 
 const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_REO_STATUS_RING_MASK_0,
-	ATH11K_REO_STATUS_RING_MASK_1,
-	ATH11K_REO_STATUS_RING_MASK_2,
-	ATH11K_REO_STATUS_RING_MASK_3,
 };
 
 const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_RXDMA2HOST_RING_MASK_0,
 	ATH11K_RXDMA2HOST_RING_MASK_1,
 	ATH11K_RXDMA2HOST_RING_MASK_2,
-	ATH11K_RXDMA2HOST_RING_MASK_3,
 };
 
 const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
 	ATH11K_HOST2RXDMA_RING_MASK_0,
 	ATH11K_HOST2RXDMA_RING_MASK_1,
 	ATH11K_HOST2RXDMA_RING_MASK_2,
-	ATH11K_HOST2RXDMA_RING_MASK_3,
 };
 
 /* enum ext_irq_num - irq nubers that can be used by external modules
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
