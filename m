Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCABFC6160
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0ue1UIXLhYSPozfX3gRLbEnC77zpspRA67c7dICmis=; b=Kgkv2R/ZLRYEeJOYYt+/Q8sbZy
	/4RM3BzYDyvs5/RVabD63QmajbQ4529EXGCAtqxzw/prXPtfm+HYABQaSk1m1IYm0ty66K3S1efKh
	kad/fuoCCTyfQWLjeyTuCg+SVKcT2bNU22f/osMLdvnWWv6hIxSk+WmnwFxI6mSufWe9DpY/65GP3
	R0MB+kyTYgiJdlTF8JIN8Lch3hEdX7d/U15peYZjyX7CFmaOpCxTTCpDWF7tRIRl19DEgaUcJs5lR
	bfXbDrQrrQU39WxWwvXlpKtRYgVo7fsJ2EHBd0h/LwbVNJDXNLc33uPr5zcxiaZQbGdGaEef9WbKA
	Ch6C7Bog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sp95E-0000000GXYT-1AlZ;
	Fri, 13 Sep 2024 16:23:44 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sp95B-0000000GXY5-2thw
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 16:23:43 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6c353f2f954so16571626d6.3
        for <ath11k@lists.infradead.org>; Fri, 13 Sep 2024 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726244618; x=1726849418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ue1UIXLhYSPozfX3gRLbEnC77zpspRA67c7dICmis=;
        b=KLz47LBHCxmM6H+hloaMSgrzZBFVAYuEZBN1h13bMmagz0sdIFx5FBbfGtvtMz49W7
         CwGTqY1oY1J8PbjMnz4aI8o78JHs3Co3P7tdNLeR19tmZ6ZAFPw2pqcg4EAUHVKbjCC8
         9++hz7rlP89H43biXucBEAFinlm+WoUjTzZ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244618; x=1726849418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0ue1UIXLhYSPozfX3gRLbEnC77zpspRA67c7dICmis=;
        b=CZqLSDenUDf7EK5wYFRF/ig9WMe5/OfABbwd27i52IaLPVwKBvaC3JzhO6V5UL3kT+
         qURhphZEdS+RxHdDgvoosYwtCZrIGFXhDUfjPtpEWTkyBHdtXbm2KStlaNG4cyi4nYzv
         bgmXQ/tchUiIFs1ic8HjTozY9gyG9SPNqq8J76LJ9FZLaIUbFe6D+36EwMz/yUZpc8xZ
         9Xk97hIVid73KrNminDOFE2KtQ+l1oimWfSTFDUGHgUT52OaMX5UD5Dw308kTknoK30U
         WD2zashEq1adQnGIr/Z/p7LFh1r2jlzTbVIpjak2Rz/vWEHhl1fZ8xjWuZ5JWeCwCEhY
         kFgA==
X-Forwarded-Encrypted: i=1; AJvYcCWco6m7fqI3+hemWsdtLUjQFPQ/6H6KHxMco7e4oHoM5SgfOPJrFZuZqayt7xayJv30+JFqdmQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNrS/yVEAtb/Wgkrh+Lj3OgeHnjcDxX7DvKxvum9QYP4zJkwGw
	dRgDJSbz2mRuYLBC6n0VRAkCA8TTK3Hb+wVQeKGWbYVGlMRpgQa8+H9lq3q2ZE1/y5dEl7K3kKk
	=
X-Google-Smtp-Source: AGHT+IHs82X4gk9V3t03NEQO+9/doWUtIu+xwUncS/Q5U2bF55YPIlk8/UqMjC2dmCuOcyXQwvRczw==
X-Received: by 2002:a05:6214:3910:b0:6c5:5b68:d790 with SMTP id 6a1803df08f44-6c5735593a9mr111735786d6.14.1726244618270;
        Fri, 13 Sep 2024 09:23:38 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53434704dsm67468386d6.69.2024.09.13.09.23.37
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 09:23:37 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-457e153cbdcso20600061cf.2
        for <ath11k@lists.infradead.org>; Fri, 13 Sep 2024 09:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbzNKKZoOHIqkN3/lM2YqthewCG/3NnE2nGUD6My9QFpXVqbEfLxiRLl5yjdC7rITm5ZIP28c=@lists.infradead.org
X-Received: by 2002:a05:6214:4197:b0:6c3:5ebb:9526 with SMTP id
 6a1803df08f44-6c573582959mr90511496d6.29.1726244616451; Fri, 13 Sep 2024
 09:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
 <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com> <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
 <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 09:23:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJWy7mVvnhB5HWwJWBLfA9UjyPpA1FSybVs8QDmXBFhg@mail.gmail.com>
Message-ID: <CAD=FV=WJWy7mVvnhB5HWwJWBLfA9UjyPpA1FSybVs8QDmXBFhg@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_092341_768827_2A78A07C 
X-CRM114-Status: GOOD (  22.57  )
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

Hi,

On Fri, Sep 13, 2024 at 8:37=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> > > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware=
 to ath10k
> > > > and ath11k even if gets executed on the host.  I should have caught=
 this while
> > > > reviewing DT changes.  This branch uses firmware name that isn't co=
mpatible
> > > > with the existing DT files.  Would you insist on adding compatibili=
ty symlink
> > > > or we'd better fix the DT files?
> > > >
> > >
> > > I think we have a limited user base of sc7280-chrome-common, so we
> > > should be able to fix up the DeviceTree, and avoid the symlink.
> >
> > I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
> > that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
> > ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
> > sake of existing DT files) or it's fine to fix the DT files instead
> > and omit the symlink.
> >
>
> Perhaps I'm mistaken, but does WiFi work on those boards today? I'm
> inclined to just have us fix up the DT and avoid sprinkling the symlinks
> all over the place.
>
>
> I guess this shows that I need to start holding back on future
> firmware-name entries until the linux-firmware structure is known.
>
> > >
> > > But I'd prefer Doug's ack on that.

As far as I know you can count the number of users of sc7280 Chrome
taking your shoes off. It might just be Abhniav and Jessica at
Qualcomm. I think they do care about WiFi but they could probably
handle a device tree fixup as long as you let them know. Certainly
there aren't any devices in the field.

-Doug

