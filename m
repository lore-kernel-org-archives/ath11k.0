Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A48C25B75
	for <ath11k@archiver.kernel.org>; Sun, 19 May 2024 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuvoHemgpgcqb4JrOqi04wT1VL8bVB7gZbpZmHmGq58=; b=g6vlsafxVq6rKt
	AHAF2+W+9VUCuZLtKLct+zSF96ipZnQAPR5gFKsoMcnrmNfYKx7saFMGIxE5IRBsqUymMrgn3aU/r
	ckV9kfr3wnZpgq8YDE+HzNsT69CtGSXeYCJzHSvXTLy1Yz33koz+brgpxov/+XA/3o+XJM/jI9CES
	vfYxjjTMp2kT1P24wM9V2rra3qHGAzObMP8JNf5dOLuh+M5UPGbOnDCzmJpDXugtw9nk5HhsZEo9N
	TdnQY4pf3yANhf+xJ4BXrALX6tYcwAtIkKRtJOvrg2i3Ru45Q+heDw10JSKD6cFHwqCfr0oEb1W7+
	+9/ohUTn3ZoFIj6JQfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8khI-0000000CR7d-33dF;
	Sun, 19 May 2024 17:51:48 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8khE-0000000CR6a-2wQI
	for ath11k@lists.infradead.org;
	Sun, 19 May 2024 17:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=EuvoHemgpgcqb4JrOqi04wT1VL8bVB7gZbpZmHmGq58=;
	t=1716141104; x=1716573104; b=DD8fC4KBeiROX/reCyxEA5EWBrzY6V68H1yE/hY6o70mBbq
	1OjRwhMckr2LEoQjedavQT6h8UxSid0TzYnlFKboEgHPohAjaFzuwhzmS7rk6GTBSf2T5UI4PoBL2
	ZG2rbnzc8GyzN4e48ZSJJVXxDXUZNMh+hWu0TWgjm/DcOJc6OVDeYbrSukrSrgZpdYvjknEDSye/v
	JFcyL3STke8KYdC1xWrZzUWFDEJPkF9k8ey8Ivfmkeezg04N+a/+jTARq1vEhPEKJ0ZNCGtsAI3FC
	afz8Rtomhhm14MMY4G8OpILhCWe7ptDlrll/5uc92xPP0Wsjg/R1EmzKnuhoZ2Cw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s8kh2-0003pw-T4; Sun, 19 May 2024 19:51:32 +0200
Message-ID: <80b102c5-2d49-41ba-a4e3-801e16f7f2bd@leemhuis.info>
Date: Sun, 19 May 2024 19:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Carl Huang <quic_cjhuang@quicinc.com>, Luca Weiss
 <luca.weiss@fairphone.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
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
 <874jawhopo.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <874jawhopo.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716141104;8f6adefc;
X-HE-SMSGID: 1s8kh2-0003pw-T4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_105145_099982_C9BD4763 
X-CRM114-Status: GOOD (  18.28  )
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

On 17.05.24 09:39, Kalle Valo wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
>> On 17.05.24 07:25, Kalle Valo wrote:
>>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>>> On 5/16/2024 4:45 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>> On 11.05.24 05:12, Carl Huang wrote:
>>>>>> I'll send out the formal patch next week.
>>>>>
>>>>> Hmmm, from here it looks like this did not happen. Did I miss something,
>>>>> is there some reason to reevaluate things again, or did this maybe
>>>>> simply fall through the cracks?
>>>>
>>>> Formal patch is still under internal review
>>>
>>> BTW I'm also experimenting with regzbot to help me track regressions in
>>> wireless and to avoid missing important fixes.
>>
>> Not sure, but I tend to think that's still too early; better wait a few
>> more months.
> 
> FWIW I have been pretty happy so far and would prefer to continue using
> it with wireless drivers regressions. 

Ohh, in that case just continue!

> But of course if it's better for you I'll stop for now.

No, not at all, making regzbot more useful for subsystem developers and
maintainers is the next important step, so I'm glad if it already works
well for you. And if something does not work, just tell me!

>>> Thorsten, I don't know if you take wishes but it would be nice to have
>>> in regzbot some kind of filtering per subsystem or label. Maybe
>>> something like this:
>>> https://linux-regtracking.leemhuis.info/regzbot/mainline/?subsystem=wireless
>>>
>>> And then a have command for regzbot setting the subsystem (or a label).
>>> That way I could easily see only the wireless related regressions, now
>>> it's harder to find them from the list.
>>
>> I listen to wishes, but in this case the idea is not new: exactly
>> something like this is pretty high on my todo list. But there are still
>> two other things on top of it and requires some major reworks; and I
>> currently also don't find much time to work on the code. :-/ But sooner
>> or later I'll get there!
> 
> Trust me, I know how it is :) These are just wishlist stuff and low
> priority.

Apparently depends on the point of view, as I think it's high priority.

> One more to the wishlist: refreshing the HTML page once an hour or so. I
> now keep the regzbot page always open and it would be nice to have it
> up-to-date without pressing CTRL-R. Yes, I'm lazy :)

Added that to the issue tracker to ensure it's not forgotten.

Ciao, Thorsten

