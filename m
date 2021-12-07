Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFFDC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noFt3AsPBgayXMGuqpnnSkMwg7L+7lU5slAJ8ML6mJE=; b=jtg8XPZIM83iuD
	tDdXMj4+Ef6cx7p+i8ndQlMkx3bTvpdyBAEUTCzEmq3nx/Bi/h0vHKrZRlrhrp4VV0scQV9wHLTpv
	eiuwkHWQ3aNZxUkFyL97dKbCYfeCjaABfJ2yuoyUz0gcdBrZY1BoCCX/rT/ej4gYQcsmxnHkOICiy
	MUH4xCMKDB9ZKQ+gFYysKr9nyi4svs1AzCysVmpCMbjI4Nx5sVOXK6BuTNoKKoTksL5TzKdsbOUO4
	KXQpUG/sa0mmsu6sIOoUYxKnIZLwVvgFBAcS3K9D994tIUm2zjG48vU8yFM3lzQ68CHJJGXKwxwHk
	8cZdANgEBJMZUzVGzryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muc5R-0096iA-LC; Tue, 07 Dec 2021 15:08:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubl1-0090Ro-1C
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 14:47:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B5DFB80782;
 Tue,  7 Dec 2021 14:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E422C341C5;
 Tue,  7 Dec 2021 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888467;
 bh=u4WpnIP/o6TXEfTfxB1pdkIBKTMxbE9JzDtO7Q8LGY8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=BHwzZaUvYEJBPdkY29edXrrIzNxbqF3c2GIHQhelBbf0o83fviJEkGmWTcjamgyqm
 mrgcdS4nNcZdIC+5w7HVXtKw33DnoQLYytjDdEoz459JmfnOLhg7QDmxQ2AlQG4CY/
 DwucZPElGRLQMCkh936aYOUdUogaDvh+fYCKTrc9q2XLcbWr/kQKWuO5D/sRVsaf5y
 nrqvOuLYM0/r+MCq+ZgPXDgZO7y672LcoUblh1I3jiiKGbF2Mmu+fdtGRwTK0PywMe
 lGgv7c6AD40cKjRWSdIJc47ZIIEWiAhlGvc0vZxCm6MjV3EY6M9OIEndS9Gj79UJPt
 +8bvZikxOHiyQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org,
 Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Add support for forced PM resume
References: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
Date: Tue, 07 Dec 2021 16:47:42 +0200
In-Reply-To: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
 (Manivannan Sadhasivam's message of "Mon, 6 Dec 2021 21:40:59 +0530")
Message-ID: <871r2otqsx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_064751_301305_8A877323 
X-CRM114-Status: GOOD (  15.32  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> From: Loic Poulain <loic.poulain@linaro.org>
>
> For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> are not in M3 state during PM resume, but still functional. The
> mhi_pm_resume should then not fail in those cases, and let the higher
> level device specific stack continue resuming process.
>
> Add a new parameter to mhi_pm_resume, to force resuming, whatever the
> current MHI state is. This fixes a regression with non functional
> ath11k WiFi after suspend/resume cycle on some machines.
>
> Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
>
> Cc: stable@vger.kernel.org #5.13
> Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Reported-by: Pengyu Ma <mapengyu@gmail.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [mani: Added comment, bug report, added reported-by tags and CCed stable]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks! I now tested this patch on top v5.16-rc4 using QCA6390 and
firmware WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1, no issues found:

Tested-by: Kalle Valo <kvalo@kernel.org>

I'm not expecting any conflicts with ath11k, so please take this via the
mhi tree. It would be really good to get this regression fixed in v5.16,
so is it possible to send this to -rc releases?

For the ath11k part:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
