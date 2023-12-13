Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F88C4332F
	for <ath11k@archiver.kernel.org>; Wed, 13 Dec 2023 18:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shA7acSNbEAgAD7Pdz2mOsVb+vZD6AjllYAPF73isj0=; b=sTAWO+94TWSqygK4m3AirxVHqG
	gsYusTa7vCvwj5sPrz2ZRMKfkMWdiJP4tciquhh/gvbClDrYZcAY7NbijjbT6MZ4SIwULDSVJASbu
	oHNIUWdrAvfU0eh2Jh8L7jLdGuUl8Ela95K9vYk6MDeiwE9gRqX+fvLbQdfkzFzGtjixSttsM0FsU
	kjCAoynoyOZY08H31JuCrHr1uQgdElkBjGbhyJ1a+pHlMx0CeyHPXueMLYemduem+6ZLplrLIdoah
	Xg0XW2WqcecdA9t97e+GkUUiliCm1i+bucH2Naq83bTFacgXTVCfVFGI+m2sbG/qFBxZKoyXrZFx/
	fZC1Zk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUQE-00Fm1y-0j;
	Wed, 13 Dec 2023 18:57:30 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUQB-00Fm1S-0m
	for ath11k@lists.infradead.org;
	Wed, 13 Dec 2023 18:57:28 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ca00dffc23so92824841fa.2
        for <ath11k@lists.infradead.org>; Wed, 13 Dec 2023 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493844; x=1703098644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shA7acSNbEAgAD7Pdz2mOsVb+vZD6AjllYAPF73isj0=;
        b=mcaKBkhMYnKZksVU/uYGNXMICILAQ6GSa+hlgaNMfi0ihY6AGLB9Q+ClmIvV7i4hbL
         ziwL+eU5SarmwI9UTLSYTUan5i5zu1kYFY4iLsdw8A1FYxuzx9bcTdJZK1nYSBvo+hnM
         jV9p7lp3t7YTevVSRXJnDNoy6Hbr7cozWvBejDrYP3FbFpTmwNvPLlg4RDvEzYZBxzYA
         SOyljKdTydxMWJ1nLp5P7oNY7nwnBK8t1ZY+VV0+3N1l8dbtyYdIZ+r1sMDQ3FoiGGby
         i8m+6PlHLo8vCP+RAmAeUvRfeaTyFNqcR/q2DZSLZo04RP4peTrLmVtRkGSJzJOJ9urQ
         jDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493844; x=1703098644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shA7acSNbEAgAD7Pdz2mOsVb+vZD6AjllYAPF73isj0=;
        b=UY4P6H8hUWPBp9qqbKP0ztnO29ctuQQ8fVVZRLqIlsegxeUV7D/pQPSmJFWJTYLU5X
         aKJW7bRWDQY6uvx0H7aIA1BmVd3wrgaJbOe0AeO4sPPWdYfHK/JCukv/PmJe66UqRP1/
         6cCYrHX2scPozjhIrPcP+7jFsLE5xg7wULw1tiXHvX7BIWL0bhRmE9CZsgZHTbkfif4o
         UjmdsleQDuJpS7arMtjrS7FePyGCIPbGH4fx5Mz2XsICVPBW77bIGXiM4bHIM+Q7++/T
         LQaxqvtcjjxom92HpwjRUYbQTjNzgaIqyzN6fhYlaUhZAb3yesaV/UDfPX5l28ycdZuC
         TtnQ==
X-Gm-Message-State: AOJu0YwMJV6HCG4sDiErbWqlK9p4K8XIFznVPlJ50xuTOaI5caeq6eE5
	g82A14Y4IEn3RLt9d/aX6xVZb3GbOJY2Vv477lFz6xfz6gk=
X-Google-Smtp-Source: AGHT+IFmV06+7J1O+zukhpZrCAQmQhW2+Ffb65sU1+ofQ9AyFpigZJZlUgN5Tf8fzKNLLfHB2kAhIpOmCt1R/zMa0Zc=
X-Received: by 2002:a2e:2ac4:0:b0:2cb:2846:6faf with SMTP id
 q187-20020a2e2ac4000000b002cb28466fafmr3878587ljq.0.1702493843855; Wed, 13
 Dec 2023 10:57:23 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org>
In-Reply-To: <87a5qeof5m.fsf@kernel.org>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Wed, 13 Dec 2023 19:57:12 +0100
Message-ID: <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_105727_281566_AE45C505 
X-CRM114-Status: GOOD (  11.53  )
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

Hello, Kalle!
Thank you for answer, unfortunately, I would prefer to stay on
openwrt, until it will be ruled out, that issue is not with my laptop.
I have this router for many years, and it was always on openwrt, and I
did not have such issue with my older laptop, on iwlwifi driver, and
with any of my phones, with this exact router.

I've tried different firmwares and drivers on the router -
kmod-ath10k, kmod-ath10k-ct (currently used, most stable),
ath10k-firmware-qca988x-ct-full-htt (currently used, most stable),
ath10k-firmware-qca988x-ct, ath10k-firmware-qca988x - no difference at
all (except stability of MCS)

=D1=81=D1=80, 13 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 06:16, Kal=
le Valo <kvalo@kernel.org>:
>
> Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:
>
> > Hello! I found that my new laptop, Thinkpad T14 Gen 4 AMD, cannot use
> > 80Mhz for rx - even though AP supports 80mhz, and tx shows full 80Mhz.
> > I reported it as https://bugzilla.kernel.org/show_bug.cgi?id=3D218246,
> > with all the details, but, there is no comments in it, so, sending it
> > for visibility.
>
> A team in Qualcomm said that they are looking at this. Do you know if
> this happens also with the stock firmware or is this openwrt specific?
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

