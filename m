Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6785BC25B10
	for <ath11k@archiver.kernel.org>; Fri, 10 May 2024 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBttVI//I1GvGFhhkrd/dsq3nmY/RZ+U48rnEweG2wA=; b=mTyDKCJBqqFYwaoLIeQ4jjJsTa
	xCb9prqURsd1nX4g8Vc8APP0lwYlAFTQBy1rrBInWe64cQCPrIxoDfqVWZ+raBHvksacbaps6aJIC
	s+5t0rco0+1PFCeeT5Q1pG9nfZ8HwYqF2K4M/XtqdVgO0GRFfTJf4IHcrogyxdpKOOi60uoA5g6ng
	NNDYwWjpsGo1PRG/Ud5V02Upjzo1KnC0OShjDcuiGWseaxhc3PRLg+t9IBsQr6SVI6rhgKbkOhF5R
	1bNcQacKTn+/heOAVPMrmC65h8b9GFW3oDT1wvKB9toNWIoZzxwDxkgmQiz7RifH5g8+pxx1a9qYa
	i4zNDaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QkW-00000005T4G-0i7C;
	Fri, 10 May 2024 13:57:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QkS-00000005T3F-1aCq
	for ath11k@lists.infradead.org;
	Fri, 10 May 2024 13:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F11EFCE1DEB;
	Fri, 10 May 2024 13:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E710C2BBFC;
	Fri, 10 May 2024 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349433;
	bh=SRZxgrNyAWX83L2b3Fpq/g2RtgbTj4vvYCwVMmud+JA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HNmFT3idLNTooLyZJ486hvxgou+od5G9023yjgOVltyGiaE56GRH48CPaDwIA3R2Z
	 HhaHTK6R42/ngFDoytf2Ur13J1x1BqDZtiIMTzieOdwZLoaHULUPD3tmRmPKBVcvrA
	 ZY3cT84MF5guo6rmueyeDIUpObpyZ7Zd5GG5aGsyyOQcYkxWuwrK6S09HP5Gna6QJb
	 yOn3z1bWfvCVCM+sCI4gCd2+kaLAW6GWzQ7X8u1QPpLXCY7d9lN8/rKEGYde39tzyw
	 XU5BVjuLw/i/hvdUd8XMs1BHuoWE34km7tYbVbB4saaojn3Pm3hIF9dCrpbyyCWAza
	 E2cZLkIibhWDQ==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
	<20230714023801.2621802-2-quic_cjhuang@quicinc.com>
	<D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
	<93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
Date: Fri, 10 May 2024 16:57:10 +0300
In-Reply-To: <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com> (Carl Huang's
	message of "Fri, 10 May 2024 20:03:28 +0800")
Message-ID: <871q69lqh5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_065720_808132_0F242D28 
X-CRM114-Status: GOOD (  15.55  )
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

Carl Huang <quic_cjhuang@quicinc.com> writes:

> On 2024/5/10 18:18, Kalle Valo wrote:
>> "Luca Weiss" <luca.weiss@fairphone.com> writes:
>> 
>>> On Fri Jul 14, 2023 at 4:38 AM CEST, Carl Huang wrote:
>>>> Add hardware parameter support_dual_stations to indicate
>>>> whether 2 station interfaces are supported. For chips which
>>>> support this feature, limit total number of AP interface and
>>>> mesh point to 1. The max interfaces are 3 for such chips.
>>>>
>>>> The chips affected are:
>>>>   QCA6390 hw2.0
>>>>   WCN6855 hw2.0
>>>>   WCN6855 hw2.1
>>>> Other chips are not affected.
>>>>
>>>> For affected chips, remove radar_detect_widths because now
>>>> num_different_channels is set to 2. radar_detect_widths can
>>>> be set only when num_different_channels is 1. See mac80211
>>>> function wiphy_verify_combinations for details.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>
>>> Hi Carl,
>>>
>>> Unfortunately this commit breaks wifi on a QCM6490 smartphone
>>> (qcm6490-fairphone-fp5) and makes the board crash.
>>>
>>> Reverting this commit (plus for conflict resolution 5dc9d1a55e95 ("wifi:
>>> ath11k: add support for QCA2066") and 24395ec11707 ("wifi: ath11k:
>>> provide address list if chip supports 2 stations")) makes wifi work
>>> again.
>> Thanks for the report. So the broken commit is:
>> f019f4dff2e4 wifi: ath11k: support 2 station interfaces
>> This went into v6.9-rc1 so I'm guessing that WCN6750 support will be
>> fully broken in v6.9? Not good. And most likely Linus will release v6.9
>> on Sunday so it's too late to get a fix included in the final release.
>> Carl, can you fix this ASAP? Or should we just revert the broken
>> commits?
>> Adding this to our regression tracking:
>> #regzbot introduced: f019f4dff2e4 ^
>> #regzbot title: ath11k: WCN6750 firmware crashes during initialisation
>
> Kalle, looks we're not able to fix it before Sunday as I don't have
> WCN6750 setup to verify the fix.

We are so late in the cycle that we would have to send the fix directly
to Linus and ask him to apply the fix before he tags the release. I
prefer that we are on the safe side here and send the fix to v6.10-rc1
via the usual route (the wireless tree). We get more testing time that
way.

> The fix could be to define a dedicated function
> ath11k_init_wmi_config_wcn6750() for WCN6750. I'll send the patch out
> so others like Luca can have a try.

Thanks for the quick patches!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

