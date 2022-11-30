Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8EBC433FE
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoMutWCX8cwEcDBL/tXcPT69Oqafu87COWMVVtk0n0U=; b=C63rxlcRqs/OvQ
	pwwUNRruZWFiaM1K1zuTbMbi8D5LAs5B6SftMAh2OYTqdbzrgoLFDDwV1OCrCBDpSYxbzxFMCb6bQ
	lh6pVNuQbqkCnXaBidDH7/gdCr+Ya6GiCAEDZZkapXFmfRymQfC1iE6kAeFBwzr5e2sEwVsTYuty0
	OO73FHiLRmCdAbhMsoB9bFGfI/jpOHajwA/e/Ep851iSfZeqKPOaP8duxkiTMN8HcfyGr1PvItm3E
	tRjsTymQChpvLBBdRPHjVCcPwwe4/Rps7eozV5AseaD6K7Z66/3PLMi7oJWkpgM0itFlVgT5wB5OW
	Sg1ASZmy1PXlGpT3WWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Qjz-000vkF-QH; Wed, 30 Nov 2022 17:19:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QjU-000vNc-BC
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 17:18:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB17B61D01;
	Wed, 30 Nov 2022 17:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5769AC433C1;
	Wed, 30 Nov 2022 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828731;
	bh=xh6HipE9Jb75qlFWvlf55aInyFX0fmqtese0m4gUxyY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=smgNIQC+mExQfP3XN3yjEnkpKTZGwN0HmfDTTSoWjynnlArhTQf8nkqWwSNcsgJ5i
	 cgfafBBUOSKZIWzk0JTjyAI4bIC9DjY9g68M11VVxyie0w7omkaie/9C/qkrUhTtfg
	 fJnq4d1koVf+afndK1pxoftAN1koA0EreP1hon09ksAA/tIgj+/mjuTYs+o74Pa+td
	 FyD8op6Ae17r1yWzORt6qncqwM6AwZhgEscF+yOFTr2LRHLaT5fPHO5Ao3oiz8lI5m
	 v98YONYUHsqmyN9JjLtsfGzUZAHA/u/OBI7ZOMDnMu1APjOiFWAJrEY8YiatMm13Oo
	 EvMGlDW2arG0g==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: ath11k vs ar_qrtr?
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
	<20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org>
	<20221130132244.GB3055@lst.de>
Date: Wed, 30 Nov 2022 19:18:47 +0200
In-Reply-To: <20221130132244.GB3055@lst.de> (Christoph Hellwig's message of
	"Wed, 30 Nov 2022 14:22:44 +0100")
Message-ID: <875yewnyx4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_091852_448046_88230886 
X-CRM114-Status: GOOD (  11.18  )
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

Christoph Hellwig <hch@lst.de> writes:

> On Wed, Nov 30, 2022 at 03:12:32PM +0200, Kalle Valo wrote:
>> Heh, I'm learning something new here. But I wonder why nobody else has
>> seen this?
>
> Good question.  How common is the ath11k hardware, especially on latptop
> where it is required for installation given that only installers tend
> to split up driver is non-standard ways.

I'm not sure about exact numbers, but not very common. I have seen
something like 4-5 different laptop models with either QCA6390 or
WCN6855 (both ath11k PCI devices). The PCI support was added to ath11k
in v5.10 (released Dec 2020) so maybe installers haven't caught up yet?
Just guessing though.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
