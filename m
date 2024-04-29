Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4693C4345F
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGHR1ZqZ7A5R5fizi5KKAIncDVLusMnFFqR3cZV+uOU=; b=ZfZ3mOtVYHYPbSWcD4RbZJNkm8
	/oXARNW459WY2aRqD5UuyHP228lwRx5Cif3Vn5c40xG1DTAaUYFh42ifTNT1dyvpH4nw8+2eEbEll
	83XB2T8x0I+/Z/8mc8bn9l+GrinJLeKAPqA/t2Uh1NHgGmxZTunhGbq4NcZNd3BXO6APUkaLO5Ir/
	0DFGuhnAjKWin2c4MWjSuSbQcygv4ICInJfvHTd/zrVuHuQgkAOoU5bDxWz5WeipR1TijeE0AzRKI
	QEyvl/NIqziUbeg10Q3lqKzfy6QPHAGNhW66nHvywBlRrytYEHCNluTzTDpnN2drKGnutXFHx3PPk
	FLofVLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SKw-00000003C9f-1TH3;
	Mon, 29 Apr 2024 14:50:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SKt-00000003C5W-0Z7J
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 14:50:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ac1674d890so4032072a91.3
        for <ath11k@lists.infradead.org>; Mon, 29 Apr 2024 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714402219; x=1715007019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGHR1ZqZ7A5R5fizi5KKAIncDVLusMnFFqR3cZV+uOU=;
        b=Jjbb/XN0TcWSljfylxctp/lgN1Sh4R8g+/OME20WdW8eJIdbXcYVp5qkdQQs9N5Amg
         0IXOK0zSAnOqWxw8Q4hpl5EVRu1TaD95WHHLrfRxd56hoo63zbycahh5TvdWgy70L4G2
         YDVVVAjTbqBhuVPlrGB5j2sLjCQK3jlgs8o8tJUIqPR2n9KpM9yKVEA3q4hA8CmVOLaA
         xIBjFaHp+k+tJRNM5WwxJQTY8eg8L4dkesBet3Hkv8Y2NSRagfxnRMOY8jgkA49G2Ccl
         VVggt0plzC+1NDQSIhsr4mhTgI67DXgUQUgQeh7dDCKslIuIn0TewiEAkNizIEvbSO4u
         nCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402219; x=1715007019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGHR1ZqZ7A5R5fizi5KKAIncDVLusMnFFqR3cZV+uOU=;
        b=n2auuyJxJHm72I+IeAfQYpWfwRKSUvsKMOBVR9VccCkN4LcfFMy5VBL9TbVSXAc9Mg
         bbOketqPVD5cMihJTvllulAl5K9kVWmUT4BOnzwd0DNGgcuQsappRB0NZnDfrnKybQyl
         6niZJCTnKCdK953rnmEeOLyKT9f08V50LAHE08x1iieUkU1vw+pmi4cPIFaeA7Mjmr8i
         YyiEUFZpRxMHIa0bDEXzdC7Y3NdWqVEq7hTPfS2HbGCL8EEvSqjfq1QCiUyyASbzDZ43
         RR2ebOuXFffd5VxiA2hAmbsr8qQ2mIv0MNm5tN3B3G2OSMANZJdr2LwiXpnXDnP5MhCm
         0Fxg==
X-Forwarded-Encrypted: i=1; AJvYcCV41+f5qnUpKo7mIqh7Kby0dkN4GyP+E88QFwfo4hGJT2TV/eWmTvjhea6xg9aeLbKwWJE0NWJpTiuh01mYibSq7P7JeUFyk2LkaA==
X-Gm-Message-State: AOJu0Yzgqeif2NZoSlobxTallruCYK4uvE2/HwWjwpLFZ5vD6/bl9+Mc
	zKQ2Y6j2VBWgMJB2/6Ncg7dG8U3/lniVhl0KtRkd7VRHRzTTWCDHAT/bqoOsCJgm4lwUk4xNYYl
	qXelsm2CwFmUGXjpp9RZEKQfzyDw=
X-Google-Smtp-Source: AGHT+IGuwDBtFQxuAbwwYsSR67fJGrOK1+sDz78kLg4n0NdgNdgMtFOf/FeVCCSud0pCgLJ/oUuaQYCJJWQNTDxxRLM=
X-Received: by 2002:a17:90a:fd83:b0:2a5:12dc:1609 with SMTP id
 cx3-20020a17090afd8300b002a512dc1609mr9826062pjb.39.1714402219159; Mon, 29
 Apr 2024 07:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org> <4889305.GXAFRqVoOG@bentobox>
In-Reply-To: <4889305.GXAFRqVoOG@bentobox>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 29 Apr 2024 16:50:07 +0200
Message-ID: <CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
Subject: Re: Question to recent Qualcomm CVEs
To: Sven Eckelmann <sven@narfation.org>
Cc: Kalle Valo <kvalo@kernel.org>, Tanjeff Moos <Tanjeff.Moos@westermo.com>, 
	openwrt-devel@lists.openwrt.org, Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_075031_204144_7AE9FA31 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, 29 Apr 2024 at 15:37, Sven Eckelmann <sven@narfation.org> wrote:
>
> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> > It's quite strange that they updated 2.5.0.1 branch first but my
> > understanding that there should be updates for the newer 2.7.0.1 branch
> > as well (2.7.0.1 branch is also in linux-firmware).
>
> Yes, I also told them in the support ticket that this is from an older branch
> than what is currently shipped in linux-firmware.git. But they told me
> that they are working on newer versions (whatever that means) - but they
> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then
> step-by-step release it for newer firmware branches. It seem like that would be
> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP
> SoCs.

I would like to point out that IPQ6018 doesn't even have anything
newer than 2.5.0.1 available publicly.

Regards,
Robert
>
> Kind regards,
>         Sven_______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/mailman/listinfo/openwrt-devel

