Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33448CD11DD
	for <ath11k@archiver.kernel.org>; Tue, 26 Mar 2024 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ6jS2CUTKGhZdxpuXUPTr0agZibBpPyyI13tXK5e6s=; b=hGtGutFuIkNCmRrvzLjPRLunJX
	ZDA6FpEPdYcNWweCx8jxQGaERvglqbpBs4k1tO6PIwOCI6UghkvJb3KDe/NU1HWCbtD6e2Trl46HR
	Vsa69k1gPzIxdlzdKtffjOY+2l4oXeL+cNE+W/LICbX5bxZVs9tQ8+fkwhVscJ4BZ5tQVhRN/A2uv
	08WthAiJJ612FUCf5rDTMrNF99vjlkF07LUVcfuB1prEGK00c6S9lGQce3c4FP0wdfOW5V0RHNpGs
	Gp9MzhdgZ4SlOS/bF1GomCt9crO+DjrH9AOsqz7yA1y/KwyS1dYcoOkfK/Kz5Exx3g1Aq/eUV8GV0
	5pe5/nFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9jh-00000005UBx-2V5m;
	Tue, 26 Mar 2024 16:33:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9ja-00000005U9p-2WQK
	for ath11k@lists.infradead.org;
	Tue, 26 Mar 2024 16:33:12 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so59435581fa.0
        for <ath11k@lists.infradead.org>; Tue, 26 Mar 2024 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711470787; x=1712075587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ6jS2CUTKGhZdxpuXUPTr0agZibBpPyyI13tXK5e6s=;
        b=gaBNwHAewn0s9Tntd1S7phtSYj+f2smuB1DwDwWj376Xpy8TQHWLlkyShrqq7T+07a
         Ei4TP3AhbnIsa9RiIyrqReCUIaABqqDcf17QsHaJ+lW8o7/wITG2I9SJhxjPff8wxr8i
         /2OrUwwOH4L8o6HyIDXFAbPK3U3qd8CSKzLLyJdLRUc5CfZS5kV5fl4s7Es2370lGRjR
         d0uM17oy9zOzKpHexwrmsIwNN9MWN4tKNkJFvy0Kw+iBdP9OQIyA7VjHDf5xxJEEldUb
         Ms0u3EaDIzpYGSs5sp34bYwXRgJmgCzEcEEraEKxNd69Zeb6Fi6LEgu8eaFPNQiiyKrs
         5TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470787; x=1712075587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ6jS2CUTKGhZdxpuXUPTr0agZibBpPyyI13tXK5e6s=;
        b=O0Ty2RAElMXt3dnnik4vq+oddqTeW/gt/Nn645pab+JHMHjYY5Fw/6wTW32esYf+Xw
         LELcH1Obj3zzJQ3zlUwBlTyyv9foU/7nsFwwibCNN2TQBEYegyfy47C7ofMbJwDLGzoC
         KCvcYhBtMTlk4NbtxsE8lrRE5yEQt0kSoT7n31ErGzPt0PVenA63U84nQvVfs3rLEUzK
         3rTaPzK5QliINnzjT4u4GsUMchQTVuTZTttU4bUkDh+OxdV/F1ifL+bcy9i8o6sEFZzZ
         GQCApiqxCeUytfHmYj3UzwZRszdqefnhDF0jKHQXGZxEFzMwFNcpd2d6Vj40HWJckyA2
         Ia6A==
X-Forwarded-Encrypted: i=1; AJvYcCVoRK79IoStl0VSt37CCBc6b4DSZ1B7ib4ZwZzoZtni0uOe3bifAaBYIt9x/qTKRTBkNGrhGzGBgbs8KXElL5g7+Mj3SFPgkpA2nQ==
X-Gm-Message-State: AOJu0Yz4Mznk1bSAat70FqIIJ9tosZzZiqsifOR12fyjNsHlwiXH3c0D
	/dk2pZgS4hsfqhsxtSQRmKbCVCuFrEAxMFPDRh+nvtw+4Rp6Jii2XcqyDo49iBCO16x8OrLq/JQ
	i9I1b5nxNVaCY0YYDFUr39JL+PzJn/PSqBH0Kbg==
X-Google-Smtp-Source: AGHT+IEPlW3Mndd9DAskKl8BnO4uLoQgb2fvBGrOQCORYGpNt3ZO7pjyZJGUAGM4Jnm65aupzhhwN4AXLf4B/UzV5SQ=
X-Received: by 2002:a05:651c:210b:b0:2d2:4477:6359 with SMTP id
 a11-20020a05651c210b00b002d244776359mr800282ljq.7.1711470786783; Tue, 26 Mar
 2024 09:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240325131624.26023-1-brgl@bgdev.pl> <20240325131624.26023-5-brgl@bgdev.pl>
 <87r0fy8lde.fsf@kernel.org> <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
 <87frwe8jiu.fsf@kernel.org> <CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
 <874jct10yf.fsf@kernel.org>
In-Reply-To: <874jct10yf.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 17:32:55 +0100
Message-ID: <CAMRc=Me5ef_kFDz0SyGZb4S+2Ma4i=Fek_tzwj+bYD4DGSV4mA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240326_093310_788454_4D5381CD 
X-CRM114-Status: GOOD (  22.68  )
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

On Tue, Mar 26, 2024 at 4:12=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> >> >> I don't know DT well enough to know what the "required:" above mean=
s,
> >> >> but does this take into account that there are normal "plug&play" t=
ype
> >> >> of QCA6390 boards as well which don't need any DT settings?
> >> >
> >> > Do they require a DT node though for some reason?
> >>
> >> You can attach the device to any PCI slot, connect the WLAN antenna an=
d
> >> it just works without DT nodes. I'm trying to make sure here that basi=
c
> >> setup still works.
> >>
> >
> > Sure, definitely. I there's no DT node, then the binding doesn't apply
> > and the driver (the platform part of it) will not probe.
> >
> >> Adding also Johan and ath11k list. For example, I don't know what's th=
e
> >> plan with Lenovo X13s, will it use this framework? I guess in theory w=
e
> >> could have devices which use qcom,ath11k-calibration-variant from DT b=
ut
> >> not any of these supply properties?
> >>
> >
> > Good point. I will receive the X13s in a month from now. I do plan on
> > upstreaming correct support for WLAN and BT for it as well.
> >
> > I guess we can always relax the requirements once a valid use-case appe=
ars?
>
> I think we have such cases already now:
>
> $ git grep ath11k-calibration-variant -- arch
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:     qcom,ath11k-calib=
ration-variant =3D "Fairphone_5";
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:              =
       qcom,ath11k-calibration-variant =3D "LE_X13S";
>
> But please do check that. I'm no DT expert :)
>

You're thinking about making the required: field depend on the value
of qcom,ath11k-calibration-variant? Am I getting this right?

Bart

