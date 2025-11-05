Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5E2CCFA04
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 02:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEgKxTzFP5wtiwCINthvDjzT8DEp1xPRg4SO6G8xn2c=; b=ERjfHKz8tv52nLZLmrErQg77VB
	r8XwCcKaKiLCRs/mS3RR61jnmrLH/oQ/vc/3liE9l+fr8iiZasivw6nb+FcysENWGGxhTlvWSg7VD
	wgYcTX6HAozluOICPfUh0rnX3zp+3C2OlGBPXWmNNdoVa3tTrCWqYjbHtu6qSomRxEArbyxdvsHSU
	1KZ+BowLdoeKF24iVuIOMczuQx6NLitS0n36AVE2cjOJMeeRlBwVcG0gVIobhkgp6fQ+gblvL//1S
	5urPuNrZxEM7xNSM4/if0PJWEdfyfIWxp2gN2IcMwIvyZ5JfVFT9sgTtTTZuinuVs07Tt8ZNWF1qW
	+/ALv4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTYA-0000000CvF5-1VSn;
	Wed, 05 Nov 2025 02:47:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTY7-0000000CvEc-1NDn
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 02:47:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kg2MI2979005
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 02:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEgKxTzFP5wtiwCINthvDjzT8DEp1xPRg4SO6G8xn2c=; b=Y6Irj+iWoATxQYrG
	5Z+y9o7SE6YyPNcWVGkCzJQ0hlISPUcVdUzTQYQEQfv68RRYHxq5XC+ELN5HUZ2z
	4RToSObOufxg52mH4xH8HvoXQ6Z/Vsvd09WiPazfe+jE1/T1uHQnCcnudBnNu2kn
	9LTM6BNf1FUQ2Rk21Rg0z7WkDvxvq4b+Lt2myXhsOiCfRErf6Gknc+wGmx7HuSCw
	IIoX9LLxKfdbw8tf2avcC9EqYCg0zF0RUn6kPEV1pONE1XPfEy6hB2VBUEIaBh1J
	XEqKP1NiNgC5EbpeNf3PnNCIbjzE/gray0HDbVwQw20HyCti4z08R/FML6oMBpvq
	gYwSWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjtb7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 02:47:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3418ad76023so2184960a91.0
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762310822; x=1762915622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEgKxTzFP5wtiwCINthvDjzT8DEp1xPRg4SO6G8xn2c=;
        b=KZtPKBfODGIIQOxfPmbpkrCfbVxpiySeKFx4pjZklewiKiDxdMpxvCc5nqiXbTJwRD
         XKUQpPEQ/MLx4bPya4bY/CwRzCnqCGZRIXK2kMAHVlINz1pRfft1FA18o+iL411c4wtQ
         wqU9YDirl/th16hLKBmC43vAQj72dgZG3DVxkMWpY3IAXmIJhvo7zssKwexDdh+gw2Ee
         5y4DYXGAKDqbS5XvSxT5VErZ84PNqFmEsHYfO0FzzAAfABQKKnoy+FplADkqLLyPytuC
         UvZIPZ1cTqdqMPvoJJcPvGxXLZXu6AjAEdIYhqDQMDXcb6xouWx25K4pFsdrFShUd9Qz
         /MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762310822; x=1762915622;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEgKxTzFP5wtiwCINthvDjzT8DEp1xPRg4SO6G8xn2c=;
        b=BHw9g5gFgWTXPyomTKYSR9BaI6sPXIL3x1zBmX8AJE62i2E1bzvNu1Uk9L2wDGXbPA
         nmN0VXeCw9lyGrMXPJwycgm5vVmK7shdTaoUl7HldxdCUZvW+elHMA2M9NpXlFc/aKF/
         KYgVgBs1KPwo9qAm40ftGH1mqbRhwG6ypKLGVfoduxEkbIblCcHV3b0AAqwIQPrpfutj
         Lxu0mZ2IHMQ5Z/Kl/T9tGwz64YvWvCdJeLyJAzNJRll/xBoxJPeR0viEWdIvENenlHsX
         qkEH7z4zGaU2aJzYW7sPMRpTu3rycuyqn6Zn6LVFrOLB8krHbbHcGeHc5zu2V9IxG5Xs
         AILA==
X-Forwarded-Encrypted: i=1; AJvYcCWtrCpTmp8QbFLIAoXVo9sOwIM2j4sXQCOyNKr2tye8vb6CPn/8taXfy/xQ1Tmx93nFgyYyiZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzphLeRBmEUKaFt0ALXXiWiw+RXMPkz8lIHh7gDsLeFldClT45X
	N3svGAxzW9mVW7xG+cskiYXQUqtIk+/I0X8sI8lIzCZjJ3/QbkUEJlT3+1KGftu4V6SyAlS7IyH
	gdPrlP3KaQVqgGtX4beL6jhZ9Xr7saZPNiBUxSU0PKx3oxZl21t7XBswLaVOKMcAT
X-Gm-Gg: ASbGncu2FCMCn7cJVBdiEzg7QUYBbBv+eNKCoav3JzMcLZnQu4AmR2FQScwCgwUwsg0
	PCYTEFOsqosEIIIVpKxQ+2FmLu7YhqFBeYfc7CeHJLj8HFcV8py48ApB2qK5OltfobkLayuOSur
	/Wo9wi/55ApXKqv40T7qdlVYap3ga7/1RkeytIpfI8M62r2j9DUkWFyTezSntr1POsDkEiX4bB9
	4jJwG4KVz7l/55/HgUbOKslcyjPdrGo9HkWSt6l41Lr7FOQJfwMdT916HnVH137PiKcjld+TnC/
	yDXx5g3hLyqWBSqM0L/5E8prfxUZ/rBMDKmdBh+oYHZXN0hnrnaB7WesqnpquEw3rSsOuU34pG/
	0654RTfKgsNEtbaixQapln4WRzpX9R/uIvfJ1/9YNk+pPHT/OXftcEWyvsCD8fk2AEK2pz50=
X-Received: by 2002:a17:90b:5350:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-341a6de83a1mr1783543a91.26.1762310821994;
        Tue, 04 Nov 2025 18:47:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuwMno/jN7iUuFKpQ58L3wuOLckMwb2hS/UjoC4WxCpQxVIypLOXTOb+caLCW75bcojVp0Yg==
X-Received: by 2002:a17:90b:5350:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-341a6de83a1mr1783499a91.26.1762310821509;
        Tue, 04 Nov 2025 18:47:01 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f942a9d9sm3829624a12.33.2025.11.04.18.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 18:47:01 -0800 (PST)
Message-ID: <9830e3fb-3f08-4343-bae8-07d446f86173@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:46:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 5/6] wifi: ath11k: Register DBR event handler
 for CFR data
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
 <20251104162633.3007874-6-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251104162633.3007874-6-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690abaa6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wcWF3zN8gqulG0AiaMQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HSRMHOEtE8mlfq42K98UaM7-V2MG41ba
X-Proofpoint-GUID: HSRMHOEtE8mlfq42K98UaM7-V2MG41ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNiBTYWx0ZWRfXw0vvozcJVPdt
 52d0Vi5HbNRYhkYszqKNbXx8MmSioUThouQXHnd98twg5uDsvDkjomgeRJoGAafJatP1ycLwmJJ
 7uIMX7EDtQdMrg3KCYADKDWGqZ7jrFjEqL8D5Kb92hXxgrRGWbPOYROehMggEicQALvyQxACJDx
 50JB7qxzXP7381lOLldFRByxKn2Z1Bf2fxSYerazXKGVgqpAOuF6Y0mgpoZEBXmHgcpBSAZQBpK
 FSik/FaDwG7psa30+iK7/fukDa/v1rOevfGBTWcdLGZE3mFbdZolBbRWe22yjMQ+72/1ObZ9QiA
 +2ZwGREblz2GmPqnK3VjiNkVF6Dz1sONXR388XaqyF0DImbsUYEx+vVzMGuG2TlbiilhNvSPlgO
 60Yt+vVlRsPgrGm/hEd3tJ3NsXsBDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_184703_383116_907D3DAA 
X-CRM114-Status: GOOD (  14.27  )
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



On 11/5/2025 12:26 AM, Yu Zhang(Yuriy) wrote:

> +static enum ath11k_cfr_correlate_status
> +ath11k_cfr_correlate_and_relay(struct ath11k *ar,
> +			       struct ath11k_look_up_table *lut,
> +			       u8 event_type)
> +{
> +	enum ath11k_cfr_correlate_status status;
> +	struct ath11k_cfr *cfr = &ar->cfr;
> +	u64 diff;
> +
> +	if (event_type == ATH11K_CORRELATE_TX_EVENT) {
> +		if (lut->tx_recv)
> +			cfr->cfr_dma_aborts++;
> +		cfr->tx_evt_cnt++;
> +		lut->tx_recv = true;
> +	} else if (event_type == ATH11K_CORRELATE_DBR_EVENT) {
> +		cfr->dbr_evt_cnt++;
> +		lut->dbr_recv = true;
> +	}
> +
> +	if (lut->dbr_recv && lut->tx_recv) {
> +		if (lut->dbr_ppdu_id == lut->tx_ppdu_id) {
> +			/* 64-bit counters make wraparound highly improbable,
> +			 * wraparound handling is omitted.
> +			 */

I was meaning that we need to change to the common Linux comment style which starts with
an empty line:

	/*
	 * your comments start here
	 */

> +			cfr->last_success_tstamp = lut->dbr_tstamp;
> +			if (lut->dbr_tstamp > lut->txrx_tstamp) {
> +				diff = lut->dbr_tstamp - lut->txrx_tstamp;
> +				ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
> +					   "txrx event -> dbr event delay = %u ms",
> +					   jiffies_to_msecs(diff));
> +			} else if (lut->txrx_tstamp > lut->dbr_tstamp) {
> +				diff = lut->txrx_tstamp - lut->dbr_tstamp;
> +				ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
> +					   "dbr event -> txrx event delay = %u ms",
> +					   jiffies_to_msecs(diff));
> +			}
> +
> +			ath11k_cfr_free_pending_dbr_events(ar);
> +
> +			cfr->release_cnt++;
> +			status = ATH11K_CORRELATE_STATUS_RELEASE;
> +		} else {
> +			/* Discard TXRX event on PPDU ID mismatch because multiple PPDUs
> +			 * may share the same DMA address due to ucode aborts.
> +			 */
> +

same here

> +			ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
> +				   "Received dbr event twice for the same lut entry");
> +			lut->tx_recv = false;
> +			lut->tx_ppdu_id = 0;
> +			cfr->clear_txrx_event++;
> +			cfr->cfr_dma_aborts++;
> +			status = ATH11K_CORRELATE_STATUS_HOLD;
> +		}
> +	} else {
> +		status = ATH11K_CORRELATE_STATUS_HOLD;
> +	}
> +
> +	return status;
> +}
> +

