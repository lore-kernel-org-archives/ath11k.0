Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D44C3DA4A
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2TgENL3xawlLU4YIOAIlHofb+6muDPN75SD/sHSKy0=; b=lLrgy/7E6S61o8oWHWFZ+Mmkoy
	X6NZymOXNtuU2OZnumOFEJv+7SWZ1nFE+wC0W4kXxAw8U5OYWjSaamBETCvLZlV6jl7StRrI6Ldd+
	ax2Nk1PZCy5J2x8guIBA/5eD2Rj6JMx+6bFfqyyPrGt3txjHv811bq9zwsOHSd9mnddK11rNFVBJD
	NeXtbfruj8mo0+yMRa59WmUozpGH3wjsLlW/8EH3tWWlMJw5NrgcvlDiJbEqq6a4Xn2si2I4ABSHb
	gCbebg7MspcWQAOcYKHmr2aYqCbQXJRrKvP/o8fCcXzEg9LCv8tynajqn1KmQyYGlRWWV/MMJqmFM
	PzPahdHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAL3-00000006Oai-3xFU;
	Wed, 14 Aug 2024 09:30:41 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9CB-00000006DhN-0Wt9
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 08:17:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52efdf02d13so10372835e87.2
        for <ath11k@lists.infradead.org>; Wed, 14 Aug 2024 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723623444; x=1724228244; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2TgENL3xawlLU4YIOAIlHofb+6muDPN75SD/sHSKy0=;
        b=EM9xyfCjIDYVkmkkrrQNePE74WArcDdbNd+hXt/tTThiXAtc1tRhtsyiPbu5Joc0Ea
         2gZUGU5fDufzp0hwVIUcSakuz5NayuJHwjSm3KpNisXgvox3q0VcAwwrFonjQLctRK7e
         P6DkFnSb0RD2eeBZXOpkmczXUDY7R5TkAI4gQ/4VkhsEED6DhoHzNGO/17dyXQf5gS0G
         zN8uEmsbNyBQqlfJOjFs+tvyDlmznNGQl34rN7YtbNg2C3+wi6WtBvnXDmlzF1cdUa+t
         P2yPcCtgW5GUUyy7EUmH12Ks4Bqplq8/4jLZqAP4XlY8144aVDZWGcn0J+cfd1ji09iS
         0EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623444; x=1724228244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2TgENL3xawlLU4YIOAIlHofb+6muDPN75SD/sHSKy0=;
        b=p309PKfA8M3j15AKb6eSeWTvf+mxPkYK/nk9EpYMlNgXWfOqa+sPBjWMKG9c80b5M7
         G7MnFApqXaQKIiABxOFSS0VlP8dgRkTV55x0rs8lLqpmhW32zh5HWpLUCf7TZ9EVtjrK
         QJu4SgXeiMaAP4CbFuFxTGToZAmgbIoZhTnnmthSrVavijODnJoAoU1ldVxXFsVt7rB2
         RpU5Q7uguLG88T8MAcIMMaLNVdKXm2T/O/sDcWN+kq/C2n2BNkwZMLhlZwchi6mw2UbP
         OyUvHEb6KdsNRg6iB/tFESONRG9H96X+PETKlJQAo7zyUEce4A5vkBmoO80b3TvczeMF
         GyrA==
X-Forwarded-Encrypted: i=1; AJvYcCVWULXL2lINWtkC+Dvrjtg33YgZziDX5Ea8SH5CV/l3keOPbAbDRYYhNNG+DHQTRxvmhPRJTOAk97hkopsk63p8Fdy8BG5XVf7eIg==
X-Gm-Message-State: AOJu0Yw07gtusDNryEdEmJawyJyImMsgOefNIEAExlyYwMvjBG5JHmmZ
	3aOTg5mFZkLt47VtVKWl2BQUwIwQ/e8PxutXs/1/NgqmJ8Dz76tz+pdUPByDixF5RDc/sh2UUr+
	PYgeVzwMMPdEfarQfU19E3zXrGUC8IC1Y3fvm6A==
X-Google-Smtp-Source: AGHT+IHKjTX3v03zjUihKU1aJBKyTKGdAZsW85MS+ZnqWBZeBvBl+H7h6kwdOiR/LFg4qqcFO1k0iWiGDkGBp9lCNMM=
X-Received: by 2002:a05:6512:3d8a:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-532edbbf006mr1492770e87.50.1723623444198; Wed, 14 Aug 2024
 01:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240813190306.154943-1-brgl@bgdev.pl> <172358277338.2007176.5717215982820920385.robh@kernel.org>
In-Reply-To: <172358277338.2007176.5717215982820920385.robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Aug 2024 10:17:12 +0200
Message-ID: <CAMRc=Me+FFH7duM_H6fcxdPd_oTtZGk1TQ_AioWDXb-GQTspQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: ath11k: document the inputs of the
 ath11k on WCN6855
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Kalle Valo <kvalo@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	ath11k@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011727_289327_77581996 
X-CRM114-Status: GOOD (  16.99  )
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

On Tue, Aug 13, 2024 at 10:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
>
> On Tue, 13 Aug 2024 21:03:05 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Describe the inputs from the PMU of the ath11k module on WCN6855.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../net/wireless/qcom,ath11k-pci.yaml         | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddrfacmn-supply' is a re=
quired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddaon-supply' is a requi=
red property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddwlcx-supply' is a requ=
ired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddwlmx-supply' is a requ=
ired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddrfa0p8-supply' is a re=
quired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddrfa1p2-supply' is a re=
quired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddrfa1p8-supply' is a re=
quired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddpcie0p9-supply' is a r=
equired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/qcom,ath11k-pci.example.dtb: wifi@0: 'vddpcie1p8-supply' is a r=
equired property
>         from schema $id: http://devicetree.org/schemas/net/wireless/qcom,=
ath11k-pci.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202408=
13190306.154943-1-brgl@bgdev.pl
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

Sorry, I ran dtbs_check but forgot to test the binding document itself.

Bart

