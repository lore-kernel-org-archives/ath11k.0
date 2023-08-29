Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24937C83F14
	for <ath11k@archiver.kernel.org>; Tue, 29 Aug 2023 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VYIKThfuK0TDBFMzJReLgvmo8QSbT/feWzNa2hyQR8=; b=R7pxfMt9gzre5q
	T5TRSYx/V7kjqk4Ip732ds3N6oGxJqAZ6tbJojGksQF2Dksn7TFOVgB3YG2pr7O8EzYawz67S9EIY
	X7qVvnWLqPCY29wzU73hiWlyGowsb6hSwkTRni3GoCwWueyq667s/Oy+BvV+u8uG3YivqPlPLUS4s
	Am+HqWQ06LQeBXcr6mLoaO/pBuxeSZwgyN/pFrSMfObt41vTrxbexdoz9/HrkGbkuQsbkpYQFxJVQ
	FY2rmW3eYBeZTwLq7sZTZKAoWWDoAJELc4/VWzwDyVZA0VeqwXUiiYojDmCMrhdlX0ip9iXrrHPVu
	uodDFKTR//mMpApjAJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxC3-00BRSe-08;
	Tue, 29 Aug 2023 11:47:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxC0-00BRS8-2X
	for ath11k@lists.infradead.org;
	Tue, 29 Aug 2023 11:47:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48FCA614B4;
	Tue, 29 Aug 2023 11:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42DAC433C7;
	Tue, 29 Aug 2023 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693309651;
	bh=2JIypwUK6FhIZ3QHAhrbsLajiBfjZ62lgJwSgVYXJYg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WpoxyfT96RrgWmxmpt0PCKw3+0p9AMvKZBdy3TXUdL05NbfuKsxK77tiGyJnGNJpR
	 gCGygjGrcu2CfbwyEtnC3unyQWxnfWRPgPW2rcGvRqZOPr5ZCLr66H480QkVADumGf
	 InSYuRL8On+eG8q/1uYOyJTBCfDVCb2KlPilpds3+dHyBMuhNysqkxgc+wxr1GlmVL
	 iXwL1UMc3X0KoIZljIw6IO1+ivfZ3oug14DW5RYpHh3LxbR9m0yUy7nLEpRxa8wCxJ
	 7VAMZeaEio82tcD6cbFptCLSLvY0SNF0whvzjsjTrm62OguXDmgW43D8ZdJG9fxxZY
	 xeuuLZ623t+QQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Bjorn Andersson
 <quic_bjorande@quicinc.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
References: <20230809073432.4193-1-johan+linaro@kernel.org>
	<ZONpkVU1ORHj-zFH@hovoldconsulting.com> <87o7izi6br.fsf@kernel.org>
	<ZOS7zdWNaqmfCHet@hovoldconsulting.com>
	<ZOof7EE0tXAt0YN7@hovoldconsulting.com>
Date: Tue, 29 Aug 2023 14:47:27 +0300
In-Reply-To: <ZOof7EE0tXAt0YN7@hovoldconsulting.com> (Johan Hovold's message
	of "Sat, 26 Aug 2023 17:53:16 +0200")
Message-ID: <87leduf4ts.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_044732_872291_15F0A94E 
X-CRM114-Status: GOOD (  26.03  )
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

Johan Hovold <johan@kernel.org> writes:

> On Tue, Aug 22, 2023 at 03:44:45PM +0200, Johan Hovold wrote:
>> On Tue, Aug 22, 2023 at 03:56:24PM +0300, Kalle Valo wrote:
>> > Johan Hovold <johan@kernel.org> writes:
>> > > On Wed, Aug 09, 2023 at 09:34:32AM +0200, Johan Hovold wrote:
>> > >
>> > >> Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
>> > >> the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
>> > >> splat once).
>> 
>> > > Any chance we can get the offending commit reverted before 6.5 is
>> > > released? 
>> > 
>> > The problem here is that would break QCN9074 again so there is no good
>> > solution. I suspect we have a fundamental issue in ath11k which we just
>> > haven't discovered yet. I would prefer to get to the bottom of this
>> > before reverting anything.
>> 
>> Sure, ideally we can find and fix the underlying issues these next few
>> days, but since this regression was introduced in rc5 in an attempt to
>> address the QCN9074 issue which has been there since 6.1 I think we
>> need to revert otherwise. 
>
> I've managed to track down what causes the hang on the X13s after
> disabling threaded NAPI. Turns out to be a severe regression in the
> genirq code that causes the software resend tasklet to loop
> indefinitely.
>
> I've just sent a fix here:
>
> 	https://lore.kernel.org/lkml/20230826154004.1417-1-johan+linaro@kernel.org/

Oh wow, that's a tricky bug :o I'm sure it was not easy to find.

> I've also made some progress on the QCN9074 hang, but keeping the
> threaded NAPI revert for now is indeed the right thing to do.

Ok, thanks for the update and looking at also this problem. Very much
appreciated! I'm sure we have a major bug lurking somewhere in ath11k,
would be so good to fix that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
