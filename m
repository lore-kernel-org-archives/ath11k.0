Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khRpA-0001SM-M7
 for ath11k@lists.infradead.org; Tue, 24 Nov 2020 06:29:14 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2] ath11k: add 64bit check before reading msi high addr
Date: Tue, 24 Nov 2020 11:58:54 +0530
Message-Id: <1606199334-18206-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

In QCN9074 ath11k boot, firmware crash is observed in 64-bit
builds and is due to wrong 64 bit MSI address size. This patch
fixes the firmware crash. Read msi high addr if 64-bit addresses
allowed on MSI.

Tested-On: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V2:
  - Fixes compilation issues

 drivers/net/wireless/ath/ath11k/pci.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/pci.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index b75f47dc36de..54ac0a861063 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -264,13 +264,18 @@ int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
 static void ath11k_pci_get_msi_address(struct ath11k_base *ab, u32 *msi_addr_lo,
 				       u32 *msi_addr_hi)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
 
 	pci_read_config_dword(pci_dev, pci_dev->msi_cap + PCI_MSI_ADDRESS_LO,
 			      msi_addr_lo);
 
-	pci_read_config_dword(pci_dev, pci_dev->msi_cap + PCI_MSI_ADDRESS_HI,
-			      msi_addr_hi);
+	if (test_bit(ATH11K_PCI_FLAG_IS_MSI_64, &ab_pci->flags)) {
+		pci_read_config_dword(pci_dev, pci_dev->msi_cap + PCI_MSI_ADDRESS_HI,
+				      msi_addr_hi);
+	} else {
+		*msi_addr_hi = 0;
+	}
 }
 
 int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ab_pci, char *user_name,
@@ -658,6 +663,8 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 	}
 
 	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+	if (msi_desc->msi_attrib.is_64)
+		set_bit(ATH11K_PCI_FLAG_IS_MSI_64, &ab_pci->flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", ab_pci->msi_ep_base_data);
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 43562f774a37..9c503a17c237 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -38,6 +38,7 @@ struct ath11k_msi_config {
 
 enum ath11k_pci_flags {
 	ATH11K_PCI_FLAG_INIT_DONE,
+	ATH11K_PCI_FLAG_IS_MSI_64,
 };
 
 struct ath11k_pci {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
