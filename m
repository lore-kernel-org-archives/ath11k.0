Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170A1C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hSac0aT672L0vnO3KIrkgjN1LRiaGqAur8Nr5pxsH9M=; b=B/WAWXYqji655T
	yMbvq67IdyzWxEXw/sPj20fr+Rof3fX77UgGUKnBj5/Swiic39SFJUxzvwgqfCpR9G9gfV0Yg8sm5
	g90uyuhpVtDySthmzR6xg+uDbR8i9Kv3m9yv2IX5xI8FpQkf1eF729SfVQaWPiQ1n3Ei9rSBYfd/Y
	eXevfIug9y/epG++L3eDbCxH0G0Vm/WclvcXm4BqBCGZDOlzzvQF12BM4KBxx1pM4x/QA63ib+JQH
	nwer4NSo2D2xGW9NfPgpsr79EjO/QFr1jccblm7WJKqfNi57361JfNzUehCzMlgyX+yEmeUFOJSY1
	NOB+IZ6J3rYKBRntIFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhUM-00A3vz-3l; Tue, 07 Dec 2021 20:55:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhU5-00A3sQ-V1
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:54:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0A5AB81858;
 Tue,  7 Dec 2021 20:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E222C341C3;
 Tue,  7 Dec 2021 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910483;
 bh=2TCFm6oMcOo2j9kU57EKGsnY8fkR6JvmY5FAYrIs66g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nsS3jKJ7qQGHDYJB47kov7AVBhzyG091DRuFfOsLF+34ALijihn9KZtlp+GJ6IKE8
 kwldgAGONyoShIXShWCqK6l38EuYcxpvxsfxzUOfye0qv3FNym4mEgnKFN3S4deZJn
 MK94vwclzEowmaVdB2cGhf7Z0a7/o3/oMmVUhVyJY2de/L6mR980HgZkZTFIElzJ/+
 epdz+yWDLvAPCET9jF0AcFlWO/tiWh+A6jWW8FLHS0WZbyvHO0pmCIW6QBNlbIsCJM
 H+HIHHhPv17Z3oQSzspeU71bWUAG5BFut+e0szyhVsCnMRESKTLgg/mxRT13eAuaiM
 cbQlCTOqnZvyg==
Date: Tue, 7 Dec 2021 14:54:41 -0600
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
Subject: Re: [patch V2 06/23] PCI/MSI: Make pci_msi_domain_write_msg() static
Message-ID: <20211207205441.GA76497@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.157070464@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125446_316890_E8129695 
X-CRM114-Status: GOOD (  18.08  )
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

On Mon, Dec 06, 2021 at 11:27:33PM +0100, Thomas Gleixner wrote:
> There is no point to have this function public as it is set by the PCI core
> anyway when a PCI/MSI irqdomain is created.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# PCI

> ---
>  drivers/irqchip/irq-gic-v2m.c            |    1 -
>  drivers/irqchip/irq-gic-v3-its-pci-msi.c |    1 -
>  drivers/irqchip/irq-gic-v3-mbi.c         |    1 -
>  drivers/pci/msi.c                        |    2 +-
>  include/linux/msi.h                      |    1 -
>  5 files changed, 1 insertion(+), 5 deletions(-)
> 
> --- a/drivers/irqchip/irq-gic-v2m.c
> +++ b/drivers/irqchip/irq-gic-v2m.c
> @@ -88,7 +88,6 @@ static struct irq_chip gicv2m_msi_irq_ch
>  	.irq_mask		= gicv2m_mask_msi_irq,
>  	.irq_unmask		= gicv2m_unmask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static struct msi_domain_info gicv2m_msi_domain_info = {
> --- a/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> +++ b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> @@ -28,7 +28,6 @@ static struct irq_chip its_msi_irq_chip
>  	.irq_unmask		= its_unmask_msi_irq,
>  	.irq_mask		= its_mask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static int its_pci_msi_vec_count(struct pci_dev *pdev, void *data)
> --- a/drivers/irqchip/irq-gic-v3-mbi.c
> +++ b/drivers/irqchip/irq-gic-v3-mbi.c
> @@ -171,7 +171,6 @@ static struct irq_chip mbi_msi_irq_chip
>  	.irq_unmask		= mbi_unmask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
>  	.irq_compose_msi_msg	= mbi_compose_msi_msg,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static struct msi_domain_info mbi_msi_domain_info = {
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1281,7 +1281,7 @@ EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdat
>   * @irq_data:	Pointer to interrupt data of the MSI interrupt
>   * @msg:	Pointer to the message
>   */
> -void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
> +static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
>  {
>  	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -455,7 +455,6 @@ void *platform_msi_get_host_data(struct
>  #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
>  
>  #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> -void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
>  struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent);
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
