Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA82C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEcaby+2cdqz8oq9Gf34zrNA0ewNGS7aEwYK99Su2ao=; b=XWQghsQeoJylyH+qzH6NOS/3Es
	Z4eH73tJoPbRxzQkqtjO73Dr854pI4KhFQiSiaNytxHBxWeSdlg05sCwY+Hj93sjvX7DqzqNh/nEH
	7EQDt73+A6hw/unyX+kPEMm4AVPQB++TzwRlI04X7zCBSWJdTbbva/NrerpC4d7cj8EjbKvGTx6/Y
	Ngxj222ml1NLsUsv7fzvjPaWGBHw+qy9KwJW67GKxX5LzFlwHrk8f29TzI0dSeFT4nAQ863qiGeTu
	hcRVtwDeZvTXqE0djSxfdTU3pUa3UMQk1B8ZTwjWMR/e5a833r8Xcj/8GYfsddxrRggTgRb1gnhae
	6a8l8JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jHg-00000005iRm-18qR;
	Tue, 30 Apr 2024 08:56:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jHc-00000005iPt-3TEt
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 08:56:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2a614b0391dso4325782a91.1
        for <ath11k@lists.infradead.org>; Tue, 30 Apr 2024 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714467375; x=1715072175; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEcaby+2cdqz8oq9Gf34zrNA0ewNGS7aEwYK99Su2ao=;
        b=hYptAWbD6PhjZMVRzqOkEfc4SANyNDOnOXM0nZ+Heq+tpEADp1AteHUuNSeyD2n6tY
         Jr8Bbf5z5jG0yxK/stk+HamiK/fONlqQqY5P6UBgb3dQug6jwOOjP8+Lj8zA46dNstbV
         8n1ifL8981iE1eTyS0VqLbK8iOpyMBjKdK51zflu39ZpugZML2P/7GNbVh040PimFqgP
         /JuysSOBYT2ADikPR3wJgRWVFZ/heIZPsB3M9QtDQOqUDxok3lXAaIaJPU7hTO5YtNyO
         OIpnzUcr1ZEIMUAhnM9eQQEoy9Zt4WL8YA2dwVUET+o229gzSoY/YpOMALj+vMUPAHhp
         vTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714467375; x=1715072175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEcaby+2cdqz8oq9Gf34zrNA0ewNGS7aEwYK99Su2ao=;
        b=EK40doLkQhdwunHT4iz1n7FF9+ajjbpWZPw4vzEppg+HvkfKT/9IxThIRpXLbv+yi9
         vfnHpg/2Qs1trqx+C9zsYM0y24Jjr9jqMWLxn0FUfoVrr+DmQuvykVtZi0WezGhHiQFM
         HjcLXS5A09FFQe5qkvG+tT47t8N4o66tUOJk+cYLxedkuTpe8hujNknSPKxdxXMDioMK
         IUW0vhwNrWcPROkWA8AVmHH2aBXkm/puJHenU+UNmxOoyYs2SjIEnX+6yqcQZng287x3
         0AvAt2djt4UokX71YKjPsSKDWc/u1618NA7lBl8OQ5RsZnqx9ZhRTCSggS0GntkQ8jxH
         jpnA==
X-Forwarded-Encrypted: i=1; AJvYcCXaEhPS9mWtalpDyzCVVaqQJagqDEcPQJXqA388fBkAbgeolLJyvyI4mynLGhrwWXpG6usdfwafniGWSeQfeWjGbXDIAzeAfEcPCA==
X-Gm-Message-State: AOJu0YygCSnKosZD+ZIjLh7R4VOwg2K6BMHu7ckciKXG8qMEd/Ctn0sy
	u15Ch+gRUDu2b/JWdiP8SLdea9EXhBiUU72UaRh12hAm3UyrUyP9x3lK1+fVqSYjG7mUrObsnL2
	6/+ae95CkAvEggEbtuctdyU19hmoJMg==
X-Google-Smtp-Source: AGHT+IHFUpTsPEXa9DNpNrN29/4NVYN3ZpNluL2fS1ya2QjnYCZdyE0YNglsX5JvAJSGibWxN8WBj6VqF0uZ1l/87Tg=
X-Received: by 2002:a17:90a:5c82:b0:2ad:4321:5bd3 with SMTP id
 r2-20020a17090a5c8200b002ad43215bd3mr12420644pji.15.1714467374619; Tue, 30
 Apr 2024 01:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org> <4889305.GXAFRqVoOG@bentobox>
 <CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com> <87plu7p77m.fsf@kernel.org>
In-Reply-To: <87plu7p77m.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 30 Apr 2024 10:56:03 +0200
Message-ID: <CAOX2RU4wrz9WE01MuPaPShnK39O08__7k0xzYtdnC-1hTcVrzQ@mail.gmail.com>
Subject: Re: Question to recent Qualcomm CVEs
To: Kalle Valo <kvalo@kernel.org>
Cc: Sven Eckelmann <sven@narfation.org>, Tanjeff Moos <Tanjeff.Moos@westermo.com>, 
	openwrt-devel@lists.openwrt.org, Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_015616_903583_FBBC4BB9 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, 30 Apr 2024 at 10:48, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > On Mon, 29 Apr 2024 at 15:37, Sven Eckelmann <sven@narfation.org> wrote:
> >>
> >> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> >> > It's quite strange that they updated 2.5.0.1 branch first but my
> >> > understanding that there should be updates for the newer 2.7.0.1 branch
> >> > as well (2.7.0.1 branch is also in linux-firmware).
> >>
> >> Yes, I also told them in the support ticket that this is from an older branch
> >> than what is currently shipped in linux-firmware.git. But they told me
> >> that they are working on newer versions (whatever that means) - but they
> >> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then
> >> step-by-step release it for newer firmware branches. It seem like that would be
> >> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP
> >> SoCs.
> >
> > I would like to point out that IPQ6018 doesn't even have anything
> > newer than 2.5.0.1 available publicly.
>
> But I do see WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1 for IPQ6018:
>
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.7.0.1/WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1?ref_type=heads
>
> And that release seems to be also in linux-firmware:
>
> File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
> Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Am I missing something? Or did you mean IPQ5018 which only has a release
> from 2.6.0.1 branch?
>
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ5018/hw1.0?ref_type=heads

Ah yes, sorry for the confusion, I meant to say newer than 2.5.0.1
that actually works.
All of the newer public FW than 2.5.0.1 that we tried in OpenWrt will
just crash, we had the same issue with 2.6 and 2.7 FW on
IPQ8074 and it was fixed in 2.9.0.1 but there is no 2.9.0.1 public for IPQ6018.

Regards,
Robert

>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

