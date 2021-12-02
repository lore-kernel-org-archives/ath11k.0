Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C424AC43217
	for <ath11k@archiver.kernel.org>; Thu,  2 Dec 2021 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TExXHXXFryxoDDnOyEXmcmHtT5gpilZQkvEf7ogz3w=; b=IfG0y+50hKX2nd
	LCn3PwQL3gwcU0EFcSJQu5qfoZBQ9hJyU3tBIwTbPegW5eSEoHt07ZEnEpL5VfI32UfSG1mbye/pI
	BvNafbnczoee1p1meHIslTIrYxcsRk7tn0WNmJTV1cCf6QEfakOFIzaJZUGEBeQht8AQH1XPRzqZ1
	mt2SxrDO5vmi1uT2hgHrJKbaMvsjB7LN9g++OZ6DRCtPUTmZf0beM/bkp4ba3byBjjr0O89/NBYoo
	IRMkbEcB7aFofhKdne6t3AvfMqRQg3VIUP3QfN0OtmWEaJWVAX5eJ4X9qvxc0CvqTPEsdzOluWtGe
	D04agPEbGX+FoWPSpwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnCM-00Ca2u-SC; Thu, 02 Dec 2021 14:36:34 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnCK-00Ca1q-Op
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 14:36:33 +0000
Received: by mail-wr1-f46.google.com with SMTP id s13so60150919wrb.3
 for <ath11k@lists.infradead.org>; Thu, 02 Dec 2021 06:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xh3pKbxTnj8e62DOcRXknPoUROM+BODLvzmQyRbbH8s=;
 b=GFtEimln4cnLv8R/Gjy0WlBhCtzzli05YKCh3nhKOV6+0jZmhxfuTNPjhrGN9RiRbP
 7VWQQweM+KE4hjmGy+GLZoerhJCLjO0lO/MvLDVP1GKhlhyX2BBLBPUlhrkFxXW4mc0x
 i/qx0LyNix30w3XDXb1RE/mRalGUYo2M+Ipm6lmDMdAtWoF8PNFVokySMMN6A9iXTafy
 rkZgfwG2IL8kYiyQPUAOLFYATLrmqNwhoRwr1JMykwoZUHzh6UUf4k8JIEJru0CUCOpY
 HJazMdGoRvUAnxh1kVEag5JsjZhwmOxDUnMq+Tt96PfwxUfo0zALLafLQtBRSdr5gtYR
 zuKw==
X-Gm-Message-State: AOAM530Vca8yW0brfo2J2Pd/ptOAz/c4Na+8ok9ObWPFGegCES2aFgno
 0+BhSjOPdhbSAgALXfC18F4=
X-Google-Smtp-Source: ABdhPJwNpcGjwNKyiVWqPz1WBsz/Qi/GLv2M+5yPM20JS1pf2ye6xEbrzai84zM0oO2HmmRa7dC8TQ==
X-Received: by 2002:adf:fb0c:: with SMTP id c12mr15988721wrr.614.1638455790749; 
 Thu, 02 Dec 2021 06:36:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q4sm2636132wrs.56.2021.12.02.06.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:36:29 -0800 (PST)
Date: Thu, 2 Dec 2021 14:36:28 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wei.liu@kernel.org>, x86@kernel.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 11/22] x86/hyperv: Refactor hv_msi_domain_free_irqs()
Message-ID: <20211202143628.dgiikgujigylogoz@liuwe-devbox-debian-v2>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.737214551@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126223824.737214551@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_063632_828922_5CF09F82 
X-CRM114-Status: UNSURE (   7.88  )
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

On Sat, Nov 27, 2021 at 02:18:51AM +0100, Thomas Gleixner wrote:
> No point in looking up things over and over. Just look up the associated
> irq data and work from there.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Wei Liu <wei.liu@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
