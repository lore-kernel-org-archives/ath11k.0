Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8C3C27C53
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 18:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtWwyHQ/s1Mo+jSgQ3jPju5LLIQLxY5LIc0kGaj+Rp0=; b=ASvPOBcZjsn7OxgojQZQ9H26Q+
	8g88lK9mQC3ljDgqKP3Sh7BfPq2s7SZuck5KPMtEWk5o9016xGwsE93IholheCDOvShoHSDiaBDWK
	+GgXr0uSPF/kXO67SO9/zWHSwhfiZpXDotkKhCGV1pG9x2QS/KEkfykHgyCHCjMLAih6m6yor83cK
	wJrMtcL/GCy7jRhbgU3St4o/YRwXIhRODcmvA9NVf1xOVuj8LPvxcy+0SAFVeqDjG1czm4sLlEcDq
	nt9tUDd67ut4uOJE1laJ3v8Qct8oSJRJ3QHWKV7a4npayxJE8Y3sljfl8v9q+GguVQOcV35cNcLXy
	5GrfN7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYtF-00000003SLb-2HSN;
	Tue, 04 Jun 2024 18:28:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYtC-00000003SJy-42kE
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 18:28:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b93370ad0so4866177e87.2
        for <ath11k@lists.infradead.org>; Tue, 04 Jun 2024 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717525678; x=1718130478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtWwyHQ/s1Mo+jSgQ3jPju5LLIQLxY5LIc0kGaj+Rp0=;
        b=UbAMal5zKcUBxATToRhounEN4jwM1JAW23Nvt7k5d1hS5yX3Kzuzi4A1+nzaWabhw3
         IDR587z27pAA7X/uzjperO5/UNFV7P6mqD7JHgo2SzHDo/sppOdbkLgQ5cgdto4i+e0V
         LtgE/tbNgCs1URZKGVCTIppLjby/LnUO2CnW5hWT+16tQaqbECPsxvM0w6g/6M9RNf7v
         c0hCAbVMd9H0COm9VlsbF3/zHvZpJMa8DR++G/rT9jWhE5GyENP7FB4oF6KT4coDiJsh
         1J5lAnO3cP5oXVzFxxqgF9ZIuooCbf7FhobiM38MA/32dUk0elUNlt0T726yEC2vWhga
         4rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717525678; x=1718130478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtWwyHQ/s1Mo+jSgQ3jPju5LLIQLxY5LIc0kGaj+Rp0=;
        b=QreiyC47h7LdVnKfV/ZhyONW8oe7wVmz6Bw4WtpCva6Bsx5JFVisQ+PnaGtu2x0NMs
         pDQzKDLx5WSgkOh0TFo9Wr3p+J/iZb2+4xfBpINr7V598F0Wja8In9XhzevO19fYdqWg
         gMH543jxzkhM4TBZn8tCiT6w9pIiiFQkphRr1IJRwme8fDUkLMr8iqTbQx/3jH8uFlyE
         e1BSHI3WaUsvPN2DBHJI2JYUp+7HsFGSzyyHazZaCcEHsaZF6Z0ckCjQdGNcO58AIFgj
         SbqUzxEPm8vbVuzTedU4WZftpc//pUfk3Sp0dCwxy0W7/EXFa6drqDz/IBF1YFDsoV56
         1YEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ae3L563ia8hY/NjT38TdZMZeaCSSwj/Bq4gyu44XviHvbT15VoL8akW7YXcoSV7ISAkQEagItxkZP+ugb9+GAfG0h9IY7tw0MA==
X-Gm-Message-State: AOJu0Yxz/kUGKCv5qSQvXBL0WNRGkmfLQu1NeTkaUq3XFJsI3Pwhfekt
	F5WXIe0rz+5odLdMX7sXkh61yPG/FmNOXP/NgF8ceZOIQVkjEUmR3OVynVAR/B3rJxVsFo6HU/y
	5z8hiAgLlYcluh2OZS+mbEu8YOHQZGC47AecB/g==
X-Google-Smtp-Source: AGHT+IEIBmN6Pbw21C48aFo92GeQIhF5kiBTsuKNdmIGqw2sOD28tsikvtBG3m69ha2Gd5/MsgbO+7NQyJOTbJOSXRc=
X-Received: by 2002:a05:6512:2253:b0:523:9515:4b74 with SMTP id
 2adb3069b0e04-52bab4ca5e9mr311493e87.14.1717525678190; Tue, 04 Jun 2024
 11:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-10-d354d52b763c@linaro.org> <20240604174326.GA733165@bhelgaas>
In-Reply-To: <20240604174326.GA733165@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Jun 2024 20:27:47 +0200
Message-ID: <CAMRc=Mf_n9xcFHofq5Q_X3xs=2jDeor1zfFAd=bM0FywyhFUJA@mail.gmail.com>
Subject: Re: [PATCH v8 10/17] power: sequencing: implement the pwrseq core
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
X-CRM114-CacheID: sfid-20240604_112807_013508_F4DF79F9 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Jun 4, 2024 at 7:43=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Tue, May 28, 2024 at 09:03:18PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement the power sequencing subsystem allowing devices to share
> > complex powering-up and down procedures. It's split into the consumer
> > and provider parts but does not implement any new DT bindings so that
> > the actual power sequencing is never revealed in the DT representation.
>
> > +++ b/drivers/power/sequencing/core.c
>
> > + * Unit - a unit is a discreet chunk of a power sequence. For instance=
 one unit
>
> s/discreet/discrete/
>
> > +static struct pwrseq_unit *pwrseq_unit_incref(struct pwrseq_unit *unit=
)
> > +{
> > +     kref_get(&unit->ref);
> > +
> > +     return unit;
> > +}
> > +
> > +static void pwrseq_unit_release(struct kref *ref);
> > +
> > +static void pwrseq_unit_decref(struct pwrseq_unit *unit)
> > +{
> > +     kref_put(&unit->ref, pwrseq_unit_release);
> > +}
>
> No existing callers of kref_get() and kref_put() use names that
> include "incref" or "decref".  Many include "get" and "put", so maybe
> there would be some value in using that pattern?

These symbols are not exported and I personally dislike the get/put
pattern. Best I can do is _ref/_unref like what kref does.

Bart

