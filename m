Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96675D2CE17
	for <ath11k@archiver.kernel.org>; Wed, 10 Dec 2025 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R81SShR3jXfqsRcRLDX0LQ8gviUantcdIaci484Nzjg=; b=4BQz3g4VDG8jK/PxK2CC6nzZsp
	KWgJXFcg8YbbL+ldkSKqrS43w5Ee3d9aYVQ/RKIvwUXtlXtFat3tfp3OHkONhGZKk9iooafGZwkjr
	Ug5KqlQHFB3xQF3hywKX9f2OtOM6I7yFwGzYDgwD6H5aNxKI/1G1RaCXk4+5441gTBshP1yMQ2Lv9
	qO5t+P/BTycUhiROmY4Dtf2iqoPX+mwBaRBQpNTLgIXb8Z1iKf7jSDFhlAt6nBVdh6vn54jfei6zz
	NEwvet5ca7BdGVH0BLlRQ6bU2bdvGiAHGEwPwqkUE59RRpyppe89AO++ubEc3uWDIJSS2KuG4Kail
	sr8Oaukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDjy-0000000FAfF-3oYx;
	Wed, 10 Dec 2025 06:31:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDjw-0000000FAdq-2fWA
	for ath11k@lists.infradead.org;
	Wed, 10 Dec 2025 06:31:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DnFP1243520
	for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 06:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R81SShR3jXfqsRcRLDX0LQ8gviUantcdIaci484Nzjg=; b=dQp7t4yBac3cO5KI
	zgQBjeuEZViog2ZZQj24SEG0uFca/eUGEqTY1BAW0GqQdlKm3tRg0VZXbc2cOJDK
	qlc68rU6OZiysPiyWIHaVvBMl40Ql4f2t9q08Vt25uFEGlHpGZx+B7TCJAB3/sJb
	O3LniWI1HtFrLrvYIookV80eIAzHpwkZOdEXCuV0OmAxdKVKGJatijDEbFNoi4Qw
	ikG24YyoeYAXtfxH2wh2S+Sg6/OkMS06ghrjyse3oIKISio3pYQH3x6wGzV0ByI6
	p/ABtfEXQVzoyWmuhh8IoY7mRnnSyq8V9opDxSTlDSIZnepKEMdDShX01SlsSaCh
	vatgVg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vtq92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 06:31:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so11699124b3a.2
        for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 22:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765348315; x=1765953115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R81SShR3jXfqsRcRLDX0LQ8gviUantcdIaci484Nzjg=;
        b=gJkjNOTteqhaU9Nelo3j+Sb41j6eY0oM9jDcsZL4OUYEgfMTPSHfA/7jr9oSrBp/S5
         6/WJVDbF2zpiHOX9RfWoVCMndRBatWe6V6yo/w2A6BNVTNS2XoPWQDFWxFbnj7KqSSXm
         K7s0pvq2DZxN6p/k/njOaH4u5cLIH+22CV0KxSBrQrOx0D+MEZL7eTD4dShwNwRT0Oit
         o9tQZho+Iq00JEqOl6C6hUpY0PukpKZJaQo6H0lvjqpZSx1ssxb6he4Vr1a4UxUNsXVw
         91RuN7AVvZd46AgN/Z5mAW9v2iFj/wOHpLuXzfyrgoC3WgGn9uil0NxTzMOTIv2XFaAJ
         GEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348315; x=1765953115;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R81SShR3jXfqsRcRLDX0LQ8gviUantcdIaci484Nzjg=;
        b=HWk7yF0XxRBxkvqaM5zWzqBlq6URCQzq6/ZEDNBfA+Ta1vwLQZDREBQbk1uCvvGRBd
         S/LUg57ZTSX2IrcC2xj4mhWyq704+/P+PY/EsA3R+Q6bpF2KWifIC4WxiODFBX1h9esS
         lXnaVJQqssRqw9DZ7RCUh13+VUSKVhzX3EFRzrDdMeztIUE5flvorw6YoXKSO3vafeEQ
         +y3COI7DKUOmUfWH3T9arKcmjeIzJchiEXPWecA+3+hcTo2MLnYs4K0KpJloLW2PVlFL
         xhDEHh7R5YiN7GNKaSZb5HL5TPBVMa69GSXzqXJ3g24x0VO0/++mb0T6IXB2bE804EqU
         UsVw==
X-Forwarded-Encrypted: i=1; AJvYcCW2wDOJi0RUxL2Phw3qpFZlodnCr5ta5z+NhYn7G9hK72MKpuJKpYGxfTv1hJjJx2T0B9+issc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrom8rovBLJ6hQUEUzQFwtweIEnE+U2IyQK36HkjIi+WPVq19T
	BCmN7G2kZuKX1LFFtVb160ekywnWquKPTN+uSkUyn2ZcF/LM1gEDp9gy4jhU/K8pizcBFgKWk4x
	8YHspgLpA929xd141gX4rStuY7s7Vpd7+kh6Tca21mcHA6PuE/6SBdQdiYpcNi9eK
X-Gm-Gg: ASbGncv/yXXKOTuCh0ZU7Cxh9Tw4ykLVOeI563pi1TzBT2e8dTtylMXBejRQnP/YPxS
	bvHPnypVTz7tzSRbxw+755Q4fKr9OvqGpk4kYJVY0acKV/alJNctwilGobUaLia5rz+zjNxKwQ6
	9NU9CAZDkT2/4GZY0hE9kdKGZQO0vJGiqITTmxAl7Gyj0667mhgJO7gMQUEiDFN88oXPBE/LAql
	5RTKkqE1xakXma8BkH4DSxsXHmE85x6Z9IsRYaiPwCmryDh1WXA80zDuOmaqYyRYdU8OJV1AWM7
	7s6WLCdQYHgOduADSxA4m33brPzRyHopWW5pD4m+9BfFtJS1QRSUiUAn7SjdMegIjuyXEk8Qoe9
	KnZ+WK/8lKhcK+YRSs2v2kHnmDr8Erb0bDUsmIT50mboKDtsARnhf9h5t3SLlWgoRyi+fqDtJ2F
	aXXp1K1hQ=
X-Received: by 2002:a05:6a00:9511:b0:7f1:55f9:f57 with SMTP id d2e1a72fcca58-7f22f32c2c1mr1207813b3a.63.1765348314904;
        Tue, 09 Dec 2025 22:31:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3/yXO6GBXSpodH23c0XFBuwkqf9dhk1bje/K2U7pvU6NLfGBy1lgv0DQAou4hS7nHqCr3Uw==
X-Received: by 2002:a05:6a00:9511:b0:7f1:55f9:f57 with SMTP id d2e1a72fcca58-7f22f32c2c1mr1207798b3a.63.1765348314335;
        Tue, 09 Dec 2025 22:31:54 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e73079fa24sm14597715b3a.40.2025.12.09.22.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:31:54 -0800 (PST)
Message-ID: <8b1c2229-18d2-4f19-9734-82ea3b6564aa@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:31:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LKuLPkJyDV31gnQhoeQZ29MTMc9f9LE4
X-Proofpoint-ORIG-GUID: LKuLPkJyDV31gnQhoeQZ29MTMc9f9LE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1NSBTYWx0ZWRfX+pKhFXcojH6Q
 gLcg80H49KpKudYbG9J7wDS4C8cW0fpkQuDO47Xt5GcNdxS5bgthohBebr+iZE0/n64QUKrv+8R
 IPpQNYEDsQvnnNdg/dwRlihawiIwiUunoMdKS5JOgalIAd/lQVm+qVvte7Xk2CgD0zhP/gdW5FB
 1NodcQov896s3072Ys7oX0cf1ViM7EvXDlEO86UdK+i1VleWH9bXd7kmV7aXqlvSGmAfF7zB8tp
 bfXpg4KB/Av31eDc6CVpVgBJXUKFPSWODhpc8Wajo34IDjAUiXUQctjYDk9NO8u/SfnJwLhZ1iy
 SlSX34QS5vzsn2TStOJmf/BtjTPWHh0tQafKjNkFX2Of0p0Ne9uxyllLD9MViDJfXiaGEPUml5g
 iOkcPTQZTUqoFzi2J18J6D8zSi784w==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=693913db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=pYbNFJmqQsBMd0G-Mk0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_223156_698294_640897F4 
X-CRM114-Status: GOOD (  28.30  )
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



On 12/10/2025 10:40 AM, Alexandru Gagniuc wrote:
> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> is initialized in, core.c, a different file than the array init. This
> spaghetti-like relation is fragile and not obvious. Accidentally
> setting ".max_tx_ring" too high leads to a hard to track out-of-
> bounds access and memory corruption.
> 
> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> ".tcl2wbm_rbm_map". Use ARRAY_SIZE() instead of #defines to initialize

In addition to moving, you also have a renaming. Please mention this. Or can we use
existing max_tx_ring instead? IMO it is more meaningful than map_len.

> the length field. Remove DP_TCL_NUM_RING_MAX_QCA6390, as it is no
> longer required.
> 
> The intent is to make the code easier to understand rather than fix
> an existing bug.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
> 
> I am trying to make ath11k work on IPQ9574. My device uses a IPQ9570
> with a QCN5024 as the 2.4 GHz wifi.
> 
> I spent a few days tracking a memory corruption bug caused by
> erroneously setting ".max_tx_ring" too high. I think I would not have
> made this mistake if the initializations of .max_tx_ring and
> .tcl2wbm_rbm_map were right next to each other.
> 
> 
>  drivers/net/wireless/ath/ath11k/core.c  | 12 +-----------
>  drivers/net/wireless/ath/ath11k/dp.c    | 12 ++++++------
>  drivers/net/wireless/ath/ath11k/dp.h    |  1 -
>  drivers/net/wireless/ath/ath11k/dp_tx.c |  9 +++++----
>  drivers/net/wireless/ath/ath11k/hw.c    | 17 +++++++++++++++++
>  drivers/net/wireless/ath/ath11k/hw.h    |  3 ++-
>  drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
>  7 files changed, 32 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8a..07199ceecbeb4 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -100,7 +100,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
>  		.credit_flow = false,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX,
>  		.hal_params = &ath11k_hw_hal_params_ipq8074,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = true,
> @@ -184,7 +183,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
>  		.credit_flow = false,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX,
>  		.hal_params = &ath11k_hw_hal_params_ipq8074,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = true,
> @@ -271,7 +269,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hw_hal_params_qca6390,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> @@ -358,7 +355,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = false,
>  		.fix_l1ss = true,
>  		.credit_flow = false,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX,
>  		.hal_params = &ath11k_hw_hal_params_ipq8074,
>  		.supports_dynamic_smps_6ghz = true,
>  		.alloc_cacheable_memory = true,
> @@ -445,7 +441,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hw_hal_params_qca6390,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> @@ -533,7 +528,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hw_hal_params_qca6390,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> @@ -619,7 +613,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX,
>  		.hal_params = &ath11k_hw_hal_params_wcn6750,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> @@ -662,7 +655,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
>  		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
>  		.credit_flow = false,
> -		.max_tx_ring = 1,
>  		.spectral = {
>  			.fft_sz = 2,
>  			.fft_pad_sz = 0,
> @@ -698,7 +690,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = false,
>  		.idle_ps = false,
>  		.supports_suspend = false,
> -		.hal_params = &ath11k_hw_hal_params_ipq8074,
> +		.hal_params = &ath11k_hw_hal_params_ipq5018,
>  		.single_pdev_only = false,
>  		.coldboot_cal_mm = true,
>  		.coldboot_cal_ftm = true,
> @@ -789,7 +781,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hw_hal_params_qca6390,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> @@ -876,7 +867,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_regdb = true,
>  		.fix_l1ss = false,
>  		.credit_flow = true,
> -		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hw_hal_params_qca6390,
>  		.supports_dynamic_smps_6ghz = false,
>  		.alloc_cacheable_memory = false,
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index 56b1a657e0b0f..bd6778d357275 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -344,7 +344,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
>  	if (!ab->hw_params.supports_shadow_regs)
>  		return;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++)
>  		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
>  
>  	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
> @@ -359,7 +359,7 @@ static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
>  	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
>  	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
>  	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
>  		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
>  	}
> @@ -400,7 +400,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
>  		goto err;
>  	}
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		tcl_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].tcl_ring_num;
>  		wbm_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num;
>  
> @@ -782,7 +782,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
>  	int i, j;
>  	int tot_work_done = 0;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
>  		    ab->hw_params.ring_mask->tx[grp_id])
>  			ath11k_dp_tx_completion_handler(ab, i);
> @@ -1035,7 +1035,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
>  
>  	ath11k_dp_reo_cmd_list_cleanup(ab);
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
>  		idr_for_each(&dp->tx_ring[i].txbuf_idr,
>  			     ath11k_dp_tx_pending_cleanup, ab);
> @@ -1086,7 +1086,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>  
>  	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		idr_init(&dp->tx_ring[i].txbuf_idr);
>  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index 7a55afd33be82..1bd513f68a3c3 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -199,7 +199,6 @@ struct ath11k_pdev_dp {
>  #define DP_BA_WIN_SZ_MAX	256
>  
>  #define DP_TCL_NUM_RING_MAX	3
> -#define DP_TCL_NUM_RING_MAX_QCA6390	1
>  
>  #define DP_IDLE_SCATTER_BUFS_MAX 16
>  
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 562aba66582f3..53e34a2bea54e 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -91,6 +91,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  	struct hal_srng *tcl_ring;
>  	struct ieee80211_hdr *hdr = (void *)skb->data;
>  	struct dp_tx_ring *tx_ring;
> +	size_t max_tx_ring = ab->hw_params.hal_params->map_len;
>  	void *hal_tcl_desc;
>  	u8 pool_id;
>  	u8 hal_ring_id;
> @@ -113,7 +114,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  tcl_ring_sel:
>  	tcl_ring_retry = false;
>  
> -	ti.ring_id = ring_selector % ab->hw_params.max_tx_ring;
> +	ti.ring_id = ring_selector % max_tx_ring;
>  	ti.rbm_id = ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
>  
>  	ring_map |= BIT(ti.ring_id);
> @@ -126,7 +127,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  	spin_unlock_bh(&tx_ring->tx_idr_lock);
>  
>  	if (unlikely(ret < 0)) {
> -		if (ring_map == (BIT(ab->hw_params.max_tx_ring) - 1) ||
> +		if (ring_map == (BIT(max_tx_ring) - 1) ||
>  		    !ab->hw_params.tcl_ring_retry) {
>  			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
>  			return -ENOSPC;
> @@ -244,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  		 * checking this ring earlier for each pkt tx.
>  		 * Restart ring selection if some rings are not checked yet.
>  		 */
> -		if (unlikely(ring_map != (BIT(ab->hw_params.max_tx_ring)) - 1) &&
> -		    ab->hw_params.tcl_ring_retry && ab->hw_params.max_tx_ring > 1) {
> +		if (unlikely(ring_map != (BIT(max_tx_ring)) - 1) &&
> +		    ab->hw_params.tcl_ring_retry && max_tx_ring > 1) {
>  			tcl_ring_retry = true;
>  			ring_selector++;
>  		}
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
> index caa6dc12a790b..8b1aef7a536ec 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -2707,6 +2707,14 @@ const struct ath11k_hw_regs wcn6750_regs = {
>  	.hal_reo1_misc_ctl = 0x000005d8,
>  };
>  
> +static const struct ath11k_hw_tcl2wbm_rbm_map ath11k_hw_tcl2wbm_rbm_map_ipq5018[] = {
> +	{
> +		.tcl_ring_num = 0,
> +		.wbm_ring_num = 0,
> +		.rbm_id = HAL_RX_BUF_RBM_SW0_BM,
> +	},
> +};
> +
>  static const struct ath11k_hw_tcl2wbm_rbm_map ath11k_hw_tcl2wbm_rbm_map_ipq8074[] = {
>  	{
>  		.tcl_ring_num = 0,
> @@ -2822,19 +2830,28 @@ const struct ath11k_hw_regs ipq5018_regs = {
>  	.hal_wbm1_release_ring_base_lsb = 0x0000097c,
>  };
>  
> +const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018 = {
> +	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
> +	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
> +	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
> +};
> +
>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> +	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
>  };
>  
>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> +	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
this accidently changes max_tx_ring to 3, however it should be 1 for chips using
ath11k_hw_hal_params_qca6390.
>  };
>  
>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_wcn6750,
> +	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_wcn6750),
>  };
>  
>  static const struct cfg80211_sar_freq_ranges ath11k_hw_sar_freq_ranges_wcn6855[] = {
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index 52d9f4c13b136..e311c3541eb78 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -134,6 +134,7 @@ struct ath11k_hw_tcl2wbm_rbm_map {
>  struct ath11k_hw_hal_params {
>  	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
>  	const struct ath11k_hw_tcl2wbm_rbm_map *tcl2wbm_rbm_map;
> +	size_t map_len;
>  };
>  
>  struct ath11k_hw_params {
> @@ -198,7 +199,6 @@ struct ath11k_hw_params {
>  	bool supports_regdb;
>  	bool fix_l1ss;
>  	bool credit_flow;
> -	u8 max_tx_ring;
>  	const struct ath11k_hw_hal_params *hal_params;
>  	bool supports_dynamic_smps_6ghz;
>  	bool alloc_cacheable_memory;
> @@ -291,6 +291,7 @@ extern const struct ce_ie_addr ath11k_ce_ie_addr_ipq5018;
>  
>  extern const struct ce_remap ath11k_ce_remap_ipq5018;
>  
> +extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018;
>  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074;
>  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390;
>  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 3276fe443502f..1c972e7bada8f 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7392,7 +7392,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
>  	idr_for_each(&ar->txmgmt_idr,
>  		     ath11k_mac_vif_txmgmt_idr_remove, vif);
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
>  		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
>  		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
>  			     ath11k_mac_vif_unref, vif);

