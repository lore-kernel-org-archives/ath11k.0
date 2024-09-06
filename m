Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5CCE7AB8
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2iWgb97T7hXzF6zuXBGICV8UKLvinMfR+RbHOd+dQ4=; b=J1o+OWA3xkC/wAxBQDOuCX/57C
	R1T7QIzUYcxEi5HPdB+8BUVAKm7zbTcXRO5g9PtmiqwqfoZ2mZxXHN3eVhMObbyFmtfuR/I2pgzjY
	UALpG8zlo1BYM4uTv0QCCYbnAEnTuvY1Ezc3lvewC42E1qaeeUFYme5zG6qPWMTxjIvgnd6sgaw8z
	gpqaSFW0+tBXa1toJtddfVQlFwe3P4oGO/nYHqD3inryYDgQiu1lcJ922WDob2qKu0jIynWAvxj49
	VTmJVxoNQ/XMMnlgBZPCtRvJ0KX8HLeZ5SZov6jI80PmftEINBx54UImEV0O4vx2CIyBpxRDJURYr
	HjiC4aMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTfj-0000000BAFu-29UD;
	Fri, 06 Sep 2024 07:46:23 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTeB-0000000B9eX-1zp8
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 07:44:49 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f50966c448so20514981fa.2
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725608685; x=1726213485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2iWgb97T7hXzF6zuXBGICV8UKLvinMfR+RbHOd+dQ4=;
        b=exa6qoiErcmcL6BieyIjkiarX5ksNzozcDo7On9+JrO9/W3SnrKARDSw/PC1aBBCn9
         WKB4pF6QwUaKeybtzEtcgGYTjtq+kptuznhSz53FOepfiHUGksNPF6X9KZmt9nkEstRp
         iUwrTUC/lJ5k5IXGxqyflfhZDK9NRfuh5it4NutqdHs4HzFKlHocdMV3GVdB7PTWtoKl
         i6jfAQNeAIx1jjhuvgLEhrHinKYoTQl+wuYv13kaJSeNuEkyPiBHr6q1Xpfz/vhUUSG7
         XMDGGeXRa76Ge5hiVsB++s668mx9+2+8lWezJcOdIAoUwVdS5hdoQPcMw4IFWORLjFxR
         PRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608685; x=1726213485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2iWgb97T7hXzF6zuXBGICV8UKLvinMfR+RbHOd+dQ4=;
        b=s7GMUtS9iu8CKpkAmUzzLcfR81gVtKmAdMNQduJXcd3VNOnksdiC7s9Los5fenwahE
         ZJAA8i2WbSsVHRsMDpU/tc/T0mU5eYkO3oU5r+qXZSTcQqV5Zhg0Lxj8t36XS6lcTIP1
         2HYlZQrojrf4mpx4ZEXHh6MZDthg6xDOzOINLKaDlNvnKaB6waZQrWBIsNZmoxrDbnM/
         fosNvUjI8MA189x4HQn8GQQ9NXRi/UNChciBhQbbYGsGCaJRgqjAtqxht8YMS7F2Lj35
         6GmHdiBE6g2zF/k+pvhO/bMEmcm7LoAeZVlYtTu7nWDkh2DeDGZ5lGqIgEXuMmBs4KRp
         BPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6/1DVkt1GFOQB8pgRRwZX6eRJfQu8p+4zHq0Ak4yRncN0ELpsBfHoCl6FiAyzF+gBApZMMkM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5XB9gCHlwgncQomJCVe5uTUbCBns9b44dON9lOs0+J1ZDP9u1
	ifaTz2DnUJVpckW1/l426jBN9L9Wm6xdPYviA8x8gfvY8I1OnnNcbD8R9TF1mL86r1uXbG+R/7Z
	ELy6Icluqw5F8bNtsCbEdKNbPgyWY4iLZ0NqjlA==
X-Google-Smtp-Source: AGHT+IELjdXPrNR2ftHe5XllcZ3pyQfKCzq7O/b2xjHbW9q9Q4+MDzmZTA0vD6TNGPaxV5kp8/BSGDK9jb01VsONIG4=
X-Received: by 2002:a2e:819:0:b0:2f7:4c9d:7a87 with SMTP id
 38308e7fff4ca-2f75232641cmr10706661fa.21.1725608683728; Fri, 06 Sep 2024
 00:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
 <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
 <87y146ayrm.fsf@kernel.org> <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
 <878qw6hs4s.fsf@kernel.org>
In-Reply-To: <878qw6hs4s.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Sep 2024 09:44:32 +0200
Message-ID: <CAMRc=Mc_Qy6-Rgsw_uOweUXtoiZGMR0D22Ou9nXUJDDdPCZqLw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240906_004447_603550_9A6EEBF1 
X-CRM114-Status: GOOD (  20.24  )
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

On Thu, Sep 5, 2024 at 8:28=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > On Thu, Sep 5, 2024 at 5:47=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wr=
ote:
> >>
> >> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >>
> >> >> > +  - if:
> >> >> > +      properties:
> >> >> > +        compatible:
> >> >> > +          contains:
> >> >> > +            const: pci17cb,1103
> >> >> > +    then:
> >> >> > +      required:
> >> >> > +        - vddrfacmn-supply
> >> >> > +        - vddaon-supply
> >> >> > +        - vddwlcx-supply
> >> >> > +        - vddwlmx-supply
> >> >> > +        - vddrfa0p8-supply
> >> >> > +        - vddrfa1p2-supply
> >> >> > +        - vddrfa1p8-supply
> >> >> > +        - vddpcie0p9-supply
> >> >> > +        - vddpcie1p8-supply
> >> >>
> >> >> Like we discussed before, shouldn't these supplies be optional as n=
ot
> >> >> all modules need them?
> >> >>
> >> >
> >> > The answer is still the same: the ATH11K inside a WCN6855 does - in
> >> > fact - always need them. The fact that the X13s doesn't define them =
is
> >> > bad representation of HW and I'm fixing it in a subsequent DTS patch=
.
> >>
> >> But, like we discussed earlier, M.2 boards don't need these so I think
> >> this should be optional.
> >>
> >
> > If they are truly dynamic, plug-and-play M.2 boards then they
> > shouldn't need any description in device-tree. If they are M.2 sockets
> > that use custom, vendor-specific pins (like what is the case on
> > sc8280xp-crd and X13s) then the HW they carry needs to be described
> > correctly. We've discussed that before.
>
> Sigh. Please reread the previous discussion. In some cases we need to
> set qcom,ath11k-calibration-variant even for M.2 boards.
>

Maybe instead of posting patronizing comments and forcing me to
reiterate all my previous points, you should reread the discussion as
well?

DT describes hardware and the WNC6855 package is composed of several
modules which we represent as separate DT nodes - currently: PMU,
WLAN, Bluetooth. The WLAN module takes inputs from the PMU so it
*DOES* need the supplies. The fact that you only want to specify the
qcom,ath11k-calibration-variant property is irrelevant because the HW
is what it is. Device-tree source is not a configuration file - it's a
description of hardware.

For upstream - if you're using the WCN6855, you must specify the
inputs for the WLAN module so it's only fair they be described as
"required". For out-of-tree DTS I couldn't care less.

You are not correct saying that "M.2 boards don't need these" because
as a matter of fact: the WLAN module on your M.2 card takes these
inputs from the PMU inside the WCN6855 package.

Bartosz

