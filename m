Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A754C4725D
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3XJQKOH+QNkDT5OMjON7lz8l9QTsq1Jp8Ev866yAn0=; b=r3uPrlncCVwWOoDVwxpr7+p4HG
	I4jufsHn3VDnqoBYdEaaQX5ZROiIj0GKW7HM2Sffj8z5r2liEszicV698zLZrxqGxpxWbbQDZCihZ
	3HRTqGl0K7FVXiMsq1T9wmbzvbKsgXdxALdmcvyj5ER5DUZI8v8OYRYeBm7ZqrZsAMCqLe08Kqaqx
	lc4ZeIZeHpjrBah10BVpdi11qltyi5KQMBVFS2JpuyOdeM3ON2T/pIlwechJQEdAfIL+CyMeG+xpA
	rcDOU8bkdAHAAb7+24UemSMSE7l+UQRPPuBplmMIffGuIhsJKPy15ERvquIzvEN2jHxpnB38TuQLV
	6CDNV3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrTY-00BVyu-04;
	Mon, 22 Jan 2024 10:24:20 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrTT-00BVr2-2q
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 10:24:18 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rRrTM-0008R4-F5; Mon, 22 Jan 2024 11:24:08 +0100
Message-ID: <0253854a-e5f9-4316-bec3-61aaf3ebfd1a@leemhuis.info>
Date: Mon, 22 Jan 2024 11:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] ath11k broken in v6.7
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
 <878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
 <94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
 <87fryp3he0.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87fryp3he0.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1705919055;82d64f6a;
X-HE-SMSGID: 1rRrTM-0008R4-F5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_022416_057698_1D922FED 
X-CRM114-Status: GOOD (  20.56  )
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

On 22.01.24 09:24, Kalle Valo wrote:
> "Linux regression tracking (Thorsten Leemhuis)"
> <regressions@leemhuis.info> writes:
>> On 22.01.24 08:36, Kalle Valo wrote:
>>> Kalle Valo <kvalo@kernel.org> writes:
>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>>>>
>>>>>> Proposed fix:
>>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/
>>>>> The fix is now applied:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>>>>> I'll try to use regzbot for the first time, let's see how it goes:
>>>>> #regzbot introduced: 0a3d898ee9a8 ^
>>>> Forgot to include the bug report:
>>>>
>>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218364
>>
>> FWIW, that usage was slightly off and not how it's supposed to be done.
>> But whatever, let's ignore that. I'm reworking things currently
>> slightly, as you are not the first one that slightly got mislead -- and
>> the newer commands will hopefully be mire intuitive.
> 
> Just to educate myself, how should I have done it? (But feel free to
> skip the question if you are busy)

I think that's not worth it, as I hope to introduce the new commands in
the near future (but you know how it is with the last 5 to 10
percent...). But let me show you how it's then supposed to be done in
this situation, that way you can give early feedback:

  #regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218364
  #regzbot introduced: 0a3d898ee9a8

That "#regzbot report" will be new and make it more obvious to users
what regzbot should consider to be the report (e.g. what Link:/Closes:
tags later in commits fixing the issue will link to). You used "#regzbot
introduced: 0a3d898ee9a8 ^" and due to the "^" it assumed the start of
this thread would be the report (side note: mixing that aspect into the
"introduced" command was a stupid idea anyway.).

That "#regzbot link:" will vanish as well (at least from the docs, it
will remain to be supported), as people use it wrong in various
different ways: for duplicates, reports (like your did), patch
submissions fixing the issue (then 'regzbot monitor' should have been
used) among others. Which is totally understandable now that I look at
it. That's why it will be replaced by "#regzbot related: <url>" to avoid
any connection with the Link: tag used in commits; for duplicates
"#regzbot dup:" will stay around.

>> Great, thx. Hope it reached mainline soon. Maybe once it's there you or
>> I should tell Greg to pick this up quickly for stable given that it
>> apparently "might affect quite a few people".
> I'll try to remember that but the thing is that I don't really follow
> stable releases.

Let me do it, it's easy for me. And FWIW, I don't even follow the stable
releases for that, I just drop Greg a mail when I notice the patch
reached mainline through the weekly net merge. He'll take care of the rest.

> I wish there would be a person who could follow stable
> releases from wireless perspective and make sure everything is ok there.

Maybe at some point regression tracking can help somewhat with that. But
I still have to fix a few things to make people use it and scale it up.

Side note: some people seem to have gotten the impression that I care a
lot about *all* stable/longterm kernels. Let me use this opportunity to
say that it's not really the case. I fully understand and respect that
those series are a somewhat separate thing some developers don't want to
be involved in (especially the older trees). But the thing is: the
latest stable tree is what we tell users to use -- and something quite a
few important distros ship as their regular kernel these days. That's
why I take special care of regression that found there.

Ciao, Thorsten

