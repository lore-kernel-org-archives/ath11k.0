Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B0DCFA74F
	for <ath11k@archiver.kernel.org>; Fri, 21 Nov 2025 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8TTlrk9jhEkZ2BRRQwFZvRKVNTvpyz9ieTO4ovRvVQ=; b=U6M7rzFPGoHY8zuplhO+9QfDpa
	+4Gd/GnnK4ipdunMy+yx4L9+FhEMtla0wn+NzNDqMjdbtcV2744VH4nDzv4SuUtHZt3VXBfNvB6rf
	e6jF1J+k7xmRMkl9NffOu77c7+g+OYNrox3Q7YRkaoW5ACQIXMZWyvBVaYPvH0bjabHI4nQNR9b3I
	cYsnBpzu85gun3dqo+JM35xNjtY6eHaSRjqEtqQ+xfvltFQ7tqTLwRRHqED51OVlQy6U4SOOCDG4u
	TAb1oWzWIVhA8Gr4g10/S4H44jgVfwQOK7IgYIVXEoxPTu86uJjTa5sAdpNGUjHz22EiKlMP2FUqr
	HP9RPisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMia-000000085YP-06FP;
	Fri, 21 Nov 2025 08:42:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMiX-000000085Xw-2Si2
	for ath11k@lists.infradead.org;
	Fri, 21 Nov 2025 08:42:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-34101107cc8so1551172a91.0
        for <ath11k@lists.infradead.org>; Fri, 21 Nov 2025 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714528; x=1764319328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8TTlrk9jhEkZ2BRRQwFZvRKVNTvpyz9ieTO4ovRvVQ=;
        b=W8f9TdyKHd3PlOzFxPatBnKaazOu2u+rZa32/yW64cdhz96tIuz/TBD6dmMm6pLqnn
         F6DX7eiahnOYwrGPUPgIigFPe69jWpavVt/6I6quov0Dfnqlqi1/vuENm95m0ktg9aLS
         btKj+71D5FjZ7Rv55QO7gBUrxtglmmFWLoV6TPCYmZTkff09Nv+3csRQzzm4A4I10UU1
         nn5/yJI6oHYfefVx+pI0QOk4RTbmoWD4hMtRCRR0fZYXiCXsxW56UsQ6h8TzTuz5M62t
         bfBoExjOwOKpiXSX9ASpHoMpLMndsixyrW+NyStz1RdRE+kqVzZ6CqrJoYuBCYc4IKWe
         vXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714528; x=1764319328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8TTlrk9jhEkZ2BRRQwFZvRKVNTvpyz9ieTO4ovRvVQ=;
        b=eUN04epFvjfEit/iTMxv9kcOVTlViriw+gZpqlMUo7EJx17FFgGuaj/KcrSXuI5RJ+
         vTJFGBntGqateEQKRGGQI9CNedZs+PTdvB9WXgA2KxIKEWeijKG+AAdCpNeMhLaeJe8T
         jc6CaWkUdsqbYDicBupDXqhbU1HxcBczR1Yr8+0P8w0FBfM4pFYbkYTRnOuMRowpVjM7
         +4+kGsFMF4o0x/k1y8Y1P/V1y8/MGVr8Fr/wuYQlqYx0oO4IVqm/AIBfV9QrKLRcmArc
         wSe2nYQECluDU+ujbwM8yolAxK3LW51Hnp4aPgRmtj0JAXsEVeckgAV+T+khnyKoKUBm
         DU7w==
X-Gm-Message-State: AOJu0YzAZauhCJIakq/G2ccpuMVUnGJlaMWZxeExcBdl2NBzEUmf/d8y
	nPi4FAUuZAtp/X3vGxVe/FgFwLwdObZPSNHVaJxg3rW2EamI8hWxVEUx7WyqmyK9mbPh/FfPZWT
	7rsJX3jevf0GqXUvPS6nm5ixfaN+TzQ==
X-Gm-Gg: ASbGnctU4OD+flYOZee5OOwM64CkS25GytMROZ9zsHWhlHQwB486vlaF79QVlrTZasR
	VapMUdc3EJVYPNuAxM1cQJOLHUmZpA43mCoNbU1xsFeBLsZH4w9MRBBonB9p8zj0oxXbuBWgmlp
	k+Z/+E8j1W50nrxRuSQc6GVJ0onG8dNQuGKp/WLvt7yDJW5qqFCmTxR1lgYAWWahexWPSjIf4FR
	AT7SI3XJwUkLEncoEkrQ9tHHd69HjcwQvfUHei1k2iVBIOO2lkamg9LQKaceDcILnUcZw==
X-Google-Smtp-Source: AGHT+IGXpwSBg+cnmgfT3mAH/pI9tjvarzlh6U4QCi0C2qg3LizoR8jOqripn70lrYlTiGneCh572FLui3ROUR09I3A=
X-Received: by 2002:a17:90b:5251:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34733e7ad83mr1972483a91.16.1763714528468; Fri, 21 Nov 2025
 00:42:08 -0800 (PST)
MIME-Version: 1.0
References: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
In-Reply-To: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Fri, 21 Nov 2025 09:41:57 +0100
X-Gm-Features: AWmQ_bm1mnDLYgE0TQOEDWcR3npK8zC4Q3Xo_KhVCay49lQ1oXDPp4bWCogJKLI
Message-ID: <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	quic_yuzha@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_004209_627930_7AC0B54B 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 21, 2025 at 6:00=E2=80=AFAM Yu Zhang(Yuriy)
<yu.zhang@oss.qualcomm.com> wrote:
>
> hi,
>
>  From your log/calltrace, I didn=E2=80=99t see any errors related to MU E=
DCA;
> what I saw were related to SMPS. Did you also add changes related to SMPS=
?
>
> Yuriy

Hi Yuriy,

Thanks for your reply. The ath11k driver is version 6.14.12.
Everything works if I remove the mu_edca setting without any other changes.

The problem doesn't occur with the newer IPQ8074 firmware, version 2.12-014=
60,
which hasn't been publicly released.

More details: https://github.com/openwrt/openwrt/issues/20702

Regards,

