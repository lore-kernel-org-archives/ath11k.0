Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA588ECE564
	for <ath11k@archiver.kernel.org>; Tue, 10 Sep 2024 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=; b=iVYARmOpfKhLk6I+uHUAclk4Mj
	bj+HmZmHNzI+YkHYeQxo6KtVHAlf0L501TiMcdMIdTvvwmE2mOEQmxZbUF4roHqLw938MaOxolzWF
	PuLLaq3bas7WNMOHMZBaT0TerIXY9FU+wVivJgDPvmxVl41fGz42uuxwa6s2tT2t0LVzLKnWSkCjf
	C11UmP9vAwFlqRU/l37GJ+OStep+0qSJh+nI48JFoCVEYsLZSt8UHlOiRP/cLIUq8MB+ImX5l8BvI
	UaRbl16fAAm17OJpJxUMZ2+wAv7xPiNGhfvbk4EQbl/1WrSAx6pWP0EsawNLyEk5q30lo30ihXBT1
	xRx1Ia9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzKl-00000005QpK-1vw9;
	Tue, 10 Sep 2024 11:46:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzKh-00000005QmI-2mfd
	for ath11k@lists.infradead.org;
	Tue, 10 Sep 2024 11:46:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7c691c8f8dcso3615284a12.1
        for <ath11k@lists.infradead.org>; Tue, 10 Sep 2024 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1725968814; x=1726573614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=;
        b=GpeAFRDqa8afjRrHbLA6CXP7NN0OM/b89T4HlTzlx39MdfwYteLo0vzsrQIqayuqEH
         Z7YUisl/mPTpKWBVJBs9uSNsVlj5o3ropb0T69xhn7+VC0WqODGUNpv0mdP7tKJoe0Ud
         j7AZVgdLymfFn3sRkjc+GlaJNv0myT69HHJUf3ePNhU2H2TmJjioyiZJbK6h4wuRxaui
         ufDMLHnEd9HMHu41A/58cJItwqgwwYkdVbTTqEoR6tJQsnoUabErcJss/b6RygxQacYd
         fvUrrKzNiFXaoeyQ5GW8ej6R3oAXnhlt3UkCa2TlDsfkxNTgAFBEEIV93AJpKM8HyIGf
         n6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725968814; x=1726573614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=;
        b=jBAf1zwJW9NzDYyD2m/xja4nVYIIsUC+Mg5T65caphUm8SnN0I80JdTrUq1rYir/WS
         hnDdO1tj/4/Y4hHTOCIzavbfJumAGztIMQtXz4WeiZqZpo1qzzpv1wbYMYFy+NZha5I+
         M3FYdJWiGlWvoIc1joUfONlliDFBkrfUdcm8jdR3kUz+T9r64FVP0yknDE+iQNZA01K3
         O/HoPal9ztFGVFXFAkxXBGXfIooAX6m6a5fndRRRCpvqGwgRcSK1kawmzL4m8ZRp6PkI
         XIsHyLBIlH+Mb13k7Nng9GpBfFF/P9SpkmsVi49oDw2AgGWQ47VjTgHhwRpYnraIK2/c
         De0Q==
X-Gm-Message-State: AOJu0YwLXq1tKXK3AgGXcaZolh6rI5DXEMiFrc7leTWQrJ5ODDhu4RYp
	0ZnQnP/fEQNYnS+cuECpHPJT/BLoZwMeSprAH3wr20pR5EupRg6hHbKVA8VjtLlQCQcgyZmk+MD
	R03g3WrJZZLPhKaw05tvJhS4kRLrIRA6WHA1zzj0DDiLUwM+b6/c=
X-Google-Smtp-Source: AGHT+IFWMlF1n0oib92jKUMP9migRt2KT8rXo9OZgHZh3G/xI2ifvrcMjWGowcMeFpb/4QlwzzC/qdpkQMcerpb58U0=
X-Received: by 2002:a05:6300:4043:b0:1cc:de9b:1ca with SMTP id
 adf61e73a8af0-1cf5e11fcd8mr724101637.30.1725968813821; Tue, 10 Sep 2024
 04:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <3772134.MHq7AAxBmi@ripper> <87h6ang8v3.fsf@kernel.org> <2248097.72vocr9iq0@ripper>
In-Reply-To: <2248097.72vocr9iq0@ripper>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Sep 2024 13:46:42 +0200
Message-ID: <CA+HBbNEOSMFWiRYxQwaH2DMEYuvccCG+Prt3R7dE2acfqpYJZA@mail.gmail.com>
Subject: Re: New staging repos for ath1*k firmware
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath10k <ath10k@lists.infradead.org>, ath12k <ath12k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_044656_026018_EAE992DD 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, Sep 10, 2024 at 1:39=E2=80=AFPM Sven Eckelmann <sven@narfation.org>=
 wrote:
>
> On Tuesday, 10 September 2024 11:23:44 CEST Kalle Valo wrote:
> > As there are so many different branches I have lost track, do you have =
a
> > list of missing firmware updates? We could try to push for updates on
> > our own end as well.
>
> Afaik, ath10k is missing various security updates - but I don't know the
> firmware version which has these security updates.
>
> ath11k is missing the 2.9.0.1 release - which seems to be still required =
to
> get various APs working correctly (without a crash). Maybe Robert Marko h=
as
> the newest firmware version (not the file - the version) somewhere.

Hi Sven,
I have actually found WLAN.HK.2.12-01368-QCAHKSWPL_SILICONZ-1 v1 ath11k FW =
for
IPQ8074, IPQ6018 and QCN9074 online and after looking into it, that is
actually the latest version
from QSDK 12.5.

Multiple people have contacted me since the FW spread our various
communities stating that
they have tested it out on IPQ6018 and unlike the current public FW
versions we have available
and use in OpenWrt it works stable.

So, it would help to see the new FW for IPQ6018 especially as it is
quite unstable with the current
public FW that we have to use in OpenWrt.

Regards,
Robert
>
> Afaik, there are even newer ath11k versions - for example for IPQ9574 (wh=
ich
> is completely missing at the moment in the repositories).
>
> For the completely missing ones, I've submitted following list to QCA:
>
> * ath11k/IPQ5018_QCN6122 (that might be rather complicated due to the way=
 how
>   QCA designed this)
> * ath11k/IPQ5018_QCN6122_QCN6122 (that might be rather complicated due to=
 the
>   way how QCA designed this)
> * ath11k/IPQ9574
> * ath12k/IPQ5322
> * ath12k/IPQ5322_QCN6432_QCN6432 (sounds a little bit like the QCN6122
>   situation)
> * ath12k/QCN9274
>
> Kind regards,
>         Sven



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

