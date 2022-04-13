Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE5C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gkp72Z52bcXAIdPL3k19yC5phiIbyR44d6romxAMrRg=; b=GsbBl5EbKIGWIu
	ZeP8io3FeYp2KslJ/5cmwfJqcj+jISdW6mYP82nCDp9dZ9qmYoOg5ouvGumwxfb4YLy2obaHL4NrM
	J/sybvJ9zT1VO8ZA8ZB79o3IPuYda1uFiEJz92Ggzk4ZIC+L+xJ8Up8I6ZQ81CV21e1/SoGBw1cmQ
	g/31Wgb118UzUEBtlthdthCbglpZRFTWC6tl7u1CNRBtrxQY1/c2bOvcI+VlGJYY+8Yfa1dB/oUlL
	ER17Zx8dRuFUP7A9akCP8Etz8qbE4nZvmNw7mxocPxGUWwza6qo01IFS5NxXys/wnGZcOTuQWflVN
	nkM2HlwNI1tcS8jimtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neX0q-00HKL5-G8; Wed, 13 Apr 2022 07:02:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neX0n-00HKIm-HD
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 07:01:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90BAEB818C6;
 Wed, 13 Apr 2022 07:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C5C385A3;
 Wed, 13 Apr 2022 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649833314;
 bh=lbyPbMBTfqonQ/L7JI2ii1lIIIF7lCMPozLzHOpdUBk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=GSHEPlEd/sQ9ig8A2/PTBOHWQ/MWMLQQg60WYo15yNiN0zAK/kA7GA2AhTJE0fzHu
 tqUxeS8Ayibh4gVX3REuonT3Sq0GZD11L6ZX4xiIyg9l6EUJ8Nn06gOlaVmJalm0qz
 YPClJERYgIjRQu7OIfnWotn/pJBPZAbpLezSdPpmxbUKtky7+3wIJ80rdhxBhW+JXH
 3Dl5IASeraijynVzKSxIOcIB/O3DHdZLyAzRjsd9ICUQegydk6CRXd65rcbVzJCm1E
 VFrwb/K18QWGxq2RtxME2nkUldfZ2+OuY5f56c7IEUTbjaCM8+B1bFL+hl0rNNZ3A1
 Ys1O5SgmD0/AA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: incorrect board_id retrieval
References: <1734146.k9CKHTOI9D@ripper> <4611744.eon2OSsH4K@ripper>
Date: Wed, 13 Apr 2022 10:01:49 +0300
In-Reply-To: <4611744.eon2OSsH4K@ripper> (Sven Eckelmann's message of "Fri, 18
 Feb 2022 14:52:06 +0100")
Message-ID: <87wnftmppe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_000157_758075_64450AAE 
X-CRM114-Status: GOOD (  16.52  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Friday, 26 November 2021 15:48:17 CET Sven Eckelmann wrote:
> [...]
>> * 8devices Pineapple
>>   - 2GHz: 160 (0xa0)
>>   - 5GHz: 161 (0xa1)
>>   - 6GHz: 162 (0xa2)
>> * Compex WLE3000H5
>> * (maybe there is not a single one which works?)
>> 
>> If I would use these boards in one with a devicetree then I could just 
>> overwrite it using qcom,board_id (and/or qcom,ath11k-calibration-variant). But 
>> this isn't the case when I want to use a couple of these cards in a simple x86 
>> system. All off them (even when they are significantly different) are reported
>> as
>> 
>>     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff
>
> I've send my 6GHz modules back to 8devices. They told me that this problem was 
> identified and fixed in their calibration process. I've just got them back 
> from them and now I see following reported by ath11k:
>
>     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xa2 soc_id 0xffffffff
>
> So it is definitely not a firmware problem and it should be fixed by the 
> manufacturers (similar to what 8devices did).

So the device is working fine now?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
