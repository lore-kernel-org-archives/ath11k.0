Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNv0I-00069H-BW
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:36:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/8] ath11k: read and write registers below unwindowed address
Date: Thu,  1 Oct 2020 12:34:43 +0300
Message-Id: <1601544890-13450-2-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

For QCA6390, host can read and write registers below unwindowed
address directly without programming the window register. For
registers below bar0 + 4k - 32, host can read and write regardless
of the power save state. Shadow registers are located below
bar0 + 4K - 32.

Before MHI power up, there is no need to wakeup MHI so ini_done is
added to indicate it.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 69e5b7c57695..e72dca4fa577 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -28,6 +28,12 @@
 #define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(16, 8)
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 0)
 
+/* BAR0 + 4k is always accessible, and no
+ * need to force wakeup.
+ * 4K - 32 = 0xFE0
+ */
+#define ACCESS_ALWAYS_OFF 0xFE0
+
 #define QCA6390_DEVICE_ID		0x1101
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
@@ -128,6 +134,13 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
+	/* for offset beyond BAR + 4K - 32, may
+	 * need to wakeup MHI to access.
+	 */
+	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+	    offset >= ACCESS_ALWAYS_OFF)
+		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+
 	if (offset < WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
 	} else {
@@ -136,6 +149,10 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 		iowrite32(value, ab->mem + WINDOW_START + (offset & WINDOW_RANGE_MASK));
 		spin_unlock_bh(&ab_pci->window_lock);
 	}
+
+	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+	    offset >= ACCESS_ALWAYS_OFF)
+		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 }
 
 u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
@@ -143,6 +160,13 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	u32 val;
 
+	/* for offset beyond BAR + 4K - 32, may
+	 * need to wakeup MHI to access.
+	 */
+	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+	    offset >= ACCESS_ALWAYS_OFF)
+		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+
 	if (offset < WINDOW_START) {
 		val = ioread32(ab->mem + offset);
 	} else {
@@ -152,6 +176,10 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 		spin_unlock_bh(&ab_pci->window_lock);
 	}
 
+	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+	    offset >= ACCESS_ALWAYS_OFF)
+		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
+
 	return val;
 }
 
@@ -731,6 +759,8 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	int ret;
 
+	ab_pci->register_window = 0;
+	clear_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 	ath11k_pci_sw_reset(ab_pci->ab);
 
 	ret = ath11k_mhi_start(ab_pci);
@@ -747,6 +777,7 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	ath11k_mhi_stop(ab_pci);
+	clear_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 	ath11k_pci_force_wake(ab_pci->ab);
 	ath11k_pci_sw_reset(ab_pci->ab);
 }
@@ -775,6 +806,10 @@ static void ath11k_pci_stop(struct ath11k_base *ab)
 
 static int ath11k_pci_start(struct ath11k_base *ab)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	set_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
+
 	ath11k_pci_ce_irqs_enable(ab);
 	ath11k_ce_rx_post_buf(ab);
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index f2f280eb8b55..43562f774a37 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -36,6 +36,10 @@ struct ath11k_msi_config {
 	struct ath11k_msi_user *users;
 };
 
+enum ath11k_pci_flags {
+	ATH11K_PCI_FLAG_INIT_DONE,
+};
+
 struct ath11k_pci {
 	struct pci_dev *pdev;
 	struct ath11k_base *ab;
@@ -48,6 +52,9 @@ struct ath11k_pci {
 
 	/* protects register_window above */
 	spinlock_t window_lock;
+
+	/* enum ath11k_pci_flags */
+	unsigned long flags;
 };
 
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
