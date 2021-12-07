Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3350EC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xptbWOo/vusdkLpgVh81+o130idtvFfrtNxcVGLOULU=; b=YBi/u5AhYZWfD7
	EqCL+lL4nmU/3EmZvsXEhJBgwCd5Lgt+td9wZtLmznTWUDXEQRzAf4L8W9A8q6yFkxpTljGpy6axt
	g2zOK3ynsOrb1F3RBmi8n7mM4ep5E6p5T9e5HQwkeUZERRgJlJnCSZgYMnJCzmkCbhQQmC/tuC+oy
	qddh/Glq2RzgnEnrzadT3PWwwJGYT6UUfWaYxWEV7p3vpXPgVbtqTWrmq9hiLARjk8qYIE9IJjHcA
	t7zlIqNUwcwTosB+dEdSogVv8dCAEkRUd3/+mUZ/SOmaxbbZE8b1kTxLzMLLUxF4QSeW3ndvdMLjF
	9oLGkqX2R5KAFrBkoVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhWO-00A4hy-Ux; Tue, 07 Dec 2021 20:57:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhWM-00A4gM-7z
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:57:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDE53B81E82;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DACC341C1;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910624;
 bh=XrslgRHtCWkizJFdxh4LYx0Ea6YIT+zkeRKUg8jgH50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oNWOya01lPJvnE3tH25W+i5fvBukvCWqbSt8o6DALtpqSoHuRmTol41FHNBbcEmwf
 ndqs+TUJ09ke7BxWb8HjaLc/fY3tO470dZ4Qyno4Wpq5/bEnoEjzOjsbXmUV1qPZIo
 hVQXatTYM8u7grl3xYsaQbLBxtsdENIZvu9pTIxNja33qod3Ecev9Ir5ev8d5C96pY
 0IK/7dJ9j/4mbDBL0nO4T+nU7isZp4iut/H/gQt557Of3NPt7vq7/9Jpi+jESYyg4O
 IkM/M8qlqvOoGLJfagsdSI/guqcNiYtMrzlfaFPpkvCs0s96NJKjtT7Cv9aAODCAWZ
 Q3dkMDUriYcZA==
Date: Tue, 7 Dec 2021 14:57:03 -0600
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
Subject: Re: [patch V2 13/23] PCI/MSI: Cleanup include zoo
Message-ID: <20211207205703.GA76805@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.539281124@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_125706_453367_20D272C8 
X-CRM114-Status: GOOD (  12.81  )
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

On Mon, Dec 06, 2021 at 11:27:44PM +0100, Thomas Gleixner wrote:
> Get rid of the pile of unneeded includes which accumulated over time.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nice, thanks!

> ---
> V2: Address build fail on powerpc - Cedric
> ---
>  drivers/pci/msi.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -7,22 +7,14 @@
>   * Copyright (C) 2016 Christoph Hellwig.
>   */
>  
> +#include <linux/acpi_iort.h>
>  #include <linux/err.h>
> -#include <linux/mm.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
>  #include <linux/export.h>
> -#include <linux/ioport.h>
> -#include <linux/pci.h>
> -#include <linux/proc_fs.h>
> -#include <linux/msi.h>
> -#include <linux/smp.h>
> -#include <linux/errno.h>
> -#include <linux/io.h>
> -#include <linux/acpi_iort.h>
> -#include <linux/slab.h>
> +#include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/msi.h>
>  #include <linux/of_irq.h>
> +#include <linux/pci.h>
>  
>  #include "pci.h"
>  
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
