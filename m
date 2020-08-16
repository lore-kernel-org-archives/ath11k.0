Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Ger-0004mx-HT
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 11:17:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 01/12] ath11k: hal: create register values dynamically
Date: Sun, 16 Aug 2020 14:16:28 +0300
Message-Id: <1597576599-8857-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
References: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

QCA6390 has different register offset compared to IPQ8074, so need to
attach the register offset dynamically based on hw_params.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |   2 +
 drivers/net/wireless/ath/ath11k/hal.h  |  72 +++++++++++-----------
 drivers/net/wireless/ath/ath11k/hw.c   | 105 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  49 +++++++++++++++
 4 files changed, 192 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index f1c07583836f..613a8a6721ba 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -32,6 +32,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hw_ops = &ipq8074_ops,
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 		.internal_sleep_clock = false,
+		.regs = &ipq8074_regs,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -46,6 +47,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hw_ops = &qca6390_ops,
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 		.internal_sleep_clock = true,
+		.regs = &qca6390_regs,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 40c51d80430c..f52fd61d685d 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -46,19 +46,19 @@ struct ath11k_base;
 /* SW2TCL(x) R0 ring configuration address */
 #define HAL_TCL1_RING_CMN_CTRL_REG		0x00000014
 #define HAL_TCL1_RING_DSCP_TID_MAP		0x0000002c
-#define HAL_TCL1_RING_BASE_LSB			0x00000510
-#define HAL_TCL1_RING_BASE_MSB			0x00000514
-#define HAL_TCL1_RING_ID			0x00000518
-#define HAL_TCL1_RING_MISC			0x00000520
-#define HAL_TCL1_RING_TP_ADDR_LSB		0x0000052c
-#define HAL_TCL1_RING_TP_ADDR_MSB		0x00000530
-#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0	0x00000540
-#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1	0x00000544
-#define HAL_TCL1_RING_MSI1_BASE_LSB		0x00000558
-#define HAL_TCL1_RING_MSI1_BASE_MSB		0x0000055c
-#define HAL_TCL1_RING_MSI1_DATA			0x00000560
-#define HAL_TCL2_RING_BASE_LSB			0x00000568
-#define HAL_TCL_RING_BASE_LSB			0x00000618
+#define HAL_TCL1_RING_BASE_LSB			ab->hw_params.regs->hal_tcl1_ring_base_lsb
+#define HAL_TCL1_RING_BASE_MSB			ab->hw_params.regs->hal_tcl1_ring_base_msb
+#define HAL_TCL1_RING_ID			ab->hw_params.regs->hal_tcl1_ring_id
+#define HAL_TCL1_RING_MISC			ab->hw_params.regs->hal_tcl1_ring_misc
+#define HAL_TCL1_RING_TP_ADDR_LSB		ab->hw_params.regs->hal_tcl1_ring_tp_addr_lsb
+#define HAL_TCL1_RING_TP_ADDR_MSB		ab->hw_params.regs->hal_tcl1_ring_tp_addr_msb
+#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0	ab->hw_params.regs->hal_tcl1_ring_consumer_int_setup_ix0
+#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1	ab->hw_params.regs->hal_tcl1_ring_consumer_int_setup_ix1
+#define HAL_TCL1_RING_MSI1_BASE_LSB		ab->hw_params.regs->hal_tcl1_ring_msi1_base_lsb
+#define HAL_TCL1_RING_MSI1_BASE_MSB		ab->hw_params.regs->hal_tcl1_ring_msi1_base_msb
+#define HAL_TCL1_RING_MSI1_DATA			ab->hw_params.regs->hal_tcl1_ring_msi1_data
+#define HAL_TCL2_RING_BASE_LSB			ab->hw_params.regs->hal_tcl2_ring_base_lsb
+#define HAL_TCL_RING_BASE_LSB			ab->hw_params.regs->hal_tcl_ring_base_lsb
 
 #define HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET \
 		(HAL_TCL1_RING_MSI1_BASE_LSB - HAL_TCL1_RING_BASE_LSB)
@@ -91,7 +91,7 @@ struct ath11k_base;
 		(HAL_TCL1_RING_TP - HAL_TCL1_RING_HP)
 
 /* TCL STATUS ring address */
-#define HAL_TCL_STATUS_RING_BASE_LSB		0x00000720
+#define HAL_TCL_STATUS_RING_BASE_LSB   ab->hw_params.regs->hal_tcl_status_ring_base_lsb
 #define HAL_TCL_STATUS_RING_HP			0x00002030
 
 /* REO2SW(x) R0 ring configuration address */
@@ -100,21 +100,21 @@ struct ath11k_base;
 #define HAL_REO1_DEST_RING_CTRL_IX_1		0x00000008
 #define HAL_REO1_DEST_RING_CTRL_IX_2		0x0000000c
 #define HAL_REO1_DEST_RING_CTRL_IX_3		0x00000010
-#define HAL_REO1_RING_BASE_LSB			0x0000029c
-#define HAL_REO1_RING_BASE_MSB			0x000002a0
-#define HAL_REO1_RING_ID			0x000002a4
-#define HAL_REO1_RING_MISC			0x000002ac
-#define HAL_REO1_RING_HP_ADDR_LSB		0x000002b0
-#define HAL_REO1_RING_HP_ADDR_MSB		0x000002b4
-#define HAL_REO1_RING_PRODUCER_INT_SETUP	0x000002c0
-#define HAL_REO1_RING_MSI1_BASE_LSB		0x000002e4
-#define HAL_REO1_RING_MSI1_BASE_MSB		0x000002e8
-#define HAL_REO1_RING_MSI1_DATA			0x000002ec
-#define HAL_REO2_RING_BASE_LSB			0x000002f4
-#define HAL_REO1_AGING_THRESH_IX_0		0x00000564
-#define HAL_REO1_AGING_THRESH_IX_1		0x00000568
-#define HAL_REO1_AGING_THRESH_IX_2		0x0000056c
-#define HAL_REO1_AGING_THRESH_IX_3		0x00000570
+ #define HAL_REO1_RING_BASE_LSB			ab->hw_params.regs->hal_reo1_ring_base_lsb
+#define HAL_REO1_RING_BASE_MSB			ab->hw_params.regs->hal_reo1_ring_base_msb
+#define HAL_REO1_RING_ID			ab->hw_params.regs->hal_reo1_ring_id
+#define HAL_REO1_RING_MISC			ab->hw_params.regs->hal_reo1_ring_misc
+#define HAL_REO1_RING_HP_ADDR_LSB		ab->hw_params.regs->hal_reo1_ring_hp_addr_lsb
+#define HAL_REO1_RING_HP_ADDR_MSB		ab->hw_params.regs->hal_reo1_ring_hp_addr_msb
+#define HAL_REO1_RING_PRODUCER_INT_SETUP	ab->hw_params.regs->hal_reo1_ring_producer_int_setup
+#define HAL_REO1_RING_MSI1_BASE_LSB		ab->hw_params.regs->hal_reo1_ring_msi1_base_lsb
+#define HAL_REO1_RING_MSI1_BASE_MSB		ab->hw_params.regs->hal_reo1_ring_msi1_base_msb
+#define HAL_REO1_RING_MSI1_DATA			ab->hw_params.regs->hal_reo1_ring_msi1_data
+#define HAL_REO2_RING_BASE_LSB			ab->hw_params.regs->hal_reo2_ring_base_lsb
+#define HAL_REO1_AGING_THRESH_IX_0		ab->hw_params.regs->hal_reo1_aging_thresh_ix_0
+#define HAL_REO1_AGING_THRESH_IX_1		ab->hw_params.regs->hal_reo1_aging_thresh_ix_1
+#define HAL_REO1_AGING_THRESH_IX_2		ab->hw_params.regs->hal_reo1_aging_thresh_ix_2
+#define HAL_REO1_AGING_THRESH_IX_3		ab->hw_params.regs->hal_reo1_aging_thresh_ix_3
 
 #define HAL_REO1_RING_MSI1_BASE_LSB_OFFSET \
 		(HAL_REO1_RING_MSI1_BASE_LSB - HAL_REO1_RING_BASE_LSB)
@@ -134,17 +134,17 @@ struct ath11k_base;
 #define HAL_REO1_RING_MISC_OFFSET (HAL_REO1_RING_MISC - HAL_REO1_RING_BASE_LSB)
 
 /* REO2SW(x) R2 ring pointers (head/tail) address */
-#define HAL_REO1_RING_HP			0x00003038
-#define HAL_REO1_RING_TP			0x0000303c
-#define HAL_REO2_RING_HP			0x00003040
+#define HAL_REO1_RING_HP			ab->hw_params.regs->hal_reo1_ring_hp
+#define HAL_REO1_RING_TP			ab->hw_params.regs->hal_reo1_ring_tp
+#define HAL_REO2_RING_HP			ab->hw_params.regs->hal_reo2_ring_hp
 
 #define HAL_REO1_RING_TP_OFFSET	(HAL_REO1_RING_TP - HAL_REO1_RING_HP)
 
 /* REO2TCL R0 ring configuration address */
-#define HAL_REO_TCL_RING_BASE_LSB		0x000003fc
+#define HAL_REO_TCL_RING_BASE_LSB		ab->hw_params.regs->hal_reo_tcl_ring_base_lsb
 
 /* REO2TCL R2 ring pointer (head/tail) address */
-#define HAL_REO_TCL_RING_HP			0x00003058
+#define HAL_REO_TCL_RING_HP			ab->hw_params.regs->hal_reo_tcl_ring_hp
 
 /* REO CMD R0 address */
 #define HAL_REO_CMD_RING_BASE_LSB		0x00000194
@@ -168,8 +168,8 @@ struct ath11k_base;
 #define HAL_CE_DST_STATUS_RING_HP		0x00000408
 
 /* REO status address */
-#define HAL_REO_STATUS_RING_BASE_LSB		0x00000504
-#define HAL_REO_STATUS_HP			0x00003070
+#define HAL_REO_STATUS_RING_BASE_LSB		ab->hw_params.regs->hal_reo_status_ring_base_lsb
+#define HAL_REO_STATUS_HP			ab->hw_params.regs->hal_reo_status_hp
 
 /* WBM Idle R0 address */
 #define HAL_WBM_IDLE_LINK_RING_BASE_LSB		0x00000860
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index f7354476d673..51ddd418bc3b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -3,6 +3,11 @@
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+
+#include "hw.h"
 #include "core.h"
 
 /* Map from pdev index to hw mac index */
@@ -104,3 +109,103 @@ const struct ath11k_hw_ring_mask ath11k_hw_ring_mask_ipq8074 = {
 	},
 };
 
+const struct ath11k_hw_regs ipq8074_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.hal_tcl1_ring_base_lsb = 0x00000510,
+	.hal_tcl1_ring_base_msb = 0x00000514,
+	.hal_tcl1_ring_id = 0x00000518,
+	.hal_tcl1_ring_misc = 0x00000520,
+	.hal_tcl1_ring_tp_addr_lsb = 0x0000052c,
+	.hal_tcl1_ring_tp_addr_msb = 0x00000530,
+	.hal_tcl1_ring_consumer_int_setup_ix0 = 0x00000540,
+	.hal_tcl1_ring_consumer_int_setup_ix1 = 0x00000544,
+	.hal_tcl1_ring_msi1_base_lsb = 0x00000558,
+	.hal_tcl1_ring_msi1_base_msb = 0x0000055c,
+	.hal_tcl1_ring_msi1_data = 0x00000560,
+	.hal_tcl2_ring_base_lsb = 0x00000568,
+	.hal_tcl_ring_base_lsb = 0x00000618,
+
+	/* TCL STATUS ring address */
+	.hal_tcl_status_ring_base_lsb = 0x00000720,
+
+	/* REO2SW(x) R0 ring configuration address */
+	.hal_reo1_ring_base_lsb = 0x0000029c,
+	.hal_reo1_ring_base_msb = 0x000002a0,
+	.hal_reo1_ring_id = 0x000002a4,
+	.hal_reo1_ring_misc = 0x000002ac,
+	.hal_reo1_ring_hp_addr_lsb = 0x000002b0,
+	.hal_reo1_ring_hp_addr_msb = 0x000002b4,
+	.hal_reo1_ring_producer_int_setup = 0x000002c0,
+	.hal_reo1_ring_msi1_base_lsb = 0x000002e4,
+	.hal_reo1_ring_msi1_base_msb = 0x000002e8,
+	.hal_reo1_ring_msi1_data = 0x000002ec,
+	.hal_reo2_ring_base_lsb = 0x000002f4,
+	.hal_reo1_aging_thresh_ix_0 = 0x00000564,
+	.hal_reo1_aging_thresh_ix_1 = 0x00000568,
+	.hal_reo1_aging_thresh_ix_2 = 0x0000056c,
+	.hal_reo1_aging_thresh_ix_3 = 0x00000570,
+
+	/* REO2SW(x) R2 ring pointers (head/tail) address */
+	.hal_reo1_ring_hp = 0x00003038,
+	.hal_reo1_ring_tp = 0x0000303c,
+	.hal_reo2_ring_hp = 0x00003040,
+
+	/* REO2TCL R0 ring configuration address */
+	.hal_reo_tcl_ring_base_lsb = 0x000003fc,
+	.hal_reo_tcl_ring_hp = 0x00003058,
+
+	/* REO status address */
+	.hal_reo_status_ring_base_lsb = 0x00000504,
+	.hal_reo_status_hp = 0x00003070,
+
+};
+
+const struct ath11k_hw_regs qca6390_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.hal_tcl1_ring_base_lsb = 0x00000684,
+	.hal_tcl1_ring_base_msb = 0x00000688,
+	.hal_tcl1_ring_id = 0x0000068c,
+	.hal_tcl1_ring_misc = 0x00000694,
+	.hal_tcl1_ring_tp_addr_lsb = 0x000006a0,
+	.hal_tcl1_ring_tp_addr_msb = 0x000006a4,
+	.hal_tcl1_ring_consumer_int_setup_ix0 = 0x000006b4,
+	.hal_tcl1_ring_consumer_int_setup_ix1 = 0x000006b8,
+	.hal_tcl1_ring_msi1_base_lsb = 0x000006cc,
+	.hal_tcl1_ring_msi1_base_msb = 0x000006d0,
+	.hal_tcl1_ring_msi1_data = 0x000006d4,
+	.hal_tcl2_ring_base_lsb = 0x000006dc,
+	.hal_tcl_ring_base_lsb = 0x0000078c,
+
+	/* TCL STATUS ring address */
+	.hal_tcl_status_ring_base_lsb = 0x00000894,
+
+	/* REO2SW(x) R0 ring configuration address */
+	.hal_reo1_ring_base_lsb = 0x00000244,
+	.hal_reo1_ring_base_msb = 0x00000248,
+	.hal_reo1_ring_id = 0x0000024c,
+	.hal_reo1_ring_misc = 0x00000254,
+	.hal_reo1_ring_hp_addr_lsb = 0x00000258,
+	.hal_reo1_ring_hp_addr_msb = 0x0000025c,
+	.hal_reo1_ring_producer_int_setup = 0x00000268,
+	.hal_reo1_ring_msi1_base_lsb = 0x0000028c,
+	.hal_reo1_ring_msi1_base_msb = 0x00000290,
+	.hal_reo1_ring_msi1_data = 0x00000294,
+	.hal_reo2_ring_base_lsb = 0x0000029c,
+	.hal_reo1_aging_thresh_ix_0 = 0x0000050c,
+	.hal_reo1_aging_thresh_ix_1 = 0x00000510,
+	.hal_reo1_aging_thresh_ix_2 = 0x00000514,
+	.hal_reo1_aging_thresh_ix_3 = 0x00000518,
+
+	/* REO2SW(x) R2 ring pointers (head/tail) address */
+	.hal_reo1_ring_hp = 0x00003030,
+	.hal_reo1_ring_tp = 0x00003034,
+	.hal_reo2_ring_hp = 0x00003038,
+
+	/* REO2TCL R0 ring configuration address */
+	.hal_reo_tcl_ring_base_lsb = 0x000003a4,
+	.hal_reo_tcl_ring_hp = 0x00003050,
+
+	/* REO status address */
+	.hal_reo_status_ring_base_lsb = 0x000004ac,
+	.hal_reo_status_hp = 0x00003068,
+};
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index aacd092dbddb..eb1d8a2beffd 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -135,6 +135,8 @@ struct ath11k_hw_params {
 	const struct ath11k_hw_ring_mask *ring_mask;
 
 	bool internal_sleep_clock;
+
+	const struct ath11k_hw_regs *regs;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
@@ -170,4 +172,51 @@ enum ath11k_bd_ie_type {
 	ATH11K_BD_IE_BOARD_EXT = 1,
 };
 
+struct ath11k_hw_regs {
+	u32 hal_tcl1_ring_base_lsb;
+	u32 hal_tcl1_ring_base_msb;
+	u32 hal_tcl1_ring_id;
+	u32 hal_tcl1_ring_misc;
+	u32 hal_tcl1_ring_tp_addr_lsb;
+	u32 hal_tcl1_ring_tp_addr_msb;
+	u32 hal_tcl1_ring_consumer_int_setup_ix0;
+	u32 hal_tcl1_ring_consumer_int_setup_ix1;
+	u32 hal_tcl1_ring_msi1_base_lsb;
+	u32 hal_tcl1_ring_msi1_base_msb;
+	u32 hal_tcl1_ring_msi1_data;
+	u32 hal_tcl2_ring_base_lsb;
+	u32 hal_tcl_ring_base_lsb;
+
+	u32 hal_tcl_status_ring_base_lsb;
+
+	u32 hal_reo1_ring_base_lsb;
+	u32 hal_reo1_ring_base_msb;
+	u32 hal_reo1_ring_id;
+	u32 hal_reo1_ring_misc;
+	u32 hal_reo1_ring_hp_addr_lsb;
+	u32 hal_reo1_ring_hp_addr_msb;
+	u32 hal_reo1_ring_producer_int_setup;
+	u32 hal_reo1_ring_msi1_base_lsb;
+	u32 hal_reo1_ring_msi1_base_msb;
+	u32 hal_reo1_ring_msi1_data;
+	u32 hal_reo2_ring_base_lsb;
+	u32 hal_reo1_aging_thresh_ix_0;
+	u32 hal_reo1_aging_thresh_ix_1;
+	u32 hal_reo1_aging_thresh_ix_2;
+	u32 hal_reo1_aging_thresh_ix_3;
+
+	u32 hal_reo1_ring_hp;
+	u32 hal_reo1_ring_tp;
+	u32 hal_reo2_ring_hp;
+
+	u32 hal_reo_tcl_ring_base_lsb;
+	u32 hal_reo_tcl_ring_hp;
+
+	u32 hal_reo_status_ring_base_lsb;
+	u32 hal_reo_status_hp;
+};
+
+extern const struct ath11k_hw_regs ipq8074_regs;
+extern const struct ath11k_hw_regs qca6390_regs;
+
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
