Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMZc-0001U3-E5
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 14:05:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/6] ath11k: pci: disable VDD4BLOW
Date: Thu, 10 Dec 2020 16:05:23 +0200
Message-Id: <1607609124-17250-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
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

It's recommended to disable VDD4BLOW during initialisation.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 064c35052697..818e37c32a85 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -346,6 +346,15 @@ static void ath11k_pci_clear_all_intrs(struct ath11k_base *ab)
 	ath11k_pci_write32(ab, PCIE_PCIE_INT_ALL_CLEAR, PCIE_INT_CLEAR_ALL);
 }
 
+static void ath11k_pci_set_wlaon_pwr_ctrl(struct ath11k_base *ab)
+{
+	u32 val;
+
+	val = ath11k_pci_read32(ab, WLAON_QFPROM_PWR_CTRL_REG);
+	val &= ~QFPROM_PWR_CTRL_VDD4BLOW_MASK;
+	ath11k_pci_write32(ab, WLAON_QFPROM_PWR_CTRL_REG, val);
+}
+
 static void ath11k_pci_force_wake(struct ath11k_base *ab)
 {
 	ath11k_pci_write32(ab, PCIE_SOC_WAKE_PCIE_LOCAL_REG, 1);
@@ -357,6 +366,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 	if (power_on) {
 		ath11k_pci_enable_ltssm(ab);
 		ath11k_pci_clear_all_intrs(ab);
+		ath11k_pci_set_wlaon_pwr_ctrl(ab);
 		ath11k_pci_fix_l1ss(ab);
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 6e7cc8904c3d..0432a702416b 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -45,6 +45,9 @@
 #define PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG4_VAL	0xff
 #define PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK	0x000000ff
 
+#define WLAON_QFPROM_PWR_CTRL_REG		0x01f8031c
+#define QFPROM_PWR_CTRL_VDD4BLOW_MASK		0x4
+
 struct ath11k_msi_user {
 	char *name;
 	int num_vectors;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
