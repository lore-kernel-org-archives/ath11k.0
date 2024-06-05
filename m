Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B206C27C53
	for <ath11k@archiver.kernel.org>; Wed,  5 Jun 2024 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPra9VnPeBiNtl2fHAj/AHY/htZJd5zpefm5z/7mvlE=; b=Lz286pVXCNywEbZz2rPdK2R4Gs
	mp4SLenn1gCWGcJT4ueZIyJbuwsxgdLeGwKG/3elX4xiztU5wItdVjzxXl8swqLhNn26u2AC7ESGL
	fenb0pKPib9ROiiXHzEfZbh+5VYaC0dN1PvNW6ye0mfUAr/EgbvVHgDKXSBp7TbK/lAfwbqwiwLXS
	/uoH5+syQi3CZjNDBXdNbUDzANcw2XPHzrkIUdWyq+nyEXSW1vr8mFsGMnwmpBZ4s9FPneeZ+oC9c
	3GVm2frYgwJKjUiuzgkHjyt/PkEQy4xAYzEs07SD+c3uxlDhVZkP/qR48rb8GlfdC2XF8DHgSXtsF
	RdUSFCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmJC-00000005Hca-1JYq;
	Wed, 05 Jun 2024 08:47:50 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmJ9-00000005Ha0-0b2Y
	for ath11k@lists.infradead.org;
	Wed, 05 Jun 2024 08:47:48 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e73359b900so21289001fa.2
        for <ath11k@lists.infradead.org>; Wed, 05 Jun 2024 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717577264; x=1718182064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPra9VnPeBiNtl2fHAj/AHY/htZJd5zpefm5z/7mvlE=;
        b=XfxTtZ8VuIBJw/7HYBQ4ZiQWeyn1ceeAjRh2luC4Gz8a8zlMICfW9D9fulHx3PPAIg
         2E3drWlcL3HECWtjnNnIyyNn2O8ymdj5GAJWEyWTez0acWeG5cqOaKJKn0GLhT7MtI3J
         s4fdtI1uQE1B0K2KPIG7ijIjg3ptq8NSrmGdh15tEbB364/XYzNcGZ9eq3WOfKt79J2C
         dt0VZx3JZtXLrpEsJPFH7/d5xnVWJlG9ZQ6pU1YAgVoocOu2FFeVf1QUkC7D2wr8p43I
         65pVLcg2hvPjjMhp2Z8tE+mM9DLZlJTYQ71Dc5IBgb7zIy0H29yo0NNPMiQlp/jnPpwg
         Fa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577264; x=1718182064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPra9VnPeBiNtl2fHAj/AHY/htZJd5zpefm5z/7mvlE=;
        b=I0ANO6lGppGdNOgr4iHyPNic6O/B3Scrv+tZjiKw+lSD7TSwrTdaubnighpaG52D/3
         NjMy9cPT24tLVF4Qmgaxf6dnWXgErSzNcBEvJGUwodhIzpDyJZYAZWXWZBFn8+u7muqZ
         mQmGhAjRTFrwRswOrneW01s6R4KxZCAAkYYBgHCxtJn5bDeCiG6L/2Hv04k/ROtYkcMi
         oCpgxlO/rK45SPTNKA0Cxi5rPxIcXY/hnK4NTW4kBbB3T7JbSWYLpzBD+kVPB6BKAsiQ
         fiWx3aHQKfo5On7v+t+G006jrZg6F1tiE0oWuLohC8zLPMUW8A+L01i7BbkzvJOIdnFA
         YnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs7FGXrJeD4VPNHFXbgF5CaQWKVi5afNH7jZkU1xc5em0vJhw6WWjXzkUYEFb71jUlPsxmch4vD5yc7VwjQv4O51rfgQJUL/W5kQ==
X-Gm-Message-State: AOJu0YwKgBjDGN6CdZ5kV/8HFEMxwDfVTFaFLSTxvML2A+/YVzVXumfw
	uJO7I7X8KyoAeXTqYzyNoIsOz8zE7ThuIga1HTcDItwZYOPsYfuvWM0pxgpQ4Pd3PAHM/TDfEPI
	px5OEAFvSSWlO04Fvc2ZWzcFD41j3kf+VJ7g8Zw==
X-Google-Smtp-Source: AGHT+IFvAhNmZjR8e0W7tisE1L2rItCbACVQEOeSPIHCQ/2JT5Lzac0kUX9ZWXyqBUxDLGDW1jONb8JYHYsrWH/7fyo=
X-Received: by 2002:a2e:7a0a:0:b0:2da:b59c:a94b with SMTP id
 38308e7fff4ca-2eac7a2299fmr11245531fa.25.1717577263571; Wed, 05 Jun 2024
 01:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8EJpomPLQmQbW8w3_ms_NMKHoSPcqBa7f2OhNTTOUSdB+9Eg@mail.gmail.com>
 <20240605021346.GA746121@bhelgaas>
In-Reply-To: <20240605021346.GA746121@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 10:47:32 +0200
Message-ID: <CAMRc=Mckab1QYoBuE3iSv0x+GEjFNBQS5Hw_Mry=r7h5XGHZEQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240605_014747_237484_3623E4BD 
X-CRM114-Status: GOOD (  40.11  )
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

On Wed, Jun 5, 2024 at 4:13=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Wed, Jun 05, 2024 at 02:34:52AM +0300, Dmitry Baryshkov wrote:
> > On Wed, 5 Jun 2024 at 02:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Tue, May 28, 2024 at 09:03:24PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Add a PCI power control driver that's capable of correctly powering=
 up
> > > > devices using the power sequencing subsystem. The first users of th=
is
> > > > driver are the ath11k module on QCA6390 and ath12k on WCN7850.
>
> > > > +static const struct of_device_id pci_pwrctl_pwrseq_of_match[] =3D =
{
> > > > +     {
> > > > +             /* ATH11K in QCA6390 package. */
> > > > +             .compatible =3D "pci17cb,1101",
> > > > +             .data =3D "wlan",
> > > > +     },
> > > > +     {
> > > > +             /* ATH12K in WCN7850 package. */
> > > > +             .compatible =3D "pci17cb,1107",
> > > > +             .data =3D "wlan",
> > > > +     },
> > >
> > > IIUC, "pci17cb,1101" and "pci17cb,1107" exist partly so we can check
> > > that a DTS conforms to the schema, e.g., a "pci17cb,1101" node
> > > contains all the required regulators.  For that use, we obviously nee=
d
> > > a very specific "compatible" string.
> > >
> > > Is there any opportunity to add a more generic "compatible" string in
> > > addition to those so this list doesn't have to be updated for every
> > > PMU?  The .data here is "wlan" in both cases, and for this purpose, w=
e
> > > don't care whether it's "pci17cb,1101" or "pci17cb,1107".
> >
> > These two devices have different set of regulators and different
> > requirements to power them on.
>
> Right, but I don't think pci_pwrctl_pwrseq_probe() knows about those
> different sets.  It basically looks like:
>
>   pci_pwrctl_pwrseq_probe(struct platform_device *pdev)
>   {
>     struct pci_pwrctl_pwrseq_data *data;
>     struct device *dev =3D &pdev->dev;
>
>     data->pwrseq =3D devm_pwrseq_get(dev, of_device_get_match_data(dev));
>     pwrseq_power_on(data->pwrseq);
>     data->ctx.dev =3D dev;
>     devm_pci_pwrctl_device_set_ready(dev, &data->ctx);
>   }
>
> I think of_device_get_match_data(dev) will return "wlan" for both
> "pci17cb,1101" and "pci17cb,1107", so devm_pwrseq_get(),
> pwrseq_power_on(), and devm_pci_pwrctl_device_set_ready() don't see
> the distinction between them.
>

These are only the first two users of this generic driver. We may end
up adding more that will use different targets or even extend the
match data with additional fields.

> Of course, they also get "dev", so they can find the device-specifc
> stuff that way, but I think that's on the drivers/power/sequencing/
> side, not in this pci-pwrctl-pwrseq driver itself.
>
> So what if there were a more generic "compatible" string, e.g., if the
> DT contained something like this:
>
>   wifi@0 {
>     compatible =3D "pci17cb,1101", "wlan-pwrseq";

What even is "pwrseq" in the context of the hardware description? DT
maintainers would like to have a word with you. :)

>     ...
>   }
>
> and pci_pwrctl_pwrseq_of_match[] had this:
>
>   { .compatible =3D "wlan-pwrseq", .data =3D "wlan", }
>
> Wouldn't this pci-pwrctl-pwrseq driver work the same?  I'm not a DT
> whiz, so likely I'm missing something, but it would be nice if we
> didn't have to update this very generic-looking driver to add every
> device that needs it.
>

Device-tree describes hardware, not the implementation. You can see
elsewhere in this series that we have the PMU described as a PMIC on
the device tree but we never register with the regulator subsystem nor
do we create actual regulators in C. The HW description does not have
to match the C implementation 1:1 but has to be accurate. There's not
such HW component as "wlan-pwrseq". If you want a good example of such
generic fallback - it'll be the C45 ethernet PHYs as they actually
exist: there's a HW definition of what a broader C45 PHY is, even
though it can be extended in concrete HW designs.

I'd leave this as is.

Bart

