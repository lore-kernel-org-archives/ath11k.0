Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F281CE7AFD
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N96X4Y3WZRv8HzIJuhI+PB4v4ZA+Pmo5p2uVjRPw4g=; b=iMwYQ4YNms2sYvdLey4k9kWT1+
	a0x7QzSe7uYLTzY2CMR2c6d4EiW+HcHm/kQb43n4CY9vyQ1RyCk9sogWWgGrl/XfDUpd6ow85V5V1
	lmBo9ipJrb2jahUtHmXbxCZOr6z3HdjZEgORJz24br/fGNp00xsPtxc1/o/DG5nBFFuHrgwggPOR+
	7cjtocUUh8loQ0dJhNdFsFkxe3GuKNSpX3/LaxZkH+fh/jaRZp8HEsc1a5GmR1c9T9g7XX9DnJ9uG
	zDitSIqMcy0ir/TQyfO1X4XQtt4dWKUNT4Ur3ojbeoz8F8R3zMlSH9i8e64REvU8j3maKItgDq1ER
	rae3Dm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVrb-0000000BgMu-3VdA;
	Fri, 06 Sep 2024 10:06:47 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVXN-0000000BaaO-2nAJ
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 09:45:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f4f24263acso32336961fa.0
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725615951; x=1726220751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N96X4Y3WZRv8HzIJuhI+PB4v4ZA+Pmo5p2uVjRPw4g=;
        b=zWirqW4G4+oryquOBOJ0EgrWfuEzBDuvBIqvh7C/PpMJnbrXsp+Diwfio8MCm1OA2G
         KNulM9V5ytLrkgwO7W9CP0FIsz01mUzlIrLhMAZg5fsdrvRQ8LDhDdya6vCB2Sb1f2Be
         wtpkhRPGmVU69eXCbk3UNWpGTs/1tkQ+9q+5IGN4YTzYIYmRfVgw6YLXbXwQ/yqeS0zn
         dAkAw3CXKPxDL7brFmjZoW/qjwSLdjH7RopA39I7rfxvxNKkppF3oa+iXUp8nYWZcZUu
         p2y8UUYHTT28lZMrGrQPyo+qloIFs8EHaB5gcplUUwvGDW+gbE0f0d2uyTBjTZdnT3Nx
         bNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725615951; x=1726220751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N96X4Y3WZRv8HzIJuhI+PB4v4ZA+Pmo5p2uVjRPw4g=;
        b=fxe+KVqCjnYN6f3YUY0vtxj2j7ahb7iRp+T9iPdywmfeZ9Ixl6PO19NswHDM0ayDML
         SlSufjOZGBWgsALp5MIpV3CY4kOlsv/umx1PaugrX5kv/6I8g/FnT/5UGv5eMkdRapPK
         McQYfbpjQ150oSi7ZabBO4DaaIcgzGExNQCX/L0ytj1IFtwanjtS+Z/x1Rb0yp1SRlcE
         5Ox9jVmXF++lpJ8OOpi32EMDkRNqHYiFRkoejkUvEu5UCxUmQgR/Q0JA3HdWG1ADSiSq
         e8uXz2gYVI762CuOHswvlS+Y0TCzhnOeHY1VuG9dReJuJj8kLQVtEwIQ2lFkAahanizH
         usdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmTCPfJiwdUuNiG1N1/rZ6JEIyixWFhAN7kHIUJm0VOB5ynkODgrGx8pg9NolEu4O58JPOukk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1O7DS2qI46w87Sw5oTbvW4saK8u0AgLmOFsJu60rCq6AQPdy
	2T9rBKYam+vc6uS+xPlkF0cfRSUuYQK9kcC90yPI7amdPWEYO0QWo2Fekwt24+oFbqzpkN8s6Un
	nNHEIZh9Y0wQE0Q04bagTBuVWrkoUp4pzG9v/uA==
X-Google-Smtp-Source: AGHT+IGZOs2YQ/b6VBK+7ovrdW/UGc4y8hc8WH2631JZBGR1pTalNb6hX5PKOlyh8um1udj4MEJKOm/AfkJedCuLViA=
X-Received: by 2002:a05:6512:3d17:b0:52c:9877:71b7 with SMTP id
 2adb3069b0e04-53658818bf9mr1118897e87.59.1725615950424; Fri, 06 Sep 2024
 02:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
 <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com> <CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
In-Reply-To: <CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Sep 2024 11:45:39 +0200
Message-ID: <CAMRc=Mf--M9d-awzQcs=W8frBwNfkjyvyCrmHAc3MofQo-qp1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kalle Valo <kvalo@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_024553_877270_6B9F77B2 
X-CRM114-Status: GOOD (  29.88  )
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

On Fri, Sep 6, 2024 at 11:37=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 6 Sept 2024 at 10:45, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> > > > Konrad Dybcio <konradybcio@kernel.org> writes:
> > > >
> > > > > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> > > > >> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbarysh=
kov@gmail.com> wrote:
> > > > >>>
> > > > >>>>>
> > > > >>>>> As you are going to post another revision, please also add
> > > > >>>>>
> > > > >>>>> qcom,ath11k-calibration-variant
> > > > >>>>>
> > > > >>>>
> > > > >>>> I had it in earlier revisions. The only one we could add here =
would be
> > > > >>>> the one from X13s as QCom has not yet released the data for th=
e CRD.
> > > > >>>> Johan and Konrad were against adding this here if it doesn't r=
efer to
> > > > >>>> the correct one so I dropped it.
> > > > >>>
> > > > >>> As Kalle usually merges data with some delay it's not infrequen=
t to
> > > > >>> have DTS which names calibration variant, but board-2.bin doesn=
't have
> > > > >>> corresponding data. The driver safely falls back to the data wi=
thout
> > > > >>> variant if it can find it. Als  usually it's us who supply the
> > > > >>> calibration name.
> > > > >>>
> > > > >>
> > > > >> Johan, Konrad,
> > > > >>
> > > > >> What do you think? Do we know the exact name and should I add it=
 or
> > > > >> should we wait until it's in board-2.bin?
> > > > >
> > > > > If we can agree on the string identifier with Kalle in advance, w=
e can
> > > > > add it even before the boardfile drops
> > > >
> > > > There have not been really any naming rules for the variant string,=
 it
> > > > just needs to be unique so that it doesn't conflict with other vari=
ant
> > > > strings. What have you been thinking?
> > >
> > > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (follow=
ing
> > > marketing name). Or maybe QTI_ instead of QC_. WDYT?
> > >
> >
> > Is there any central authority listing these names? Or are they just
> > agreed upon on the mailing list? I honestly don't know where they come
> > from.
>
> I think on ath12k these names come from ACPI tables. On all previous
> devices it is just being agreed upon. Kalle is the central authority.
>

Kalle: is "QC_8280XP_CRD" fine for you for a board called sc8280xp-crd?

Bart

