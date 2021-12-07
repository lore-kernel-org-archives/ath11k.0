Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE980C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRcjnZc2E3OFoGXvIPkpC/2eMPgg0gTG52Y3mK9CRtM=; b=BZ+oXI/ZZjIQIb
	MyFYdChvUwz45qskmov1ING0PaUJgowUZs4DQcelOfCKkMc8UwbHUGMUqlCobaR0tVld5LPXHyEun
	ao+3XrV8DDcxmMI7rrs36jMl/Y+7A0jscoe1GRWBzHZQBbGeAwxHH/cRCBj4ixXz00YGvGjXeYubB
	6RZnQj+Hu0UQ8jaCjm/fpu0QM7w21Tu3/5BZrWX4Gmtu2cZtUsQcXU0VMP9m8eI6Y4+UC+EelsUaO
	CnIxthbcXDsEX3kP0W1+Jj8ihmQa412bbtUVEVVTtDLhcVlL5jvaZdijZ/2EG1yYnQjElYdtHI6rQ
	1MJhTg6jGxoNSSs/E59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVD5-007H62-Kk; Tue, 07 Dec 2021 07:48:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVD2-007H3n-G0
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:48:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ADCABCE180E;
 Tue,  7 Dec 2021 07:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5387BC341C3;
 Tue,  7 Dec 2021 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863297;
 bh=987va09/dvP0ztOLf5mXiuObxbrtwLhSB7qczYAr3zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uaiDHF8b4ZwfaykbIRoAGImv/wOEYnC2OuRRekPTUvnH7Z+KoDN2eitf1+2jyFZYE
 RW+eyBwNessu97qSLx5/+QRYN5pKkPpJcIjhEtARHEOXbvL32YiTSQMez2rOnMK2aS
 hmP2VmZeVihGhwMbl5FyYdeY/dLwK2GtNNuHp+J4=
Date: Tue, 7 Dec 2021 08:48:14 +0100
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
Subject: Re: [patch V2 22/23] genirq/msi: Handle PCI/MSI allocation fail in
 core code
Message-ID: <Ya8RvhfV2j5i0gwg@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210225.046615302@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210225.046615302@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234820_746024_E78FB039 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, Dec 06, 2021 at 11:27:59PM +0100, Thomas Gleixner wrote:
> Get rid of yet another irqdomain callback and let the core code return the
> already available information of how many descriptors could be allocated.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
