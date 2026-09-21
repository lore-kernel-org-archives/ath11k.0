Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B9C982ED
	for <ath11k@archiver.kernel.org>; Mon, 21 Sep 2026 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlEfKXCg5rHiDJTVNsbZVHr7bZvcSttFpXBa5Vfys1Y=; b=uLns8urSCh7XOGyMV6TXFlhlBx
	aZlIUkpQO6wBZVHVOCLbmkF2R+wfT9mtLjyidWJwg48nj4I1wPRpN5qGk7yAkOBRGljLRojy3Lsv2
	JOVESnMB0H8TE6lUehF6FBxSZ7Iq0tAU0nmrWTSTtAc6dFcJ4N2sucIloS8ieiI647eyZ02oR3b7q
	4eNCtWhF328TB8CWJomxWVfUkdnomg1/Nc0TPmh3D1QrVs/m1alwhfNc7j9ADhVB/6NmqT9W6zz6n
	BYpXuFG/FNxlPAHC2vQCxXKpTGlzjZX0gWkqDajGh22HAMrnsnVuzG8hdlYwVO6ZvlL70os8w2dBx
	5mr1eXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jrk-00000003FXA-1xZZ;
	Mon, 21 Sep 2026 19:39:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jri-00000003FWP-1i2t
	for ath11k@lists.infradead.org;
	Mon, 21 Sep 2026 19:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C0C8601F9
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CC31F00899
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019589;
	bh=TlEfKXCg5rHiDJTVNsbZVHr7bZvcSttFpXBa5Vfys1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=fXCi+50g/p6esnKbXrT5l4yOjkyme47lIAOq0dB5cRkLF2KIs6GzFdtPXYLVK8yGT
	 hHCJQER3efnQMbY8TgYuYm9QGDH/WzeDtOnrG+wGe9AHVpPxCtVAk3ngSIV8dz9jrp
	 bQ9To2081tZyhZ5jugatQkysS+2w37QcjrWvu4JIJp63BbTlPGKyxwavLnTdbtVnaW
	 Fobv3CAi54ZHj1NKCFrLGnndnW+Mr30RevnGWUeNG7jeflM7bdpHwAyTx/NwLQTtYF
	 Lcr+p8PmwO+jDPFrJkDAY6Jmds34hq1xguy4oOr4f1u5In14Njq6J8i+MjJNzCNGgf
	 CVDfgj4SLPxxw==
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e50968489so3178479d50.0
        for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 12:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtBCbvkqMmdcjZ09YejdE/1qtnwsbWMLZHLHzVK+3U2N8vPNqtAW/7jSDKtKx7LYu6vb4zfpM=@lists.infradead.org
X-Gm-Message-State: AFuF++k1WaOXfQIxJDViIX8YSyUh5y91h0M32vY4/BYcfQWa/Ti5d6m8
	wfq0cHyzbprYIE36fxWbuvMDLxxU8/uPa+aDMwNZ5YW8ZPpXMWUG7ZRkZ7+ubrdOb+IN1+Mlx5u
	ToaxZxT7z5q5uuBn0izOpzry02x9hd50=
X-Received: by 2002:a05:690e:1408:b0:671:70d2:5290 with SMTP id
 956f58d0204a3-6718227eb94mr3905390d50.83.1790019588512; Mon, 21 Sep 2026
 12:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
In-Reply-To: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Sep 2026 15:39:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
X-Gm-Features: AcwNN1UJvQ-v6KBYcktupCrDFyB4cuYBhh0oniY8Yx8HTq1Dje0_HKhmeUNPLNQ
Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1270

josh

On Mon, Sep 21, 2026 at 2:58=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>
> For ath10k and ath11k there are no changes.
>
> For ath12k there are two board updates:
> QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
> WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202
>
> Please let me know if there are any problems.
>
> Thanks,
> /jeff
>
> ----------------------------------------------------------------
>
> The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5=
e0:
>
>   Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0=
000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20260921
>
> for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath12k: QCC2072 hw1.0: update board-2.bin
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

