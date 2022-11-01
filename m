Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD2C4332F
	for <ath11k@archiver.kernel.org>; Tue,  1 Nov 2022 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SS06gBUGN46VnRQ7oUI98m/LhPsNVRVGwlKx1QjMI5g=; b=mftOBM5KNWC0gJ
	vgDLPGRZkRuUTBGkXsH4lGKwNbyMdoTL6GZgnPBqrzSZvY9L0RnauOs26uP7JluyKa87KEp6A9B+8
	+TlqFXIIDajJC4FEFXJrfmQSg8JohM7SMAKG/CZ/8S2hu52zJKaEcFZtBVnfINjKiEHgT6s+UiH+P
	JAlGHTTD92UF8ZOvlSEmJ1xzSTVXl7z0V8Id/w1mhijeHFKrGokipsACZTFlO328+kJaZtlpnHCUj
	Iq4l1yvVJcC+QHQZNzWsoV9UYRZXXe+zOdqcEjLgJADwO7MGRg1zARXH8ZudGe/QQ96YLfxYw4Z08
	LTUY8ma+UCLAhbJ5TMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsbf-005cxP-LR; Tue, 01 Nov 2022 14:51:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsX8-005alV-F7
	for ath11k@lists.infradead.org; Tue, 01 Nov 2022 14:46:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D7B4B81DE8;
	Tue,  1 Nov 2022 14:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A6BC433D6;
	Tue,  1 Nov 2022 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667313987;
	bh=mRINjiRnOBOfJq5iqp3pBxJc+AyDgUafRTpJ4I4NiSs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RSXbWW3paXaR2HPrTjmIaRk/tUgJLKZDePR4ioQKd4K6iiIO6BK8hax1OwbNUQzHR
	 WEzqQPCSTrbwm7kh2aPkI0/e2SjTpS0nKQfOkchKjCScUg6TM+nIaKC5l6yQqF/5pJ
	 A3LXEjeeKWJr8K6yKd8DJLqsSllRWGtc6KJAt9g3TVgslR+3gp7XC7nDJgGTMVE8Jr
	 fgtwTNltOt6C81CdwrJbl7ew5wekQ2AkcF8uZIjCu2uHa3+l4/TZg9MWpPvjHo39CH
	 cztGWNbVRT184KoZ2dcnMgOZ4+KGwR4kXLf5nIB67KFzcTij3GDeqS8N0chnmEwYVV
	 jebF+Q2ERWRuA==
From: Kalle Valo <kvalo@kernel.org>
To: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),  linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),  netdev@vger.kernel.org (open list:NETWORKING DRIVERS),  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ath11k: Fix QCN9074 firmware boot on x86
References: <20221022042728.43015-1-stachecki.tyler@gmail.com>
Date: Tue, 01 Nov 2022 16:46:22 +0200
In-Reply-To: <20221022042728.43015-1-stachecki.tyler@gmail.com> (Tyler J.
	Stachecki's message of "Sat, 22 Oct 2022 00:27:28 -0400")
Message-ID: <87y1sug2bl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_074630_681251_964DA653 
X-CRM114-Status: GOOD (  14.97  )
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

"Tyler J. Stachecki" <stachecki.tyler@gmail.com> writes:

> The 2.7.0 series of QCN9074's firmware requests 5 segments
> of memory instead of 3 (as in the 2.5.0 series).
>
> The first segment (11M) is too large to be kalloc'd in one
> go on x86 and requires piecemeal 1MB allocations, as was
> the case with the prior public firmware (2.5.0, 15M).
>
> Since f6f92968e1e5, ath11k will break the memory requests,
> but only if there were fewer than 3 segments requested by
> the firmware. It seems that 5 segments works fine and
> allows QCN9074 to boot on x86 with firmware 2.7.0, so
> change things accordingly.
>
> Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>

Ouch, that's pretty bad. Thanks for fixing this!

Does the 2.5.0.1 firmware branch still work with this patch? It's
important that we don't break the old firmware.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
