Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88AEE4996
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YPwpORbkLN5jmI1dw2XKyyJl34Y8gk5j7rCU8YC4bQ=; b=4Id+nJLcscf/FZ
	9gxAXzNyg2EWNUR0U2lgEYOZqVXDXgi1goxhylksdZdyZ4K/9q/wiztRDGzK0HIinMnsI/JHbUEX/
	qxYrUx9simb/WqGrBboif9IiWoA43cjgQ/OOygl8LRHCXxfRQ6vE/dMU6B8Sh7W6P+CHLbPSMdnm2
	dOarr63IIvYEZuQWMTuRjewz/POpqRQc8NBSO/wLKEtxyauNKqIgN3WfKL6hmFxF4HmEMVdmyMj/+
	WSXdOMKpECmGLq+Gcvy2a8NPS/NfrA7/u4jTnb1MsGX///Vv/zu9Vq3JMQGMBsKbhC+Gge1wF1RYL
	drMfeactUZM05xPXx0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRgk-00G40F-2k;
	Tue, 22 Aug 2023 13:44:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRgi-00G3zY-1S
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 13:44:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A20A3656FD;
	Tue, 22 Aug 2023 13:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5439C433C7;
	Tue, 22 Aug 2023 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692711889;
	bh=0cUpYuMSDrgHXWCsxLU6JaxRi+nUtLLQl0WkRsCUSD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h58jkPrUVrFT5bYstrdcltlWZbIgg2BEJHzRk5VjfuWh2Ng/s0nztCnEUaNamBMwf
	 lkEXeAT4CB6TPXc2rAt0wtFb4WVAdF9b2A6t2/Wq2pfdflP1LOgAsNGGi0Bj4jf5Zr
	 3NIgbbbwCX5muM0uQqVp7svns0oyfuFItWU1DAb7tdZHKUJbiP20KQ3Fp8AP41jPMw
	 gY1vA9sGu4PcQafZIfNrm2Flvat/WdfcXTMeYu3w0FrknZAfsFIeiGcvHuUp+zTY1T
	 NEh98VVz4bCKTIhkWK21qXziaCUmA5l4E8GU+mrLvdPR/yHr2g2NW4rmrRaQAw2PAd
	 A+ikNfn/uGKIA==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qYRgb-000127-1r;
	Tue, 22 Aug 2023 15:44:45 +0200
Date: Tue, 22 Aug 2023 15:44:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Message-ID: <ZOS7zdWNaqmfCHet@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <ZONpkVU1ORHj-zFH@hovoldconsulting.com>
 <87o7izi6br.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7izi6br.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_064452_555668_6D47BDEB 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, Aug 22, 2023 at 03:56:24PM +0300, Kalle Valo wrote:
> Johan Hovold <johan@kernel.org> writes:
> > On Wed, Aug 09, 2023 at 09:34:32AM +0200, Johan Hovold wrote:
> >
> >> Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
> >> the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
> >> splat once).

> > Any chance we can get the offending commit reverted before 6.5 is
> > released? 
> 
> The problem here is that would break QCN9074 again so there is no good
> solution. I suspect we have a fundamental issue in ath11k which we just
> haven't discovered yet. I would prefer to get to the bottom of this
> before reverting anything.

Sure, ideally we can find and fix the underlying issues these next few
days, but since this regression was introduced in rc5 in an attempt to
address the QCN9074 issue which has been there since 6.1 I think we
need to revert otherwise. 

> > I'll take a closer look at this meanwhile.
> 
> Thanks, much appreciated. Did you try enabling all kernel debug
> features, maybe they would give some hints?

Yes, I have a bunch of those enabled. Lockdep does not complain, but the
hard lockup detector triggers and it looks like CPU0 (which handles most
interrupts on this machine currently) has got stuck while processing an
interrupt.

RCU also detects the stall on CPU0 and provides a task dump for
ksoftirqd with the following call trace:

	__switch_to
	run_ksoftirqd
	smpboot_thread_fn
	kthread
	ret_from_fork

I just tried the out-of-tree pseudo NMI series [0] to get a stack trace,
but CPU0 does not respond to those either when I hit this.

Note that it takes a bit of RX to trigger this, but I hit it as soon as
I try to download something substantial (e.g. after a couple of MB).

Johan

[0] https://lore.kernel.org/lkml/20230419225604.21204-1-dianders@chromium.org/

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
