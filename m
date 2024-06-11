Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95426C27C78
	for <ath11k@archiver.kernel.org>; Tue, 11 Jun 2024 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=; b=vsfvtWiYS6LiSoP2vIwy2V1C9W
	HPukBZzFWLbCb6QO/B22YsbR5wcveXLt8YmjZCXZwzezmzXRVgpWNxg+/HPNmC7uskyngaMBhvKBX
	XzFbVR6MDw3cwFJCeW7mn+CO9QUjX0yhrj9VW6ST1lBKigBh4KrOv/Py3Vx3hJB1P+HSYJ9IUciPQ
	1cX0eRQ+XKD+/iWQXGnaeaEsIQd9cZfqQdljOze6eirZWDv7ElGPn85QwdsVfdStMQrMjCz/mbAO8
	qEO6NRX4rO7MLmRaZXhSQiutU9xAr0gdWdTBltp5A8VXooM/78Pl7twVjWvj2o7U0/YvYRClEoYND
	q5i7ZGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7l3-0000000A7bT-1T1H;
	Tue, 11 Jun 2024 20:06:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7kz-0000000A7aC-3mWe
	for ath11k@lists.infradead.org;
	Tue, 11 Jun 2024 20:06:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52c8973ff29so1737262e87.0
        for <ath11k@lists.infradead.org>; Tue, 11 Jun 2024 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718136368; x=1718741168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=;
        b=jKrcg16jrZYkJaxtS2E3b2E8t613qJVLNZeYkS9bC5vMg7S87uG57cIHyy2DSQwUpG
         naJLW79tK/hlZmlpNDZ3XKuN071HGMEk1OpbltL0umf9UK7FjWDftHUVKIGjQUfSP8Zj
         wCnrhvN18rxJqiHXlq/xh1KQ6LjcfD9XTbuQz6fdFjt8ptusUkb4xjSQyKkwSJj7qW43
         JnXOr6Fd5uBxga/5fgOK7qZicwN4HkyDtMFB36rRWCsFAVvmqfu3nsaG9e0hKFFLDcMf
         k3sB81qFQMB0tgGodeioz4g9jUG2dw/0AE2cBvpFAT3TyvvQ3qh8O7w+uVo0y1K3P/tk
         g1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718136368; x=1718741168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=;
        b=lz4KBrHE2OcprV6UXgE7Xl/NRhJrVIpCuE7T4y8G6G0hmgPG2giNdrUvcoWXGSm/6Q
         rZbmHihVgSiKS8AKu7aAw+XSv3e352c1ho/4iGtx+ATFgoqn0zSieseZ0WxvXzCW7MzL
         vNsqFFrBxBsgo2J/dUxdNNom298EYjfi7M5wRhx8QcLnt5yFDgrIGT4ZHrtYTkKPddZk
         /BC7wcIOzvVIDWeaAdhTkQB4o1tJoHI+8YzSdXsucxpBxqUxoPh25OlmX4pQdZN1ntkh
         /X/9NZlYAdyyQAVUfnzzJGTwpowNejKfSWI70jbEGbqBIECtUTd9kYF/mYpfcB8S8zn6
         JQEA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1+1N5n8TFBYPRsMreEYM0q9cZlAmAj1kPb0ZZVXm9vreKfxE9fTpwGUCeoRxvuf0wooISMK6rFyM6u5d8JXbqC90uQ14Dj6tSA==
X-Gm-Message-State: AOJu0Yxhpj3l8CYfa3VsyfjrwgZZik3rSWtdmjRr84W7aeYPMqfehwrZ
	ZKXMkJYLWsrtXFIpt0Osk+qjay/7jGCW9hTIq5vqJoHKSqPh2uqQB2m8aZtthXbKtf7qzYrhLWX
	+aF3y+cvMrb9IPuwquC+Qwn50Ie7QDyZwc94iWQ==
X-Google-Smtp-Source: AGHT+IHo2kDMYmvh1Fiuq6Vp0TjSyMZ5wd2GkAYNc1OHzZu/lwJY6vNBizdeJ06QMzbe9upl8ARaKOiKysYnJKD3dmc=
X-Received: by 2002:ac2:5148:0:b0:52c:5f12:5317 with SMTP id
 2adb3069b0e04-52c5f1256a6mr5730643e87.44.1718136368542; Tue, 11 Jun 2024
 13:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org> <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org> <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
 <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
In-Reply-To: <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 22:05:57 +0200
Message-ID: <CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_130613_956101_6E73F4E9 
X-CRM114-Status: GOOD (  29.90  )
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

On Fri, Jun 7, 2024 at 8:40=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> Kalle,
> All of the devices out there need these supplies, but they are sometimes
> provided by generic PCI supply and on-board regulators. Basically your
> PCI adapter is not the same as QCA6390 chip on Snapdragon board.
>
>
> >
> >> Based on the discussions I have heard only Snapdragon systems who
> >> require all this configuration you describe. Of course there can be
> >> other systems but I have not heard about those.
> >>
> >
> > DT is not configuration, it is description of actual hardware. It
> > doesn't matter if Snapdragon systems are the only ones that actually
> > *require* this description to make WLAN/BT functional upstream. The
> > chipset would be the same on any PCIe board, it's just that the host
> > systems wouldn't need to take care with its power sequence. But for a
> > dynamic board like this, you don't need DT.
> >
>
> Correct.
>
> ...
>
> >
> >>> If your detachable board "just works" then it must be wired in a way
> >>> that enables WLAN the moment it's plugged in but this doesn't happen
> >>> over PCI. The chipset has a power input and GPIOs to enable each
> >>> module.
> >>
> >> I don't know how the boards are implemented but it could be so. But fr=
om
> >> host system point of view it's just a regular PCI device.
> >>
> >
> > And you don't need DT anyway for this type of devices.
>
> Detechable board, like PCI adapter, derives these supplies from generic
> PCI whatever-3.3v through additional regulators. All these supplies are
> there - on the board.
>
> >
> >>> Also: I doubt you need DT for your detachable board?
> >>
> >> Sure, I don't need DT but that's not my point. My point is why require
> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA6390)
> >> then clearly there are such devices which don't need it? To me that's
> >> bad design and, if I'm understanding correctly, prevents use of
> >> qcom,ath11k-calibration-variant property. To me having the supplies
> >> optional in DT is more approriate.
> >>
> >
> > We require them because *they are physically there*.
>
> I understand that for all known DT QCA6390 hardware, the supplies should
> be provided thus they should be required. If in the future we have
> different design or we represent some pluggable PCI card, then:
> 1. Probably that PCI card does not need power sequencing, thus no DT
> description,
> 2. If still needs power sequencing, you can always amend bindings and
> un-require the supplies.
>
>
> Best regards,
> Krzysztof
>

Kalle, does the above answer your questions? Are these bindings good to go?

Bart

