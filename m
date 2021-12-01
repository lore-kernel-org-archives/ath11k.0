Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E48C433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzcF2aN+KSV6sj9/+suslHyvSNjOd1i9sICevqwSD8w=; b=y4O1eyt9/nvov4
	PpFkQku2oK4HT8sODMyZIvionXIdsFd9jC3/ymFj5gS/jEAbfFWXkhzJQBEoi93cIwhYlgd4kgT8T
	Gfab2XcfTCsatGRf1GPZQodpL3E5Y6pYKVLweZV90sFzdhYOhRGFn7AsRZnT8tuQIPqQiueCdmWMX
	rdJnSw5VKp6ugcpRl5HSAQbaQ5qnWLnqFuHgjGUOF8loPhR8dVLIudntnCrzOb2hwxJI8G2Z8xw7y
	dwUzr++5EWUZyNdk9D4KazVGYmtCPJSfPGiRdDW0rbaGNUYyOGLkG0680aRMi1YQnYMOL2m4fqHaE
	gErQZiQplfG5BwlJZveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msK8C-007gBT-2F; Wed, 01 Dec 2021 07:34:20 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msK87-007g7U-Fh
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 07:34:18 +0000
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1msK83-0000cS-8F; Wed, 01 Dec 2021 08:34:11 +0100
Message-ID: <915c3760-181e-bbac-aec4-1e20d0dab2a9@leemhuis.info>
Date: Wed, 1 Dec 2021 08:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-BS
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kalle Valo <kvalo@codeaurora.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, regressions@lists.linux.dev,
 mhi <mhi@lists.linux.dev>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 <87a6jl9ndo.fsf@codeaurora.org> <87ee8hgqni.fsf@codeaurora.org>
 <20211021100305.GD7580@workstation> <20211118174145.GA31300@thinkpad>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
In-Reply-To: <20211118174145.GA31300@thinkpad>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1638344055;
 a952094f; 
X-HE-SMSGID: 1msK83-0000cS-8F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_233415_749145_85608B95 
X-CRM114-Status: GOOD (  26.22  )
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

Hi, this is your Linux kernel regression tracker speaking, this time
looking for a status update.

On 18.11.21 18:41, Manivannan Sadhasivam wrote:
> On Thu, Oct 21, 2021 at 03:33:05PM +0530, Manivannan Sadhasivam wrote:
>> On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
>>> Kalle Valo <kvalo@codeaurora.org> writes:
>>>
>>>> (adding the new mhi list, yay)
>>>>
>>>> Hi Loic,
>>>>
>>>> Loic Poulain <loic.poulain@linaro.org> writes:
>>>>
>>>>>> Loic Poulain <loic.poulain@linaro.org> writes:
>>>>>>
>>>>>>> On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>>>>
>>>>>>>> At the moment I'm running my tests with commit 020d3b26c07a reverted and
>>>>>>>> everything works without problems. Is there a simple way to fix this? Or
>>>>>>>> maybe we should just revert the commit? Commit log and kernel logs from
>>>>>>>> a failing case below.
>>>>>>>
>>>>>>> Do you have log of success case?
>>>>>>
>>>>>> A log from a successful case in the end of email, using v5.15-rc1 plus
>>>>>> revert of commit 020d3b26c07abe27.
>>>>>>
>>>>>>> To me, the device loses power, that is why MHI resuming is failing.
>>>>>>> Normally the device should be properly recovered/reinitialized. Before
>>>>>>> that patch the power loss was simply not detected (or handled at
>>>>>>> higher stack level).
>>>>>>
>>>>>> Currently in ath11k we always keep the firmware running when in suspend,
>>>>>> this is a workaround due to problems between mac80211 and MHI stack.
>>>>>> IIRC the problem was something related MHI creating struct device during
>>>>>> resume or something like that.
>>>>>
>>>>> Could you give a try with the attached patch? It should solve your
>>>>> issue without breaking modem support.
>>>>
>>>> Sorry for taking so long, but I now tested your patch on top of
>>>> v5.15-rc3 and, as expected, everything works as before with QCA6390 on
>>>> NUC x86 testbox.
>>>>
>>>> Tested-by: Kalle Valo <kvalo@codeaurora.org>
>>>
>>> I doubt we will find enough time to fully debug this mhi issue anytime
>>> soon. Can we commit Loic's patch so that this regression is resolved?
>>>
>>
>> Sorry no :( Eventhough Loic's patch is working, I want to understand the
>> issue properly so that we could add a proper fix or patch the firmware
>> if possible.
>>
>> Let's try to get the debug logs as I requested.
> 
> I'm able to reproduce the issue on my NUC. I'm still investigating on how to
> properly fix this issue. Expect a patch soon.

Was there some progress? This issue was reported 75 days ago and still
is not fixed. From the point of the Linux kernel regression tracker I'd
say: it should not take this long. Looking back at it I wonder if
'reverted the culprit and reapply later together with a proper fix'
would have been the better strategy. I wonder if that still would be the
best way forward if no patch is forthcoming soon.

Ciao, Thorsten

#regzbot poke

>>> At the moment I'm doing all my regression testing with commit
>>> 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
>>> testing without any hacks.
>>>
>>> -- 
>>> https://patchwork.kernel.org/project/linux-wireless/list/
>>>
>>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave they thus might sent someone reading this down the
wrong rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
