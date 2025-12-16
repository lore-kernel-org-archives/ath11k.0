Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78698D5B87C
	for <ath11k@archiver.kernel.org>; Tue, 16 Dec 2025 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucHmwTUo2AKxUUsRWDspxJiGVK41TjRwQDHmb0VHij4=; b=rlFZFZryn4ymPBReC3u8Ru8/Mk
	IrHBMQjWI4EUBwhpfMDiCOCvwOwCOHyKRCEoaKFw+Gc4/TlHZqzYp4k+qmvOC9qqnAQ2UzwiPjTYz
	UwtjpoynWGoBgHuysUNcM8QVqGaOyPPmI/Lz3gnGtRI/ECNyjiMVEn5IEtceYwmxE3nwxJ9rlxU5L
	xKL8XEXZrT1H7jntyWGReqkEFHJkcNNLk5yI3jDHY04icGbjsoCH9/c4Bi8TVOqdfOJeJkCibp8Gx
	Z72QiuNvEDdnGV82+MfPA5pI473gJRspCPJItXb0i6/h9n/UUq23Y1BTfmH7KtP3dzgzikHuXDP3H
	rUj+QmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPGW-00000004pmJ-1ygk;
	Tue, 16 Dec 2025 07:14:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPGT-00000004plx-3b2z
	for ath11k@lists.infradead.org;
	Tue, 16 Dec 2025 07:14:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG25PKq1205156
	for <ath11k@lists.infradead.org>; Tue, 16 Dec 2025 07:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ucHmwTUo2AKxUUsRWDspxJiGVK41TjRwQDHmb0VHij4=; b=oy8opNSgg1XSrBEq
	2d4Os2WCSq64lfevoTlwE0P32y/QtrfQVjgoPOTsVRJwD6qwuUu+i2iFaQa3fwXF
	RzWI49+hdA4KR/mh+CzxDkbgqeQDSTz0vRjrMVro/9VJWZFVbYZ1da2HX9dMwNtf
	I0B+7fyslroPOrwSOsvSg5VJzJ5ff3C/9SEtCmlU3r2mZOwz29Y6S2lj3kxQIS3L
	uNrG06d0kAfvNuWwVNbrEn6wRzraih28ndZmnPRj56O5IOV3NQ1iSbNp9juljpTs
	Koa6sy9IDdcc+ZhzZnPBJZcHM2O7oSf0m/fBa0Iloo7Ew0JbZc/nQ45QcakZSBr9
	dFhaXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdajmqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 16 Dec 2025 07:14:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso12484736a91.1
        for <ath11k@lists.infradead.org>; Mon, 15 Dec 2025 23:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765869272; x=1766474072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucHmwTUo2AKxUUsRWDspxJiGVK41TjRwQDHmb0VHij4=;
        b=hUKjBRla5tcqlpblr6UoyBxg0+3qQeR5riLp3HzuPQ4Zo8bG3GlQ2QTjEZz79pAvzf
         GJfxfaVsh7VYUydXUB4eWw7xRp7cErj9WIkKpI+LTAp5LgUjNbUVMcdbj7EtVV3UuJfS
         3nGr5fPQhxgeFY5yUiwW8zj8IKYwYBlFD0UL4EQvre5m6aMIlSoUMbpZLcV5z4i6Eh1v
         LnypKP5wvIE83jJuNsJgA5OSPJENtwQz1iTTeUT3ghClZhdgxwqlVLkpy1gkv3fkeSKu
         F6i/c4xQRF4CexilIPvRBqaJ3oDTSAAHOUKy8Yd6q6Qo0QAQpbP/JrvTTWIg1lwBMUYX
         iwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869272; x=1766474072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucHmwTUo2AKxUUsRWDspxJiGVK41TjRwQDHmb0VHij4=;
        b=IYExGX3wS5fd7MbafNEb79n1V9KDHzEC5Kzm3K1WPoIU41tEfMT9TNnNJpucGlJbRM
         72Gm2UZerIoAHnGwtpAco+Q7mMD6LIcRTmrlFz6sQE2m4RJsRTLipz0Wu5q6MLZADmEG
         vXsXc12dRtblA0bLjS6ix7FXZpbVLBODjGJj/1R/wSl1wip3uF9U5U2iiyORKoEruFGa
         SH5Xq2/HFwPOgScxDrlpdazlBawCCA2XKSfhdDSstTA7labwRtVkeh76TjOljYknUxH9
         LoeTZ5WpUBQh09Tse7Ig96PsU4cVMrmexxqx7Cj36Auzq4KFfA5SSBpqFiJq8DcX2dx9
         aEtw==
X-Forwarded-Encrypted: i=1; AJvYcCVN6Mq4XTcFVwFdQdiXoP2HlCgvfNxB0jTc1tLNRs9re6RZwN0DsG2iyNYEInQn70Aj7NjdIug=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEUuV/eJ4yXRexY01cmpYXqGFRo4yEIRtKOegWB/Af4Vf+Dyht
	Xv8YtNCQr+SdhKIB/LZPYdfsGo9n15DSkhMgaXAoW9a9F7pZmmYzIzj4td4V2bzHphnvrIs0KtS
	BTe9gSvDtt6UOgM4ybnDQ7NVo2Uc2gxe9Rk7n92058X5Z76Au88y6r6v66o2w6wMJ
X-Gm-Gg: AY/fxX7+RNlzPycW9/rKbRXkTIdygqOd1dCCFWgeg3MRZJBxYeVSp02RgZZhPLEF3dw
	OqUzSYFOn6j6GUmdnaQKymblgovgQxZ6YmPkM2M07YDGUwiUzcnAitGwXzMhUKEG6z/ZdcIu+/N
	3+znlrG8EmWb3YisKCyJUfxIxLhwleOZHTZjrCcv6/n4GxI0gR0wpC/CsU8m1J6nZUuO2dBsWTB
	4BlUZzCgk/YU7rhTBEEi0vClfMXr97eDGIKmCUoZwKaZvRre270L9qVRl++B5WeLKPgrDVXksCk
	F1nn35wW5CecUYrAFNRidAJawUWgeZnvzZEyNLEBwttcduJGUl/7RBFCsQWWYT94m9/MWYX3Tkx
	Jm65nJSKgNuYjzozl6/sY03rLLrGVu9UG6V0vJ7Ye8FIsFMiCk9KTt4x1jNp8DC80LrniTA==
X-Received: by 2002:a05:7022:f90c:b0:11d:c049:2fa3 with SMTP id a92af1059eb24-11f34c26000mr6969976c88.30.1765869272050;
        Mon, 15 Dec 2025 23:14:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNGLiJC8lfb32DCCkHRrEhaxhvCil8ShlxBoJEAit0IhbhwcVVa5w7a7T9W5qPWJLhh2ODEg==
X-Received: by 2002:a05:7022:f90c:b0:11d:c049:2fa3 with SMTP id a92af1059eb24-11f34c26000mr6969953c88.30.1765869271453;
        Mon, 15 Dec 2025 23:14:31 -0800 (PST)
Received: from [10.110.127.186] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43ced319sm18571475c88.9.2025.12.15.23.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:14:31 -0800 (PST)
Message-ID: <83c5bb41-ac0f-4f01-be38-ba536dc8b977@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 15:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216043555.628296-1-mr.nuke.me@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251216043555.628296-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1cgggV3x2XEGAjVsOh2SbAnDjASAUoFD
X-Proofpoint-ORIG-GUID: 1cgggV3x2XEGAjVsOh2SbAnDjASAUoFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1OCBTYWx0ZWRfX/TzzqnD1h0Y3
 WRGh/fcUlD0uLqoDfyAqPp+8FqQWkxwp10HSJDJklEctlaLbDRhh6HMEjRBI+vbNt+dbx6fx6K5
 TBavKln0sdIOzNLOsCJSWYa+NsCFSnvRoLTk44UdYA/0FAROOfVqhTpeyLByfynXX77t0MAwwH+
 Ftj9BniBJZpyTgCu7yYA1C6EASGn8FSjJ0NYUS1ZavCPCLtvyV07SXxffjwyArU/KX4GsDOq0d9
 UxJhrnX9iHaXkuYX+tL/HkBLG3OUmEYTT/hfn225Wf00lWnr6+qCbm3TswbiJJkI42Um/PsV1mF
 aYM5EvhlIpg+RczJFdwsBz/5Gh6a2MsEKrptLJymLfyrcGZY+eaP9F8lU8jZzJ4iYrkRtmEuuyf
 6eywRkEGVEIs92HzxWj/IcWWMs7xPA==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=694106d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=6517jYOTR0an-2ppcwgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_231433_905247_A4E79E7D 
X-CRM114-Status: GOOD (  31.60  )
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



On 12/16/2025 12:35 PM, Alexandru Gagniuc wrote:
> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> is initialized in, core.c, a different file than the array. This
> spaghetti-like relation is fragile and not obvious. Accidentally
> setting ".max_tx_ring" too high leads to a hard to track out-of-
> bounds access and memory corruption.
> 
> There is a small ambiguity on the meaning of "max_tx_ring":
>  - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
>  - The highest number to use for array indexing (there are 3 rings)
> 
> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
> instead of #defines to initialize the length field.
> 
> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
> so use a constant to express the correct value. Add a static_assert()
> to fail compilation if the constant is accidentally set too high.
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
> Changes since v1:
>  - use "num_tx_rings" name instead of "map_len"
>  - make sure debugfs.c is correctly updated
>  - add a static_assert for ath11k_hw_hal_params_qca6390 special case
> 
>  drivers/net/wireless/ath/ath11k/core.c    | 12 +-----------
>  drivers/net/wireless/ath/ath11k/debugfs.c |  2 +-
>  drivers/net/wireless/ath/ath11k/dp.c      | 12 ++++++------
>  drivers/net/wireless/ath/ath11k/dp_tx.c   |  9 +++++----
>  drivers/net/wireless/ath/ath11k/hw.c      | 19 +++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/hw.h      |  3 ++-
>  drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
>  7 files changed, 35 insertions(+), 24 deletions(-)
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
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
> index 977f945b6e669..50f344803e8fd 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -707,7 +707,7 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
>  	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
>  	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
>  		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
>  				 i, soc_stats->tx_err.desc_na[i]);
>  
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index 56b1a657e0b0f..c940de285276d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -344,7 +344,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
>  	if (!ab->hw_params.supports_shadow_regs)
>  		return;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
>  		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
>  
>  	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
> @@ -359,7 +359,7 @@ static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
>  	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
>  	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
>  	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
>  		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
>  	}
> @@ -400,7 +400,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
>  		goto err;
>  	}
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		tcl_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].tcl_ring_num;
>  		wbm_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num;
>  
> @@ -782,7 +782,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
>  	int i, j;
>  	int tot_work_done = 0;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
>  		    ab->hw_params.ring_mask->tx[grp_id])
>  			ath11k_dp_tx_completion_handler(ab, i);
> @@ -1035,7 +1035,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
>  
>  	ath11k_dp_reo_cmd_list_cleanup(ab);
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
>  		idr_for_each(&dp->tx_ring[i].txbuf_idr,
>  			     ath11k_dp_tx_pending_cleanup, ab);
> @@ -1086,7 +1086,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>  
>  	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		idr_init(&dp->tx_ring[i].txbuf_idr);
>  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 562aba66582f3..86e1e6c27b36c 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -91,6 +91,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  	struct hal_srng *tcl_ring;
>  	struct ieee80211_hdr *hdr = (void *)skb->data;
>  	struct dp_tx_ring *tx_ring;
> +	size_t num_tx_rings = ab->hw_params.hal_params->num_tx_rings;
>  	void *hal_tcl_desc;
>  	u8 pool_id;
>  	u8 hal_ring_id;
> @@ -113,7 +114,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  tcl_ring_sel:
>  	tcl_ring_retry = false;
>  
> -	ti.ring_id = ring_selector % ab->hw_params.max_tx_ring;
> +	ti.ring_id = ring_selector % num_tx_rings;
>  	ti.rbm_id = ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
>  
>  	ring_map |= BIT(ti.ring_id);
> @@ -126,7 +127,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  	spin_unlock_bh(&tx_ring->tx_idr_lock);
>  
>  	if (unlikely(ret < 0)) {
> -		if (ring_map == (BIT(ab->hw_params.max_tx_ring) - 1) ||
> +		if (ring_map == (BIT(num_tx_rings) - 1) ||
>  		    !ab->hw_params.tcl_ring_retry) {
>  			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
>  			return -ENOSPC;
> @@ -244,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  		 * checking this ring earlier for each pkt tx.
>  		 * Restart ring selection if some rings are not checked yet.
>  		 */
> -		if (unlikely(ring_map != (BIT(ab->hw_params.max_tx_ring)) - 1) &&
> -		    ab->hw_params.tcl_ring_retry && ab->hw_params.max_tx_ring > 1) {
> +		if (unlikely(ring_map != (BIT(num_tx_rings)) - 1) &&
> +		    ab->hw_params.tcl_ring_retry && num_tx_rings > 1) {
>  			tcl_ring_retry = true;
>  			ring_selector++;
>  		}
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
> index caa6dc12a790b..bbaacdf76af0a 100644
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
> @@ -2822,19 +2830,30 @@ const struct ath11k_hw_regs ipq5018_regs = {
>  	.hal_wbm1_release_ring_base_lsb = 0x0000097c,
>  };
>  
> +const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018 = {
> +	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
> +	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
> +	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
> +};
> +
>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> +	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
>  };
>  
>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> +	.num_tx_rings = DP_TCL_NUM_RING_MAX_QCA6390,
>  };
>  
> +static_assert(ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074) >= DP_TCL_NUM_RING_MAX_QCA6390);
> +

instead of keeping this special handling, how about define its own tcl2wbm_rbm_map for
ath11k_hw_hal_params_qca6390？or even simply use the newly introduced
ath11k_hw_tcl2wbm_rbm_map_ipq5018? like

const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018)
};

>  const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750 = {
>  	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
>  	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_wcn6750,
> +	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_wcn6750),
>  };
>  
>  static const struct cfg80211_sar_freq_ranges ath11k_hw_sar_freq_ranges_wcn6855[] = {
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index 52d9f4c13b136..9db984ac4321c 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -134,6 +134,7 @@ struct ath11k_hw_tcl2wbm_rbm_map {
>  struct ath11k_hw_hal_params {
>  	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
>  	const struct ath11k_hw_tcl2wbm_rbm_map *tcl2wbm_rbm_map;
> +	size_t num_tx_rings;
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
> index 3276fe443502f..33ebe03380114 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7392,7 +7392,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
>  	idr_for_each(&ar->txmgmt_idr,
>  		     ath11k_mac_vif_txmgmt_idr_remove, vif);
>  
> -	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
> +	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
>  		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
>  			     ath11k_mac_vif_unref, vif);


