Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C02AC4708E
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCcnygXWWdZT0qUNOp8XdvU9UOr1+dxNfGy/idwr4FA=; b=MJ/DJJl7Xvc+1j
	B5zOXuo599HYzMRBdorX56ZGdG/h0NjwlUfMLXmjlz19WSsL19ga3ERJtdEhcFxF85JXL8RPXIE6z
	gxakc9RK6gSesLG/i5iMPTbDZA+S70ojkVLg9zT/CQoM4rXG1dKFBj7E12nmtVHLEtoSbizU9sXLe
	3T/fyZ0t62YzrEp2F/4SSTK2JHjCl+BLcRt2m8p9E/Og9IUOcQuVx2xqGuanYKOv920ye5toP+VfP
	K5N0aJ6dzM0O0q43qbdkllR/qIojHR00gga/zJPoKQ+q1bY6XZRzwb5y/S5mJkQRoKTmLp3gRCirN
	MaHFkAGodP0tsCROwnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uSW-003VEi-RW; Wed, 07 Dec 2022 13:27:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uSU-003V9S-6r
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 13:27:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y4so17023395plb.2
        for <ath11k@lists.infradead.org>; Wed, 07 Dec 2022 05:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SVtLN2qkZRomTPMoLmHvAsmkBP6ej5gEUNliW4Ts9kE=;
        b=GtxQbkJTVMXb+93S0a+pmo2lOV8KVToqXEeEiGz1kmufuUdvaWKOw7+NGkYM5/jgeR
         ae1IlCHG2ntK4QbhLqu5KWQLWC2ybTJHUAFEZ5S2D4/3x1UyB5gCewPjSF3AyEH2mv9H
         GvUb5jyE0KQukiYs6t1ps6Zm7xl1zwTjZLEuMgJEJ3gHcnyEY7IjTvn8riAF8glPUMjj
         AHuz7QxeKPYS/EwM4ZozpJyBmAZ1AX9M8FoWkU7huLwx0aCv2GpWxo9lk7Xcl26aLvjA
         SkDTkdUHK1kdG7O5V30jF0lq5QJ5s9LGXfJaPBHVT0yJN6Rv04YpwbrvP3Y80vuWqU4Z
         o0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVtLN2qkZRomTPMoLmHvAsmkBP6ej5gEUNliW4Ts9kE=;
        b=3WqAD+JyhHr5Qn845m1Ja0jYSv72U3v3OGw/9cp689xaBFEKkwkD2+LcEk1OpVg/6W
         5m496fNYsIAmtMWtXv5D5Jhp4inVz4AwuyaAvjFqAbZFj5aU3U1WAD3XrqXRo4+AQx7f
         hdw8C8Uqd7CvTLXF1G2fwxRM5xmt5iRbPXxL1y9EEwM5oOhinf7OYMPsDqsaQQnjOjNR
         p4u2QeDiVraH2kNMXjycQUBMIsq3VQ4ea25Jh7EP8rHRdH6pjxZrU1GoyxiQOIY5nZNL
         jqZCXTyOTTQTjK+ev9Z1M97N6puM74ZmxkQ3P670NVKR8tJFXv3RJ5LvC4pLY4fECiFa
         mMBQ==
X-Gm-Message-State: ANoB5plQuyYb/UWC0gyOjQNQRppp2Nk+aJA/PRspTJ7v1SXhqPQDFsIU
	KJCxL4Gh0IcWAVPJSdvgG+skIc0HA4GeZkz3K2u9NfjdOWhlvxS6
X-Google-Smtp-Source: AA0mqf4cE4ZJ4NH0524v04NiSg11SoYBd6OQMYR86mGYonOcO/xCYkW0PkHBRc7wtHplUwIwKlH9ECG2ug//gbN2qzU=
X-Received: by 2002:a17:902:8601:b0:189:7372:144c with SMTP id
 f1-20020a170902860100b001897372144cmr55430911plo.106.1670419649721; Wed, 07
 Dec 2022 05:27:29 -0800 (PST)
MIME-Version: 1.0
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
 <878rjj2ww9.fsf@kernel.org> <CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
 <874ju72w7g.fsf@kernel.org>
In-Reply-To: <874ju72w7g.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 7 Dec 2022 14:27:18 +0100
Message-ID: <CA+HBbNHQvgt+_ihFST=ZPeuxjRzovL71oKgbP2X5B8a6ZBq0HA@mail.gmail.com>
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
To: Kalle Valo <kvalo@kernel.org>
Cc: Legale Legage <legale.legale@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_052734_286000_F4F534AA 
X-CRM114-Status: GOOD (  24.15  )
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

On Wed, Dec 7, 2022 at 2:13 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Wed, Dec 7, 2022 at 1:58 PM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Legale Legage <legale.legale@gmail.com> writes:
> >>
> >> > I'm trying to use wifi monitor mode on ipq6018. Captured frames are
> >> > malformed. Tested with 2 diff kernels (4.4.60, 5.14) and two diff wifi
> >> > fw (2.6, 2.7) with the same result.
> >>
> >> v4.4 was released back in 2016 and doesn't even have ath11k. v5.14 was
> >> released over a year ago so is considered old from ath11k point of view.
> >> Please try a more recent kernel, preferably v6.0.
> >
> > I am gonna guess that 4.4.60 is QCA downstream kernel.
>
> Ah, for any QSDK issues I'll raise my hands up and not going to touch
> them. This list is only for kernel.org releases, any distro kernel bugs
> need to be reported directly to distros. I do not know what out-of-tree
> patches distros have.
>
> > The issue with mainline kernels is that there is no remoteproc support
> > for IPQ8074 nor IPQ6018, I have been working towards getting the
> > IPQ8074 and its working with remoteproc patches added but the
> > situation is not ideal as for example coldboot calibration does not
> > work which could be a bug in the remoteproc patches I am using.
>
> Nice, do you have the patches available somewhere? What distro are you
> using?

Yes, they are available on my GitHub kernel repo under the
ipq807x-next branches:
https://github.com/robimarko/linux.git

I am testing the next based branches with Buildroot as its quick and
easy as I regularly
update on newer next as I am upstreaming and stuff is getting merged.
A lot of stuff got merged so the SoC is in a way, way better shape
than a year or two ago
but we are still missing upstream remoteproc support as well as CPR
support and there is
no offloading obviously.

I am also maintaining an OpenWrt ipq807x target that is based on 5.15
and 6.1 backports
for which I plan to make a PR to get it officially included once 6.1
backports are merged.
This is what a lot of users are currently using as it's gotten into
quite a good state.
The one thing that has been bothering is move to FW 2.7 which is not
working on a number
of routers as their BDF-s were generated for way older BDF as well as
outdated regulatory
information.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
