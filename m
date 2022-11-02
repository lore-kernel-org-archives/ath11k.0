Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7C2C433FE
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nj/hTqyHyQxyb6lfrzGQRyw1TA8LhSGs3ZNMTe5re+4=; b=BAoBYJt++6a6Qo
	8EkRDwNVhQ1ei1qyUo3WNj/9MFWXz+r1FM9BzvHrGvsa1lkATjWf0aBsWdaRbLhE59KvsSnc0rW5q
	vdTwjCgblzLAlHLOall7ssri/PZ8BngVpzdvnrpjuuvMKYg1zbg02ozz+tzF+nZIxb1lJUoyIYL/L
	qFqq9LNzsRgkYPTjTkKnLl/woTAtzNWgDxm2dRY0suGpXM5dlwme6kOP6zAM5R2J3pBjQi16x5ULO
	LhQKVROJOExZJgT7dqiht2NFqxfdUqDVef/ITTY57Q4eCXleWgt05Y0G8vn2eGPE8/jQeEf7nxi+W
	ZlFP3JjIlJVSFg2MaAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq6Yz-008KiW-4x; Wed, 02 Nov 2022 05:45:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq6Yv-008Kgo-LE
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 05:45:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E1ABFCE1EAB;
	Wed,  2 Nov 2022 05:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7577C433D6;
	Wed,  2 Nov 2022 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667367913;
	bh=3YBSt5wgm3Trm7ZWFbPLf16P9pUekGeHScuENazaKmE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IvdoAqua2SAU/umZCtsBr1KMW+JdH6OpJxaNXxaH+R0dvW1u/JdmE5SfNzmsypOe8
	 yNQm3BKWR7HQdIVE1WYKZ50aNz9mHaVNLUfvFmRq3IM0Ei7XpRV/peGdyMUJiU+JtT
	 LDdzjJFtMIbplkLc1kpu4LObnWzlb64HTmyLDfu2oLQI3b5C/HVgRqTr54Iv0pCldH
	 0ry4SXgGTBqmhwftzbbjTVbM8Tti55ATeN8FmrwLT8cLtEFD+7Dph9Bhwk4Od/5D3w
	 XCbPkVxumvI9BF7du0qopTOWm+1tJZYw5rzlhUkmoohtDnRIIJJXR6B2U9/prZcEjN
	 C+VneO1ZAMVuQ==
From: Kalle Valo <kvalo@kernel.org>
To: Tyler Stachecki <stachecki.tyler@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  "open list\:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>,  "open list\:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,  "open list\:NETWORKING DRIVERS" <netdev@vger.kernel.org>,  open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Fix QCN9074 firmware boot on x86
References: <20221022042728.43015-1-stachecki.tyler@gmail.com>
	<87y1sug2bl.fsf@kernel.org>
	<CAC6wqPXjtkiP8pZ_nTXdZva6JnQLWbW7p+ukyAZO6scF5CR7Rw@mail.gmail.com>
Date: Wed, 02 Nov 2022 07:45:07 +0200
In-Reply-To: <CAC6wqPXjtkiP8pZ_nTXdZva6JnQLWbW7p+ukyAZO6scF5CR7Rw@mail.gmail.com>
	(Tyler Stachecki's message of "Tue, 1 Nov 2022 20:51:22 -0400")
Message-ID: <87edulvrj0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_224517_904537_8187B7A4 
X-CRM114-Status: GOOD (  18.44  )
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

Tyler Stachecki <stachecki.tyler@gmail.com> writes:

> On Tue, Nov 1, 2022 at 10:46 AM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> "Tyler J. Stachecki" <stachecki.tyler@gmail.com> writes:
>>
>> > The 2.7.0 series of QCN9074's firmware requests 5 segments
>> > of memory instead of 3 (as in the 2.5.0 series).
>> >
>> > The first segment (11M) is too large to be kalloc'd in one
>> > go on x86 and requires piecemeal 1MB allocations, as was
>> > the case with the prior public firmware (2.5.0, 15M).
>> >
>> > Since f6f92968e1e5, ath11k will break the memory requests,
>> > but only if there were fewer than 3 segments requested by
>> > the firmware. It seems that 5 segments works fine and
>> > allows QCN9074 to boot on x86 with firmware 2.7.0, so
>> > change things accordingly.
>> >
>> > Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
>>
>> Ouch, that's pretty bad. Thanks for fixing this!
>>
>> Does the 2.5.0.1 firmware branch still work with this patch? It's
>> important that we don't break the old firmware.
>>
>> --
>> https://patchwork.kernel.org/project/linux-wireless/list/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> Yep, tested the patch with all 3 combinations, below:
>
> QCN9074:
> WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>
> WCN6855:
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

Excellent, I'll add Tested-on tags for these. Thank you again.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
