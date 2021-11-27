Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E285AC433FE
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Op9rfPeLO5/STRcwXoumsGPsDbLMZt3gifuqVvj8NQY=; b=RC6vyvoaR1vXhA
	ltsD0Q0/k6bDo2oLiescFapF/O+6BlRXg+EhqCJVAIcmvA0bbnUeKsDjDYsu7C/n5hLq3SdDIGo9V
	SJvWrWCFN3MQdlgk7aW10sAjoRshj4CsRJ+sa4WoYlwrtj4+XmtVfp5jBEIRwj/PnnbIOzs85s4YI
	1CUeEzCsIBx6ft45uYbkt1hpMK4DJ4bl5VD2MeS+08RCEhG6vu8jxVrdWV/5tOHVwpAjs6iHc8eEa
	N3/p/5pqUAS1qtCDbfMTTNzHkO8tgA0h84KwSam5tdtQ2GkgyFjzcwWY7Gmh84BHyKE61R77/rQIr
	EcV7jQzRNhtml8rur1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmO4-00C9Dc-RV; Sat, 27 Nov 2021 01:20:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmNX-00C8eT-Sz
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:19:51 +0000
Message-ID: <20211126223825.034426787@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=/hUtpZoje77D8jXpCF4dVmu6dIuQVzxr12Tf8gEZrmw=;
 b=kiIa3WnklR7w/ZeDbikmw6N61xfDMfnL6ZU/pOOseNiVV+omr9Aa6z+0BVgtzFMBCu6iMQ
 zKsikuo1zFVGhoKSmUIEASSuBkvEd3ptUL2iOJdMyQ3DpnQuo+VIo5ifVixMvFUEzvNoNu
 3f2nitVyliW8P6TzXAaFW55/Jm1WCxDf99/Fz3p6iH3FrRJBfIjc+FJfNcFSu5JrTV/hOF
 5vLWCzkgjOJjajXnssaIYKp5J8LS4aL6X2YpJXn2eqN0373MUkl/B9A8NvGWVAer6wN7Qg
 Q3WpDV96QQDz3VHeQEjDnHcYO8c9rPbBEjBtYtLeg990OTmzjYCl3GKUZdmhyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=/hUtpZoje77D8jXpCF4dVmu6dIuQVzxr12Tf8gEZrmw=;
 b=8oE5dILfIppEOM4uSmv1UhhF+8V1aTl25VsmBDW8Y6mgtC2SCQ+c3AwBH+9jTQgu7f5Oe3
 TgJGtWPMxxBhbTDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 16/22] PCI/MSI: Split out CONFIG_PCI_MSI independent part
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:19:45 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171948_110151_F37735D8 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
Message-ID: <20211127011945.SPxin6kQhEE2feJggsDSet9-ewWF357pq5eYRr-feK0@z>

These functions are required even when CONFIG_PCI_MSI is not set. Move them
to their own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/Makefile     |    3 ++-
 drivers/pci/msi/msi.c        |   39 ---------------------------------------
 drivers/pci/msi/pcidev_msi.c |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 40 deletions(-)

--- a/drivers/pci/msi/Makefile
+++ b/drivers/pci/msi/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the PCI/MSI
-obj-$(CONFIG_PCI)		+= msi.o
+obj-$(CONFIG_PCI)		+= pcidev_msi.o
+obj-$(CONFIG_PCI_MSI)		+= msi.o
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,8 +18,6 @@
 
 #include "../pci.h"
 
-#ifdef CONFIG_PCI_MSI
-
 static int pci_msi_enable = 1;
 int pci_msi_ignore_mask;
 
@@ -1479,40 +1477,3 @@ bool pci_dev_has_special_msi_domain(stru
 }
 
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
-#endif /* CONFIG_PCI_MSI */
-
-void pci_msi_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	/*
-	 * Disable the MSI hardware to avoid screaming interrupts
-	 * during boot.  This is the power on reset default so
-	 * usually this should be a noop.
-	 */
-	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
-	if (!dev->msi_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
-	if (ctrl & PCI_MSI_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
-				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
-
-	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
-		dev->no_64bit_msi = 1;
-}
-
-void pci_msix_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
-	if (!dev->msix_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
-	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
-				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
-}
--- /dev/null
+++ b/drivers/pci/msi/pcidev_msi.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MSI[X} related functions which are available unconditionally.
+ */
+#include "../pci.h"
+
+/*
+ * Disable the MSI[X] hardware to avoid screaming interrupts during boot.
+ * This is the power on reset default so usually this should be a noop.
+ */
+
+void pci_msi_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
+	if (!dev->msi_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
+	if (ctrl & PCI_MSI_FLAGS_ENABLE) {
+		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
+				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
+	}
+
+	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
+		dev->no_64bit_msi = 1;
+}
+
+void pci_msix_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
+	if (!dev->msix_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
+	if (ctrl & PCI_MSIX_FLAGS_ENABLE) {
+		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
+				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
+	}
+}


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
