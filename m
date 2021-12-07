Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E9C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 21:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oP6klZueFP7Wiy+6qEmL8NVtjzb+jRjqAOse0GT8iNU=; b=Ye2mppLjTpL4jr
	FGTf8S3R10TKuloLUsvufMAaHMT8I5jCXOXGMdfbtPt3GuXAYnjP2MYiqWnwik6mfRy3XBi6p5D8E
	WIPzGNVl5ae3M0TKPgQSygzNL8mqB877DLnnsOqwcK5ZI0AUJPEUuZKWqoHUfWLZvN/oyyKNMkuwR
	+nwtGLPqC/O8ignKUXIEA4PVVZ+aMIhqYnfwv990AIjSnmgljRqXBXDZnPQjX2Ea+fldwIAEmuYJh
	GloSdMXTeiRkgcbRavMbFZ2HJ7pIvyUj1GZVkjsNLumnK//5LTmPjYIAKepmOD560InLI87tsAq1B
	6HVujhJZflrNbzGQlQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhae-00A6Eb-9j; Tue, 07 Dec 2021 21:01:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhaa-00A6C0-Ui
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 21:01:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98CDFB81E87;
 Tue,  7 Dec 2021 21:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBF1C341C6;
 Tue,  7 Dec 2021 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910887;
 bh=KswCIrDmmz+hcDnAj7scewOtghNKAUSvlR/YL46B2y4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uu5zBvm54PthoHMlAqMnKRp9In+QOttow33Sbz7fEJ6O739+SKVMNcj0eNux2Q1Fm
 ClUIhicQb0fbu7dNnC5RUJc8cgV1kAUjfZKalR6pgWyzBP5HyLTWLSqil36RtKbcDM
 nqVi0ewcV8haHkpihS2wEZ6W406lbkA9hAmoJYBBNhdiTOCAQEDa24Jm2l0Hw6e3ko
 tU0U/GoEd9YCrvWvapKu9DPDHWTw8UAwhom8fGjgSe6puuiXErpmMgBAhsH2nykktX
 lzB/yMVW0IXZVQGumZ7IMNW/rs3/0hjKex87BhLox/oRgleVnT9TL1qDc5II4Yygcs
 8zJbA1ld5WgZg==
Date: Tue, 7 Dec 2021 15:01:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
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
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
Message-ID: <20211207210125.GA77339@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.925241961@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_130129_316422_924F79E2 
X-CRM114-Status: GOOD (  18.48  )
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

On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
> It's only required for PCI/MSI. So no point in having it in every struct
> device.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: New patch
> ---
>  drivers/base/core.c    |    1 -
>  drivers/pci/msi/msi.c  |    2 +-
>  drivers/pci/probe.c    |    4 +++-
>  include/linux/device.h |    2 --
>  include/linux/pci.h    |    1 +
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
>  	device_pm_init(dev);
>  	set_dev_node(dev, NUMA_NO_NODE);
>  #ifdef CONFIG_GENERIC_MSI_IRQ
> -	raw_spin_lock_init(&dev->msi_lock);
>  	INIT_LIST_HEAD(&dev->msi_list);
>  #endif
>  	INIT_LIST_HEAD(&dev->links.consumers);
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
>  
>  static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
>  {
> -	raw_spinlock_t *lock = &desc->dev->msi_lock;
> +	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
>  	unsigned long flags;
>  
>  	if (!desc->pci.msi_attrib.can_mask)
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2311,7 +2311,9 @@ struct pci_dev *pci_alloc_dev(struct pci
>  	INIT_LIST_HEAD(&dev->bus_list);
>  	dev->dev.type = &pci_dev_type;
>  	dev->bus = pci_bus_get(bus);
> -
> +#ifdef CONFIG_PCI_MSI
> +	raw_spin_lock_init(&dev->msi_lock);
> +#endif
>  	return dev;
>  }
>  EXPORT_SYMBOL(pci_alloc_dev);
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -407,7 +407,6 @@ struct dev_links_info {
>   * @em_pd:	device's energy model performance domain
>   * @pins:	For device pin management.
>   *		See Documentation/driver-api/pin-control.rst for details.
> - * @msi_lock:	Lock to protect MSI mask cache and mask register
>   * @msi_list:	Hosts MSI descriptors
>   * @msi_domain: The generic MSI domain this device is using.
>   * @numa_node:	NUMA node this device is close to.
> @@ -508,7 +507,6 @@ struct device {
>  	struct dev_pin_info	*pins;
>  #endif
>  #ifdef CONFIG_GENERIC_MSI_IRQ
> -	raw_spinlock_t		msi_lock;
>  	struct list_head	msi_list;
>  #endif
>  #ifdef CONFIG_DMA_OPS
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -474,6 +474,7 @@ struct pci_dev {
>  #endif
>  #ifdef CONFIG_PCI_MSI
>  	void __iomem	*msix_base;
> +	raw_spinlock_t	msi_lock;
>  	const struct attribute_group **msi_irq_groups;
>  #endif
>  	struct pci_vpd	vpd;
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
