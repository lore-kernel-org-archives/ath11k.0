Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE05C433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQN/uFosKhSlk41o35ej20H8SnSY5aTV+GwHmfN7R3I=; b=F6bgPYgNuFjxH3
	mefTUBgsUuPkm1Z60Aea+2kj92JYgFrTln6byzt5Idw5pW4iJsINnyjvEbTmHgy2T8Mg2nQwSMpPK
	nAOj6zaYNEqCR8y1BTgt+bh3wCEw8XI4ki/3L/GuAw7LmU83s3IeTHk4zTgNu6Z/SUwuysGIDkhFE
	prFssPoTcJ6q5TcTtMdwv7yBuZpKG3bes1ZZ35NwsbMRsIVARWxk52HmbTcIK3cbGJ8jEZwyewXiS
	eBZ4JKAJYBkdsXMquoynXbUhl3LDIcDYhu42Dk6CTNl3UvB/K5IcHJqoy5aJy39/jnNDB2Bd3t7Dw
	i+EC+wwRfsNltZ5RiBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdnT-000OBZ-4X; Mon, 29 Nov 2021 10:22:07 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdnP-000O6f-9R
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 10:22:05 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mrdmz-0004dt-00; Mon, 29 Nov 2021 11:21:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 5E79DC2F89; Mon, 29 Nov 2021 11:21:16 +0100 (CET)
Date: Mon, 29 Nov 2021 11:21:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 09/22] MIPS: Octeon: Use arch_setup_msi_irq()
Message-ID: <20211129102116.GA6158@alpha.franken.de>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.618089023@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126223824.618089023@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_022203_665547_188F43A9 
X-CRM114-Status: GOOD (  20.79  )
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

On Sat, Nov 27, 2021 at 02:18:48AM +0100, Thomas Gleixner wrote:
> The core code provides the same loop code except for the MSI-X reject. Move
> that to arch_setup_msi_irq() and remove the duplicated code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
>  1 file changed, 3 insertions(+), 29 deletions(-)
> 
> --- a/arch/mips/pci/msi-octeon.c
> +++ b/arch/mips/pci/msi-octeon.c
> @@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	u64 search_mask;
>  	int index;
>  
> +	if (desc->pci.msi_attrib.is_msix)
> +		return -EINVAL;
> +
>  	/*
>  	 * Read the MSI config to figure out how many IRQs this device
>  	 * wants.  Most devices only want 1, which will give
> @@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	return 0;
>  }
>  
> -int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> -{
> -	struct msi_desc *entry;
> -	int ret;
> -
> -	/*
> -	 * MSI-X is not supported.
> -	 */
> -	if (type == PCI_CAP_ID_MSIX)
> -		return -EINVAL;
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
>  /**
>   * Called when a device no longer needs its MSI interrupts. All
>   * MSI interrupts for the device are freed.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
