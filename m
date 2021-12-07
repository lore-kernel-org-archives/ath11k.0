Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F77C43217
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnaPRbX7xYj+7BJNX42EKx4e8iphuTQnss9L5lEkYuY=; b=pSE0PStDjnQvHH
	BTWBgZVuUHcDLcWg09AwP6bSQZyjJyMBPJ/qRrbvr/WYOcueRdQOSVhw2qvGh6V1h3VHiBdxUoyXH
	4na4C+FFl/z8+mE7opCOy6TpdzZFb4KvS6Vy7Oo6mZNI2njzDbSHe17kyH8JaqKhwir0jQ5qxR2AW
	0n/UaY1aCi7AxIHJTWGs9tb7Q8kVpuh8t21P7atJYECKUv8HT7ecSCq4qBsQm7PsNfLf6JcDJddXe
	bsa34OB9o/aqfsIgvsJTIYKz4DHHFxrR8dD8pPINAbB4U1Hi+kGywVgVal5Ng+3iU3X8umt12h2/h
	SS0ACpOWbxM/f0teYWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muV85-007Fd7-Fc; Tue, 07 Dec 2021 07:43:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muV82-007FbR-MK
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F3313CE19FD;
 Tue,  7 Dec 2021 07:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDAFC341C3;
 Tue,  7 Dec 2021 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638862988;
 bh=5v2CYN6Ek/VsBwXBgnA+9vhOyUOpZ4AXtUsFipJFXnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhIwRrB39WEo9ruwJWOuvB7N1crHht5tuI+kItER+b+vuapdVaIC+9lVIKc3Q5VBL
 YdQQXLyF0FiNYgisXBRtnT2nfSUZlr1Kn5R/E2ykVg2r5rMoqIE2uU7VdjZDWuMWeM
 5p2s+W7o63jkZoCUkzMytzmIEbC1GuZZxXiH55Kw=
Date: Tue, 7 Dec 2021 08:43:06 +0100
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
Subject: Re: [patch V2 05/23] genirq/msi: Fixup includes
Message-ID: <Ya8Qim1ROOD/247D@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.103502021@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210224.103502021@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234310_944824_0E160B47 
X-CRM114-Status: UNSURE (   8.84  )
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

On Mon, Dec 06, 2021 at 11:27:31PM +0100, Thomas Gleixner wrote:
> Remove the kobject.h include from msi.h as it's not required and add a
> sysfs.h include to the core code instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
