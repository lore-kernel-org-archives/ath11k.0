Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110D6C433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WCr1XI9FzJAbDaDF0TyeZLCr7R2aylCA6yILmIgC6Lw=; b=eQGgFAP1RvVq4M
	YUDdfEGAYoZ0WWpeogTkm5gUylFU2vlhDjgU0yyizuE7rnW2s+/eLFZt4A/rn7Zpc4LjSbk0Nq7y3
	lFnhSquDeZByx4Yzf02Jo33fYbi6aYK5XpaC6vjFa3J8KWlG0tLHS/+zC4lleTc3POl3WTjUca0IJ
	xJ8C+6rk/RtqrhA5LzONVM2YNCr7fOuU8aWCBxGtCQdeFzkFY3oOxUhDnPipaGtQMYn9G/GFbGgAy
	woG8N6g2rZYFBp7J5XM1hplrlJ5heq8zn1ut//4bqGQYdObKubIsAacSAaie6ZK/sF/kfEeG6iGpU
	MzQiRfPm9DGO6Tf7Z3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhZ1-00A5bk-HS; Tue, 07 Dec 2021 20:59:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhYx-00A5Zw-W6
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:59:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D16F7CE1E88;
 Tue,  7 Dec 2021 20:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B586C341C3;
 Tue,  7 Dec 2021 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910783;
 bh=6xre4ERQ0zpMI+yMYHqya0Bv8a/uSKKR8JsDZHNhU4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aeRzt8BFGmz8vimH6MrP0wP9SdPtvkbfZq/UmC8CKYYNjJasWIz5f+IDpiLt6A0aT
 oWaWypdpOk3kLHyjzDsQeYqrHTpd3iZOnTYeKEAmkMHjU7UnfvkxaMuJDeC/Wc2Hzi
 d/FFX9EV+Kcu4/bql3Cu7G+iZUNrbr932+dfUmbNQpfi4jfYq2+R49cO4nrodAA1Iw
 jVDW4T13NZ4YjdWrzzbDYPYSCQhY6XlsHmoikp3g+pCtfXWnC49HkD/43doiyns1eo
 u+nnrBTWk3+O0gdwhnpWHdlUi5r4O8Da5zgFdzOYEWM9P+fQEy+euPyaO0pLLMA4LT
 ZCokWDHvR/fEg==
Date: Tue, 7 Dec 2021 14:59:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
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
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 17/23] PCI/MSI: Split out !IRQDOMAIN code
Message-ID: <20211207205942.GA77110@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.763574089@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125948_398271_AAF1886B 
X-CRM114-Status: GOOD (  23.23  )
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

On Mon, Dec 06, 2021 at 11:27:51PM +0100, Thomas Gleixner wrote:
> Split out the non irqdomain code into its own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: Add proper includes and fix variable name - Cedric
> ---
>  drivers/pci/msi/Makefile |    5 ++--
>  drivers/pci/msi/legacy.c |   52 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/msi/msi.c    |   46 -----------------------------------------
>  3 files changed, 55 insertions(+), 48 deletions(-)
> 
> --- a/drivers/pci/msi/Makefile
> +++ b/drivers/pci/msi/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Makefile for the PCI/MSI
> -obj-$(CONFIG_PCI)		+= pcidev_msi.o
> -obj-$(CONFIG_PCI_MSI)		+= msi.o
> +obj-$(CONFIG_PCI)			+= pcidev_msi.o
> +obj-$(CONFIG_PCI_MSI)			+= msi.o
> +obj-$(CONFIG_PCI_MSI_ARCH_FALLBACKS)	+= legacy.o
> --- /dev/null
> +++ b/drivers/pci/msi/legacy.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCI Message Signaled Interrupt (MSI).
> + *
> + * Legacy architecture specific setup and teardown mechanism.
> + */
> +#include <linux/msi.h>
> +#include <linux/pci.h>
> +
> +/* Arch hooks */
> +int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
> +{
> +	return -EINVAL;
> +}
> +
> +void __weak arch_teardown_msi_irq(unsigned int irq)
> +{
> +}
> +
> +int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> +{
> +	struct msi_desc *desc;
> +	int ret;
> +
> +	/*
> +	 * If an architecture wants to support multiple MSI, it needs to
> +	 * override arch_setup_msi_irqs()
> +	 */
> +	if (type == PCI_CAP_ID_MSI && nvec > 1)
> +		return 1;
> +
> +	for_each_pci_msi_entry(desc, dev) {
> +		ret = arch_setup_msi_irq(dev, desc);
> +		if (ret)
> +			return ret < 0 ? ret : -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
> +{
> +	struct msi_desc *desc;
> +	int i;
> +
> +	for_each_pci_msi_entry(desc, dev) {
> +		if (desc->irq) {
> +			for (i = 0; i < desc->nvec_used; i++)
> +				arch_teardown_msi_irq(desc->irq + i);
> +		}
> +	}
> +}
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -50,52 +50,6 @@ static void pci_msi_teardown_msi_irqs(st
>  #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
>  #endif
>  
> -#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
> -/* Arch hooks */
> -int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
> -{
> -	return -EINVAL;
> -}
> -
> -void __weak arch_teardown_msi_irq(unsigned int irq)
> -{
> -}
> -
> -int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> -{
> -	struct msi_desc *entry;
> -	int ret;
> -
> -	/*
> -	 * If an architecture wants to support multiple MSI, it needs to
> -	 * override arch_setup_msi_irqs()
> -	 */
> -	if (type == PCI_CAP_ID_MSI && nvec > 1)
> -		return 1;
> -
> -	for_each_pci_msi_entry(entry, dev) {
> -		ret = arch_setup_msi_irq(dev, entry);
> -		if (ret < 0)
> -			return ret;
> -		if (ret > 0)
> -			return -ENOSPC;
> -	}
> -
> -	return 0;
> -}
> -
> -void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
> -{
> -	int i;
> -	struct msi_desc *entry;
> -
> -	for_each_pci_msi_entry(entry, dev)
> -		if (entry->irq)
> -			for (i = 0; i < entry->nvec_used; i++)
> -				arch_teardown_msi_irq(entry->irq + i);
> -}
> -#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
> -
>  /*
>   * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
>   * mask all MSI interrupts by clearing the MSI enable bit does not work
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
