Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81286C27C6E
	for <ath11k@archiver.kernel.org>; Fri, 14 Jun 2024 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqLPYteu3ayqHey69yCKfVVfVBHj/xWhI8yDdx19SLE=; b=l7h5Uc42RbEUrYtAuBhSc/ta20
	iRkz3CxcAbGSeWMbrdkUDeejQuGiEo5ZWYD6cQY7stXLtMop+aQzzyXT0SYcDc7tXmkyhTIfU3H0+
	4GmpzXxIV15vKe6VkzzNDb0FxGAwX8LObGyFWIdIlhBRTmedqyvj4rOBysLNuO4Ve2KwsmOG+Y4DD
	RydZRBqS3z+naAPC8Ejyb8JNdVOv/UbG528FvD3fM1DHHRGmPEivEYy+Au/jLNxzulGJkLaf/uHka
	zxk5U/C/AiShOs+KUHx9iX74+B1GAUGiLu3X8ImK0kjXyLUPZYlDs6S78+CcOOM65p1oxD6FpTiay
	K4BDH2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Cj-00000001j7Q-0czS;
	Fri, 14 Jun 2024 07:18:33 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Cf-00000001j4o-34tX
	for ath11k@lists.infradead.org;
	Fri, 14 Jun 2024 07:18:31 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ebdfe26217so16223251fa.2
        for <ath11k@lists.infradead.org>; Fri, 14 Jun 2024 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718349505; x=1718954305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqLPYteu3ayqHey69yCKfVVfVBHj/xWhI8yDdx19SLE=;
        b=emWj6rCyTci6yFa5CqD1cRPy724Tw+mNtMIfF8w7abUJhyzd2KBl44JoDimod53lYA
         hF50KnptBYl9LRLcTZIDzhn8icT1TFTUAfUtvI4rsrSVs3uvIMAnjLAcNtDpbX+EFp2r
         V9BB34YlLOunDAA/Jirlx0QI+1NbuSMbaJZJzOGFLg1r0Z4Kt+PdcQF/2cLTrqBLx3rW
         mCPKYMsklb+IKf+63ESmwdvcaUFL8le0gRAkXgH7BRP8IuklCFyP8zmvWnTkfU0DpIEk
         KI2CBGHE5gpP8BC6HVQP2WLgyvHiqdtxK8lQQ10D/gb3V8fma5g+rDR28o3HtAc6u3tV
         biRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349505; x=1718954305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqLPYteu3ayqHey69yCKfVVfVBHj/xWhI8yDdx19SLE=;
        b=T9QCZmwtAaOEdqm/OfXcaSKWrYEDLImXsSx7A2lgwYGhSMGyGERfqNWf9dy8IEum+A
         bGA6X7rKpvmTfnGhs+mbhINnbOOSLF4noSUmCjBCGTsTDlYX2eysoKebZ3ngs0TFOsH9
         RXfpa9zQyW4g8RYRMgJGhNqQg6LUIXxTa9qg5DMB5YQHViRQtF32SbNPNR6ctbnghoqa
         KotLKZb21HFSoXbHt9coIF6A9ZDiuBZGZFDj9g5c260156rEYj97ioaZ5M9PQf2DoQ0G
         kfj0ZxrSEeECHa3WWb23YCHkTDYo70qj8P7B18OxtnoU0Ps1rIJgEEH3p7mC32gJlB3o
         8ofg==
X-Forwarded-Encrypted: i=1; AJvYcCWc10ZvS/Gl08RoB0NCXrqXImERSBnan6CqtRXLu57OWOFigGVXwls2W5ChqKr8JX91oH9lANiQx31GGPMdhiUnYtk1xJe1ahigoA==
X-Gm-Message-State: AOJu0YwPGIR4NrFla/nOKzUXms+qfHbbPzZzfEPOHy6TKGKBGaC2sno4
	rwh8RFg+yTrBUgcAjANy2A602IxVJCKn7K8f6KHKqfc+xkfczwSIP9G+xE/tRXh+tD8q8Jv5nX/
	IySi5hiVhQtUdQGAABHXzUU4B8Q9KqY/PLjseAA==
X-Google-Smtp-Source: AGHT+IEqAc/IITHR5XH5IcyBzMofjdG67Sdge1uWmTB4/BihRUG9JruUjf29s0w2MnX3meX/UPaZVWsbSfUHTarWmeA=
X-Received: by 2002:a2e:8886:0:b0:2ec:492:3fee with SMTP id
 38308e7fff4ca-2ec0e47c209mr11243421fa.30.1718349505123; Fri, 14 Jun 2024
 00:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org> <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org> <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
 <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org> <CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
 <87ikyenx5c.fsf@kernel.org> <CAMRc=MdPQu-r4aaeag9apYP1-FoQ2-_GAk_qnHqDz-jWibRDFQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdPQu-r4aaeag9apYP1-FoQ2-_GAk_qnHqDz-jWibRDFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Jun 2024 09:18:14 +0200
Message-ID: <CAMRc=Mfsqnfy-Q++QyZNmsYoV72hUoNFEDCW6KZ0H_MEHEe5Rw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
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
X-CRM114-CacheID: sfid-20240614_001829_906960_759B46CF 
X-CRM114-Status: GOOD (  24.75  )
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

On Wed, Jun 12, 2024 at 2:52=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Jun 12, 2024 at 2:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wro=
te:
> >
> > Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >
> > >> >> Sure, I don't need DT but that's not my point. My point is why re=
quire
> > >> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA=
6390)
> > >> >> then clearly there are such devices which don't need it? To me th=
at's
> > >> >> bad design and, if I'm understanding correctly, prevents use of
> > >> >> qcom,ath11k-calibration-variant property. To me having the suppli=
es
> > >> >> optional in DT is more approriate.
> > >> >>
> > >> >
> > >> > We require them because *they are physically there*.
> > >>
> > >> I understand that for all known DT QCA6390 hardware, the supplies sh=
ould
> > >> be provided thus they should be required. If in the future we have
> > >> different design or we represent some pluggable PCI card, then:
> > >> 1. Probably that PCI card does not need power sequencing, thus no DT
> > >> description,
> > >> 2. If still needs power sequencing, you can always amend bindings an=
d
> > >> un-require the supplies.
> > >>
> > >>
> > >> Best regards,
> > >> Krzysztof
> > >>
> > >
> > > Kalle, does the above answer your questions? Are these bindings good =
to go?
> >
> > To me most important is that we are on the same page that in some cases
> > (eg. with M.2 boards) the supplies can be optional and we can update th=
e
> > bindings doc once such need arises (but we don't make any changes right
> > now). Based on point 2 from Krzysztof I think we all agree, right?
> >
> > Just making sure: if we later change the supplies optional does that
> > create any problems with backwards compatibility? It's important that
> > updates go smoothly.
>
> No, you can always relax the requirements alright. It's only when you
> make them more strict that you'll run into backward compatibility
> issues.
>
> Bart

Kalle,

Is that ok with you? Can we get that queued to avoid the new
check_dtbs warnings in next when the DTS changes land?

Bart

