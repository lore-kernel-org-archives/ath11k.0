Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A197C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 07:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87JA5ydg0M91m9f4oAcWEsDRtRYRCt3tv5bkyBkFQFA=; b=KGQ3MwHV8We+MT
	fvKW9kzr0bWkLRHEuUKFPiJ2Qt8HUKexsyXMoWzP0qv+ZILcwB9eiBXRwlImr5Yp7sfjRYl04KEpL
	1VnQaAcq3bVn2+2wVOQbyuPrEHBBEjaKO2218YeLRf/+plCbCmZZRU8nZBe1gODOJb+4rn2hqKp4E
	ECLEFjckPVGpWqBFHkOAUdGUsvn0JANFgzAWlpDX1e82qVlqQeMZSUWG6Ztu4Tdoykx6bO0ryysm2
	HRxf0BWsCBr+466cB7ouxD8ae1xZemeLqqHj21bIA2vMiILK130G6lg9kVJBl+uWauxh5YwPLkToR
	Tb+uJ7ucKstQPq3O7rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neX5H-00HLeJ-K6; Wed, 13 Apr 2022 07:06:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neX5E-00HLd9-JM
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 07:06:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3BB32B82130;
 Wed, 13 Apr 2022 07:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBB6C385A3;
 Wed, 13 Apr 2022 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649833590;
 bh=oqRBOdoHDNNqK6CbdR58+U+kOjBS7mQk6jXh1k/nMAA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=k1NXy76TKdd0kuLKvLQ7w7UE61eU0pS7/PQHjlC/7+OcrxfBL4Dg0OrTSrMlRhq1v
 xlC6mDYhpOJXRhgr287uxrhogKXbYArehrNyUkhxRZUbZiHjrL0e57XvSW3+2+oJ+d
 4RNWn35e/3LPFd9OI89MTSGW++C+DPgeeenQ1QuRYZc2CrsOpXrvmC0g0K/Yz2F4ww
 RZXBILCoB9n+JnwjkdyZNKAvslWNsggewuQNG1wvw+EKQvGqkOfuT0tJSLP6p/OVkL
 lfMZsIEftCLKFk463nYoTUDe/UBYOLkMI6cDuEahBa/fsEaz30ZDFLVABy5JHDcU/o
 x+3onWBbt6uRg==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
References: <2091899.pNsEtq2SQc@ripper> <2340060.uFBqQg8s0L@ripper>
 <87k0fy6mek.fsf@kernel.org> <2947430.zJFXT1rtDI@sven-l14>
Date: Wed, 13 Apr 2022 10:06:27 +0300
In-Reply-To: <2947430.zJFXT1rtDI@sven-l14> (Sven Eckelmann's message of "Tue, 
 21 Dec 2021 23:58:42 +0100")
Message-ID: <87sfqhmpho.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_000632_820534_597798C0 
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

Sven Eckelmann <sven@narfation.org> writes:

> On Tuesday, 21 December 2021 15:52:03 CET Kalle Valo wrote:
>> I have told the firmware team numerious times that the board file should
>> be backwards compatible as it creates problems for upstream. And I do
>> try to keep everything in ath11k-firmware (and in linux-firmware)
>> backwards compatible, but if they are not please do let me know.
>
> Please check the first message to find such a problem. Ok, it was not about 
> board files being really backward compatible - it actually is about the 
> firmware not being backward compatible and not working with the board-2.bin/
> BDFs in the same repository.
>
> So if I get
> https://github.com/kvalo/ath11k-firmware/commit/ae4f4f64ed14097dc24a8d686fa60e932cba4868/QCN9074/hw1.0/testing/2.4.0.1.r1/WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1/board-2.bin
> (extract board_id 162 as board.bin - because nobody seems to initialize the 
> board_id in the OTP)
>
> and use it with
>
> https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0/2.5.0.1/WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>
> then it causes the initialization error described in the first mail. And the 
> firmware used here is the only non-testing firmware available for QCN9074. And 
> the board-2.bin is the only available one from your repository for QCN9074.

Ah, I forgot to mention that everything under "testing" directory is
work-in-progress, and might break backwards compatibility. To keep
things simple I now removed all backwards incompatible files from my
ath11k-firmware. Also now there's a proper board-2.bin for QCN9074,
hopefully that works better. Do let me know if you have any issues.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
