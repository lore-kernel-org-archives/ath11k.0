Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BDFC433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 11:36:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A01F460FBF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 11:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A01F460FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDAn9NFb0MhR+GPV0272SS+IAdLj6fwB+jxOf/oYxVM=; b=IbRBsxcArlbDIv
	vz01EFluo87rJaDrt6oE5Bf2+UlWYK2uUE/QhBaawz6x67lljuGybE0R9Y/lMznKPRDL5oMLUjpUU
	1roFs8/qX6yTRb/v/4ZXiKW12/S7GSvUe3uyb1VQAoc8W5jaCoanYTX0l7ItcmIOXekomlYAN6AUG
	cUFQEqbYbbzScCLhSTj1lwUTRtkwv4NGg4lxImvkQtctBcSlFWt24oic7M1JCtnCc6GjU4Yxlv8j7
	qA9FGq6lyaz1UBly+9ZbqI1iFFHWh1mC2i051h2kFN45/Og/md1T8fwFUwB4kPa+PH2Ut1T1oWRfB
	gS5UaPF1plWeY8ofgbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlUr4-00A9NY-T2; Fri, 12 Nov 2021 11:36:26 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlUr1-00A9Mr-LP
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 11:36:26 +0000
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mlUqw-0005bg-KI; Fri, 12 Nov 2021 12:36:18 +0100
Message-ID: <be20e91d-9285-b044-e415-c3728c399c1b@leemhuis.info>
Date: Fri, 12 Nov 2021 12:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
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
 <20211021100305.GD7580@workstation>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
In-Reply-To: <20211021100305.GD7580@workstation>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1636716983;
 fd2e92a2; 
X-HE-SMSGID: 1mlUqw-0005bg-KI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_033623_904733_AFC6F04F 
X-CRM114-Status: GOOD (  19.38  )
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

On 21.10.21 12:03, Manivannan Sadhasivam wrote:
> On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
>> Kalle Valo <kvalo@codeaurora.org> writes:
>>> (adding the new mhi list, yay)
>>> Loic Poulain <loic.poulain@linaro.org> writes:
>>>>> Loic Poulain <loic.poulain@linaro.org> writes:
>>>>>> On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>>>>> At the moment I'm running my tests with commit 020d3b26c07a reverted and
>>>>>>> everything works without problems. Is there a simple way to fix this? Or
>>>>>>> maybe we should just revert the commit? Commit log and kernel logs from
>>>>>>> a failing case below.
>>>>>>
>>>>>> Do you have log of success case?
>>>>>
>>>>> A log from a successful case in the end of email, using v5.15-rc1 plus
>>>>> revert of commit 020d3b26c07abe27.
>>>>>
>>>>>> To me, the device loses power, that is why MHI resuming is failing.
>>>>>> Normally the device should be properly recovered/reinitialized. Before
>>>>>> that patch the power loss was simply not detected (or handled at
>>>>>> higher stack level).
>>>>>
>>>>> Currently in ath11k we always keep the firmware running when in suspend,
>>>>> this is a workaround due to problems between mac80211 and MHI stack.
>>>>> IIRC the problem was something related MHI creating struct device during
>>>>> resume or something like that.
>>>>
>>>> Could you give a try with the attached patch? It should solve your
>>>> issue without breaking modem support.
>>>
>>> Sorry for taking so long, but I now tested your patch on top of
>>> v5.15-rc3 and, as expected, everything works as before with QCA6390 on
>>> NUC x86 testbox.
>>>
>>> Tested-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> I doubt we will find enough time to fully debug this mhi issue anytime
>> soon. Can we commit Loic's patch so that this regression is resolved?
> 
> Sorry no :( Eventhough Loic's patch is working, I want to understand the
> issue properly so that we could add a proper fix or patch the firmware
> if possible.

Lo, this is your Linux kernel regression tracker speaking!

> Let's try to get the debug logs as I requested.

That was 3 weeks ago. Afaics nothing happened since then (except the
other mail about this on the same day in this thread). Or did I miss
anything? And if not: How can we get the ball rolling somehow again to
get this regression finally fixed?

Ciao, Thorsten (carrying his Linux kernel regression tracker hat)

P.S.: I have no personal interest in this issue and watch it using
regzbot. Hence feel free to exclude me on further messages in this
thread, as I'm only posting this mail to hopefully get a status update
and things rolling again.

#regzbot poke

>> At the moment I'm doing all my regression testing with commit
>> 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
>> testing without any hacks.
>>
>> -- 
>> https://patchwork.kernel.org/project/linux-wireless/list/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
