Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE74C25B76
	for <ath11k@archiver.kernel.org>; Wed,  5 Jun 2024 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ox0cTDoj9EAdvqJSQWodBv8pPoGx05u+NIZ/qY+c1Hw=; b=peYw0iwPpdAwaKIAY63sp6yYFF
	wHelz0XbLiicO45kGU3334rdSLw36xqf6eD2dL1ZzyhIhpSeUxF1DGkG94LQiMMsthmfM7tZKYbuB
	MRkrmC9X0K8TI0dfpcc3mVKP+bkF7y8sVYAPs0mzAFBHQFWw1R+D5Fn63GVZ0dbF3/bh7lHGA0Vor
	JbhxZZtT8RBeTaeQuqOR9qwf/tfLMJUSd3ImBjKFQ6gvSWVAtdnXcFvuVjuy7FX4gUj+EjKDKcuPB
	A5n6d80mARJkim/bZSbT0JeO3lw0FPSGjNJoFIR2s0COUqsvfU8XiVj59YCoILhM1uzVoD/HI63sW
	g5N3+auA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv02-000000075ZI-0hZC;
	Wed, 05 Jun 2024 18:04:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuzu-000000075W2-1OL4
	for ath11k@lists.infradead.org;
	Wed, 05 Jun 2024 18:04:36 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso1089401fa.2
        for <ath11k@lists.infradead.org>; Wed, 05 Jun 2024 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717610667; x=1718215467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox0cTDoj9EAdvqJSQWodBv8pPoGx05u+NIZ/qY+c1Hw=;
        b=n9TYf3JfkHh0L2maIBFtsjBAPigNCW9G691kjlmg+7PHkWN8/0mC+5gAYeKjx7dgQS
         2reR+edjsHOq3mi+ECheD6X/a11GhnT9D5jWAGbLZWaH2Vkp9yyqQpcyXhb7cpwBQNbW
         u8pQkKQYThG6gCoU6zs+6XmgzJCrFoDOBXW9qdKaAfQKeSpOOj73+0KeIl6V6tjncts8
         KIe1ArpC078NTDqbbp6QRdLtKgCmmQJ7TMx29SyRoSs/ZgX9QQz+bNsFFD9rV5M1pTdz
         EhePguCgc41YR7jBTj45XnxX4LXRqtK6Zpcfg2GjboWwlHTabINXeh6/LZ2fQ/szxq+P
         VCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610667; x=1718215467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ox0cTDoj9EAdvqJSQWodBv8pPoGx05u+NIZ/qY+c1Hw=;
        b=P96n2Hx2Hezq2fBuLEvoORvvUBY1u2YNaZQgM1bTnwHZb3BwpeQ6i9z/GgGI1fXjhP
         +tU4jlOCb2NkfENedEay6EhDZbZ3dQYlSwlJfnn5jzshB9FPtaQ5kqFikRSwoSO7xEWY
         Og03bJX55blrJYGpafufTb7RbsOmeYKeO5Jh170LWxIcs63ndGNfs7rmRRrryZcARWuc
         JPGP3t1wOxvfy5u8/oR4W7FlGOdIGJHQgZ3S6pbjwJtZm/is2t4vp6yi7slGvb+Cg48x
         gHgjYmaN5n3t/7pk8HT+XVheHczbnnDgQD+Nq3eLKszzrea2aAOEo99vZu14hsa3SJTZ
         uRyg==
X-Forwarded-Encrypted: i=1; AJvYcCUCiyQvumYcSGKI3ntT9Le8A4nsCDI5KjscXYUM+fbgIecJRnD8lkuPYnm5+FfgW0RGnW0BAhpB1q0BWFYRuZOohA0zZI4jcARhLQ==
X-Gm-Message-State: AOJu0YyVxR3l/WVSg1eeGWQTMlbtyr8oj4NMGX01oZa6UbXOVkK2EAJa
	uSamRLa9fDzzz2ZtCRCWzAXaZ/4qT5VjiPbkaYPl68EhMHhEuMKArb4Olym3fv6f8hsvqSLtGJ6
	bHQ2J0Bn8VK6bhumo/cbkXOjTr20Zqfq5avI1TQ==
X-Google-Smtp-Source: AGHT+IHXq8dGpJoU2dr2zBFCKOEvbFdkmlsdgV/Jz6JlWy3+wkJEsY7up5jQ+fPM273H+nj67WDMFnp7tdG9g6BvQ40=
X-Received: by 2002:a2e:b00a:0:b0:2ea:7726:4a77 with SMTP id
 38308e7fff4ca-2eac7a72b8emr19843541fa.35.1717610666844; Wed, 05 Jun 2024
 11:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mckab1QYoBuE3iSv0x+GEjFNBQS5Hw_Mry=r7h5XGHZEQ@mail.gmail.com>
 <20240605174713.GA767261@bhelgaas>
In-Reply-To: <20240605174713.GA767261@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 20:04:15 +0200
Message-ID: <CAMRc=MehAkEGJmCXi1uad1f7jZAT60OQ2N0jX7AMka4rS9OjDg@mail.gmail.com>
Subject: Re: [PATCH v8 16/17] PCI/pwrctl: add a PCI power control driver for
 power sequenced devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110430_702356_8AF26B0D 
X-CRM114-Status: GOOD (  28.94  )
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

On Wed, Jun 5, 2024 at 7:47=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> > >
> > >   wifi@0 {
> > >     compatible =3D "pci17cb,1101", "wlan-pwrseq";
> >
> > What even is "pwrseq" in the context of the hardware description? DT
> > maintainers would like to have a word with you. :)
>
> There are "compatible" strings like "simple-bus", "simple-mfd", and
> "syscon" that allow drivers to bind and provide generic functionality
> when they don't need to know the exact hardware.
>

There's a difference however: a "simple bus" is a thing. A "simple
multifunction device" is also an actual thing. A "pwrseq" or
"power-sequencer" is not a thing, it's a functionality. And we don't
describe it in device-tree. Rob has said before that he regrets having
merged the mmc pwrseq bindings back in the day and that he wouldn't do
it again now because it describes what HW does and not what it is. In
this case the PMU is simply a PMIC and the bindings I'm proposing
describe it as such. But what you're proposing is even worse: this is
the ath1x module of the larger chipset (power sequencee rather than
sequencer) so naming it "wlan-pwrseq" makes absolutely no sense at
all. It's a PCI device whose ID is 0x17cb1101 and the device tree
describes it as such.

> > > and pci_pwrctl_pwrseq_of_match[] had this:
> > >
> > >   { .compatible =3D "wlan-pwrseq", .data =3D "wlan", }
> > >
> > > Wouldn't this pci-pwrctl-pwrseq driver work the same?  I'm not a DT
> > > whiz, so likely I'm missing something, but it would be nice if we
> > > didn't have to update this very generic-looking driver to add every
> > > device that needs it.
>
> Do you have any other ideas to reduce the churn in this file?  It just
> seems weird to have to add an ID to this file without adding any
> actual code or data related to it.
>

Is it really that much churn though? You'd save 4 lines of code? I
think this is premature optimization, we'll see about unifying it when
we have several models supported, right now with two, I'd just leave
it as is and not seek perfection.

> We should probably also add a pattern to MAINTAINERS so
> get_maintainers.pl on this file will show you as a maintainer.
>

Makes sense.

Bartosz

> Bjorn

