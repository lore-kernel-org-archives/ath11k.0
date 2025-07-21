Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D68C83F25
	for <ath11k@archiver.kernel.org>; Mon, 21 Jul 2025 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz9e7mclBhH5orfH4FzOHx/oIgFQjvxzhGF7K+F4Uks=; b=NMrdvwjtq1w4fKA9WTXBKY7y3A
	0nnt8/5ZeT5ahKMWTkbHtgfFiBX0euF6pdDf3m7rLMePzRr+sp6+aY8mUXabA+U+yB/ipI6FyXZnv
	3oSUqZcsgmSAlEZpNB3hwPUSOLSDA21caSWMik6uYHM9s/aiElhhuDp293HGpwxPG2Gyfi3t5A9eB
	o7XCZoKCSW7ZmqCBoOaGAf6ixxwDLwJPVD6VLPhP1lj4d+7l9cfnDG7F/pOQdXadz+wE+gbWFcexX
	LFO2y9/Hmjw2qDUJ6VhKG11EQDi3Qbc+cBn/ggCF6vVAFDbEMq6Qho6cNqxpHdw+xJHYu+Q9sSUzE
	E2qakcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyC1-00000000kD1-1dAV;
	Mon, 21 Jul 2025 21:37:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBy-00000000kAv-1cmq
	for ath11k@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGTT9x000919
	for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xz9e7mclBhH5orfH4FzOHx/oIgFQjvxzhGF7K+F4Uks=; b=AKSw07HqCfy4xvUY
	UzFFJrNjfYEG5Oll/OMW5uICGOTmAC5p/grrW6lOf5l8UgIL20ULK+jJFAmNz8yr
	522+IjvYlM5zli87Leg0JCX3jwtm8LPGiQ+5tfXrlpAHxVWqkyVgZ2ao7O5Jfnbc
	EwpJERbfiZsyMaC88UYHt+5XsXJ2fjUc39UcaPaVPcTC9lTuUEl29Wa19Tjjm5zq
	osL8bm2mwsDrUBu66yo54z8B4InSbhEgdzv7vRQEfeTx6RWn9LHeyNiFIgKb+Idk
	F04UCCuxLEiHI/gQQ3+VAtJa36JVU/zxmFm0TrzqHNrhgW3G76vSb3b6/aM4dtnQ
	mSs8og==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044df5e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso4217963b3a.2
        for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 14:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133820; x=1753738620;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz9e7mclBhH5orfH4FzOHx/oIgFQjvxzhGF7K+F4Uks=;
        b=hFZFc0X7/wmPNzImi98qKb/L4HkHz0FunYgAPmUGALSu0OvPNQBFyhXFfxjq4Q/Jq6
         3FFT1+m/Tl5jrYReBBvarOuNmynUcsDuLzrwg1PrJiFm1vYwgRkAkSxldN3wmCYmShOg
         u2tDcJnNpMYfhGDYlmKtRibRqLm3i5LTVH1vL0vjnKsdQzFROHAmHfj4D7qBQfkGE/jC
         oAxpvmgDUL7IaKg6SsZuyY1m56cAaAHZhY/95kFCG8GYkkdyxf9kH7kTAF34ZE34tDrm
         NwaOZlScyK8i4DfWthWimvYsaSSNJ95Kh06ePShuO0/TiOabMUrSn0Xzi+hUCOxe0MTq
         TwlA==
X-Forwarded-Encrypted: i=1; AJvYcCXlh7ZwWyFt2D/FuFlcEsrAzxJXTszydf+1XMjtJEWJ2Nv09NrVxAJPI8pZ49XnaEjtbZ9KWWw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD+LbWQUf33grTrQYbV8PIjvDp+Pd3i2FZZoZgfnC5y0TkhW6y
	cejJwh6SuwBuCOVNS3YS0OKXXgclCqk6d1p7WoVp0vruSU/oQnjtutKXuUzmCRe12zFrb+sCeuu
	LBsFC1UtEpvwqBrcZxfcx14D+pY0SOzCSC+DhCDCQH8LlrWvfbWzFCCuPUzKs7Qkj
X-Gm-Gg: ASbGnctMw+pPpxC62bB8TPj4NQShnPf97dVeHS2R7lW7lnTU225/VBXgW7hqQBXZvXP
	FggA2K67kbAKaweBxeeQPJpElHbNb09FMi5JutWvYL8fRK6h8SkH5EEDgUVBtNaeBKTI5RU8D0b
	BaGmnfoY2KSCt2r3tg+TvX2jZdQN3QogQzdtweR1wTQGkQ0T+EnMXOB7JuXzAtMjT4TbEttgHIk
	FqhtlCTJQstdH057eQ4DTE4mexjRyg1uKaW8CKo5bnJuVEYZtTl+ci4tpnwt0xKKqSUBatsD1Nt
	wuEN4CpvkERNywPvusyYyJKoW6AIGYb2C9AF981mAKOMiyHWWzCwQKH9M5wBjHvFxg6hJrYW5Wd
	m
X-Received: by 2002:a05:6a20:6a1c:b0:21d:1fbf:c71a with SMTP id adf61e73a8af0-23811d5b54emr38208368637.4.1753133819741;
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7+hgdKgVE4EXjVGVzar57QfYjh4Oy05x6E9LQmjF74p8a+b+VC5yfpsbdqrk8pYEzeHsKQw==
X-Received: by 2002:a05:6a20:6a1c:b0:21d:1fbf:c71a with SMTP id adf61e73a8af0-23811d5b54emr38208344637.4.1753133819355;
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68046sm6201934b3a.151.2025.07.21.14.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250720-ath11k-zero-brace-v1-1-6132e2ef1748@oss.qualcomm.com>
References: <20250720-ath11k-zero-brace-v1-1-6132e2ef1748@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: Prefer {} to {0} in
 initializers
Message-Id: <175313381869.971667.17737779436475573060.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 14:36:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687eb2fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=tljXboN4zLINjdsvJowA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: fg8HzF4s_HhDV9H2WKHb8UdPhnDixBes
X-Proofpoint-ORIG-GUID: fg8HzF4s_HhDV9H2WKHb8UdPhnDixBes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MiBTYWx0ZWRfX1bN/F2txgi8f
 fgZ52MJyBT7u1SAjVuNcrmmcX/dSs4I2vuACAUlZH10HS76r06Ht7DJoHqbw5bSXJllpEsqw4lV
 k3wAWEbCFZU0bnXkQylmcgodg1y8iKTBlNjYIrKPxLWdoJJJZ+YXdjTWB2Uz9uTaGU9nm1m81oN
 +zpD5/4Y8h4rJ4VkxSKkLUbE+X0fWf9mLsUxhfM2yzf2sWlEtMUX1SCzeifiTNTl40Mjwx0im92
 KsI8ktul/riH2v94F7ZetN4Yd0bSZMeFrWTOpvdMjPKOcvIW5osj4JstqaWwSJXFwu4+BKmPjJR
 YYO+PxukEf1ayRLKkIlA4qXqJupQnLLT+gU9pC2sgIECMShiwrEOwtzM5mF1zZihF04yVLx8duG
 2vJKPdbmYD2EtjWud063Qiw1nUi9hXh95soCIh4vXf0UiKz1R/tC+tX/jhoXTNWVsrs2gyb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=683 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143702_544254_E812C1EC 
X-CRM114-Status: UNSURE (   9.39  )
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


On Sun, 20 Jul 2025 08:13:38 -0700, Jeff Johnson wrote:
> Prefer {} to {0} in initializers since {} works even when the first
> member is not a scalar.
> 
> Generated using:
> sed -i 's/{[[:space:]]*0[[:space:]]*}/{}/g' drivers/net/wireless/ath/ath11k/*
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Prefer {} to {0} in initializers
      commit: 1228d99fac4c103a1ca6af82ddd27ba2c445d0ca

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


