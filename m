Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32034C43217
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 21:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HRLWgtCDzsc2tGNDDOgkWZy80oGVnUt3wxnC7wINfv8=; b=sf++Id9yVf0Ndc
	cVMArF3B6uY/8YUflJpH2CZAYdjo/Fdb2ggwzKtHALb2g1C8M3fvWe2N9wRYAjmsbXvsH4J5qlkyP
	1dZCQ2hZFzuZlW15yHzdTjumOUu/mi1AjprgqXJE97oUBdeLmEG+HyC8lEHCloN4Sum8I2bGTG7Ab
	y4usoCQ3VhhEDnHl1F+GwUeh2KPsGow0XcpppScQdB2u/S/KJid8ejgr+O0dUXVJTrndeAr9udz8/
	01Zup9n+/C06jU1+gU3UcxfBzpRVi8cQEoSG/WHfRdLnrr4BbN5Yvj42tec5fePKG0XY67WlSnx/p
	Yt/tvyr4KAAETe7RKyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhb9-00A6Sd-Nf; Tue, 07 Dec 2021 21:02:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhb6-00A6QT-2i
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 21:02:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9098B81E8E;
 Tue,  7 Dec 2021 21:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EABC341C6;
 Tue,  7 Dec 2021 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910917;
 bh=Xx5Xlrv9sa2u5A/Kpn/Dg/C1KiusFx7+1t0Q3ZaD6H0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n8AstkO1bzz/peccJoNv+OV8w4azVbrZfSQZ+C6VrByvWmPCcuA2UoeLK7KF47R8L
 vZst3jSGZu4YUxnifcSqUb1O35ur9epBYuG/DP/WQ/icPCZjzW/3TXclIKDXlqCJoX
 tc18Sbi36Aj0D6NsekqSM+82EIrp06HXxtNuS66W7DP7eTGFxuQRp9F7qgu1/oS6Nh
 EiQZ2fSjwcXjKQPTB0uzie9HLe4wME36g/iRUJWHldf2e/7IFERXGSfGEslP0xR4VZ
 V4I9BEz7rWwPqwC+sNYmCoDe+CD/nvsXq9LjxicUETpYVVdLu043m0E8HlLj60v+3X
 HUdygMtqlpOxw==
Date: Tue, 7 Dec 2021 15:01:56 -0600
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
Subject: Re: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
Message-ID: <20211207210156.GA77414@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.980989243@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_130200_284091_3D61E74A 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Dec 06, 2021 at 11:27:57PM +0100, Thomas Gleixner wrote:
> No users outside of that file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |    5 +++--
>  include/linux/msi.h         |    2 --
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -79,8 +79,9 @@ static inline bool pci_msi_desc_is_multi
>   *  1 if Multi MSI is requested, but the domain does not support it
>   *  -ENOTSUPP otherwise
>   */
> -int pci_msi_domain_check_cap(struct irq_domain *domain,
> -			     struct msi_domain_info *info, struct device *dev)
> +static int pci_msi_domain_check_cap(struct irq_domain *domain,
> +				    struct msi_domain_info *info,
> +				    struct device *dev)
>  {
>  	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -439,8 +439,6 @@ void *platform_msi_get_host_data(struct
>  struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent);
> -int pci_msi_domain_check_cap(struct irq_domain *domain,
> -			     struct msi_domain_info *info, struct device *dev);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
>  bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
