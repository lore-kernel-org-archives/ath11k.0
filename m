Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902CC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUfhRDOmlk4PWzwp6QJRAqhBbfBreiGsEtGqfRoYTII=; b=qaHxaejwTdyN0z
	6QsnlKNjg4EHVe7YlZKDGACsl7XXzOj/yPSgfbJoydr6zpFErzezjO2EM365XSFwdlsVZfFsN8R81
	6t9qSUKRdFEuRZHUB6l9H7N0GO7BPe3Lt/IWk2iRwONZc8TshyFZF4MDYyYxIdWPcxWgGDDsOinCZ
	FbN9Xw9jSQupX/D9ThU9AK9zRawsSVF8+M35Ex1zUeKE2iywQ6s07+OZXY5uldmOIqQu+8/MVZx9O
	XfEASU8XjEgrri/cowY5gSE/VBZ+IWvfH0ngyq6rK8u7azna/q1XegapiLw41PEc13TdcUIIxrgOe
	XymCjgrhrIyW6CuMHITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVBa-007Gbh-AJ; Tue, 07 Dec 2021 07:46:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVBW-007Ga8-9C
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:46:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A8E0B816C2;
 Tue,  7 Dec 2021 07:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316F4C341C3;
 Tue,  7 Dec 2021 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863203;
 bh=XYTXXWRy+9YqYUEnMANtgMz2OiDj8LhJM0fhnz6BZfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MG3AiqTQwZNqxKk2vJDV2iPvDHwnIDTDlZbDtWj1PANq3S81yMDYHPPCHBmVaryz7
 XV4KY7K+917sMh3tQ3NZlb/gP1jjxq/WP+H9oKvY+3iXQJfkC4Jb6xKzFeP5wxol9J
 2t4bPREpWjYIKSrgRe1fdUC23vxeTGIaXPYH8W6o=
Date: Tue, 7 Dec 2021 08:46:41 +0100
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
Subject: Re: [patch V2 18/23] PCI/MSI: Split out irqdomain code
Message-ID: <Ya8RYToy04z6lRIx@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.817754783@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.817754783@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234646_484313_F7E4003B 
X-CRM114-Status: UNSURE (   8.12  )
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

On Mon, Dec 06, 2021 at 11:27:52PM +0100, Thomas Gleixner wrote:
> Move the irqdomain specific code into it's own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
