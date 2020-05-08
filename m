Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWyqV-0008KR-0j
 for ath11k@lists.infradead.org; Fri, 08 May 2020 08:59:05 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 1/4] ath11k: Add PCI client driver for QCA6390 chipset
Date: Fri,  8 May 2020 14:28:47 +0530
Message-Id: <20200508085850.23363-2-govinds@codeaurora.org>
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

QCA6390 is PCI based 11ax chipset, add
pci client driver for QCA6390 target.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig  | 12 ++++
 drivers/net/wireless/ath/ath11k/Makefile |  7 +-
 drivers/net/wireless/ath/ath11k/ahb.c    | 71 -------------------
 drivers/net/wireless/ath/ath11k/ce.c     |  2 +
 drivers/net/wireless/ath/ath11k/core.c   |  6 ++
 drivers/net/wireless/ath/ath11k/core.h   | 11 +--
 drivers/net/wireless/ath/ath11k/debug.c  |  6 +-
 drivers/net/wireless/ath/ath11k/dp.c     |  1 +
 drivers/net/wireless/ath/ath11k/hal.c    |  1 +
 drivers/net/wireless/ath/ath11k/hif.h    | 77 +++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.c    | 90 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h    | 10 +++
 12 files changed, 211 insertions(+), 83 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.c
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.h

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 738f99090d83..320b3b151bce 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,6 +13,18 @@ config ATH11K
 
 	  If you choose to build a module, it'll be called ath11k.
 
+config ATH11K_AHB
+	tristate "Qualcomm Technologies 802.11ax chipset AHB support"
+	depends on ATH11K
+	---help---
+	  This module adds support for AHB bus
+
+config ATH11K_PCI
+	tristate "Qualcomm Technologies 802.11ax chipset PCI support"
+	depends on ATH11K && PCI
+	---help---
+	  This module adds support for PCIE bus
+
 config ATH11K_DEBUG
 	bool "QCA ath11k debugging"
 	depends on ATH11K
diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
index fe7736e53583..933fcb2fd55d 100644
--- a/drivers/net/wireless/ath/ath11k/Makefile
+++ b/drivers/net/wireless/ath/ath11k/Makefile
@@ -4,7 +4,6 @@ ath11k-y += core.o \
 	    hal.o \
 	    hal_tx.o \
 	    hal_rx.o \
-	    ahb.o \
 	    wmi.o \
 	    mac.o \
 	    reg.o \
@@ -22,5 +21,11 @@ ath11k-$(CONFIG_NL80211_TESTMODE) += testmode.o
 ath11k-$(CONFIG_ATH11K_TRACING) += trace.o
 ath11k-$(CONFIG_THERMAL) += thermal.o
 
+obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
+ath11k_ahb-y += ahb.o
+
+obj-$(CONFIG_ATH11K_PCI) += ath11k_pci.o
+ath11k_pci-y += pci.o
+
 # for tracing framework to find trace.h
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 19cda6bfe9b7..43950367fc1a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -321,77 +321,6 @@ static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
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
 
 /* enum ext_irq_num - irq numbers that can be used by external modules
  * like datapath
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index cdd40c8fc867..7ae1bef0ab30 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -752,6 +752,7 @@ void ath11k_ce_free_pipes(struct ath11k_base *ab)
 		}
 	}
 }
+EXPORT_SYMBOL(ath11k_ce_free_pipes);
 
 int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 {
@@ -806,3 +807,4 @@ int ath11k_ce_get_attr_flags(int ce_id)
 
 	return host_ce_config_wlan[ce_id].flags;
 }
+EXPORT_SYMBOL(ath11k_ce_get_attr_flags);
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 02501cc154fe..8d07a2bb31bb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -749,11 +749,13 @@ void ath11k_core_deinit(struct ath11k_base *ab)
 	ath11k_mac_destroy(ab);
 	ath11k_core_soc_destroy(ab);
 }
+EXPORT_SYMBOL(ath11k_core_deinit);
 
 void ath11k_core_free(struct ath11k_base *ab)
 {
 	kfree(ab);
 }
+EXPORT_SYMBOL(ath11k_core_free);
 
 struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
@@ -786,3 +788,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	kfree(ab);
 	return NULL;
 }
+EXPORT_SYMBOL(ath11k_core_alloc);
+
+MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e711779..757302992ce5 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -88,6 +88,8 @@ struct ath11k_skb_rxcb {
 
 enum ath11k_hw_rev {
 	ATH11K_HW_IPQ8074,
+	ATH11K_HW_QCA6290,
+	ATH11K_HW_QCA6390,
 };
 
 enum ath11k_firmware_mode {
@@ -102,15 +104,6 @@ enum ath11k_firmware_mode {
 #define ATH11K_EXT_IRQ_GRP_NUM_MAX 11
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
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 3fd6b5af073b..eba7a5471ead 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -25,6 +25,7 @@ void ath11k_info(struct ath11k_base *ab, const char *fmt, ...)
 	/* TODO: Trace the log */
 	va_end(args);
 }
+EXPORT_SYMBOL(ath11k_info);
 
 void ath11k_err(struct ath11k_base *ab, const char *fmt, ...)
 {
@@ -39,6 +40,7 @@ void ath11k_err(struct ath11k_base *ab, const char *fmt, ...)
 	/* TODO: Trace the log */
 	va_end(args);
 }
+EXPORT_SYMBOL(ath11k_err);
 
 void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...)
 {
@@ -53,6 +55,7 @@ void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...)
 	/* TODO: Trace the log */
 	va_end(args);
 }
+EXPORT_SYMBOL(ath11k_warn);
 
 #ifdef CONFIG_ATH11K_DEBUG
 void __ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
@@ -73,6 +76,7 @@ void __ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
 
 	va_end(args);
 }
+EXPORT_SYMBOL(__ath11k_dbg);
 
 void ath11k_dbg_dump(struct ath11k_base *ab,
 		     enum ath11k_debug_mask mask,
@@ -101,7 +105,7 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
 		}
 	}
 }
-
+EXPORT_SYMBOL(ath11k_dbg_dump);
 #endif
 
 #ifdef CONFIG_ATH11K_DEBUGFS
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 9ae743e528af..30e78a96ef6d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -7,6 +7,7 @@
 #include "core.h"
 #include "dp_tx.h"
 #include "hal_tx.h"
+#include "hif.h"
 #include "debug.h"
 #include "dp_rx.h"
 #include "peer.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index d63785178afa..c7b26478d3e7 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1133,6 +1133,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 	ath11k_hal_free_cont_rdp(ab);
 	ath11k_hal_free_cont_wrp(ab);
 }
+EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
 void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
 {
diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 165f7e51c238..7e74be42e0fb 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -3,7 +3,81 @@
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
  */
 
-#include "core.h"
+#ifndef _HIF_H_
+#define _HIF_H_
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
+static const u8 ath11k_tx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_TX_RING_MASK_0,
+	ATH11K_TX_RING_MASK_1,
+	ATH11K_TX_RING_MASK_2,
+};
+
+static const u8 rx_mon_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	0, 0, 0, 0,
+	ATH11K_RX_MON_STATUS_RING_MASK_0,
+	ATH11K_RX_MON_STATUS_RING_MASK_1,
+	ATH11K_RX_MON_STATUS_RING_MASK_2,
+};
+
+static const u8 ath11k_rx_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	0, 0, 0, 0, 0, 0, 0,
+	ATH11K_RX_RING_MASK_0,
+	ATH11K_RX_RING_MASK_1,
+	ATH11K_RX_RING_MASK_2,
+	ATH11K_RX_RING_MASK_3,
+};
+
+static const u8 ath11k_rx_err_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RX_ERR_RING_MASK_0,
+};
+
+static const u8 ath11k_rx_wbm_rel_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RX_WBM_REL_RING_MASK_0,
+};
+
+static const u8 ath11k_reo_status_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_REO_STATUS_RING_MASK_0,
+};
+
+static const u8 ath11k_rxdma2host_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_RXDMA2HOST_RING_MASK_0,
+	ATH11K_RXDMA2HOST_RING_MASK_1,
+	ATH11K_RXDMA2HOST_RING_MASK_2,
+};
+
+static const u8 ath11k_host2rxdma_ring_mask[ATH11K_EXT_IRQ_GRP_NUM_MAX] = {
+	ATH11K_HOST2RXDMA_RING_MASK_0,
+	ATH11K_HOST2RXDMA_RING_MASK_1,
+	ATH11K_HOST2RXDMA_RING_MASK_2,
+};
+
 
 struct ath11k_hif_ops {
 	u32 (*read32)(struct ath11k_base *sc, u32 address);
@@ -63,3 +137,4 @@ static inline int ath11k_hif_map_service_to_pipe(struct ath11k_base *sc, u16 ser
 {
 	return sc->hif.ops->map_service_to_pipe(sc, service_id, ul_pipe, dl_pipe);
 }
+#endif /* _HIF_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
new file mode 100644
index 000000000000..582e7cd3c56e
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "core.h"
+#include "pci.h"
+#include "debug.h"
+
+static const struct pci_device_id ath11k_pci_id_table[] = {
+	{ QCA6290_VENDOR_ID, QCA6290_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID },
+	{ QCA6390_VENDOR_ID, QCA6390_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID },
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(pci, ath11k_pci_id_table);
+
+static int ath11k_pci_probe(struct pci_dev *pdev,
+			    const struct pci_device_id *pci_dev)
+{
+	struct ath11k_base *ab;
+	enum ath11k_hw_rev hw_rev;
+	int ret;
+
+	switch (pci_dev->device) {
+	case QCA6290_DEVICE_ID:
+		hw_rev = ATH11K_HW_QCA6290;
+	case QCA6390_DEVICE_ID:
+		hw_rev = ATH11K_HW_QCA6390;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
+			pci_dev->device);
+		WARN_ON(1);
+		return -ENOTSUPP;
+	}
+
+	ab = ath11k_core_alloc(&pdev->dev, 0, ATH11K_BUS_PCI);
+	if (!ab) {
+		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
+		return -ENOMEM;
+	}
+
+	ab->dev = &pdev->dev;
+	ab->hw_rev = hw_rev;
+	pci_set_drvdata(pdev, ab);
+
+	return ret;
+}
+
+static void ath11k_pci_remove(struct pci_dev *pdev)
+{
+	struct ath11k_base *ab = pci_get_drvdata(pdev);
+
+	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	ath11k_core_free(ab);
+}
+
+static struct pci_driver ath11k_pci_driver = {
+	.name = "ath11k_pci",
+	.id_table = ath11k_pci_id_table,
+	.probe = ath11k_pci_probe,
+	.remove = ath11k_pci_remove,
+};
+
+static int ath11k_pci_init(void)
+{
+	int ret;
+
+	ret = pci_register_driver(&ath11k_pci_driver);
+	if (ret)
+		pr_err("failed to register ath11k pci driver: %d\n",
+		       ret);
+
+	return ret;
+}
+module_init(ath11k_pci_init);
+
+static void ath11k_pci_exit(void)
+{
+	pci_unregister_driver(&ath11k_pci_driver);
+}
+
+module_exit(ath11k_pci_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Atheros 802.11ax WLAN PCIe devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
new file mode 100644
index 000000000000..790b8993d225
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
+ */
+
+#define QCA6290_VENDOR_ID		0x17CB
+#define QCA6290_DEVICE_ID		0x1100
+#define QCA6390_VENDOR_ID		0x17CB
+#define QCA6390_DEVICE_ID		0x1101
+
-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
