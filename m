Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09525F532CB
	for <ath11k@archiver.kernel.org>; Tue, 24 Mar 2026 03:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9bDgd2rrZOk8w719cYMGjoo4mCCtQZY7pIySHyCXsI=; b=D81kAAQte04y81deiJesBJR3uG
	H2tNcmHWsQaGxMek1ALpUTzWxS+yATQtHOwp+/BhsuPB60ibrSpknMEapeE5DY4HoYWs5+g4rTb/o
	szg/I184Olm1N/ze8MADg3H8sW9i/bZXGcZJY81m68cscd0mkiUtHRLx2/HmCpU2GEze7/7UjJ0bX
	AvNXVOgIDvIjqGZn1ML0wMn/FwnD8uhiE89j9j/SHM5OCD8iFJ/cNBShnvns4awxdPEKcdlkHCFxj
	rVKyvEutRQwuJTxqwAQA8dhOASxvAfWeJByh4OaXnGzaTDPJqav8JtvgWBRQrVhjdeBAsW2NhQ/F2
	EOLPO0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPx-00000000U0D-0uk1;
	Tue, 24 Mar 2026 03:26:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPu-00000000TyS-0BXZ
	for ath11k@lists.infradead.org;
	Tue, 24 Mar 2026 03:26:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrDfR618994
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 03:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9bDgd2rrZOk8w719cYMGjoo4mCCtQZY7pIySHyCXsI=; b=mrUKC9PAAXFi9e2A
	4tLOmVn6jdBjc3UNWzpk5bZRELR4xBCk7QAlLYeGfEWxFt3J2KM04v/0ZfGOp8V0
	tcf09el/5V6TB712L4FVuPPR4iT6KVbWz0/9xrGQT0HXlWulzuouSpKSfwQgKdkw
	/nFZNm0aX53QYaUcQBiuSQmgdwdM2iNYww293x2c+UIbICDnXOuNfjCWR/iQDwwx
	UIFlMPeziA07BEug7A1dvEfebSYKCgssrtEbkUfv1uWp307+fnjesGdO5rDjFj+C
	emJDcJzbcSNM9x8SwLigGQv6D6fymBz51TQmoWXT1Sr2bZH1QSA9JfOJGSQeL262
	dv8N9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgktmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 03:26:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c38b85ca2so1728140b3a.3
        for <ath11k@lists.infradead.org>; Mon, 23 Mar 2026 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774322813; x=1774927613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9bDgd2rrZOk8w719cYMGjoo4mCCtQZY7pIySHyCXsI=;
        b=QyJfRuNr4nyGNneXEo7xYU0utNTOv879uR/DKct9FqS7WHIgsO/TKqXG2piGxQzLOF
         xxRqBuaMINPlYrv1OPZmnq2qFIiFPNR7oVC+9rSXJZju7VHyqcs2EFk2zKCMfxZbIZi/
         Fa3vLrIXWJBVsGEicdCRefcZH0yjJragKCFalZyokie4zGmLavvSSwePjJzOFmH8KNnH
         adrmWV0yYUJh3gxFuBWAOKMRc/Z1gayiWTtIISND1z4hy10KRgEpbZOOthLbrIHe1iz8
         HvXFVFs6E87yyM4XUB/pB3OxqHD/2Gfdrc0T/N81xVer9F9j2Bcd6H2CYyK8ddon30gT
         qsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774322813; x=1774927613;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9bDgd2rrZOk8w719cYMGjoo4mCCtQZY7pIySHyCXsI=;
        b=atnGl+dFa+5RVaQo48qQquXUcxqX2ouGOMq+Zgfh9h2EIfhLsWOrqZVZ14WMWXiPZ7
         LOritsh0qyy9WR9/KNkEvp13Dk06Dzakbi5XGOLKkAblR2QYtJoPCAuU0YqVEb0Oxp3q
         NHJ3BB+RWVXiKT/WEgPHJPjZeN9bFRp68Ays8tY9NzFknenNO1ErxYc/P+UV2bCDCpsZ
         A3k3yeDw3jQ352GcW1oR0RTfCbVMerWJMCOfHEQ2uorGsgojPG1x6JFV/b26or/fV/pT
         qxSKnef/Y3djlSy7hPn7jAGS0teKNibdrwB4TENctqylDro3CkgKPjr8s3MDOmKkXQ+F
         dMeg==
X-Forwarded-Encrypted: i=1; AJvYcCVuo2xteiTsyqmMjcWjZBEVMffnfTNu84AJNNxDRg6esH4TgwCkyFyB1gYqAwepyCtco8viVCw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyhq+GDkqDXHYKie0DSlutWFXC/5si+H5QrSPfjZw2HVQ1m4V1
	UrCthYpqvgh7ZTH6n+cR6Gt43sjgC7QJWTU54RlyM8eiz2wLzp/UEY/B9j5bA1I3ROQCCTmxe2r
	h5qYNfBoOOP3oN1ZGMkYEowLwKjGeJJUnXSwG8QPW5tc8G5IWx6QTDSEXsrF49PUpl+GB7gtj
X-Gm-Gg: ATEYQzwz64RsRg8ISzr+qiMTj7j2bKTdkbXOullx+M6Z7tbPvDOZDsee9WyrYntsaKg
	Sr89J/mwtYWpddr8S4LLL193vHF5GoOak1iW7mON2TbTRkateTPFktz5a86FGEY48h6tkfQh06W
	k9ir853SNYQI2arxkYudkNihdAXji2yrYykgqNaHB9nLvD7zwLgJFxVRGrH9RWzCDhHiuyeSl7f
	6KcVC/GlT8tUGqwDt+54Ld+f+m8LkZM/WKAIKPAdaD4ypmn/8hpqI6fKAQC4JSY1/n6vNY73OuM
	AV2CB3JuEsPgf7gWpWa8GQcPlnmokomnarNMyYe6NPNYpRzOyer8g8Foc4IwkuXMgaYiHNRPyHf
	LGkupyau/N43tFx0XhYzsImazVxn2Vv4DIdRGrRimTzgPXCoKNF1a6BUDS1/cCcngrKUQGXrQbD
	TEfSsNYyJZrfWegAEB9Tk=
X-Received: by 2002:a05:6a00:3a18:b0:829:8139:d5cc with SMTP id d2e1a72fcca58-82a8c394369mr11912389b3a.62.1774322812538;
        Mon, 23 Mar 2026 20:26:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a18:b0:829:8139:d5cc with SMTP id d2e1a72fcca58-82a8c394369mr11912356b3a.62.1774322811935;
        Mon, 23 Mar 2026 20:26:51 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf050sm10367619b3a.16.2026.03.23.20.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:26:51 -0700 (PDT)
Message-ID: <424fe007-3426-49ca-9129-09bedebaa0b6@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: Pass the correct value of each
 TID during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MFrpirvE5PGlhEZN5w8Yesdqukuxa0RI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyNiBTYWx0ZWRfX2nkdYMm7cgjt
 mdzIhYBufcG/E81GFa6mZj7lVfBPAwMFE0qXTWKYUGHp/v+O6+7/tDbSXYAX2JNK/YdWAi43dy9
 +2frwcv1EFiA1OKWQcN53vz8svWvQm6YCCBRPOpeASdPTvcyQgCoOvpO14HqRVenrBxL9X392fj
 FSxmytm1ei+7EQN5QMwZmPA1Jmsi5ksRwvOOCnsHk8BLO8w7QkAM1wSn2A9mOg0cUmFm64FzFtm
 7Qc5YfbYbEnoNe/2ZC1vxVI6enKalbXHH750buPDUydNO+3SzpWHTxs9zQ/HXLKXp4OMsYwQGMv
 l+54yBKNBRX8Sar1lnx747JZeDsbxKNo51p0cl5KEQ+ehhPIaLkQG+56oOxdd6yZ5RN4BvAMEw7
 085sJpcC8O76whDQfNYPXbFrAuxdS9vi0O/EU4SSYlepMQjNJRZ416TLbP2Xb26pqCsdgILLghI
 JlbH1PyoOlSfL63ID9A==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c2047d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SuUSrtddnHl0rAUyDDgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: MFrpirvE5PGlhEZN5w8Yesdqukuxa0RI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_202654_089206_55984AF3 
X-CRM114-Status: GOOD (  22.87  )
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



On 3/19/2026 2:56 PM, Reshma Immaculate Rajkumar wrote:
> During ongoing traffic, a request to stop an AMPDU session
> for one TID could incorrectly affect other active sessions.
> This can happen because an incorrect TID reference would be
> passed when updating the BA session state, causing the wrong
> session to be stopped. As a result, the affected session would
> be reduced to a minimal BA size, leading to a noticeable
> throughput degradation.
> 
> Fix this issue by passing the correct argument from
> ath11k_dp_rx_ampdu_stop() to ath11k_peer_rx_tid_reo_update()
> during a stop AMPDU session. Instead of passing peer->tx_tid, which
> is the base address of the array, corresponding to TID 0; pass
> the value of &peer->rx_tid[params->tid], where the different TID numbers
> are accounted for.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f2895 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
> ---
> v2:
> * Added QTI yearless copyright
> v3:
> * Removed QUIC copyright information
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 49d959b2e148..85defe11750d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <linux/ieee80211.h>
> @@ -1110,9 +1110,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
>  	struct ath11k_base *ab = ar->ab;
>  	struct ath11k_peer *peer;
>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(params->sta);
> +	struct dp_rx_tid *rx_tid;
>  	int vdev_id = arsta->arvif->vdev_id;
> -	dma_addr_t paddr;
> -	bool active;
>  	int ret;
>  
>  	spin_lock_bh(&ab->base_lock);
> @@ -1124,15 +1123,14 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
>  		return -ENOENT;
>  	}
>  
> -	paddr = peer->rx_tid[params->tid].paddr;
> -	active = peer->rx_tid[params->tid].active;
> +	rx_tid = &peer->rx_tid[params->tid];
>  
> -	if (!active) {
> +	if (!rx_tid->active) {
>  		spin_unlock_bh(&ab->base_lock);
>  		return 0;
>  	}
>  
> -	ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
> +	ret = ath11k_peer_rx_tid_reo_update(ar, peer, rx_tid, 1, 0, false);
>  	spin_unlock_bh(&ab->base_lock);
>  	if (ret) {
>  		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",
> @@ -1141,7 +1139,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
>  	}
>  
>  	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
> -						     params->sta->addr, paddr,
> +						     params->sta->addr,
> +						     rx_tid->paddr,
>  						     params->tid, 1, 1);
>  	if (ret)
>  		ath11k_warn(ab, "failed to send wmi to delete rx tid %d\n",
> 
> base-commit: 7bbb578fc43e7dcb8690cfc98844bd67bc311e8a

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


