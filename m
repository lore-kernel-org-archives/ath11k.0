Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4072FC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIf3e6bAys4HKSfqAVbLh/JxecShVakmvwl8w/l0NB0=; b=3nPaJpwWMv4yCF
	m+7je2s7y9VylmLJi7cUpij/ptEPjfxaOypBlBUKcPAWACyV3diMYyQ7m/jsELEXpHxFBFoSC/zGH
	arAi5i5eq4PFCUxGlPKAGAWRdyaHJtdUhrZt9LrjOGQakI3TkU5ySzMEczuDxVauHmmK1TzCxpcuJ
	18YIo2KH4lLnyx/Nc+9mFSU1knDjh3PRyCHVtNuBPfNjey+DxLx8POWIBYpUiPGsyAws62SYIVWZ+
	mvGf69H0VDGd/VN7M6R3zf9okaLwaQi4DRp/ux/5Z1tq79PYROAOKBtA32OQNqqSl+V/nWWaT4yU0
	0f9De/vdqgFynaCjaKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVAH-007GJs-55; Tue, 07 Dec 2021 07:45:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVAD-007GHe-Qv
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:45:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5F5CFCE19FC;
 Tue,  7 Dec 2021 07:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE83C341C1;
 Tue,  7 Dec 2021 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863121;
 bh=x8rfoXc6M9OTPg850eW6BmKW89RExZgEThtugpTz+6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+jxkiN+f3Ne67zNIOcujASWUugViQ8TCbEK7hiYq+U3n+Fahxn1L0f30VN8pbizc
 hZNBuPiZATbQ+AOim8phsr2YKIPQl8JKLp/83pYydRrndRT/TnSSzHpxTclp34m7lF
 oxqIgoW6u6pwrjoz/ow2obv1+OJVMNbiDW5DGKmY=
Date: Tue, 7 Dec 2021 08:45:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
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
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent
 part
Message-ID: <Ya8RD/4MMG8LLzDR@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.710137730@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.710137730@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234526_101366_8DD369EE 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 06, 2021 at 11:27:49PM +0100, Thomas Gleixner wrote:
> These functions are required even when CONFIG_PCI_MSI is not set. Move them
> to their own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
