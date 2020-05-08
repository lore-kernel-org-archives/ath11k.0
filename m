Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWyqg-0008DR-Pl
 for ath11k@lists.infradead.org; Fri, 08 May 2020 08:59:18 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/4] ath11k: setup pci resource for QCA6390 target
Date: Fri,  8 May 2020 14:28:48 +0530
Message-Id: <20200508085850.23363-3-govinds@codeaurora.org>
In-Reply-To: <20200508085850.23363-1-govinds@codeaurora.org>
References: <20200508085850.23363-1-govinds@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add support for setting up pci region and dma mask
for QCA6390 target.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 109 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.h  |  12 +++
 3 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8d07a2bb31bb..4c3f5a9d0d8a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -14,6 +14,7 @@
 #include "hif.h"
 
 unsigned int ath11k_debug_mask;
+EXPORT_SYMBOL(ath11k_debug_mask);
 module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 582e7cd3c56e..6ab9e25c4ff9 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include "ahb.h"
 #include "core.h"
 #include "pci.h"
 #include "debug.h"
@@ -18,10 +19,98 @@ static const struct pci_device_id ath11k_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath11k_pci_id_table);
 
+static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
+{
+	return (struct ath11k_pci *)ab->drv_priv;
+}
+
+static int ath11k_pci_claim(struct ath11k_pci *ab_pci, struct pci_dev *pdev)
+{
+	u32 pci_dma_mask = PCI_DMA_MASK_32_BIT;
+	struct ath11k_base *ab = ab_pci->ab;
+	u16 device_id;
+	int ret = 0;
+
+	pci_read_config_word(pdev, PCI_DEVICE_ID, &device_id);
+	if (device_id != ab_pci->dev_id)  {
+		ath11k_err(ab, "pci device id mismatch, config ID: 0x%x, probe ID: 0x%x\n",
+			   device_id, ab_pci->dev_id);
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = pci_assign_resource(pdev, PCI_BAR_NUM);
+	if (ret) {
+		ath11k_err(ab, "failed to assign pci resource, err = %d\n", ret);
+		goto out;
+	}
+
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		ath11k_err(ab, "failed to enable pci device, err = %d\n", ret);
+		goto out;
+	}
+
+	ret = pci_request_region(pdev, PCI_BAR_NUM, "ath11k_pci");
+	if (ret) {
+		ath11k_err(ab, "failed to request pci region, err = %d\n", ret);
+		goto disable_device;
+	}
+
+	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(pci_dma_mask));
+	if (ret) {
+		ath11k_err(ab, "failed to set pci dma mask (%d), err = %d\n",
+			   ret, pci_dma_mask);
+		goto release_region;
+	}
+
+	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(pci_dma_mask));
+	if (ret) {
+		ath11k_err(ab, "failed to set pci consistent dma mask (%d), err = %d\n",
+			   ret, pci_dma_mask);
+		goto release_region;
+	}
+
+	pci_set_master(pdev);
+
+	ab_pci->mem_len = pci_resource_len(pdev, PCI_BAR_NUM);
+	ab_pci->mem = pci_iomap(pdev, PCI_BAR_NUM, 0);
+	if (!ab_pci->mem) {
+		ath11k_err(ab, "failed to map pci bar, bar = %d\n", PCI_BAR_NUM);
+		ret = -EIO;
+		goto clear_master;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot pci_mem 0x%pK\n", ab_pci->mem);
+	return 0;
+
+clear_master:
+	pci_clear_master(pdev);
+release_region:
+	pci_release_region(pdev, PCI_BAR_NUM);
+disable_device:
+	pci_disable_device(pdev);
+out:
+	return ret;
+}
+
+static void ath11k_pci_free_region(struct ath11k_pci *ab_pci)
+{
+	struct pci_dev *pci_dev = ab_pci->pdev;
+
+	pci_iounmap(pci_dev, ab_pci->mem);
+	ab_pci->mem = NULL;
+	pci_clear_master(pci_dev);
+	pci_release_region(pci_dev, PCI_BAR_NUM);
+	if (pci_is_enabled(pci_dev))
+		pci_disable_device(pci_dev);
+}
+
 static int ath11k_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *pci_dev)
 {
 	struct ath11k_base *ab;
+	struct ath11k_pci *ab_pci;
 	enum ath11k_hw_rev hw_rev;
 	int ret;
 
@@ -38,24 +127,42 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		return -ENOTSUPP;
 	}
 
-	ab = ath11k_core_alloc(&pdev->dev, 0, ATH11K_BUS_PCI);
+	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI);
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
 	}
 
+	ab->dev = &pdev->dev;
+	ab->hw_rev = hw_rev;
+	pci_set_drvdata(pdev, ab);
+	ab_pci = ath11k_pci_priv(ab);
+	ab_pci->dev_id = pci_dev->device;
+	ab_pci->ab = ab;
 	ab->dev = &pdev->dev;
 	ab->hw_rev = hw_rev;
 	pci_set_drvdata(pdev, ab);
 
+	ret = ath11k_pci_claim(ab_pci, pdev);
+	if (ret) {
+		ath11k_err(ab, "failed to claim device: %d\n", ret);
+		goto err_free_core;
+	}
+
+	return 0;
+
+err_free_core:
+	ath11k_core_free(ab);
 	return ret;
 }
 
 static void ath11k_pci_remove(struct pci_dev *pdev)
 {
 	struct ath11k_base *ab = pci_get_drvdata(pdev);
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	ath11k_pci_free_region(ab_pci);
 	ath11k_core_free(ab);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 790b8993d225..5e6f2b5059a8 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -7,4 +7,16 @@
 #define QCA6290_DEVICE_ID		0x1100
 #define QCA6390_VENDOR_ID		0x17CB
 #define QCA6390_DEVICE_ID		0x1101
+#define PCI_BAR_NUM			0
+#define PCI_DMA_MASK_64_BIT		64
+#define PCI_DMA_MASK_32_BIT		32
 
+struct ath11k_pci {
+	struct pci_dev *pdev;
+	struct device *dev;
+	struct ath11k_base *ab;
+	void __iomem *mem;
+	size_t mem_len;
+	u16 dev_id;
+	u32 chip_id;
+};
-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
