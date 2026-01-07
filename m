Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22EECF6BE4
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjQk9a6hGDgSnraXJs+oPiFhzINTIm1xQToVCBCY9XQ=; b=r00iTDzgMst33yCTqJ8lHFUp4G
	SHi/vKwc2KG5KtTE+EbnuSEDBWFjaXIJjl6yqxqO9Zvn30xEISAe7LeqghopzXceqDWRRlXP4yDJn
	CSCYqjWOiYtSH7z8MFBQxkr5Ocor4jlp3M2qzkY4DBylTjGHKQ/6+xyyuB17+9ejK2TjlhvaUFRbc
	3bXJQBPCUFA4GDKwAzShQ6UFcGroz/dphOeDfuwiE1mgCM9QKTgfJdH+K7EXA2uMi5edvtxX3vV1H
	+O5HIBYr1mCF56AGXaxUIAEUS1ttHanqtRgAaGQyABbofZMAQug39WWV4JAquhzl30V/l1x6XB57Z
	Nfrpo1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ2U-0000000E3ao-1UPE;
	Wed, 07 Jan 2026 02:12:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ2R-0000000E3aG-3UAa
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 02:12:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GjBoD731565
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 02:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjQk9a6hGDgSnraXJs+oPiFhzINTIm1xQToVCBCY9XQ=; b=cUeUsB9E/e9lUrj0
	5JAPgWGZKqu+ukoQ8L8GViPE8EzRtvkUjq4eLCU/ETpc/xAAjoULrmBfdqrNx+kR
	uetss0Is2mo5NIJpSkNuwI6/AjoHTjyvbun6z4MvlJ8GtE+Il+1AXkUFk9kKBb8n
	VmZdK6xijcXuTrwE7tSD2kAYArGNLd3xrQ6+b85gOrcX4enhEWb8sDuuZElHuy1I
	DK+v2EOkHH6YDfp4kJMP0UVdIJo2lTstVjWXDhbmvpywcqHvSemyqig64rbW5Kpp
	MJp/m1RU0Mhn846K4qFOSohbwB3ZGlVZORZoumixtWtyQBV5NNxI38NKAMDRdaQx
	Pl9YxA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mhdr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 02:12:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11dd10b03c6so1386730c88.0
        for <ath11k@lists.infradead.org>; Tue, 06 Jan 2026 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767751961; x=1768356761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjQk9a6hGDgSnraXJs+oPiFhzINTIm1xQToVCBCY9XQ=;
        b=jMY6Xn8KvmpYcHOLaPNtH9+dfMFP4SSdpAsTpmt+Ry9P7265c3Xi8ygofNcSbp22+6
         3ufivQYwL9kn+gxHngJeePG6TScUmH5wAXuveSsZug2URxWcoCl8By0p7ubkCCbd9dNw
         V+XNGlWopxRoO3xhQxhT653LZhAoRFM/kMqxutMUMANf2s6jOwjjmW8AVcROHJkeMQAW
         +J+N8KbNV4AuX6GJUypUVRiDAaqzFeD37gx5v/+UkKtr5DXzAWu9XjIqPgggCF8uDmpx
         DMnwropN1ABajkAgU7rRW/qLMHe0xm46w9LY9qvZ3skUVS392oEhnYnHGaI71D+YayWa
         DsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767751961; x=1768356761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjQk9a6hGDgSnraXJs+oPiFhzINTIm1xQToVCBCY9XQ=;
        b=azKRceilDxg2V4h/EZA+GLM6zQUPW5+Bpa+p+vQ3HAn+fcKqz7GUuGThNbruuz+MNQ
         PbABcglTlk7ZBa/r7zb+Iw2/U0ECaMN8sVxTlVQ+/6gKsDnryhKs+S3mAb+SNCtLBmnE
         nQxL3NIO4J5+AHzKB4aBf+k6YFhRDMtTh8Ipfb8W8k1JpYWA04xdQnvz1ETJXhzQ2KH0
         b1C6yJRO57wdu1VUU2PvaySWEpoPmLeoPdSoEOxIP6Ue9/5/U/qqkvkPXonfiLJlwxXP
         mHQ15xNDkCcB6Z3oMIxuv9Sr7vihy1nzHQZfOrCcnDWM+KulbD5TGhI6U+XEAfaWGwEY
         CVLA==
X-Forwarded-Encrypted: i=1; AJvYcCWcqXApi0Qu+7MfkfEL1OTc3WQKMZ118Tty9/7m0tFar5BJY3EfoCG4lPMV0ogSuyHsNyWFg+s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl7RK32DRO9AzwBObV8ocXQ3LeOL2t5tAQyrS8Y1AebGPei7D+
	OXBmL4AVDGNur1s5Yvnb3MC+wrHX/z0OEo/qJT/AaTIYCr6W85eGwDasNeJP2gvTCh5vu0CBBaU
	lqAstxUvaAU+s+jlmo8nOWILbxoSnaWk3RpSEyfNyGnHAH3jqE6TBYhW/SUgnQlaP0IS7qizhRr
	jzFw==
X-Gm-Gg: AY/fxX7W8ftKwVaA5tcjIkTPOSo9LXTVSPcNqSPtTtC+evbzGU4+Bxf87F59KbAjHTv
	6bjcoI0oe0GgUmEub3iVuVqJIzdKBP1rMF6NZyK8nnP+hVbcn1O7xfPYTcZ+rd/p04Nxrt4/FhY
	GxgBn5ido0eyGk+rK06XqEEwMvgyqrjKErc843kWpVwjc2VqbOX1lo+Rn/iPjfrSeXc2CIfjUqh
	FmniHfa3hpnvzATpbEh6WqG5/kwdf2kK85EQYwkXgNF17o3WyP+Wpm3J24g2NO6Lbz1pbUbsKBE
	CD8In8B2RtsQyyA27LjoRHQaDVP92d9cu2mWfZBeDsgMdUM3do4FrfCpjEMBtsW5O5gTQCRGmUI
	Cgg1lcXI2+lEeTHJRypWpT3JXaAb3jmdC7rcs6yI2eCI9XfJ+lUpMN3j+36vfxLHku4hXcXIPhG
	QVWSQ=
X-Received: by 2002:a05:7022:1e05:b0:11b:d561:bc16 with SMTP id a92af1059eb24-121f8b2df81mr899396c88.22.1767751960732;
        Tue, 06 Jan 2026 18:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUlBSNnoP2te7zLYClpylaHWKskrNYNVNy6WA0jogH9Tm1+NotbiFTbueoEOGhBlAA414+rg==
X-Received: by 2002:a05:7022:1e05:b0:11b:d561:bc16 with SMTP id a92af1059eb24-121f8b2df81mr899362c88.22.1767751960098;
        Tue, 06 Jan 2026 18:12:40 -0800 (PST)
Received: from [10.91.225.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24a65b9sm6646346c88.17.2026.01.06.18.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 18:12:39 -0800 (PST)
Message-ID: <0c8464d2-b047-459c-a85c-9c7098d6742a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 10:12:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 1/6] wifi: ath11k: Add initialization and
 deinitialization sequence for CFR module
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
 <20251223092728.1950017-2-qian.zhang@oss.qualcomm.com>
 <19b7303bb18.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <9ba229f8-917a-4c58-ab63-fd34d2a66a9f@oss.qualcomm.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <9ba229f8-917a-4c58-ab63-fd34d2a66a9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yy1xbR9wJTYzmn9JpcZ7gFqr_jOW2zYV
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695dc119 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xy3KGXYPQ7ZwAtk6cowA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAxNiBTYWx0ZWRfX5pLFjiOG58A/
 1cvX08ZAWUioMVjGpYoknnfqwuQ8F6INfRaweAV7XpGYqNK43DxepgUyp1lvKTLifJP51NMcnWi
 LFnm8pefaBwSIYhwX0sg0vrJvLm9gO0YljNenjmgMBJr22GBWYkC2MIrOvW+xTaGSQbyoMaMzxv
 peCIp3jYmMJAWNepfy+6kDl1ocv6oOHhEvUb9QPEEKU02j20GmQU0/pT2X+LL6XMFjzDzOSILrR
 TE/GWGlps6mNbu4jgtKd6N66SRewXlDKcVioJ4XfGKsLRXrVudhjLMhEXcvxCcYMazpCT5zTd12
 Z87nnHgqaQszEuKGonKL2wvzKpzDF4FpjF6DS7QDTFSxhErnOrJwczn2+qZFFuBP2oKim+6DfVu
 l3Jp4GMlcHPIu89GJyQa9AJn8ZOx6rJD6mx7zOKC59DcgyLSy5+uCc2WgWC3VM2bKcwNXF1nnvl
 PucqWwvEXH3XCtxmh1A==
X-Proofpoint-ORIG-GUID: yy1xbR9wJTYzmn9JpcZ7gFqr_jOW2zYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181244_000698_13CA0FBC 
X-CRM114-Status: GOOD (  16.92  )
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



On 1/7/2026 8:43 AM, Jeff Johnson wrote:
> On 12/30/2025 10:06 PM, Arend van Spriel wrote:
>> Op 23 december 2025 10:27:46 schreef Qian Zhang <qian.zhang@oss.qualcomm.com>:
>>
>>> Channel Frequency Response (CFR) module will be initialized only when
>>> the following criteria passes:
>>> * Enabled CFR support for the hardware through the hardware param
>>>    'cfr_support'
>>> * WMI service enabled for the CFR support
>>>    'WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT'
>>
>> [...]
>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c
>>> b/drivers/net/wireless/ath/ath11k/core.c
>>> index 812686173ac8..6a6bf6316ac9 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -1,7 +1,6 @@
>>> // SPDX-License-Identifier: BSD-3-Clause-Clear
>>> /*
>>>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights
>>> reserved.
>>
>> Hi Qiang Zhang,
>>
>> Some explanation on this would have been nice. Doing this in a separate
>> patch would be even better.
> 
> Are you just referring to the copyright change?
> 
> The guidance from Qualcomm legal changed in 2025, and that was already
> discussed in a few places. The best reference is here:
> 
> https://lore.kernel.org/linux-wireless/bce51392-d5f1-40a2-ae22-58df01b993e7@oss.qualcomm.com/
> 
> Note the guidance is to change copyright when the file changes, so changing
> copyright alone would not be an appropriate change.
> 
> /jeff
I will fix this.

Thanks,
Qian

