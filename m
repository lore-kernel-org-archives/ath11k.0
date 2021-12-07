Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E08C433FE
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Mw+ZOENvtOHhAK+Jq8LtQKydyg6Gr/2088JrNwOqLL4=; b=FtlmsmhMGo79EE
	5gPTcGbOQTSbn/UiZ6NwFByDvDXf1cJqEQiroibKJ/8Cl5Q8v0WrhX2uxPG2k4hXeZ/CnIGJSl+OL
	RAYZlfTFW1EV+yvXKY1RoDNDoGPi5BBHVsGGz6V+EXlBAmWdUwb2cnGJXOV2hQlvPNrWqzBAvC8GE
	qCz/CoH17F/aYIJ6ggTjoKQexWZ74VMCA7Jy1DwVV6dbNX1FgAoLXMyLfhZCuCRtJPI22qeXFV/eT
	TPDS+2ignAiBUQ07TXhuZDjR955ZcJqCYA6hgLmytBzW2XF+t4Fqr97LUTsGVFeLA5n1/kDQkwDU6
	X2rq09oMHSj6geY7eF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhbY-00A6g1-6Z; Tue, 07 Dec 2021 21:02:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhbV-00A6e0-FW
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 21:02:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CC27DCE1E21;
 Tue,  7 Dec 2021 21:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4C5C341C3;
 Tue,  7 Dec 2021 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910942;
 bh=izWXm95l+uZGERB30ZN7LtrcycoRGE73PbT8Z0h/qQw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=XufeyuxA4HkM8C1emNf201uZTgp+dVqYnNX9ceYmkxirOcGK1GaoHMbJIhyz3E3+D
 cblky2T1a1/xUWCxvj7lXEc5xpM/dggclpp5CX7k6YatZZnXrjghPJwp9SiEWV/q8O
 VHUPzss9MvVyzoAJaMBsVgQVwIQWM4SF/FV26sZrL5XAcC2xU1v6GOa1BhFJPeHS5T
 wvm6bhOMRM9UNs8NKfy77ac0jMKUcnEUjJMGKEcxsgJrKNuqoW7tZRxDuYb0xt7/s7
 4sSISKBZ3qSg8+5KsVWmnqztHkST9BbG9ZkniYgH9dpNrFmiv0QYea1HSrPMTJm/hB
 pRBsYEeNdamow==
Date: Tue, 7 Dec 2021 15:02:19 -0600
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
Subject: Re: [patch V2 22/23] genirq/msi: Handle PCI/MSI allocation fail in
 core code
Message-ID: <20211207210219.GA77501@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210225.046615302@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_130225_895626_69274BDE 
X-CRM114-Status: GOOD (  28.17  )
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

On Mon, Dec 06, 2021 at 11:27:59PM +0100, Thomas Gleixner wrote:
> Get rid of yet another irqdomain callback and let the core code return the
> already available information of how many descriptors could be allocated.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# PCI

> ---
>  drivers/pci/msi/irqdomain.c |   13 -------------
>  include/linux/msi.h         |    5 +----
>  kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
>  3 files changed, 26 insertions(+), 21 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
>  	return 0;
>  }
>  
> -static int pci_msi_domain_handle_error(struct irq_domain *domain,
> -				       struct msi_desc *desc, int error)
> -{
> -	/* Special handling to support __pci_enable_msi_range() */
> -	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
> -		return 1;
> -
> -	return error;
> -}
> -
>  static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc)
>  {
> @@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
>  static struct msi_domain_ops pci_msi_domain_ops_default = {
>  	.set_desc	= pci_msi_domain_set_desc,
>  	.msi_check	= pci_msi_domain_check_cap,
> -	.handle_error	= pci_msi_domain_handle_error,
>  };
>  
>  static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
> @@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
>  			ops->set_desc = pci_msi_domain_set_desc;
>  		if (ops->msi_check == NULL)
>  			ops->msi_check = pci_msi_domain_check_cap;
> -		if (ops->handle_error == NULL)
> -			ops->handle_error = pci_msi_domain_handle_error;
>  	}
>  }
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -286,7 +286,6 @@ struct msi_domain_info;
>   * @msi_check:		Callback for verification of the domain/info/dev data
>   * @msi_prepare:	Prepare the allocation of the interrupts in the domain
>   * @set_desc:		Set the msi descriptor for an interrupt
> - * @handle_error:	Optional error handler if the allocation fails
>   * @domain_alloc_irqs:	Optional function to override the default allocation
>   *			function.
>   * @domain_free_irqs:	Optional function to override the default free
> @@ -295,7 +294,7 @@ struct msi_domain_info;
>   * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
>   * irqdomain.
>   *
> - * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
> + * @msi_check, @msi_prepare and @set_desc are callbacks used by
>   * msi_domain_alloc/free_irqs().
>   *
>   * @domain_alloc_irqs, @domain_free_irqs can be used to override the
> @@ -332,8 +331,6 @@ struct msi_domain_ops {
>  				       msi_alloc_info_t *arg);
>  	void		(*set_desc)(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc);
> -	int		(*handle_error)(struct irq_domain *domain,
> -					struct msi_desc *desc, int error);
>  	int		(*domain_alloc_irqs)(struct irq_domain *domain,
>  					     struct device *dev, int nvec);
>  	void		(*domain_free_irqs)(struct irq_domain *domain,
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
>  	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
>  }
>  
> +static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
> +			       int allocated)
> +{
> +	switch(domain->bus_token) {
> +	case DOMAIN_BUS_PCI_MSI:
> +	case DOMAIN_BUS_VMD_MSI:
> +		if (IS_ENABLED(CONFIG_PCI_MSI))
> +			break;
> +		fallthrough;
> +	default:
> +		return -ENOSPC;
> +	}
> +
> +	/* Let a failed PCI multi MSI allocation retry */
> +	if (desc->nvec_used > 1)
> +		return 1;
> +
> +	/* If there was a successful allocation let the caller know */
> +	return allocated ? allocated : -ENOSPC;
> +}
> +
>  int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>  			    int nvec)
>  {
> @@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
>  	struct irq_data *irq_data;
>  	struct msi_desc *desc;
>  	msi_alloc_info_t arg = { };
> +	int allocated = 0;
>  	int i, ret, virq;
>  	bool can_reserve;
>  
> @@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
>  					       dev_to_node(dev), &arg, false,
>  					       desc->affinity);
>  		if (virq < 0) {
> -			ret = -ENOSPC;
> -			if (ops->handle_error)
> -				ret = ops->handle_error(domain, desc, ret);
> -			return ret;
> +			ret = msi_handle_pci_fail(domain, desc, allocated);
> +			goto cleanup;
>  		}
>  
>  		for (i = 0; i < desc->nvec_used; i++) {
>  			irq_set_msi_desc_off(virq, i, desc);
>  			irq_debugfs_copy_devname(virq + i, dev);
>  		}
> +		allocated++;
>  	}
>  
>  	can_reserve = msi_check_reservation_mode(domain, info, dev);
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
