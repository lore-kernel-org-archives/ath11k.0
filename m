Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080C3C4345F
	for <ath11k@archiver.kernel.org>; Sun, 14 Apr 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlGTEAOp2ol10+pSczTCFvEY6NU/DK3ovEYbBde9IL8=; b=JsKe0+CGwEeBNrMYqhDqgIjUl6
	wM1f5YsbU8BEmlE70J/HU9CuAyUp2DOZMlT6K4BA8DFVndjkjTOqnEdARTxvovv1Yd9FwdOOOcN8V
	yGmO2poWzGUVHFUeUAEYhp9hvNhALLyEt/DLBsxEZ3lB4djzg7rZl23+alkE2FP5NcIKxRyg9KgGb
	bh85WDC+FLR03EooSPrGQjq1gLfJrx1DRZVIU0b7QDXK6EpZk1Pmwlgb3xZXAL9HH+2FJMh+ifqex
	YK7dqimBBJMmm9ISA1AjDB4ETVpZzI1PhGnFNdcDsdBJ+6EiKQlEfU+ZNUgaNixVfHzGEexbjHeyM
	+saR/9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuyo-00000004zG4-01p2;
	Sun, 14 Apr 2024 08:12:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuyk-00000004zFP-3xB7
	for ath11k@lists.infradead.org;
	Sun, 14 Apr 2024 08:12:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so2173282a12.1
        for <ath11k@lists.infradead.org>; Sun, 14 Apr 2024 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713082363; x=1713687163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlGTEAOp2ol10+pSczTCFvEY6NU/DK3ovEYbBde9IL8=;
        b=NeehISutFaQdO4tVKXQJF5q/xc0MBJ75nnZRIXMABADj6RZVPc7PdfTmA4bNQGfRPf
         qPAlj+Jg+tR7MSEtKW6smMk8Ejotzt88jrc3USsFejgKuMAtmiENH9gMTDf6F2r0SnKh
         Rf8Jx54eoA2dNKX+bvKQSgHJL5qHJqwwLy2v3+ml7SKruajH0IoYxCEuXTpj7Yz448Lj
         sLFeC3pCJ5YsKSyHnaapFu3SIz3Fwbn1XRpJZNr5LE7bV1AXFUNSxE+HeTCePX/VXIM6
         chEGuWVV/B+xy7KJvciQirTKgBxOV8L4c4s5PuoS4GfETzlC8z7ftTDzhv0GahRK9KY0
         lxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713082363; x=1713687163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlGTEAOp2ol10+pSczTCFvEY6NU/DK3ovEYbBde9IL8=;
        b=nTrdVWlwM2YalWofbwcusgHJgZpxErs1YzVQImADQcEpc5pkdBC3xEO91qwjlpDtjR
         fiMi3vJw17Asx+89xkZjOJds1W/kSW8Zdb70t9dz6O36XIoVZgDzxa6y6LnG/zihuufz
         hgLnwhfzZV79sXHYJMRMm810UfUAZm3N7TppFoTtGGgk9D9VtYP5HbD57z1DCoPjZcFA
         FqRkyZpxcXkil63avOv25ahmC5XcxJSGMyz7sJrv2zaFXzku4L7057/ERv3OexkO0y3m
         zrv9wp8WZGzcg4acyMH7Y0vkDR1JHppHgsGy1qDj4KzlGGBHKBaYlP22dF46Zx2QOimo
         QjKg==
X-Forwarded-Encrypted: i=1; AJvYcCW5dzvPUsqog/y8ZLwvYUPNs4jgengfC9Gj5CrlbKJX93EMOtODwypIHzAJsP9Ko86c2TQi5H1k7GE/Bs31/Gt9utNyEFHwGnAw2g==
X-Gm-Message-State: AOJu0YzMolVIbr7exwRUnciCJTtekkpMGpyOLc2xXByiVjiVwK1ilv7h
	du2ufeThf0yixoDiQqJifF8osAMwGusFkGBDVcYhVmN01VayCIimx1PczFL176V5yvgbrweGcXk
	7T3pHrTwuapFbEkOOdOHgnG4HzzE=
X-Google-Smtp-Source: AGHT+IEaSy97hYwZErgc5LzGMYkKDChbhTbAw1vb/zGXzygaSFJtO2YX5+G1AGTKQkWHLusoGmf4gZStV42Jkdx6MP8=
X-Received: by 2002:a50:d55e:0:b0:570:2418:3607 with SMTP id
 f30-20020a50d55e000000b0057024183607mr443854edj.36.1713082363149; Sun, 14 Apr
 2024 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com> <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
In-Reply-To: <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 14 Apr 2024 10:12:32 +0200
Message-ID: <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except CCMP
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_011247_023068_8CF64AA4 
X-CRM114-Status: GOOD (  24.16  )
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

Hello!

=D0=B2=D1=82, 2 =D0=B0=D0=BF=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 02:35, Baoc=
hen Qiang <quic_bqiang@quicinc.com>:
>
>
>
> On 4/1/2024 10:53 PM, Jeff Johnson wrote:
> > On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
> >> Hello! When I tried to switch my OpenWRT router from default CCMP
> >> pairwise cipher to any other, supported by both my router (Asus
> >> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1), I
> >> saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
> >> back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
> >> is good, though, for all ciphers - 1Gbit/s.
> >>
> >> Initially, I thought, that issue with either router hardware, or
> >> openwrt driver - but, I tested the same settings on another laptop -
> >> T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
> >> was 1Gbit/s on any pairwise cipher.
> >>
> >> This issue is 100% reproducible for me, it happens all the times I'm
> >> switching to any pairwise cipher other than CCMP.
> >>
> >> I'm on Linux 6.7.6, compiled from sources on Gentoo.
> I'm not familiar with Gentoo, is there any private changes in it
> compared to upstream ath11k? If there indeed is, could you try Kalle's
> ath11k tree?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>
Sorry, missed the message. Gentoo kernel I'm using is very close to
upstream. I will try ath11.git, and will report there, thank you.

> >>
> >> Here is my dmesg for ath11k:
> >> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
> >> 0x78600000-0x787fffff 64bit]
> >> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
> >> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
> >> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
> >> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
> >> board_id 0xff soc_id 0x400c1211
> >> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
> >> fw_build_timestamp 2024-01-12 11:30 fw_build_id
> >> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> >> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
> >> Country regulatory setting
> >> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
> >> Country regulatory setting
> >> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28
> >>
> >
> > There was another reporting of that error in this thread:
> > https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.=
com/
> >
> I don't think this is the same issue as reported by James there although
> same error message. For now I don't know the root cause to that message
> but it's unlikely it causes some tput issue.
>
> Let's wait for Yasoslav verifying it on latest ath.git.
>
> > +Baochen Qiang for awareness
> >
> > /jeff

