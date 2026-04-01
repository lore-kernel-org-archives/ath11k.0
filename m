Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE6010F92EC
	for <ath11k@archiver.kernel.org>; Wed,  1 Apr 2026 02:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzyNb4USxocw8PkrF1IarRRAjVYqOgczXdpojVI5iMI=; b=w6YHzXGXMjhAoWG80qW5O2S6ta
	76jIn0OAlxVS7BkftjakKwRZ+IMjSWIGc7q5xhmPwlKK2A6B6lTzHwn5TZA9z5yyCbs0v5VtyVHmj
	5WHypSLRTfBPUjoKM4qNehb+SBC8x93iR8g/WrkYe4nAGsx2TQiAILnZg3ALACne0wMRAwq2wJouk
	bwhKDao90VnGlTa+n5BE4kIM+b2F6HFgnqnd6arRzmK9G1BbNe7iXT1v0TMou/UvkS7iC3UHNSNfd
	ewGST9pGOF6qJFZmKufmM6D8hjmtrfVfdbhpLFcZiJ4f+78wT0uuvjc5xTr45TrfM2CGhmwgOSYEC
	rkG2B54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7l0U-0000000Doov-3HmT;
	Wed, 01 Apr 2026 02:08:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7l0R-0000000Donm-3gmJ
	for ath11k@lists.infradead.org;
	Wed, 01 Apr 2026 02:08:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63124fKs719334
	for <ath11k@lists.infradead.org>; Wed, 1 Apr 2026 02:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzyNb4USxocw8PkrF1IarRRAjVYqOgczXdpojVI5iMI=; b=SdsaoRXguAprSXDC
	9yqfibThNQiZbFtLpJLvlRbnzUlBoNti8nPp8KytZcH/7sJ6VRyHl9l0Z2dElFnJ
	xvSsBuCX+2UxFhUit/ctzMvqqkmB5hUsFrFuOXqg3K7i+nj7oAbfq6tByucuAB9d
	Xjk4yK1ogIreLKEZ3N3FH7h1MjdM99gMhCjsABL0jMLIzQrYOWSZYTZSu4AvMW4M
	d5/PDb2q9DIXOkfZ4g+HmcHGtsBVhUf1X8ZcGzQSryIvisNvWHRlMyYkVAm1h35H
	m72zq3hj3OfQp71JpQQaMjWtm80v4ZaTL+BWFKLvGsph4yierehzmjWITI0JDrbM
	z40LYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcssn9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 01 Apr 2026 02:08:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so427290a91.1
        for <ath11k@lists.infradead.org>; Tue, 31 Mar 2026 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775009310; x=1775614110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzyNb4USxocw8PkrF1IarRRAjVYqOgczXdpojVI5iMI=;
        b=GpuAyQLCDyygj6sRw8Jzms1QbTAAQtc2yNSwOxHJnXjNxf5vUQu+hyVponZmkiPapj
         bOB1+/q1F/GcKecCCtg9mI8IVwEg4Rjj6PQc1Tl/qC5fQ5/Q0M9VG+zAh9E3F1WrKWTF
         OZAmm9K2YcuqhfziXJu2Ip4dwy+6QREqSQ6q1vgGBw7ZU0YYBy+55ZuMvDXoE7t0xn+r
         WJ4XmqDSHzJYBpA2906+2Lzpza2j2hS4AL9bE8GDTi79nJSbIELAtmj5PIccTTDerXjy
         egkn4pnw2TaOUyLAhJ7cWBdqYP3W4Wkj30wBj/+V7fCUh41JdwEDPp9KPBpcd8oba85z
         5b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009310; x=1775614110;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzyNb4USxocw8PkrF1IarRRAjVYqOgczXdpojVI5iMI=;
        b=qw3FyRVip4/GTjB9g4gdN4HQp3NRKBiyx1F587B3Z1jLwRo4IIy8Qa9UuwMhIelKLW
         mVBETGj0zmy7CIEy/bDfDEgGMmjgM2qvljhu3lOGErG7MIh5tdPLBc0/lZzGv2+cgbqJ
         PIKb2Z2F1ErFmvLbBxd89Kr+nmGAYAVUadm18PY9W1fddHXykUvxdf06OAZAmcGEoOES
         xzOCHTZ6TPN8jpGDVPXOAKfYvF38a0jsidqW8+85LCdByPKirYrvAMtoLIRxs9k8bpVr
         pAs8OdTYvFgb3/3wib6QHnF+6QY7XY8EBaBGt5bszDbbwc3dQVS0/58BV3EtVYrQ425O
         1LjA==
X-Forwarded-Encrypted: i=1; AJvYcCVweaDsb6RIWlDu2WWQswcAdPzkLU2DG1J5+8XyxdOqSHKNLn02AY2XZmtKTLAQJLbcbBjMXXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTBKNe483ihb4alhuFUvU86VqNSWnp7apXrqq6z0gYG8ySRuj
	hMu8w4gofiqNho4Gj66ZuQEHgwxmcaTKDTBTbBHRrnmMDcgo5LqyDPebk5GYplNFMlvso54E4pk
	wtUs2VMEMVEJ8A/vOE0EdfUNVnjnGlxwwVtHlO1JeKgrUnPthDCTnUk7ogRliTCQ1
X-Gm-Gg: ATEYQzxVzjJE2JEkrzjK4Ebm60jb58OYr5Fo0x8M+wErtV51WS2bUwbV36IvcyHWc6I
	uMywnMWc2RZUkuQnBmE8yWdYYUQmQ1zbLB6a9SoXg9O9FJ7AmXLt6BqA/SLYSZHYNfje47kBpEd
	0B+jotbGE+Xvbbm/ycX5mF3nX4FNzuKVb0mRJtVCyrHvFs2s+zzJ35kw2wCMVB+jdR8RxvKcW0U
	LryDZe1dhxCu5a9boOnROj5NZhlg0OF6VHEg6Ymhz4ZeXIXsyXs0GbA+25Wi8S6zUpEkx2O4LRa
	RGC8/9QtGpEgz+TpIXP9Nl2NZP9gS8HhIZOtQMKSCVzt2ur3B2CMuEawC4yZuVSlAn/RLnvEB5N
	uru3Tnk8SGgDYfUO3LK/zIzS9zyHLEhk4xIp90dKp0uQDx0Le/npJwndDcpnbb6BLFb2h3P4GUY
	Z225ioLKNtabjUcRGvKw==
X-Received: by 2002:a17:90b:1845:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-35db8f8ebffmr5487404a91.17.1775009309691;
        Tue, 31 Mar 2026 19:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-35db8f8ebffmr5487375a91.17.1775009309166;
        Tue, 31 Mar 2026 19:08:29 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76b96c684csm1889708a12.0.2026.03.31.19.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 19:08:28 -0700 (PDT)
Message-ID: <082b3d13-6fb1-4041-a187-fddec3b013e4@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:08:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: apply existing PM quirk to ThinkPad P14s
 Gen 5 AMD
To: kfarnung@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAxMyBTYWx0ZWRfX52R+k13cs2fi
 gRquaJTK9n2jYMawreKaj3O+PuiW63szNmIQuZAzSLEdikhazuw6/BG/ZBtj63SVkwghaX5Cg2O
 YRaCLtzq5xmNM6Kl6HnIdwtuITGiy6ylXkF1/nG72jHbFqXhNbHVr78PiYiNZ/F4pP7kcjq4URQ
 jDZggcUe2KJDNgWdEJaTYl17Rk/6Mc9znnLs7CVXbzmTETK4YOmEzoQHkHOrroyvTQCjDwPfRDn
 NDwNFqGiYcdj87BlU9a5jdYnonXjbLOpQd/WeMPTGOttZ2MNfkR/0QNnI1Y9ZwZ+IOGHoXEGC+n
 e51zhaBEj8NO1KChrLGXUrXEbkvY53CQdTf9dCdHimkToFAoBNfkBtBQ/XYtZSYUvauaWTlwEKO
 pzxfNhJzlVNu3kdr1Yx3EsY5Rqp3MnyZ575McQc6z5+/meSQsjrKGwF55+S6C1+nXVRS4C25cT/
 Xt8ur8fMXFnfPxRYfkA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cc7e1e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=8k6WQxmsAAAA:8 a=pGLkceISAAAA:8 a=A18gnXuDaOBEhP_xktQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: YGYvQ-FLrHuKzsapan1AAWHKzQECrKIX
X-Proofpoint-GUID: YGYvQ-FLrHuKzsapan1AAWHKzQECrKIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_190832_050922_27B1D668 
X-CRM114-Status: GOOD (  18.09  )
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



On 3/31/2026 2:32 PM, Kyle Farnung via B4 Relay wrote:
> From: Kyle Farnung <kfarnung@gmail.com>
> 
> Some ThinkPad P14s Gen 5 AMD systems experience suspend/resume
> reliability issues similar to those reported in [1]. These platforms

how similar it is? can you describe the issue in details?

> were not previously included in the ath11k PM quirk table.
> 
> Add DMI matches for product IDs 21ME and 21MF to apply the existing
> ATH11K_PM_WOW override, improving suspend/resume behavior on these
> systems.
> 
> Tested on a ThinkPad P14s Gen 5 AMD (21ME) running 6.19.9.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> [2] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/
> 
> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> ---
> Changes in v2:
> - Fix missing mailing list recipients (linux-wireless, ath11k, linux-kernel)
> - Link to v1: https://lore.kernel.org/r/20260330-p14s-pm-quirk-v1-1-cf2fa39cc2d5@gmail.com
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 3f6f4db5b7ee1aba79fd7526e5d59d068e0f4a2e..21d366224e75904feeae6cb9c93d9ef692d127fe 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1041,6 +1041,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G5 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G5 AMD #2 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> +		},
> +	},
>  	{}
>  };
>  
> 
> ---
> base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
> change-id: 20260330-p14s-pm-quirk-0a51ba19235f
> 
> Best regards,


