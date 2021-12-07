Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09042C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd5lZcwKrtBiZ4LbN4pYjKBlRlPCKGTet5zv1njoftw=; b=IuG3Bj3Sez28O5
	0i2PeV/VEYQfAX/c/VlVB9qn1Dj3OgCjdCcXbQsRJJsvTN4riehdwrRuvDByPR5BCRykDAcOu7tfz
	m8fZcdGoWK4X2wnuIxIjIOST8gtVfjaEPDEPziGt7EFFayuoOyZfXFXRC8OvkaGk/LIXQipElw763
	/jGY9d679U486TiiG82U0m8iF+H17/dOtpldnZB2yenjDqf+BlH4vs8SxCPryB7kwFRvgWcOSstJN
	MUkkFLM5Tef59X2wJV+yIh9rsbiFfroH9i7uwWyLVAtV9+k8HTDUytSdNmkxcLINCeS7sZzdhG7VU
	kg8hZfxCvUpoR6Bg2eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVC8-007GjL-Ua; Tue, 07 Dec 2021 07:47:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVC5-007Ghl-R1
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:47:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E5E6B816D5;
 Tue,  7 Dec 2021 07:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF933C341C1;
 Tue,  7 Dec 2021 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863239;
 bh=S3bXluwk9Tp0/I7fDZuveLkWCavppG21+XUHrjKqzHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pb/dyynXP59dAMHIuj0t8HKLgqvn8JROVWdSIIIKJ5NiyoFtkSERH47W84UjiwAXs
 MWu0388me7wEsfFLd9qgqWiW6piHnLwSP52fOwKGGYOy/OwLdXwUJVoGnJm7L14wxN
 BPRnkCaul1K9TxSg+lXuERdjdsH74dOh8QaEwz0s=
Date: Tue, 7 Dec 2021 08:47:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
Message-ID: <Ya8RhMylu6OWYNia@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.925241961@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.925241961@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234722_039115_8C43782C 
X-CRM114-Status: UNSURE (   8.27  )
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

On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
> It's only required for PCI/MSI. So no point in having it in every struct
> device.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Yes!!!


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
