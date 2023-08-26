Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A9C83F01
	for <ath11k@archiver.kernel.org>; Sat, 26 Aug 2023 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GN8p8DhqFuejGtCit3agiaKmf1FVNdo2esjd6xTr7xE=; b=oDooAXkcWM11lL
	mGmv2+HDgiVNi+JWcU/9vOuEM5Mmn+VmOcU7wEeWoc9SQ6HhxPzTxsSmJq8u6QVdNoB2pcPIHjZiY
	/wrhrce2f1guAjK7a6HaEmAPUrtVnqqgFhz+fZjfh0E55FmN0rdu4vMX20i1qlM0jByXQxcWWhuFq
	CTbCP2RNhAvF4kL6ZqJLATZKKz445YPn8AVMDgChRP1nxhPMKI+Tl1W4bp94qjwv0kJyeCH4681gw
	wONHYvgoyxvY2IX4C6JCMo0vDAVEJM4o3nUzKajCalaxgobXaGaVqsZln4PgfrvuEh3e02GZ+PDEY
	132rRG3BaUtEnVybnKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZvbF-007232-0w;
	Sat, 26 Aug 2023 15:53:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZvbB-00722e-0w
	for ath11k@lists.infradead.org;
	Sat, 26 Aug 2023 15:53:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20C916101A;
	Sat, 26 Aug 2023 15:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8408FC433C7;
	Sat, 26 Aug 2023 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693065195;
	bh=jRp5J5zfBMQENdgSowokFSlTIvvrIvYSssKqh8Hw7C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWeC7YdLlOfWmW9hf4SWWtktwWX8R7IW/D5JH/PvI7Yd51paYleLvUIvzA2QCIUbW
	 06Z5bcXAFTj3y8Ur04h4ew+JcDSB7hrkVZv8RT+vlWPiaxEKGyUPghLlCjahtQRD6K
	 SHEDpNidSXNPPR8vP2zIkX2CIj+esuy/SMsoXlLyZ3ofuteWHh3Re10WJmOQd3e4Ym
	 LXAalMWJFXf4OM95urH+pJDtYhugleVYvBu+LI4WHLutS0koLb7uPJlImSMrs1Nqib
	 nU9yLCDLkX5nD+Sp0ARk/tRvwuF8jQ2Wk7vE4HlcdGFVxUpQRozb/mH9lkmAjEeLt0
	 oVXq9iHyNQG1A==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qZvbA-0000QB-0P;
	Sat, 26 Aug 2023 17:53:16 +0200
Date: Sat, 26 Aug 2023 17:53:16 +0200
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
Message-ID: <ZOof7EE0tXAt0YN7@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <ZONpkVU1ORHj-zFH@hovoldconsulting.com>
 <87o7izi6br.fsf@kernel.org>
 <ZOS7zdWNaqmfCHet@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOS7zdWNaqmfCHet@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_085317_398168_98DC16AB 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, Aug 22, 2023 at 03:44:45PM +0200, Johan Hovold wrote:
> On Tue, Aug 22, 2023 at 03:56:24PM +0300, Kalle Valo wrote:
> > Johan Hovold <johan@kernel.org> writes:
> > > On Wed, Aug 09, 2023 at 09:34:32AM +0200, Johan Hovold wrote:
> > >
> > >> Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
> > >> the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
> > >> splat once).
> 
> > > Any chance we can get the offending commit reverted before 6.5 is
> > > released? 
> > 
> > The problem here is that would break QCN9074 again so there is no good
> > solution. I suspect we have a fundamental issue in ath11k which we just
> > haven't discovered yet. I would prefer to get to the bottom of this
> > before reverting anything.
> 
> Sure, ideally we can find and fix the underlying issues these next few
> days, but since this regression was introduced in rc5 in an attempt to
> address the QCN9074 issue which has been there since 6.1 I think we
> need to revert otherwise. 

I've managed to track down what causes the hang on the X13s after
disabling threaded NAPI. Turns out to be a severe regression in the
genirq code that causes the software resend tasklet to loop
indefinitely.

I've just sent a fix here:

	https://lore.kernel.org/lkml/20230826154004.1417-1-johan+linaro@kernel.org/

I've also made some progress on the QCN9074 hang, but keeping the
threaded NAPI revert for now is indeed the right thing to do.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
