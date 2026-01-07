Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9065CF6BFF
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSeKCIC1dfBCPCn0Crml12FbVFDqZA5Xz8a3HxhOcqw=; b=jYtdgWyVa+EF24v1sSmdJJ0blo
	DuzB9LafHlXBYXMEi/nXTEtM4kC1O+FJIF399g5VKpKBlbjqe4k2OcRe55BATReSb4DG/NrKzYZEU
	5vBup/1jfYC63LGQwneW08O9dq54/wfaEGC7NVR9mVObgV9ul/7vCTtEjWNBsgQyz0115mNTH1t29
	5uFvfT328Ge+RK23a0MUOWW3SjcaAZxxeSRzSv32p+nX14cYGXPalFlj3QVugekYLBBS9t3Qs1PQa
	Pc/9XStD7lvqPPr4sxp7nXWJgHYVRsEvTo9maGs0MSYydkup3alxqUOgKcjHIliqtpF13FO9LG3Bo
	OK3yw/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOwn-0000000EQ2p-1KjL;
	Wed, 07 Jan 2026 08:31:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOwj-0000000EQ0j-2DQL
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 08:31:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6072mibM731740
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 08:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSeKCIC1dfBCPCn0Crml12FbVFDqZA5Xz8a3HxhOcqw=; b=nNVvbTnlDXwwqFtl
	GzddWxU06TGjSfOZ29h84yveaP7jyoeEAYKRNs8B1jvrkZddA8TBM0axEo1gG/o4
	+qhObesZfUdstvhRlIpTz9LNJv7ihsKpbiE3qvHRb5skEpS/YeBh6aXd38F5E7aj
	p+6NX8k/2GckWh6l78ymCL/9dKEC+XwgcAv08RRA/ZUDXX5m/+svQaG6sNHWL8M+
	EPDhrEmIFbylD6tUyEdJ0kgq/6wOekQ8ryNIG9zja56uCsGfSytJUnZ5fZFzysn+
	rOMsxs/UkWl0C3xFzcu3CfDT0nAdaZdMrI8kZcDPyQecc4PH91syM+llm8CJrPbq
	TfvD7g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mjjfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 08:31:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso1838102b3a.2
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 00:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774671; x=1768379471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSeKCIC1dfBCPCn0Crml12FbVFDqZA5Xz8a3HxhOcqw=;
        b=RvbE4maBenKGQ1GXkWtzPR3ipfTWtZoPdk1S/u27txkd7VIw/scpmnu1jVHeNaIwdz
         f1OSBmmLLOPuOavq5MJRtRTXDx0j0XfV4KrozK+j2ZGUZIoC4KQZdWmkZ2Ccljq9uQok
         3eI/nkQFXPJEmMzSpZa0vxwBsP9UoktV0nvctouiaUjqC4uwQy9fehilEeD5XesBjX9T
         Nw1B5x9XsfMArP4aNGDKiidzIhVIp9lQQ63S2d3Nh2sS0ZIZfzRnauP1ah8bnssp19RR
         sIX3FQl3SJL2EbPddG0EtP771Olzw5kF9oE8q4dOB8dKiI8HWHTbRwOhdp0AlKUox18z
         Mhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774671; x=1768379471;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSeKCIC1dfBCPCn0Crml12FbVFDqZA5Xz8a3HxhOcqw=;
        b=YcG/guKTavJwlm0nnIpO3GUmCnCQC+b0vcP5kJDbC5GJ8DKMMNbIx+BRUO3xXCE+5P
         HsGDq3E4sNZCvWfmsO+VHbLpEXYTZM1iY/qivbsI2PR4JKrkJqxE6K4vxVJIFvcyXzzL
         qWNb+mvtEBzVQoqxKCVlOHD611WCGNx23gR3bopV1hZC+SVFODt3gU+6blcgXjXbKU6+
         wCE5CZ2qeR9SxR6oR7W/Zs1h4bJdv0Piqrl9iUT2WZkIX1acv2KEtdQZuxBdPoCe2A5O
         WgqGf9YU90bG7E3JDK+74Nn0+a6iowLn4fSozIH8ywzvXZGSpG507G2Q4vhrnXVCCmlk
         krPw==
X-Forwarded-Encrypted: i=1; AJvYcCU0tOJwitWIyeo4PrIstoZeUkJiJB2qJbVjLuY/iR0s+6pEM0VmI+FmfhsvkdfSN9o66XUrrdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+uQyFOCM0uWgbh+Ar98YAo3bcaiPpqx68Oy7CCZBzhLxaZWPr
	nfjQRLENBR+bGBYAxeTVYVXfKQ9qvSTgHXWNhf7ujgENLBifEJv7wQw2GkJil9pE4SpD3RKR/ih
	NAqvr7YWA3X102aKLrt1Ycz6tF/uCO037kZBXC9uhzyTv9/S1DzDzxnN2frNkoxy7
X-Gm-Gg: AY/fxX7TvhE1hhfglQxduhItzlevRtQR7bu5waUSxfGRnCimN31vyNbSlzBjBXeWgXU
	8KdEFwPWud1yqBy3CfPydog8caYtMHGnBgEvBvMCCDhyumZ9KMvE2Cf9AM/+QodADFnHthkkRJq
	poql8Th8iHfyE65c6hmFnXteVxCNdafYcDPR4ZgagFmqJPWa4heUGat6BvP73YtQVxdYVmMEUAj
	8IlW9FF0NtWFCzvtO+kSThkblACWifX1QLK68BqPPQEBMsIoSUUoI84skYugHxljniNg+TvKbcw
	FP4AY3/xR0N60aChf/B3th+CRt3JGqwgSywYWDLp5WUz/tim7uFtk32qhDgz8QmeS+8hWFT43Sz
	ZlIrJLu1QTMuZtyOQZ/A3oNJe+imU1J65zlVlKeoxWlY47tfFvCq2MpY+Nj+Uw1Th2Rlf+NkmGi
	VPXpgvgg==
X-Received: by 2002:a05:6a00:1c91:b0:7e8:4587:e8bd with SMTP id d2e1a72fcca58-81b80bbbdd5mr1770837b3a.48.1767774671486;
        Wed, 07 Jan 2026 00:31:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY4N6BSrBQ+OqiONbGfTJZuwiccaRXCZ0Fi+EMa5kM1WSMXJdqcfhDPusUIiphUOoc2hdkWg==
X-Received: by 2002:a05:6a00:1c91:b0:7e8:4587:e8bd with SMTP id d2e1a72fcca58-81b80bbbdd5mr1770814b3a.48.1767774670988;
        Wed, 07 Jan 2026 00:31:10 -0800 (PST)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm4207553b3a.20.2026.01.07.00.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 00:31:10 -0800 (PST)
Message-ID: <51010173-0d95-4a21-88a4-fca1ca23d3fe@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:31:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v1] wifi: ath11k: Fix failure to connect to a 6
 GHz AP
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260107060255.29530-1-qian.zhang@oss.qualcomm.com>
 <bac6e271-5bd8-42be-ac20-6873d88c16a3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bac6e271-5bd8-42be-ac20-6873d88c16a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JFi8qMezeMbz_P4M68mMnV-iE855J8Sx
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695e19d0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CtV7lcuTZbQYzJlfzmsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX5jEwDejZ4/ky
 itky9gmzX3iLdyxyYzV3wlkJ8M4za6t1HK0UHY+EBhtQkUpZAc4TrU4PDVl2XWKrDk3SsaG8I/+
 JWpyE7usJ+F+C1bZz+6ghWUWA5kTRJfpG/8AsHBqSoJ+UjQWBzvBA0VOLK6cAPdunUQ0KqL0Eu+
 12jMp6oqtwddVsqfXoV3thPMIKW2YcKNET1IUfHpNZBtKyYSkjhYzOX/8lEbvc9x1cOjiAPco6q
 HKUwdMMhpAtkUkoV2kXMRNo7QcW1BgkSbBSzfn/wVgsJoINoQwQeiw1oFvalzZL8W5+csadtEqi
 k4eL15hij3bBTQePUmDmfy5Y2Oj/8bvupnnARYzm7GtNF16zKHVYujPOVqk/sMUkdcFNbhUgtKS
 k+fX+VIzn2DNgBDxqHuxxFszWVKSF8tuj6q5gr72KuWFk0iaDh0rtdaz3bScByf0otIyWuTtkCK
 sbzMfl2qXpHzNBaBctw==
X-Proofpoint-ORIG-GUID: JFi8qMezeMbz_P4M68mMnV-iE855J8Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_003113_697672_D2CC1D98 
X-CRM114-Status: GOOD (  18.93  )
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



On 1/7/2026 4:23 PM, Baochen Qiang wrote:
> 
> 
> On 1/7/2026 2:02 PM, Qian Zhang wrote:
>> STA fails to connect to a 6 GHz AP with the following errors:
>>  ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
>>  wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)
>>
>> ath11k_reg_handle_chan_list() treats the update as redundant and
>> returns -EINVAL. That causes the connection attempt to fail.
>>
>> Avoid unnecessary validation during association. Apply the regulatory
>> redundant check only when the power type is IEEE80211_REG_UNSET_AP,
>> which only occurs during core initialization.
>>
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>
>> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
>> index d62a2014315a..8786ca3870fc 100644
>> --- a/drivers/net/wireless/ath/ath11k/reg.c
>> +++ b/drivers/net/wireless/ath/ath11k/reg.c
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>>  /*
>>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>   */
>>  #include <linux/rtnetlink.h>
>>  
>> @@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
>>  	 */
>>  	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
>>  	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
>> -		    (char *)reg_info->alpha2, 2))
>> -		goto retfail;
>> +		    (char *)reg_info->alpha2, 2)) {
>> +		if (power_type == IEEE80211_REG_UNSET_AP)
>> +			ath11k_reg_reset_info(reg_info);
>> +		return 0;
>> +	}
>>  
>>  	/* Intersect new rules with default regd if a new country setting was
>>  	 * requested, i.e a default regd was already set during initialization
>>
>> base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Withdraw my above tag as the code has some issues.

We should only return in IEEE80211_REG_UNSET_AP cases. For other types we should go on to
build a new regdomain.

> 


