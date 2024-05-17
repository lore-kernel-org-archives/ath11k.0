Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67704C04FFE
	for <ath11k@archiver.kernel.org>; Fri, 17 May 2024 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdtMMQ8cQ2XYIb8lewjt4PyIj03+SAtUIDDQvcJbRD4=; b=B0ziUuFFNoWzcz7/tHajdBQ0b1
	Uq/sfjLr8AiePprmxh966hsrX9qoAy8U0j6DYwI2z/6QVybfAtzK0oFZ2UorWUbBDT8rMaIG7mhjy
	pCBdie7QwfzepJqszi19zdmP+jE2NYJymY6BLtDteBRxfUVfobrxfsyAahDP+E85E5oMnUEYd9i1H
	FYN1r9krqm3cmw2paQdgAm2WWvAoy7uwHTy0uK2p4zZ5m6hXYNsfPmtupxYqoeXg9GK+g2WmYa8y5
	Fj/FLMr0CRNBUTt8qwisoxQFMkszJvKbdupnFP5DbiP5Ugs1r1QwsT9yoH369YGH0Zn4uB5Q3B5ig
	tOMFFbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7sBc-000000075ET-3s4j;
	Fri, 17 May 2024 07:39:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7sBY-000000075DO-2qQu
	for ath11k@lists.infradead.org;
	Fri, 17 May 2024 07:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B5B0CE1801;
	Fri, 17 May 2024 07:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB02DC2BD10;
	Fri, 17 May 2024 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715931559;
	bh=tXV0yYKpvKn/RfGN/Y44iVcXp2iZr9dOA16KJTdqPm8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Kh54zjZqNXQhFKCFgh2n3rWBHho8Gk5KJ9BNVt4kvCLZHXt6ySYnGrIs2c5dEc16Z
	 QOFUSo0SH7hs1Zcusgyre8dMkVfpj+hJL6B4GJl34nYG1lhqMY6W6PcX1BP7d4E6yE
	 5itjmvJ0wo9su+l0+dG9cuVhqZGpqR6e0ta+enNMrPcS834lZeW1H/6smBUfBQqwRs
	 X1sTvOHeB1XvAODlc9AqRU2fCXPrJpAkI2rtYIloqpr2erf92RDHWVp6CCVFK5wAh5
	 JA1yQjX3A0z0lxmnlI+4qXO2d8CQ1u/QTgj5E+bffipWep4DO2aLnrYIArmYsl+ktZ
	 f66ujMs4vVBUg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Linux regressions mailing
 list <regressions@lists.linux.dev>,  Carl Huang
 <quic_cjhuang@quicinc.com>,  Luca Weiss <luca.weiss@fairphone.com>,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
	<20230714023801.2621802-2-quic_cjhuang@quicinc.com>
	<D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
	<93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
	<871q69lqh5.fsf@kernel.org>
	<4e21e556-527f-4d1e-aa29-cacec14155af@quicinc.com>
	<a53e2188-b982-44b7-9dfe-f5dfd6b802ca@leemhuis.info>
	<4d72f74a-b2eb-43d3-92a2-1311081ce72c@quicinc.com>
	<87fruhggcw.fsf@kernel.org>
	<613ecd58-9f65-4d03-98df-40f3959376d6@leemhuis.info>
Date: Fri, 17 May 2024 10:39:15 +0300
In-Reply-To: <613ecd58-9f65-4d03-98df-40f3959376d6@leemhuis.info> (Thorsten
	Leemhuis's message of "Fri, 17 May 2024 08:04:26 +0200")
Message-ID: <874jawhopo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_003925_146205_016F91F0 
X-CRM114-Status: GOOD (  19.43  )
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> On 17.05.24 07:25, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>> On 5/16/2024 4:45 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 11.05.24 05:12, Carl Huang wrote:
>>>>> I'll send out the formal patch next week.
>>>>
>>>> Hmmm, from here it looks like this did not happen. Did I miss something,
>>>> is there some reason to reevaluate things again, or did this maybe
>>>> simply fall through the cracks?
>>>
>>> Formal patch is still under internal review
>> 
>> BTW I'm also experimenting with regzbot to help me track regressions in
>> wireless and to avoid missing important fixes.
>
> Not sure, but I tend to think that's still too early; better wait a few
> more months.

FWIW I have been pretty happy so far and would prefer to continue using
it with wireless drivers regressions. But of course if it's better for
you I'll stop for now.

>> Thorsten, I don't know if you take wishes but it would be nice to have
>> in regzbot some kind of filtering per subsystem or label. Maybe
>> something like this:
>> https://linux-regtracking.leemhuis.info/regzbot/mainline/?subsystem=wireless
>> 
>> And then a have command for regzbot setting the subsystem (or a label).
>> That way I could easily see only the wireless related regressions, now
>> it's harder to find them from the list.
>
> I listen to wishes, but in this case the idea is not new: exactly
> something like this is pretty high on my todo list. But there are still
> two other things on top of it and requires some major reworks; and I
> currently also don't find much time to work on the code. :-/ But sooner
> or later I'll get there!

Trust me, I know how it is :) These are just wishlist stuff and low
priority.

One more to the wishlist: refreshing the HTML page once an hour or so. I
now keep the regzbot page always open and it would be nice to have it
up-to-date without pressing CTRL-R. Yes, I'm lazy :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

