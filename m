Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84D9C433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrWxB6v+s7UfcURJDHROdLnELeN+NURRTcqaDCPwlG4=; b=b14B6ondgbkIGv
	6L4HvUioerIk/RuzKFB/ZJT52MI2R2FLJ6/jkhZU0b89tuWLyJL0ymB4Tmy/5r7j//qKL7iTdB44c
	5niisIiysNo7xSHnlSBpv60qKxdV1JkOIWTJE2Dr6N3OMNo6boKjMvBUd0rGnKZ2v2xWY55wnLdWv
	opjW8aiRDuMQDv1mDvRfL1y0EDw5vOd1VkUuu1n5n3x8foZBD20sc1/JIneYlTqiOS6O349VVD0Oz
	9VYkotjnDiFL0sQdAuT7jLX7/JtZKCQX82dUtEgcyKA8KXqLkq1xCYYYb9L9FoF4fR2LYYhTzBRMj
	MespGvPjFj3eCcIkGl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVCW-007Gsr-0Z; Tue, 07 Dec 2021 07:47:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVCT-007Gqe-7b
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69B4DCE1A03;
 Tue,  7 Dec 2021 07:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB93BC341C1;
 Tue,  7 Dec 2021 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638863261;
 bh=GJEc5bHESZynwTkpKatK/sv+Oau05bPz5qOKd1zBMSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLhJjK7rO92G8d3WWjG7tWRQ+BW+rOaBX5Ee1Gl0gD+5ddO+i5XQqu+JCB+cbG68P
 X06bBa7EJYZKAsQL6qvCO228/ql4ENSodj1f7Q2N+ZvtKwZka/F+1QUWjQmaE+zFif
 LbTeWJgFzo/EHaecJ068/cqfOkongNyBJMpNwFYI=
Date: Tue, 7 Dec 2021 08:47:39 +0100
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
Subject: Re: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
Message-ID: <Ya8Rm/cmS4054OvP@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.980989243@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.980989243@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234745_489416_F71BDB21 
X-CRM114-Status: UNSURE (   8.49  )
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

On Mon, Dec 06, 2021 at 11:27:57PM +0100, Thomas Gleixner wrote:
> No users outside of that file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
