Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1824C25B76
	for <ath11k@archiver.kernel.org>; Wed,  5 Jun 2024 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNBfOsZV2m+6msPbBCsAxl6hJfnlMOUzddiwLhwfpe8=; b=XIdzMmtfzdRux6S2wwFf4i32PX
	KH6MGsa0cW7cZuUKad8Z/kDDNux5eUa0ra8EZ+IkEECKYtufQ0EJdCG5s0K8Wdtdj3QUCbuS33UQc
	Pgn7D3WDeBtwJpeGbkLBzQF1vjbmwU15OlgreCTtBOyiP8NXwqPyw4bIM+XgWcfMKDSh8LOnkRuqV
	3YjhNylku6fAIXDI0M9Ih+5KVHMA+vgIFEFCN6bM5eLP1T68ZSWhp6MWmRzfHFwOMb6Mk7//s62Jm
	/mb7ovEKGU1hybZbSYV1/LdC753f67fQVkObVEsQZAA2TC+fNA0MWIv+hmtL44fAThRYFEr48hNEA
	EAhwzapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv0k-000000075o9-2sQf;
	Wed, 05 Jun 2024 18:05:22 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv0h-000000075m4-3Umu
	for ath11k@lists.infradead.org;
	Wed, 05 Jun 2024 18:05:21 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so1192481fa.2
        for <ath11k@lists.infradead.org>; Wed, 05 Jun 2024 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717610717; x=1718215517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNBfOsZV2m+6msPbBCsAxl6hJfnlMOUzddiwLhwfpe8=;
        b=d3khyKp65w9QaEBputwE+yrndr6JIYpcMGwE8dtA1+OiN+v+IbozmmCFUkPky1PxNo
         LvjmfkTsGKr8wcfBU4XLEiM2gGbdLZvMFk0PX8yvDWRWepjSrNcSm6/v5Lm3JrYiV0Fk
         9GjpKsze2AcN4XUQ14QYP0GTP9lVtPk8nfy6AAfkKSFJmalRvBnomU6XY471nICM7vof
         +Z3dnt7PrUs1cZhGj1sOfEoffs2lcB0oc/PGTKJLaRuuBqwZwiI3obUQ05yszTtEhhCv
         QaJjcOzwRbjTPp55kmUcFegTof8kkmd37h0Yf8en/nK77xXWgNbBXHx1YrZo5XzxxBCT
         sGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610717; x=1718215517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNBfOsZV2m+6msPbBCsAxl6hJfnlMOUzddiwLhwfpe8=;
        b=iBtb6Hq2qlU6KbJUshajjlBd+Y19CJmqgKaaxE/ViQW264MwktujLNWYCITfJe5U0W
         ANoQ0u5fnVMrT1kcMHOr+KF+TsrygtubeIYEG82dqN9XITK9ptIwXGeUEnDwW4NMaZsq
         Sbtew+PtuF5CJ9WkYM4ptaVpyTXI7FaK69zF9axWlco26Wtewk/V3Dq46zy4EM1O/CJ9
         fxDtQxzcoJP07AHfNIm1Mzc6vBSNHHgG2fgjunYH9lDwO+WsiMylFI9P570MW811r8mQ
         glsMO+ZQrGw5JMcfrhHk1Z4cES5AIvnF4qAeB8Wj1yqAz0vZ6Dv0ITcegS+TyYu4a1Cv
         w/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWS3SmjfZhkNA9Xnr1FtB8TvrCqAL1w2ONVGccnBqn8wIfQfrSLSQy+90JxiscIKxXypT2qdNsi7sUA9NvlcvXCj88qEABwfLpYaA==
X-Gm-Message-State: AOJu0YxU22Eqkuu14TX0lkE90RTQrslpbJM+74wyx9MRwsyaXz9qoBsD
	AINZHZby0dZD+gzCHgQiDC5KIsviM+5gwQ+L0xyf+iI54FeRQ5GWIk5qZ6clAyJ/5MgQIz8g5P8
	93cMRtn6r+j9cKikSHxo9bGOwEfd9adhckOsxxA==
X-Google-Smtp-Source: AGHT+IGPHvJeLayk3efrcKgO1Obiv1k65fgMPOv7p9k5Kuf3j8UsHmQHvC67KCL/2EfjazgzdJtjTyy7e7G17peXDnE=
X-Received: by 2002:a2e:8ed4:0:b0:2ea:7f57:5a74 with SMTP id
 38308e7fff4ca-2eac7a6c3ccmr18672681fa.42.1717610716971; Wed, 05 Jun 2024
 11:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-15-d354d52b763c@linaro.org> <20240605175757.GA733809@bhelgaas>
In-Reply-To: <20240605175757.GA733809@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 20:05:06 +0200
Message-ID: <CAMRc=McKD=ZhGzRUeLezT3oKfreDWQeKBvuousf8zsQjJb1QMA@mail.gmail.com>
Subject: Re: [PATCH v8 15/17] PCI/pwrctl: add PCI power control core code
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110519_878509_CDC129A9 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Jun 5, 2024 at 7:58=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Tue, May 28, 2024 at 09:03:23PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some PCI devices must be powered-on before they can be detected on the
> > bus. Introduce a simple framework reusing the existing PCI OF
> > infrastructure.
> >
> > The way this works is: a DT node representing a PCI device connected to
> > the port can be matched against its power control platform driver. If
> > the match succeeds, the driver is responsible for powering-up the devic=
e
> > and calling pcie_pwrctl_device_set_ready() which will trigger a PCI bus
>
> s/pcie_pwrctl_device_set_ready/pci_pwrctl_device_set_ready/
>

Ah that's a leftover from when it was PCIe specific. Thanks.

Bart

> > rescan as well as subscribe to PCI bus notifications.
> >
> > When the device is detected and created, we'll make it consume the same
> > DT node that the platform device did. When the device is bound, we'll
> > create a device link between it and the parent power control device.

