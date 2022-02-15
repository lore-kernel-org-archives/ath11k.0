Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F77C433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyfdBYWP+eZ7WzAyDMKtxzuAbo0+hbhbxwmf8rgZatQ=; b=4hULS+KUQZ9AI/
	CqfyY2ucKifC1+7iumQ/UtgIpitRj3sgMzmfX05+9vVCE7ZI60iZL6/43vgMk7kJc6DZprsF2/5j/
	o05en/RZLmaQMLy7cV5uM25usbb0tAlNi3PsB5mbPx3EoCz0v+sm2iuWXjivFylFtBi3nphrnDm0b
	NUbTLkaPToPnZLfJxRN6aLKo/8MmeJ43I6ypqN6PHrbeM0W+2Tp6vBoQgwFUlvTpvw5q6yLRGhwya
	DNoX4UpULER7kjiyB4t5v8UNxevZ8n6MrEc7MYNBMxhseS2BcxsSVYZ8caOWpOVazVoGxDlILRpJf
	+sWTlChyURxVblUp+TbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxNR-002jfA-LJ; Tue, 15 Feb 2022 12:56:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxNO-002jdo-C9
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 12:56:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EA3E616D6;
 Tue, 15 Feb 2022 12:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267C7C340EB;
 Tue, 15 Feb 2022 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644929773;
 bh=esdd/2tvPBiz/QJvWCv85odveN7Mtl05W7Iqu3j68QA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=FomrnCr5FclFup7Hq4Y00uiB/W5tWeda73iyzKisWcprvxZughhPCnTadaoibVQoh
 IvhFdZ7Wx7PrZMzOFDy2/GLK+CmWAHiZCPiThcBJfGe7u2Yy5oSJkHE/iuZykUEO+7
 +QzkFghqTdMLUuNWeVyITOoUH2XbaOaoj8/z/mkrEw7WdpDbofR2hueWw5MPc+GIvE
 CqsULsiCpDcyCBOpC2LWszWxKkV1blp2AGUtV2uaGYzI/LARePp9LcG+cqC84Q9b92
 t4QZyoj/k9qb+GwprM7oBp3jLxFxcdmLENkrbTm5ZT7NzNB5g2N+sElkJq3It3QRnQ
 tlkfyH++x+rHA==
From: Kalle Valo <kvalo@kernel.org>
To: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Cc: Mark Herbert <mark.herbert42@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: Fwd: AX500 support quirks
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org>
 <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 <87ee4ocgfq.fsf@tynnyri.adurom.net>
 <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
Date: Tue, 15 Feb 2022 14:56:06 +0200
In-Reply-To: <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
 (Patricio Ferraggi Ares's message of "Tue, 15 Feb 2022 12:29:31
 +0100")
Message-ID: <87o8381e6x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_045614_470436_82C3039B 
X-CRM114-Status: GOOD (  17.84  )
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

Patricio Ferraggi Ares <pattferraggi@gmail.com> writes:

> Hey folks,
>
> So. I am still using arch linux, but not everything is working.
> I have decided to give it a try and dive deeper by trying to compile
> my own kernel with the necessary modules and firmware for Wifi and
> Bluetooth.
>
> Could you guys share with me which repos (apart from the kernel
> source) I should use in order to build something based on the latest
> linux-mainline kernel?
> I am unaware of how should I include the latest ath11k drivers from
> Kalle and which modules I need in order to make BT work.
> I would really appreciate it if you could give me some links to the
> repos, some info, and maybe a basic strategy on how to approach this.
> I will search and learn from that starting point.

Arch wiki is a great source for information:

https://wiki.archlinux.org/title/kernel

Arch seems to have a linux-mainline package:

https://aur.archlinux.org/packages/linux-mainline

But questions about compiling the kernel should be sent to distro
support channels as they know best how their distro works, not to ath11k
list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
