Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF99DC27C54
	for <ath11k@archiver.kernel.org>; Thu,  6 Jun 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFgymo/FZ1mBM/so/Gc56Q4p5/VyC1A8hH1xyBB/UOc=; b=XrxrO/VbZLphPg0frQPgZUy/+k
	qLMnsY+xuJ2xkFtJSXGzzSmbQj3H5iwqi0jM7UttbojSKTTFPhq1I/5p1sB8UMsawyBJdR33sr3t9
	XsLxe1CsCFO6Lzdqx+sUmRPU3SWpQg4zlRWmWJ9cHpbgE6EfaoGhc4rIB+9dHKV2jJPFhXBmUFNkm
	wbTxYXP7/Vzb3CD7bslqZEDAI4O/M736zaNTe+Z05KIRT8s6P00AoyUGtZu/7G4mymqNxiWMhx/s7
	vQAcOtRgdX35MtPs1c6Z48G6z+aIIK5SjF4M5P4fR8kLNF5F+1JjB9NsKLGGGx+1S3W8hkwyVXXMJ
	jOefGxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHXJ-0000000AsP0-2XQT;
	Thu, 06 Jun 2024 18:08:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHXE-0000000AsLG-2Gmx
	for ath11k@lists.infradead.org;
	Thu, 06 Jun 2024 18:08:28 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so19808331fa.1
        for <ath11k@lists.infradead.org>; Thu, 06 Jun 2024 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717697302; x=1718302102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFgymo/FZ1mBM/so/Gc56Q4p5/VyC1A8hH1xyBB/UOc=;
        b=Bw/FMqu48WfDPB8CHKoxNWaTm0g0O4WPYAEfPVrkvl3TCwe5HlpAjKfF6bgvpL7EDq
         Un4D+n52ivttWoPtzOoyITgGghsltuoXaFK5Jc+tr554OOGeHZmO5cFBnqHZuM6koPCX
         DRC9bOY7SpZTEQqdrFK/3dGKKZESJmMeVF0An9f6n6whKncby3Or4MyqHCfoqnQUDcx2
         Vrs/9BRravfxrhu14045dwnnaWycTDLTAFHxN+U9AXqGipoEmEg5lq38lCpeEE1fwkxd
         kXU6yU+LcDmu3ZcT50Kckj0w5OQbjblBhMTTEbFwc7cUqCPjpPxmJMmPwV8hu7B0pUs2
         fRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697302; x=1718302102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFgymo/FZ1mBM/so/Gc56Q4p5/VyC1A8hH1xyBB/UOc=;
        b=MnbhgafdjnPLk9gfiRjvJeAZkp7958e9/UhAwrODE1/zDoId/3f+FVEufs3osaPGS2
         nXuAWQV0M1jzG9vQUiy2cDHEJe2BhZQhEpofwRsSoHigR/2yS1Sm2GCnR6U0UgjCVcWU
         P95+G5HpwZ5hpTA+YSK8SwP2RAbCQooXFaVJLrUWp+mMiEGb/wUcBqBYRYkqnFUdlUpt
         cBgV3BPZ6O82zmHtqEo5XgKvcGUCU4KEYggVvJ7gWNI2b6UlCyZrQMysHFjG/UPSTCvN
         9hS1KuW25cd6exisrKjZcDxA+hfiNeKcvDzkKIp+A+qbufTi75ri1IYaiqhmsmSIZVxU
         Rfmg==
X-Forwarded-Encrypted: i=1; AJvYcCUabmeEQHjwpw4NcpDSy8KP2ZZ/pQdklVzLJ4FDrQpS1Mn8F+cMfvIFQloqJmjpcqZAFPMHr9q5vC8ZF2GqFTCBZv1t+Z601hd0Mw==
X-Gm-Message-State: AOJu0Yzy1P7WPL4oOAKErjlFVH6jfmQWWK8qmx1YsHNdWTIzgxyZssb/
	0NxhCxpwIWbdxSSPbIVA/bUVLEqIQnBSYRRadq5EVbtxFs16lOyJ3O5/Eirtf1ScptoLAAWJD7a
	nNuUoIH9PeanSXzukl/OXqW2O6WzYCaDwUsLH8A==
X-Google-Smtp-Source: AGHT+IEvw2Du14s9LhbMiEG3oShp3mxTzmgORDkj+Yh8Hmemm1ygt2yqAchw1+JnWIg+p6IdwXlg7YFgaTVoOQb9ur4=
X-Received: by 2002:a2e:7d12:0:b0:2ea:8d54:452b with SMTP id
 38308e7fff4ca-2eadce3836cmr3770821fa.16.1717697302075; Thu, 06 Jun 2024
 11:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org> <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org>
In-Reply-To: <87sexqoxm9.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Jun 2024 20:08:11 +0200
Message-ID: <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_110824_720238_3D529360 
X-CRM114-Status: GOOD (  52.32  )
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

On Thu, Jun 6, 2024 at 6:16=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > On Thu, Jun 6, 2024 at 4:02=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wr=
ote:
> >
> >>
> >> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >>
> >> > On Thu, Jun 6, 2024 at 3:30=E2=80=AFPM Kalle Valo <kvalo@kernel.org>=
 wrote:
> >> >
> >> >>
> >> >> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >> >>
> >> >> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> >> >
> >> >> > Add a PCI compatible for the ATH11K module on QCA6390 and describ=
e the
> >> >> > power inputs from the PMU that it consumes.
> >> >> >
> >> >> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.or=
g>
> >> >>
> >> >> [...]
> >> >>
> >> >> > +allOf:
> >> >> > +  - if:
> >> >> > +      properties:
> >> >> > +        compatible:
> >> >> > +          contains:
> >> >> > +            const: pci17cb,1101
> >> >> > +    then:
> >> >> > +      required:
> >> >> > +        - vddrfacmn-supply
> >> >> > +        - vddaon-supply
> >> >> > +        - vddwlcx-supply
> >> >> > +        - vddwlmx-supply
> >> >> > +        - vddrfa0p8-supply
> >> >> > +        - vddrfa1p2-supply
> >> >> > +        - vddrfa1p7-supply
> >> >> > +        - vddpcie0p9-supply
> >> >> > +        - vddpcie1p8-supply
> >> >>
> >> >> Not sure if we discussed this before, but based on this I understan=
d
> >> >> that there can't be an DT entry for device pci17cb,1101 without all=
 the
> >> >> supply properties? But there are QCA6390 devices with PCI id 17cb:1=
101
> >> >> which do not need these supplies and already work. For example, my =
Dell
> >> >> XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 b=
oard
> >> >> to their PCI slot and some of them might want to use DT, for exampl=
e
> >> >> setting qcom,ath11k-calibration-variant.
> >> >>
> >> >> This is not a blocker for me, just making sure that we are not brea=
king
> >> >> any existing setups.
> >> >>
> >> >
> >> > If they are already powered up without the need for the PCI pwrctl
> >> > driver to do it, then they will work alright. Bindings don't affect
> >> > functionality.
> >>
> >> Sure, I'm not worried about functionality. I'm worried that if I
> >> there's, for example, an ARM based setup which uses DT and wants to us=
e
> >> a similar QCA6390 board that I have, and set
> >> qcom,ath11k-calibration-variant in DT. In other words, I'm worried if
> >> you are looking at this only for Snapdragon family of boards?
> >>
> >
> > No, what I'm looking at is the entire QCA6390 package. That means WLAN
> > *and* Bluetooth *and* the PMU that manages power.
>
> I think we are just looking at this from different point of views. You
> are looking at a datasheet (most likely for a Snapdragon based system)
> and I'm looking what actual devices there are out in the field.
>
> > If you're using the QCA6390 on a device-tree system then you should
> > probably model at least the WLAN node and the PMU and the problem with
> > supplies is fixed.
>
> But why? If there are boards out there who don't need any of this why
> would they still need to model all this in DT?
>

Because this is what is there? The goal of the device tree is to
describe the hardware. The fact we didn't describe it before doesn't
make it correct.

> Based on the discussions I have heard only Snapdragon systems who
> require all this configuration you describe. Of course there can be
> other systems but I have not heard about those.
>

DT is not configuration, it is description of actual hardware. It
doesn't matter if Snapdragon systems are the only ones that actually
*require* this description to make WLAN/BT functional upstream. The
chipset would be the same on any PCIe board, it's just that the host
systems wouldn't need to take care with its power sequence. But for a
dynamic board like this, you don't need DT.

> > But if you don't have the supplies, that's alright for downstream.
>
> What do you mean downstream in this context?
>

I mean: if you wanted to upstream the DT sources, then they should
include the supplies AND the PMU node. But if you just want to make
the WLAN run on some vendor kernel then you don't need to think about
it, it will work.

> >> Again, I don't see this as a blocker. I just want to understand how th=
is
> >> should work for all types of devices there are out there.
> >>
> >> > But if you have a QCA6390 then you have its PMU too and the bindings
> >> > model the real-world hardware.
> >> >
> >> > IOW: your laptop should be alright but the supplies are really there
> >> > which warrants adding them to the bindings.
> >>
> >> Sorry, not following here. Can you clarify your comment "the supplies
> >> are really there"? You mean inside the PCI board? But that's not visib=
le
> >> to the kernel in anyway, the PCI board just works after I plug it in.
> >> It's like a regular PCI device. So I don't understand why that should =
be
> >> visible in DT, but I can very well be missing something.
> >>
> >
> > I think you're thinking about some kind of detachable PCIe board with
> > this chipset on it.
>
> Exactly, a lot of WLAN boards are like this.
>
> > I refer to the QCA6390 chipset itself which is also more than just
> > PCI. The Bluetooth interface doesn't use PCI at all. On the boards I'm
> > working on, the chipset is just soldered to the main board.
>
> And I guess you are looking at Snapdragon boards only?
>

But what is your point?

> > If your detachable board "just works" then it must be wired in a way
> > that enables WLAN the moment it's plugged in but this doesn't happen
> > over PCI. The chipset has a power input and GPIOs to enable each
> > module.
>
> I don't know how the boards are implemented but it could be so. But from
> host system point of view it's just a regular PCI device.
>

And you don't need DT anyway for this type of devices.

> > Also: I doubt you need DT for your detachable board?
>
> Sure, I don't need DT but that's not my point. My point is why require
> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA6390)
> then clearly there are such devices which don't need it? To me that's
> bad design and, if I'm understanding correctly, prevents use of
> qcom,ath11k-calibration-variant property. To me having the supplies
> optional in DT is more approriate.
>

We require them because *they are physically there*.

Bart

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

