Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF7C5AD55
	for <ath11k@archiver.kernel.org>; Tue, 11 Aug 2026 02:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXcNHLM8qGDWKTk4CUAODcEzd7LuZQzNNK3A3gJgByw=; b=So4NHbwx45K1q9K5GXS5/0m26x
	4n6rH2mlbh69lXArDFwWJesj9SZWSZOaLCZ/hv9fPUdDKPL888K55O6ylLggvMB0yJavXM9FmENUU
	nTIifoU4+9T5tIimsWom1XYKSUk5nf4k0JIpEOgSe/HazsvKIAvCqZLP7aY3TPe9x5wumuti/Gg7q
	kcUNgkJllBLn7ljWBKss74DIlQS1GtXyDfmxikpfXypz0hVIYRN3exazFR8XU0wnQcwUyAL+wJtMV
	TnBPzsaFQKZtqXh6i2qnhXBIJGrVS+JYmN5QFDhWsm/AiX2iYXcibPvWAA+QgWDyGVk/bTLB/L1dH
	Lt2B30Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcAj-0000000DA5o-3Nq9;
	Tue, 11 Aug 2026 02:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcAh-0000000DA5E-0QiC
	for ath11k@lists.infradead.org;
	Tue, 11 Aug 2026 02:24:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqHeH3307915
	for <ath11k@lists.infradead.org>; Tue, 11 Aug 2026 02:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXcNHLM8qGDWKTk4CUAODcEzd7LuZQzNNK3A3gJgByw=; b=ejlp7fo2heYmwlTO
	BhG7C+41Q1Whx29+t2+ZTyZ+/fVopS5KuK3sZgjkRDRnVzfX+hxlOphOvX1AUj4L
	Uxme4uQK5man0jm1MfP/WdXxc5n1eQJfGlfzgqbCyXLkmE0HnzHFo9Sq3KESm3tO
	cqDfhu9K9xNbvVRXmah4NyG7UG6Yy+Nbo9egECDSb7iArIjK+1ywKRELWluJmByX
	NyC57vRO3Wov8oacVninuFMoVcdDeRxNRVsMbV38OvjWnIVi1ZP4SxbIHP3Qlzj8
	weKxrEP7cwURQVH8BTn99UvZyNLLHuuXLMZzmgVs01ULxNC8TmYeX3y5rjxrmAoL
	cxoo+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfsux7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Aug 2026 02:24:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6800444a91.3
        for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 19:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786415092; x=1787019892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXcNHLM8qGDWKTk4CUAODcEzd7LuZQzNNK3A3gJgByw=;
        b=BC9/aQWinfyn0LEvshpHAlp53oqQmfUNS7PEWJpV0gCjs4aHI40xUQJPbFrEhO4SD8
         qUfnfcnsPzVCwQ8NfItJMwq9uDMAc1Sn7es/V9SDT42Co7Mcebmgb0dD+SL4kDf9MdLa
         x6ottUsVQad/yUdRrI6/XF05CdtjHl+3dgckCOM9hp7ctWo14jJYD5GbRYybE9F4WEN7
         HBn49GnAdfZWQswHRH/GwAWgyFIbJUxmSZkT6/2oOSOduObKhRjhoyVeZ7GxeXfcoEFb
         42+i6k/Venajhz04nLBh4VvjyiCvu/45EdVNbWtXeCECNlTUH4Rwowoiv6VSnaMy2Rb2
         nYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415092; x=1787019892;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXcNHLM8qGDWKTk4CUAODcEzd7LuZQzNNK3A3gJgByw=;
        b=WYPLsDMNGNfzzvIVFIt4gSPqZavxplmNX2hRtQVE2cJu1PWJSrzTixSomBFCarc/fZ
         wG3V1VtqVreMhK7EpHgr/PLuLGoBkJYSp5OEjxSJz4XOn8PDJ9NxespMR0kcReZNmNvD
         pbp2Ako1zpUiyVNxBKJmim5sWLEIXAkzoJY4gSwXM707EDKcYKXoj5yarnuyrrpVnQTY
         eq0T6iUwtRK1UtBew4KHLqJ4XwWcWYZmtvp0nVBUnJjJ4IOM8Y0yGdxBkcOOjqVinvFd
         ZxdS2Oz1yFaDI2Ym4nbocWJzXJIUjQ1Qbz1Srswclt2Jn0YPIL34brjyanxiIb0Ptxyr
         JMkQ==
X-Forwarded-Encrypted: i=1; AHgh+RomSfFqZs3lBL5/Uqiq1RDJHnQmdqNrLtpBgK76NPu132k4Wl6VqgLEbMW71BjMfws/2VS7XYs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7c9fj9rNIN2Eotn0RrMLwxJGKxAZSM4P4XD1NMoOlelPs1S9k
	hFEf8VUpFQNakjZ5n9Vp+h5Qf0pdLfI4TN96DYqm09QROoRu9hbdePUG/CtN0c1q1FaoB53yFHd
	n0nfJ43DzAK4J2Wu3ZxNfNfyIvSRAUG8yWP93MK0z9ZBDb4nMibtMAWm4P0ztfCY2
X-Gm-Gg: AR+sD10Lm5z4ZuWAuEqghqcQYcEfAE1ykDQKaHzNNjDEpdTgxXEB2NmJXbLkH06StQF
	5GOS8zvBtSTYLKhEoqZQmRsTyWYCctDvgUk/efyCSbM2hUtmzwpjZFAqb2p8cyhpA9wtWHVWueJ
	0dnUSAOU0fVjFfCEwjHBWDC0nOn6VlZwLiGIZ47bGf30d9mqaUsOlB8i0J9bxzDj7TlqDW7ruX6
	lnfIVobrgAntdjrLHgO4a8hkNqhg2wIRJyXCdPuBsBN52iCirYGvi9ENTtkbs2jEuDDwUDlzHGh
	AKlNC77bdR7p2xfeJJc2Mz+orpDgwVV14tYsqpGwk5Y9/gnbwjcqubU0t4rSwEqmCwnxKoW8LBW
	t4Qkpu7yLDADrkvoEnIlNvvZJqOPHzYCOuTGK9/2og1GGIqElJO1jSS5MqWUzK63z9OBPqoiK
X-Received: by 2002:a17:90b:288d:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-39261ff3945mr33151668a91.9.1786415091788;
        Mon, 10 Aug 2026 19:24:51 -0700 (PDT)
X-Received: by 2002:a17:90b:288d:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-39261ff3945mr33151621a91.9.1786415091338;
        Mon, 10 Aug 2026 19:24:51 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5195a4dsm1613157a91.4.2026.08.10.19.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 19:24:50 -0700 (PDT)
Message-ID: <802e92d2-b1be-4a0d-bb3c-93b9e510c9d5@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 10:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>,
        Sven Eckelmann <seckelmann@datto.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        John Crispin
 <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: clRypEL7ImwUlvzyNzvh1rgPZOs8-qNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX8eO3lAPL4oPi
 ipSnO+hDBfJ6v6Yv74zTLx8pqJlxwwlJD3RAMUHoNuHjxhD1k9wYjHtc3lOFONZrAPia/4Zae2U
 WoGqCUUUDHbsq5Z97dk+4QL8Gvgrpgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX4gefMraammEs
 FeZEBTUuR28rk0ty1wzyjG+zmH+n18pzS/reX53J6K1XhBIL9+daTs1P4DVdhoVzRW/Cr2VsgLS
 nBAk9H9hE8xKgXGTIz+3g5XDYhGa3er8z3fHOJelJxIYxIu/kRusKvgbNHz+MZtOrR6/Kw57ogv
 bqw2+M3zgQx+5EEW7hpRD/pvfVW45G4ft+zV6/OVMGdqSWnC0ohu/EltgnxX7QyS69vQ6DL0Sky
 NVViih5xwPyDdgR1Ggprhc2noH4PIjo6HIT+YH54JMESwh/ntDDRz9UpkG6lsxn7P4MwtxQM8Sq
 yE9r50y36o5wgzCadDi1p+J/hLzOWJuEXL7Llx3k8gp719gaKAsTCdXFLaU5CjN0Nyjq10r4xDj
 TLBgQGokpUxmJeDuPeNpUjfmbLzFJpmgPqR0l0aZpkFrom3xTfeS2SZ94KNue0D6o6Owobix5By
 KBJF19ZyIS/8QdLkZXw==
X-Proofpoint-GUID: clRypEL7ImwUlvzyNzvh1rgPZOs8-qNG
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a87f4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HH5vDtPzAAAA:8 a=he8YDqbjAAAA:8 a=EUspDBNiAAAA:8 a=e4nBh9WiceBO0ho2o1YA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=QM_-zKB-Ew0MsOlNKMB5:22
 a=lRF3faHqDRKgy28aj_NN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_192455_419271_6793776E 
X-CRM114-Status: GOOD (  17.57  )
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



On 9/9/2024 11:08 PM, Mikhail Lobanov wrote:
> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both 
> dest_ring and status_ring to be NULL in order to exit the function. 
> This caused the function to continue even if only one of the pointers 
> was NULL, potentially leading to null pointer dereferences in 
> ath11k_ce_rx_buf_enqueue_pipe().
> 
> Fix the condition by modifying the logic so that the function returns 
> early if either dest_ring or status_ring is NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> ---
>  drivers/net/wireless/ath/ath11k/ce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index e66e86bdec20..9d4246d65d68 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -324,7 +324,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
>  	dma_addr_t paddr;
>  	int ret = 0;
>  
> -	if (!(pipe->dest_ring || pipe->status_ring))
> +	if (!pipe->dest_ring || !pipe->status_ring)
>  		return 0;
>  
>  	spin_lock_bh(&ab->ce.ce_lock);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

