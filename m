Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A43C25B74
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwSErarG3XnCBZEH0xHJKJtH1HnOxj02Q0+dRGgh3gQ=; b=h4sqLGnMz/Ty1H98JWvT2yzcvb
	oAP+5tyM1ilii64M7lyp2bd+1Imkam4bJMeQ3Azzap1NmlFWudjkooiYBb8LfU2wAuesYWUaVZEyE
	stUdnb+6YGNBO0jXYscrMK/lG86K1sDX0MNRWVcuu1TehQUQCLn7YugNlNIX1FwV98eyEIz44Qmm+
	2twK5rW9bmOIa0+zo2hn6g2yCCmSc1v4PmOJY7DtrtO9fsGxRcBscNODeqEpUD6/T68yFYP4V/nI2
	nAbmFFuCaQSiLtAI3Jzfg3HEH1HrfUs1X11+qyco+3HotWD5yX261+iXDp5esvQg33+HQawYB33M4
	DbzcIrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Rn6-00000000PcW-0gF8;
	Tue, 21 May 2024 15:52:40 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Rn2-00000000PZj-3iVC
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 15:52:38 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-47eefa04398so1261405137.3
        for <ath11k@lists.infradead.org>; Tue, 21 May 2024 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716306754; x=1716911554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwSErarG3XnCBZEH0xHJKJtH1HnOxj02Q0+dRGgh3gQ=;
        b=ehS3gMEmJYWrcZjP90jHqZ1xKMqrONgsHOrs6NPgVDYRvmwt4MjkxMHJ/bumdpAuzB
         loSNxgKO9DNj53t4/ZBxiBIsxITfvdxPzDaTF2ZsVl3QJ2Bl/0i2fqoEnKSg0QXjyNWK
         hSYTijZwX3KjFn6ha5G5St3SVnqdIkUzZ4MBXCm3U8DusgovS5gLTQiwhbMrYZRkwxqd
         9B3awCZ6dhS84Td5NFF0/pgN5q5JVJEYCKQY9sR5Z6MTOJZkxafG7l4XGJuAWNXJO4l5
         OiLqyDf7OA5WM9Jy8J7pmRYstL1VrrDEMGgqERTox3sQOhXJMVy4C2AcUOEOD/FGnODc
         5Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716306754; x=1716911554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwSErarG3XnCBZEH0xHJKJtH1HnOxj02Q0+dRGgh3gQ=;
        b=RAEbT04VFldxVGtzTjSQKvDeziH9Lg+Irz5TBeE4Vk6tVwfuMFlHVIlMW7dnRvPJlJ
         CFwHqjJLbZiTQxUA7Q3TFT3Vajo3MCxoN0hr6puzKE1rCLI6YdJt5YnWakXhEmm0ndIz
         5hFDidMM+lorBX+SrkeI0TeKZi7/MveC7wJCMC4w/RkCJo2xM7snbDGgy7WXkRVeGVJs
         8xXpupuogVh+LkqAigbip155LnK4dZ+5CC9X2dF+9RYWIcTsNGXf7DAj2N1bKttvPyCy
         sBWM0uyCfQSSquZU23AJm7mDdZX08N5le/khReE+PmoQXpTOS0XVzmk/1e5Y56afe1iX
         Y88g==
X-Gm-Message-State: AOJu0YwjZjtAtWu1XSKEXY7aedjftBjlJlehs9hYvQvSKln3vcdDeFMq
	2yj5K/4MdqSUe6P1YpuEaLPlX50UdB4rGjPuRmDg06/hGakhB+/Je+cAIvOuFTWHkHBudK8gfMV
	RBOgAr9PFZ2Wf/BMDiG9SM8dy62k=
X-Google-Smtp-Source: AGHT+IHLhGhPFwyiLnZkxDcMZZSuE2zZv4tnO91pxtJJXc2GLcgcA5ZIZfK2cP2B2ElyVdbK+AB/VlI0/xXZ+tOWsE4=
X-Received: by 2002:a05:6102:c88:b0:480:77c8:8d96 with SMTP id
 ada2fe7eead31-48077ddcf74mr35164963137.5.1716306752661; Tue, 21 May 2024
 08:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
 <87le44eqbl.fsf@kernel.org> <CAFKu21b_4fbP3Oku_CLBOYi7wfwmYWUXoG5H1gknvFit-wc4Rw@mail.gmail.com>
 <CAFKu21aQjbf_vsyikhQqDa0s99WQpzepLa0dWmmhVo5yeWr=Gg@mail.gmail.com> <87zfsjbd1s.fsf@kernel.org>
In-Reply-To: <87zfsjbd1s.fsf@kernel.org>
From: Matthew Schwartz <njtransit215@gmail.com>
Date: Tue, 21 May 2024 08:51:56 -0700
Message-ID: <CAFKu21ZT9WnvczemLtjKO4U=xX2q2riMx_eWfxozvZ7_mjp_9w@mail.gmail.com>
Subject: Re: question regarding qca2066 and qca206x (Steam Deck OLED/Galileo)
 on upstream kernels
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, cristian.ciocaltea@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_085236_950860_5CBF41FD 
X-CRM114-Status: GOOD (  28.23  )
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

On Tue, May 21, 2024 at 4:49=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Matthew Schwartz <njtransit215@gmail.com> writes:
>
> >> Is the mismatch between file/directory structure for QCA2066 and the
> >> upstream QCA206X I had to add to the upstream ath11k firmware going to
> >> be an issue? Also, QCA206X seems to be missing Notice.txt. Will this
> >> cause any issues?
> >>
> >
> > Sorry there is a slight typo here. To clarify: Is the mismatch between
> > file/directory structure for upstream QCA2066 and the Valve QCA206X an
> > issue. I described the wrong folder as the upstream folder in my
> > original reply.

Whoops... my last reply missed Reply All so I'm resending here. It's
my first time using lkml so apologies...

>
> So from what I have seen so far the situation seems to be this:
>
> Steam has some ath11k hack patches to add QCA2066 support to an older
> Linux kernel and they also have a separate firmware release. I do not
> know where they got them from.
>
> In Linux upstream ("kernel.org") we added initial QCA2066 support for
> ath11k in Linux v6.9. We also provided the firmware[1] which will be
> also submitted to linux-firmware.git in the near future.
>
> The ath11k upstream version uses different directory structure as the
> hack patches, which is not uncommon. Basically using hack patches is at
> your own risk and no compatibility is guarenteed, of course. But once
> the support is in official Linux kernel we take backwards compatibility
> very seriously.

That makes sense to me.

>
> I want to also mention that even if Steam's ath11k firmware version
> might work, I still recommend to use the firmware from our repo[1]. I do
> not know what changes Steam's firmware version has and it possible might
> be incompatible with kernel.org driver. In this mailing list we only
> support firmware releases from [1].

I will go along with your suggestion of installing the firmware
properly (rather than using copy paste) by using the instructions you
provided in your previous reply, and skipping the Valve firmware of
currently unknown origin. Per your advice, I will also file a proper
bug report for this issue if I confirm that I installed the upstream
firmware properly from the repo that you've linked to me, and if it
still fails at that point.

>
> [1] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/ma=
in/QCA2066/hw2.1?ref_type=3Dheads
>

Once again, thanks for all the assistance you've provided here,
especially as it's technically out of scope given the QCA206X's
origins and my install process that I described in my previous mail.
I'd really like to switch to using upstream work here rather than rely
on hacks like symlinking to QCA206X, so I'll do my best to follow up
and report my findings.
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

