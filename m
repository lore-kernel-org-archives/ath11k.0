Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABB3CCD199
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAydDVKWvb+4VfaQMM51ZumnjdSesM2DpT6mYfVtOyg=; b=yXPto9HzysfUZYJJkehuOAQ7W/
	IKixiT/cDK92vYSp+zXgbyO7zg048mTknlhQPTHWqRTS/lfmQZezWERDH58N3NsvqXNZTa3wfcWHi
	EEidkFGWS3Y79yjK63hei7dNo9jEJdGcNdFDNQlG39GTKoND0e06iLJYvt83RG2Av7u0D2uM+x4q1
	dnOsEvemoYRTypGIZI2qyMgki/OBn0qqJDfB/mf8ssrr7/0RQwS/BSCof3cPzvPC+FibG67/OnT9B
	nyE2Oz/Qn7rt6BKQqcfTUiqiJQd57GxHgKfITXvTVavh4BpLwON6zFDyuaQzHb1az2IAPU116qhOw
	QnNdJR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YxO-00000006KGV-0wJB;
	Fri, 17 Oct 2025 01:08:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YxN-00000006KGK-2r4k
	for ath11k@bombadil.infradead.org;
	Fri, 17 Oct 2025 01:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oAydDVKWvb+4VfaQMM51ZumnjdSesM2DpT6mYfVtOyg=; b=YJdg7aUAXNa/8eU+inDgNJwQ20
	03wnbh80Fw/6OzRl72hniy+Xvm/oEwJXMwI+DvRxRomGi5+j/bLX4QqqY4DLT5OZ3If4AYlMbgiZE
	Ju3oj55ISzgH0Ao6CcPQc7dP8Y7xofqw1BttTyNujsXxCV92SfBT/W6n2i5rpeuUcIbLI3ayRgxZ7
	LD1rrXPhDv4k3qGA1kXJRmUxCP/EDa6JkmBUpjuxODXghrv4qKCmTLlEWTmccylMq1HQGjYn2+N6l
	G6bh75kRKOjuOkk3JscOtWt6lhN92eacypwXxIsCcuGf626bhf5XSEFckngIRG++AsJYXJFa7BuUa
	J31tMuyg==;
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YxE-00000007Am2-11vl
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 01:08:28 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-635380a4a67so1390846d50.0
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 18:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760663300; x=1761268100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAydDVKWvb+4VfaQMM51ZumnjdSesM2DpT6mYfVtOyg=;
        b=I9ymeV/R1Mrrtuqtprn6LEKSHZlZy03FiWRzRrGPbdJBXGQq3BiFbPN2hb3NS0Hj0w
         jih909C6dlwznyNIVdsGcD+aXra4s7sgh0BTzEbirvkPuxxtzeXClpsN6msEaDQ+FV/H
         OTmPkDPdUyYAvIB/fW8hX+bUYtQGBJXh68Do+1rlNGR4L77978omExsdEwKm8aVMSihl
         0cHL+mEM0kYmsItKYl6QdZN4xd3ZGABeTY5U8qQ1unoMuwhxQBAD105SeRSBQKSYFLG2
         6olxSN7zqxz6ReYdEgeQOkal02lLH3VeQUDoMEWqTVOtJpHt6GVJwbkSOfeAcVdPWfVp
         2xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760663300; x=1761268100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAydDVKWvb+4VfaQMM51ZumnjdSesM2DpT6mYfVtOyg=;
        b=O0CO3JZ3l9Ozv5XZhRLom3YZetcz8vWWpNf/mzBGAKVgwHi749eJmoLeRyf7a91lMD
         2BwTWxeBARs49U4c6H83EBD/xX8jtRfi+iWuKom58+Y2kKMAqmtMv4i/4AP0xUk7bG8C
         B0irIupzrveCGMan+SqrZ2C9dF8DCJpkKO0bFmwjgHeRtPj0JEYANcsHi2NFwGpE041Q
         buFFC3kzf3mX7OS9sjp+0XSJh1XyX+0AacUbjJVxEBu75dQlFLirJYTA3FRLOEGx0Xcs
         rnicH+qjTOOXDIE7OOkAmPQF9ZXwRM2PXa/XdQLlT4r82pQBKinhcT5VSLEeMyVILehm
         Hk6Q==
X-Gm-Message-State: AOJu0Yz34C+THhXOym8iDjQd13L/z7/m59bjqhmX0G9gvQ8MNK5hdtUV
	N3cu8qnMU5JGPBHVFEAdwBvCrCNuMK7tYr3BBPIA9MS0yANnQnsXPhFu5xmIFIfzH6sTUtok2Pt
	3lt9VomC4QpxtF4vS9RZxsOJy+7/Le7U=
X-Gm-Gg: ASbGncsrXi2JDLazoHEjn2akvaUO7nIa3y1+BbRIEH0tssSFG5KIJL1SiQ0iImDPkbW
	qyoQhkynXTA1TcJPPifSFfpoBHhlKn46D6tT08CawuGbXCxnTbHXhURRJRQ4yAZYsAbrij8n6Lm
	nSZkKSs5vrDwD4X3z3scjcptIOyopnBCxpDtr1x0/zp3SajoYJoa7e0+kITQJDRzk+zgVYMduv2
	cu+C7+LyLDZPbDSMJCjR670hOBKgIRTCr67/9bm1dwarXuFq5oAbDRJZZn1
X-Google-Smtp-Source: AGHT+IFUXqDdbWhDMNEjr/ey1vDc03qLhBw0hahut2DHijVJKwIgVMQNO+BdClE/+F+4QhpDNTfuymlUpWCz5S+9td8=
X-Received: by 2002:a05:690e:408e:b0:63e:17d8:d97f with SMTP id
 956f58d0204a3-63e17d8dbbamr1306551d50.34.1760663299751; Thu, 16 Oct 2025
 18:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13SM5VN6sfr_iMFBSHHOLFbW8-WK3=B-vt9qgE5nu0CmaQ@mail.gmail.com>
 <4489f5ee-25cd-8547-88fe-148a9b8f181f@oss.qualcomm.com>
In-Reply-To: <4489f5ee-25cd-8547-88fe-148a9b8f181f@oss.qualcomm.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Fri, 17 Oct 2025 09:08:08 +0800
X-Gm-Features: AS18NWCipdo3BRS9lV_yDajwnFTrj7bBDVIXCxdlf4MX9NSsyb2_SgMG7J8HjbY
Message-ID: <CAG0V13RUPG01MLqEYaW3NNs86z7fo5OXAd-LvH+y3vCnAT+cgA@mail.gmail.com>
Subject: Re: QCN9074 load board data file failed
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_020826_102690_03AFF1A2 
X-CRM114-Status: GOOD (  14.66  )
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

On Thu, Oct 16, 2025 at 5:37=E2=80=AFPM Vasanthakumar Thiagarajan wrote:
>
>
>
> On 10/14/2025 7:42 AM, Doug Brewer wrote:
> > Hello,
> >
> > I=E2=80=99m currently running Linux kernel 6.17.2 on arm64 and testing =
the QCN9074,
> > but it fails to start up.
>
> Was this working for you before with an older kernel?


Yes, it worked with kernel 6.6.

> > It seems the issue is related to loading
> > the board data:
> >
> > ath11k_pci 0001:11:00.0: BAR 0 [mem 0xf2400000-0xf25fffff 64bit]: assig=
ned
> > ath11k_pci 0001:11:00.0: enabling device (0000 -> 0002)
> > ath11k_pci 0001:11:00.0: MSI vectors: 16
> > ath11k_pci 0001:11:00.0: qcn9074 hw1.0
> > ath11k_pci 0001:11:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff
> > soc_id 0xffffffff
> > ath11k_pci 0001:11:00.0: fw_version 0x2403072e fw_build_timestamp
> > 2021-06-06 23:27 fw_build_id
> > ath11k_pci 0001:11:00.0: qmi failed to load CAL data
> > file:cal-pci-0001:11:00.0.bin
>
> It seems the calibration data is not found in the file system as well.
> Since calibration data will be specific to the hardware module, you
> may want to check with the system/device manufacturer.

Because Kernel 6.6 works, I suspect that ath11k has changed its mechanism
for QCN9074, which now requires calibration data.
If so, where can I obtain this file?  Thanks.

> Vasanth

Regards,
Doug

