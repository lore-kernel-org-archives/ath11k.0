Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B4C79F86
	for <ath11k@archiver.kernel.org>; Mon,  5 Jan 2026 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4kCgYZdo+n+b8GKJRaBKlif9iVWatEPxeuMHhHsse0=; b=KoDa0NGC7r4kxtSoaTc0NyPKVe
	aSju0wpKH6gqC7HA/ur6v+S+nq3C53x/MiSsoAW9oA/PVFs9KyOcklSM7Iuq0aFB3x2EtjOHW6+fO
	wbdeZEcZbCRKqsR6jdL/qWGd6ozFd1ClvZepeLD4dG4GFFgUWXZTbSUqPhtGYq4fus/mEMvtU1c54
	7bhEfgFlt8lfrKT+afdWTvtTktgsrV8EVhf2zRRE9sWU0FKNIM00n9I48F3g24bta9sYl0WWC+nYY
	M3FRpp0zvSB4Tfa9nufvb7wTJdf3lCfp8c4C5DN4+XqqLdG5DXHvAdC0mbdYC4ogFPuV6z5lesz5B
	QcTQWB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjQS-0000000BFgp-3sBG;
	Mon, 05 Jan 2026 12:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjQQ-0000000BFg8-091A
	for ath11k@lists.infradead.org;
	Mon, 05 Jan 2026 12:11:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058572l978792
	for <ath11k@lists.infradead.org>; Mon, 5 Jan 2026 12:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4kCgYZdo+n+b8GKJRaBKlif9iVWatEPxeuMHhHsse0=; b=e5yWp8C1XfjyIcZ6
	G2QP/WaJtqwpo9VIC0tmDk08WRl/PX98l6JOzSXkj+FsI42Bz/I0oS3PpziNUrLv
	PGH3G+YJJIXhk0gYVXE7ftPtKzkpEflYby/R2sTFy5V+WmXEMyNF+swez/Ppa5Ec
	yY/7tsRMQ/Jo/shZl2VcrtUQmZbEcZHvi2Gzg3vIF2fCIUO9NaYUcMRNwGBgvta0
	siA/41RX6ZC7oLJMF6I/YHj8BatxacVTYZkuILoATp7GC5nn1u+fmEO6d84AnuQJ
	W5VzJwsvNaFi21IfYT4UlEsM0uvX2GGfafK2m2VwqplB4WOier1cfGECI1/1GbsM
	1e+cZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgpu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 12:11:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso1708143a91.0
        for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615063; x=1768219863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4kCgYZdo+n+b8GKJRaBKlif9iVWatEPxeuMHhHsse0=;
        b=MPbhpcqMaAswNmOU4Kfhm7EatLjFJTulG/tcqSQD7BQoVufnfuGh1Xax+CBBlUs2+w
         kJ1fG5SIiIHbBWAwydLrB4z68Knisje3zkBszhPEnx/UWGyfBXP2Wo5fbeGsLCEcPsOA
         s2gVXglAFckvHrfCKAiWrA4Mh83i8XLUktKjk4U+/DZMxXczGp8mfqh3UP0NnXoMR4cN
         AyP4EYXKO0GagliXoVwlK1HOZhMYM5L0w/W7ikxGhoCqzzy2V05nLT1leauDk6eI5tt/
         GoW3fyYEJXLKbpehsJidpdu0YjFu8rdr3rtAMx3mNQ4XHt9CkLOmdZCo+I6wv9wL+iQf
         K5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615063; x=1768219863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4kCgYZdo+n+b8GKJRaBKlif9iVWatEPxeuMHhHsse0=;
        b=X1VcZerl9QTVv7Jpv/ZtuiLo8VuC5JO8BprsLIT1alyrQZximethLtRiX4oJ0V9B26
         L/JzOGvDi4z6xGsRKMJNHf+z0v3K+8seOybkKEFIy4/uGHHX6cvlCJgk4LgrP1yVRPla
         ZdewTlS37hMna8A4ZxJX1Kt7qJHDjwkG+q/TIyzmWvpAHYZ94d0PrjLi67u9WrzAShAv
         fYyz/dBRJeaHH7Q39b1o8moCYm9pWFTbcmtXLxGIo1c7u5migQmADlBmm1CYSyx7jmkJ
         GWE2ij5Z8MyfVTGCOY47iFzUQlw2bXzRU1LtBcFQM31Wt6YiUfgOltkSYFoX8NVX11Ji
         bSXw==
X-Forwarded-Encrypted: i=1; AJvYcCXRSZjP5GXUeWr9+hbCZ/UcHkYGpu0SWEV1yw8xSZVf+YKFtX5T94pyjcA5ZUhiG9hLlWUZ9a0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3PlrtuhrnUmb+iz7k6dCT/oLjuSmOg3HnPVsXAP4tSXCJShda
	YDltwoRlIkxMup9FaRnRCCrrER/a3XrBjmZSjAw4tiUka1nbzXuSJE5USYG94M69PR4JW8we5F8
	CQZA7hdwJgLkHxY4cNuGG9s3DY52rnmjLyDmBuBzCclI2pYKOM4FN4E9cwdB2jjX077o9iJklY/
	FI1A==
X-Gm-Gg: AY/fxX7j031X3vlB8tPRazSv2Junt9p2QIR2wuEEcbJLLfUjkJPTEqVq/ePcxYqM10g
	p16vLfyoS0/1w8LOdVaIpLUgj2WnYunlOanko3ERgQVx42Vd0xXaQSWlopz3/JZSVnVixMIeqxr
	OgpEPm++hXlB/SO8whPs8Kdq8dWA22SH/RfbbWR+MO+C8XPvumbC+tgIJ9IUBqmra4MUvPPHYV2
	QyEjyIfmWiJ8H5RbQWsS5+xCmTzBEVjzJ9iWL9NNLOC/NhKYcO5z7ufBOkXDElOflaCN5L8in6l
	dnQZo7LhaFr2UIwQ4qq/dd16ouDF3m+sxCdxa3egnnQSDNC4uExsHiKlhRrkeD1FS4Nr4eoLOu5
	UVVEeSAM9KXol9SXpDGMP8nl8hAgOR7RFM0O+7xpQOR4ebSwJoBK5cEvA1sAoZ3Hp
X-Received: by 2002:a17:90b:4a8f:b0:34c:6a13:c3bc with SMTP id 98e67ed59e1d1-34f453c9ee1mr6142906a91.9.1767615063419;
        Mon, 05 Jan 2026 04:11:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWOhRc9bpjbVSWMDyMnxDbgAkS+r/3EhXRK4JEu9ypA7SEU+gyF7A1CwjRzreLb2XVL9h5pA==
X-Received: by 2002:a17:90b:4a8f:b0:34c:6a13:c3bc with SMTP id 98e67ed59e1d1-34f453c9ee1mr6142881a91.9.1767615062839;
        Mon, 05 Jan 2026 04:11:02 -0800 (PST)
Received: from [10.110.80.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f45cc1e37sm3333202a91.4.2026.01.05.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 04:11:02 -0800 (PST)
Message-ID: <fc06e13e-9719-47c8-9423-02e561c7e43c@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 20:10:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 1/6] wifi: ath11k: Add initialization and
 deinitialization sequence for CFR module
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
 <20251223092728.1950017-2-qian.zhang@oss.qualcomm.com>
 <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sfC30heGJ86ATzQwoY3NXe8Rpi7dnYhG
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695baa58 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsjKkKj5qOhYR83dBvEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sfC30heGJ86ATzQwoY3NXe8Rpi7dnYhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNyBTYWx0ZWRfX/56ZO72kkhCv
 9b5XPRQ8KMDmL0Iqd4SKvcuz14ZY7Uxj6YYSrh8Xuu0Ew0vFt64g4Ntvdz2AMLTu+YTo7DivYSa
 LqxlOXYJUeMCVCEoTVIFhcTQUy+37zqIzkYzCnDRUS/4PfCSWsaVxDi92mkwJO03gkky0lHdip0
 VBDznVQiq/2HS/RrZUS1t5tcwZTJClFZAAyxbiN4j/k4z/UV1By/3ny5UpaDEpW6MuVSAZUbGA1
 sq63ier45fBfMwCP5nbYSciAVAuUfJnOmgmLA9CAj1C2XMv+zZgz1KdnEqErAtsWMi1xa3z73ia
 1Wfh/NPLhfFP01KijIJDYD50ckSKb84g3mgEReOdX2arHPy9CP6PvKoCthJanF4AulMUWGT1PSs
 /2ZbPgMna8KtHlTeR0M9+XkmYNgQucPhwugO3K373wJIKwf6RIlV0qX84mD839HNL2pWfdh6+QZ
 6Zzh/VQcBxjcHgLbi2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_041106_196704_C0922394 
X-CRM114-Status: GOOD (  16.53  )
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



On 12/31/2025 2:06 PM, Arend van Spriel wrote:
> Op 23 december 2025 10:27:46 schreef Qian Zhang 
> <qian.zhang@oss.qualcomm.com>:
> 
>> Channel Frequency Response (CFR) module will be initialized only when
>> the following criteria passes:
>> * Enabled CFR support for the hardware through the hardware param
>>   'cfr_support'
>> * WMI service enabled for the CFR support
>>   'WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT'
> 
> [...]
> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/ 
>> wireless/ath/ath11k/core.c
>> index 812686173ac8..6a6bf6316ac9 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -1,7 +1,6 @@
>> // SPDX-License-Identifier: BSD-3-Clause-Clear
>> /*
>>  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
> 
> Hi Qiang Zhang,
> 
> Some explanation on this would have been nice. Doing this in a separate 
> patch would be even better.
> 
> Regards,
> Arend

The CFR-related statistics are reported through a special hardware ring. 
The changes here are for configuring buffers for these rings. Currently, 
255 buffers of size 8200 have been prepared for CFR. For hardware that 
does not support this feature, both the number and size of buffers are 
zero.
Do you think the changes in core.c should be made as a separate patch?

Thanks,
Qian

>>  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>  */
> 
> 


