Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716BEC46CD2
	for <ath11k@archiver.kernel.org>; Tue,  9 Jan 2024 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEZYhBsE9nJawc8wgkH4NEWuARH+t9pgx/s9ShaVuTc=; b=DfDPmKt5LHdWxpNNGtmX/pVN9x
	7zOypxMu87wu7QV93v6wPt6IhzdifzcMEC5vQLmVhtQKXgHjh+ysCxm4wSgGniT3aZU9XggCZOuyN
	PiMCCD4APhU3kEYeaIhk2+TT3gKS/Y42sD8lHNH/6klM1nMkUFEGAlMQi8pGIYwCbNr8RLoZuOs5w
	IZnrbEakyU/6JCQTitTd7EW7QeKPSCavffsgWtmC43MZT9vkZ+jlSZK8eAiESDKL2++MYUfPFbgSk
	rz63mNfszPBv0zL/6Dvigjh9RPk83zTFO3sRP3NqcyetaoLlwfu/YL2dT07vcuGdzto8PikOo49rY
	SZSRes3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEEk-008hjc-0A;
	Tue, 09 Jan 2024 15:41:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEEh-008hiq-1h
	for ath11k@lists.infradead.org;
	Tue, 09 Jan 2024 15:41:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0B98EB81B6B;
	Tue,  9 Jan 2024 15:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B100C433F1;
	Tue,  9 Jan 2024 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704814909;
	bh=PrPT1PF1nLNq7MhFisgwCZbFl/aRMX6i5ALN/Gf296k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pOW4ieNdmUZyZvCWsn6W3U2etakpyFD/MyTR1IJWpwJwYB78Dr6s/utb4bh0fH8hX
	 Q8TS39SQ5u/ca51wf9LQqK/61/a+Zv5bLJ77JYvUmlLsfBX3FUhloAdmctdsjSD2yI
	 6jEozcV2J789zxGYsUszOW2hD9g/7t82Kvytd/vWp5oMiOnM51Z0oyqDzyzXVtRyM7
	 WH5O0AuW2AQ1qTWGockk7eNDjQaHuOH5UfJbAlz+nBzwfTLAP066n0lIuw2Rqu6nu1
	 wxiY8NtlzafCl+mtao6lcQb6azj0FYUrPYfwlecl2odySLP0A7CpAcjRPCkCxdfIGu
	 tfG2wM1eStGLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Zhenghao Gu <imguzh@gmail.com>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: fix IOMMU errors on buffer rings
References: <20231212031914.47339-1-imguzh@gmail.com>
Date: Tue, 09 Jan 2024 17:41:46 +0200
In-Reply-To: <20231212031914.47339-1-imguzh@gmail.com> (Zhenghao Gu's message
	of "Mon, 11 Dec 2023 21:19:14 -0600")
Message-ID: <8734v6ecp1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_074151_697313_1FDCF598 
X-CRM114-Status: GOOD (  11.02  )
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

Zhenghao Gu <imguzh@gmail.com> writes:

> virt_to_phys doesn't work on systems with IOMMU enabled,
> which have non-identity physical-to-IOVA mappings.

Can you give an example of such system? Just curious where you are
seeing this.

> It leads to IO_PAGE_FAULTs like this:
> [IO_PAGE_FAULT domain=0x0023 address=0x1cce00000 flags=0x0020]
> and no link can be established.

What do you mean with link in this context? Are you talking about 802.11
association?

> This patch changes that to dma_map_single(), which works correctly.

Good catch. And virt_to_phys() documentation even says this:

 *	This function does not give bus mappings for DMA transfers. In
 *	almost all conceivable cases a device driver should not be using
 *	this function

> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Zhenghao Gu <imguzh@gmail.com>

Jeff, are you ok with this?

I did some cosmetics changes in the pending branch (removed unnecessary
parenthesis, reverse xmas tree etc), please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fefa43d63e1928fce6e8c2bb626900e9ce98ca69

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

