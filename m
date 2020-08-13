Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69AG-0006ch-Mm
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:04:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 03/10] ath11k: move ring mask definitions to hw_params
Date: Thu, 13 Aug 2020 12:04:19 +0300
Message-Id: <1597309466-19688-4-git-send-email-kvalo@codeaurora.org>
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

This is needed for splitting ahb and pci modules as they have different ring
mask settings.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 88 ++++------------------------------
 drivers/net/wireless/ath/ath11k/core.c |  2 +
 drivers/net/wireless/ath/ath11k/core.h | 10 ----
 drivers/net/wireless/ath/ath11k/dp.c   | 22 ++++-----
 drivers/net/wireless/ath/ath11k/hw.c   | 68 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   | 17 +++++++
 6 files changed, 106 insertions(+), 101 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7e9bfeaaf4d2..e3228a4f485f 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -321,78 +321,6 @@ static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
 	"tcl2host-status-ring",
 };
 
-#define ATH11K_TX_RING_MASK_0 0x1
-#define ATH11K_TX_RING_MASK_1 0x2
-#define ATH11K_TX_RING_MASK_2 0x4
-
-#define ATH11K_RX_RING_MASK_0 0x1
-#define ATH11K_RX_RING_MASK_1 0x2
-#define ATH11K_RX_RING_MASK_2 0x4
-#define ATH11K_RX_RING_MASK_3 0x8
-
-#define ATH11K_RX_ERR_RING_MASK_0 0x1
-
-#define ATH11K_RX_WBM_REL_RING_MASK_0 0x1
-
-#define ATH11K_REO_STATUS_RING_MASK_0 0x1
-
-#define ATH11K_RXDMA2HOST_RING_MASK_0 0x1
-#define ATH11K_RXDMA2HOST_RING_MASK_1 0x2
-#define ATH11K_RXDMA2HOST_RING_MASK_2 0x4
-
-#define ATH11K_HOST2RXDMA_RING_MASK_0 0x1
-#define ATH11K_HOST2RXDMA_RING_MASK_1 0x2
-#define ATH11K_HOST2RXDMA_RING_MASK_2 0x4
-
-#define ATH11K_RX_MON_STATUS_RING_MASK_0 0x1
-#define ATH11K_RX_MON_STATUS_RING_MASK_1 0x2
-#define ATH11K_RX_MON_STATUS_RING_MASK_2 0x4
-
-const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_TX_RING_MASK_0,
-	ATH11K_TX_RING_MASK_1,
-	ATH11K_TX_RING_MASK_2,
-};
-
-const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	0, 0, 0, 0,
-	ATH11K_RX_MON_STATUS_RING_MASK_0,
-	ATH11K_RX_MON_STATUS_RING_MASK_1,
-	ATH11K_RX_MON_STATUS_RING_MASK_2,
-};
-
-const u8 ath11k_rx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	0, 0, 0, 0, 0, 0, 0,
-	ATH11K_RX_RING_MASK_0,
-	ATH11K_RX_RING_MASK_1,
-	ATH11K_RX_RING_MASK_2,
-	ATH11K_RX_RING_MASK_3,
-};
-
-const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_RX_ERR_RING_MASK_0,
-};
-
-const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_RX_WBM_REL_RING_MASK_0,
-};
-
-const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_REO_STATUS_RING_MASK_0,
-};
-
-const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_RXDMA2HOST_RING_MASK_0,
-	ATH11K_RXDMA2HOST_RING_MASK_1,
-	ATH11K_RXDMA2HOST_RING_MASK_2,
-};
-
-const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
-	ATH11K_HOST2RXDMA_RING_MASK_0,
-	ATH11K_HOST2RXDMA_RING_MASK_1,
-	ATH11K_HOST2RXDMA_RING_MASK_2,
-};
-
 /* enum ext_irq_num - irq numbers that can be used by external modules
  * like datapath
  */
@@ -750,39 +678,39 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *ab)
 			       ath11k_ahb_ext_grp_napi_poll, NAPI_POLL_WEIGHT);
 
 		for (j = 0; j < ATH11K_EXT_IRQ_NUM_MAX; j++) {
-			if (ath11k_tx_ring_mask[i] & BIT(j)) {
+			if (ab->hw_params.ring_mask->tx[i] & BIT(j)) {
 				irq_grp->irqs[num_irq++] =
 					wbm2host_tx_completions_ring1 - j;
 			}
 
-			if (ath11k_rx_ring_mask[i] & BIT(j)) {
+			if (ab->hw_params.ring_mask->rx[i] & BIT(j)) {
 				irq_grp->irqs[num_irq++] =
 					reo2host_destination_ring1 - j;
 			}
 
-			if (ath11k_rx_err_ring_mask[i] & BIT(j))
+			if (ab->hw_params.ring_mask->rx_err[i] & BIT(j))
 				irq_grp->irqs[num_irq++] = reo2host_exception;
 
-			if (ath11k_rx_wbm_rel_ring_mask[i] & BIT(j))
+			if (ab->hw_params.ring_mask->rx_wbm_rel[i] & BIT(j))
 				irq_grp->irqs[num_irq++] = wbm2host_rx_release;
 
-			if (ath11k_reo_status_ring_mask[i] & BIT(j))
+			if (ab->hw_params.ring_mask->reo_status[i] & BIT(j))
 				irq_grp->irqs[num_irq++] = reo2host_status;
 
 			if (j < ab->hw_params.max_radios) {
-				if (ath11k_rxdma2host_ring_mask[i] & BIT(j)) {
+				if (ab->hw_params.ring_mask->rxdma2host[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						rxdma2host_destination_ring_mac1 -
 						ath11k_hw_get_mac_from_pdev_id(hw, j);
 				}
 
-				if (ath11k_host2rxdma_ring_mask[i] & BIT(j)) {
+				if (ab->hw_params.ring_mask->host2rxdma[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						host2rxdma_host_buf_ring_mac1 -
 						ath11k_hw_get_mac_from_pdev_id(hw, j);
 				}
 
-				if (rx_mon_status_ring_mask[i] & BIT(j)) {
+				if (ab->hw_params.ring_mask->rx_mon_status[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						ppdu_end_interrupts_mac1 -
 						ath11k_hw_get_mac_from_pdev_id(hw, j);
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 093faf20f324..5638f0731634 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -29,6 +29,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &ipq8074_ops,
+		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -41,6 +42,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &qca6390_ops,
+		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c48d53ec4fa7..ca97ccf250a4 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -102,18 +102,8 @@ enum ath11k_firmware_mode {
 };
 
 #define ATH11K_IRQ_NUM_MAX 52
-#define ATH11K_EXT_IRQ_GRP_NUM_MAX 11
 #define ATH11K_EXT_IRQ_NUM_MAX	16
 
-extern const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_rx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-
 struct ath11k_ext_irq_grp {
 	struct ath11k_base *ab;
 	u32 irqs[ATH11K_EXT_IRQ_NUM_MAX];
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 1d64c3c51ac9..73fcb4f7f3c4 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -625,13 +625,13 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	int i = 0;
 	int tot_work_done = 0;
 
-	while (ath11k_tx_ring_mask[grp_id] >> i) {
-		if (ath11k_tx_ring_mask[grp_id] & BIT(i))
+	while (ab->hw_params.ring_mask->tx[grp_id] >> i) {
+		if (ab->hw_params.ring_mask->tx[grp_id] & BIT(i))
 			ath11k_dp_tx_completion_handler(ab, i);
 		i++;
 	}
 
-	if (ath11k_rx_err_ring_mask[grp_id]) {
+	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
 		work_done = ath11k_dp_process_rx_err(ab, napi, budget);
 		budget -= work_done;
 		tot_work_done += work_done;
@@ -639,7 +639,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 			goto done;
 	}
 
-	if (ath11k_rx_wbm_rel_ring_mask[grp_id]) {
+	if (ab->hw_params.ring_mask->rx_wbm_rel[grp_id]) {
 		work_done = ath11k_dp_rx_process_wbm_err(ab,
 							 napi,
 							 budget);
@@ -650,8 +650,8 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 			goto done;
 	}
 
-	if (ath11k_rx_ring_mask[grp_id]) {
-		i =  fls(ath11k_rx_ring_mask[grp_id]) - 1;
+	if (ab->hw_params.ring_mask->rx[grp_id]) {
+		i =  fls(ab->hw_params.ring_mask->rx[grp_id]) - 1;
 		work_done = ath11k_dp_process_rx(ab, i, napi,
 						 budget);
 		budget -= work_done;
@@ -660,9 +660,9 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 			goto done;
 	}
 
-	if (rx_mon_status_ring_mask[grp_id]) {
+	if (ab->hw_params.ring_mask->rx_mon_status[grp_id]) {
 		for (i = 0; i <  ab->num_radios; i++) {
-			if (rx_mon_status_ring_mask[grp_id] & BIT(i)) {
+			if (ab->hw_params.ring_mask->rx_mon_status[grp_id] & BIT(i)) {
 				work_done =
 				ath11k_dp_rx_process_mon_rings(ab,
 							       i, napi,
@@ -675,11 +675,11 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 		}
 	}
 
-	if (ath11k_reo_status_ring_mask[grp_id])
+	if (ab->hw_params.ring_mask->reo_status[grp_id])
 		ath11k_dp_process_reo_status(ab);
 
 	for (i = 0; i < ab->num_radios; i++) {
-		if (ath11k_rxdma2host_ring_mask[grp_id] & BIT(i)) {
+		if (ab->hw_params.ring_mask->rxdma2host[grp_id] & BIT(i)) {
 			work_done = ath11k_dp_process_rxdma_err(ab, i, budget);
 			budget -= work_done;
 			tot_work_done += work_done;
@@ -688,7 +688,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 		if (budget <= 0)
 			goto done;
 
-		if (ath11k_host2rxdma_ring_mask[grp_id] & BIT(i)) {
+		if (ab->hw_params.ring_mask->host2rxdma[grp_id] & BIT(i)) {
 			struct ath11k_pdev_dp *dp = &ab->pdevs[i].ar->dp;
 			struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 6feb0f699cfc..f7354476d673 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -36,3 +36,71 @@ const struct ath11k_hw_ops ipq6018_ops = {
 const struct ath11k_hw_ops qca6390_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 };
+
+#define ATH11K_TX_RING_MASK_0 0x1
+#define ATH11K_TX_RING_MASK_1 0x2
+#define ATH11K_TX_RING_MASK_2 0x4
+
+#define ATH11K_RX_RING_MASK_0 0x1
+#define ATH11K_RX_RING_MASK_1 0x2
+#define ATH11K_RX_RING_MASK_2 0x4
+#define ATH11K_RX_RING_MASK_3 0x8
+
+#define ATH11K_RX_ERR_RING_MASK_0 0x1
+
+#define ATH11K_RX_WBM_REL_RING_MASK_0 0x1
+
+#define ATH11K_REO_STATUS_RING_MASK_0 0x1
+
+#define ATH11K_RXDMA2HOST_RING_MASK_0 0x1
+#define ATH11K_RXDMA2HOST_RING_MASK_1 0x2
+#define ATH11K_RXDMA2HOST_RING_MASK_2 0x4
+
+#define ATH11K_HOST2RXDMA_RING_MASK_0 0x1
+#define ATH11K_HOST2RXDMA_RING_MASK_1 0x2
+#define ATH11K_HOST2RXDMA_RING_MASK_2 0x4
+
+#define ATH11K_RX_MON_STATUS_RING_MASK_0 0x1
+#define ATH11K_RX_MON_STATUS_RING_MASK_1 0x2
+#define ATH11K_RX_MON_STATUS_RING_MASK_2 0x4
+
+const struct ath11k_hw_ring_mask ath11k_hw_ring_mask_ipq8074 = {
+	.tx  = {
+		ATH11K_TX_RING_MASK_0,
+		ATH11K_TX_RING_MASK_1,
+		ATH11K_TX_RING_MASK_2,
+	},
+	.rx_mon_status = {
+		0, 0, 0, 0,
+		ATH11K_RX_MON_STATUS_RING_MASK_0,
+		ATH11K_RX_MON_STATUS_RING_MASK_1,
+		ATH11K_RX_MON_STATUS_RING_MASK_2,
+	},
+	.rx = {
+		0, 0, 0, 0, 0, 0, 0,
+		ATH11K_RX_RING_MASK_0,
+		ATH11K_RX_RING_MASK_1,
+		ATH11K_RX_RING_MASK_2,
+		ATH11K_RX_RING_MASK_3,
+	},
+	.rx_err = {
+		ATH11K_RX_ERR_RING_MASK_0,
+	},
+	.rx_wbm_rel = {
+		ATH11K_RX_WBM_REL_RING_MASK_0,
+	},
+	.reo_status = {
+		ATH11K_REO_STATUS_RING_MASK_0,
+	},
+	.rxdma2host = {
+		ATH11K_RXDMA2HOST_RING_MASK_0,
+		ATH11K_RXDMA2HOST_RING_MASK_1,
+		ATH11K_RXDMA2HOST_RING_MASK_2,
+	},
+	.host2rxdma = {
+		ATH11K_HOST2RXDMA_RING_MASK_0,
+		ATH11K_HOST2RXDMA_RING_MASK_1,
+		ATH11K_HOST2RXDMA_RING_MASK_2,
+	},
+};
+
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 1958830c01ec..a8cdf4d08be4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -99,6 +99,19 @@ enum ath11k_bus {
 	ATH11K_BUS_PCI,
 };
 
+#define ATH11K_EXT_IRQ_GRP_NUM_MAX 11
+
+struct ath11k_hw_ring_mask {
+	u8 tx[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_mon_status[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_err[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_wbm_rel[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 reo_status[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rxdma2host[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+	u8 host2rxdma[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+};
+
 struct ath11k_hw_ops {
 	u8 (*get_hw_mac_from_pdev_id)(int pdev_id);
 };
@@ -116,12 +129,16 @@ struct ath11k_hw_params {
 	} fw;
 
 	const struct ath11k_hw_ops *hw_ops;
+
+	const struct ath11k_hw_ring_mask *ring_mask;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
 extern const struct ath11k_hw_ops ipq6018_ops;
 extern const struct ath11k_hw_ops qca6390_ops;
 
+extern const struct ath11k_hw_ring_mask ath11k_hw_ring_mask_ipq8074;
+
 static inline
 int ath11k_hw_get_mac_from_pdev_id(struct ath11k_hw_params *hw,
 				   int pdev_idx)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
