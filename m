Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06499C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I637+OaGP3IAJCDlkqfNDdbp/OKCtTGAlq3Vyn4TUt4=; b=AMeykD15UePFdd
	TRiVKDreWEWyq8LQi06XqO7iefw9MY8YsChY4i3YZIeTyNCIGJCRSwzsvN+h/9/4s+I+jnuiJQw/C
	XEwfKs9A2MU3rn4DPKLgHDLh4x1UAJxZLvCrn7Z8LHWy40ppQcYBgWRv99iRQZVOPBsdABGb7ZoBr
	zJgATMNWxxd1Wt5iwMLlFy3qxMQ+/QwOm7KwQIGYerDchsY7tap6NFZi5OINuXgOfylVZtpuhD1yU
	2hL8MGAadeEpjdPSEc2Xl3JaPLqG6f0F4ROTdahbPLxws/bg+mOlj/Xyd0rV3WdPvgG/qHV3rQqZu
	qaGFl898hKUcvyxaSRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv3zl-00EEXd-Vj; Wed, 08 Dec 2021 20:56:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv3zj-00EEV4-QZ
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 20:56:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638997011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
 b=NIPhL0sgn8M0aJUIi890pmZGlk891yoUSSDMnC4hnbyawxG2Kyh7G1sHH/xsmtSWUM8FfZ
 FyiBCPJVbWpXpFfMUl77mb1l8QqDIF5HigALgdn/RYqTMPCpOHMr0KIFCokDN7aLnrEdks
 8rrnfZKCxcaetGnTQyHUg4mAfEc2N1sxXiIWn5IbWqnhikYmOYt6fknKqXzV7CdqL4P4H4
 8ZS0DFKNdnSGea2HezKm7Hkc6llGKcBl9S+VI9FjnibvCSYHAcSlNTnETtfGbCxdf3f6N4
 HjxoAKj0UnKj8JjZlpBFr0/NMCZQnVLvInv7aT9TCLkwNt6S0nNqOl/aBjfedw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638997011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
 b=KF19qqsUtSG+rWG9NpEYyzGIEvbq/ti9eoiMayWfd1iK3FYz9roP5HeWY227THj1hSYyZu
 bO4E+0TC1Z5Br/AA==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Kalle Valo
 <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
In-Reply-To: <20211208152925.GU6385@nvidia.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.925241961@linutronix.de>
 <20211208152925.GU6385@nvidia.com>
Date: Wed, 08 Dec 2021 21:56:50 +0100
Message-ID: <871r2m24tp.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_125656_026716_C7F1850C 
X-CRM114-Status: GOOD (  11.47  )
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

On Wed, Dec 08 2021 at 11:29, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
>>  	if (!desc->pci.msi_attrib.can_mask)
>
> It looks like most of the time this is called by an irq_chip, except
> for a few special cases list pci_msi_shutdown()
>
> Is this something that should ideally go away someday and use some
> lock in the irq_chip - not unlike what we've thought is needed for
> IMS?

Some day we'll have that yes.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
