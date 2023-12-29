Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B9C47073
	for <ath11k@archiver.kernel.org>; Fri, 29 Dec 2023 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gQKxbNzbtoZPOD+8Xf8TDkO51kZfXvo+511zrm35WQ=; b=e2dpyo9kTkndWHb8U3ynBM8H0a
	3WqMsJ5dHPjHy1xzviCQKOxgZkC7yDrqwPRnv5s5/+oiUzCGbDwu0nUE2tHqV8Tif0fYd+F5zwSsT
	gjCMEa86nVHal5j65t4y2JxR3F+Hhl1NCszjSQmX/HIXNAJW1vJV8s1jgqmKzM6RC7OkgH8DbQ2lK
	pY1aXc6B+6udWiRCeW+uH5QSldQLbp01TbfrdJFgKIW61ApgKoQNT9aoAalfNzylVu7/mxw3yQCYf
	WZ4Va+moI220z6dbOcWoLeweqAX1HH4zkYKzgEsptcSZ4J1tW4v1tgZ8olOTuQ950zk/xFTAZq/iR
	LfIlDFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJG0X-001Cis-0J;
	Fri, 29 Dec 2023 16:46:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJG0U-001CiV-0P
	for ath11k@lists.infradead.org;
	Fri, 29 Dec 2023 16:46:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-555e07761acso366988a12.0
        for <ath11k@lists.infradead.org>; Fri, 29 Dec 2023 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703868403; x=1704473203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gQKxbNzbtoZPOD+8Xf8TDkO51kZfXvo+511zrm35WQ=;
        b=nDo1Yrr6IHZBoHVAPJPHdKX7GwTjEn2561ThNP2rMztlA+DsccElswIloQHb7t2O3q
         F0n4UXxWeu8hZaIUD2JBjf6o2kNb1SF2eJVnOHCPANky3zeexJ2OhXLgDTp8KjacChi6
         UtEEqC1jJXnTahV5/LTkQ48jdVuX8G1sGhGlQ7BnA3ivpC8M9ORjX8YcUIYKLWbAY2nw
         7IQj2PzK5bNy2kgF4D/gdtJCSRP1QhdfhBpt6nopAhmJ57dsZy1dL/LOCsS87rbPhnJ2
         0zvOofMWAyJhvzZooNksI3nYe1fLAz5etI3jiggMq9JzDTNuTWF+Ui8w8QRP+rew9m+H
         jbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703868403; x=1704473203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gQKxbNzbtoZPOD+8Xf8TDkO51kZfXvo+511zrm35WQ=;
        b=Sa6sYXDI2+wHvc9OjuJaKQuUei7SoSW0HLRkoQaOF/FEOzbtgn1+vzj1PoofqQxNta
         ruxoyQDdJXcFKqHzbqMOGTGUD8h6Mn6J2eoPvQt0entU4B9MYYSmzFw6L/Q5u8ZOaMvE
         dxJdS2sOu4cAHjrDpNwI8zm1sAuSoGmBUQ/CUiLPsQ/eXUJrDiULukq/WuHxGp7OArrn
         FUqxTmTY4wrcKYt619Q5EW5M7fZUxExfrNvv9zQnBBMWGMVSdBw+sdzR6aAqPE5CvI7O
         o1GYvyLKfDIpkfxzsLIgyC47mM+9P3sBPA3tVHrJq7NkSG4F3Rb1GM1gOXvdHi40FGC2
         EOIg==
X-Gm-Message-State: AOJu0YzHSTue1qIGHyDHz/06RyzUh/x0BppDWIW2AqXj8gw0dbOND3os
	PRNmf7lnwESNle+D7/ZvG4uWZznEubpRXv4s6lE=
X-Google-Smtp-Source: AGHT+IHpHarll98bUGWb8Dj2Irk35Ob505odlzo48aAuWoyFGV+4Jt/ankokhPd99+hVUCrRXNt4jxyK605k+4kYXbg=
X-Received: by 2002:a50:9f4a:0:b0:54f:48ca:27ec with SMTP id
 b68-20020a509f4a000000b0054f48ca27ecmr5867727edf.97.1703868402589; Fri, 29
 Dec 2023 08:46:42 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org> <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org> <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
 <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com>
In-Reply-To: <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Fri, 29 Dec 2023 17:46:31 +0100
Message-ID: <CADS+iDXMTRYN86PMuGRBcHtPB-hsax_X_XUAPajXsUYTRnwk-A@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_084646_209505_5C26A26E 
X-CRM114-Status: GOOD (  25.69  )
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

Hello! I managed to get another router, Asus TUF-AX6000 (with openwrt,
too), and on this one, there is the same problem with rx
bitrate/channel width display, in AC mode.

When I'm switching to AX, there is no display problem (it shows
HE-VCS, even 160 Mhz width), but, the speed of download (measured via
iperf3 -c -R on laptop) is the same as in AC mode, around 150 mbit,
while upload speed is around 800 mbit. I tried 80 Mhz, I tried
different firmware versions, available on
https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0,
but the issue is still the same. I tried to disable power_save,
without any results. It seems that the issue is with WCN6855, not with
router, as my phone managed to reach ~800 mbit download (using iperf3,
too), from the same router. What can I provide, to debug it further?

=D1=81=D1=80, 27 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 10:32, Yar=
oslav Isakov <yaroslav.isakov@gmail.com>:
>
> =D1=87=D1=82, 14 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 21:29, Y=
aroslav Isakov <yaroslav.isakov@gmail.com>:
> >
> > =D1=87=D1=82, 14 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 16:11,=
 Kalle Valo <kvalo@kernel.org>:
> > >
> > > Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:
> > >
> > > > Thank you for answer, unfortunately, I would prefer to stay on
> > > > openwrt, until it will be ruled out, that issue is not with my lapt=
op.
> > >
> > > I'm not asking you to switch your firmware, I was merely asking if yo=
u
> > > had tested this with a stock firmware or not. The more datapoints we
> > > have the better chances there are to fix this.
> >
> > Unfortunately, I did not test it with stock firmware.
> >
> > >
> > > BTW, please don't top post:
> > >
> > > https://wireless.wiki.kernel.org/en/developers/documentation/submitti=
ngpatches#do_not_top_post_and_edit_your_quotes
> >
> > Sorry, my bad - this is what Gmail does by default. Thank you for point=
ing out!
> >
> > >
> > > --
> > > https://patchwork.kernel.org/project/linux-wireless/list/
> > >
> > > https://wireless.wiki.kernel.org/en/developers/documentation/submitti=
ngpatches
>
> Hello!
>
> I debug this issue further, a bit - it seems that it might be a
> display issue. I enabled debug for ath11k driver, and it showed me
> ath11k_pci 0000:02:00.0: mac peer <peer-address> phymode 11ac-vht80
>
> Also, when testing with iperf3, it showed me 300 mbit/s, and it was
> limited by CPU on router (ksoftirqd was 99%), which is much higher
> than 150 mbit showed in iw dev wlan0 link
>
> I also tried to use 802.11n on router (HT40), and with such setting,
> iw dev wlan0 link showed me 300 mbit, with 40 mhz channel width
> (although iperf3 showed 200 mbit) - so, it seems that this issue is
> appearing only on VHT.
>
> My phone (Pixel 7) was able to provide me HE, with which I did not
> have such issue. I cannot downgrade it to VHT, to test, if the issue
> will be reproduced with phone-provided WiFi, too (after disabling
> 802.11ac in wpa_supplicant, it rejected to find the network)
>
> P.S. I updated firmware for laptop wifi, from
> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0,
> but, it did not change anything.

