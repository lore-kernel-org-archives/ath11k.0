Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0694CC47DAF
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ojb/BkssJXnY53bJxstuYoB/xCo93EEKG5tDFtlPRM=; b=1dSaFa38zWyP9x
	oTD1oyum0+jMnCySY1d/c618oAT23OtmwsRVEiSOerBHstguSvaTic67Xo5yKtdjLhS88A1EZzndB
	NSmcU1A6tzAjp8cN6XwYiED/6/p99pFZvyMBdGt2Cjvf9aS1IS4aXK0SJ/Vg9UkYxQvWHArNlso1H
	DSqSGQJAKS0eCMwGX0kWqCKbD+yHn+wSR2omQVDnXR9tDjfKLd3RRuegUs5tn/LErpGOwxSxqtJXX
	MJ2PcH7czf6Ms/Wn+H/ElELMnEZhr0F1AyOrPbQVdfesI5+BqhTltUthv/UYI/hNX7AWc4FFv4aeT
	aRIIPM8rU/r6weLi7pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpHP-00Ay3v-25;
	Mon, 22 Jan 2024 08:03:39 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpHJ-00Ay2m-2l
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 08:03:37 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rRpHD-00034m-MQ; Mon, 22 Jan 2024 09:03:27 +0100
Message-ID: <94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
Date: Mon, 22 Jan 2024 09:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] ath11k broken in v6.7
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
 <878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <87jzo13jmf.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1705910613;0a956d7f;
X-HE-SMSGID: 1rRpHD-00034m-MQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000334_030853_0A544889 
X-CRM114-Status: UNSURE (   8.59  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 22.01.24 08:36, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
>> Kalle Valo <kvalo@kernel.org> writes:
>>> Kalle Valo <kvalo@kernel.org> writes:
>>>
>>>> Just trying to make everyone aware because I suspect this will affect
>>>> quite a few people: ath11k is crashing during suspend on v6.7 due to a
>>>> mac80211 patch, more info:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=218364

Many thx for the heads up, much appreciated. Sorry, forgot to add it to
the tracking myself: during the merge window thing are sometimes a bit
chaotic for myself as well. And I was head-down in rewriting some parts
of regzbot (see below).

>>>> Proposed fix:
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/
>>>
>>> The fix is now applied:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>>>
>>> I'll try to use regzbot for the first time, let's see how it goes:
>>>
>>> #regzbot introduced: 0a3d898ee9a8 ^
>>
>> Forgot to include the bug report:
>>
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218364

FWIW, that usage was slightly off and not how it's supposed to be done.
But whatever, let's ignore that. I'm reworking things currently
slightly, as you are not the first one that slightly got mislead -- and
the newer commands will hopefully be mire intuitive.

> #regzbot fix: 556857aa1d0855aba02b1c63bc52b91ec63fc2cc

Great, thx. Hope it reached mainline soon. Maybe once it's there you or
I should tell Greg to pick this up quickly for stable given that it
apparently "might affect quite a few people".

Thx again!

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

