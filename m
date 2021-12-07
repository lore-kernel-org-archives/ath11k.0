Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6FCC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hrxsabGjPUYhk5AL+pmpZRj3VsFPKIsZol4JVO/Mwm4=; b=h1Zce8N1i6s5Yl
	Zh+Ua7X9ES+Yae7jx+v3EYQF5GOBAMkIs2XvF1tfx7KHxVPL9gtJ5ayhoPPN/+V83P2pNl2mvC9pR
	E/m9g3GBBTtS3OMK86ffTNES5UiI6+1K/FoLw/ZQw0pNABgOi1IDT2+uAAZ0AR7oG0STgCv9b4oD6
	Ik/mJaKpxa5vE1uzjsZNTSG4lo8H9Se3fIWbLt5jtMxlKgqVVjrk+oZhn9mWO7u7lMMyZqgaOsBpR
	0A8LnjmSVI3lrY8ftKBMqdgznwKGZ0Kip61NpJOAH+QP/d77KNfthnZFsys8FiGNEwzpwrVwWi4Fw
	tRQww22qVhM8bi6MgcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhUS-00A3yt-IE; Tue, 07 Dec 2021 20:55:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhUQ-00A3xG-4i
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:55:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D73F3B81E7F;
 Tue,  7 Dec 2021 20:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28BC341CA;
 Tue,  7 Dec 2021 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910503;
 bh=Fa6UchSERsdNVXky6PNS2vCw8nCpV4RsTu7TPsjmB4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=dvUfGzkAJKzccQlv0HtPexRzXLWw3+BexhSfcjdhY9OELj9M9shyPr2oxlHYgishh
 t4D2z7Bdr+ncSq9kKTlJ1eWwQvEyIE70QCOcHPfTkykUuEbmkImTsvOBxAh+YrDT2N
 e2tXRjJ7AyPRQqOviSDYGDRtTGTym9+e84h6CsKaxpAqC8y47ShWjPbJ5Wc+6tQEDN
 O+w8x6jcjhb24uXwmpRRwPhRkrIfIv7GvPutd6orOK9sOuf81nkdYTyVSsRwR7X0hy
 UTGVn2mumg3zTPmrl6DdJIgD9FUL38mTDmd4Yy4CHa5XbrINFDsrU5l0x2T6JYzzJO
 QyWBUWsq4OuoA==
Date: Tue, 7 Dec 2021 14:55:02 -0600
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
Subject: Re: [patch V2 07/23] PCI/MSI: Remove msi_desc_to_pci_sysdata()
Message-ID: <20211207205502.GA76553@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.210768199@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125506_346464_A943871E 
X-CRM114-Status: GOOD (  13.80  )
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

On Mon, Dec 06, 2021 at 11:27:34PM +0100, Thomas Gleixner wrote:
> Last user is gone long ago.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi.c   |    8 --------
>  include/linux/msi.h |    5 -----
>  2 files changed, 13 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1267,14 +1267,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
>  }
>  EXPORT_SYMBOL(msi_desc_to_pci_dev);
>  
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
> -
> -	return dev->bus->sysdata;
> -}
> -EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdata);
> -
>  #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
>  /**
>   * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -218,13 +218,8 @@ static inline void msi_desc_set_iommu_co
>  	for_each_msi_entry((desc), &(pdev)->dev)
>  
>  struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc);
>  void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
>  #else /* CONFIG_PCI_MSI */
> -static inline void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	return NULL;
> -}
>  static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
>  {
>  }
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
