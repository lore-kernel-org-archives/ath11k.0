Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ACEC43219
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=D2uj2nPnkz88jc/ksvwXla63dkXza4F3hN5dn5f5k0c=; b=LiMUlvUggOaYN+
	CMWs4yRlv3YMOZbSbFe30ueYC44iG7qqK1CdGf32y7z2J0lMY0CmNsixyq2qkVR2Eqo1F5ntb+VNk
	pMC08jT8h+AE7XBAjWR+Mxk/7kfx/qtYhUq5eA1GEWLS7aJZ/8R4Fe0PWBAFQJtsNaQZ7Tu3rHus3
	xtlKLjmyKTJsb3SrK2W75UEyR57/PthDJ2dUycq9JLMKeWRMOkFSO8DZqZINMOTVkg9789LzBZJ/e
	vvBSMdQpRXiech4YeVRfgpgEiK/nXvA4+XzUfYPq/rTtrC64NcqdBahJrmR66Rw2U3+fu418mBxFT
	2a9xV02znzE1lJMYVAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhXX-00A5AF-Ma; Tue, 07 Dec 2021 20:58:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhXV-00A58u-I1
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:58:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FF13B81E92;
 Tue,  7 Dec 2021 20:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4B6C341C3;
 Tue,  7 Dec 2021 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910692;
 bh=mKk8CFP6CJrrE5nazjOj8lJlCLeQEHsGLEd20u/74iY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=m6v2l2upjdgPf9w2JTHnTqJo1IQhsUtXrf8F9Vikgt6+Z8JqCK5xTJ6F2LKLBJXQk
 f1feWsiex81V9M40VjQRY77dpHbpD+YmBN2/r2JsoxH2g2LiC+DUIcON3qHLEuh8Gz
 NS6nDZmsa9Hrr+xtsG+VdRDrQGZcy670xHqNHikhH4k3q1XX1eLrZK8iiGqA/IMnEQ
 FGWo8oJA6eAk1Fsb1P04L/6yLfhUvAWrjKF8GwSnqFoyeEQDmyRKL99yFYxSQnHXA8
 H6M+S6xb4uWxb4Amw+dIX3H7cHFGQYQknXpKDLlndF8FSRGQgNUUZsQJZtz3LOqh0f
 LsDHp544cDXEg==
Date: Tue, 7 Dec 2021 14:58:10 -0600
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
Subject: Re: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent
 part
Message-ID: <20211207205810.GA76983@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.710137730@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125817_893474_0AA2BD67 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, Dec 06, 2021 at 11:27:49PM +0100, Thomas Gleixner wrote:
> These functions are required even when CONFIG_PCI_MSI is not set. Move them
> to their own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/Makefile     |    3 ++-
>  drivers/pci/msi/msi.c        |   39 ---------------------------------------
>  drivers/pci/msi/pcidev_msi.c |   43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 40 deletions(-)
> 
> --- a/drivers/pci/msi/Makefile
> +++ b/drivers/pci/msi/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Makefile for the PCI/MSI
> -obj-$(CONFIG_PCI)		+= msi.o
> +obj-$(CONFIG_PCI)		+= pcidev_msi.o
> +obj-$(CONFIG_PCI_MSI)		+= msi.o
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,8 +18,6 @@
>  
>  #include "../pci.h"
>  
> -#ifdef CONFIG_PCI_MSI
> -
>  static int pci_msi_enable = 1;
>  int pci_msi_ignore_mask;
>  
> @@ -1493,40 +1491,3 @@ bool pci_dev_has_special_msi_domain(stru
>  }
>  
>  #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> -#endif /* CONFIG_PCI_MSI */
> -
> -void pci_msi_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	/*
> -	 * Disable the MSI hardware to avoid screaming interrupts
> -	 * during boot.  This is the power on reset default so
> -	 * usually this should be a noop.
> -	 */
> -	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> -	if (!dev->msi_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSI_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> -				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> -
> -	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -		dev->no_64bit_msi = 1;
> -}
> -
> -void pci_msix_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> -	if (!dev->msix_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> -				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> -}
> --- /dev/null
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MSI[X} related functions which are available unconditionally.
> + */
> +#include "../pci.h"
> +
> +/*
> + * Disable the MSI[X] hardware to avoid screaming interrupts during boot.
> + * This is the power on reset default so usually this should be a noop.
> + */
> +
> +void pci_msi_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> +	if (!dev->msi_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSI_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> +				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> +	}
> +
> +	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> +		dev->no_64bit_msi = 1;
> +}
> +
> +void pci_msix_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> +	if (!dev->msix_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSIX_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> +				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> +	}
> +}
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
