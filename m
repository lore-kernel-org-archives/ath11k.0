Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4662DC52D7B
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLYNakiS7XZO9BB9N7Fyevs65e05aWL1XGxAXFuVTVk=; b=EO0Nkd/FpV4OFDF97QtnYX3g/G
	+ln2V/k0zN/QueOTRuJB+uEslNfzxm1x5CPdqB65FBbwv3Lc9zw3zDyATYGZxsP26p9eW0yHWOOzf
	XcfqbT/BlhZjYLQKOFQJQaQun2ULGWZhd4hidjGnuW2Big4tidv4MX+OZSuYEIRDXg39iWdVNmynr
	SZJ5XlQVHBIbtNedT6l4Qj8oa4y4DeSmr2dWL04/ReWaEvdPylhoI4YG84nZpd+KtrdRRCyOLqFy9
	kqMQayYRyiLdAeDA0WZvKMulOcA7QbMk7kjhV9H2kzLbnkKG+2xzV3HP7fSjIazmxTyQFdlSRAGVj
	npPXfJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdvMC-00000004Vqv-1oRh;
	Tue, 13 Aug 2024 17:30:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdvM5-00000004Vld-02qp
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 17:30:49 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723570241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLYNakiS7XZO9BB9N7Fyevs65e05aWL1XGxAXFuVTVk=;
	b=Mt41DhNpxne5dyvSWgRTV6r+1D1ctf2j+254poZWoREb4GDghU04Y2szQGHLkI3gN7t4kM
	v6wEkhb2pXN7567WzcsGBuMdCtGXkJwAmFVkrHczTaZuaDXITsJfa20vPfdyK0kksWotLb
	c8Khw3bmVQBOyfxb/Qx5CnNyyZwU0Jl6DrVXgq5G//8pgMvoSFPBeDntPX/Sq1bqmLAfFi
	3uc9S/l86hXzj0IgNLXdAD3y/0sl6+VKbknoEx/OnamdPsNtVl227kKLOgMbIKDWedXBPD
	N2871RW+cIpw9nXcr5qrvIkzDDnToTwCEya6tLvbvzJdNnpGI4+cSYznQXAAsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723570241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLYNakiS7XZO9BB9N7Fyevs65e05aWL1XGxAXFuVTVk=;
	b=UUeC+kSbV/jkQoPN5g2XCYL6IeWXke547KIvgCJIkeRYW1M/RBV5YV7R8JmQCcz7gS6exg
	20LAmw5r7AVtNzCg==
To: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson
 <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, quic_bqiang@quicinc.com, kvalo@kernel.org,
 prestwoj@gmail.com, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, dwmw2@infradead.org, iommu@lists.linux.dev,
 kernel@quicinc.com, johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
In-Reply-To: <20240813163053.GK1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
Date: Tue, 13 Aug 2024 19:30:41 +0200
Message-ID: <87r0aspby6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_103045_210954_143FE8E3 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, Aug 13 2024 at 13:30, Jason Gunthorpe wrote:
> On Mon, Aug 12, 2024 at 10:59:12AM -0600, Alex Williamson wrote:
>> vfio-pci has always virtualized the MSI address and data registers as
>> MSI programming is performed through the SET_IRQS ioctl.  Often this
>> virtualization is not used, and in specific cases can be unhelpful.
>> 
>> One such case where the virtualization is a hinderance is when the
>> device contains an onboard interrupt controller programmed by the guest
>> driver.  Userspace VMMs have a chance to quirk this programming,
>> injecting the host physical MSI information, but only if the userspace
>> driver can get access to the host physical address and data registers.
>> 
>> This introduces a device feature which allows the userspace driver to
>> disable virtualization of the MSI capability address and data registers
>> in order to provide read-only access the the physical values.
>
> Personally, I very much dislike this. Encouraging such hacky driver
> use of the interrupt subsystem is not a good direction. Enabling this
> in VMs will further complicate fixing the IRQ usages in these drivers
> over the long run.
>
> If the device has it's own interrupt sources then the device needs to
> create an irq_chip and related and hook them up properly. Not hackily
> read the MSI-X registers and write them someplace else.
>
> Thomas Gleixner has done alot of great work recently to clean this up.
>
> So if you imagine the driver is fixed, then this is not necessary.

Yes. I looked at the at11k driver when I was reworking the PCI/MSI
subsystem and that's a perfect candidate for a proper device specific
interrupt domain to replace the horrible MSI hackery it has.

> Howver, it will still not work in a VM. Making IMS and non-MSI
> interrupt controlers work within VMs is still something that needs to
> be done.

Sure, but we really want to do that in a generic way and not based on ad
hoc workarounds.

Did the debate around this go anywhere?

Thanks,

        tglx

