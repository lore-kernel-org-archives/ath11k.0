Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57F2CD13CF
	for <ath11k@archiver.kernel.org>; Mon,  2 Sep 2024 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VG1MaX9Wixqm8LX4jVIjxRtWDElDhiE8Ho1xpB08+bA=; b=dR2H5owXfHN6j1nkvaXe25ZonR
	6AthlAJFn7p94GQ/CcCch4QL90+HWhvQkwPgyC/R6A6RHgSgBABH8N2t8i+ji6NSK0P3C3W/tnj9p
	D6EiMEHgW5ei31oZOVize1kJVQwmGORHVdVp4nsYWIhjl+fiL1RaOViAG0rQlewW/3DDCnAWxe/Kq
	XlWJW0GyNneMULLB8i9B/YA8H8o0mo/oQdSjeK42276OUU+tvdBRyCU5NlGl3W7Y2WLafonkPUkxJ
	NbaADeVJgH7FUKB+3N/wgEhyeoCFj5Xn8dQ3a5n9bgEC+xoJx8Kn4BTLswzpzjve0WtOeyJiw3utZ
	uPcqO9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2W0-0000000DX93-1w5c;
	Mon, 02 Sep 2024 08:34:24 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2Vx-0000000DX8B-14kh
	for ath11k@lists.infradead.org;
	Mon, 02 Sep 2024 08:34:22 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f50966c469so44042411fa.3
        for <ath11k@lists.infradead.org>; Mon, 02 Sep 2024 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725266059; x=1725870859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG1MaX9Wixqm8LX4jVIjxRtWDElDhiE8Ho1xpB08+bA=;
        b=D6JLJDN6VHPrRFBCLdZX5MYxPjamWW0nhXShyrtew9jyHqWMMx+XumYcDTPm/4n54/
         WzrluZqCt/HqvgfIMVNgdPQdZxyA1x/+OfVEy5QO3yy2jCzYq5Rr6GD+FUYQ2Rcx0cDy
         UOnKqOEi30KUbDJOR81UfhHcYcGicdSnnNvZ5pIsT3Hg2Hr6yjaVmi6A63sVOGTPIOQg
         i3gpNRz2N3tX9yUEERfePv3Tk3kn55Zib7Zb1IvFIIpXVxPe97TR+vQ6pa+HDNaLom/O
         2OQpo3VhoVOtxDxHvczZCN6WnbQntIHWbilshKZWBQhlzK/zAnKwcW3mQG4tcNZJ5zkv
         Kehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266059; x=1725870859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG1MaX9Wixqm8LX4jVIjxRtWDElDhiE8Ho1xpB08+bA=;
        b=m7x1Z0F7uaNBVTS8+LqoxbhIUOlgffGX3+uFffFP0El8huqbh6vb0Ck37wSkEBYSW8
         BY3T5+HK0YMwfBEQLwueUnZ104zV+Y/JYHyvIPo3HNRZwqX10cQDJiRlTzMBPl5d36VO
         KtBYHO3mDSIEYunnAkIsCRrTDcu6LcXpLMQFiI4qXx7mq/BRdbQp+mNqbDOPBybMO1ic
         eVzDUOqnSaVQ1Z7LQ+L/NJRUPNySxltFfhbvzTxmlEtIBHwTUxFKNBOrtKjPNSt0fyE/
         zChxTB3Xjc2JxtmBqGEriPVlIZ7KsAxN7ox3txxV/467PlCqNyZPNGjRm/UzMkmpm/X6
         ZpUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlyuTDj+yfQGafNnHa4M74O/UFtPaQBAunRPudHtXqA59f/X9zYszuJMcOrcgHOaPAr0idEgE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvbavKcTkvL0TNsSeLA+zpi8dTxNvshdH+mXp/4B7uoA3OoGzu
	ixS3ifuPoSp4CrvOakaor/Bf2bdianyavHeCnxgbiizzTphUobqEBQBPZjImiNCPndWi59BKVRj
	7hO/dZzmHYug4mCiEUhelVpG/fzQ4MXYwu52F9g==
X-Google-Smtp-Source: AGHT+IFZPkz+zpegGiynrc/uuNxJ0ov4qqo022LeyJfV540+XBhmrJitjFwxWZA+2HM3HGR7rldq/MxJvLLQLrQlwh0=
X-Received: by 2002:a2e:e0a:0:b0:2f5:136d:89ef with SMTP id
 38308e7fff4ca-2f629063f04mr32120871fa.22.1725266058091; Mon, 02 Sep 2024
 01:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org> <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 10:34:07 +0200
Message-ID: <CAMRc=MeuB1yhENHXqLxRf8xFNm7dYvjLisa7zsd6_2ov_OPw3g@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_013421_316573_503B0E77 
X-CRM114-Status: GOOD (  18.36  )
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

On Fri, Aug 16, 2024 at 11:10=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Fri, Aug 16, 2024 at 10:26=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wr=
ote:
> >
> > Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Describe the inputs from the PMU of the ath11k module on WCN6855.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > v1 -> v2:
> > > - update the example
> > >
> > >  .../net/wireless/qcom,ath11k-pci.yaml         | 29 +++++++++++++++++=
++
> > >  1 file changed, 29 insertions(+)
> >
> > This goes to ath-next, not net-next.
> >
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath1=
1k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pc=
i.yaml
> > > index 8675d7d0215c..a71fdf05bc1e 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.=
yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.=
yaml
> > > @@ -50,6 +50,9 @@ properties:
> > >    vddrfa1p7-supply:
> > >      description: VDD_RFA_1P7 supply regulator handle
> > >
> > > +  vddrfa1p8-supply:
> > > +    description: VDD_RFA_1P8 supply regulator handle
> > > +
> > >    vddpcie0p9-supply:
> > >      description: VDD_PCIE_0P9 supply regulator handle
> > >
> > > @@ -77,6 +80,22 @@ allOf:
> > >          - vddrfa1p7-supply
> > >          - vddpcie0p9-supply
> > >          - vddpcie1p8-supply
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: pci17cb,1103
> > > +    then:
> > > +      required:
> > > +        - vddrfacmn-supply
> > > +        - vddaon-supply
> > > +        - vddwlcx-supply
> > > +        - vddwlmx-supply
> > > +        - vddrfa0p8-supply
> > > +        - vddrfa1p2-supply
> > > +        - vddrfa1p8-supply
> > > +        - vddpcie0p9-supply
> > > +        - vddpcie1p8-supply
> >
> > Like we discussed before, shouldn't these supplies be optional as not
> > all modules need them?
> >
>
> The answer is still the same: the ATH11K inside a WCN6855 does - in
> fact - always need them. The fact that the X13s doesn't define them is
> bad representation of HW and I'm fixing it in a subsequent DTS patch.
>

Gentle ping.

Bart

