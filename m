Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09933C4725D
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 08:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3cG+TSRJua5Vjxjqlp6dpsQQc0W/gqByT2YYlA85vY=; b=qUcxSF/XQiMwYvfGqtVRrFVkBy
	BGlhl695BcQGTZhnGCEptMVihCD5vw99glGOjb4Vo3jQ52q5KQ97NkkiicLm8pjVJyTPvHBOn9HNE
	mu6/G/qhD91PjXDn2/s9Mg/f3TA+b/odH97HlPZ+WpbYKY0Kd1VajoDJ6S62EMbhCQIwDJvvgPDXL
	EoOQ0m9g+MdLPzpEAD79E+GwcH1gQRMbNAvpkjYqru36TC5ABC3+uXbefONPEXJIDJa8Dw68CNpbZ
	ZQEMo2wm2rJ6Cmm6ARbrilExkDims2BfOQ/kD7VACD7/MfpgCaHiVNZQkxxnk1erS/CroSPeiEUgs
	sFcEuUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpc5-00B2NN-03;
	Mon, 22 Jan 2024 08:25:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpc1-00B2M9-35
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 08:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E46B60F37;
	Mon, 22 Jan 2024 08:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3693C433C7;
	Mon, 22 Jan 2024 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705911867;
	bh=+DIt2XHxR6GWd87F4zF71KKoFdrIBtRWA2j/kw1c0rI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=U9yVUA7ussq3zLhB7QYCuHHjo7VA6uSyWsUtucbdkKJqLtHrXHCZlLTlb7AkP7x9p
	 KAnO6b7eHzgEZnbaVH84M6vxblFJiBQjCV3Md/2QS6ehAAok6VfACKisSOq9lDiEFO
	 LGPWTuyQ8KMbIYxXIAjwuODbhXn4lnGCm+1nScMmpYtqove6hSuQA4eJDdKLAbwlrJ
	 cLrE1P4eTzV5lr9tMUupqCbfR9NoomokJcdW9L5xBqXvaOHjb+wPYw6t1Jsswb7lXd
	 d7jqBa0Nz547WYXOZCzIp48mgmFtbuCNPKkDVT92lXDKZxrQQeXZ4ReZSKt5rpzN+s
	 zo/NZkZfZBsvg==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: ath11k@lists.infradead.org,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
	<878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
	<94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
Date: Mon, 22 Jan 2024 10:24:23 +0200
In-Reply-To: <94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info> (Linux
	regression tracking's message of "Mon, 22 Jan 2024 09:03:27 +0100")
Message-ID: <87fryp3he0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_002458_081568_C5913F14 
X-CRM114-Status: GOOD (  15.00  )
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

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> On 22.01.24 08:36, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>>> Kalle Valo <kvalo@kernel.org> writes:
>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>>
>>>>> Just trying to make everyone aware because I suspect this will affect
>>>>> quite a few people: ath11k is crashing during suspend on v6.7 due to a
>>>>> mac80211 patch, more info:
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=218364
>
> Many thx for the heads up, much appreciated. Sorry, forgot to add it to
> the tracking myself: during the merge window thing are sometimes a bit
> chaotic for myself as well. And I was head-down in rewriting some parts
> of regzbot (see below).

No worries, this was a good time to learn all this myself.

>>>>> Proposed fix:
>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/
>>>>
>>>> The fix is now applied:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>>>>
>>>> I'll try to use regzbot for the first time, let's see how it goes:
>>>>
>>>> #regzbot introduced: 0a3d898ee9a8 ^
>>>
>>> Forgot to include the bug report:
>>>
>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218364
>
> FWIW, that usage was slightly off and not how it's supposed to be done.
> But whatever, let's ignore that. I'm reworking things currently
> slightly, as you are not the first one that slightly got mislead -- and
> the newer commands will hopefully be mire intuitive.

Just to educate myself, how should I have done it? (But feel free to
skip the question if you are busy)

>> #regzbot fix: 556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>
> Great, thx. Hope it reached mainline soon. Maybe once it's there you or
> I should tell Greg to pick this up quickly for stable given that it
> apparently "might affect quite a few people".

I'll try to remember that but the thing is that I don't really follow
stable releases. I wish there would be a person who could follow stable
releases from wireless perspective and make sure everything is ok there.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

