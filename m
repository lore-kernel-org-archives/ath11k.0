Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155CED148A0
	for <ath11k@archiver.kernel.org>; Thu,  8 Jan 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slLn6K+KnTPN5Uck4oM5JY9fSY7YWNgrkn0AkTxdWS4=; b=nvAijd9LWATVAesN2gkUn8JkjW
	PSnMMwmtMHziWcJmZdcGiiCOFM3S7iWdeyTg/7T+A60lZc8/htQSTrlqAS3RlIYU3Bdp2+Rx2dwTK
	IUJCct0TBRMZYf6lRrKdglilVUDTjFQ6FZEAgusyfsdVTVgV8qnhAt+ca7UM11WfAPlw70W6JKl80
	buvTJNckKiHGlcg7zVJqw61iyQ7MOBF7/Z6YgeRUkeoJwdtmvxNi2RtziuONEUElzN5ZJ/I9H16Jt
	t5wn32jvchL1WrD3zWYLzagRbDyui3GgR7KY+GB3/ocrKAaPdiqebtoGRrKGnuCsuseWqRlErAT/K
	V1HOtSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdifF-0000000FxR7-1fnp;
	Thu, 08 Jan 2026 05:34:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdifD-0000000FxQm-0FBR
	for ath11k@lists.infradead.org;
	Thu, 08 Jan 2026 05:34:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6081x6Vg126164
	for <ath11k@lists.infradead.org>; Thu, 8 Jan 2026 05:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slLn6K+KnTPN5Uck4oM5JY9fSY7YWNgrkn0AkTxdWS4=; b=MPZ5lWCGXRjgU9op
	qBGFTCYw2j7wDtZP5dcyi4NQmZwuWbeK6SQjCgUzcqodUqmH7pE57vSmlTwWB0LH
	rrgAlGuJICBO7euoCaCS+aLnQuQxF2oIMmQmqnK2suzPrRd8Uopv8IVxVK7Rn4de
	euuvv9cGHTMWAVzqaJ6hv3qrC4UgGvXdpNMyw5jZffUiKgxR0DZVZMiEFV+97FuE
	5mKynC+FHyl09cU8zbPfRBP30RyH4NkQb3iEsKdAqwY5KErOJnrRJkj8X+m9yGvV
	+Fhuu+DrqEdi/qf3Q0itL/VxBc1UnlupodFFW3hj55AquuwYHA0ZPQHwvJt0kb/S
	wq5ecA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d68jdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 05:34:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so5018428b3a.0
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767850464; x=1768455264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slLn6K+KnTPN5Uck4oM5JY9fSY7YWNgrkn0AkTxdWS4=;
        b=ObmugG84ba+JEVZ9ngqvisl90DpG3w7q664URtFYLGXNG/V5W+hV1NtzGQNI38mwBo
         +hEbB/Sejw6QzTSKz83GE/4C/DIqcmX8nqM/6prI1knTJtvfeBm7b5gFpYmaALz0EctE
         xtjjeea2KCK/ygjhL2vbQSe4Q6GRtWR/wLFrDOpsFsuP4bh6PMwlRPv1Ezjsd9jp23Og
         1sgNlHG7UsMrIkaE8x29gK0oMDTRKmkzVOjUDtQFsYxOGc6rBjQyEwrg/4K3bdXtGfvZ
         LxjaUrcZDkMHCnXcfQ2FhfnOzM7IOFPU4jfs44mg/sibOS+C6d1IX7epNWZRMHySmqSi
         kHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767850464; x=1768455264;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slLn6K+KnTPN5Uck4oM5JY9fSY7YWNgrkn0AkTxdWS4=;
        b=K++fflGskLHNM3HEMTd/owjSoAHjWeHT07w4XTw51t7EsA3EeaIAixPqV9cVHitCFM
         0TbR+DuFGm9webHZ75Q28LONUXMS6wvI0R0/6YpZo1naRZv88FXjXiZGbHUZSQBJOO7A
         c5sOvJfZkH55S7D5gKiQW2fNTJTeg/xxXUVHX4l0sKmgMeuI05ijwx4mENCYt9T8KPwo
         uzN5Mkvu8zbSE2/csATmxrIBv/hDVl1/sVVFT2EDCYhG8lUeIqiwTACKWwC43WNkLDzy
         i7DGtYTIoeo04FKEoePfwm7MFcqO9xGN7cyZEvjCKHZYM4eoIjAIAoGqfyGmOGi4cjAx
         MAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWWRlUWta3Fl7Tmq3j0MCDOH/BxH3SSClL5SJ4uAZruYUh18ZIHOJe5QThYRU9ChYw8sDPiTYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHZ8XxepqFwL/OVzzeDDfFVq+JXsEa1rCxnCdppDwxslFyYJJN
	i5vQYGRz7pBqblrLxxEDg8SZ+R4sT0AjsMURRIZUOlEZmx3uYD6WzV1Cnu5EiEOq/Dn7E2NU7G+
	eri389rC4BnJWE9H9m9vW291lIU9EmC8YG8lQb9SDfGd0dEwf0Advy0WaURzRg6Ho
X-Gm-Gg: AY/fxX6M92JJQbHysCiQE8uWiesZsRc5unXzO2bELPuG4my0WeD+bvEfCDMaVY6e0va
	dBHEJngh6kxflNuVdgBoemH4BPeZSSGB+TrtN0MeT/kDj25HiVYCGWqBntYyZCPno4KrhUsj7GN
	Ikj/hR2bipFbBBqmZvSzq1k2UQxlsOnzWvYerovWS4eO/agN0g5jTP0aQgLqRJk2Tm7iOon60l1
	9XarGek4wNN6KLwQ1WBwQiignmrJDzJTAfw5SRZX5o09siaaoZOkCJbXMvoUhuc5gRJGt2jz2I/
	M0mT7kBDkDMiXlJ7EuFH/esKxYQaBhABQ0HFy5d9DFV+XoWAj8iYaYbO4ac5iZwldL02pAhlttn
	R1/2kZgg+32iPBZvcKc8igvB3kIb2U8+wG+zgB1WZljWAbIs7aUyv3xMae/sftH4VAHR2Vk5FOL
	OWk4PbhTY=
X-Received: by 2002:a05:6a00:428e:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81b7d260595mr4207059b3a.2.1767850464291;
        Wed, 07 Jan 2026 21:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvjKoMC4OVaPaZGA0PL5yN0sag4muDj4ni/96sAYrVTUGqph6n4D71VQxoz3vXbranFXLKMg==
X-Received: by 2002:a05:6a00:428e:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81b7d260595mr4207030b3a.2.1767850463794;
        Wed, 07 Jan 2026 21:34:23 -0800 (PST)
Received: from [10.133.33.194] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8e10sm6428184b3a.44.2026.01.07.21.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 21:34:23 -0800 (PST)
Message-ID: <5b264207-de1e-4f76-a0f9-6b4d0d6f68f2@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:34:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath11k: Fix failure to connect to a 6
 GHz AP
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260108034607.812885-1-qian.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260108034607.812885-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cQ69cHYmKU7J1SWy_5RkXuLcr3f5CHUD
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695f41e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PKyBAWt5R5Rl1cvDm-IA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMyBTYWx0ZWRfX9u8kgFVv+EfO
 LGISi5jDnOxIDaI52NR+qcrp5PdyrWAEZZSPt49401+6WuBnFa0dqS+tYhDehU4yEzxINNQffhi
 bBjH+dYXVxHaGLhSMtzSonkqDc+AKGTp8k6DlzJOZUEFzTvwnjuneC+NBmNz3LtBvmuImrudDB0
 sjsl2cxZ0Ix9BwILUievmA/I8/YuTKkTHHL0245w9ybirWLsl3ZyrXhGNxXb1usqj+tMU14LXRO
 HY9Hbx6A91K42X1z6EshGbmZ/NRo0Msx+KRCEngEyrn8fQ+Du+ZEcD7KO7OMEKcZP2GIpp5QvIR
 PQUR0sVc3sYmymhIjwe/6zj8sqv9mMQ+nC4CMpSYPjQpe1Mt+82WifSZbeiMU/Mb6JRXrWmbGyS
 aLAJD0LXYkrj0rK3etP9ImgjWYHAzXjI7qNOVsXan0iaQ8U12uI5sjwnNV2PS8M7TNYE3V8NpJn
 ZkaoQVdvP2BOXzbrZzA==
X-Proofpoint-ORIG-GUID: cQ69cHYmKU7J1SWy_5RkXuLcr3f5CHUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_213427_230105_51D9581A 
X-CRM114-Status: GOOD (  20.61  )
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



On 1/8/2026 11:46 AM, Qian Zhang wrote:
> STA fails to connect to a 6 GHz AP with the following errors:
>  ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
>  wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)
> 
> ath11k_reg_handle_chan_list() treats the update as redundant and
> returns -EINVAL. That causes the connection attempt to fail.
> 
> Avoid unnecessary validation during association. Apply the regulatory
> redundant check only when the power type is IEEE80211_REG_UNSET_AP,
> which only occurs during core initialization.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - only return in IEEE80211_REG_UNSET_AP cases
> ---
>  drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
> index d62a2014315a..49b79648752c 100644
> --- a/drivers/net/wireless/ath/ath11k/reg.c
> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  #include <linux/rtnetlink.h>
>  
> @@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
>  	 */
>  	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
>  	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
> -		    (char *)reg_info->alpha2, 2))
> -		goto retfail;
> +		    (char *)reg_info->alpha2, 2) &&
> +	    power_type == IEEE80211_REG_UNSET_AP) {
> +		ath11k_reg_reset_info(reg_info);
> +		return 0;
> +	}
>  
>  	/* Intersect new rules with default regd if a new country setting was
>  	 * requested, i.e a default regd was already set during initialization
> 
> base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


