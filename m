Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0106ACD4F25
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFa6eDc3LyjJybNG2x9S3fgTiVGx1kxPXQ/ap4VVh7k=; b=TOr3nB3R0s4RcwqRvB4e5Y6Xrc
	EqRCV6hJnVWmcPHLlK2aaUlroGjl88G6vGTuu/gS6NlnZcU6RHFYk0gtTMunReshat3SMmVOS4dPH
	WZXGffysQoo9inkEc16jP2e9cqafs5TKdpkQ7hnwriVe53u7pqM3uBVcszMIr3kd0yGlQnnwEkzIb
	MkmJ3ZHf5ePgrmcwoRdd/4Wh29FJl1sw4bvpj06BLIs4P2dChnGE1xNoocEMyp4mfQb9ZEAMoNRMO
	wGG61wgOVHDkUsh2gTB06+UPdzUXOBf4acsKoJX1fIQNXYCWTt/QGCBL6N+gVKwIP8e4BoCkHeYk4
	4tXvrnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQyM-00000004t4m-1fSj;
	Thu, 14 May 2026 07:59:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQyJ-00000004t44-1Iup
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 07:59:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xZPw1095283
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 07:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFa6eDc3LyjJybNG2x9S3fgTiVGx1kxPXQ/ap4VVh7k=; b=jRuOl4vzX09kzvGi
	gD4fSKuv1iBy9OF1M4dCW6IOEBv2dbyIOwmJFe83jZzPsb06B3TKT4WRkizuWJae
	qO7LOoq/MR9lgDmL0vcUx9LmZlphQvSidJCukZkjQ18D7M9OtSZXGZYr9XD4OS7/
	xK8pO5To2tzPtgi8xBm9Vw2rlVi8ORMgnKvfB/EQiJzXVTcRzw5CnWOQ75cavYOw
	BR6aospV0Qn9MP8WfJqrl0U4rk2hBrntK+dkA9VjaC2aSCqobRlctMKlePP5rpr7
	C9nqkY1vdQd7pJaytfuYBoMkQsv3JmrfpYtoSE+5ArPhE3M2/cKi3FcgCIeRpQPi
	kCm2Xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hgvt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 07:59:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so26793575ad.1
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778745545; x=1779350345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFa6eDc3LyjJybNG2x9S3fgTiVGx1kxPXQ/ap4VVh7k=;
        b=cFgjs+P1lb32BGjECMJXgN2BCvGbF0YeKYVpylwk2tVZCM7sNwW2MFfvV0CA2Fvjp/
         yeQQ/9det7adbQDG4vD1vbZb6A8GJHLyfdC+uDAWdKDFB0yRhi7PgiOocWmfhWjjxI/h
         Gw7oXf2FTVQ7Eg+rM7jakpdLdwxrG0cPn+RD+2eqRvatkbuWP00B9ADIhDqBvh9AWttV
         JN/bEGOaMBS82kkdcScL8q6Q4kWKT8SNyeWWCyktH3Q+h/zQjuPlbtdVPo36xJ+6xdh3
         /SaHeXqcGmwZ50m3WNZ2AqoETqzv7/bciXcjNosrnGI5cZEX9hGxNEYM4tdteKy72Hh7
         yFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745545; x=1779350345;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFa6eDc3LyjJybNG2x9S3fgTiVGx1kxPXQ/ap4VVh7k=;
        b=hYN1gngZK9lGXPItgBurXoOb1v7GOeAWLY9LdX0Z2PFUWckFR6ybVAfg5NFmJ3+PE1
         jcCWO9rLsVNixvr30h5j/2FnF5BNumPPfIVzBmiFw7DXWkDWY9OvPejacMmmfp9rH7Wc
         DeDmfxA5OiwLXn9A31ZcFclOQjx6g5cKSfR7NLD5ePg+l+c4SOEPYD+nHNrIBKBGtBRn
         1EBilAz3BvS0yS4TgkWoFrrwxLZx2nk7RR71/UG8qYTGIq6L2Q9TkRIobBDeqmYuV+7Z
         JAoUm05vNXepqIxXaX7aJAu094G4B6gUHDDeqTXhwR4k3raOraVNxmNxxPeSWlN0TVpl
         /43g==
X-Forwarded-Encrypted: i=1; AFNElJ9XmcHPBNeVypYMGgqYhqwe+3Mub7H20PX7Xc8Ipy8wTbcSXq4WdClcrqvV6gQuLUfup5ftRs0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKzcnfOWvCT5DPKZMb5BmwnpaZQWihKP2jfliCusZo86b95SHB
	QGEUXntWn7XQYmsh21HB7CMI94ORQOCs93CqX8BtXxOygdcTCkD3klQ6NzBgP7IFifJ+Yw2BzpW
	FPdatGSGeqSIH4L9oDOn3JSELf0b5uTMK+XW39GqKxL/m0VDrTa0YLdndvVrNEHtF
X-Gm-Gg: Acq92OGez3/8J8rQ8fy/j0zQ1ojtSA56UxpSg5S50+dGzCeXuGYgdsJiQJO2wKwX6PO
	XJ67TTyO50AhPhRzWkbhhVCcSDPp88YurTSGADY8JVRea6eQ7K/jN2PdLLl81kbIxQ/VFXYrwvx
	1QzfM9nRo+ntr2WdpAs2h8WkAk4NG05qtMLpFyD/Cz88NTqymeAmLdp0g13QID19B6OPQb7H0MC
	Pf30noYH3Vpt0uqB4z50ZjBcg6os7hUo2iw0tdHjXiRgsPVP4eGFZOZV+TjRNrgvEyyUJkB863s
	OhBl0E+M6k4uKoabEh0YsbokjclxhyGXCINUEPf2ytAnGEcMTgydnOiz1a5bFvQ+0/L4JYq8Jz3
	7NO510Bjvh61SDwX30+Pq9Df4j8WVIFkKxS5qEjvOqfqceQUFsDFWD8C/Vqcn6T+Q6r6JKu3pJy
	sQ8J3KZdR1gJK+zJegVoo=
X-Received: by 2002:a17:902:db12:b0:2bd:606d:b349 with SMTP id d9443c01a7336-2bd606db41fmr12542305ad.9.1778745545229;
        Thu, 14 May 2026 00:59:05 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2bd:606d:b349 with SMTP id d9443c01a7336-2bd606db41fmr12541965ad.9.1778745544708;
        Thu, 14 May 2026 00:59:04 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0605ddsm15089135ad.32.2026.05.14.00.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 00:59:04 -0700 (PDT)
Message-ID: <3ff9ed80-fd6c-4923-a1da-777ae8aac346@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: clear shared SRNG pointer state on restart
To: kfarnung@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, santiagorr@riseup.net,
        stable@vger.kernel.org
References: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yvMzokqG92NJ7HEgb8APwtxleOJyX3qh
X-Proofpoint-ORIG-GUID: yvMzokqG92NJ7HEgb8APwtxleOJyX3qh
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a0580ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CbO934nNXDxLm8dFh94A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA3OCBTYWx0ZWRfXzxcsqYXWayNZ
 bu1XqekERntmnV/bqwvMyxlBoiXHLArNlfyU3teZU7iq5JcXWZ1dZH0MrvFxXbg0B0PJaDiIgzs
 IOejh/k8HMW6fMPyJx7rlDB+fhXqwkva1kPkpCljkktpgV7kj1un3I4/3tTUx6k+q5J2Aa3Qefj
 59o/DlGE39yV5v3L17CX7u9IlAPW+XRWGj2U6sYPc5sSTQuJz+ZOijax+NLAv/KfnK44/WvPX3n
 pvqnOXJ8VL7bikEnvKif9KwI0V/Tltf8+cjRHiXgjviFJVtuc8t3dX+GrQsNac231TPIgxjozwt
 FUQfsTFXePz7pLevwkLJSFl9dsytoMQbq6P2qNW1/anKgfaL9j/gIOXxldQziDExW3dzYhhAKfr
 oQ9toEV7Aa7wvoLHwX5GHdDhD4wKsqkVh5EkENqFcWAo0ofWj2QkT4fxwey3iRjD5inY/4o6SDa
 STDyO3MJq7VGFtCxjyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_005907_471410_3843C176 
X-CRM114-Status: UNSURE (   9.25  )
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



On 5/14/2026 12:52 PM, Kyle Farnung via B4 Relay wrote:
> From: Kyle Farnung <kfarnung@gmail.com>
> 
> LMAC rings reuse the shared rdp/wrp pointer buffers without going
> through the normal SRNG hw-init path that zeros non-LMAC ring
> pointers. After restart, ath11k_hal_srng_clear() can therefore hand
> stale hp/tp state from the previous firmware instance back to the new
> one.
> 
> Clear the shared pointer buffers while keeping the allocations in
> place so restart still avoids reallocating SRNG DMA memory, but starts
> with fresh ring-pointer state.
> 
> Fixes: 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


