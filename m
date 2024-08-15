Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543D0C3DA7F
	for <ath11k@archiver.kernel.org>; Thu, 15 Aug 2024 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqaSFAda1BULnUkvbkqjvUbbEFCCq1QGyMDyl6SYwo8=; b=Gp/fXZgeYdi/YR2wCeitJj+zVd
	Vr0vbeuUHKyaDEXxJ6O1chwga3pBN5KrNcpMFAve4/r/WQd91PQq5llH/lEe64ZVIU8CO23BRlIJl
	xFZ1c/RQIoQwMMSqOyFUxGcAiDVziXLcaeNCbttQxVX6siGDldEgjieF8pYCU3mpzNgzpSuelw9jS
	OEfqBnjr33udkDa6ypobRjt/HyJa9xCor7fHbOeR/AN3QFZqCTpmFOY6K+C7qAbrOZsaGIOlrttmh
	dzAzsJv+/d2CrBYEshu1angzmy0hfyM3A1ZryXaRyjTX2RSD5WlHXNYGknOje3ZS6KSMJh03nTMQp
	trdfO6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1see8T-0000000AcSL-3U2R;
	Thu, 15 Aug 2024 17:19:42 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1see8R-0000000AcRi-0ZqV
	for ath11k@lists.infradead.org;
	Thu, 15 Aug 2024 17:19:40 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7a4df9dc885so94347985a.0
        for <ath11k@lists.infradead.org>; Thu, 15 Aug 2024 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723742377; x=1724347177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqaSFAda1BULnUkvbkqjvUbbEFCCq1QGyMDyl6SYwo8=;
        b=FqQ5PSBUKOLnYdJ4N/LPB1TlWIzee14X0ixfhNnpmKxwobCDOYWKltr6QleSkKNDTl
         Pww0daGzXCZSMmVsMp4gbD59BYgzhtqSVk+MGne3wRX3f/phZUfpnmVmA85EGDv3HBks
         HL5eqTXwInhIkFczSvX5cvl7hi684zEbpMhovz9jOf4POlC8EytjGuKxlxMmTPATcVC5
         DbEzaQrPJrrvus4cABFm43nNLBdN4YDxa8+zNMPHGwAu7Xo1wrM4XY3n3J+tVNl8+X97
         lTFx3n7CHeLYIMRF5vjkl69iBhlGmMocazTvp5iqSAVM15D+EQn84i7QxyGEdbfrlPyK
         c5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723742377; x=1724347177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqaSFAda1BULnUkvbkqjvUbbEFCCq1QGyMDyl6SYwo8=;
        b=eQPU412t9YOu2oRyVOi6GAarSSoLMUvrENOu9HQa+WbWAfLYVDpppHADgPjCyvuPBQ
         rmZJKR42jHLNZpv2Ty/ADHJfg7sGxC9n9g94c89PsWa/dqvRI2efKsJbIqkPz6aStQQk
         HjQp0DbtzYvcGcArbvbUHQliDwmBPq3g3EqaLVLmyB0wyHyRZ1Dm656nA06Rfw0UtsrF
         P4qpBYpVWV88Xm8jx4wlbO6hr2FRPSdnREX/pF0YYiAolOVxLlpRE7u4FxLo51+Ots2n
         5MGAYzv5CuEBSsTq6mTm8uZXxfNkz7OXrIQZV37X/UDdeHgdteJvFhwCBoRSq8p493pw
         j++A==
X-Forwarded-Encrypted: i=1; AJvYcCXi0rPYrCvm/sVN167BSq3/o6sJlUJl3+c5VoHO02rxME7cnF1qfpj1JC8++84anXAbepCawNXQOW8ewTwjfZ9ypD4T7NwbPNpnuA==
X-Gm-Message-State: AOJu0YzB2/E2mUICE7ATiF5NE+jMUX8ejR4TwcS1EuQDXEwm/7A4kVzp
	pwceRuRjhEX4kvoOERa8vuZCZxL9Wr71JSxZXfl7fvthoJlE2w1kmg2M5Saku54=
X-Google-Smtp-Source: AGHT+IGEGC1/A/48dBre5gaeZ0zHau3OBx975u/klzSPGEReClcShxi3bAXTedaOfHOOcJfdHkXOVA==
X-Received: by 2002:a05:620a:294c:b0:79e:f745:5445 with SMTP id af79cd13be357-7a506ff0efbmr18473085a.31.1723742377586;
        Thu, 15 Aug 2024 10:19:37 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0dcac4sm80966585a.84.2024.08.15.10.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 10:19:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1see8N-004EaT-MX;
	Thu, 15 Aug 2024 14:19:35 -0300
Date: Thu, 15 Aug 2024 14:19:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
	kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
Message-ID: <20240815171935.GO3468552@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170045.1584000-1-alex.williamson@redhat.com>
 <20240813164341.GL1985367@ziepe.ca>
 <20240813150320.73df43d7.alex.williamson@redhat.com>
 <20240813233724.GS1985367@ziepe.ca>
 <20240815105905.19d69576.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815105905.19d69576.alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_101939_202041_990D3FDB 
X-CRM114-Status: GOOD (  26.51  )
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

On Thu, Aug 15, 2024 at 10:59:05AM -0600, Alex Williamson wrote:

> > This is probably the only way to approach this, trap and emulate the
> > places in the device that program additional interrupt sources and do
> > a full MSI-like flow to set them up in the kernel.
> 
> Your last sentence here seems to agree with this approach, but
> everything else suggests disapproval, so I don't know where you're
> going here.

Trapping and emulating is fine.

My concern is really only about skipping SET_IRQ.

That works because of the assumption that the IMS sources are going to
re-use addr/data pairs setup in the MSI CAP.

That assumption is frail, and won't work at all under the proper IMS
support Linux now has.

I really don't want to go down the road and have someone tell Thomas
he can't convert the Linux driver to use irq_domain IMS because it
will break this stuff here.

> I have no specs for this device, nor any involvement from the device
> vendor, so the idea of creating a vfio-pci variant driver to setup an
> irq_domain and augment a device specific SET_IRQs ioctls not only sounds
> tremendously more complicated (host and VMM), it's simply not possible
> with the knowledge we have at hand.  

It seems like you have reverse engineered alot of the necessary
information though??

Maybe there is a more generic approach than a variant driver. If you
wanted to use IMS from userspace generically you could imagine some
kind of IMS focused "SET_IRQ" in generic VFIO. Where we'd create the
needed irq_domains and pass the addr/data pair back to userspace?

> I observe that the device configures MSI vectors and then writes that
> same vector address/data elsewhere into the device.  Whether the device
> can trigger those vectors based only on the MSI capability programming
> and a secondary source piggybacks on those vectors or if this is just a
> hack by Qualcomm to use an MSI capability to acquire some vectors which
> are exclusively used by the secondary hardware, I have no idea.

Well at least that should be testable - but it seems crazy if the
device has registers for an addr/data pair and then somehow doesn't
use the values that get put in them??

Copying from the MSI is almost certainly a SW hack because IMS support
has never really existed in an OS until now. I think your guess for
why it is like this is pretty good.

> I do not believe that introducing a vfio device feature that disables
> virtualization of the MSI address/data _only_ at the vfio interface
> (not to a QEMU VM) provides some implicit support of this device
> behavior.  These values are already available to a privileged user in
> the host and the same is available for an MSI-X use case by directly
> reading the MSI-X vector table.  

To be clear, I'm not really worried about showing the data to
userspace.

Userspace just shouldn't be using it to implement an IMS technique!

Jason

