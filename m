Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFDDEE57D3
	for <ath11k@archiver.kernel.org>; Wed, 31 Dec 2025 06:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Date:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxInCXIieNrCVyMMDuEN44qeFuhRjFwOIv9Pud/p0MM=; b=eDmltfylAXROEagyztWWW8X0FD
	GVzm5bJp6arxcKYCkCBqBERLiyrc2UeuuNDSbHdqeHv6yOJn/WWs9zs1HZjDii9M/svui/OWKJIGx
	m/Oays5N6hjQDEUtigN+nK+AQCvI0ozIiKEWnWHOuCk+zCCmXDIZuKNWrFOQDMS8NddBr3WGAspL5
	IcL/jyneyMenHE3NoPnSbQnEG6QWMa3UmQ0+BAk7bTokT+9gpRW6dn/q4rstwHuT1ujHS+15OL9vL
	CRJQTk3GbtLN41zAO8HJxTD+2Fqbzccj1eKTRD5aenMAiu1R2B2zbFxu3pSPAELk3FTK0xFQgWaZc
	R1Ppt5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapLt-00000005inh-00WY;
	Wed, 31 Dec 2025 06:06:33 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapLp-00000005inM-2mmV
	for ath11k@lists.infradead.org;
	Wed, 31 Dec 2025 06:06:31 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so4281713a12.2
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 22:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767161188; x=1767765988;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxInCXIieNrCVyMMDuEN44qeFuhRjFwOIv9Pud/p0MM=;
        b=RjShLgOO31zhhmWMEoLkPRwkXrKwVacGDNAI4CHoKUvC+emKW7gWEeuChm8r7BaEWE
         M4qcr0BFaHitkQ7zHv1zAuJX5rI0pc+/GMtJHXc/OzIQrk7+hgu4GGTFRzcKF/xjfja1
         OSuezqd9OBBHvywkss2hdyUlyF9aTHIsE/8CCpV5xuO36waRPjGNxSaxtDHpTfKRaoUp
         qIEBlG/kRqOXErS7iuAdGgR2jmJN5Z6iPua4uzCNbiX5tC+hOTUHgAeQ8iIKreb7g4Vq
         PffN/rEWFWakCCpMx4s576X5crgyn6Az9og65hYU4zRMHgc16DyCSnXGZtwvxgbCpYoV
         AZnA==
X-Forwarded-Encrypted: i=1; AJvYcCXwEv6OvcfqecVzSzD3ENPpDkkR/ubqB+uFBveqwLGfqXw7MFlIlP/lH47sw//lBq1Oemzxq6Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9S5MNK+Oi3QI1f0eeCfYwx0VFVn+DZJoWc/AcR/+RJSWgQ+md
	Vp3hcU9Pjkm8W2Eol/l0BGeRmXhyIGqmFYrEaMeoz1Se2RPtoJIajnWrcjFlgDaJZMl5cf1qNk6
	SQyH7rLMLzl/ksQJ0LZpNbx1DMH5YDg5zn8yl6mYFcfUCBj4hHt+bmcLPk9IgnEnCOc/+jeqxC2
	ZqR6UC0liQ2B218xXfq43yUfTBcD1rmfu6Aicy09tg0V201arfore2AvTznFqoPj/wx7iqFDDwK
	cobcsHgwGml3ShyffdN0ME=
X-Gm-Gg: AY/fxX4T27OvqRhGV+r6ufdvZpW54M4Sf/3HkjJ7C0+Ak+klr8s8RJSXAnbQ+H1ppnc
	ZkgVxsEBFkEMqzlNcoZhH4sGZO/ZLsxNR/TOSi2Kurm4dygdB0S0KMcoJ41INoCstBsvWMEeZci
	9fFdwWekEk9SG5ozb1TwpIZdEwEKEKWXV7alxEyF9vlJDVkWqLY0ooJmvql6R+ppbkID7yNPtqF
	nFFfmw8FKb14oPlpkha77ZeYViCYh+aEz+IKiRuC4acZNTJbemrBVM5svu4AIyIB9EXmiX9mCoP
	o3VakRPwx3mgHVD6jrkFqb2N4tWIMhLeWw2lCt9Ez2/wWvgDCdysEc6v00lijr4aChZ2vVCQPm7
	cC07ZorGb7UtSTekLLvVQpLFO9yXr6oUwuKXN2sZKbnz4JwMQHofMZmIJtr2+LsWX8iY1mKLDxR
	dy2GKuoti64yQ44ZWvMiPAhtBBMTNwxfPbTgdQtBcKNtnCd4jfct0=
X-Google-Smtp-Source: AGHT+IFr0GLrBpr8g15aaztY+KZ2/swfXo8W0CrGwpgUr1RhjNFNmYYr2JvI6mc+/cMgdYMTxgoooniN74fv
X-Received: by 2002:a05:7022:4185:b0:11a:2ec0:dd02 with SMTP id a92af1059eb24-121722ebc42mr39367314c88.33.1767161187448;
        Tue, 30 Dec 2025 22:06:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-12172439a90sm7035913c88.0.2025.12.30.22.06.26
        for <ath11k@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Dec 2025 22:06:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b73586b1195so601599866b.3
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 22:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767161185; x=1767765985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxInCXIieNrCVyMMDuEN44qeFuhRjFwOIv9Pud/p0MM=;
        b=GzmyKZ7L1kcRWzVvUUtuDHw7AK9EN5xwUVX3edFdl1SLoZJECHMrV5Q4S5yOrTFmgf
         XcNatDaEbz2xvn4/DohkJYEpUBV4lwiNBDg8bvzz/nKMgBF2E3UrbGj226vblYVNYmNL
         f/P5uUsh3Gwe/mJ2z5A037Igx6Cmm9DKTMqlE=
X-Forwarded-Encrypted: i=1; AJvYcCUmu5NThLAxL8uU5kqiJHL/H2sYRrii2GnLKyLsl1h2tn2vfypW+ecaEHyXAdeY2WTO7tnXSFU=@lists.infradead.org
X-Received: by 2002:a17:907:3f12:b0:b83:974d:ddc8 with SMTP id a640c23a62f3a-b83974dea84mr341477966b.25.1767161185279;
        Tue, 30 Dec 2025 22:06:25 -0800 (PST)
X-Received: by 2002:a17:907:3f12:b0:b83:974d:ddc8 with SMTP id a640c23a62f3a-b83974dea84mr341475966b.25.1767161184785;
        Tue, 30 Dec 2025 22:06:24 -0800 (PST)
Received: from [192.168.178.31] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm3931732566b.64.2025.12.30.22.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 22:06:24 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, Yu Zhang <yu.zhang@oss.qualcomm.com>, Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 07:06:24 +0100
Message-ID: <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20251223092728.1950017-2-qian.zhang@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
 <20251223092728.1950017-2-qian.zhang@oss.qualcomm.com>
User-Agent: AquaMail/1.56.0 (build: 105600589)
Subject: Re: [PATCH ath-next v4 1/6] wifi: ath11k: Add initialization and deinitialization sequence for CFR module
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_220630_010175_39EB15C7 
X-CRM114-Status: GOOD (  11.11  )
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

Op 23 december 2025 10:27:46 schreef Qian Zhang <qian.zhang@oss.qualcomm.com>:

> Channel Frequency Response (CFR) module will be initialized only when
> the following criteria passes:
> * Enabled CFR support for the hardware through the hardware param
>   'cfr_support'
> * WMI service enabled for the CFR support
>   'WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT'

[...]

> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
> b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..6a6bf6316ac9 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1,7 +1,6 @@
> // SPDX-License-Identifier: BSD-3-Clause-Clear
> /*
>  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights 
> reserved.

Hi Qiang Zhang,

Some explanation on this would have been nice. Doing this in a separate 
patch would be even better.

Regards,
Arend
>  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>  */



