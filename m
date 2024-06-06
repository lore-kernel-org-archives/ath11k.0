Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C465C27C55
	for <ath11k@archiver.kernel.org>; Thu,  6 Jun 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWrHmrBVbxL2N+yjukzrB1xNIeLZkMy2NcMIU1+JPUg=; b=V5f9P8Krds2HKGU+L4Vr0e1fTL
	tzBAqPtsB/Klwse1FUEAjiGsMLezg2fExZEwjtT39vDY9GIGLijPFRpSq0EJ2q3VBDUVQajPAm4i5
	6KfGT5FHlKOkNvj4+70ViEHL8Umq/zw9duAvZamdEhyahX+epPClk6kRxTSct3k6sEOcSotLy664l
	k/KbQdYdafrrPmTTSADVKtT2WPHK9GMnHUf3qmq9UPIyqhkbAYS1qlxm6QiwgYlbph6RYcxwccQ6a
	Z9aGH+pQP0OQrx4WVIrJWWTPtfOYDIJJQj59M+wLVmtcvOAT+D9KKKBOFFSblT/DXFYhXJKfZBH/f
	3Mjpt1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFE7W-0000000A5G6-08NV;
	Thu, 06 Jun 2024 14:29:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFE7S-0000000A5EZ-41gh
	for ath11k@lists.infradead.org;
	Thu, 06 Jun 2024 14:29:36 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ead2c6b553so12141711fa.0
        for <ath11k@lists.infradead.org>; Thu, 06 Jun 2024 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717684171; x=1718288971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWrHmrBVbxL2N+yjukzrB1xNIeLZkMy2NcMIU1+JPUg=;
        b=OdsDY5ntVFqooYBYc51QOQDmqeqy3qhqn3+gx9CVIH36zSZWuwtLeZkYhozJxQMnPU
         OjoIUzFQBG9Gy7Nm6cifDG159bBD5u7x+3rB4MbHUm4h7BmS9m9vZOCO6NyuUxIwikZi
         k4FOn3yXwpukKuu384dR0O3hqEjr3cF3KkAihliZrtDrFTDUWjg0q1A+z3IpRQyyetjG
         MtkVcIP6eQRzEJyuasjN7/Z+qUS0b0uaFrQpG2bberseOX1ju0Bp2orbpEmlex94dWeD
         ZDDOEtddcAq8FE/TUttqPhIRu3BoVtJ6fC2NHfB3NxjM2AOqrw4/zwXf4/K7H7g59pck
         Ra6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684171; x=1718288971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWrHmrBVbxL2N+yjukzrB1xNIeLZkMy2NcMIU1+JPUg=;
        b=sZ7AmlQGs7SK4yomePAXAs/6Jfplb34imDl/kENoBwMsTz1t27Noflr3prE5NpdqcS
         6TkuulJFzM2GtzCVFpyTAZcAtxbEBFECKyR9BcIvzcsx+7pGMAC/oLWeWadJC/1N9Sbs
         aoqnfeQQBsfvnFaSzQ/yPronycu7vxCF4F2IInAcXTTBueWZ3fFR101hgLj+4C35PqNK
         ejiPPCIHtF0bzkARCCOp2JLvzNeIFJPvWOrDJTwdZ63AB7NwGz2hVLWVOfPs+yVq02gj
         J6XXIMDQQQgX2wShkxjetYaSXtpQyIuCQC1tt7hxsBB+iUyJWQI3WhOT8TrQ+Y6xm1g9
         9/zA==
X-Forwarded-Encrypted: i=1; AJvYcCXNc87QKGb6BqetdMKH0rV06klde7zhUeYRyTdH118Y7COazx7b+wcmuCddSBKK51ahDAR15ABni29rfK62bv8q6y7O04KRMHDzsw==
X-Gm-Message-State: AOJu0Ywd1QJBoPUnT3nntNiic7k7wI4sV1Cp9tMkC2DYh/WJYKvZ84cD
	PbaPyoEt2Op03a+vmNonsaivSJsDakIsiKG6u26RAJu986eF6Id8Nc3u6CDmpKkI5wwvo61pbbf
	g/XN3fe3ymi4XRp5A8aBor6vHaSlITqagN0NDjw==
X-Google-Smtp-Source: AGHT+IE7dV5ZV/18QS1Cl24O5VDU/AyKd8svwpktd8Gq/yIywl49RVlO2hEBVV/ZBTiMOrhqd5gtrUxmBJP66OQy6UM=
X-Received: by 2002:a2e:a403:0:b0:2ea:903b:ca0e with SMTP id
 38308e7fff4ca-2eac7a986abmr42490961fa.52.1717684171575; Thu, 06 Jun 2024
 07:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org>
In-Reply-To: <871q5aqiei.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Jun 2024 16:29:20 +0200
Message-ID: <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240606_072935_007942_9CDFC3CF 
X-CRM114-Status: GOOD (  33.58  )
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

On Thu, Jun 6, 2024 at 4:02=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > On Thu, Jun 6, 2024 at 3:30=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wr=
ote:
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
> >> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
> >> Not sure if we discussed this before, but based on this I understand
> >> that there can't be an DT entry for device pci17cb,1101 without all th=
e
> >> supply properties? But there are QCA6390 devices with PCI id 17cb:1101
> >> which do not need these supplies and already work. For example, my Del=
l
> >> XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 boar=
d
> >> to their PCI slot and some of them might want to use DT, for example
> >> setting qcom,ath11k-calibration-variant.
> >>
> >> This is not a blocker for me, just making sure that we are not breakin=
g
> >> any existing setups.
> >>
> >
> > If they are already powered up without the need for the PCI pwrctl
> > driver to do it, then they will work alright. Bindings don't affect
> > functionality.
>
> Sure, I'm not worried about functionality. I'm worried that if I
> there's, for example, an ARM based setup which uses DT and wants to use
> a similar QCA6390 board that I have, and set
> qcom,ath11k-calibration-variant in DT. In other words, I'm worried if
> you are looking at this only for Snapdragon family of boards?
>

No, what I'm looking at is the entire QCA6390 package. That means WLAN
*and* Bluetooth *and* the PMU that manages power.

If you're using the QCA6390 on a device-tree system then you should
probably model at least the WLAN node and the PMU and the problem with
supplies is fixed. But if you don't have the supplies, that's alright
for downstream.

> Again, I don't see this as a blocker. I just want to understand how this
> should work for all types of devices there are out there.
>
> > But if you have a QCA6390 then you have its PMU too and the bindings
> > model the real-world hardware.
> >
> > IOW: your laptop should be alright but the supplies are really there
> > which warrants adding them to the bindings.
>
> Sorry, not following here. Can you clarify your comment "the supplies
> are really there"? You mean inside the PCI board? But that's not visible
> to the kernel in anyway, the PCI board just works after I plug it in.
> It's like a regular PCI device. So I don't understand why that should be
> visible in DT, but I can very well be missing something.
>

I think you're thinking about some kind of detachable PCIe board with
this chipset on it. I refer to the QCA6390 chipset itself which is
also more than just PCI. The Bluetooth interface doesn't use PCI at
all. On the boards I'm working on, the chipset is just soldered to the
main board. If your detachable board "just works" then it must be
wired in a way that enables WLAN the moment it's plugged in but this
doesn't happen over PCI. The chipset has a power input and GPIOs to
enable each module.

Also: I doubt you need DT for your detachable board?

Bart

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

