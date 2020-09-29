Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJEB-0000SO-H1
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/8] ath11k: pci: check TCSR_SOC_HW_VERSION
Date: Tue, 29 Sep 2020 20:15:32 +0300
Message-Id: <1601399736-3210-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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

There are different versions of QCA6390. Check TCSR_SOC_HW_VERSION to make sure
that the device is hw2.0, all the rest are unsupported.

This needs to be checked after ath11k_pci_claim() so move the whole switch choosing hw_ver.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 46 ++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index aec0b593c6a7..e76a8b61d037 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -24,6 +24,10 @@
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
 
+#define TCSR_SOC_HW_VERSION		0x0224
+#define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(16, 8)
+#define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 0)
+
 #define QCA6390_DEVICE_ID		0x1101
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
@@ -839,21 +843,11 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 {
 	struct ath11k_base *ab;
 	struct ath11k_pci *ab_pci;
-	enum ath11k_hw_rev hw_rev;
+	u32 soc_hw_version, soc_hw_version_major, soc_hw_version_minor;
 	int ret;
 
 	dev_warn(&pdev->dev, "WARNING: ath11k PCI support is experimental!\n");
 
-	switch (pci_dev->device) {
-	case QCA6390_DEVICE_ID:
-		hw_rev = ATH11K_HW_QCA6390_HW20;
-		break;
-	default:
-		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
-			pci_dev->device);
-		return -ENOTSUPP;
-	}
-
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
 			       &ath11k_pci_bus_params);
 	if (!ab) {
@@ -862,7 +856,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	}
 
 	ab->dev = &pdev->dev;
-	ab->hw_rev = hw_rev;
 	pci_set_drvdata(pdev, ab);
 	ab_pci = ath11k_pci_priv(ab);
 	ab_pci->dev_id = pci_dev->device;
@@ -878,6 +871,35 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_free_core;
 	}
 
+	switch (pci_dev->device) {
+	case QCA6390_DEVICE_ID:
+		soc_hw_version = ath11k_pci_read32(ab, TCSR_SOC_HW_VERSION);
+		soc_hw_version_major = FIELD_GET(TCSR_SOC_HW_VERSION_MAJOR_MASK,
+						 soc_hw_version);
+		soc_hw_version_minor = FIELD_GET(TCSR_SOC_HW_VERSION_MINOR_MASK,
+						 soc_hw_version);
+
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "pci tcsr_soc_hw_version major %d minor %d\n",
+			   soc_hw_version_major, soc_hw_version_minor);
+
+		switch (soc_hw_version_major) {
+		case 2:
+			ab->hw_rev = ATH11K_HW_QCA6390_HW20;
+			break;
+		default:
+			dev_err(&pdev->dev, "Unsupported QCA6390 SOC hardware version: %d %d\n",
+				soc_hw_version_major, soc_hw_version_minor);
+			ret = -EOPNOTSUPP;
+			goto err_pci_free_region;
+		}
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
+			pci_dev->device);
+		ret = -EOPNOTSUPP;
+		goto err_pci_free_region;
+	}
+
 	ret = ath11k_pci_enable_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
