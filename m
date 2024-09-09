Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE7ECE57E
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK4KanhWlRZSYU1GucfWC16J4+koH/HjKOEGZSUcp98=; b=pzpTbqFD2KoH/S6zfS5D3FLpA2
	1nQiWQNQB75CERWkGlzIaW/72qH7NO3663DrOkLUi+Y/T0ciUDBcaFH8oCO4KqoSUdVtqhKUmTqMF
	q/cAtrBJViqHLqMzcFy5B1pDMtbYsF4C2RfJ4pOC/4kzXQYjTlXsVIKR2jzNoHVBGYfbQ1WHgvF6b
	eUL0q/TEbZ6RzYQEz/IlBdPdTNXeavlyK/JnHujib/UdBC/WQT7sleJBu17Xpnu40VNKqUq2WJkpR
	X4L3PiCXCiEySEn2szC0jmpYBqcb4O7ASKsWmL2ShHcuO7r4JAR/rCY6s6tE+YP2SFa3cHqa8hOAq
	zm+KlAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZdH-000000013Og-0Zng;
	Mon, 09 Sep 2024 08:20:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZcu-000000013Cq-2zAf
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 08:20:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so34336151fa.3
        for <ath11k@lists.infradead.org>; Mon, 09 Sep 2024 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725869997; x=1726474797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK4KanhWlRZSYU1GucfWC16J4+koH/HjKOEGZSUcp98=;
        b=h06R6Hpe493S6fvJt8lmFypo1V96t0y9AauRry6cD6+OA3YfuTB015+s8WLZ86FD4G
         vNa8woIhNHPu9CL8OjlOccWP7CLsIMAl4a/hnAtzLMt7f8XabubZPlziJRYfrSUL3g+i
         K9XozgwTZW+USOW7WPLl90gR9U6nWYTJtIa/LgfTcPmfpgI//UHcZoZ9suH0ycGx7YsF
         JI1ZwYZuMRAJEk88Y5RD1B5tZG+0SNLhHOuqySvM2LQhpsOlXOQaN0D9KTuBPwi5KZkn
         yjwQD4oo/Q7TiEiSR5MaHW5xElD/lkuczNOuZl7kHpYcJmk/TmDimZNOGfAWDWOV5KlL
         UjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869997; x=1726474797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK4KanhWlRZSYU1GucfWC16J4+koH/HjKOEGZSUcp98=;
        b=ZKGlKAaJCGmuIN4VQq0dx58/PlW0bZ2pik7DkgInL0RaosdUGk4fmldYvN/TYhrxxZ
         Kz7gIoezWbaC5DVbZ5wl4y8bB7a0vMBSxQq6GhyPeFws7wWUzEtUhpp0bcXljC/PHnjT
         0ek+ZDp5ln2/n4+p4dge1uWoiucuIjOOgkKzv4aZU55BTRLcbq9X4xJwWAc0U4dZw1gE
         SZxpFleF5lVKju0L1BC6O3ExLgL0zSuaJZzL2q/4/VDXzP1xBEw2BWZZEnJijEedlnTN
         tUI+wkQMVOIgBejL8LP0t2hU0EE7iG/atj90v29xAJQTe2IrS9nEQOHonZl+tF3mNf+o
         mXwg==
X-Forwarded-Encrypted: i=1; AJvYcCUVkqIRQ0m6gtZyR3X3VqWqAGXOTGPx/UcnVuOfWrfYIJZXls9mS93IfFuLRhPTMFDrNN96sCg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww82LRukrY1LokX4PdVLS4jo/nfpemoFX3es5SGGI/ZGbiIKJd
	n1PBdy+rBQTZiNfsh2qGZqxmD2u626gbLM3GEWz8PcjOqyGRHvjRINgPAyOdL9sdWkZLyoSmsFW
	/UgGC9tHQnH4+MZPN4kTImAFOYF2iUIuEOdJ0fg==
X-Google-Smtp-Source: AGHT+IHxT+bODhO8JSo/tiDz8IhrsZj4aQ7sUddKJwKAAWcGwi3uMKWPvMrXkLnRaBJd7bYB8HRQme7uZiCnsN4k1KI=
X-Received: by 2002:a05:6512:4023:b0:535:6b9e:bcdd with SMTP id
 2adb3069b0e04-536587c73f8mr7930705e87.33.1725869996139; Mon, 09 Sep 2024
 01:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
 <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
 <87y146ayrm.fsf@kernel.org> <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
 <878qw6hs4s.fsf@kernel.org> <CAMRc=Mc_Qy6-Rgsw_uOweUXtoiZGMR0D22Ou9nXUJDDdPCZqLw@mail.gmail.com>
 <1e77b503-36ff-4a97-993b-f87d658c9970@quicinc.com>
In-Reply-To: <1e77b503-36ff-4a97-993b-f87d658c9970@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Sep 2024 10:19:44 +0200
Message-ID: <CAMRc=Mc9kzC6PLZM2-kmuC-FtzdM8P9e-YRVxWjg28tAc7BRgg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_012000_932752_219FD72D 
X-CRM114-Status: GOOD (  24.55  )
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

On Fri, Sep 6, 2024 at 8:38=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc.=
com> wrote:
>
> On 9/6/2024 12:44 AM, Bartosz Golaszewski wrote:
> > For upstream - if you're using the WCN6855, you must specify the
> > inputs for the WLAN module so it's only fair they be described as
> > "required". For out-of-tree DTS I couldn't care less.
> >
> > You are not correct saying that "M.2 boards don't need these" because
> > as a matter of fact: the WLAN module on your M.2 card takes these
> > inputs from the PMU inside the WCN6855 package.
>
> Let me start by saying that DT is one area where I'm a newbie, so I hope =
I can
> get some education.
>
> I'd like to start with an observation: I've used both WCN6855 with ath11k=
 and
> WCN7850 with ath12k on an x86 laptop without any device tree, so from tha=
t
> perspective none of the device tree stuff is "required" -- these modules =
"just
> work".
>

Yes. This is what I refer to as "fully dynamic" M.2 cards, where the
card typically has an on-board PMIC that handles the power-up of the
device, respecting all timings etc. No custom pins are used. You don't
need device-tree. DT bindings don't concern this case. Even it this
was an ARM, DT-based platform, you wouldn't need the DT entry.

> However I also realize that when these are installed on Qualcomm ARM plat=
forms
> that there are GPIO pins that control things like XO clock, WLAN enable &
> Bluetooth enable, as well as voltage regulators, and the device is
> non-functional without those configured, so the device tree items are req=
uired
> in that environment.
>
> So just from that perspective saying something is "required" is confusing=
 when
> there are platforms where it isn't required. And perhaps that is what is
> confusing Kalle as well?
>

The properties are required IF you have a DT representation. Because
if you're modeling the physical package, this is what it looks like.
The one on your "fully dynamic" M.2 card is the same - it also has the
same internal inputs and outputs but you're not modeling the external
package in the first place so you don't need to care about them. But
if you do represent the chipset and not as a black box WCN6855 in its
entirety but its WLAN, BT and PMU modules separately then it warrants
making the true inputs of the WLAN module mandatory in the schema.

Please let me know if this is enough of an explanation.

Bart

