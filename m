Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D109E784BE
	for <ath11k@archiver.kernel.org>; Mon, 29 Dec 2025 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M20opajuIAOzQS6JcV1SCG/8yrO4afy2XBUwgx3WtJA=; b=QH0aaoSD0HWvJfJYHVk1d9WTA9
	mm/BfDIUTvMxjaOWhV5zx5zrrvA4T1U6OlEnVNQLR8z5Y9p5nj3Y3ciK8kwHIXd41YsXbeXgdzU5Z
	NVY8DSzIdX2l1zBucdiGt/1xExbPjKZhd55rXj3yPx3/YUJpwKgj4b2r8Un2XwKymJOf8fT8jyAe7
	J4JcaYhw3Lys9frfD3ubq6Sn4GapvnyW4b2SgRKMoy5pmsTpbu6H8UWVdH+GJHeBHKiM3nUPfhwk4
	t+XHYuwi+tUSNwXH0D0bQyKjB5xQyB2G1R88EtsjSEs134DU7TUE1BKo/QnS7RjcMayPEPnN5arEA
	mPTIuKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3iR-00000003Gaq-06WU;
	Mon, 29 Dec 2025 03:14:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3iO-00000003GZA-2I9T
	for ath11k@lists.infradead.org;
	Mon, 29 Dec 2025 03:14:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSKppRp2995712
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M20opajuIAOzQS6JcV1SCG/8yrO4afy2XBUwgx3WtJA=; b=AdILY1hKSAH4ttnJ
	n7IbFXXwoj8260ubFNpSmcVhXTqdVtb6EnnTm0aZhC6e6zFSkE3902K6opmtFwD7
	SvRFTD6NDXyaK4k80vN166bmB+oSsX7b/hwSjJxfOVIua1iGIGwDVR/JShWtTrDw
	odhOeayhqe+MiFSnarJbIhQDLq7iDharyDIHK9m+Ja3guxs2r3C3ZurbaUuXTGNs
	kjVbyPre1w/WBsMKBqne/hSI78lLvA8op1QfWqwRvosm/Jrsgi7hO/SAIZNt/kV3
	BIl0HoFnNwbT8tgjKxKVFJV5enUuj+K5VKzwjz5LyEuQue9x8t6Wd6wob2lYuism
	/274MQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6b40b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 03:14:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso126134505ad.0
        for <ath11k@lists.infradead.org>; Sun, 28 Dec 2025 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766978074; x=1767582874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M20opajuIAOzQS6JcV1SCG/8yrO4afy2XBUwgx3WtJA=;
        b=dfS2zAULebuvQeLtSsXcW8Rc3KcH55cqM8R1hQ5/GMjx4aa1honm2uV4XTaVwkCTk8
         9pSfANt3qYzDQUe1F25BI32DDsa42YEdDXYxvCygKQ6WkAVuCRQc2AU+zz760I6G10YF
         6RP8/oTsNu2mtCWTRNrgNcLTSL+ViJco94lVHYdr0pKjUFii+j37LEa7+qJNFch0+3Gi
         7uyH0pSd2/CnqaOLsi77M1PkECmaBTr+l1X0dMAvdeubXTekfg14k42urkGeGkhsD5Uw
         5bgumGDtK2xcMZsiB7Dnh+iAde8nl/TV5aq6uDoRAz9iJRdKAevG6eHYT07mEOwMzfr+
         UOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978074; x=1767582874;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M20opajuIAOzQS6JcV1SCG/8yrO4afy2XBUwgx3WtJA=;
        b=YpbDwdwDNaraU1RFfIpzMKvYiT/eIvc8fLlsL3bs03lWnvOsBpbNAIxln5SEcTfPoW
         +ZqrCQyhsfS8Eka7D8p9AQVVJdyKb+iuCqpiSvKnOwuYIz1C5l0tyKLczp5lmBGzRvY7
         NuSqU1rk4U16Hvc8pQPznsLF/uVAbJdIJZdb6K17w1CycrnL4a1nscc0sMxe+GLBdAT6
         nAIjqD695YHR7nXwaMmWctBd9BBmVrshEDRxHEed88YqaSKnEt7b3AVG2uOhJNn08SaO
         mQFQr81Pk3EK/6do1WOZ/LyLFJYdAfD3HzbIP/iiKyy6LF1GdUpAxMKuEO23zFzhA24L
         aMzw==
X-Forwarded-Encrypted: i=1; AJvYcCV3yh8PMi78IsZrjQNVprXDHs8JBp+kxGdz/m3jUpe/WM/5D567DxlOYMq7ZcMYw2k1M0CSV/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZXKWgxYCKEWssgMl1VIgOkC5jgi/7hDnSmXcqxRfnoowZquHO
	CY5+aViB4+/xRImnjLZGlnyPh7xWcvXeQEL1yXEbKUaepOd8nxzGCAxXCc4spuF89VYQrvUzM4N
	9Xe3FVR/Z0/3D8DrEoJjKHKlD4wk6ZxzD0QTcKhHzRcUUyzmMHqbihQgh9k7HQWFLQw9z5aP3fF
	M=
X-Gm-Gg: AY/fxX6z2nYAYzwN0v95rTJyRngv1s2uyCPkTeyI4lxk5KbtLanV9YTTPJ3ftIQQlfh
	XbedTtPF2k0+AUn02BY1LumL5Y6MnRDXHeLFVY4KHh6Rb4DfS/PtDDNoJpdzrD0MY5VALWlCpYO
	iPwE0iwqjPXXs1GaFGk6iS04sF27QEnmKZojr2bcbZxKkO3Wmpd8vBzLnXzNd/UO/kGE9+zDDss
	dCL7cHHFhaEaTabz49PIZsu2A6EVpGpDCeQl0pCm9eUUj0cL2qy/RVq22ZtC4HBHirlQ2ENGF1D
	+/gjkcjSppomvlW6tlTl4RcSd5PNv2oQzekD/xXgVbocP0k/6HJWkXIz4YQXPmksiyjktqb4zzR
	YUkKmtq0IAFil5hqf5cuC8Sdiw+yjl7L6+so3vrWYpeg9OrIQOCV6byZtWzikrFQkp0SROg==
X-Received: by 2002:a17:903:244a:b0:29f:301a:f6d2 with SMTP id d9443c01a7336-2a2f22235a9mr298491025ad.19.1766978073601;
        Sun, 28 Dec 2025 19:14:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLx0uCawHwZtVejXNuF6nHdr3KCGXW2ZSyGqyz5fveo98kUZiLU/PXOY7Tiu5rTR3M96hGUQ==
X-Received: by 2002:a17:903:244a:b0:29f:301a:f6d2 with SMTP id d9443c01a7336-2a2f22235a9mr298490835ad.19.1766978073026;
        Sun, 28 Dec 2025 19:14:33 -0800 (PST)
Received: from [10.133.33.44] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm256230005ad.3.2025.12.28.19.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 19:14:32 -0800 (PST)
Message-ID: <a3df690e-4224-409f-b325-90beb905219e@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 11:14:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6951f21a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WX8WESg8fM6HLtOjjJYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 17QYdUIlt-kTmpZ-HY9bG22Icg5LcfZY
X-Proofpoint-GUID: 17QYdUIlt-kTmpZ-HY9bG22Icg5LcfZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAyNyBTYWx0ZWRfXwZsimg5wHicw
 hBGIBf1/mdGa9M8r5D63SiG1tC+1qoheRZ4rm3qOMAX2AL3Wn89rB6NVEhrjuM0QXI9B4MYRjYK
 BUN1Lj4y4JBOOlRniM1y00CgNNFCmxRtdqa4nVxXl6a/Ruj5jwP9Obizeyn6Bl05kX6xLgDFdws
 Anx7iHwBr0A+u5MKPgpwC1NNdw4bM4cYExf51HIWmahuAWlh4QUzYnHbrkrCuSZUz/Blz9CPjE3
 hF8+mL0SGMWqtFXgasEIW5MzPpvL9eQ1/WQsZWWxiCZgxK8cBffb0vN9tcd3omFCFHl2D7A+mds
 T3N3JHuA0RhiBHMjZDLMkXBb8cjD2YiuV14OSTtkbC/DqqneZpR7cS0xM7sMXiN9UwQE9aY1sj+
 9UmfcVu7siB3fWZ7daesb3JXZ55Qj6YhhdMlb4GDprJTetvShcllhOrq9OUoc5yFURdwglBHx6y
 SmZbZze5JxnP2qhnUMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_191436_622751_8B5114EF 
X-CRM114-Status: GOOD (  30.96  )
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



On 12/28/2025 11:14 PM, Alexandru Gagniuc wrote:
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
> Changes since v2:
>  - Use ipq5018 rbm_map for ath11k_hw_hal_params_qca6390
>  - Drop unecessarry static_assert
> 
> Changes since v1:
>  - use "num_tx_rings" name instead of "map_len"
>  - make sure debugfs.c is correctly updated
>  - add a static_assert for ath11k_hw_hal_params_qca6390 special case
> ---
>  drivers/net/wireless/ath/ath11k/core.c    | 12 +-----------
>  drivers/net/wireless/ath/ath11k/debugfs.c |  2 +-
>  drivers/net/wireless/ath/ath11k/dp.c      | 12 ++++++------
>  drivers/net/wireless/ath/ath11k/dp.h      |  1 -
>  drivers/net/wireless/ath/ath11k/dp_tx.c   |  9 +++++----
>  drivers/net/wireless/ath/ath11k/hw.c      | 19 ++++++++++++++++++-
>  drivers/net/wireless/ath/ath11k/hw.h      |  3 ++-
>  drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
>  8 files changed, 34 insertions(+), 26 deletions(-)
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
> index caa6dc12a790b..d19c4b372a2aa 100644
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
> -	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> +	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
> +	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
>  };
>  
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


