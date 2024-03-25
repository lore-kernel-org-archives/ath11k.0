Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB9C54E64
	for <ath11k@archiver.kernel.org>; Mon, 25 Mar 2024 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFcfwD2v6qpH4vAhBOADFCJxvrI715+cznBhJwreFCA=; b=rSRrxZvWRytR7+rCb2ou+hZaZf
	kfh+bErpQf/S2N3nVzde7BUN+SzkntR5Ur1j5hHy/wp7V0OnDu1QrzbR35GL0EzNQB8vE6eLXTS5B
	6/Fj1xRNEFfRHRY6xJ2MPGc9UjLc9AlR4rNBv5kyaRH4ugClniw9LqdWuRw+Qkc4xYNODApEfYuxm
	xz4Hanu0kJW/k8bjskr65x998iZqPodZ2Pfza8wjqJAJfvUY22g5B/qrBoLMhaU2nxZg8yN/ssOZN
	vndXJnFNzMliL+wrquLNsfbta19lf5lSDJBkOYsO8wblqb92c2DVI0RLXv+UmT6zPuYnMa6o7ms+7
	03OXgnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron75-00000000kAL-1L8B;
	Mon, 25 Mar 2024 16:23:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron70-00000000k5Y-0oa4
	for ath11k@lists.infradead.org;
	Mon, 25 Mar 2024 16:23:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so62473411fa.0
        for <ath11k@lists.infradead.org>; Mon, 25 Mar 2024 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711383826; x=1711988626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFcfwD2v6qpH4vAhBOADFCJxvrI715+cznBhJwreFCA=;
        b=NWTuOwJ8XasZW0vf3RaWxqEYOQKy4A/r+W6iM+xTOv9cvXSif/R3tT8vef5swg2Dta
         f3MvrcEWx0Jljc6rAb18Rlf8cLcxK6aw7Ue5FlSs5C56PYqJZn6rJmdjxna6IK4URDBN
         NIB+ubhhFBTC2dt0VdPjhRl5wdVMaJfcFJREc0nKojqX6TtO6BHSxJFkQjSlFrDxiTYV
         1V0XH1AswIkHlf6vScu3pkDVfcrJg43qlGbDqpj5ZipUxDbM8yt3EpBJ9EcwDip3Y40D
         qKoxYDO/KL3aQRtXbaGrK9I3/87dVTpQufdYomeK36dtbmBjpNHalS4E/lqwdn3nwIT9
         YW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383826; x=1711988626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFcfwD2v6qpH4vAhBOADFCJxvrI715+cznBhJwreFCA=;
        b=s+wQxVoHYc07awVRSHZBe7/pKo2ys2y331Pli0Y2KfOTd2E46uJTiPjJxols9mCVrB
         p8f4XOBYcMWpCAODS7Qo5hQBAycIv8eShyQj9yWHyAvwdqDLF+/NgPfCpS4DIlLy6Bvz
         ESTMN/P/TscFGmebDi7qMyPBsylJIjYCM2Pasg5zr/ydzOwR3c+oyf+Dlnm7QLNfQnoe
         QwbSymmtmh9zwtb+RXakmsd0BxZ49caaEh4Hds2jTH1i8OuKbvZJL/0QxFQHHryqTRgX
         skteHDVwoQV/ynt7u4SS0muu7+ksR+HVWZ6s/Ei6vWHbGFU0H/S1xArVLGLvdHEAvkt1
         SVZw==
X-Forwarded-Encrypted: i=1; AJvYcCUdH2GejhI2tx1jQnKYR+B511/x60yBBuYEmxpk3NuVCHP2Qki6HEQKpSMsJjXruje/6yRi06F2DVUya+F5IRglzLICCs9Q1ATptg==
X-Gm-Message-State: AOJu0Yw6xtoE8pF7qv0AkJ5KSJdkSH/Oaon9/qCzaObELMJSd8CnubgU
	OVZg8Gomt+efWGsBfiZHZgrOicfmiwIu1OZjfBgcRpJvnjGNfVgolxIicUOQ3jkVXnHsZxSJRx4
	Q5Cn8VmeqxT0O+96IbAhnPXXZbvGjFWVRPKiBZg==
X-Google-Smtp-Source: AGHT+IH4j5PPquST9xGKo8St/ikKbO6tk+Yedi+DAtFkCTZT5UC4mlTlEQkIXAn9mq4Oivrt7Ob9WJnK0Bj5SKvyufE=
X-Received: by 2002:a2e:8085:0:b0:2d4:ffe:c55e with SMTP id
 i5-20020a2e8085000000b002d40ffec55emr4716403ljg.25.1711383826136; Mon, 25 Mar
 2024 09:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240325131624.26023-1-brgl@bgdev.pl> <20240325131624.26023-5-brgl@bgdev.pl>
 <87r0fy8lde.fsf@kernel.org> <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
 <87frwe8jiu.fsf@kernel.org>
In-Reply-To: <87frwe8jiu.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2024 17:23:35 +0100
Message-ID: <CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_092350_325182_CCD560BB 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, Mar 25, 2024 at 3:37=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > On Mon, Mar 25, 2024 at 2:57=E2=80=AFPM Kalle Valo <kvalo@kernel.org> w=
rote:
> >
> >>
> >> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >>
> >> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> >
> >> > Add a PCI compatible for the ATH11K module on QCA6390 and describe t=
he
> >> > power inputs from the PMU that it consumes.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> [...]
> >>
> >> > +allOf:
> >> > +  - if:
> >> > +      properties:
> >> > +        compatible:
> >> > +          contains:
> >> > +            const: pci17cb,1101
> >> > +    then:
> >> > +      required:
> >> > +        - vddrfacmn-supply
> >> > +        - vddaon-supply
> >> > +        - vddwlcx-supply
> >> > +        - vddwlmx-supply
> >> > +        - vddrfa0p8-supply
> >> > +        - vddrfa1p2-supply
> >> > +        - vddrfa1p7-supply
> >> > +        - vddpcie0p9-supply
> >> > +        - vddpcie1p8-supply
> >>
> >> I don't know DT well enough to know what the "required:" above means,
> >> but does this take into account that there are normal "plug&play" type
> >> of QCA6390 boards as well which don't need any DT settings?
> >
> > Do they require a DT node though for some reason?
>
> You can attach the device to any PCI slot, connect the WLAN antenna and
> it just works without DT nodes. I'm trying to make sure here that basic
> setup still works.
>

Sure, definitely. I there's no DT node, then the binding doesn't apply
and the driver (the platform part of it) will not probe.

> Adding also Johan and ath11k list. For example, I don't know what's the
> plan with Lenovo X13s, will it use this framework? I guess in theory we
> could have devices which use qcom,ath11k-calibration-variant from DT but
> not any of these supply properties?
>

Good point. I will receive the X13s in a month from now. I do plan on
upstreaming correct support for WLAN and BT for it as well.

I guess we can always relax the requirements once a valid use-case appears?

Bart

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

