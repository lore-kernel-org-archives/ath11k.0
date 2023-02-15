Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EB6C636D4
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljtbgtQBDezjCUtKxMJOvecZ2LKxnM/Xx1wHU5CyPac=; b=sm7DW3rCWHPUT8
	f3C7WyH1c97IEnhS6eJqAOxbJPXHAxwYxBHrvb5xoy7xXVeiw8E/CqydmUzjEt+RMESEEpHKpTiw/
	VNbE2wYchQi0GS+OEzW+GBVZuzHdd2z4GgWGT5E6NOfPZMz7yhdDGWtnKyKIQBb98vxEhTYZ+s5cO
	yoU6rtNxyiXVmyhSArH89V3TRlBzhQinUg/87BUE/NhDtANGNELYOGMVSeaJus1Ut3VxoN4daJuQ6
	c90YkHgAIsxlBminub5Q6QNf4pPUFIDDHQHBzqDi+08z3RkACK99dXPetbV6ZnnySech8Odqe5y0b
	WqqmwnJ6/xYuqjCj3Qzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDxv-005JLW-EK; Wed, 15 Feb 2023 09:20:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDxs-005JKu-8c
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 09:20:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85C2D61AAC;
	Wed, 15 Feb 2023 09:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1BDC433EF;
	Wed, 15 Feb 2023 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676452834;
	bh=Jt5DUStOEmk5w/BYYwhYygZzaYSOPFSzK38JsRhc78g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MFlZE4HrSchDvpAyZtA2wxp95Aup5L28sHdvpudAHHsZ5hUVsfU12IwoQXqEcdQkk
	 UuiRDxAJk+cDlFFKvnKW2ExF/OnIH/BgG/J39u0CqhXuOZjZl8nK8BW5MjX1DufGJr
	 4TiCwCXDlibM0D7+mLCC6C831FWPkoWVyNaakYxdrbrLbuLcR1q53LXE+WGv5Nec2n
	 v3qsAxnHnwgJhYOunBdcM445oay64d8ADWm4CcYb5t+2BAfYv2ftDipQ42bAkAVcUD
	 Zc+ygkoghOc5kNx+NoIM8zaXxw7paQ3nZp0Qsu6XpXiwzX7vaAzOYNNdXthqDjFbzc
	 1mUCMP2MbPSqg==
From: Kalle Valo <kvalo@kernel.org>
To: Carsten Hatger <xmb8dsv4@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: FIX: Frequent wakeups on HP Pro x360 435 13.3 inch G9 using Qualcomm FastConnect 6900
References: <CACp=KFTTOpKzDkMuGyYm3ynF53nqHLwdAqt79mMJLpCyTyy-Zw@mail.gmail.com>
	<87y1p1vjnl.fsf@kernel.org>
Date: Wed, 15 Feb 2023 11:20:29 +0200
In-Reply-To: <87y1p1vjnl.fsf@kernel.org> (Kalle Valo's message of "Mon, 13 Feb
	2023 14:23:26 +0200")
Message-ID: <874jrnuvxe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_012036_365270_68CA1C3E 
X-CRM114-Status: GOOD (  11.88  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Carsten Hatger <xmb8dsv4@gmail.com> writes:
>
>> To whom it may concern:
>>
>> I was experiencing frequent wake-ups from s0i3x on a HP Pro 435 G9
>> convertible [1] using the Qualcomm FastConnect 6900 SoC [2]. The issue
>> is related to FW revision
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 that comes
>> bundled with Ubuntu 22.10. It appears the SoC increasingly triggers
>> wake-ups after being suspended for approx. 4 hrs.
>>
>> Read the full story at [4].
>>
>> The solution is to upgrade SoC firmware to rev
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23/ [3]
>>
>> Best regards,
>> Carsten
>>
>> [1]
>> https://support.hp.com/us-en/product/hp-pro-x360-435-13.3-inch-g9-notebook-pc/2101144107/document/ish_6053745-6053789-16
>> [2] https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6900
>> [3]
>> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>> [4] https://gitlab.freedesktop.org/drm/amd/-/issues/2377
>
> Very good to know, thanks for the info. I'll try to submit that firmware
> to linux-firmware ASAP.

Here's the pull request:

https://lore.kernel.org/ath11k/878rgzuw37.fsf@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
