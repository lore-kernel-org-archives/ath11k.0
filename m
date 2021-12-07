Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668CC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 21:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uvIt8qdy53tHqScYFREJN9f1nk0LTquwFCCDRqFspno=; b=NBtWRTrU06H7fK
	IQwglg3FBDXNt02kmIXqMyLPxuQYDGhROOjaCLc4p9nKskk3GtSUeQEkPCAkKioKHxD4P7ncj+Jbx
	pU+90kEBlbzoMkwgZ6qISvBUoZvVm2dXqjPYUSb2cvCyprXQNGebRARaQhU43ca/1PWH+ue/V+HEI
	C6Ata/LGQHYqA4DqH0DVd71XbFCAU/4ukAsZYOp5M6Y8Jwl+f17lLtA96GYzIvxKdIdnQKNRCu72m
	YxXCEbSCNlFEDEpQ+q1atyPu+H8wQVofIgVDo+5ijF2jhoBSU3yum8G0CZg/HlD0O4k04Vn2YvS1j
	bFDJhQRweOLtPm1R3Exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhbp-00A6nf-In; Tue, 07 Dec 2021 21:02:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhbm-00A6lY-BA
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 21:02:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0ED39B81E85;
 Tue,  7 Dec 2021 21:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF0FC341C1;
 Tue,  7 Dec 2021 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910959;
 bh=xQoYzuJZBtazlb9l9/rEZFpq4l8ZITO51ml+vNgPc6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=e153nty81BUAPS50lzOeG3i/XMpm26Pk8TGxhpDoheH+aGOAhJjiCObFncc/cOH46
 OXARkgcqJJlGa0F/Bsl/N/Hr8iyx5YBElDJEc4KBNNajc4emj6cdjk7cQoxzm32rM6
 wS8QDvcYSbelmRSilLFSFpzwM4nEMGo1OciLG1fy1ib0RAXNhpEhAgwC7XOVLwtEMg
 hUh+UVjgpZDPJcdCSkYndl3E5r7GBkkzKgk8s3NaLe/CmCRfbyieQFOca/oFRIERXj
 HKyqHP6oyciLgO6YSOX23lsQkoLBX7Z1J+QJANGpc3FC3xvrJLcihkCi836KsOw4gQ
 4SgZq/E6VBAOQ==
Date: Tue, 7 Dec 2021 15:02:38 -0600
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
Subject: Re: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation
 fail to the legacy code
Message-ID: <20211207210238.GA77554@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210225.101336873@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_130242_697528_055B1996 
X-CRM114-Status: GOOD (  20.70  )
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

On Mon, Dec 06, 2021 at 11:28:00PM +0100, Thomas Gleixner wrote:
> The irqdomain code already returns the information. Move the loop to the
> legacy code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/legacy.c |   20 +++++++++++++++++++-
>  drivers/pci/msi/msi.c    |   19 +------------------
>  2 files changed, 20 insertions(+), 19 deletions(-)
> 
> --- a/drivers/pci/msi/legacy.c
> +++ b/drivers/pci/msi/legacy.c
> @@ -50,9 +50,27 @@ void __weak arch_teardown_msi_irqs(struc
>  	}
>  }
>  
> +static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
> +{
> +	struct msi_desc *entry;
> +	int avail = 0;
> +
> +	if (type != PCI_CAP_ID_MSIX || ret >= 0)
> +		return ret;
> +
> +	/* Scan the MSI descriptors for successfully allocated ones. */
> +	for_each_pci_msi_entry(entry, dev) {
> +		if (entry->irq != 0)
> +			avail++;
> +	}
> +	return avail ? avail : ret;
> +}
> +
>  int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  {
> -	return arch_setup_msi_irqs(dev, nvec, type);
> +	int ret = arch_setup_msi_irqs(dev, nvec, type);
> +
> +	return pci_msi_setup_check_result(dev, type, ret);
>  }
>  
>  void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -609,7 +609,7 @@ static int msix_capability_init(struct p
>  
>  	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
>  	if (ret)
> -		goto out_avail;
> +		goto out_free;
>  
>  	/* Check if all MSI entries honor device restrictions */
>  	ret = msi_verify_entries(dev);
> @@ -634,23 +634,6 @@ static int msix_capability_init(struct p
>  	pcibios_free_irq(dev);
>  	return 0;
>  
> -out_avail:
> -	if (ret < 0) {
> -		/*
> -		 * If we had some success, report the number of IRQs
> -		 * we succeeded in setting up.
> -		 */
> -		struct msi_desc *entry;
> -		int avail = 0;
> -
> -		for_each_pci_msi_entry(entry, dev) {
> -			if (entry->irq != 0)
> -				avail++;
> -		}
> -		if (avail != 0)
> -			ret = avail;
> -	}
> -
>  out_free:
>  	free_msi_irqs(dev);
>  
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
