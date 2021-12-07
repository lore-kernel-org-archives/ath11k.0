Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4614EC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OKikeBJUhlBewkWsRZbinOcIzWMFraET9mYhIn+mJ+A=; b=IWMT2MMvjCfMNM
	6uWUJPJa2L1c5jSqpRpeKmOzKJZHXPYMcCiU0OLXsZ0KatC8wFfMjqmKyAS3i7gTF+ugl48JGqmif
	PMuo3zAayH29wXC8Qw+Ofyb/ecLIv29+14mnWftb96bnj3vmsgSrVCAuz7XHU/dXR1gKcNPVdFRLm
	dcvAO80nr0QyxFamFe7wZNqVTxSdOxvx+mNb3E3Oa/stMBBcABtXgEhHvDdxwrqiwtGyV5qVhVk+W
	I8G3oCngLyGS+ywcO1qZzkh43tRTYE6ZAVAPrqs5GS1GRGa5OhJqPYIMDjQQIdx6zDr38L56aVgjZ
	WBAoRbXQQbvxAD+xOPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhVd-00A4Ie-6s; Tue, 07 Dec 2021 20:56:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhVZ-00A4Gh-TW
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:56:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A22C4B81E7E;
 Tue,  7 Dec 2021 20:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B8EC341C1;
 Tue,  7 Dec 2021 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910575;
 bh=qLik4JFtyxqmSptBayqaCn1r8IHM9yMTUp4uNVorfnk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZuIbLGLfYV/nvLepPIU/oJgGVLR/cUv4fN1TB9jN6qxiqhzWiZXhZIRCqViFXsXX2
 BupHwnNmoV668bTXaUoUD++cCPB+blzebEwefTUII/C/6Vy7O3vnv9NoEGA/Ji6Owv
 oPt6EPc+oZmfGxvR4m833Yz/aYsVS5bGsuqgu5ZEDfAHynE853rfjGlPDeDpFGEt3Z
 R8MZc2PJgawqhxAfrRf/p8uWcDY0ETOixepI3ae+2tW6W36bm3938Zs5e4gyXwU3uL
 Xg3/BGlYj1tkxDl4i0Ek1cNEw8YRkCMuc4qXgDYFJwb6ISeYQABlWAEk0RIe7vI2Hq
 f6aHj3PLOAFog==
Date: Tue, 7 Dec 2021 14:56:13 -0600
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
Subject: Re: [patch V2 08/23] PCI/sysfs: Use pci_irq_vector()
Message-ID: <20211207205613.GA76623@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.265589103@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125618_127751_52792581 
X-CRM114-Status: GOOD (  15.96  )
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

On Mon, Dec 06, 2021 at 11:27:36PM +0100, Thomas Gleixner wrote:
> instead of fiddling with msi descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

s/msi/MSI/ above if you have a chance.  Nice cleanup, thanks!

> ---
>  drivers/pci/pci-sysfs.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -62,11 +62,8 @@ static ssize_t irq_show(struct device *d
>  	 * For MSI, show the first MSI IRQ; for all other cases including
>  	 * MSI-X, show the legacy INTx IRQ.
>  	 */
> -	if (pdev->msi_enabled) {
> -		struct msi_desc *desc = first_pci_msi_entry(pdev);
> -
> -		return sysfs_emit(buf, "%u\n", desc->irq);
> -	}
> +	if (pdev->msi_enabled)
> +		return sysfs_emit(buf, "%u\n", pci_irq_vector(pdev, 0));
>  #endif
>  
>  	return sysfs_emit(buf, "%u\n", pdev->irq);
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
