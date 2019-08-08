Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4Y-00082M-Qb
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:17 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 01/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 ahb.c
Date: Thu,  8 Aug 2019 18:32:58 +0530
Message-Id: <1565269392-2838-2-git-send-email-mkenna@codeaurora.org>
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
ath11k_base struct from 'sc' to 'ab'.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 202 +++++++++++++-------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index a2c697b97bdf..e1fee70055a6 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -463,22 +463,22 @@ enum ext_irq_num {
 	tcl2host_status_ring,
 };
 
-inline u32 ath11k_ahb_read32(struct ath11k_base *sc, u32 offset)
+inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
 {
-	return ioread32(sc->mem + offset);
+	return ioread32(ab->mem + offset);
 }
 
-inline void ath11k_ahb_write32(struct ath11k_base *sc, u32 offset, u32 value)
+inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
-	iowrite32(value, sc->mem + offset);
+	iowrite32(value, ab->mem + offset);
 }
 
-static void ath11k_ahb_kill_tasklets(struct ath11k_base *sc)
+static void ath11k_ahb_kill_tasklets(struct ath11k_base *ab)
 {
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++) {
-		struct ath11k_ce_pipe *ce_pipe = &sc->ce.ce_pipe[i];
+		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
 			continue;
@@ -492,16 +492,16 @@ static void ath11k_ahb_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
 	int i;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
-		disable_irq_nosync(irq_grp->sc->irq_num[irq_grp->irqs[i]]);
+		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
-static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *sc)
+static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 {
 	struct sk_buff *skb;
 	int i;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
+		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		ath11k_ahb_ext_grp_disable(irq_grp);
 
@@ -518,52 +518,52 @@ static void ath11k_ahb_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
 	int i;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
-		enable_irq(irq_grp->sc->irq_num[irq_grp->irqs[i]]);
+		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
-static void ath11k_ahb_ce_irq_enable(struct ath11k_base *sc, u16 ce_id)
+static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 {
 	const struct ce_pipe_config *ce_config;
 	u32 val;
 
 	ce_config = &target_ce_config_wlan[ce_id];
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
 		val |= BIT(ce_id);
-		ath11k_ahb_write32(sc, CE_HOST_IE_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
 	}
 
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_2_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_2_ADDRESS);
 		val |= BIT(ce_id);
-		ath11k_ahb_write32(sc, CE_HOST_IE_2_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_2_ADDRESS, val);
 
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_3_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_3_ADDRESS);
 		val |= BIT(ce_id + CE_HOST_IE_3_SHIFT);
-		ath11k_ahb_write32(sc, CE_HOST_IE_3_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_3_ADDRESS, val);
 	}
 }
 
-static void ath11k_ahb_ce_irq_disable(struct ath11k_base *sc, u16 ce_id)
+static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
 	const struct ce_pipe_config *ce_config;
 	u32 val;
 
 	ce_config = &target_ce_config_wlan[ce_id];
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
 		val &= ~BIT(ce_id);
-		ath11k_ahb_write32(sc, CE_HOST_IE_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
 	}
 
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_2_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_2_ADDRESS);
 		val &= ~BIT(ce_id);
-		ath11k_ahb_write32(sc, CE_HOST_IE_2_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_2_ADDRESS, val);
 
-		val = ath11k_ahb_read32(sc, CE_HOST_IE_3_ADDRESS);
+		val = ath11k_ahb_read32(ab, CE_HOST_IE_3_ADDRESS);
 		val &= ~BIT(ce_id + CE_HOST_IE_3_SHIFT);
-		ath11k_ahb_write32(sc, CE_HOST_IE_3_ADDRESS, val);
+		ath11k_ahb_write32(ab, CE_HOST_IE_3_ADDRESS, val);
 	}
 }
 
@@ -596,32 +596,32 @@ static void ath11k_ahb_sync_ext_irqs(struct ath11k_base *ab)
 	}
 }
 
-static void ath11k_ahb_ce_irqs_enable(struct ath11k_base *sc)
+static void ath11k_ahb_ce_irqs_enable(struct ath11k_base *ab)
 {
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++) {
 		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
 			continue;
-		ath11k_ahb_ce_irq_enable(sc, i);
+		ath11k_ahb_ce_irq_enable(ab, i);
 	}
 }
 
-static void ath11k_ahb_ce_irqs_disable(struct ath11k_base *sc)
+static void ath11k_ahb_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++) {
 		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
 			continue;
-		ath11k_ahb_ce_irq_disable(sc, i);
+		ath11k_ahb_ce_irq_disable(ab, i);
 	}
 }
 
-int ath11k_ahb_start(struct ath11k_base *sc)
+int ath11k_ahb_start(struct ath11k_base *ab)
 {
-	ath11k_ahb_ce_irqs_enable(sc);
-	ath11k_ce_rx_post_buf(sc);
+	ath11k_ahb_ce_irqs_enable(ab);
+	ath11k_ce_rx_post_buf(ab);
 
 	/* Bring up other components as appropriate */
 
@@ -646,36 +646,36 @@ void ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	ath11k_ahb_sync_ext_irqs(ab);
 }
 
-void ath11k_ahb_stop(struct ath11k_base *sc)
+void ath11k_ahb_stop(struct ath11k_base *ab)
 {
-	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &sc->dev_flags))
-		ath11k_ahb_ce_irqs_disable(sc);
-	ath11k_ahb_sync_ce_irqs(sc);
-	ath11k_ahb_kill_tasklets(sc);
-	del_timer_sync(&sc->rx_replenish_retry);
-	ath11k_ce_cleanup_pipes(sc);
+	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		ath11k_ahb_ce_irqs_disable(ab);
+	ath11k_ahb_sync_ce_irqs(ab);
+	ath11k_ahb_kill_tasklets(ab);
+	del_timer_sync(&ab->rx_replenish_retry);
+	ath11k_ce_cleanup_pipes(ab);
 	/* Shutdown other components as appropriate */
 }
 
-int ath11k_ahb_power_up(struct ath11k_base *sc)
+int ath11k_ahb_power_up(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = rproc_boot(sc->tgt_rproc);
+	ret = rproc_boot(ab->tgt_rproc);
 	if (ret)
-		ath11k_err(sc, "failed to boot the remote processor Q6\n");
+		ath11k_err(ab, "failed to boot the remote processor Q6\n");
 
 	return ret;
 }
 
-void ath11k_ahb_power_down(struct ath11k_base *sc)
+void ath11k_ahb_power_down(struct ath11k_base *ab)
 {
-	rproc_shutdown(sc->tgt_rproc);
+	rproc_shutdown(ab->tgt_rproc);
 }
 
-static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *sc)
+static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 {
-	struct ath11k_qmi_ce_cfg *cfg = &sc->qmi.ce_cfg;
+	struct ath11k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
 
 	cfg->tgt_ce = (u8 *)target_ce_config_wlan;
 	cfg->tgt_ce_len = sizeof(target_ce_config_wlan);
@@ -684,19 +684,19 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *sc)
 	cfg->svc_to_ce_map_len = sizeof(target_service_to_ce_map_wlan);
 }
 
-static void ath11k_ahb_free_ext_irq(struct ath11k_base *sc)
+static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
 {
 	int i, j;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
+		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		for (j = 0; j < irq_grp->num_irq; j++)
-			free_irq(sc->irq_num[irq_grp->irqs[j]], irq_grp);
+			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 	}
 }
 
-static void ath11k_ahb_free_irq(struct ath11k_base *sc)
+static void ath11k_ahb_free_irq(struct ath11k_base *ab)
 {
 	int irq_idx;
 	int i;
@@ -705,26 +705,26 @@ static void ath11k_ahb_free_irq(struct ath11k_base *sc)
 		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
 			continue;
 		irq_idx = ATH11K_IRQ_CE0_OFFSET + i;
-		free_irq(sc->irq_num[irq_idx], &sc->ce.ce_pipe[i]);
+		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
 	}
 
-	ath11k_ahb_free_ext_irq(sc);
+	ath11k_ahb_free_ext_irq(ab);
 }
 
 static void ath11k_ahb_ce_tasklet(unsigned long data)
 {
 	struct ath11k_ce_pipe *ce_pipe = (struct ath11k_ce_pipe *)data;
 
-	ath11k_ce_per_engine_service(ce_pipe->sc, ce_pipe->pipe_num);
+	ath11k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
-	ath11k_ahb_ce_irq_enable(ce_pipe->sc, ce_pipe->pipe_num);
+	ath11k_ahb_ce_irq_enable(ce_pipe->ab, ce_pipe->pipe_num);
 }
 
 static irqreturn_t ath11k_ahb_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ce_pipe *ce_pipe = arg;
 
-	ath11k_ahb_ce_irq_disable(ce_pipe->sc, ce_pipe->pipe_num);
+	ath11k_ahb_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
 
 	tasklet_schedule(&ce_pipe->intr_tq);
 
@@ -736,7 +736,7 @@ static int ath11k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 	struct ath11k_ext_irq_grp *irq_grp = container_of(napi,
 						struct ath11k_ext_irq_grp,
 						napi);
-	struct ath11k_base *ab = irq_grp->sc;
+	struct ath11k_base *ab = irq_grp->ab;
 	int work_done;
 
 	work_done = ath11k_dp_service_srng(ab, irq_grp, budget);
@@ -762,17 +762,17 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int ath11k_ahb_ext_irq_config(struct ath11k_base *sc)
+static int ath11k_ahb_ext_irq_config(struct ath11k_base *ab)
 {
 	int i, j;
 	int irq;
 	int ret;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
+		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
 
-		irq_grp->sc = sc;
+		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
 		init_dummy_netdev(&irq_grp->napi_ndev);
 		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
@@ -803,22 +803,22 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *sc)
 				if (ath11k_rxdma2host_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						rxdma2host_destination_ring_mac1
-						- ath11k_core_get_hw_mac_id(sc, j);
+						- ath11k_core_get_hw_mac_id(ab, j);
 				}
 
 				if (ath11k_host2rxdma_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						host2rxdma_host_buf_ring_mac1
-						- ath11k_core_get_hw_mac_id(sc, j);
+						- ath11k_core_get_hw_mac_id(ab, j);
 				}
 
 				if (rx_mon_status_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						ppdu_end_interrupts_mac1 -
-						ath11k_core_get_hw_mac_id(sc, j);
+						ath11k_core_get_hw_mac_id(ab, j);
 					irq_grp->irqs[num_irq++] =
 						rxdma2host_monitor_status_ring_mac1 -
-						ath11k_core_get_hw_mac_id(sc, j);
+						ath11k_core_get_hw_mac_id(ab, j);
 				}
 			}
 		}
@@ -827,15 +827,15 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *sc)
 		for (j = 0; j < irq_grp->num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
 
-			irq = platform_get_irq_byname(sc->pdev,
+			irq = platform_get_irq_byname(ab->pdev,
 						      irq_name[irq_idx]);
-			sc->irq_num[irq_idx] = irq;
+			ab->irq_num[irq_idx] = irq;
 			irq_set_status_flags(irq, IRQ_NOAUTOEN);
 			ret = request_irq(irq, ath11k_ahb_ext_interrupt_handler,
 					  IRQF_TRIGGER_RISING,
 					  irq_name[irq_idx], irq_grp);
 			if (ret) {
-				ath11k_err(sc, "failed request_irq for %d\n",
+				ath11k_err(ab, "failed request_irq for %d\n",
 					   irq);
 			}
 		}
@@ -844,14 +844,14 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *sc)
 	return 0;
 }
 
-static int ath11k_ahb_config_irq(struct ath11k_base *sc)
+static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 {
 	int irq, irq_idx, i;
 	int ret;
 
 	/* Configure CE irqs */
 	for (i = 0; i < CE_COUNT; i++) {
-		struct ath11k_ce_pipe *ce_pipe = &sc->ce.ce_pipe[i];
+		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
 			continue;
@@ -860,23 +860,23 @@ static int ath11k_ahb_config_irq(struct ath11k_base *sc)
 
 		tasklet_init(&ce_pipe->intr_tq, ath11k_ahb_ce_tasklet,
 			     (unsigned long)ce_pipe);
-		irq = platform_get_irq_byname(sc->pdev, irq_name[irq_idx]);
+		irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
 		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
 				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
 				  ce_pipe);
 		if (ret)
 			return ret;
 
-		sc->irq_num[irq_idx] = irq;
+		ab->irq_num[irq_idx] = irq;
 	}
 
 	/* Configure external interrupts */
-	ret = ath11k_ahb_ext_irq_config(sc);
+	ret = ath11k_ahb_ext_irq_config(ab);
 
 	return ret;
 }
 
-int ath11k_ahb_map_service_to_pipe(struct ath11k_base *sc, u16 service_id,
+int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,
 				   u8 *ul_pipe, u8 *dl_pipe)
 {
 	const struct service_to_pipe *entry;
@@ -921,7 +921,7 @@ int ath11k_ahb_map_service_to_pipe(struct ath11k_base *sc, u16 service_id,
 
 static int ath11k_ahb_probe(struct platform_device *pdev)
 {
-	struct ath11k_base *sc;
+	struct ath11k_base *ab;
 	const struct of_device_id *of_id;
 	struct resource *mem_res;
 	void __iomem *mem;
@@ -951,52 +951,52 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	sc = ath11k_core_alloc(&pdev->dev);
-	if (!sc) {
+	ab = ath11k_core_alloc(&pdev->dev);
+	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
 	}
 
-	sc->pdev = pdev;
-	sc->hw_rev = (enum ath11k_hw_rev)of_id->data;
-	sc->mem = mem;
-	sc->mem_len = resource_size(mem_res);
-	platform_set_drvdata(pdev, sc);
+	ab->pdev = pdev;
+	ab->hw_rev = (enum ath11k_hw_rev)of_id->data;
+	ab->mem = mem;
+	ab->mem_len = resource_size(mem_res);
+	platform_set_drvdata(pdev, ab);
 
-	ret = ath11k_hal_srng_init(sc);
+	ret = ath11k_hal_srng_init(ab);
 	if (ret)
 		goto err_core_free;
 
-	ret = ath11k_ce_alloc_pipes(sc);
+	ret = ath11k_ce_alloc_pipes(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to allocate ce pipes: %d\n", ret);
+		ath11k_err(ab, "failed to allocate ce pipes: %d\n", ret);
 		goto err_hal_srng_deinit;
 	}
 
-	ath11k_ahb_init_qmi_ce_config(sc);
+	ath11k_ahb_init_qmi_ce_config(ab);
 
-	ret = ath11k_ahb_config_irq(sc);
+	ret = ath11k_ahb_config_irq(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to configure irq: %d\n", ret);
+		ath11k_err(ab, "failed to configure irq: %d\n", ret);
 		goto err_ce_free;
 	}
 
-	ret = ath11k_core_init(sc);
+	ret = ath11k_core_init(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to init core: %d\n", ret);
+		ath11k_err(ab, "failed to init core: %d\n", ret);
 		goto err_ce_free;
 	}
 
 	return 0;
 
 err_ce_free:
-	ath11k_ce_free_pipes(sc);
+	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(sc);
+	ath11k_hal_srng_deinit(ab);
 
 err_core_free:
-	ath11k_core_free(sc);
+	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 
 	return ret;
@@ -1004,23 +1004,23 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 
 static int ath11k_ahb_remove(struct platform_device *pdev)
 {
-	struct ath11k_base *sc = platform_get_drvdata(pdev);
+	struct ath11k_base *ab = platform_get_drvdata(pdev);
 
-	reinit_completion(&sc->driver_recovery);
+	reinit_completion(&ab->driver_recovery);
 
-	if (test_bit(ATH11K_FLAG_RECOVERY, &sc->dev_flags))
-		wait_for_completion_timeout(&sc->driver_recovery,
+	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags))
+		wait_for_completion_timeout(&ab->driver_recovery,
 					    ATH11K_AHB_RECOVERY_TIMEOUT);
 
-	set_bit(ATH11K_FLAG_UNREGISTERING, &sc->dev_flags);
-	cancel_work_sync(&sc->restart_work);
+	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	cancel_work_sync(&ab->restart_work);
 
-	ath11k_core_deinit(sc);
-	ath11k_ahb_free_irq(sc);
+	ath11k_core_deinit(ab);
+	ath11k_ahb_free_irq(ab);
 
-	ath11k_hal_srng_deinit(sc);
-	ath11k_ce_free_pipes(sc);
-	ath11k_core_free(sc);
+	ath11k_hal_srng_deinit(ab);
+	ath11k_ce_free_pipes(ab);
+	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
