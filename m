Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74035C433FE
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRg8N0n3cpmgUx8dBMtkta7fRPJ3UXNfzGDO2S61o+4=; b=sknt/yhSrIuoST
	+o9wZBtahg0dGVyKIuATyWNBHQM/cH7Fu3+25mWcUNceBNEVgQomr5weT99+r2nqm70o9hVL1VMx3
	/BCx/nSCmuVUs4nFQBpRqfZ9rFte3u1rkdsaJOC/UT8WuXPMAMfe/28fGTSljRV0377z+6/gJU8RT
	dR8aHFgmyuf3XFf4rTSt53wdXOH/98vlTkwjCNINCdj2PFPaw0WFkwhrM/0+wBvtmzeGEMPwdupYu
	csEgR+hJJrchmmOOe1TXtLRfAFeKUvAIiL9M4bwtNEp/1Gt4g7/a8Ot5zdLykdJ+bWg6igmn609qk
	TtPs8OzvdcP6Fejq90IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muV96-007Fvh-Ez; Tue, 07 Dec 2021 07:44:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muV93-007Fu0-Mu
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:44:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EC409CE19ED;
 Tue,  7 Dec 2021 07:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DD6C341C1;
 Tue,  7 Dec 2021 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863047;
 bh=Yz0WH2dr1QgSK49CFe7iFQ+XeVnQkWXGdacZietp0hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubBF0Z2AfejKCYJIZteJrserEv0J9NT01LNRNKJ/KrLN5gKu3YqoZRB1nmERkKkDS
 kJLnHlpBhYYtt+efX5t4G162exIvYkUrzrZgqARbx50OcrLfiwASrgs5YBjwZXr4hL
 Jhs1l7eEN7akG3UcGvqXKzHIDcpxgb/0gFN5lhYI=
Date: Tue, 7 Dec 2021 08:44:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Juergen Gross <jgross@suse.com>, Kalle Valo <kvalo@codeaurora.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 10/23] genirq/msi, treewide: Use a named struct for
 PCI/MSI attributes
Message-ID: <Ya8QxSUKbVEHHSGh@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.374863119@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.374863119@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234413_959798_2099B5FC 
X-CRM114-Status: UNSURE (   8.88  )
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

On Mon, Dec 06, 2021 at 11:27:39PM +0100, Thomas Gleixner wrote:
> The unnamed struct sucks and is in the way of further cleanups. Stick the
> PCI related MSI data into a real data structure and cleanup all users.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: ath11k@lists.infradead.org

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
