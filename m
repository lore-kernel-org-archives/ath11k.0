Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4AEE4993
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5OWCUGPz5aBEwiTcMDrHku5Wippt6IIjh1gK7p28+U=; b=y9+m1TwJdfxci8
	7vXoaoWXkAl5758C+fd0xcNWtBbSWs4NYPB2qmHoXeoKgCmscwdw1+aw3/XmetqbNYJ3x19URDrDh
	/Trw/aJKasPHRuCQW/bMVhoiH0Dkzkacp5WUtd9lDMZkIhI7g1vvT8QFLZidut+02Er6lSD85LeCC
	rrI6b8rHYsljrtT9PG0B+yhFHwFqKj/U+GIPGsmdgSdJV9PMe+yn47fUM0k7qVwf40aoSXTOkGoZ3
	VryzC6dnuYO9blIsgTz5W53k0SUitkoXkj/S2jsDp6lp/AV77wMc3QgKG3Eb4KPBwwbaOXNmecOCO
	fnGKD0TV3j+hgJs+/xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQw4-00FwNb-2u;
	Tue, 22 Aug 2023 12:56:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQw3-00FwMz-26
	for ath11k@bombadil.infradead.org;
	Tue, 22 Aug 2023 12:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4oi9RXnwxTpwSIx4jDXbMTYEdbbEnaXxnUTOHclOBgM=; b=msLHpLmVA/EWeqwF64u+N7+lMm
	jgMFwMqSGxJrBX4m6yZy9sXiM3hmTMjKXEkeCVpB6mSexjqRyYxeRRQGn/9OSSRjokHEqgdz/GHIX
	9YayqYjliJZpWuYIlujcj+gHAjXaT2G2eJWFPHU4777TN2DTEe55Dg8o+MTj8tdL2VSHqiKFwgWMh
	K4yrST8gQCB6IxmKKTTdy1mJ567yPQBWjn8fa02dA/peZOG2M2XDyRByGKQZJ36ABrXLR2QyqsYVE
	++2rrD1fqPvuqk2BNA9ETsZG75QmSIjkAtK74F10IGCdc6Fd4mDf3dJpG7oyJNweARuAvtnRskV2R
	dXcMApTw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQvz-002kyb-25
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 12:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3853864EE3;
	Tue, 22 Aug 2023 12:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF48C433C8;
	Tue, 22 Aug 2023 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692708988;
	bh=2WNX9QQVAoAuPFyHg3TYLIP+sACknmV5BgHbBDJLXhg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Kc9wbtP019ThJqTZl07TKJdIhRJV8MLPsBxb6Bpoaq511RbNdjQva/I5VkTXMePXq
	 xvFhDnBgHVwsbleZbHEy0Zy817mp44jSaT9epmtiPtNAx15KgjRkhjvm4kxHxLqpoa
	 tjuYkcSO08QKQcqSQm7TtkTaWtz/en9nCFU7MSChqqBrzdaMCABurvhXLLHDrBliPe
	 WSqZim9GcJwi/FxUl7jhuNm4cSGN37j2ScUwtYMtDD4avD/4LAqJf+a1GDBrK9fG7V
	 u/T8IHmkCUSd9709CN1Cn0XsigAmn4c2n76TC6tUWPGvPeaUe9QENW78p6z40y26Ue
	 wTaS/FD140PcQ==
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
	<ZONpkVU1ORHj-zFH@hovoldconsulting.com>
Date: Tue, 22 Aug 2023 15:56:24 +0300
In-Reply-To: <ZONpkVU1ORHj-zFH@hovoldconsulting.com> (Johan Hovold's message
	of "Mon, 21 Aug 2023 15:41:37 +0200")
Message-ID: <87o7izi6br.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_135635_866164_9FE96D39 
X-CRM114-Status: GOOD (  18.04  )
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

> Hi Kalle,
>
> On Wed, Aug 09, 2023 at 09:34:32AM +0200, Johan Hovold wrote:
>
>> Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
>> the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
>> splat once).
>> 
>> I'm supposed to be on holiday this week, but thanks to the rain I gave
>> rc5 a try and ran into this.
>> 
>> I've added Bjorn, Mani and Konrad on CC who may be able to help with
>> debugging this further if needed while I'm out-of-office.
>
> Back from my holiday now, and this regression is still there with
> 6.5-rc7.

I was also away but back now.

> Any chance we can get the offending commit reverted before 6.5 is
> released? 

The problem here is that would break QCN9074 again so there is no good
solution. I suspect we have a fundamental issue in ath11k which we just
haven't discovered yet. I would prefer to get to the bottom of this
before reverting anything.

> I'll take a closer look at this meanwhile.

Thanks, much appreciated. Did you try enabling all kernel debug
features, maybe they would give some hints?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
