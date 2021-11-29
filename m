Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D0BC433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFncfIu8E9Db95uNc0+hse/4MxcfhK/T016piYfqakw=; b=CIb33iCp6a0HHP
	VgjptSn89+DGuSduWMTo/TK4PvpVN938uS5n/yO32NPshZ1YBmjG7Du1l1sI4/Xeqgld+4PnLXNKM
	wxXzEZVr9PMCtiB3jTd4WGv+bA3N2QSs/3YFAJGqDK47paT9czYbFDfC9xjgncLHKCTahrjeA4EGH
	4K4VpQt6HXyw0j+UdDu20QBg6YQ9qtSJ4ZFX7hmy8Kfjrq0JedS7ObgJBx8vK7VpQVmIwFHkN3NxM
	XT+0zKGoaNe7FdAH3CPRdpCpAG/ZziVpAsz3cj6W+Ys7synUa6z7y8nsljJQVpFYkOoyu0WtD04Ip
	7SmrdOQ1Qq9Eu/NreYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrcz7-000F54-KY; Mon, 29 Nov 2021 09:30:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrcz3-000F3t-9w
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 09:30:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638178198; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6eYnZqn/a+66YlvOdqd+LVZ4HfzlOTayDC9zFdg1eh8=;
 b=msIb9nD4T9xoTH1L/oZSAM+6AmshQs5IBLD42xZjlu1Q/WgzRJYk0ZhNlAS6j7sXPdXt5FVq
 jkc3Vm6qElYEMo1EJj7e6+3ugu0IkDTBHUY/VqerJ4ANXEYrgKtt0stHRYawK4jcLNTxDw75
 zhusivEUpsd8VgPdPNMwnpE6BIw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61a49d9586d0e4d8888554ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 09:29:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A31DC4360C; Mon, 29 Nov 2021 09:29:56 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C23B0C4338F;
 Mon, 29 Nov 2021 09:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C23B0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 10/22] genirq/msi,
 treewide: Use a named struct for PCI/MSI attributes
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.679247706@linutronix.de>
Date: Mon, 29 Nov 2021 11:29:46 +0200
In-Reply-To: <20211126223824.679247706@linutronix.de> (Thomas Gleixner's
 message of "Sat, 27 Nov 2021 02:18:50 +0100 (CET)")
Message-ID: <874k7vcnsl.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_013001_438164_7CE88223 
X-CRM114-Status: GOOD (  11.29  )
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

Thomas Gleixner <tglx@linutronix.de> writes:

> The unnamed struct sucks and is in the way of further cleanups. Stick the
> PCI related MSI data into a real data structure and cleanup all users.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: ath11k@lists.infradead.org
> ---
>  arch/powerpc/platforms/cell/axon_msi.c    |    2 
>  arch/powerpc/platforms/powernv/pci-ioda.c |    4 -
>  arch/powerpc/platforms/pseries/msi.c      |    6 -
>  arch/sparc/kernel/pci_msi.c               |    4 -
>  arch/x86/kernel/apic/msi.c                |    2 
>  arch/x86/pci/xen.c                        |    6 -
>  drivers/net/wireless/ath/ath11k/pci.c     |    2 

For ath11k:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
