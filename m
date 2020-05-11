Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYC9c-0000Gm-V8
 for ath11k@lists.infradead.org; Mon, 11 May 2020 17:23:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: move ring mask variables to core.c
Date: Mon, 11 May 2020 20:23:26 +0300
Message-Id: <1589217806-9376-1-git-send-email-kvalo@codeaurora.org>
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

It should have been in core.c in the first place as the declarations are in
core.h. And these are needed by both pci.c and ahb.c so there needs to be a
common place for them.

Also add ath11k_ prefix to rx_mon_status_ring_mask to make it easy add
EXPORT_SYMBOL() later.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 74 +---------------------------------
 drivers/net/wireless/ath/ath11k/core.c | 45 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 29 ++++++++++++-
 drivers/net/wireless/ath/ath11k/dp.c   |  4 +-
 4 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 30092841ac46..f14483e2a76d 100644
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
@@ -781,7 +709,7 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *ab)
 						- ath11k_core_get_hw_mac_id(ab, j);
 				}
 
-				if (rx_mon_status_ring_mask[i] & BIT(j)) {
+				if (ath11k_rx_mon_status_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						ppdu_end_interrupts_mac1 -
 						ath11k_core_get_hw_mac_id(ab, j);
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 02501cc154fe..d6e0f172c36f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -26,6 +26,51 @@ static const struct ath11k_hw_params ath11k_hw_params = {
 	},
 };
 
+const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_TX_RING_MASK_0,
+	ATH11K_TX_RING_MASK_1,
+	ATH11K_TX_RING_MASK_2,
+};
+
+const u8 ath11k_rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	0, 0, 0, 0,
+	ATH11K_RX_MON_STATUS_RING_MASK_0,
+	ATH11K_RX_MON_STATUS_RING_MASK_1,
+	ATH11K_RX_MON_STATUS_RING_MASK_2,
+};
+
+const u8 ath11k_rx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	0, 0, 0, 0, 0, 0, 0,
+	ATH11K_RX_RING_MASK_0,
+	ATH11K_RX_RING_MASK_1,
+	ATH11K_RX_RING_MASK_2,
+	ATH11K_RX_RING_MASK_3,
+};
+
+const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RX_ERR_RING_MASK_0,
+};
+
+const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RX_WBM_REL_RING_MASK_0,
+};
+
+const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_REO_STATUS_RING_MASK_0,
+};
+
+const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RXDMA2HOST_RING_MASK_0,
+	ATH11K_RXDMA2HOST_RING_MASK_1,
+	ATH11K_RXDMA2HOST_RING_MASK_2,
+};
+
+const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_HOST2RXDMA_RING_MASK_0,
+	ATH11K_HOST2RXDMA_RING_MASK_1,
+	ATH11K_HOST2RXDMA_RING_MASK_2,
+};
+
 /* Map from pdev index to hw mac index */
 u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
 {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e711779..161e3ae92b73 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -102,6 +102,33 @@ enum ath11k_firmware_mode {
 #define ATH11K_EXT_IRQ_GRP_NUM_MAX 11
 #define ATH11K_EXT_IRQ_NUM_MAX	16
 
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
 extern const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 ath11k_rx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
@@ -109,7 +136,7 @@ extern const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 extern const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-extern const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
+extern const u8 ath11k_rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 
 struct ath11k_ext_irq_grp {
 	struct ath11k_base *ab;
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 9ae743e528af..75c177480ff4 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -659,9 +659,9 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 			goto done;
 	}
 
-	if (rx_mon_status_ring_mask[grp_id]) {
+	if (ath11k_rx_mon_status_ring_mask[grp_id]) {
 		for (i = 0; i <  ab->num_radios; i++) {
-			if (rx_mon_status_ring_mask[grp_id] & BIT(i)) {
+			if (ath11k_rx_mon_status_ring_mask[grp_id] & BIT(i)) {
 				work_done =
 				ath11k_dp_rx_process_mon_rings(ab,
 							       i, napi,
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
