Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2223EC4345F
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32UddEEH/ABzniJANKQRw8CBrfB7EKYjnd7moyU61Lg=; b=ZBqBDQqKE8Z/HagwntligrY/os
	BoNI1LytMhxT2fb7jOFUMKfWhk6Z6jzdK/3NNGQyG8j1BISVeKmv4OfrND0uxJh/Yz5FgcNimPTLB
	9ZtFeHC8bvkrK7JC0HfTaJMoC4v+j+jwHaTI1gDrHjbvrlfFnk+2PWk0/Z6X0eyKaUvP+z095VP24
	gBEdrvvJKwQ+y1IFt8bZ4JHHRDep4Ln45pC6kuI1LyLjjIURaPKXJLKxQjMdGsqDmV1xDf2EIlLhj
	dVBIKluVu3oOXSiV7e8mTsrHKRR4jH/N1N3qD2ed46AuSxtelxCo41nKN2921uRHUUyhLHVEk0jeK
	vFsZBhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qpv-00000002siC-2dIx;
	Mon, 29 Apr 2024 13:14:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qpr-00000002sgp-0Mjq
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 13:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CC0960C86;
	Mon, 29 Apr 2024 13:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A041C113CD;
	Mon, 29 Apr 2024 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714396461;
	bh=FdRJiCn6ZyDAd2R8zbK2F1Wy9ITfBYOKeCJJnU4ZIJ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SGsWrzD72sAms6fPJvBtRjRYudRkLAvXAOJK9ejpgNkTXRw2klSFm3Cjvs02ewx7f
	 HP2tKO1/IEIjyIpf1xqInZRkcCeGlYFg05D4xt6+s5qWjDWzfYo4o695BOyFQFgPXL
	 wIUsUHxeuEzRdOMNRJ99meWowH/FdsGbAB6JSWRnqrEPvtwgihelZxLclk5A4+sswn
	 4/KgTbpv7qGt/4VWrvW5sAF7O7X03fIdyAWyKWQbi4BF88LTI9BTKrzD25LPmaMBx8
	 5+UDQwyY/G00T6By1O6monh/yZYUdhwIxes59zw3FaEuB3EyfI5uvU+ZC/K84ESdeD
	 c8851zgQEuSyA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Tanjeff Moos <Tanjeff.Moos@westermo.com>,
  openwrt-devel@lists.openwrt.org,  Felix Fietkau <nbd@nbd.name>,
  ath11k@lists.infradead.org,  Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
	<5e5c35eb-336b-4e92-b506-506e9fbeef7d@nbd.name>
	<2668032.usQuhbGJ8B@ripper> <87ttlvjk6l.fsf@kernel.org>
Date: Mon, 29 Apr 2024 16:14:18 +0300
In-Reply-To: <87ttlvjk6l.fsf@kernel.org> (Kalle Valo's message of "Mon, 26 Feb
	2024 17:53:54 +0200")
Message-ID: <87il00qpjp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_061423_254448_853077AD 
X-CRM114-Status: GOOD (  22.85  )
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

Kalle Valo <kvalo@kernel.org> writes:

> + ath11k, jeff
>
> Sven Eckelmann <sven@narfation.org> writes:
>
>> On Monday, 26 February 2024 15:50:44 CET Felix Fietkau wrote:
>> [...]
>>>> The Qualcomm bulletin[1] says "Patches are being actively
>>> > shared with OEMs".
>>> > 
>>> > Were these bugfixes made available for OpenWRT? Is there an established
>>> > procedure for such cases, where closed-source firmware gets bugfixes?
>> [...]
>>> > [1]
>>> > https://docs.qualcomm.com/product/publicresources/securitybulletin/
>> december-2023-bulletin.html
>>> 
>>> The fixes were not shared with OpenWrt. Qualcomm does not care about 
>>> OpenWrt support for their platforms.
>>
>> I've asked (using their qualcomm-cdmatech-support portal) for an official 
>> release of their WiFi firmware with all gathered bugfixes via 
>> linux-firmware.git. I got statements that the ath10k firmware is no longer 
>> supported + ath11k firmware is not developed further. But for some of them it 
>> is possible to request a release of the firmwares via Kalle's repositories. 
>> But also that Kalle's repositories are now replaced. Which seems to be 
>> confirmed by Kalle's statement [1] regarding the firmware-N.bin files on 
>> ath12k@lists.infradead.org .
>>
>> The new positions for firmware files were not revealed but I found a couple of 
>> places [2,3,4,5] in my search.
>
> Yeah, the ath1?k-firmware.git repos are being moved to
> git.codelinaro.org and we will send an announcement once everything is
> ready.
>
>> And to the request to get the latest versions released via linux-firmware.git 
>> (or maybe even only in Kalle's repositories), I got (some weeks ago) the 
>> answer "Let me check with our team.".
>>
>> It is rather hard to make statements about Qualcomm  - simply because it is 
>> not just a single person and I have no idea about the internal structures. But 
>> it doesn't seem to be the highest priority (for the "internal team"?) to make 
>> fixes available for everyone. I still hope that it is just delayed due to some 
>> unfortunate circumstances. But this is just the current state.
>
> Thanks for letting me know, I was not aware any of this. Me and Jeff
> will investigate and get back to you.

In case not everyone noticed but Jeff has now uploaded updates to
2.5.0.1 branch:

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/97e0d33fe3e0f708459a682b167014906719337d

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/04dd351414737ac14b3e381d3695b59f4de67eaa

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/2dda8ce67f65af54f86fb2f49316174841fa95f7

It's quite strange that they updated 2.5.0.1 branch first but my
understanding that there should be updates for the newer 2.7.0.1 branch
as well (2.7.0.1 branch is also in linux-firmware).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

