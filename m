Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4m-0008Do-Sm
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:30 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 11/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 hal.c
Date: Thu,  8 Aug 2019 18:33:08 +0530
Message-Id: <1565269392-2838-12-git-send-email-mkenna@codeaurora.org>
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
ath11k_base struct from 'sc' to 'ab' in hal.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 134 +++++++++++++-------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 9eac3113de23..e0ec7c5f8112 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -285,13 +285,13 @@ static const struct hal_srng_config hw_srng_config[] = {
 	},
 };
 
-static int ath11k_hal_alloc_cont_rdp(struct ath11k_base *sc)
+static int ath11k_hal_alloc_cont_rdp(struct ath11k_base *ab)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	size_t size;
 
 	size = sizeof(u32) * HAL_SRNG_RING_ID_MAX;
-	hal->rdp.vaddr = dma_alloc_coherent(sc->dev, size, &hal->rdp.paddr,
+	hal->rdp.vaddr = dma_alloc_coherent(ab->dev, size, &hal->rdp.paddr,
 					    GFP_KERNEL);
 	if (!hal->rdp.vaddr)
 		return -ENOMEM;
@@ -299,27 +299,27 @@ static int ath11k_hal_alloc_cont_rdp(struct ath11k_base *sc)
 	return 0;
 }
 
-static void ath11k_hal_free_cont_rdp(struct ath11k_base *sc)
+static void ath11k_hal_free_cont_rdp(struct ath11k_base *ab)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	size_t size;
 
 	if (!hal->rdp.vaddr)
 		return;
 
 	size = sizeof(u32) * HAL_SRNG_RING_ID_MAX;
-	dma_free_coherent(sc->dev, size,
+	dma_free_coherent(ab->dev, size,
 			  hal->rdp.vaddr, hal->rdp.paddr);
 	hal->rdp.vaddr = NULL;
 }
 
-static int ath11k_hal_alloc_cont_wrp(struct ath11k_base *sc)
+static int ath11k_hal_alloc_cont_wrp(struct ath11k_base *ab)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	size_t size;
 
 	size = sizeof(u32) * HAL_SRNG_NUM_LMAC_RINGS;
-	hal->wrp.vaddr = dma_alloc_coherent(sc->dev, size, &hal->wrp.paddr,
+	hal->wrp.vaddr = dma_alloc_coherent(ab->dev, size, &hal->wrp.paddr,
 					    GFP_KERNEL);
 	if (!hal->wrp.vaddr)
 		return -ENOMEM;
@@ -327,21 +327,21 @@ static int ath11k_hal_alloc_cont_wrp(struct ath11k_base *sc)
 	return 0;
 }
 
-static void ath11k_hal_free_cont_wrp(struct ath11k_base *sc)
+static void ath11k_hal_free_cont_wrp(struct ath11k_base *ab)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	size_t size;
 
 	if (!hal->wrp.vaddr)
 		return;
 
 	size = sizeof(u32) * HAL_SRNG_NUM_LMAC_RINGS;
-	dma_free_coherent(sc->dev, size,
+	dma_free_coherent(ab->dev, size,
 			  hal->wrp.vaddr, hal->wrp.paddr);
 	hal->wrp.vaddr = NULL;
 }
 
-static void ath11k_hal_ce_dst_setup(struct ath11k_base *sc,
+static void ath11k_hal_ce_dst_setup(struct ath11k_base *ab,
 				    struct hal_srng *srng, int ring_num)
 {
 	const struct hal_srng_config *srng_config = &hw_srng_config[HAL_CE_DST];
@@ -351,17 +351,17 @@ static void ath11k_hal_ce_dst_setup(struct ath11k_base *sc,
 	addr = HAL_CE_DST_RING_CTRL +
 	       srng_config->reg_start[HAL_SRNG_REG_GRP_R0] +
 	       ring_num * srng_config->reg_size[HAL_SRNG_REG_GRP_R0];
-	val = ath11k_ahb_read32(sc, addr);
+	val = ath11k_ahb_read32(ab, addr);
 	val &= ~HAL_CE_DST_R0_DEST_CTRL_MAX_LEN;
 	val |= FIELD_PREP(HAL_CE_DST_R0_DEST_CTRL_MAX_LEN,
 			  srng->u.dst_ring.max_buffer_length);
-	ath11k_ahb_write32(sc, addr, val);
+	ath11k_ahb_write32(ab, addr, val);
 }
 
-static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *sc,
+static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *ab,
 					struct hal_srng *srng)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	u32 val;
 	u64 hp_addr;
 	u32 reg_base;
@@ -369,7 +369,7 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *sc,
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
 
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
-		ath11k_ahb_write32(sc, reg_base +
+		ath11k_ahb_write32(ab, reg_base +
 				       HAL_REO1_RING_MSI1_BASE_LSB_OFFSET,
 				   (u32)srng->msi_addr);
 
@@ -377,26 +377,26 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *sc,
 				 ((u64)srng->msi_addr >>
 				  HAL_ADDR_MSB_REG_SHIFT)) |
 		      HAL_REO1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
-		ath11k_ahb_write32(sc, reg_base +
+		ath11k_ahb_write32(ab, reg_base +
 				       HAL_REO1_RING_MSI1_BASE_MSB_OFFSET, val);
 
-		ath11k_ahb_write32(sc,
+		ath11k_ahb_write32(ab,
 				   reg_base + HAL_REO1_RING_MSI1_DATA_OFFSET,
 				   srng->msi_data);
 	}
 
-	ath11k_ahb_write32(sc, reg_base, (u32)srng->ring_base_paddr);
+	ath11k_ahb_write32(ab, reg_base, (u32)srng->ring_base_paddr);
 
 	val = FIELD_PREP(HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB,
 			 ((u64)srng->ring_base_paddr >>
 			  HAL_ADDR_MSB_REG_SHIFT)) |
 	      FIELD_PREP(HAL_REO1_RING_BASE_MSB_RING_SIZE,
 			 (srng->entry_size * srng->num_entries));
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_BASE_MSB_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_BASE_MSB_OFFSET, val);
 
 	val = FIELD_PREP(HAL_REO1_RING_ID_RING_ID, srng->ring_id) |
 	      FIELD_PREP(HAL_REO1_RING_ID_ENTRY_SIZE, srng->entry_size);
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_ID_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_ID_OFFSET, val);
 
 	/* interrupt setup */
 	val = FIELD_PREP(HAL_REO1_RING_PRDR_INT_SETUP_INTR_TMR_THOLD,
@@ -406,22 +406,22 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *sc,
 			  (srng->intr_batch_cntr_thres_entries *
 			   srng->entry_size));
 
-	ath11k_ahb_write32(sc,
+	ath11k_ahb_write32(ab,
 			   reg_base + HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET,
 			   val);
 
 	hp_addr = hal->rdp.paddr +
 		  ((unsigned long)srng->u.dst_ring.hp_addr -
 		   (unsigned long)hal->rdp.vaddr);
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_HP_ADDR_LSB_OFFSET,
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_LSB_OFFSET,
 			   hp_addr & HAL_ADDR_LSB_REG_MASK);
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_HP_ADDR_MSB_OFFSET,
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_MSB_OFFSET,
 			   hp_addr >> HAL_ADDR_MSB_REG_SHIFT);
 
 	/* Initialize head and tail pointers to indicate ring is empty */
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
-	ath11k_ahb_write32(sc, reg_base, 0);
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_TP_OFFSET, 0);
+	ath11k_ahb_write32(ab, reg_base, 0);
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_TP_OFFSET, 0);
 	*srng->u.dst_ring.hp_addr = 0;
 
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
@@ -434,13 +434,13 @@ static void ath11k_hal_srng_dst_hw_init(struct ath11k_base *sc,
 		val |= HAL_REO1_RING_MISC_MSI_SWAP;
 	val |= HAL_REO1_RING_MISC_SRNG_ENABLE;
 
-	ath11k_ahb_write32(sc, reg_base + HAL_REO1_RING_MISC_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_REO1_RING_MISC_OFFSET, val);
 }
 
-static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
+static void ath11k_hal_srng_src_hw_init(struct ath11k_base *ab,
 					struct hal_srng *srng)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	u32 val;
 	u64 tp_addr;
 	u32 reg_base;
@@ -448,7 +448,7 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
 
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
-		ath11k_ahb_write32(sc, reg_base +
+		ath11k_ahb_write32(ab, reg_base +
 				       HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET,
 				   (u32)srng->msi_addr);
 
@@ -456,26 +456,26 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 				 ((u64)srng->msi_addr >>
 				  HAL_ADDR_MSB_REG_SHIFT)) |
 		      HAL_TCL1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
-		ath11k_ahb_write32(sc, reg_base +
+		ath11k_ahb_write32(ab, reg_base +
 				       HAL_TCL1_RING_MSI1_BASE_MSB_OFFSET,
 				   val);
 
-		ath11k_ahb_write32(sc, reg_base +
+		ath11k_ahb_write32(ab, reg_base +
 				       HAL_TCL1_RING_MSI1_DATA_OFFSET,
 				   srng->msi_data);
 	}
 
-	ath11k_ahb_write32(sc, reg_base, (u32)srng->ring_base_paddr);
+	ath11k_ahb_write32(ab, reg_base, (u32)srng->ring_base_paddr);
 
 	val = FIELD_PREP(HAL_TCL1_RING_BASE_MSB_RING_BASE_ADDR_MSB,
 			 ((u64)srng->ring_base_paddr >>
 			  HAL_ADDR_MSB_REG_SHIFT)) |
 	      FIELD_PREP(HAL_TCL1_RING_BASE_MSB_RING_SIZE,
 			 (srng->entry_size * srng->num_entries));
-	ath11k_ahb_write32(sc, reg_base + HAL_TCL1_RING_BASE_MSB_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_TCL1_RING_BASE_MSB_OFFSET, val);
 
 	val = FIELD_PREP(HAL_REO1_RING_ID_ENTRY_SIZE, srng->entry_size);
-	ath11k_ahb_write32(sc, reg_base + HAL_TCL1_RING_ID_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_TCL1_RING_ID_OFFSET, val);
 
 	/* interrupt setup */
 	/* NOTE: IPQ8074 v2 requires the interrupt timer threshold in the
@@ -488,7 +488,7 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 			  (srng->intr_batch_cntr_thres_entries *
 			   srng->entry_size));
 
-	ath11k_ahb_write32(sc,
+	ath11k_ahb_write32(ab,
 			   reg_base + HAL_TCL1_RING_CONSR_INT_SETUP_IX0_OFFSET,
 			   val);
 
@@ -497,7 +497,7 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 		val |= FIELD_PREP(HAL_TCL1_RING_CONSR_INT_SETUP_IX1_LOW_THOLD,
 				  srng->u.src_ring.low_threshold);
 	}
-	ath11k_ahb_write32(sc,
+	ath11k_ahb_write32(ab,
 			   reg_base + HAL_TCL1_RING_CONSR_INT_SETUP_IX1_OFFSET,
 			   val);
 
@@ -505,18 +505,18 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 		tp_addr = hal->rdp.paddr +
 			  ((unsigned long)srng->u.src_ring.tp_addr -
 			   (unsigned long)hal->rdp.vaddr);
-		ath11k_ahb_write32(sc,
+		ath11k_ahb_write32(ab,
 				   reg_base + HAL_TCL1_RING_TP_ADDR_LSB_OFFSET,
 				   tp_addr & HAL_ADDR_LSB_REG_MASK);
-		ath11k_ahb_write32(sc,
+		ath11k_ahb_write32(ab,
 				   reg_base + HAL_TCL1_RING_TP_ADDR_MSB_OFFSET,
 				   tp_addr >> HAL_ADDR_MSB_REG_SHIFT);
 	}
 
 	/* Initialize head and tail pointers to indicate ring is empty */
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
-	ath11k_ahb_write32(sc, reg_base, 0);
-	ath11k_ahb_write32(sc, reg_base + HAL_TCL1_RING_TP_OFFSET, 0);
+	ath11k_ahb_write32(ab, reg_base, 0);
+	ath11k_ahb_write32(ab, reg_base + HAL_TCL1_RING_TP_OFFSET, 0);
 	*srng->u.src_ring.tp_addr = 0;
 
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
@@ -533,19 +533,19 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *sc,
 
 	val |= HAL_TCL1_RING_MISC_SRNG_ENABLE;
 
-	ath11k_ahb_write32(sc, reg_base + HAL_TCL1_RING_MISC_OFFSET, val);
+	ath11k_ahb_write32(ab, reg_base + HAL_TCL1_RING_MISC_OFFSET, val);
 }
 
-static void ath11k_hal_srng_hw_init(struct ath11k_base *sc,
+static void ath11k_hal_srng_hw_init(struct ath11k_base *ab,
 				    struct hal_srng *srng)
 {
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
-		ath11k_hal_srng_src_hw_init(sc, srng);
+		ath11k_hal_srng_src_hw_init(ab, srng);
 	else
-		ath11k_hal_srng_dst_hw_init(sc, srng);
+		ath11k_hal_srng_dst_hw_init(ab, srng);
 }
 
-static int ath11k_hal_srng_get_ring_id(struct ath11k_base *sc,
+static int ath11k_hal_srng_get_ring_id(struct ath11k_base *ab,
 				       enum hal_ring_type type,
 				       int ring_num, int mac_id)
 {
@@ -553,7 +553,7 @@ static int ath11k_hal_srng_get_ring_id(struct ath11k_base *sc,
 	int ring_id;
 
 	if (ring_num >= srng_config->max_rings) {
-		ath11k_warn(sc, "invalid ring number :%d\n", ring_num);
+		ath11k_warn(ab, "invalid ring number :%d\n", ring_num);
 		return -EINVAL;
 	}
 
@@ -806,7 +806,7 @@ u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
 	return desc;
 }
 
-u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *sc,
+u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *ab,
 				   struct hal_srng *srng)
 {
 	u32 *desc;
@@ -826,7 +826,7 @@ u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *sc,
 	return desc;
 }
 
-u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *sc,
+u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *ab,
 					 struct hal_srng *srng)
 {
 	u32 *desc;
@@ -843,7 +843,7 @@ u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *sc,
 	return desc;
 }
 
-u32 *ath11k_hal_srng_src_peek(struct ath11k_base *sc, struct hal_srng *srng)
+u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
 
@@ -988,11 +988,11 @@ void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 			   HAL_WBM_IDLE_LINK_RING_MISC_ADDR, 0x40);
 }
 
-int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
+int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 			  int ring_num, int mac_id,
 			  struct hal_srng_params *params)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	const struct hal_srng_config *srng_config = &hw_srng_config[type];
 	struct hal_srng *srng;
 	int ring_id;
@@ -1000,7 +1000,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
 	int i;
 	u32 reg_base;
 
-	ring_id = ath11k_hal_srng_get_ring_id(sc, type, ring_num, mac_id);
+	ring_id = ath11k_hal_srng_get_ring_id(ab, type, ring_num, mac_id);
 	if (ring_id < 0)
 		return ring_id;
 
@@ -1048,7 +1048,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
 			srng->flags |= HAL_SRNG_FLAGS_LMAC_RING;
 		} else {
 			srng->u.src_ring.hp_addr =
-				(u32 *)((unsigned long)sc->mem + reg_base);
+				(u32 *)((unsigned long)ab->mem + reg_base);
 		}
 	} else {
 		/* During initialization loop count in all the descriptors
@@ -1073,7 +1073,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
 			srng->flags |= HAL_SRNG_FLAGS_LMAC_RING;
 		} else {
 			srng->u.dst_ring.tp_addr =
-				(u32 *)((unsigned long)sc->mem + reg_base +
+				(u32 *)((unsigned long)ab->mem + reg_base +
 					(HAL_REO1_RING_TP - HAL_REO1_RING_HP));
 		}
 	}
@@ -1081,44 +1081,44 @@ int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
 	if (srng_config->lmac_ring)
 		return ring_id;
 
-	ath11k_hal_srng_hw_init(sc, srng);
+	ath11k_hal_srng_hw_init(ab, srng);
 
 	if (type == HAL_CE_DST) {
 		srng->u.dst_ring.max_buffer_length = params->max_buffer_len;
-		ath11k_hal_ce_dst_setup(sc, srng, ring_num);
+		ath11k_hal_ce_dst_setup(ab, srng, ring_num);
 	}
 
 	return ring_id;
 }
 
-int ath11k_hal_srng_init(struct ath11k_base *sc)
+int ath11k_hal_srng_init(struct ath11k_base *ab)
 {
-	struct ath11k_hal *hal = &sc->hal;
+	struct ath11k_hal *hal = &ab->hal;
 	int ret;
 
 	memset(hal, 0, sizeof(*hal));
 
 	hal->srng_config = hw_srng_config;
 
-	ret = ath11k_hal_alloc_cont_rdp(sc);
+	ret = ath11k_hal_alloc_cont_rdp(ab);
 	if (ret)
 		goto err_hal;
 
-	ret = ath11k_hal_alloc_cont_wrp(sc);
+	ret = ath11k_hal_alloc_cont_wrp(ab);
 	if (ret)
 		goto err_free_cont_rdp;
 
 	return 0;
 
 err_free_cont_rdp:
-	ath11k_hal_free_cont_rdp(sc);
+	ath11k_hal_free_cont_rdp(ab);
 
 err_hal:
 	return ret;
 }
 
-void ath11k_hal_srng_deinit(struct ath11k_base *sc)
+void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
-	ath11k_hal_free_cont_rdp(sc);
-	ath11k_hal_free_cont_wrp(sc);
+	ath11k_hal_free_cont_rdp(ab);
+	ath11k_hal_free_cont_wrp(ab);
 }
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
