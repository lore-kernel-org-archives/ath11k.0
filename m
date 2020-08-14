Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Tri-0008VS-Bd
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:11:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 04/11] ath11k: pci: add read32() and write32() hif operations
Date: Fri, 14 Aug 2020 10:10:23 +0300
Message-Id: <1597389030-13887-5-git-send-email-kvalo@codeaurora.org>
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

Add support for bus read/write/window selection operations
for reading hardware memory.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 55 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  4 +++
 2 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 47ee5689a5e2..10c281ece3d4 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -18,6 +18,12 @@
 
 #define ATH11K_PCI_IRQ_CE0_OFFSET		3
 
+#define WINDOW_ENABLE_BIT		0x40000000
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_START			0x80000
+#define WINDOW_RANGE_MASK		GENMASK(18, 0)
+
 #define QCA6390_DEVICE_ID		0x1101
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
@@ -280,6 +286,52 @@ static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
 	"tcl2host-status-ring",
 };
 
+static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offset)
+{
+	struct ath11k_base *ab = ab_pci->ab;
+
+	u32 window = FIELD_GET(WINDOW_VALUE_MASK, offset);
+
+	lockdep_assert_held(&ab_pci->window_lock);
+
+	if (window != ab_pci->register_window) {
+		iowrite32(WINDOW_ENABLE_BIT | window,
+			  ab->mem + WINDOW_REG_ADDRESS);
+		ab_pci->register_window = window;
+	}
+}
+
+static void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	if (offset < WINDOW_START) {
+		iowrite32(value, ab->mem  + offset);
+	} else {
+		spin_lock_bh(&ab_pci->window_lock);
+		ath11k_pci_select_window(ab_pci, offset);
+		iowrite32(value, ab->mem + WINDOW_START + (offset & WINDOW_RANGE_MASK));
+		spin_unlock_bh(&ab_pci->window_lock);
+	}
+}
+
+static u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	u32 val;
+
+	if (offset < WINDOW_START) {
+		val = ioread32(ab->mem + offset);
+	} else {
+		spin_lock_bh(&ab_pci->window_lock);
+		ath11k_pci_select_window(ab_pci, offset);
+		val = ioread32(ab->mem + WINDOW_START + (offset & WINDOW_RANGE_MASK));
+		spin_unlock_bh(&ab_pci->window_lock);
+	}
+
+	return val;
+}
+
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -578,6 +630,8 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.start = ath11k_pci_start,
 	.stop = ath11k_pci_stop,
+	.read32 = ath11k_pci_read32,
+	.write32 = ath11k_pci_write32,
 	.power_down = ath11k_pci_power_down,
 	.power_up = ath11k_pci_power_up,
 };
@@ -618,6 +672,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ab_pci->pdev = pdev;
 	ab->hif.ops = &ath11k_pci_hif_ops;
 	pci_set_drvdata(pdev, ab);
+	spin_lock_init(&ab_pci->window_lock);
 
 	ret = ath11k_pci_claim(ab_pci, pdev);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 85e033069d7a..0a262c7307fd 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -29,6 +29,10 @@ struct ath11k_pci {
 	u32 msi_ep_base_data;
 	struct mhi_controller *mhi_ctrl;
 	unsigned long mhi_state;
+	u32 register_window;
+
+	/* protects register_window above */
+	spinlock_t window_lock;
 };
 
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
