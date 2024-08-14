Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C640C52D7B
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPm3R6PblHeNKQdvTaJGKrEzfWm2oR4v27v3xkNgebw=; b=AwzUm4m6NMQT3xiyrSUec8Fkui
	+CWt7HUeL3KluAXH8qBKGCUdf4mh2OBNhb8Qn4QLNq1ZnPnYUAyTvSrB0HRn9vW7ZDEX/JAW1g5lv
	NL0rjRQqD1WhrzxO9NfmOb8VKCGjnLCHSPgi/Adv5aiYPD/j8s8Uvw8tctPjHcuuBmQlEy6cLSE9k
	6/SElZ8iLzf/tT1tuUmwdj2e/Ajq639D3X03ADS4McKcA25aNsoV+BU3tKrX5ZsE72UIG/OfZjheE
	ZcYB+42YkoLCn2DSqwkjJuRRlr10jqRO6nDmPiJUVNdYN1QpFuhy7WulI3r2B+3qaYPyjdOX9IApN
	XWx2dK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFPe-00000007NkJ-3UhI;
	Wed, 14 Aug 2024 14:55:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFP4-00000007Nem-3scr
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 14:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723647309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPm3R6PblHeNKQdvTaJGKrEzfWm2oR4v27v3xkNgebw=;
	b=aJ8xBrikto+YSH+2J5Sb/9wMQ/74XEcwJk1JW1Ogb2864/1M7TuQqkJ2L9mjuQleMO66BE
	1FDwPQ5It0voQVd6CGPUw3zBMHqLeSQhZmcv3Cipi4qEe+llh1sdWg91eR/IW9Xu89WVrE
	ZKOo6xWegCSTbkTkrwGR33hFLS9A1qI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300--OlEKAmINbmGCk-GWj2FvA-1; Wed, 14 Aug 2024 10:55:08 -0400
X-MC-Unique: -OlEKAmINbmGCk-GWj2FvA-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8223aed779aso1771639f.1
        for <ath11k@lists.infradead.org>; Wed, 14 Aug 2024 07:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647308; x=1724252108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPm3R6PblHeNKQdvTaJGKrEzfWm2oR4v27v3xkNgebw=;
        b=dZg62GCb486kmkvRrK0ejgTMPhyarogeV6qmJ1zYIDVXs4cQ4k3Z0tcYiwfJkE53UL
         sGAKQhEZQW5my2Gj/woBwCfFMH5gVuTpA4IqkDoALQKPDux2U3seq+u+jXbS5WTzyr9a
         ofK8gU3sWn3rQmeM2GFUpEVbNUNmmho3SNAzF4XcMlIsG7Bf1i3atYHIZypRBlJ6U1V7
         UnMLBis3Pzf2cRc85p9EUaGh8VHJM2U1Q7MS28Fi9D4QkKGYU4om8uvRCRn/XMx4aShA
         uIgNurvbx4nOGj3dQYN+RsURYvXRQfCVjYNMj+B2Kq8D/k6q3CFclxlJq3nXJnMVHdlx
         KkCg==
X-Forwarded-Encrypted: i=1; AJvYcCUGqW6Wyxcb4MOJR6Fua3iu2jkT5YAsCqWVM3m/V/ztzDfjyqtEndJthniodhEI1ayzY3GIfG/8ceFIAd2PQ0Nlv/jjwGziJ/K+Tg==
X-Gm-Message-State: AOJu0Yzi3qnzwIJhp8hdGVuueWEK6SpiD5NhIHkbX9lsoQlgiXvE6W+L
	7upc3CSS/nBJtsDIZBGE+f0JXrutu9nUwnVMQbUrapkhis+8TMNqskrERj9gutjV6YzpzLV1nom
	Xc2e/+SsGIiFkYIRg/EqW221tkyv657t2xbj5PTsMigm8alvQxsE0DWS89BQ=
X-Received: by 2002:a05:6602:4c8a:b0:7f9:b435:4f5 with SMTP id ca18e2360f4ac-824dae79033mr337940839f.11.1723647307731;
        Wed, 14 Aug 2024 07:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKOB2u3ExmlngG/ZGX6m16GkR9QFQMCyYiDK1GqVIcqqNhWRQ6U/pFLSxgUSO2c6mZ3lkevw==
X-Received: by 2002:a05:6602:4c8a:b0:7f9:b435:4f5 with SMTP id ca18e2360f4ac-824dae79033mr337937239f.11.1723647307328;
        Wed, 14 Aug 2024 07:55:07 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca769102a4sm3274045173.18.2024.08.14.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:55:06 -0700 (PDT)
Date: Wed, 14 Aug 2024 08:55:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
 quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
 johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240814085505.60819623.alex.williamson@redhat.com>
In-Reply-To: <20240813231642.GR1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<20240812170014.1583783-1-alex.williamson@redhat.com>
	<20240813163053.GK1985367@ziepe.ca>
	<20240813151401.789c578f.alex.williamson@redhat.com>
	<20240813231642.GR1985367@ziepe.ca>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075511_076759_E74E0C64 
X-CRM114-Status: GOOD (  28.68  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 13 Aug 2024 20:16:42 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Aug 13, 2024 at 03:14:01PM -0600, Alex Williamson wrote:
> 
> > > Personally, I very much dislike this. Encouraging such hacky driver
> > > use of the interrupt subsystem is not a good direction. Enabling this
> > > in VMs will further complicate fixing the IRQ usages in these drivers
> > > over the long run.  
> > 
> > Clearly these _guest_ drivers are doing this regardless of the
> > interfaces provided by vfio, so I don't see how we're encouraging hacky
> > driver behavior, especially when it comes to Windows guest drivers.  
> 
> Because people will then say the Linux driver can't be fixed to
> properly use an irq_domain/etc as the only option that works in VMs
> will be the hacky copy from MSI-X approach :\

Ironically QEMU already has direct access to the MSI-X vector table in
MMIO space and could implement this type of quirk with no kernel
changes.  It's MSI that is now blocked by virtualization of the address
and data registers.  Note also that QEMU is still virtualizing these
registers, the values seen in the guest are unchanged.  It's only the
VMM that can bypass that virtualization to see the host values.

Let's imagine the guest driver does change to implement an irq_domain.
How does that fundamentally change the problem for the VMM that guest
MSI values are being written to other portions of the device?  The
guest driver can have whatever architecture it wants (we don't know
the architecture of the Windows driver) but we still need to trap
writes of the guest MSI address/data and replace it with host values.

> > > Thomas Gleixner has done alot of great work recently to clean this up.
> > > 
> > > So if you imagine the driver is fixed, then this is not necessary.  
> > 
> > How so?   
> 
> Because if the driver is properly using the new irq_domain/etc
> infrastructure to model its additional interrupt source then this
> patch won't make it work in the VM anyhow, so it is not necessary..
> 
> Your other patch would be the only short term answer.

The QEMU patch relies on this kernel patch in order to be able to
access the host physical MSI address and data values through the vfio
interface.  Otherwise QEMU has no host values with which to patch-up
guest values.  As noted above, this does not provide any visible change
to a QEMU guest, it only enables QEMU to implement the quirk in the
other patch.  Thanks,

Alex


