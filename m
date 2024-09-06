Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ABECE7AE0
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peA5Xi46r5KS8PibplJ1gJDlcVPnc6AYKPt9afJyua8=; b=xKwdLiYf/AbwTs8TDwMLj8Eyfg
	x1eJ+VlNVAS/Z6rG3hl/QH5sYr902zq/W026kIpMG8XvR896r+prqm9HiEEz6buI1CAmx6PFedGEj
	iL1D7z8YVTHG4iI9VxUD/habHA6UNzTMF2L83E3aP8232d7emJRDRuXSG2LBbc/ZFd7ophbDFfgv5
	C86OGVHhGkSNwanH7tGKqBLbhIG3yueyfo8G+JonTNjl2hNROy8Dpa7MBWsIe26NNkB9dXuQAHkbh
	C1ktWRKsNI9CDj6Vjd5Feef/bkTbk/PjBifBfSdIIfM67FurbeZw/y0NF7WnBwGJNOMWuIwELzfEj
	PgvHKpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTgm-0000000BAbL-3jEW;
	Fri, 06 Sep 2024 07:47:28 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTfJ-0000000BA73-190f
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 07:45:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so137885e87.3
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725608755; x=1726213555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peA5Xi46r5KS8PibplJ1gJDlcVPnc6AYKPt9afJyua8=;
        b=fOIuqYcMVANU0hZ2EQyCpZ+ErTn4uDSukNbB6ILAAbaxvstFqhQrOcQSV8pM/6DCNC
         JHdoCgpQuN5VhK354Prh+1Mm7bXiX9QMB4UQzq5WmTSX5LHQJH6eqXZbzE0KMWRCzMuR
         JUVYz/D9apEsIpuO7f/+wuoTsmBGh1XoVps3PAgidtFQ76bogcq/eJ6tYFln2kxI922r
         4knu3dtnP3fVzt64ebRN1zWFVDR0iGg1V79+wZpxqNLJfQCN5jJ5u6NcKKackPf9BYkl
         GWxYpxjVVMagCAGLLIgfmFxjL+1nVIF4oHhoS1o2dR7ssRyf+9vY7FSNwciu98aAKkxk
         cy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608755; x=1726213555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peA5Xi46r5KS8PibplJ1gJDlcVPnc6AYKPt9afJyua8=;
        b=e99NGga2eNw/YALxZ+LcHyjhDDVWiv+TNyn4hXxnAjpEpW+g/w5Dt/wdxCcxe8HkWF
         2dgkjDbHYGuVmP6RVyOkDYNo4W2gGJw4EAGd9WXtgoLrpVRlCY1JUPFdYAZ0Nd8vJ5MZ
         xBeso8qyEcTI432+4E+Y+9XGBzNCrrv1Y7OCP/Qknt8qk4NqRVBnCB6paa0ytppTIR0M
         vLQAuSCvJM/TZPz1byX2UlWP0bMEJRhINVkZk9vYJMWNxBGp4sjIs8IJl7GxxRp6Zf5B
         ReiCRQH387zWtz8BB+zrK1tNz/7yisInRmRZ1eVJyJ6vo9JE9gyMx+du33MW5rE/I1BL
         2Mwg==
X-Forwarded-Encrypted: i=1; AJvYcCUPkj6Fbe1beWk8CRWpCCvfsQhxITp/TY1/ueEzwYatTb4cH4/ZBvM8nubH/O/JkDrdFAmlqZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5BLpeEav2/shqYfLbV6TbCB/myO8cDB03FQyIwwZcPlsBYte6
	JCvIKRACvcr3KocAuf7TuEgj0PHTlfqkhKaiCfIkRnzBx6fk80WHA/grucqS2IF6SFy6KaylJq/
	9vqQFsBQE6N4Zw5EXce0WoPMR2MVb/XvDx74+aQ==
X-Google-Smtp-Source: AGHT+IH7dwNJCKos7PVubwaAvDIO1NYtb95CRhl5tKSoU8mWk4qIkkXILHsFMkiSHJVV6H+U3A4hzabLSWXMZi8hh5A=
X-Received: by 2002:a05:6512:398d:b0:532:ef22:eb4e with SMTP id
 2adb3069b0e04-5365880a275mr688996e87.54.1725608755113; Fri, 06 Sep 2024
 00:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> <87v7zagcyf.fsf@kernel.org> <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
In-Reply-To: <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Sep 2024 09:45:44 +0200
Message-ID: <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_004557_349303_FD8222BB 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> > Konrad Dybcio <konradybcio@kernel.org> writes:
> >
> > > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> > >> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@=
gmail.com> wrote:
> > >>>
> > >>>>>
> > >>>>> As you are going to post another revision, please also add
> > >>>>>
> > >>>>> qcom,ath11k-calibration-variant
> > >>>>>
> > >>>>
> > >>>> I had it in earlier revisions. The only one we could add here woul=
d be
> > >>>> the one from X13s as QCom has not yet released the data for the CR=
D.
> > >>>> Johan and Konrad were against adding this here if it doesn't refer=
 to
> > >>>> the correct one so I dropped it.
> > >>>
> > >>> As Kalle usually merges data with some delay it's not infrequent to
> > >>> have DTS which names calibration variant, but board-2.bin doesn't h=
ave
> > >>> corresponding data. The driver safely falls back to the data withou=
t
> > >>> variant if it can find it. Als  usually it's us who supply the
> > >>> calibration name.
> > >>>
> > >>
> > >> Johan, Konrad,
> > >>
> > >> What do you think? Do we know the exact name and should I add it or
> > >> should we wait until it's in board-2.bin?
> > >
> > > If we can agree on the string identifier with Kalle in advance, we ca=
n
> > > add it even before the boardfile drops
> >
> > There have not been really any naming rules for the variant string, it
> > just needs to be unique so that it doesn't conflict with other variant
> > strings. What have you been thinking?
>
> QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
> marketing name). Or maybe QTI_ instead of QC_. WDYT?
>

Is there any central authority listing these names? Or are they just
agreed upon on the mailing list? I honestly don't know where they come
from.

Bart

