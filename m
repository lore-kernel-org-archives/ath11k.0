Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EDEC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rz3+sGDFsvR/XX6M0mk3cGawymPZKbWVWAWoIkzTxto=; b=vcmRzHUhNi8ItC
	gAKKanNd+yWlUv7bjO184DQgo1wyjSK484GFG8fwnoceBG/xVKYC5azNpd78lmKw9SKUQ88e2Ci6h
	G7zrjrBZy2RCjxx3eQwfqOIuxCThSholLPjZT/OoQ037IctrYc4Zzm0qnDwsEgCfgXkMJLrnqi4Vz
	ZFZxG/U+ZPwjQe0Ww7FCNvXRz6STyjSaSuaeTT9dbbQcQbKLppE6jB1uFc8M8mRm25M92JQwY33AP
	jn631y6p+ECrtb+xGbO0S3nkbonikWfqhIQivuhqKo3gauR4AOtkeQtSQtrm4uiV4h53apiq/1zh6
	01vM7I7EonOz5QiJHZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhTA-00A3i9-4g; Tue, 07 Dec 2021 20:53:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhT7-00A3gF-0c
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 16831CE1DFE;
 Tue,  7 Dec 2021 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E3EC341C1;
 Tue,  7 Dec 2021 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910419;
 bh=0olJYQ/vZXxNbmux0Wc5kCG7Q8xmQSGJ4EEGX5/7MKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MbREQLAmpD8wPLYpCv9jTSrE00gvmkjU34dG8bCGSdkkOx5lA5r+o1g2zoGSx/C2b
 YIQIjqV/znJrCTHzH9zLIkNioxbfipIqhqype9Cd76anoG298O5tcN/hAXHTcgJr7E
 AQhUCxkGye8vXivrflomiTMP5ytmmN4IV5kZwS7+LEBV8ahxK0/RPJjGnSoav8YdLu
 Le2YSsXdQfJoyXe6klQp9YFPeJz/C9VdAwMAeftNu99ODwCGdjCd6c3CFrixrHlASA
 bFHldg7thBUs+vtbfN+tcSAWID3FMjm+GzEoLKnTtAPWT54ggSkOvfr4XTjRaQ/uf3
 5wndBP5xrSsFw==
Date: Tue, 7 Dec 2021 14:53:37 -0600
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
Subject: Re: [patch V2 02/23] PCI/MSI: Fix
 pci_irq_vector()/pci_irq_get_affinity()
Message-ID: <20211207205337.GA76377@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210223.929792157@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125345_455619_378C0FD5 
X-CRM114-Status: GOOD (  27.03  )
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

On Mon, Dec 06, 2021 at 11:27:26PM +0100, Thomas Gleixner wrote:
> pci_irq_vector() and pci_irq_get_affinity() use the list position to find the
> MSI-X descriptor at a given index. That's correct for the normal case where
> the entry number is the same as the list position.
> 
> But it's wrong for cases where MSI-X was allocated with an entries array
> describing sparse entry numbers into the hardware message descriptor
> table. That's inconsistent at best.
> 
> Make it always check the entry number because that's what the zero base
> index really means. This change won't break existing users which use a
> sparse entries array for allocation because these users retrieve the Linux
> interrupt number from the entries array after allocation and none of them
> uses pci_irq_vector() or pci_irq_get_affinity().
> 
> Fixes: aff171641d18 ("PCI: Provide sensible IRQ vector alloc/free routines")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: Fix typo in subject - Jason
> ---
>  drivers/pci/msi.c |   26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1187,19 +1187,24 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
>  
>  /**
>   * pci_irq_vector - return Linux IRQ number of a device vector
> - * @dev: PCI device to operate on
> - * @nr: device-relative interrupt vector index (0-based).
> + * @dev:	PCI device to operate on
> + * @nr:		Interrupt vector index (0-based)
> + *
> + * @nr has the following meanings depending on the interrupt mode:
> + *   MSI-X:	The index in the MSI-X vector table
> + *   MSI:	The index of the enabled MSI vectors
> + *   INTx:	Must be 0
> + *
> + * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
>   */
>  int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
>  {
>  	if (dev->msix_enabled) {
>  		struct msi_desc *entry;
> -		int i = 0;
>  
>  		for_each_pci_msi_entry(entry, dev) {
> -			if (i == nr)
> +			if (entry->msi_attrib.entry_nr == nr)
>  				return entry->irq;
> -			i++;
>  		}
>  		WARN_ON_ONCE(1);
>  		return -EINVAL;
> @@ -1223,17 +1228,22 @@ EXPORT_SYMBOL(pci_irq_vector);
>   * pci_irq_get_affinity - return the affinity of a particular MSI vector
>   * @dev:	PCI device to operate on
>   * @nr:		device-relative interrupt vector index (0-based).
> + *
> + * @nr has the following meanings depending on the interrupt mode:
> + *   MSI-X:	The index in the MSI-X vector table
> + *   MSI:	The index of the enabled MSI vectors
> + *   INTx:	Must be 0
> + *
> + * Return: A cpumask pointer or NULL if @nr is out of range
>   */
>  const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  {
>  	if (dev->msix_enabled) {
>  		struct msi_desc *entry;
> -		int i = 0;
>  
>  		for_each_pci_msi_entry(entry, dev) {
> -			if (i == nr)
> +			if (entry->msi_attrib.entry_nr == nr)
>  				return &entry->affinity->mask;
> -			i++;
>  		}
>  		WARN_ON_ONCE(1);
>  		return NULL;
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
