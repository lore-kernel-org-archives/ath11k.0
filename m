Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A15C433F5
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDovFM1unUH/IZu4oY4OP2mUxZsK+Ju8S1Rfll+CbUM=; b=z2GYpaFvlpIPAH
	aI6fHo1o71ZiDM/9+kbNZIqTfp1vFcdNlu5YA8Jo81IC183ZFlJ4JzgrVjRp+8Es8790fD7hXz82T
	uqQ3ssHO76yvniohX6ym0VXhdVHf6SbBnoKn4fBGDxiVBkJz14o5GyvwolMMgSjM+zC8Toc/Tp6Ps
	BSTAEhZ5CMBwF3EM5h2ZyZlBCFz5Xi8yhs88ga2aBC6vuRTCobWRSG9is+OfJSY5YgHPZueJiE+mF
	QE74SaIijJkpAULMEts4r9IyDKzuSQR0fF7fRH5S54Ti8xEDnIwgrghbtYhNKRJ2r2XPkAkeywV05
	WP/tockmN8mdtnSgwP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD50k-00Fw8M-Ic; Thu, 27 Jan 2022 13:40:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD50i-00Fw7c-Ah
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 13:40:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98B3861A08;
 Thu, 27 Jan 2022 13:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE592C340E4;
 Thu, 27 Jan 2022 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643290822;
 bh=ChmaLxAuXNHO7ov5sbQt27vTestGvjjHFHxfNJT4nbg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=EsFQKzKv6FfwyJ+vt0V3ZRsj1tPh6X+JmdANgl+A9YnRYSndd1rkxtpof2x9aZwWw
 y4Y1JXNSFJ8ZQeA+7dD4aFMRx23jtHDHALhT/86DewrcGuG9tOBrvQ3lD1JqTZmOc5
 dDpG2O/0kGEeQiNJa+oic13ZlOhWfi9SB46KzC2/SMG68Y78nd6FAa9FZiwChDIrtm
 avg2U4UuedojuEB2BVvoO3dc34a5loOmbeLotGxd7j4SoNzvZD4WX3f5Si8mdg/WG9
 pK96COnvUYacNX2hv7+2h02UNn0W7NYxyr7lGtsaM2YXjNquXWkwlARSeC9JWqp848
 q7t+55/VP8bCw==
From: Kalle Valo <kvalo@kernel.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: Patricio Ferraggi Ares <pattferraggi@gmail.com>, ath11k@lists.infradead.org
Subject: Re: Fwd: AX500 support quirks
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org>
 <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
Date: Thu, 27 Jan 2022 15:40:16 +0200
In-Reply-To: <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com> (Mark Herbert's
 message of "Thu, 27 Jan 2022 16:28:51 +0300")
Message-ID: <877daljnzz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_054024_444623_F3D2F567 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

Mark Herbert <mark.herbert42@gmail.com> writes:

> For ath11k /dell 9310 the best will be 5.17 which is in rc1 now, but I
> guess 5.16.3 released today will also be fully usable. Just need to
> get new firmware from Kalle's git as the firmware in linux firmware
> package is absolute junk more that 1 year old.

BTW, I'm trying to update linux-firmware but it's currently blocked by
license issues:

https://lkml.kernel.org/r/CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
