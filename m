Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7EACF6BE2
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 00:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qA72KT28VgOjg8B7p0XTrqTLPCU/NziYWWjXvjQdh4=; b=Fpm+2z3CMHYUJytZ97vovaPFUu
	uGbLvDrr9gPSZn9dkVuZm99/2ISG7WazYi2l9Axm108ygSqgRR3C1RWaCI3Z5/tVjFJOzyfvUcUiI
	sJmur2j+k8E6ZSCEypXm4ZZiYKiKzrBIPc6iJFtyLGHJDiSPrlAH/P4CTZq2V6Bhd1UNoonAJh8Zd
	mdmqGeFvBa/hUkjk9rWNUxIgGlEpZVFvuxRb2TzlJR302XjDr1o51eDmxDxjtZClLZNcYIyAqzR71
	f6XtgT10KyilYZD5+C2ORs3lN9fF7Z7FF+JphJQEn1sjwrT++TThRTfuUDaw5J3yXiGOroR+qz4fq
	1D/qGKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHea-0000000Dywe-22Kr;
	Wed, 07 Jan 2026 00:44:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHeX-0000000DyvW-1vNH
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 00:43:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606NxGvw1692154
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 00:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qA72KT28VgOjg8B7p0XTrqTLPCU/NziYWWjXvjQdh4=; b=M+Y0523ZTG0BucHj
	TRgOryj+OiLI4ed93m+kANhC+oyyVuKObWkfmcVTNKhcCnhhRy4jqt4f5oz5kf4I
	N90jm3FfUqZ3tZqr2Ne9uf+BayidKrEbLS8grWhq10ddGKzMKKYC/cLqCnw3UlX4
	thX6KjLqeiQTV+83nb2norpfa6kriacaoQOdJBZr6++kcVCej1t48H9qm0j7pzj8
	D1v8QmnV5hgUpAXzV5WjmIUMmxUf0W5ZIQLHnbiU1q6RRUgB8eTysm/vmGUSOnEa
	knWQUVeV13cGaCEg2pENYY/pT9oBEm8ITXbJrLCZc/1idFcCdMO34oOCCOZojksU
	sVSvLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhayhr9md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 00:43:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ac39bd5501so637539eec.0
        for <ath11k@lists.infradead.org>; Tue, 06 Jan 2026 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767746636; x=1768351436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qA72KT28VgOjg8B7p0XTrqTLPCU/NziYWWjXvjQdh4=;
        b=HwPAb3PtCbNk3IcrKIgYKVDvP8T1uEe1srrU+kDdsYQ7YTzsluavgOwM4371R5XxRu
         HiswtQD6b4ETRK01nH1BO8IiO1N/+YaO0ArSug4fXhekK+879AQYdQEahwiKk+Tczr7+
         BV2N2TjRiZ2AHdBgkwOfHTTWUl8pvnRdSKxDBX6bSvKydT0EXefVXQ1kNf8RzvBgoP9A
         ApkSUK0cTW4ptcXzktZKTU1IZcsvZgblm++A2zv5uCUARVg0AQElCCdZitrOW5DwXDsn
         kVAWMVXGbL94eN4LfG8kvuJoQ/TDVUITYETyYs91DAJctS0UHHDPzekxNfH18eNc6aln
         FUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767746636; x=1768351436;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qA72KT28VgOjg8B7p0XTrqTLPCU/NziYWWjXvjQdh4=;
        b=ZmC8xVZjktlWdKM3tx3107Le4TcxSM78PAVwPtrDuGxbojkuj8Uv/Q0gs5wmOIYBQG
         EIunIcr9qVpN2kG+hweeOW6BWlGrtHPfVUaInE0RgtM35hWa2l8H5sAonW18xRK3R7mP
         /ymY6vagQDK8B21ftV05EHUagD2OXZH+SZIjIVtAUWBPB0se9T4zIR/L2QqAgMZXQJnl
         XzEakhnL3m/OtYECFyh3MCw+HTkxR1wOnLmJIiaDqrQ+kAspf/iIduEwmIpArm+MLraL
         LxFju+lSngQ4UkAt1Wm6DK4SAMu0LdQDP3yC3I7AyaeH4dGFzgl1NI2njazLxk41y+7n
         ndtw==
X-Forwarded-Encrypted: i=1; AJvYcCVdtOHO2JfI30Ld3/0RbG+MgL8jaqwvVY/q726UK+/0YtNHeFt7eNCe0kEvoi2+X4WanyqtaWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1SCYIk+4axS5B3xyCuTkSej4u+d05xVD9HcwYJeFt2vsZdphl
	5Dyr9l8Ssy/DLIfgcI2P1rYOODIwYdEwrBR9HefPPs2IqYrBWgPTtS3Cti1OBM4WXKJ49wMc5OT
	Z0PODUFj1ZMiGXA+gYbRSH3N2k1U3G2lBp6CWsSCM8WAPy4rxXvdFnsP3ve6Q1a1a
X-Gm-Gg: AY/fxX6VZ2afJOBxkA6RYj35Tznm44gHM7xZh6cLP9621qHCswGu4TNuR3pHwDYLx98
	gPxDuKAvTPSyo792WddTsidRataU9DSq7n8cT7GUQS72lgdIz3deZIhokaaup+rqQW+w1wV8tti
	MFTL54/CTvCjd2EogjauzfU/RSHQkLyJS32pmXlFw3p3ryqXWERyH6HMdOu4Hyjdx9lJ1HWqrBo
	PFHiOujmAVkVnO8Yhj0iX8M2bsHO0p8CVz1AEGPdWpGTSpxrYcEBRWiBkjnO68MpHPUiuK9Juz/
	X73zE8jIkd+W2Jw87FaV7Y6qA7IjdsVnb8nrzQC+5rkhVTgiC1FuK2EsNqm1xYkbPNa9XdFo9ie
	Lv9ogyFxyM7u2+/ccxSQtsijWcN/4wcuytQiAzgHg8e3vftHG5HecSXkcmO9dnSuz6jsxUSBvdn
	ZO
X-Received: by 2002:a05:7300:f0ce:b0:2b0:4c33:8e41 with SMTP id 5a478bee46e88-2b17d2e398cmr523640eec.20.1767746635941;
        Tue, 06 Jan 2026 16:43:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMCPnwGPhz4Um6DtH+IfffVW8x9Wl02+mlryASKUK8ZLYmKWr12GfGVyDo3rYjyph6+Es55g==
X-Received: by 2002:a05:7300:f0ce:b0:2b0:4c33:8e41 with SMTP id 5a478bee46e88-2b17d2e398cmr523618eec.20.1767746635377;
        Tue, 06 Jan 2026 16:43:55 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d9b1sm6006944eec.18.2026.01.06.16.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 16:43:55 -0800 (PST)
Message-ID: <9ba229f8-917a-4c58-ab63-fd34d2a66a9f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 16:43:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 1/6] wifi: ath11k: Add initialization and
 deinitialization sequence for CFR module
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
        Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
 <20251223092728.1950017-2-qian.zhang@oss.qualcomm.com>
 <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAwNCBTYWx0ZWRfX3AXQN2GwsPBF
 tJeZnDE+8T6NoDQk5qtum35hkTUxwPDOwiEm9arMnQu5VcbHb2D41lYUvDrdfidaUklR7GVRa74
 KxUePfsL5edJbeyz5VcMjbZY+yPVL7iAD16PLmRqhXl42KeBnM/aQ1tsbgCtQgBfG9ps+H1l63p
 sk2BlGnT6vytl5zjxXcr/QiTQRxPM5iXgqseYtv6l8c0WFi4q1JhbRoemsVu6CKjZ6Fv41ApZvo
 ASIs5XMBKm3GBpHg7yltmuLIMom/IUXCYiuWyclN0RShOD5GNA3lFW/sL+9djK8VlFapLQnrSpR
 5bMrbsPV2VC0JL8iSwnPtOGFipDqf3Av1LxAiL0XXgq9cPVkopmanAplV75rfqMfz+Q5DcG9IrK
 pdOVXcy/xLxrZV9QzE46Wu68Z5/mVGqmgQrfslSoPgaVa2AHDN7kDxPUjNbtOwgG8EYqRqWhe4P
 5AjoEpsXXC5lhzDsuaA==
X-Authority-Analysis: v=2.4 cv=VI7QXtPX c=1 sm=1 tr=0 ts=695dac4c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Yn4z64EjlknjKxJ9QlgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ojqgY8MLEIJnXpQDRV9PozPgfeg8jsb8
X-Proofpoint-ORIG-GUID: ojqgY8MLEIJnXpQDRV9PozPgfeg8jsb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_164357_507995_B4107082 
X-CRM114-Status: GOOD (  14.67  )
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

On 12/30/2025 10:06 PM, Arend van Spriel wrote:
> Op 23 december 2025 10:27:46 schreef Qian Zhang <qian.zhang@oss.qualcomm.com>:
> 
>> Channel Frequency Response (CFR) module will be initialized only when
>> the following criteria passes:
>> * Enabled CFR support for the hardware through the hardware param
>>   'cfr_support'
>> * WMI service enabled for the CFR support
>>   'WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT'
> 
> [...]
> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
>> b/drivers/net/wireless/ath/ath11k/core.c
>> index 812686173ac8..6a6bf6316ac9 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -1,7 +1,6 @@
>> // SPDX-License-Identifier: BSD-3-Clause-Clear
>> /*
>>  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
> 
> Hi Qiang Zhang,
> 
> Some explanation on this would have been nice. Doing this in a separate 
> patch would be even better.

Are you just referring to the copyright change?

The guidance from Qualcomm legal changed in 2025, and that was already
discussed in a few places. The best reference is here:

https://lore.kernel.org/linux-wireless/bce51392-d5f1-40a2-ae22-58df01b993e7@oss.qualcomm.com/

Note the guidance is to change copyright when the file changes, so changing
copyright alone would not be an appropriate change.

/jeff

