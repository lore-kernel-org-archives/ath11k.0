Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31546C433F5
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 23:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=WlRXiu+pDaeMMrztsfOL5/kSOvEb6JfRSGmoQrejIA8=; b=oxIU6Osra8gGtm
	sCyqzfm0YRbML0XVB+lssK50heEteOWLHFIDUfS7aEbwtbiJEn7IG7V9H7DQnERXs2ifKedsKVcTO
	/hzPbGMKBcGnZS3n5FfihlpJ/a+oRHUYFHeJ6KRxjOT+5+L7prZjU8j1bgyf0p9kgcXWOkQcc1Z57
	/zp1k/vaoReSyQbonJr5AE4EYzVdq5WbndrH2fjmmuRaflQqdsvCcGAAkKbfd1OLO7I0/2WonuOmB
	5z2IJ619uQZQtCQj93w6Sga2Xna4qdA/MB0FvlHoxc35zy23G2UKSAi/T0YETURF92V0B4Il3kUcJ
	6tsJZXf5TGmpRiWup19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muN7c-006TOr-H8; Mon, 06 Dec 2021 23:10:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muN3k-006Rjq-0K
 for ath11k@bombadil.infradead.org; Mon, 06 Dec 2021 23:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
 References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
 bh=yrY1ZB0NumM3iY3b+dL6tdvji5YdLo8YZzow0Pc98K0=; b=fJVDjXHGMYsDRfABqiUPxEWmHv
 LTKvj7wziddRlHc2CD3lUs5chHw9J1pgUDEXHo/V2ps4FmSS0uthFDfGECaBdNfXLRjlrWHqZz5+r
 4Zt5qaDMDl4OrnkVAy9wpbpx2al9aJPaoNgeVPV5OZk32bdQ8WU8KrIDt0mxa0wTQSGA5uU0ouLOS
 W6Z+k6hIDC5FG+Q615SbJvJX8Q0yIAuvr4q4W+uYWHFuIS22BlAMWxV+Ixb5Y9j00M0YCAgcF+7hS
 RSuWRJJeKi/6VfubwMUs5jActgNB9RK/asltQWEegYwS2qszPcd4CpEpov9atNZJjC7HwaAEK8TvE
 AJduR4Sg==;
Received: from galois.linutronix.de ([193.142.43.55])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSf-002eFz-3z
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:55 +0000
Message-ID: <20211206210224.763574089@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=yrY1ZB0NumM3iY3b+dL6tdvji5YdLo8YZzow0Pc98K0=;
 b=yogWCLClZ5HawXr86pUvSu27UdiujY09fLCr9qODZ6WHG6tdy1jo4R5oUed+NZBlb4D+aL
 7QpxacnGafJnNFuGA3Qr4uuaCUoNpqcC0RQIn/nv2i/ZqqOPRpDk41N3evYyZcNUIORUqQ
 RmyJmVXQ4SgC9OEaoFrfssQoJ8Xwn+4ZyexyySLnXH1jXW3w7H7gjCvNcp6z/9YZb3iZef
 SnjRI8A4v1jtxW1cvkAQLxfhlEO0mCCMG5y3BXvNH9MRSgIaMFqX4JKVHvpx5vMHBoS0Bb
 XHborQKOUtJXUnqPXT77WiZSbh3UWDmLFWdvo+NEVEOm05/Ol4MBGoFkTWQRhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=yrY1ZB0NumM3iY3b+dL6tdvji5YdLo8YZzow0Pc98K0=;
 b=xWk0QhW9rvUKaVhvOUrP23TOY6t2RbQv3eb8/ILfXzb+qQTtu1Dgw8jDLlkSfce65pUPAy
 AUFj7t7KeK1aKUCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Juergen Gross <jgross@suse.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 17/23] PCI/MSI: Split out !IRQDOMAIN code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:51 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_222753_379550_0D7EF7C2 
X-CRM114-Status: GOOD (  15.18  )
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

Split out the non irqdomain code into its own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
V2: Add proper includes and fix variable name - Cedric
---
 drivers/pci/msi/Makefile |    5 ++--
 drivers/pci/msi/legacy.c |   52 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/msi/msi.c    |   46 -----------------------------------------
 3 files changed, 55 insertions(+), 48 deletions(-)

--- a/drivers/pci/msi/Makefile
+++ b/drivers/pci/msi/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the PCI/MSI
-obj-$(CONFIG_PCI)		+= pcidev_msi.o
-obj-$(CONFIG_PCI_MSI)		+= msi.o
+obj-$(CONFIG_PCI)			+= pcidev_msi.o
+obj-$(CONFIG_PCI_MSI)			+= msi.o
+obj-$(CONFIG_PCI_MSI_ARCH_FALLBACKS)	+= legacy.o
--- /dev/null
+++ b/drivers/pci/msi/legacy.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Message Signaled Interrupt (MSI).
+ *
+ * Legacy architecture specific setup and teardown mechanism.
+ */
+#include <linux/msi.h>
+#include <linux/pci.h>
+
+/* Arch hooks */
+int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
+{
+	return -EINVAL;
+}
+
+void __weak arch_teardown_msi_irq(unsigned int irq)
+{
+}
+
+int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct msi_desc *desc;
+	int ret;
+
+	/*
+	 * If an architecture wants to support multiple MSI, it needs to
+	 * override arch_setup_msi_irqs()
+	 */
+	if (type == PCI_CAP_ID_MSI && nvec > 1)
+		return 1;
+
+	for_each_pci_msi_entry(desc, dev) {
+		ret = arch_setup_msi_irq(dev, desc);
+		if (ret)
+			return ret < 0 ? ret : -ENOSPC;
+	}
+
+	return 0;
+}
+
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
+	int i;
+
+	for_each_pci_msi_entry(desc, dev) {
+		if (desc->irq) {
+			for (i = 0; i < desc->nvec_used; i++)
+				arch_teardown_msi_irq(desc->irq + i);
+		}
+	}
+}
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -50,52 +50,6 @@ static void pci_msi_teardown_msi_irqs(st
 #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
 #endif
 
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
-/* Arch hooks */
-int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
-{
-	return -EINVAL;
-}
-
-void __weak arch_teardown_msi_irq(unsigned int irq)
-{
-}
-
-int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	int i;
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		if (entry->irq)
-			for (i = 0; i < entry->nvec_used; i++)
-				arch_teardown_msi_irq(entry->irq + i);
-}
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
-
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
  * mask all MSI interrupts by clearing the MSI enable bit does not work


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
