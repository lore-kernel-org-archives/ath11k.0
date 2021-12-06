Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EDCC2BA4C
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=NRd5/p7AjEqWQbA+7LgrIGNaiQFixNzcV3PiKBxO2zw=; b=E/wRjzRLbeDZNg
	YwzR3DdKUF7kT8per6wYTD2iv83vztE02k9vcAEvp3dGevq8Zo0SdjZqY3IFtBkTwXNOQxJUiuiO3
	k6IxtXArTiCMLmvpVNr75ra0PrR0TMAJLEZgGaXUAejq0QkhTkFISlAT8T4+E1aD/o7c059xEcitN
	IZOAMw+InY3+9UliC6J+/7qb49MynwEAu0hR64pVf+LG2uDK3iSmBlEnnVWDB8X0nom6JeksBWO4E
	52gYNSMw51vYf8patUkGwxGhGqQpqA8MnqJejiV3BShsAM5ume9HTbbh3XR99KR8ag2p+GFT7WwxV
	i/9RpJu5YpES2Wtua3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMSJ-006Ccv-Po; Mon, 06 Dec 2021 22:27:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSG-006Ca3-GZ
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:30 +0000
Message-ID: <20211206210223.929792157@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=wYOapsewmvCjRKNhvhV0vpzUO9z80CJEqQBEg5ZWMSo=;
 b=cLSzakHMaYNtI4aJ6BLkP0Y1ckKByNqQRdbeialjjHb7VsdJKr1LXNnGFwD5jPorL/dB3X
 r8LL7BBEXT9ttMDduYesmAWnKu89MMUh+WbP//3UR9Oqi8u6Ke9f0j6kvDzk55pgKJlLw8
 pXM/pbZ+DKZAxpGnovR5d0BXBdradoJwITrMoZLhwgv5vAP0K0ZMzZys/cJmxk0kAoxLqB
 9HeDnDnYxU3SNfvQbR+KwVpjQ6g9EPn1CLChmqViSe3oPCpxc2+ZyZ9945UmAuQkVFQb/B
 Ms+5OGgiP91cMgej9Fb+5+mTuU/pnBqgmKdO+oCNOau73VDp3kwOD/z+rrVPrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=wYOapsewmvCjRKNhvhV0vpzUO9z80CJEqQBEg5ZWMSo=;
 b=AC1UyRei3djvmFCd8sCxirgN9BF19ZHUhoSg/ujiTsv7YGfDjxkFl5ncJxZvQt8R7ZWn4X
 QnYXgZVa/LFvUdBg==
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
Subject: [patch V2 02/23] PCI/MSI: Fix pci_irq_vector()/pci_irq_get_affinity()
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:26 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142728_743370_7E277700 
X-CRM114-Status: GOOD (  14.71  )
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

pci_irq_vector() and pci_irq_get_affinity() use the list position to find the
MSI-X descriptor at a given index. That's correct for the normal case where
the entry number is the same as the list position.

But it's wrong for cases where MSI-X was allocated with an entries array
describing sparse entry numbers into the hardware message descriptor
table. That's inconsistent at best.

Make it always check the entry number because that's what the zero base
index really means. This change won't break existing users which use a
sparse entries array for allocation because these users retrieve the Linux
interrupt number from the entries array after allocation and none of them
uses pci_irq_vector() or pci_irq_get_affinity().

Fixes: aff171641d18 ("PCI: Provide sensible IRQ vector alloc/free routines")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
V2: Fix typo in subject - Jason
---
 drivers/pci/msi.c |   26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1187,19 +1187,24 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
 
 /**
  * pci_irq_vector - return Linux IRQ number of a device vector
- * @dev: PCI device to operate on
- * @nr: device-relative interrupt vector index (0-based).
+ * @dev:	PCI device to operate on
+ * @nr:		Interrupt vector index (0-based)
+ *
+ * @nr has the following meanings depending on the interrupt mode:
+ *   MSI-X:	The index in the MSI-X vector table
+ *   MSI:	The index of the enabled MSI vectors
+ *   INTx:	Must be 0
+ *
+ * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
  */
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 {
 	if (dev->msix_enabled) {
 		struct msi_desc *entry;
-		int i = 0;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (i == nr)
+			if (entry->msi_attrib.entry_nr == nr)
 				return entry->irq;
-			i++;
 		}
 		WARN_ON_ONCE(1);
 		return -EINVAL;
@@ -1223,17 +1228,22 @@ EXPORT_SYMBOL(pci_irq_vector);
  * pci_irq_get_affinity - return the affinity of a particular MSI vector
  * @dev:	PCI device to operate on
  * @nr:		device-relative interrupt vector index (0-based).
+ *
+ * @nr has the following meanings depending on the interrupt mode:
+ *   MSI-X:	The index in the MSI-X vector table
+ *   MSI:	The index of the enabled MSI vectors
+ *   INTx:	Must be 0
+ *
+ * Return: A cpumask pointer or NULL if @nr is out of range
  */
 const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 {
 	if (dev->msix_enabled) {
 		struct msi_desc *entry;
-		int i = 0;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (i == nr)
+			if (entry->msi_attrib.entry_nr == nr)
 				return &entry->affinity->mask;
-			i++;
 		}
 		WARN_ON_ONCE(1);
 		return NULL;


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
