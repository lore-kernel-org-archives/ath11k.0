Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671AFC4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqkOOesbHwHW8UKX4K+pIefIMJJFaTYgVbF6WWSe0vs=; b=frAHio+epw5t0k/2OfFu1eXFeL
	rblEi2dyPmtHbT/QSPjPFhMw+BB/sxMYyaVvPSS6fIhfr8frsy+vtB3ItIPHPHDi8Dw4yTnXWhRyx
	X1zoOYWPt9J36M5zBIyAt4yMb2uctwiuR+m0ylNo2gv+PoEnBNE2o2X3AdZdPQ1op/PM1SJQf2zZo
	hXkegxv9oPNNlMqXuHyA9YDzNPsNDnmi4s1Pblxo1c+1FU2vJM9kXVB1VV8XUtzWPeRBtWz4ssWPm
	Kh+gBzvUfcqpSEcth14+Bk5cwzmM6MpaUOp0EYil9ISdBbly34/9Wlmz/j31X3GenInH1xqlwLRZE
	jMtevj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1n82-00000006Qai-3zxV;
	Tue, 30 Apr 2024 13:02:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1n7x-00000006QZh-44Dg
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 581DD614EE;
	Tue, 30 Apr 2024 13:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD2BC2BBFC;
	Tue, 30 Apr 2024 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714482153;
	bh=7RefU0LW50GJqUXCT9P581fjxjyoFrujW4uq9AM12II=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=np54be9qZSRWwOAehe1Xz23JviqhzRaEOtEuX12KbWWfi0kJ9uRApERzYjBqL4MJ8
	 fqMAb1rylsmFGsHaj8rhIDhyB0kgDbpxI6ZtvKxU+u7pQXy8lRfF2hUs5nZjKs0zdz
	 y2A5OLlelnhT3pegn/one//GDaEbN1FN+l+XteAylmi063VXIE4tjG2LTBB6rfwa0K
	 s/pi/7sB7cXjxDSnb7lEnaqYctFLuGgd6tj1Usyfa2s/r97RyST09KYVVe/pAvobww
	 4+uS2RHzAewqsbDP6YZXUIufimCf+pXcK4wltOA8LSBMNHRMZNMg84/AiUJEG2ovKO
	 vY786xW0gag8g==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Sven Eckelmann <sven@narfation.org>,  Tanjeff Moos
 <Tanjeff.Moos@westermo.com>,  openwrt-devel@lists.openwrt.org,  Felix
 Fietkau <nbd@nbd.name>,  ath11k@lists.infradead.org,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
	<87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org>
	<4889305.GXAFRqVoOG@bentobox>
	<CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
	<87plu7p77m.fsf@kernel.org>
	<CAOX2RU4wrz9WE01MuPaPShnK39O08__7k0xzYtdnC-1hTcVrzQ@mail.gmail.com>
Date: Tue, 30 Apr 2024 16:02:29 +0300
In-Reply-To: <CAOX2RU4wrz9WE01MuPaPShnK39O08__7k0xzYtdnC-1hTcVrzQ@mail.gmail.com>
	(Robert Marko's message of "Tue, 30 Apr 2024 10:56:03 +0200")
Message-ID: <87h6fjovfe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_060234_101740_8A8498ED 
X-CRM114-Status: GOOD (  19.65  )
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

Robert Marko <robimarko@gmail.com> writes:

> On Tue, 30 Apr 2024 at 10:48, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Robert Marko <robimarko@gmail.com> writes:
>>
>> > On Mon, 29 Apr 2024 at 15:37, Sven Eckelmann <sven@narfation.org> wrote:
>> >>
>> >> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
>> >> > It's quite strange that they updated 2.5.0.1 branch first but my
>> >> > understanding that there should be updates for the newer 2.7.0.1 branch
>> >> > as well (2.7.0.1 branch is also in linux-firmware).
>> >>
>> >> Yes, I also told them in the support ticket that this is from an older branch
>> >> than what is currently shipped in linux-firmware.git. But they told me
>> >> that they are working on newer versions (whatever that means) - but they
>> >> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then
>> >> step-by-step release it for newer firmware branches. It seem like that would be
>> >> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP
>> >> SoCs.
>> >
>> > I would like to point out that IPQ6018 doesn't even have anything
>> > newer than 2.5.0.1 available publicly.
>>
>> But I do see WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1 for IPQ6018:
>>
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.7.0.1/WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1?ref_type=heads
>>
>> And that release seems to be also in linux-firmware:
>>
>> File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
>> Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>
>> Am I missing something? Or did you mean IPQ5018 which only has a release
>> from 2.6.0.1 branch?
>>
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ5018/hw1.0?ref_type=heads
>
> Ah yes, sorry for the confusion, I meant to say newer than 2.5.0.1
> that actually works.
> All of the newer public FW than 2.5.0.1 that we tried in OpenWrt will
> just crash, we had the same issue with 2.6 and 2.7 FW on
> IPQ8074 and it was fixed in 2.9.0.1 but there is no 2.9.0.1 public for IPQ6018.

Ah, is the issue you are talking about this bug:

https://bugzilla.kernel.org/show_bug.cgi?id=216515

Or is this another issue?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

