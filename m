Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426AC433FE
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=7bC2uuHwyl39EgHXMqmY4W/3vecCcQJSFjn/tHrRaNg=; b=1zj+fM3gMYinwP
	016ty75EYzDo/CFfDTs4PqcksYrxwz4RcKOy9y95r43k/ic/AqM96qVnhMyITNB1Aj6xNFxBveKW7
	FUez93tHvcJQEC++Hejcy+WXn6IaCI7a/QE44UEq62JJz2K2a1m6VIXGhcfy/DVOpCJ7cZEqaZN7m
	/ZM36vSpgy+mX2wuKX8ZesxT/aZJQ1y11RZJ2YSZp8y/kjnwdh/nRNcrtvwDsfXacuqeOL+D1hO18
	jylV9v4guW9CvVLei7yqasB7aCeGl6rXS6g4cTznFz9hCYu30vefrSadtgivZEBvdw/L++UxJtw8r
	2Eg8EnwSqI+BOgg1C3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmN8-00C85d-5c; Sat, 27 Nov 2021 01:19:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMx-00C7qP-6U
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:19:15 +0000
Message-ID: <20211126223825.320724006@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
 b=rL3dSVq51HwJyrZ1GiK+2Uy987fWifzc93Kzd1rYDYc6CJES4RYQFW91VYz9giUBA4pc8g
 3Gp8SO0SCSSci4EB0aGRBsqUldeO9DZdmixm6jmAcLXOjd3EDQN4ceHT5qIHtZ1M4OOjCs
 5B1fwbTAHUDHkQfAY6r0w3SoQx1i3rzd1zp4I1umGTSQGLkl+Ug/rBlXyPGu1g3qmxiQdo
 9/IiaSvnNmIreFZA0hbCMbgvbZt32iGcp6GO/Dw3rrPbcAK+xJsiiVNJEaCAM2vKSnhji3
 6KWA27/ZxBzJeVpPdNFWb/PzJXwnrdawx9cM4YXt/mQphMHqQUhIcUngebAkPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
 b=QLwf6Eyk3o45pGBEtsCZ2xr7a4DlyXTC6NnM3m6uL6iU2aPZXLRZf3PE6XQ/TuIY8Xwpt7
 hQcta2kLnH2eixAg==
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
Subject: [patch 21/22] genirq/msi: Handle PCI/MSI allocation fail in core code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:19:07 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171911_646204_9473A43F 
X-CRM114-Status: GOOD (  17.97  )
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

Get rid of yet another irqdomain callback and let the core code return the
already available information of how many descriptors could be allocated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   13 -------------
 include/linux/msi.h         |    5 +----
 kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
 3 files changed, 26 insertions(+), 21 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
 	return 0;
 }
 
-static int pci_msi_domain_handle_error(struct irq_domain *domain,
-				       struct msi_desc *desc, int error)
-{
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
-		return 1;
-
-	return error;
-}
-
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
 	.msi_check	= pci_msi_domain_check_cap,
-	.handle_error	= pci_msi_domain_handle_error,
 };
 
 static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
@@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
 			ops->set_desc = pci_msi_domain_set_desc;
 		if (ops->msi_check == NULL)
 			ops->msi_check = pci_msi_domain_check_cap;
-		if (ops->handle_error == NULL)
-			ops->handle_error = pci_msi_domain_handle_error;
 	}
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -285,7 +285,6 @@ struct msi_domain_info;
  * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
- * @handle_error:	Optional error handler if the allocation fails
  * @domain_alloc_irqs:	Optional function to override the default allocation
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
@@ -294,7 +293,7 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
+ * @msi_check, @msi_prepare and @set_desc are callbacks used by
  * msi_domain_alloc/free_irqs().
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
@@ -331,8 +330,6 @@ struct msi_domain_ops {
 				       msi_alloc_info_t *arg);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
-	int		(*handle_error)(struct irq_domain *domain,
-					struct msi_desc *desc, int error);
 	int		(*domain_alloc_irqs)(struct irq_domain *domain,
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
 	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
 }
 
+static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
+			       int allocated)
+{
+	switch(domain->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
+	case DOMAIN_BUS_VMD_MSI:
+		if (IS_ENABLED(CONFIG_PCI_MSI))
+			break;
+		fallthrough;
+	default:
+		return -ENOSPC;
+	}
+
+	/* Let a failed PCI multi MSI allocation retry */
+	if (desc->nvec_used > 1)
+		return 1;
+
+	/* If there was a successful allocation let the caller know */
+	return allocated ? allocated : -ENOSPC;
+}
+
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec)
 {
@@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
 	struct irq_data *irq_data;
 	struct msi_desc *desc;
 	msi_alloc_info_t arg = { };
+	int allocated = 0;
 	int i, ret, virq;
 	bool can_reserve;
 
@@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
 					       dev_to_node(dev), &arg, false,
 					       desc->affinity);
 		if (virq < 0) {
-			ret = -ENOSPC;
-			if (ops->handle_error)
-				ret = ops->handle_error(domain, desc, ret);
-			return ret;
+			ret = msi_handle_pci_fail(domain, desc, allocated);
+			goto cleanup;
 		}
 
 		for (i = 0; i < desc->nvec_used; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
 		}
+		allocated++;
 	}
 
 	can_reserve = msi_check_reservation_mode(domain, info, dev);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
