Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69AF-0006f0-Fb
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:04:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 09/10] ath11k: pci: add HAL, CE and core initialisation
Date: Thu, 13 Aug 2020 12:04:25 +0300
Message-Id: <1597309466-19688-10-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
References: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
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

Define CE pipe/qmi config and setup pci irq for the
same. Call ath11k_core_init().

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c   |   2 +
 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/hal.c  |   1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 390 ++++++++++++++++++++++++++++++++-
 4 files changed, 393 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 7ae1bef0ab30..2fff171b35f8 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -619,6 +619,7 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 		/* NOTE: Should we also clean up tx buffer in all pipes? */
 	}
 }
+EXPORT_SYMBOL(ath11k_ce_cleanup_pipes);
 
 void ath11k_ce_rx_post_buf(struct ath11k_base *ab)
 {
@@ -780,6 +781,7 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 
 	return 0;
 }
+EXPORT_SYMBOL(ath11k_ce_alloc_pipes);
 
 /* For Big Endian Host, Copy Engine byte_swap is enabled
  * When Copy Engine does byte_swap, need to byte swap again for the
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5c84995baaf9..741093de3a83 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -783,6 +783,7 @@ int ath11k_core_init(struct ath11k_base *ab)
 
 	return 0;
 }
+EXPORT_SYMBOL(ath11k_core_init);
 
 void ath11k_core_deinit(struct ath11k_base *ab)
 {
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index c7b26478d3e7..fe4df2b4a2cc 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1127,6 +1127,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
 err_hal:
 	return ret;
 }
+EXPORT_SYMBOL(ath11k_hal_srng_init);
 
 void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 6f7789fa23d6..d1068766972d 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -16,6 +16,8 @@
 #define ATH11K_PCI_BAR_NUM		0
 #define ATH11K_PCI_DMA_MASK		32
 
+#define ATH11K_PCI_IRQ_CE0_OFFSET		3
+
 #define QCA6390_DEVICE_ID		0x1101
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
@@ -36,6 +38,241 @@ static const struct ath11k_msi_config msi_config = {
 	},
 };
 
+/* Target firmware's Copy Engine configuration. */
+static const struct ce_pipe_config target_ce_config_wlan[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: target->host Pktlog */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7 used only by Host */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT_H2H),
+		.nentries = __cpu_to_le32(0),
+		.nbytes_max = __cpu_to_le32(0),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8 target->host used only by IPA */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+	/* CE 9, 10, 11 are used by MHI driver */
+};
+
+/* Map from service/endpoint to Copy Engine.
+ * This table is derived from the CE_PCI TABLE, above.
+ * It is passed to the Target at startup for use by firmware.
+ */
+static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(2),
+	},
+
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		__cpu_to_le32(1),
+	},
+
+	/* (Additions here) */
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
+	"bhi",
+	"mhi-er0",
+	"mhi-er1",
+	"ce0",
+	"ce1",
+	"ce2",
+	"ce3",
+	"ce4",
+	"ce5",
+	"ce6",
+	"ce7",
+	"ce8",
+	"ce9",
+	"ce10",
+	"ce11",
+	"host2wbm-desc-feed",
+	"host2reo-re-injection",
+	"host2reo-command",
+	"host2rxdma-monitor-ring3",
+	"host2rxdma-monitor-ring2",
+	"host2rxdma-monitor-ring1",
+	"reo2ost-exception",
+	"wbm2host-rx-release",
+	"reo2host-status",
+	"reo2host-destination-ring4",
+	"reo2host-destination-ring3",
+	"reo2host-destination-ring2",
+	"reo2host-destination-ring1",
+	"rxdma2host-monitor-destination-mac3",
+	"rxdma2host-monitor-destination-mac2",
+	"rxdma2host-monitor-destination-mac1",
+	"ppdu-end-interrupts-mac3",
+	"ppdu-end-interrupts-mac2",
+	"ppdu-end-interrupts-mac1",
+	"rxdma2host-monitor-status-ring-mac3",
+	"rxdma2host-monitor-status-ring-mac2",
+	"rxdma2host-monitor-status-ring-mac1",
+	"host2rxdma-host-buf-ring-mac3",
+	"host2rxdma-host-buf-ring-mac2",
+	"host2rxdma-host-buf-ring-mac1",
+	"rxdma2host-destination-ring-mac3",
+	"rxdma2host-destination-ring-mac2",
+	"rxdma2host-destination-ring-mac1",
+	"host2tcl-input-ring4",
+	"host2tcl-input-ring3",
+	"host2tcl-input-ring2",
+	"host2tcl-input-ring1",
+	"wbm2host-tx-completions-ring3",
+	"wbm2host-tx-completions-ring2",
+	"wbm2host-tx-completions-ring1",
+	"tcl2host-status-ring",
+};
+
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -70,6 +307,106 @@ int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ab_pci, char *user_nam
 	return -EINVAL;
 }
 
+static void ath11k_pci_free_irq(struct ath11k_base *ab)
+{
+	int i, irq_idx;
+
+	for (i = 0; i < CE_COUNT; i++) {
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
+		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
+	}
+}
+
+static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
+{
+	u32 irq_idx;
+
+	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
+	disable_irq_nosync(ab->irq_num[irq_idx]);
+}
+
+static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
+{
+	struct ath11k_ce_pipe *ce_pipe = arg;
+
+	ath11k_pci_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
+
+	return IRQ_HANDLED;
+}
+
+static int ath11k_pci_config_irq(struct ath11k_base *ab)
+{
+	struct ath11k_ce_pipe *ce_pipe;
+	u32 msi_data_start;
+	u32 msi_data_count;
+	u32 msi_irq_start;
+	unsigned int msi_data;
+	int irq, i, ret, irq_idx;
+
+	ret = ath11k_pci_get_user_msi_assignment(ath11k_pci_priv(ab),
+						 "CE", &msi_data_count,
+						 &msi_data_start, &msi_irq_start);
+	if (ret)
+		return ret;
+
+	/* Configure CE irqs */
+	for (i = 0; i < CE_COUNT; i++) {
+		msi_data = (i % msi_data_count) + msi_irq_start;
+		irq = ath11k_pci_get_msi_irq(ab->dev, msi_data);
+		ce_pipe = &ab->ce.ce_pipe[i];
+
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
+
+		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
+				  IRQF_SHARED, irq_name[irq_idx],
+				  ce_pipe);
+		if (ret) {
+			ath11k_err(ab, "failed to request irq %d: %d\n",
+				   irq_idx, ret);
+			return ret;
+		}
+
+		ab->irq_num[irq_idx] = irq;
+	}
+
+	return 0;
+}
+
+static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
+{
+	struct ath11k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+
+	cfg->tgt_ce = target_ce_config_wlan;
+	cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan);
+
+	cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
+	cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
+}
+
+static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
+{
+	u32 irq_idx;
+
+	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
+	enable_irq(ab->irq_num[irq_idx]);
+}
+
+static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
+{
+	int i;
+
+	for (i = 0; i < CE_COUNT; i++) {
+		if (ath11k_ce_get_attr_flags(i) & CE_ATTR_DIS_INTR)
+			continue;
+		ath11k_pci_ce_irq_enable(ab, i);
+	}
+}
+
 static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
@@ -218,7 +555,21 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	ath11k_mhi_stop(ab_pci);
 }
 
-static __maybe_unused const struct ath11k_hif_ops ath11k_pci_hif_ops = {
+static void ath11k_pci_stop(struct ath11k_base *ab)
+{
+	ath11k_ce_cleanup_pipes(ab);
+}
+
+static int ath11k_pci_start(struct ath11k_base *ab)
+{
+	ath11k_pci_ce_irqs_enable(ab);
+
+	return 0;
+}
+
+static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
+	.start = ath11k_pci_start,
+	.stop = ath11k_pci_stop,
 	.power_down = ath11k_pci_power_down,
 	.power_up = ath11k_pci_power_up,
 };
@@ -256,6 +607,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ab_pci->dev_id = pci_dev->device;
 	ab_pci->ab = ab;
 	ab_pci->pdev = pdev;
+	ab->hif.ops = &ath11k_pci_hif_ops;
 	pci_set_drvdata(pdev, ab);
 
 	ret = ath11k_pci_claim(ab_pci, pdev);
@@ -280,8 +632,43 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_disable_msi;
 	}
 
+	ret = ath11k_hal_srng_init(ab);
+	if (ret)
+		goto err_mhi_unregister;
+
+	ret = ath11k_ce_alloc_pipes(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to allocate ce pipes: %d\n", ret);
+		goto err_hal_srng_deinit;
+	}
+
+	ath11k_pci_init_qmi_ce_config(ab);
+
+	ret = ath11k_pci_config_irq(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to config irq: %d\n", ret);
+		goto err_ce_free;
+	}
+
+	ret = ath11k_core_init(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to init core: %d\n", ret);
+		goto err_free_irq;
+	}
 	return 0;
 
+err_free_irq:
+	ath11k_pci_free_irq(ab);
+
+err_ce_free:
+	ath11k_ce_free_pipes(ab);
+
+err_hal_srng_deinit:
+	ath11k_hal_srng_deinit(ab);
+
+err_mhi_unregister:
+	ath11k_mhi_unregister(ab_pci);
+
 err_pci_disable_msi:
 	ath11k_pci_disable_msi(ab_pci);
 
@@ -303,6 +690,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	ath11k_mhi_unregister(ab_pci);
 	ath11k_pci_disable_msi(ab_pci);
 	ath11k_pci_free_region(ab_pci);
+	ath11k_pci_free_irq(ab);
 	ath11k_core_free(ab);
 }
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
