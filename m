Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E169AC433F5
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=qKqJN7bvQ07wRhFIC9kp4JESkZFQar0GvJBdbNHPWSE=; b=Zi2fbgCKtxNrBl
	MWyZHmUz6o+G2rGgisJ7dTPqTrjyEpLB0Igaza4hsD8wC42i/ryfBQBMkDIa5Ed2R57ytJVbY7Myk
	oiekymRSWYIDX0F/B4B7m0Ir+j1hZb9oy1c4Zi8A6zUwMfnA5Xw6Uypu58efbUvu+HdfjPezq1Jg8
	25VxLJ4VwQKdf/MdOum8QOvNcn6ZaowKB1BUn7fjcUoqPnz4qTrmp16VL9ckTm3nA64slBzWbMCnj
	E2lTlKba8pPM7e6a5rg95UbLdyDvDVQD3abutQMatmIfJM7R8EY17F5ojXhjIN832VmkrVz9Nab/f
	DtOveS0nBEwWbvQdGGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmNs-00C8vy-Ps; Sat, 27 Nov 2021 01:20:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmNM-00C8Q8-Tz
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:19:38 +0000
Message-ID: <20211126223824.618089023@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AC2FZ3NgPgtEmYfcPESal194oN272JgZRDrbkWg3jyI=;
 b=iPwixWdRLWm1emsKEolgsWnQ0MRelouU1c88xG/I4ZFXDWljmp8kd1pElhIMoCTAY/knGl
 ZJtwjOffKtjwnGwopBmALMXasTB582ruio3hflog8eMAPMlpz5ZrWgtsMSlF2fVlzRskk3
 Ow52Mpf1/VGl2mLQbC5BWUuNu3wKt55NRjlcd1BPstQStz85sgEtHSPUN8yojcETmMtDoS
 8JGF4qamdlaBFFYjEEfjKplZ6yUUcS+qAL17xkhhuJfA0Eug3Zfu6A4MsNBJRixaWD1Z/w
 Xxs8Tyqfuzq2yRB+IMP2MmxdWpzteiKKSI1l4vnbhqrvdMJPDuyM0EeeSSDzvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AC2FZ3NgPgtEmYfcPESal194oN272JgZRDrbkWg3jyI=;
 b=r6i0/tsdGKrOX4ZC7HKf9txZqb0KckmR2L+A1e3opYaHWUzv/KuTUllN5WpGhv+I8mDrjv
 lXYIvy68X1myBECw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 09/22] MIPS: Octeon: Use arch_setup_msi_irq()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:19:34 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171937_146210_01B2797A 
X-CRM114-Status: GOOD (  11.75  )
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
Message-ID: <20211127011934._FqnGTXoGV_ZQGGhvdpYNmt9WRpSxWcIIwtmgYFOCXI@z>

The core code provides the same loop code except for the MSI-X reject. Move
that to arch_setup_msi_irq() and remove the duplicated code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

--- a/arch/mips/pci/msi-octeon.c
+++ b/arch/mips/pci/msi-octeon.c
@@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
 	u64 search_mask;
 	int index;
 
+	if (desc->pci.msi_attrib.is_msix)
+		return -EINVAL;
+
 	/*
 	 * Read the MSI config to figure out how many IRQs this device
 	 * wants.  Most devices only want 1, which will give
@@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
 	return 0;
 }
 
-int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * MSI-X is not supported.
-	 */
-	if (type == PCI_CAP_ID_MSIX)
-		return -EINVAL;
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
 /**
  * Called when a device no longer needs its MSI interrupts. All
  * MSI interrupts for the device are freed.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
