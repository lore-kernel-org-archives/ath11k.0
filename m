Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2514FC4345F
	for <ath11k@archiver.kernel.org>; Fri, 12 Apr 2024 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRhxtl0wttxPAELEpzn5FbA0uT6tMNbWqPbBtzgT++s=; b=ol+j+TQLeHi9PNC+4WikyyjTab
	lK7xUHyuhvVFX8jT4T8t/2fhFO4gp+9+6I87IHYNhiLYmjKt0Qn9HqZMosvk7EIa2jlfzM6HlzuVs
	b1ipg1LZdV0c5jM8rmOPvmhO06F3TWk7z5qpF/vrC3mRkZ3rxwglgKThKDqwB1BEukR4lmCexcppd
	ExhHQ5E+1kpHTE2oQ7luS/ezKDATDfrwEtXFR2aRCBaG45zbQuDd74/RO10K87IbTZGU1zIRHb3yB
	fYO1KliivjaQZYEDMa21GpuKJdqRftW83C4XftjIli5Wro2l7L8llImjs4JsheyVyUYNfub/RXQ5e
	BVgalk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNP1-00000001BSi-2JdB;
	Fri, 12 Apr 2024 20:21:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNOv-00000001BOV-0GEt
	for ath11k@lists.infradead.org;
	Fri, 12 Apr 2024 20:21:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2a2f82ded89so799704a91.1
        for <ath11k@lists.infradead.org>; Fri, 12 Apr 2024 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712953291; x=1713558091; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xRhxtl0wttxPAELEpzn5FbA0uT6tMNbWqPbBtzgT++s=;
        b=iVU47cxoY88Chye68/X6bsq1K7Fegv8YwawhDjGQvfssEUmIh0wPM042OaxlbnEFrI
         rT64eY3kfLV5o4OM/rlD5tB7FDqdBiSZ4r+KP/eOy4dzd6hl+t4VtYZZJgbpdOOwI8lp
         l9X6DtRMZcnbygg6Bqbq1ns7mtXcqx01FmGkgXhbPZ5AR9bvtDMGY7PCc92yQD//jtix
         3ih9TTretyySGZwJtMITZUFT6f2SvfsL1QcJuPa3pR07ymx8j88HlYO0+uFFHsvm34BB
         nLMPddVa+pcpKqGhJLlfEUSE21KzqLM7t7piREthCp3KI21Kuwh2VvhkYmGfGs2jKIGV
         fCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712953291; x=1713558091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRhxtl0wttxPAELEpzn5FbA0uT6tMNbWqPbBtzgT++s=;
        b=okAx2C8Ib5fo1p+/luUDUUTefqAWqW9MmzJ3X0ZuBCOM+pErrNI9ETX8OlpTray1DQ
         uNzQmy5Wt6PbfZFT647+taFONJ7cEi6UZfuIHSuGiyMj5yvo71GordKde4ZfqEhReAC+
         vp3CTVvr5rfqBDtK2wn7KM4Qewke2P9VZOQCym4iezidJxAC0ifhSWYTL+vFTn+FXGkG
         E0mhII+fFqXvU5J8KDQT9WG/uk5yt1AGhhrSKIM86IACimX5W2G5DP+2/7VMs4F2CGed
         jli8kuDtWgAKwpzwt9U6UpN27KNmBkKzMMbg0IVTtg0Zn+tkKC2bs+LBqQfRpyjgOMBf
         UKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa4RBjIByRoH/zSrNws61Ly0WwTqpEdUovtpDPs3pOdSVvcc8adp1WGukdyd/8eCXFi0+FRy5PeBgwsqB0hzAqpgWZKVbYWsoqjw==
X-Gm-Message-State: AOJu0Yw3cJzoa1bjyDcG9AlYZ4sveoqdzco9MpQxPuQhkp3VNbdoYgc7
	KemD8WiE/KWTSAT9lZV8sGbPJ/AFZfTILo/Xl6DpOX2MKjdjx3eD3kgpSdEQWpejGeDmi6rhfqZ
	CvxvfRbBeFE68uoggNRuc6RqITTM=
X-Google-Smtp-Source: AGHT+IG7KN6iabo0XlVcK5USdt9XWkJn5cfypcOd3GkkkkUO155mnzCkwslkc6n9NeCzDgFyg6ui/1cj7xcnMb2xXCA=
X-Received: by 2002:a17:90b:3a86:b0:2a6:f977:39e0 with SMTP id
 om6-20020a17090b3a8600b002a6f97739e0mr2640378pjb.3.1712953291083; Fri, 12 Apr
 2024 13:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240412162510.29483-1-robimarko@gmail.com> <20240412162510.29483-2-robimarko@gmail.com>
 <4a1e0cb6-c319-4eb1-9bd1-5ff13eabfe1b@isd.uni-stuttgart.de>
In-Reply-To: <4a1e0cb6-c319-4eb1-9bd1-5ff13eabfe1b@isd.uni-stuttgart.de>
From: Robert Marko <robimarko@gmail.com>
Date: Fri, 12 Apr 2024 22:21:19 +0200
Message-ID: <CAOX2RU60K0JqeNWD5go4nM8aDnZmHQzF-Zx89MetqGxK4ySb2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: support DT ieee80211-freq-limit
 property to limit channels
To: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_132133_178453_07C34B97 
X-CRM114-Status: GOOD (  15.65  )
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

On Fri, 12 Apr 2024 at 21:52, Christian Lamparter
<christian.lamparter@isd.uni-stuttgart.de> wrote:
>
> On 4/12/24 6:24 PM, Robert Marko wrote:
> > The common DT property can be used to limit the available channels
> > but ath11k has to manually call wiphy_read_of_freq_limits().
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> I've seen this before.
>
> https://patchwork.kernel.org/project/linux-wireless/patch/ed266944c721de8dbf0fe35f387a3a71b2c84037.1686486468.git.chunkeey@gmail.com/
>
> (dt-binding too. it has/had an ack)
> https://patchwork.kernel.org/project/linux-wireless/patch/fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com/
>
> sooo.... this is awkward.

Definitively,
I completely missed your patch set and we needed this in OpenWrt.

You were, first so your patch set should be applied.

Regards,
Robert



>
> > ---
> >   drivers/net/wireless/ath/ath11k/mac.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> > index c32be587000d..59bde128d351 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -10124,6 +10124,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
> >       if (ret)
> >               goto err;
> >
> > +     wiphy_read_of_freq_limits(ar->hw->wiphy);
> >       ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
> >       ath11k_mac_setup_he_cap(ar, cap);
> >
>

