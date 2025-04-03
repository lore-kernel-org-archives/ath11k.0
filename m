Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D903C3600C
	for <ath11k@archiver.kernel.org>; Thu,  3 Apr 2025 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=; b=Gh5wy57URx5zkQCky1Dv+qSaEc
	8WKcQ+MeYeIBXj4jOWNz93m5yofDQet1jlrceIROB/SSeX2jm+lY1duoyBykzyMczQiAihuuEs1xT
	wwZmxJGeuLjHc1XyDoY/pGZW2rXzVvZCtPGMdx7M7GDMy4SPFWLeJ8/i7M97cVPOedrQgS2guVAR3
	pAAJyW5KWVcPwI3l60COdgIclMvhtDuHNn6xKQXHbaMxJklzZNSeg97A7B1eH/o5USO0gT3CwkSwV
	NfdY5SI0ydnkxDvNiI9zj3rjdTt2Uuagyub2Au7It5gWcK2O2NSEYD25GB0tMjGNcp31eKB7zWirh
	6cQDRhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FBf-0000000899o-0rPv;
	Thu, 03 Apr 2025 07:40:32 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F9o-000000088np-43fE
	for ath11k@lists.infradead.org;
	Thu, 03 Apr 2025 07:38:39 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30db2c2c609so5500271fa.3
        for <ath11k@lists.infradead.org>; Thu, 03 Apr 2025 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743665915; x=1744270715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=JDp9doqs+dYZhKoYlOV2HBzpAY2J57vF+PE+mdPrxQEnk384Gwn4gGmPg2xY8WBL3k
         UaVl5V1mVCfPrz4hrsKf1baAXST1Yk6TYeutQgOGTGGNwjVxJQsgYTzx1RSqctiomXbS
         1jkcCXu44seBuqW73Lx2cVjDgHhC0k9xFNeGHuPBL8QXyCUBelr6PQGABUU6AMSSJMJ+
         UQK5qxjUNwZ8qmXdDLos9a9cpvyVtx/5mRgsi+CPC6QGLh1PQ6ETKfhCv/I4D+JujO0g
         Tnp/yjogTVqL868AQejjxbrNPrcEOFalUYO+h2PhsUJKanf4y/9/uRPDLsbZUwnCFpsr
         m0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665915; x=1744270715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=T+6q2wVwJ1HGL4VAAFncrrdftFz+wsa4SJh47XSbdE3pBfnKI0EiXN0Cl+Zh1bT9rf
         sqzUrEzqW7bs2nqUUBGXag/8gvDp1G8rnZf6nlPulWoUiZ8wT0HCH/viVSM/8y9ZwnJg
         EDueuANKPSkg+DbYxu4Pgu4SDXkAuXWLiJXJIIramYnbgbJxiw1Mn6m2snBebQ41cVjJ
         1Tu4tm6ud85gnhEYJ5PicfSXmCk8NroC3U7yxYsinZJZhU/HKXXhf1SJDEQ+QUKkgUG3
         ypJcCfXmTy+HQFd8DD4COFc3nMvU0tSLR4lyhNF+08F0IzrBK+RUCzm/FT3vv3y25C1d
         pqTA==
X-Forwarded-Encrypted: i=1; AJvYcCXehkF0AakDdPNQ0XHxkzN81/MbhUP86fXRxC/PUGPz7tF8jwhWNsQxkhptLiv6uMTESanzkfU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpnqwZkO3LQkeLksjJdO7Rwu5r7p82cCXKrUDrPRn4/7uoyJzA
	3aSBnz/LzwD7UD9iRMhvv6tWfQarKo30iNSQlQV1lTElMH/+zwuZ3I5FzdUjlRmMoTLR6+mydSg
	20MFYMZTJ3z0547BUdds/A4lc5igACKafswcLeA==
X-Gm-Gg: ASbGncuQwl5vgfDtT3lOPR2Tm/pE6HJ/g3vks3FrTX0Vvfv4O8/KVJmiJeNxGO7l+sU
	XYkoyqfv8GmAFmPBrRuIo65P43k/E90ZOED6ILlmmj4h5OGpSJzh+wfSDTITmOFbG2Wwupu0BB0
	GwjKE8K7vXcE7xhuPM5q1MP3MW/iHac1yl/8TMLP498siFTIr3ScexJUzu
X-Google-Smtp-Source: AGHT+IE+efI2xX/8yZlFAe4Vm/Cxzz+Nax11lqQy3zdclZUZJJhpwXV7c7fhUqN3JwjPrbPY+ZyZGS0ljljrKBqXCe4=
X-Received: by 2002:a2e:be14:0:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30f02b985a2mr4363601fa.24.1743665915290; Thu, 03 Apr 2025
 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
 <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com> <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
In-Reply-To: <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:38:24 +0200
X-Gm-Features: AQ5f1JoaECCB4Ig-OQoVaRV_IJbeuDbZtSRj286KtUBGCZkrM4_HeX7c4fhC4-E
Message-ID: <CAMRc=Mf3on3TpiPDhtPnp1-3b0ika2GHy6h-NJqcgvYpWMHpoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_003837_207754_0E55FB63 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Apr 3, 2025 at 9:19=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Thu, Apr 03, 2025 at 09:11:07AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kerne=
l.org> wrote:
> > >
> > > The PCI pwrctrl framework was renamed after being merged, but the
> > > Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> > >
> > > This leads to people not knowing how to refer to the framework in
> > > writing, inconsistencies in module naming, etc.
> > >
> > > Let's rename also the Kconfig symbols before this gets any worse.
> > >
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm re-adding the tag here as otherwise b4 will only pick it up for
> > patch 4/4 on v2 of the series.
>
> I had already added it to the first three patches so it was only
> missing on the last one.
>
> Johan

Indeed, sorry for the noise, I saw b4 only applying it for the last
one and didn't check git log.

Bartosz

