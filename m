Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWyqg-0008KR-SY
 for ath11k@lists.infradead.org; Fri, 08 May 2020 08:59:17 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 3/4] ath11k: Add msi config init for QCA6390
Date: Fri,  8 May 2020 14:28:49 +0530
Message-Id: <20200508085850.23363-4-govinds@codeaurora.org>
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

QCA6390 uses PCI msi for CE/MHI/DP interrupt.
Add msi vector mapping and msi enable/disable ops.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c   | 91 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h   | 14 ++++
 3 files changed, 106 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index c30085406bfb..1cfe54859388 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -25,6 +25,7 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_REG		= 0x00000200,
 	ATH11K_DBG_TESTMODE	= 0x00000400,
 	ATH11k_DBG_HAL		= 0x00000800,
+	ATH11K_DBG_PCI		= 0x00001000,
 	ATH11K_DBG_ANY		= 0xffffffff,
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 6ab9e25c4ff9..d89dcb5fe81e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/msi.h>
 #include <linux/pci.h>
 
 #include "ahb.h"
@@ -19,11 +20,88 @@ static const struct pci_device_id ath11k_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath11k_pci_id_table);
 
+static struct ath11k_msi_config msi_config = {
+	.total_vectors = 32,
+	.total_users = 4,
+	.users = (struct ath11k_msi_user[]) {
+		{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+		{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
+		{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
+		{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
+	},
+};
+
+static int ath11k_pci_get_msi_assignment(struct ath11k_pci *ab_pci)
+{
+	ab_pci->msi_config = &msi_config;
+
+	return 0;
+}
+
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
 {
 	return (struct ath11k_pci *)ab->drv_priv;
 }
 
+static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
+{
+	struct ath11k_base *ab = ab_pci->ab;
+	struct ath11k_msi_config *msi_config;
+	struct msi_desc *msi_desc;
+	int num_vectors;
+	int ret;
+
+	ret = ath11k_pci_get_msi_assignment(ab_pci);
+	if (ret) {
+		ath11k_err(ab, "failed to get MSI assignment, err = %d\n", ret);
+		goto out;
+	}
+
+	msi_config = ab_pci->msi_config;
+	if (!msi_config) {
+		ath11k_err(ab, "msi_config is NULL!\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
+					    msi_config->total_vectors,
+					    msi_config->total_vectors,
+					    PCI_IRQ_MSI);
+	if (num_vectors != msi_config->total_vectors) {
+		ath11k_err(ab, "failed to get enough MSI vectors (%d), available vectors = %d",
+			   msi_config->total_vectors, num_vectors);
+		if (num_vectors >= 0)
+			ret = -EINVAL;
+		goto reset_msi_config;
+	}
+
+	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
+	if (!msi_desc) {
+		ath11k_err(ab, "msi_desc is NULL!\n");
+		ret = -EINVAL;
+		goto free_msi_vector;
+	}
+
+	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", ab_pci->msi_ep_base_data);
+
+	return 0;
+
+free_msi_vector:
+	pci_free_irq_vectors(ab_pci->pdev);
+reset_msi_config:
+	ab_pci->msi_config = NULL;
+out:
+	return ret;
+}
+
+static void ath11k_pci_disable_msi(struct ath11k_pci *ab_pci)
+{
+	pci_free_irq_vectors(ab_pci->pdev);
+}
+
 static int ath11k_pci_claim(struct ath11k_pci *ab_pci, struct pci_dev *pdev)
 {
 	u32 pci_dma_mask = PCI_DMA_MASK_32_BIT;
@@ -139,6 +217,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ab_pci = ath11k_pci_priv(ab);
 	ab_pci->dev_id = pci_dev->device;
 	ab_pci->ab = ab;
+	ab_pci->dev = &pdev->dev;
+	ab_pci->pdev = pdev;
 	ab->dev = &pdev->dev;
 	ab->hw_rev = hw_rev;
 	pci_set_drvdata(pdev, ab);
@@ -149,10 +229,20 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_free_core;
 	}
 
+	ret = ath11k_pci_enable_msi(ab_pci);
+	if (ret) {
+		ath11k_err(ab, "failed to enable  msi: %d\n", ret);
+		goto err_pci_free_region;
+	}
+
 	return 0;
 
+err_pci_free_region:
+	ath11k_pci_free_region(ab_pci);
+
 err_free_core:
 	ath11k_core_free(ab);
+
 	return ret;
 }
 
@@ -162,6 +252,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	ath11k_pci_disable_msi(ab_pci);
 	ath11k_pci_free_region(ab_pci);
 	ath11k_core_free(ab);
 }
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 5e6f2b5059a8..7c7fa1965aa6 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -11,6 +11,18 @@
 #define PCI_DMA_MASK_64_BIT		64
 #define PCI_DMA_MASK_32_BIT		32
 
+struct ath11k_msi_user {
+	char *name;
+	int num_vectors;
+	u32 base_vector;
+};
+
+struct ath11k_msi_config {
+	int total_vectors;
+	int total_users;
+	struct ath11k_msi_user *users;
+};
+
 struct ath11k_pci {
 	struct pci_dev *pdev;
 	struct device *dev;
@@ -19,4 +31,6 @@ struct ath11k_pci {
 	size_t mem_len;
 	u16 dev_id;
 	u32 chip_id;
+	struct ath11k_msi_config *msi_config;
+	u32 msi_ep_base_data;
 };
-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
