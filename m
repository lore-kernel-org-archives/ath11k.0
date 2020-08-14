Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6TrX-0008TH-Tm
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:10:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 06/11] ath11k: setup ce tasklet for control path
Date: Fri, 14 Aug 2020 10:10:25 +0300
Message-Id: <1597389030-13887-7-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
References: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
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

From: Govind Singh <govinds@codeaurora.org>

CE srng is used for control path and CE srng processing is done using tasklet
bottom half. Setup ce tasklet initialization and scheduling for control path.

Needed for PCI support.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c  |   2 +
 drivers/net/wireless/ath/ath11k/ce.h  |   2 +
 drivers/net/wireless/ath/ath11k/pci.c | 116 +++++++++++++++++++++++++++++++---
 3 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index a457fe7f7049..59cb403b8597 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -524,6 +524,7 @@ void ath11k_ce_poll_send_completed(struct ath11k_base *ab, u8 pipe_id)
 	if ((pipe->attr_flags & CE_ATTR_DIS_INTR) && pipe->send_cb)
 		pipe->send_cb(pipe);
 }
+EXPORT_SYMBOL(ath11k_ce_per_engine_service);
 
 int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 		   u16 transfer_id)
@@ -673,6 +674,7 @@ void ath11k_ce_rx_post_buf(struct ath11k_base *ab)
 		}
 	}
 }
+EXPORT_SYMBOL(ath11k_ce_rx_post_buf);
 
 void ath11k_ce_rx_replenish_retry(struct timer_list *t)
 {
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 688f357e6eaf..6e3a37909ade 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -181,4 +181,6 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab);
 void ath11k_ce_free_pipes(struct ath11k_base *ab);
 int ath11k_ce_get_attr_flags(int ce_id);
 void ath11k_ce_poll_send_completed(struct ath11k_base *ab, u8 pipe_id);
+int ath11k_ce_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,
+				  u8 *ul_pipe, u8 *dl_pipe);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index af08f0542867..d5dcbb928baf 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -401,6 +401,14 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
 	}
 }
 
+static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
+{
+	u32 irq_idx;
+
+	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
+	enable_irq(ab->irq_num[irq_idx]);
+}
+
 static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
 	u32 irq_idx;
@@ -409,11 +417,46 @@ static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 	disable_irq_nosync(ab->irq_num[irq_idx]);
 }
 
+static void ath11k_pci_ce_irqs_disable(struct ath11k_base *ab)
+{
+	int i;
+
+	for (i = 0; i < CE_COUNT; i++) {
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+		ath11k_pci_ce_irq_disable(ab, i);
+	}
+}
+
+static void ath11k_pci_sync_ce_irqs(struct ath11k_base *ab)
+{
+	int i;
+	int irq_idx;
+
+	for (i = 0; i < CE_COUNT; i++) {
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
+		synchronize_irq(ab->irq_num[irq_idx]);
+	}
+}
+
+static void ath11k_pci_ce_tasklet(unsigned long data)
+{
+	struct ath11k_ce_pipe *ce_pipe = (struct ath11k_ce_pipe *)data;
+
+	ath11k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
+
+	ath11k_pci_ce_irq_enable(ce_pipe->ab, ce_pipe->pipe_num);
+}
+
 static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ce_pipe *ce_pipe = arg;
 
 	ath11k_pci_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
+	tasklet_schedule(&ce_pipe->intr_tq);
 
 	return IRQ_HANDLED;
 }
@@ -444,6 +487,9 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 
 		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
 
+		tasklet_init(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet,
+			     (unsigned long)ce_pipe);
+
 		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
 				  IRQF_SHARED, irq_name[irq_idx],
 				  ce_pipe);
@@ -471,14 +517,6 @@ static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
 	ab->qmi.service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390;
 }
 
-static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
-{
-	u32 irq_idx;
-
-	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
-	enable_irq(ab->irq_num[irq_idx]);
-}
-
 static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 {
 	int i;
@@ -638,14 +676,75 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	ath11k_mhi_stop(ab_pci);
 }
 
+static void ath11k_pci_kill_tasklets(struct ath11k_base *ab)
+{
+	int i;
+
+	for (i = 0; i < CE_COUNT; i++) {
+		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
+
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		tasklet_kill(&ce_pipe->intr_tq);
+	}
+}
+
 static void ath11k_pci_stop(struct ath11k_base *ab)
 {
+	ath11k_pci_ce_irqs_disable(ab);
+	ath11k_pci_sync_ce_irqs(ab);
+	ath11k_pci_kill_tasklets(ab);
 	ath11k_ce_cleanup_pipes(ab);
 }
 
 static int ath11k_pci_start(struct ath11k_base *ab)
 {
 	ath11k_pci_ce_irqs_enable(ab);
+	ath11k_ce_rx_post_buf(ab);
+
+	return 0;
+}
+
+static int ath11k_pci_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,
+					  u8 *ul_pipe, u8 *dl_pipe)
+{
+	const struct service_to_pipe *entry;
+	bool ul_set = false, dl_set = false;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
+		entry = &target_service_to_ce_map_wlan[i];
+
+		if (__le32_to_cpu(entry->service_id) != service_id)
+			continue;
+
+		switch (__le32_to_cpu(entry->pipedir)) {
+		case PIPEDIR_NONE:
+			break;
+		case PIPEDIR_IN:
+			WARN_ON(dl_set);
+			*dl_pipe = __le32_to_cpu(entry->pipenum);
+			dl_set = true;
+			break;
+		case PIPEDIR_OUT:
+			WARN_ON(ul_set);
+			*ul_pipe = __le32_to_cpu(entry->pipenum);
+			ul_set = true;
+			break;
+		case PIPEDIR_INOUT:
+			WARN_ON(dl_set);
+			WARN_ON(ul_set);
+			*dl_pipe = __le32_to_cpu(entry->pipenum);
+			*ul_pipe = __le32_to_cpu(entry->pipenum);
+			dl_set = true;
+			ul_set = true;
+			break;
+		}
+	}
+
+	if (WARN_ON(!ul_set || !dl_set))
+		return -ENOENT;
 
 	return 0;
 }
@@ -659,6 +758,7 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.power_up = ath11k_pci_power_up,
 	.get_msi_address =  ath11k_pci_get_msi_address,
 	.get_user_msi_vector = ath11k_get_user_msi_assignment,
+	.map_service_to_pipe = ath11k_pci_map_service_to_pipe,
 };
 
 static int ath11k_pci_probe(struct pci_dev *pdev,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
