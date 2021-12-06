Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C3AC433EF
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=zCAjK3F+ZhXS1yNV34mruwSgeipCyg4E4p+JNM7t8u4=; b=tLx+CUrvPiT+kH
	cenex0/QkPCc/9Ge9kr/crwy3ascIyPz1ZMb9Ok0AZSgOng0FBtCOrgOp1aADYsJEJWSNWVjv2U2G
	ZdU8FsnbU4aPDqNnPjkQIbnMhZ3JnOGWkbfiC6zEE73BmzjPLuc3lfBflRIy+p8FYdnz8s4XVizAm
	5Ly3dRwCnEApECwIpnXA5A/DlRm6OZAtfHc8UnomYgcJDk6s9PbH8C5LQTxXpG5dSOJCCWDRdXLH1
	TQBT+38fZ3Dk6bOo0DuO2YpIil916rVF/kFov65k0Lu77gMsIIP6NPzh0yiROHZC/mkCjV4ZoFJqc
	rZzvdsApYUHaMNCTrEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muN7X-006TLV-2o; Mon, 06 Dec 2021 23:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muN3i-006Rjq-Jz
 for ath11k@bombadil.infradead.org; Mon, 06 Dec 2021 23:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
 References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
 bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=; b=Sk8DTe39Ny8jJDFsA3emKRExuY
 BrMIAL6nCsu/aSWfe8MpsxWE5gcaZmu+4z4XsJSheoMSwOX+3AEvJ4rj8uIlqc7lLfAhuUAY4sBxt
 Avojje3N6GUeCrIHDLM+avuGcBYWSsgQZar4XAvWaB7+Kf3kk0VYSykHq/rEJ3JSIlQ/ArlyyiMOu
 Vccg/HofN/jjWC/4kLwttpCEL3y08w4PHWXB6NsB4Zk+Fn0JeTc3TAN5WKwS4zAZ/xQ9TOuWJInHj
 9TXV0705yQFzNSY8d6rMEotQKw0MrFIbJfYVINeYfOcXBxJZAN67F4Re6ssdjKL+Y2TYAog2r/ruG
 P+DbZkWQ==;
Received: from galois.linutronix.de ([193.142.43.55])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSj-002eGm-Km
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:59 +0000
Message-ID: <20211206210224.925241961@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
 b=XU5P0R3+ZvbfRzdT7eITdUZpVffQhu3mwMQxHIuYgaoigDHKPoocQDa8qE3Uaf7sAC1A9a
 Js9g6cNcn6mG5wi/DOPiYiYl3E8Zz14cSLHuVeGnH6q1kq55XyN9gRmcVHSh5M702eeuzS
 bamXvbJtwYpQ7EnWUWKX/KSbvsAjwKbfyZz1Ddew/kluJQEYrt+sgElwsfwUoFZGHB3SW5
 JWhsk59n5A4ddQt8nalxZK/oiN+HIb+DfnIB5bCE/+7f4xAhtXvdT/dZztFeYnEkP4j9ik
 qGpniZKbYB7qVDkE7feBPxpsBYMFmfBZX4PgA2J+mwXW3+TPFkwcsLvleDUFdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
 b=5xLy8ejXtHWFxftIt7uUy/JNMg6lFP0zokUkUY/UbBvVYESVtltZxcFPpywZO0EAeM6axN
 GP3uFRXwCiRvoiAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:56 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_222757_781845_7C0D8081 
X-CRM114-Status: GOOD (  10.64  )
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

It's only required for PCI/MSI. So no point in having it in every struct
device.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 drivers/base/core.c    |    1 -
 drivers/pci/msi/msi.c  |    2 +-
 drivers/pci/probe.c    |    4 +++-
 include/linux/device.h |    2 --
 include/linux/pci.h    |    1 +
 5 files changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
 	device_pm_init(dev);
 	set_dev_node(dev, NUMA_NO_NODE);
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spin_lock_init(&dev->msi_lock);
 	INIT_LIST_HEAD(&dev->msi_list);
 #endif
 	INIT_LIST_HEAD(&dev->links.consumers);
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
 
 static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
-	raw_spinlock_t *lock = &desc->dev->msi_lock;
+	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
 	unsigned long flags;
 
 	if (!desc->pci.msi_attrib.can_mask)
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2311,7 +2311,9 @@ struct pci_dev *pci_alloc_dev(struct pci
 	INIT_LIST_HEAD(&dev->bus_list);
 	dev->dev.type = &pci_dev_type;
 	dev->bus = pci_bus_get(bus);
-
+#ifdef CONFIG_PCI_MSI
+	raw_spin_lock_init(&dev->msi_lock);
+#endif
 	return dev;
 }
 EXPORT_SYMBOL(pci_alloc_dev);
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -407,7 +407,6 @@ struct dev_links_info {
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
- * @msi_lock:	Lock to protect MSI mask cache and mask register
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
@@ -508,7 +507,6 @@ struct device {
 	struct dev_pin_info	*pins;
 #endif
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spinlock_t		msi_lock;
 	struct list_head	msi_list;
 #endif
 #ifdef CONFIG_DMA_OPS
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -474,6 +474,7 @@ struct pci_dev {
 #endif
 #ifdef CONFIG_PCI_MSI
 	void __iomem	*msix_base;
+	raw_spinlock_t	msi_lock;
 	const struct attribute_group **msi_irq_groups;
 #endif
 	struct pci_vpd	vpd;


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
