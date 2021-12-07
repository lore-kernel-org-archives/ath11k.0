Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568FAC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YLwEpDujXKGgx4e2JuwjYR3XRu9idTQolk4xzZWWseA=; b=grIub5Ncu9askQ
	p97M7biYLfLGV3iGh1+xQOXjsWTpnfsxskgUstolaFSECeoA3L/VlFPkosM32D0PvpDOkm237KdPa
	l2jbgDMkcH1hXIMVru675WgmO+bZdjcaacMD5ISaym3KaiFMD+RArc7wfpJLSVSPVpuv+msLwNQoa
	xELTcL7npDqjlJ125z6aiw+j3Ym9QJn6Z7ztTrGrcdI9la+simVfzmZ6eJ/VExBeplW1KfRBWgZ5l
	tS5IeM636bNaT+Wg04Qmf62XOlmx90OrCPPdVfNyr1oZkAbwmIBVOKhqDqFQ710RCXFvOUP0genAp
	eBz3EIx9ZnnSpp1hkf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhWg-00A4qD-3x; Tue, 07 Dec 2021 20:57:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhWd-00A4oz-A6
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B7F8B81E94;
 Tue,  7 Dec 2021 20:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C95C341C8;
 Tue,  7 Dec 2021 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910641;
 bh=p4nzpRhPjzZYY/2joI+5ST1wSIqa+dnFOH02Wt6TY90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TBxT84AbL5Gep1COvq7TErtiHgXwTDw0MqC9DWEsU3bt1FgCmBhl92LueC5uhijkJ
 /AD3uh3vlBBztJBVIuEXGD39HkvRqAw2mmADUNrbGv8igflwAI51FTrrlhOCh7CDjA
 JipWm7z8+pwAofUYL8YQ4KeHO2uQrmr42qs33txntiRVsX4QM5pQiASWsxcQeT9JnJ
 Q7nKN6B9u2c3unSau2PIUrC+WNRDmQr0NBXm2YWSOwlW431/1LNllTpk2xQvdwBDWx
 jRXpt3dwtRz/SnDxd9nv1DqQPFXA2DpbOUl8hDquMhSry+d0h0MDbGrJJ0q+aeDGbe
 C0zQ+0ViJLMag==
Date: Tue, 7 Dec 2021 14:57:20 -0600
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
Subject: Re: [patch V2 14/23] PCI/MSI: Make msix_update_entries() smarter
Message-ID: <20211207205720.GA76876@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.600351129@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125723_516942_8FB0633D 
X-CRM114-Status: GOOD (  14.83  )
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

On Mon, Dec 06, 2021 at 11:27:46PM +0100, Thomas Gleixner wrote:
> No need to walk the descriptors and check for each one whether the entries
> pointer function argument is NULL. Do it once.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -642,8 +642,8 @@ static void msix_update_entries(struct p
>  {
>  	struct msi_desc *entry;
>  
> -	for_each_pci_msi_entry(entry, dev) {
> -		if (entries) {
> +	if (entries) {
> +		for_each_pci_msi_entry(entry, dev) {
>  			entries->vector = entry->irq;
>  			entries++;
>  		}
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
