Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71665CD11DF
	for <ath11k@archiver.kernel.org>; Thu, 28 Mar 2024 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34IdPJ2YjUqkOuthgegfpvX5HlFd0ZzxbNQAIIA7Ka4=; b=coCPpMXInhJiUWyOnZYCWKDqGN
	UrPd1G8MvE9lc6h+VPJs/Htb1YWVlh0BeWfoa7Dx4fK6DPEvUrZSuY5hWGIl7Ecg1llATOIOd6s/C
	1nbprXjBYyVvLzeAelYb82EOXkE2s02wTnElOQYK+7HkiUBBPwx2K2Iuh0SD6AdMvI8muqOeFKJ/+
	rETMp2Tz68UrYphpH40nH5HKJZz708PsWOgEAyrI89OZaBisR8XQrR/7MmdocsW0tpT8C/prq2Dcw
	JoC4pKw8iNUipJeYNjkXVZ7vkd9p29tAhTHih5LeXIBiV7l/2lf+UpsECZx2q93g9h+/FSYS1n548
	w7lgSRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpunw-0000000FFJy-04RY;
	Thu, 28 Mar 2024 18:48:48 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpunt-0000000FFHg-1WH1
	for ath11k@lists.infradead.org;
	Thu, 28 Mar 2024 18:48:47 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 447FF300079;
	Thu, 28 Mar 2024 18:48:40 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 9B5B113C2B0;
	Thu, 28 Mar 2024 11:48:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 9B5B113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1711651718;
	bh=CmB2h6S88adzHttfAYrKSEf4TP3tIHk7MJBcg9ErpW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T74uUOaYaRZa3U6sZ3vv6DBvwAel+fvNMJ490xACYVZWggN/GMg2FCYhxuveMnqpp
	 O14Qn2yiY1d62Ab3F0ZBO1bfiQcTJ6KZuXxDem4n3DM88low/AviAFUbjyF3ya8XwV
	 GXaVNib8j/t2waGOsLw75wo2tkC4cb5ebaGM8Tr4=
Message-ID: <b890c308-5d66-d9cc-ebff-17e8554f9a69@candelatech.com>
Date: Thu, 28 Mar 2024 11:48:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Hari Chandrakanthan <quic_haric@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
 <20240319134522.4021062-2-quic_haric@quicinc.com>
 <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
 <14699537-99b2-e468-6a7b-7b721193400e@quicinc.com>
 <b9dfab64822bacf0cc72380c0de034b79d489668.camel@sipsolutions.net>
 <68c6fcbd-0aaa-43b2-b5e2-08367c11e79d@quicinc.com>
 <f5cb9edcea875920e0ce156be76d06c78d1279ec.camel@sipsolutions.net>
 <4d569d40-d0a8-10d5-7e6d-4c9c03c14371@quicinc.com>
 <3f6de100163a8521ab09929abc537e57d26dafea.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <3f6de100163a8521ab09929abc537e57d26dafea.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1711651721-hBjz7CKCAwug
X-MDID-O: us5;at1;1711651721;hBjz7CKCAwug;<greearb@candelatech.com>;a91bce00847de6afce4cb86e1e327970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_114845_519063_3913B51E 
X-CRM114-Status: GOOD (  38.40  )
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

On 3/28/24 10:54, Johannes Berg wrote:
> On Thu, 2024-03-28 at 22:49 +0530, Hari Chandrakanthan wrote:
>> On 3/27/2024 8:37 PM, Johannes Berg wrote:
>>> On Wed, 2024-03-27 at 08:02 -0700, Jeff Johnson wrote:
>>>>> I'm also imagining that we change the API from cfg80211 to the drivers
>>>>> to get the *link* STA information, and do the summing up and/or "best"
>>>>> selection there in cfg80211 itself. However, I am prepared to accept the
>>>>> possibility that we may do _both_ in the API, if not all drivers can
>>>>> even do all of the statistics per link. We should probably still have
>>>>> the link STAs in the statistics in nl80211, but then they may not be
>>>>> populated?
>>>> First remember that there are a lot of statistics, and each driver is free to
>>>> return as many or as few as they support, indicating the ones they are
>>>> returning using the "filled" bitmap.
>>> Yes, I'd think we want to use the same data structure for both, though
>>> setting something in *both* links and *mld* would (should) be an error.
>> The statistics can be populated by driver or mac80211.(say tx retries,
>> tx packets etc)
> 
> Right.
> 
>> So we should also change the existing stats update in mac80211 on link
>> STA basis instead of deflink?
> 
> Absolutely, we need to do that, it's been on my list forever, since the
> early MLO work... I'm a bit torn between not wanting you to have to do
> all that work (even if we know that we'll have to do it) and on the
> other hand not wanting to make it worse with more statistics now ...
> There's no good middle ground here though now.
> 
>>> Good point, when they're really removed we'd want to probably keep that
>>> value as a bias for the MLD-level stats?
>>
>> ok. Then the statistics value in MLD STA would be bias + summed up value
>> of currently alive links?
> 
> I guess? But I'm not sure where we'd actually _keep_ the bias values.
> Maybe give up on that idea that cfg80211 could sum it all up, and just
> require the underlying driver (or mac80211) to report both per-link and
> total stats, where available? That way, mac80211 could keep the bias
> somewhere and just add it to the total before reporting _that_.
> 
>> On the same line , ethtool stats(*interface level stats*) in
>> mac80211(ieee80211_get_stats())
>> computes the stats by summing up the current STA statistics.
>> Here stations can come and go and the ethtool stats may not reflect the
>> total packets transmitted or received by the interface.
>> It just reflects the summed up value of current alive stations.
> 
> Yeah ... I know Ben loves it, but personally I kind of think of ethtool
> as a dead legacy interface for this respect, it just doesn't have the
> ability to reflect the required structures/hierarchy/etc. well since
> it's just a flat list. Sure you can structure the names in some way, but
> it's iffy at best. I'd just ignore that for now. If we have better
> statistics to nl80211, we can always make ethtool support on top of
> that, perhaps even moving it to cfg80211, if we even need more support
> there. I'm not hugely in favour, but if it stays contained somewhere and
> consumes existing APIs I'm OK with it.

I have my own hacks to make ethtool be minimally useful for MLO,
but I think it can be revisited later once the over-all MLO
architecture is solidified.

As Hari says, even without MLO, the AP's ethtool stats are not well
defined (it works better for STA vdevs).  Something that can also be fixed later after MLO calms down,
but my initial thought is to keep per-vdev counters that accumulate
any per-station counters and then the ethtool logic would not
try to sum the current stations but rather just grab the accumulated stats.

Thanks,
Ben

> 
>> Since these two problems are similar (ethtool stats and MLD stats
>> calculation),
>> would like to understand what type of value would be more useful to user?
>>
> 
> What do you mean by that?
> 
> johannes
> 

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



