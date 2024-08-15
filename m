Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4298CC3DA7F
	for <ath11k@archiver.kernel.org>; Thu, 15 Aug 2024 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlcSz4KYwAPgWcAKkWXUG1nSmDKdddlqy88W5LmzqbQ=; b=jcHMdx2UwbGKkuAtz4V363dYe7
	NOHOgMk/tp5sshx2V0g3anw+mDRU4tyT+eWBL/gStIcvvQKos7sp+CSdg2iMT8gQdC44WxpZTaBsM
	hv19yEaPANo6nzH6kbaykGrBT/y51Cu3Jgb85lp8zk0zpOIcUu5zSuXiUkAt1xejlV7msTylTiP6/
	DFuOgiW6hdolydmqmTSHg2KjOy/m17mhzof1/A9T7zPa0BkAaC+H20F6NDp0RCBzzyRu9NTL3Soyx
	i3gMqc+suodu7jkrh5R8KPB0oIRIU3ehqWl1MYGR6Qu36tGIgkCIHNfVuGsTpyrOXhjxjwdjbzmzz
	no/KJHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedoh-0000000Aa79-3LVq;
	Thu, 15 Aug 2024 16:59:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedoe-0000000Aa6M-3cDj
	for ath11k@lists.infradead.org;
	Thu, 15 Aug 2024 16:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723741150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlcSz4KYwAPgWcAKkWXUG1nSmDKdddlqy88W5LmzqbQ=;
	b=DvHNT8Ks9er0yzKFAFBZwcINolhnMs610dS63wH8jMV51W3CTZa8LY8GBbjOPWJRSSFvab
	5jwcrulIeU4z1Klc31juwIUPKJA7hrJMlkvogHLm3lOv7iBZA7z5ckg4z54Yt+10fBRlB9
	7hMPlIBXoIG+YS86XDmPNviCQnTEDdY=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-K4WXr5MPNe-ppkDdl5OwFA-1; Thu, 15 Aug 2024 12:59:09 -0400
X-MC-Unique: K4WXr5MPNe-ppkDdl5OwFA-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39b3cd180ffso11893935ab.1
        for <ath11k@lists.infradead.org>; Thu, 15 Aug 2024 09:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723741148; x=1724345948;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlcSz4KYwAPgWcAKkWXUG1nSmDKdddlqy88W5LmzqbQ=;
        b=hxjTu86yNPJJnVcfUdQGafCUv2/C1G36Ps9XkdYFb6bFMjUZHcmxpk8LXNNFK4N32s
         qjDLt12cT15uh5uY8reo5yiKKozNUHEPq2YN2eDgKZC+uKr8GwHskNxKHekJvSanD80N
         pAsYlI+bj0ADMr+hGxksXcAuaGwwdFKwSAFgqIeEkiHtjj44GjjRIYDZdjK6vUfiFM0r
         2L2gVWsX6KuQKH9cY1QeqERcO+gWGNk+EQkkZbLVkEhn09MGSKif7/g/p/8gHzVnoi6i
         VsyezhsdMt+RRMZaH7+SOqXDN2hrPtwR2Rrb75t888pFaZEBzS5hO9syHBSv2TUIAvPC
         ZHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUCenvtEmtyd1AwMrWzj7SpnuTDNj8xoqY0IxAXq+5KKV4awbSaxgWplSvVi/o6KFNOkWDAce4PYybIvPnMcV5Vel2MXqWFgMLlMg==
X-Gm-Message-State: AOJu0YxgmQYNiD9fcGvLaezlMhsGK102FRucXP5uNfSaaeOCOWCNetZP
	2Hh1ZQeB5S0ggdqAL2yWjMwWN4kGFCt7BPu6iT24/8hoJNebNbRBl8ADcS/oZBh6qG3sfzuPYud
	0TRnJpmE/IZMx/Te+vJhZgznirSDtN7QiAWCoUxJPkUFUHZS7WpGpciGVljA=
X-Received: by 2002:a05:6e02:1aaa:b0:39a:ea4c:8c26 with SMTP id e9e14a558f8ab-39d26cdf8fbmr6083215ab.1.1723741148121;
        Thu, 15 Aug 2024 09:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnffchl9WybcknzKF++o1mrFSsyjdEylnwuSiMZ5up4JHfQDmnQXUAj1Uo1c5erjQFGND9Ig==
X-Received: by 2002:a05:6e02:1aaa:b0:39a:ea4c:8c26 with SMTP id e9e14a558f8ab-39d26cdf8fbmr6082925ab.1.1723741147721;
        Thu, 15 Aug 2024 09:59:07 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39d1ec19de3sm6807035ab.45.2024.08.15.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:59:07 -0700 (PDT)
Date: Thu, 15 Aug 2024 10:59:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
 kvalo@kernel.org, prestwoj@gmail.com, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, dwmw2@infradead.org, iommu@lists.linux.dev,
 kernel@quicinc.com, johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
Message-ID: <20240815105905.19d69576.alex.williamson@redhat.com>
In-Reply-To: <20240813233724.GS1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<20240812170045.1584000-1-alex.williamson@redhat.com>
	<20240813164341.GL1985367@ziepe.ca>
	<20240813150320.73df43d7.alex.williamson@redhat.com>
	<20240813233724.GS1985367@ziepe.ca>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_095913_009872_13E0DE81 
X-CRM114-Status: GOOD (  48.05  )
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

On Tue, 13 Aug 2024 20:37:24 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Aug 13, 2024 at 03:03:20PM -0600, Alex Williamson wrote:
> 
> > How does the guest know to write a remappable vector format?  How does
> > the guest know the host interrupt architecture?  For example why would
> > an aarch64 guest program an MSI vector of 0xfee... if the host is x86?  
> 
> All excellent questions.
> 
> Emulating real interrupt controllers in the VM is probably impossible
> in every scenario. But certainly x86 emulating x86 and ARM emulating
> ARM would be usefully achievable.
> 
> hyperv did a neat thing where their remapping driver seems to make VMM
> traps and looks kind of like the VMM gives it the platform specific
> addr/data pair.
> 
> It is a big ugly problem for sure, and we definately have painted
> ourselves into a corner where the OS has no idea if IMS techniques
> work properly or it is broken. :( :(
> 
> But I think there may not be a terribly impossible path where at least
> the guest could be offered a, say, virtio-irq in addition to the
> existing platform controllers that would process IMS for it.
> 
> > The idea of guest owning the physical MSI address space sounds great,
> > but is it practical?    
> 
> In many cases yes, it is, but more importantly it is the only sane way
> to support these IMS like techniques broadly since IMS is by
> definition not generally trappable.
> 
> > Is it something that would be accomplished while
> > this device is still relevant?  
> 
> I don't know, I fear not. But it keeps coming up. Too many things
> don't work right with the trapping approach, including this.
> 
> > The Windows driver is just programming the MSI capability to use 16
> > vectors.  We configure those vectors on the host at the time the
> > capability is written.  Whereas the Linux driver is only using a single
> > vector and therefore writing the same MSI address and data at the
> > locations noted in the trace, the Windows driver is writing different
> > data values at different locations to make use of those vectors.  This
> > note is simply describing that we can't directly write the physical
> > data value into the device, we need to determine which vector offset
> > the guest is using and provide the same offset from the host data
> > register value.  
> 
> I see, it seems to be assuming also that these extra interrupt sources
> are generating the same MSI message as the main MSI, not something
> else. That is more a SW quirk of Windows, I expect. I don't think
> Linux would do that..
> 
> This is probably the only way to approach this, trap and emulate the
> places in the device that program additional interrupt sources and do
> a full MSI-like flow to set them up in the kernel.

Your last sentence here seems to agree with this approach, but
everything else suggests disapproval, so I don't know where you're
going here.

I have no specs for this device, nor any involvement from the device
vendor, so the idea of creating a vfio-pci variant driver to setup an
irq_domain and augment a device specific SET_IRQs ioctls not only sounds
tremendously more complicated (host and VMM), it's simply not possible
with the knowledge we have at hand.  Making this device work in a VM is
dead in the water if that's the bar to achieve.

I observe that the device configures MSI vectors and then writes that
same vector address/data elsewhere into the device.  Whether the device
can trigger those vectors based only on the MSI capability programming
and a secondary source piggybacks on those vectors or if this is just a
hack by Qualcomm to use an MSI capability to acquire some vectors which
are exclusively used by the secondary hardware, I have no idea.  Who
can even say if this is just a cost saving measure that a PCI config
space is slapped into a platform device and there's simply no hw/fw
support to push the vector data into the hardware and the driver
bridges the gap.

The solution here is arguably fragile, we're relying on having a
sufficiently unique MSI address that we can recognize writes with that
value in order to both replace it with the host value and mark the
location of the data register.  If someone with some hardware insight
wants to come along and provide a reference for static locations of
these writes, I'd certainly welcome it.  My sample size is one, which
is why this is posted as an RFT.

I do not believe that introducing a vfio device feature that disables
virtualization of the MSI address/data _only_ at the vfio interface
(not to a QEMU VM) provides some implicit support of this device
behavior.  These values are already available to a privileged user in
the host and the same is available for an MSI-X use case by directly
reading the MSI-X vector table.  The only point of the vfio device
feature is that we need a vehicle to expose the MSI phsyical
address/data values through he vfio channel, without additional host
privileges.  The virtualized values are essentially unused by QEMU, so
why not give QEMU a way to turn off the virtualization to expose the
host values.  Thanks,

Alex


