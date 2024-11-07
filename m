Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A8AD5D674
	for <ath11k@archiver.kernel.org>; Thu,  7 Nov 2024 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anQ50U4LmtKYBh37Ysqyrz20pTLw4kZsaPojr3trpZI=; b=aK5BX8TG7USslpFceZ0kTkk1wx
	hQtK/mPzFcSSfxhi07EqgUvr1Mf7pk81RLZy5EFlHYCwVM9O7xl5Kehb2rEJFHhbhaE1v8muO5YHj
	t5WF5XNWmp8jNfo4abevuFt83wFyXpzym0NYzU0/bntFyeAOv8z7SUwI4N/rAxYB0xBQTMNqhd7z+
	5MLMlZ1D/OCmJm8Cbkk7OT3/RbwA6w1aff5ZzBazvb8KIYU0115Fj2Z5OfB58I38+bQRkA0bU8xzM
	3dikQvTanPRYjWZ1dgg4IJqlVnP3JEAc9V7LEtAernpFE9gZaWzkZN2C+cjHV88dLrR/C8BS+InMS
	NyYGyzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Ma-00000007ozO-2c2Q;
	Thu, 07 Nov 2024 17:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96MZ-00000007oyh-10l4
	for ath11k@bombadil.infradead.org;
	Thu, 07 Nov 2024 17:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=anQ50U4LmtKYBh37Ysqyrz20pTLw4kZsaPojr3trpZI=; b=BAX7FM5J7HGJbI9rzLJdblbdxP
	deY2P9xLkdJJ5hb/qcLQCrb9V886Vg6AiYlCHahNnSfC1Q7R119HvS3BcXEKbT5CBgFL9eiABcEIx
	f0jjP4UmJ9hkPn/UFxpqh/UFM88JIFvEulbZjw/lFFjWURlQbfvFtasZTGDi1fbh/uq/S17X1tPvV
	TXHb0rcQl0/q3UidNR4+jOeAmnyzDGYbHJxO0f8f+2jmbvZiGlRwt5FPP1jPb5WDhjLpiWgbIBMH0
	MAzvNipwVT85VFQ+GLOxjasUs2+XcKxy+ZXWqDJ6lKzoZYvJNCxrwiObCjwSM5G7BYOPwB9xrPM07
	5DA2zKaw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96MV-0000000CBBK-2j47
	for ath11k@lists.infradead.org;
	Thu, 07 Nov 2024 17:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A72B5C3300;
	Thu,  7 Nov 2024 17:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC2CC4CECC;
	Thu,  7 Nov 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731000719;
	bh=TfjUEPKxwyd2jm4vuB7rJhOT1ey+EjzS+137thlX6+Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z6+4VwMvIqk2vYedO6FMFTHw+Frs4OsGlT5R8HPd4McF3glhOk+OvkuRlKMvZR4qt
	 /UHY1+M4MqIoFWDtBwFJdyaJYWE7LWhyXw07Rd6ZQ0wqFT4rzqiWQEQehTHnC9Cq+x
	 10pqbGhdxSkjoeSzbFcZ3XUEEe9v2b5lBTDhMHuniNFju5bxlQ9pmwm35/M9MEyNT3
	 dtdl7BcCykBAot7BUu+LBCHIiOB+XPCqpjKSG7a4s6+VR5Zc00ME6xvOvlYwvw9ELG
	 38Y1HDIdiDOHgySSmdo9ivPIKOd04JXN0NG5U1MqR7cL8bLX5Tys/vBVtP6QQeI6r4
	 usF7my+pbQWfw==
From: Kalle Valo <kvalo@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  <quic_jjohnson@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-arm-msm@vger.kernel.org>,
  <quic_zhichen@quicinc.com>
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
References: <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com>
	<CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
	<06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
	<CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
	<46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
	<xp5j6kkpggfhxvzuozqcvs2ugon5xexjgzl24zjlen7kggdaju@vd3okew4vcsy>
	<49313be4-b0e2-4ec4-8663-bd4daf20f78a@quicinc.com>
	<ksyukz7oouw2ilxxpx5nhnshu3zmnd5rtgeloea2vykzzn6ii5@unvpx26neirt>
	<590b729b-a921-4ed7-af2d-326cf596ae1f@quicinc.com>
	<73916bc3-f3c8-4ef9-ab8b-d1497f228d13@quicinc.com>
	<csqlwll36viejkp7k57r3jdejpt2kkttmzawq6y6q7i7qs25ht@n3mazu6owblv>
	<3dd897cb-5cc3-409d-a310-66e71847d58f@quicinc.com>
Date: Thu, 07 Nov 2024 19:31:56 +0200
In-Reply-To: <3dd897cb-5cc3-409d-a310-66e71847d58f@quicinc.com> (Miaoqing
	Pan's message of "Fri, 1 Nov 2024 09:32:37 +0800")
Message-ID: <871pzn54s3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_173204_077097_E80810F5 
X-CRM114-Status: GOOD (  13.59  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> writes:

>>>>>> Understand your concern, automatic adaptation is always the best
>>>>>> choice. But
>>>>>> it may not work for MSM boards, the PCIe card (non m.2) is
>>>>>> customized, which
>>>>>> has special PMU control. User can't swap cards. And that's why power
>>>>>> sequencing module was introduced.
>>>>>
>>>>> I know. Still, it's better to have less unnecessary data there for
>>>>> autodiscoverable devices.
>>>>
>>>
>>> We discussed internally, we have no other choice to enable NFA765 for non
>>> X86 boards. Could you please approve this 'DT' approach ?
>> If you can't use subdevice approach for some reason, then we have no
>> other choice that I can imagine.
>> 
>
> A new patch was submitted:
> https://lore.kernel.org/linux-wireless/20241031000541.3331606-1-quic_miaoqing@quicinc.com/.
> This patch will add QCA6698AQ support, which follows the approach done
> in commit 5dc9d1a55e95 ("wifi: ath11k: add support for QCA2066"),
> enumerates the subversion number to identify the specific card.
>
> But there is still a problem enabling NFA765 m.2 card for IoT
> platforms, which requires ath11k to support board-specific firmware
> overrides.

So there are multiple different hardware you want to support? This is
very confusing and the commit message does not really tell anything
about those. Can you list _all_ the hardware you want to support and
what firmware it needs?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

