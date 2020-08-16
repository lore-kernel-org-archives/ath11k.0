Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGm-00075Y-Nw
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:31:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 9/9] ath11k: reset MHI during power down and power up
Date: Sun, 16 Aug 2020 08:31:31 +0300
Message-Id: <1597555891-26112-10-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
References: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, normal power up and power down can't bring MHI
to a workable state. This happens especially in warm reboot
and rmmod and insmod. Host needs to write a few registers to
bring MHI to normal state.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeauroro.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 46 +++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mhi.h | 11 +++++
 drivers/net/wireless/ath/ath11k/pci.c | 79 ++++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.h | 17 ++++++++
 4 files changed, 150 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 62d39ef6741f..d7e60dc5b300 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -107,6 +107,51 @@ static struct mhi_controller_config ath11k_mhi_config = {
 	.event_cfg = ath11k_mhi_events,
 };
 
+void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
+{
+	u32 val;
+
+	val = ath11k_pci_read32(ab, MHISTATUS);
+
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "MHISTATUS 0x%x\n", val);
+
+	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
+	 * has SYSERR bit set and thus need to set MHICTRL_RESET
+	 * to clear SYSERR.
+	 */
+	ath11k_pci_write32(ab, MHICTRL, MHICTRL_RESET_MASK);
+
+	mdelay(10);
+}
+
+static void ath11k_mhi_reset_txvecdb(struct ath11k_base *ab)
+{
+	ath11k_pci_write32(ab, PCIE_TXVECDB, 0);
+}
+
+static void ath11k_mhi_reset_txvecstatus(struct ath11k_base *ab)
+{
+	ath11k_pci_write32(ab, PCIE_TXVECSTATUS, 0);
+}
+
+static void ath11k_mhi_reset_rxvecdb(struct ath11k_base *ab)
+{
+	ath11k_pci_write32(ab, PCIE_RXVECDB, 0);
+}
+
+static void ath11k_mhi_reset_rxvecstatus(struct ath11k_base *ab)
+{
+	ath11k_pci_write32(ab, PCIE_RXVECSTATUS, 0);
+}
+
+void ath11k_mhi_clear_vector(struct ath11k_base *ab)
+{
+	ath11k_mhi_reset_txvecdb(ab);
+	ath11k_mhi_reset_txvecstatus(ab);
+	ath11k_mhi_reset_rxvecdb(ab);
+	ath11k_mhi_reset_rxvecstatus(ab);
+}
+
 static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
@@ -416,7 +461,6 @@ int ath11k_mhi_start(struct ath11k_pci *ab_pci)
 
 void ath11k_mhi_stop(struct ath11k_pci *ab_pci)
 {
-	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_RESUME);
 	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_POWER_OFF);
 	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_DEINIT);
 }
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index 3c91881b4fbd..a7fd5e201d18 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -7,6 +7,15 @@
 
 #include "pci.h"
 
+#define PCIE_TXVECDB				0x360
+#define PCIE_TXVECSTATUS			0x368
+#define PCIE_RXVECDB				0x394
+#define PCIE_RXVECSTATUS			0x39C
+
+#define MHISTATUS				0x48
+#define MHICTRL					0x38
+#define MHICTRL_RESET_MASK			0x2
+
 enum ath11k_mhi_state {
 	ATH11K_MHI_INIT,
 	ATH11K_MHI_DEINIT,
@@ -24,5 +33,7 @@ int ath11k_mhi_start(struct ath11k_pci *ar_pci);
 void ath11k_mhi_stop(struct ath11k_pci *ar_pci);
 int ath11k_mhi_register(struct ath11k_pci *ar_pci);
 void ath11k_mhi_unregister(struct ath11k_pci *ar_pci);
+void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab);
+void ath11k_mhi_clear_vector(struct ath11k_base *ab);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 6a1e74f0d1ac..ca7012d46c3f 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -301,7 +301,7 @@ static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offse
 	}
 }
 
-static void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
+void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
@@ -315,7 +315,7 @@ static void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 	}
 }
 
-static u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
+u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	u32 val;
@@ -332,6 +332,77 @@ static u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 	return val;
 }
 
+static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
+{
+	u32 val, delay;
+
+	val = ath11k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
+
+	val |= PCIE_SOC_GLOBAL_RESET_V;
+
+	ath11k_pci_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+
+	/* TODO: exact time to sleep is uncertain */
+	delay = 10;
+	mdelay(delay);
+
+	/* Need to toggle V bit back otherwise stuck in reset status */
+	val &= ~PCIE_SOC_GLOBAL_RESET_V;
+
+	ath11k_pci_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+
+	mdelay(delay);
+
+	val = ath11k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
+	if (val == 0xffffffff)
+		ath11k_warn(ab, "link down error during global reset\n");
+}
+
+static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
+{
+	u32 val;
+
+	/* read cookie */
+	val = ath11k_pci_read32(ab, PCIE_Q6_COOKIE_ADDR);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "cookie:0x%x\n", val);
+
+	val = ath11k_pci_read32(ab, WLAON_WARM_SW_ENTRY);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "WLAON_WARM_SW_ENTRY 0x%x\n", val);
+
+	/* TODO: exact time to sleep is uncertain */
+	mdelay(10);
+
+	/* write 0 to WLAON_WARM_SW_ENTRY to prevent Q6 from
+	 * continuing warm path and entering dead loop.
+	 */
+	ath11k_pci_write32(ab, WLAON_WARM_SW_ENTRY, 0);
+	mdelay(10);
+
+	val = ath11k_pci_read32(ab, WLAON_WARM_SW_ENTRY);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "WLAON_WARM_SW_ENTRY 0x%x\n", val);
+
+	/* A read clear register. clear the register to prevent
+	 * Q6 from entering wrong code path.
+	 */
+	val = ath11k_pci_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause:%d\n", val);
+}
+
+static void ath11k_pci_force_wake(struct ath11k_base *ab)
+{
+	ath11k_pci_write32(ab, PCIE_SOC_WAKE_PCIE_LOCAL_REG, 1);
+	mdelay(5);
+}
+
+static void ath11k_pci_sw_reset(struct ath11k_base *ab)
+{
+	ath11k_pci_soc_global_reset(ab);
+	ath11k_mhi_clear_vector(ab);
+	ath11k_pci_soc_global_reset(ab);
+	ath11k_mhi_set_mhictrl_reset(ab);
+	ath11k_pci_clear_dbg_registers(ab);
+}
+
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -834,6 +905,8 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	int ret;
 
+	ath11k_pci_sw_reset(ab_pci->ab);
+
 	ret = ath11k_mhi_start(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to start mhi: %d\n", ret);
@@ -848,6 +921,8 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	ath11k_mhi_stop(ab_pci);
+	ath11k_pci_force_wake(ab_pci->ab);
+	ath11k_pci_sw_reset(ab_pci->ab);
 }
 
 static void ath11k_pci_kill_tasklets(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 0a262c7307fd..f2f280eb8b55 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -9,6 +9,21 @@
 
 #include "core.h"
 
+#define PCIE_SOC_GLOBAL_RESET			0x3008
+#define PCIE_SOC_GLOBAL_RESET_V			1
+
+#define WLAON_WARM_SW_ENTRY			0x1f80504
+#define WLAON_SOC_RESET_CAUSE_REG		0x01f8060c
+
+#define PCIE_Q6_COOKIE_ADDR			0x01f80500
+#define PCIE_Q6_COOKIE_DATA			0xc0000000
+
+/* register to wake the UMAC from power collapse */
+#define PCIE_SCRATCH_0_SOC_PCIE_REG		0x4040
+
+/* register used for handshake mechanism to validate UMAC is awake */
+#define PCIE_SOC_WAKE_PCIE_LOCAL_REG		0x3004
+
 struct ath11k_msi_user {
 	char *name;
 	int num_vectors;
@@ -44,5 +59,7 @@ int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ar_pci, char *user_nam
 				       int *num_vectors, u32 *user_base_data,
 				       u32 *base_vector);
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector);
+void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value);
+u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset);
 
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
