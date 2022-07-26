Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E7CC43334
	for <ath11k@archiver.kernel.org>; Tue, 26 Jul 2022 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0q3m4Cgne1F0b9p800KqI5kjUvO3+9Pc3RTLvIGzqbc=; b=spjfv1G6Qgv2fk
	ytyM4wLTsb59/v7GoLYI4WKCANVznzMpIvbD4UbSZ6Y2VqZDuCL0M2fMPXd+/IIHl4Me/jaKgYP7w
	Bb0yrACXeQXrXJGHZQMR++StyaNIGLyL6BtcgDRbFw+Y+MLSMXmIXUK8CTDosRA5Z8nCyJ7w6zc0k
	ITFzaCVey3oOj/n8Iy+5I5xQBw7Ny9A0N9KeSTlgY2NqATq9Vqx21lmJovjQtIQ4hdpq9fFUHUd7F
	4QcANURjXmrjWPKeiD8QHQhGmOCY4VewYRLDRwEkjqEjwUsVH4nAc5XaBDki/taYeGxYdk9LPhsQL
	cwQDwLA9CKSxOnsz6+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFem-009wnd-Gw; Tue, 26 Jul 2022 08:11:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFd7-009vJP-MJ
	for ath11k@lists.infradead.org; Tue, 26 Jul 2022 08:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E0BBB8120F;
	Tue, 26 Jul 2022 08:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617B6C341C0;
	Tue, 26 Jul 2022 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658822960;
	bh=pG72duAPiTGl4achXEhxrKZ8ePu73MmI2EBcMCasz0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MP7YZkJNqzVBTuMJ789kv7my8rdAKEdZoFSR92Y+jTdj8W/yANme/XWGa2h1d4sUC
	 X0A197Rl2ijLZdlBJer8X2ikG1nMLIrjBenK7aFNz2Y6dgjt+qY5eBKd40H9VSbe03
	 Dlj7Z7lwSQ0Nqlqe3eNWFpP6RtlEk4EvTkmw85cCKFJA0y+dJ8atHlEnmf1V1iHBUU
	 +J1hbe4Pmh6Jp1AvyMQ00gm5DnhgxqYIjSz+nReeGOI3rk9RunnwoJxKFTwKyl8Fq7
	 /HprzjgZPSS3mqfeGpj8X+kNXF31rx22jd9qL3KLNANMX3X0sO3Cc1hibPpZsLY2qs
	 eareb8vgUAd+g==
Date: Tue, 26 Jul 2022 13:39:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, quic_hemantk@quicinc.com,
	loic.poulain@linaro.org, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4 1/1] bus: mhi: host: Move IRQ allocation to controller
 registration phase
Message-ID: <20220726080913.GF5522@workstation>
References: <1655952183-66792-1-git-send-email-quic_qianyu@quicinc.com>
 <20220624072740.GA12171@thinkpad>
 <87k08an038.fsf@kernel.org>
 <20220720093909.GA5747@thinkpad>
 <063fe6bf-11b1-1724-058f-0fed7247906e@quicinc.com>
 <20220721101914.GC36189@thinkpad>
 <87wnc1qdhz.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnc1qdhz.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010926_051235_B1FA976B 
X-CRM114-Status: GOOD (  31.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Jul 25, 2022 at 09:00:08PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <mani@kernel.org> writes:
> =

> > On Wed, Jul 20, 2022 at 05:47:37PM +0800, Qiang Yu wrote:
> >
> >> =

> >> On 7/20/2022 5:39 PM, Manivannan Sadhasivam wrote:
> >> > On Mon, Jul 18, 2022 at 02:15:23PM +0300, Kalle Valo wrote:
> >> > > + ath11k list
> >> > > =

> >> > > Manivannan Sadhasivam <mani@kernel.org> writes:
> >> > > =

> >> > > > On Thu, Jun 23, 2022 at 10:43:03AM +0800, Qiang Yu wrote:
> >> > > > > During runtime, the MHI endpoint may be powered up/down severa=
l times.
> >> > > > > So instead of allocating and destroying the IRQs all the time,=
 let's just
> >> > > > > enable/disable IRQs during power up/down.
> >> > > > > =

> >> > > > > The IRQs will be allocated during mhi_register_controller() an=
d freed
> >> > > > > during mhi_unregister_controller(). This works well for things=
 like PCI
> >> > > > > hotplug also as once the PCI device gets removed, the controll=
er will
> >> > > > > get unregistered. And once it comes back, it will get register=
ed back
> >> > > > > and even if the IRQ configuration changes (MSI), that will get=
 accounted.
> >> > > > > =

> >> > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >> > > > Applied to mhi-next!
> >> > > I did a bisect and this patch breaks ath11k during rmmod. I'm on
> >> > > vacation right now so I can't investigate in detail but more info =
below.
> >> > > =

> >> > I just tested linux-next/master next-20220718 on my NUC with QCA6390=
, but I'm
> >> > not able to reproduce the issue during rmmod! Instead I couldn't con=
nect to AP.
> >> =

> >> I suspect that in __free_irq(), if CONFIG_DEBUG_SHIRQ is enabled, irq
> >> handler for a shared IRQ will be invoked and null pointer access happe=
n.
> >> =

> >> #ifdef CONFIG_DEBUG_SHIRQ
> >> =A0=A0 =A0/*
> >> =A0=A0 =A0 * It's a shared IRQ -- the driver ought to be prepared for =
an IRQ
> >> =A0=A0 =A0 * event to happen even now it's being freed, so let's make =
sure that
> >> =A0=A0 =A0 * is so by doing an extra call to the handler ....
> >> =A0=A0 =A0 *
> >> =A0=A0 =A0 * ( We do this after actually deregistering it, to make sur=
e that a
> >> =A0=A0 =A0 *=A0=A0 'real' IRQ doesn't run in parallel with our fake. )
> >> =A0=A0 =A0 */
> >> =A0=A0 =A0if (action->flags & IRQF_SHARED) {
> >> =A0=A0 =A0=A0=A0=A0 local_irq_save(flags);
> >> =A0=A0 =A0=A0=A0=A0 action->handler(irq, dev_id);
> >> =A0=A0 =A0=A0=A0=A0 local_irq_restore(flags);
> >> =A0=A0 =A0}
> >> #endif
> >> =

> >
> > Ah yes, after enabling CONFIG_DEBUG_SHIRQ I could reproduce the issue.
> =

> So how to fix this regression? (If there's already a fix I might have
> missed it as I came back only today)
> =


Copied you on the fix patch. Please test and let us know!

Thanks,
Mani

> -- =

> https://patchwork.kernel.org/project/linux-wireless/list/
> =

> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

-- =

ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
