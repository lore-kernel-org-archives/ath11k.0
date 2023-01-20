Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC9AC05027
	for <ath11k@archiver.kernel.org>; Fri, 20 Jan 2023 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fH9p7FWnSWLFBkelvwPn6D6uEgsdwdNT/08NaledavE=; b=3nUwGgMr74Z72y
	7ivmmISiZEeAKK0IEKrQdQA5ckiU7EH57NRxFjlUOf5PZM7mWjtctOyIMkcOGl9k6NhvaLK/brKDI
	GjCK0k5O5RsnS3THrDyQZA3NgJGHJcLOy+I9OgnSGDfWTwQQCpGNFHbByTAhyTcx1JnbaL/vvMQh3
	KvUZKkmAOpjqeLGgDtXBLo3zLRpNaxOe+1rYWDRFtPbtyfq7u17Fx9dcrA1lJzZaknYGGvPW7Bkhc
	DmJXO67JmmyKgK5dxAHo8aptqEc47zElc3NbaLw76PQ/iPww6OmM8j8YyiMG8Yb60KfWOPS1nso9V
	8OQ3dTsQ68jTAntjnMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIty8-00BAP9-Hz; Fri, 20 Jan 2023 16:10:20 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIty5-00BANb-3O
	for ath11k@lists.infradead.org; Fri, 20 Jan 2023 16:10:18 +0000
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmkjY-1ossYL0wNi-00jpAB; Fri, 20 Jan 2023 17:10:07 +0100
Message-ID: <17d8494a-ebae-e317-6096-c8621d0f33e3@green-communications.fr>
Date: Fri, 20 Jan 2023 17:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
 <Y8q5Z98S3pODD77W@lore-desk>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
In-Reply-To: <Y8q5Z98S3pODD77W@lore-desk>
X-Provags-ID: V03:K1:ObD765wio49tePRoLNkQoY65FCwoq76N2r4NslnAaTOOEu7KI1U
 WFvZ/6CpT4VOxURHjfWLzWNsbf5Jf6J76c08W5SXmIAl/7pn1Q9UFARbl4UZ/S68/mJIKUi
 uuIdpwhASY6iNHxNG1OZSzwTkUjm3jS++y0201Nfbd6jWQdHs/s3yK48uBqNTzkyReIPomq
 1h1wxZz7CsovK3JoYLUZw==
UI-OutboundReport: notjunk:1;M01:P0:FiYN9gKFjCE=;tI6JCKDhoFnMrHshqud2NXDEUPi
 YORbniZUfR8vEvcllZHxhjvnvYIUpgNCRWrZnMuaE7AtqfZtx1ImvIOvBmGY7Ww7vo8Vkqrnb
 K4AsuSiGOBq03PhShm6YnuXAJ0GfupOP1BF6YOUhmiAh9FmhORcKkuqzvbPID7+tol6F97sTy
 YycyghuZ96FQ+VNSQnR40F56OIaEKgGCc+knRvvRXyrgUYv7ASlFnJyiJmXYfsMruGF6XJ8v3
 n/kPGNyDiOh470Wz+PasGL5OftTgZ7b4GbDtPhRM8lxaZCsN3mTEObUekiAlDttXErTwyxQuR
 rlAuB/xv1XgVaYTYIdtXqSVoF9s97uSZe0n/NVfuuHIpRcieCs4hrig3C8JdjvVsDNfpynWW2
 u3SrLIqJdkxpagsp1iQhK83qcHONIaxeB6fViXCPh1mNBptRGdD5hnfFJvG8KCQQ276Mi/vc8
 z+YU7Ya0SNOrOvXF/oMn4fzCJO2l3qoJrkpuJum9Zv0XsTgHFv80VT46bCGHHqo+WLUPbPq6B
 ZOuD5lFEAHJg5U8fOVj0/Jto+u60Vno0oWy/7f7gbKzHaG+XEY+Qcck2LmPZ2rRXx2L4MW0jh
 GhZQo8pqJOofuKr0yzLIaPaE7YpOtqLQo37jvs3B1pzpYujLLCPN+GC2KBKP3rD07OOHjsoLI
 y2FCNORBoei3D3QcHPgimr/2PjQ0ZLKVjlQwhDYZkA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_081017_479507_328AC983 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 20/01/2023 16:55, Lorenzo Bianconi wrote:
>> On 19/01/2023 15:02, Johannes Berg wrote:
>>> On Mon, 2022-12-26 at 14:03 +0530, Rameshkumar Sundaram wrote:
>>>> As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
>>>> (BCCA) from AP and switch to new color, but some STAs aren't processing
>>>> BCCA from AP and not doing color switch, causing them to drop data
>>>> frames from AP post color change.
>>>>
>>>> Provide an option to disable color collision detection and therefore
>>>> not to do BCCA to mitigate the same from AP. If it's required in case
>>>> where STA supports BCCA handling, then it can enabled in AP using this
>>>> option.
>>>>
>>>
>>> You should probably split this into cfg80211 and mac80211.
>>>
>>> Also, this doesn't really seem to make a lot of _sense_ since nothing in
>>> the kernel actually acts on detection of a color collision - hostapd is
>>> acting on that.
>>>
>>> So since you can easily make hostapd ignore the event, why do you even
>>> need this?
>>
>> This may not be related, but the software color collision detection sends a
>> netlink message for every colliding frame and it can hose up the system if
>> the other network is very active.
>>
>> Also, cfg80211_bss_color_notify() complains that the wdev lock isn't held.
> 
> Hi Nicolas,
> 
> I agree, I think we can ratelimit netlink messages sent by the kernel to
> userspace (e.g. to hostapd), I would say every 500ms is ok.
> I guess we can move cfg80211_obss_color_collision_notify() in a dedicated
> delayed_work so we can grab wdev mutex (cfg80211_obss_color_collision_notify is
> currently running in interrupt context).
> To give an idea, what do you think about patch below? (please note it is just
> compiled tested so far).

I think it should fix the problem, I'll try to test it.

Thanks!

> Regards,
> Lorenzo


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
