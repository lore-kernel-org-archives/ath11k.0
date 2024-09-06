Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05BFCE7AFA
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/nsrHcczWHZSZRkMXgJlPhYYjECdjwNlK3z7QSwRB0=; b=bas5YtjazFdszlbox0PNgdN+As
	t93d+7neTyXJbfAR4QL3lj9nD6ItvTMrMuHGgbGsQYG05VzjJS3CwlodnPIWbxxn5Rrs52tC29GCU
	sqEJAq4lBqyrqYoC4yXmlujFRUPaOf0JppZxU7Rr9Tpa4ZcxewqMmiBLZEVwd2kafE49JybwFa2UV
	e1evqcYfNRd+mqOfRs/tf7APBYhcXprq7R2VdYQ3a5q02NFfA2m10VHN2biGlrmAp1iUbH2mgrYbS
	triZ+xlsp4dod8j+ojz9sknx/RX5FzUZo3UolwbOuWm+GkQLIlEjoQbVf37PmEVH3is2wQv2k+g3D
	NDvTAK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVWN-0000000BaBz-2FCS;
	Fri, 06 Sep 2024 09:44:51 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVPE-0000000BXVx-1O40
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 09:37:29 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6d5893cd721so16012547b3.0
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725615447; x=1726220247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/nsrHcczWHZSZRkMXgJlPhYYjECdjwNlK3z7QSwRB0=;
        b=rNN9eAQkPDyYrmKsXUCfJj5x+Qkkl/DrFDPEfKBf2iAdSa7MgjGuduImIPzUVkeEAv
         3zHv+gJju4P8ML/42xSDEBJ1PHH7mVvWLdmQagOcSwMOqJ3XUkTstlRGsHGmnUoi1phM
         uDlIbaaO1q/1z3LiqgUiymkl0FxZhxnanBLATxuzK24qPTKEPagZ5b2uLejght3LoDqn
         S/YOU7HfUnSxppKL7iWoEK2bb65cUZ4PnxrbWJktaPGTG7wIob9i8B80JU59gof+rrdW
         GXFyF28PL98YK8fBJt/HPKJTcLiZvzSnrriK9ZHllOhX51OEmqatk3gdyctIK8mvjHnD
         JvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725615447; x=1726220247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/nsrHcczWHZSZRkMXgJlPhYYjECdjwNlK3z7QSwRB0=;
        b=q55cFpKWB0gMDchN9etfjnZbw7MTTI5cGdjJZZ+XsFdNtIsZDQj6XrnYBqMd8w58P+
         8lAChVJebFzBEU7V3uorgvIvFXUbHr7opz2rgS72aipmM9lDG8ofgMCBpbjdjicg4Wxj
         iBiqNuWWHXFLCbEt4d7sdP4WAKUOfL/+2BSOx5l//IuSmPK/MWKPvN+aAgGe/Uppo0fv
         tVPmTqlkVgyS2KkKQzRGMsWjHMT2YaB9FLJxbG5QyEZJWa3ZgsuhgbJTCQ6NZ2L33niQ
         gLoPzMsIQzAZpxjmGHZhX6XHtElsR0g/Sq2OlC/Bt/TBt2ES2iHXGrNQBXeBVCyDk95D
         Yjyg==
X-Forwarded-Encrypted: i=1; AJvYcCWSv1PzkPGp0n+bkIX+lbzNUOL1fPiOBZpnLsrpOQScdGOjxAR5cqiXKt7qmqq6T1SBocqDS3g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7DGSPOtLLCYMN0knuTODDjCkpfW8GX4oSqN99l13kmGvHKDv
	bQ91fWdMgdf0dr6RKk41v9owOkkNOs1ESoWVxqqOcnMS4TEKNtzHC2JPAKAMKSs9KKVy7aIIQuG
	2B9EkautXATMpjW/djYpLoDNeL4mzhrOVt+ZE0Q==
X-Google-Smtp-Source: AGHT+IFZN9hYbTcxM1YGXAqx6TijY45qpQ4RcpRodCBMlcZqtSKVL4Cgbh2pPzb7plTG0Lq3ULZUkDoC4pvzYMrTbRQ=
X-Received: by 2002:a05:690c:d8c:b0:64b:2f31:296b with SMTP id
 00721157ae682-6db44d69aa3mr25692997b3.4.1725615447013; Fri, 06 Sep 2024
 02:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q> <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 12:37:16 +0300
Message-ID: <CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_023728_392720_1A6A7202 
X-CRM114-Status: GOOD (  27.15  )
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

On Fri, 6 Sept 2024 at 10:45, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> > > Konrad Dybcio <konradybcio@kernel.org> writes:
> > >
> > > > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> > > >> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbaryshko=
v@gmail.com> wrote:
> > > >>>
> > > >>>>>
> > > >>>>> As you are going to post another revision, please also add
> > > >>>>>
> > > >>>>> qcom,ath11k-calibration-variant
> > > >>>>>
> > > >>>>
> > > >>>> I had it in earlier revisions. The only one we could add here wo=
uld be
> > > >>>> the one from X13s as QCom has not yet released the data for the =
CRD.
> > > >>>> Johan and Konrad were against adding this here if it doesn't ref=
er to
> > > >>>> the correct one so I dropped it.
> > > >>>
> > > >>> As Kalle usually merges data with some delay it's not infrequent =
to
> > > >>> have DTS which names calibration variant, but board-2.bin doesn't=
 have
> > > >>> corresponding data. The driver safely falls back to the data with=
out
> > > >>> variant if it can find it. Als  usually it's us who supply the
> > > >>> calibration name.
> > > >>>
> > > >>
> > > >> Johan, Konrad,
> > > >>
> > > >> What do you think? Do we know the exact name and should I add it o=
r
> > > >> should we wait until it's in board-2.bin?
> > > >
> > > > If we can agree on the string identifier with Kalle in advance, we =
can
> > > > add it even before the boardfile drops
> > >
> > > There have not been really any naming rules for the variant string, i=
t
> > > just needs to be unique so that it doesn't conflict with other varian=
t
> > > strings. What have you been thinking?
> >
> > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (followin=
g
> > marketing name). Or maybe QTI_ instead of QC_. WDYT?
> >
>
> Is there any central authority listing these names? Or are they just
> agreed upon on the mailing list? I honestly don't know where they come
> from.

I think on ath12k these names come from ACPI tables. On all previous
devices it is just being agreed upon. Kalle is the central authority.


--=20
With best wishes
Dmitry

