Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3414BCCF9E3
	for <ath11k@archiver.kernel.org>; Fri, 31 Oct 2025 02:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=up7h5Rt3oEtrg2OPL4ITn4omkUSMHi23cUrvc/cU9zc=; b=iq/ZTqPxaGKncKZ9sd8nGBZKd8
	zZBYL8r74klg74VO4yyB6P+SsbuNqmYYSGN7iRiI6jNb3koSSLP5TTC3ujEuVkPVx7apCKuMJ9hGW
	M1/HlSV64L+u4wmAaOwMK0mzpG8wdAjx3rQCLLOh8xyeooxT49x0m1xe/RseOlLAS4tsfqOWmOWIl
	GalLMvmrXQCjmy2sU3YwHT+K5HXvr5OXk9bBcJtDxPjtRMrOI9Gl7DfYFXkptlg55/6Mb1D18gNJs
	UmFTYXkUfX5GK4FOAUBd1yEg4GD37In2i67eiSnPVVZEik5L0Xyuo5cFn1l/kt4BjZxtxMqxyNFZC
	ZF/jgWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfMK-00000005IOh-2glq;
	Fri, 31 Oct 2025 02:59:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfMH-00000005INu-1Ml5
	for ath11k@lists.infradead.org;
	Fri, 31 Oct 2025 02:59:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULCAgM872731
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	up7h5Rt3oEtrg2OPL4ITn4omkUSMHi23cUrvc/cU9zc=; b=AWpKRBBSfB8DS77P
	sKLF2ZXMWnIUYveMCqeKjWe+OSOH4BxMGvQKUGPpKiiNluwu6a5mIUl491twU6k9
	DGOXDVgtJH1VAVqA47j36Et6RDxDIrLuOwwh+Hmg++y65+pgplezZ3bBtVU90khx
	Ra3S3Rk7QcslNaKbQ22Ep1zoPcyOzBpbNLmi7+2jhh/3jcnJ9+kNw78eu9a/HXe8
	dGFZ7F1z0a5qHUFiayDaqoi8TXfr6gc03iEoV34I/aCAwF+CL/K+QaL99Z2gZCL9
	+3m59HMSNbHlHjASiWmNY2dDnP5MRsJD5G15EzkV69WTZiG7jdgQz6/YUrz6yWNb
	mTTnYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn0p85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:59:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340562297b9so1178480a91.1
        for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879560; x=1762484360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=up7h5Rt3oEtrg2OPL4ITn4omkUSMHi23cUrvc/cU9zc=;
        b=DZ9IW8fZN3++mJYJZpWKSc2xl/xe2jUKSODFhd7oMTzHi1Ebb37BxdAEOWg1cyzhtx
         FSL3hRRXtOBj9Oafd/xIEn7eKTT1y1yNm5Wnun627NLmz29/MvlP73HezN8CpPA/6lEU
         kk5P6y0T6QQ/unn/us1D1CaY2ESUTnANhlS8G+/XjoZdlvV50XLdk7G9PiKMBPeXnTSx
         TcDHQ/3d70xpcGnGNvTkeOd5xmoP2orKyIXe+B9tbFK4cowycfK1AwfT9yUJ/qIeMiK+
         c980Ui84p0JbUuGtmTUcNo4zq3nU0ThJOVuwbbqHZGNZSs4Hxc9mxapicmh4K+4zgQOb
         nczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879560; x=1762484360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=up7h5Rt3oEtrg2OPL4ITn4omkUSMHi23cUrvc/cU9zc=;
        b=DMs8MxXSNlPFnWuXq1ccPSO2qsG+iQcabt/VHPFdp2U28/zLqxE/t8oTpbkPYgHttR
         sE3YagNTM8KCMJJwvf3UBUg8vkvzt8wYOgt0Ldh7BFrxwXABn39MKrNNc9IhDugLMIp2
         4UJtmkMU/TPykBPamPxekoLrAudl7MFwg4Rm1BOiDHnRFIlt4IX+c5YPQuV3qlU51g0b
         ZVKR4f4+KKA/EHisNox8wx7jnKc7d6ezKy6YC7uGVVuvNmkp3fWsIgK46eiFjSEyXgj/
         TZf/RiFFOH1W9xgxJyCzozh6yeDbvAFYQcuuzx9FM/x7YXDskmWggIk239rqFZ1VZIvf
         N+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWrT2fpVmmyiBzhKKx9dWvAgPzZRM3lRRelVOs4h/VQEMY5sIZHk3itCToh0MPfREUp1rk4aVI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/2PZ3jsb2/0Ph3q4hvP9OTlkPWmJDQ22pa3TinaSCxbtRHB0G
	BJqJK5/XDOgTOunbkjoBfy2Tvu3HNZMcOYUIHzrtyn6sSYSUSUZQXTudhTCrOiEu3sdrnY0gd/K
	cFMAvvkEWp9MzIDvq33XAX7vxg84VpS8ivLlNr5klm4tne/f3KtLtVhQhwoTohkQx4NUtvYKqL8
	M=
X-Gm-Gg: ASbGnctjrbiwUA7FgtTYdu7e4DtRDbb70K51isOzicaBtFDjzYA166mPHY3ot5MHa/g
	z8PeSS+betO3Bh3qFjakvWfbxuRbiiiJBQaj6oP38/LtiNK15/az5pygCAzdc+Hg9Bdu/f+O+9X
	QjRbquNy61tyn6oqFoLBxqEN2RURJNwxoCpSZnTo7B3wXS/fG8vmCsSzu6ZH3/1FlJvoYApMjdW
	Mr/iOHtTlhzBqnAY9jXCrkThMf7tnQ/qRUfMi0ZR4rdqQeNNq9JDz0EUNUCy6OUz584vu4R+X2t
	5RPItpjbUeN+Be8oc/Jeb7BJu7miFjhhWjAe9zCl8o0K739bIFz61ov3/zgOOxQuqm2Ro4rz0jW
	YZQ+1wTYywY6QWQAJRtq4ECiDvM3WVHEruGNOT6qkDXtkvVXuYJ0lvs5O0TS9jY9XqK0snn8=
X-Received: by 2002:a17:90b:2247:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-340813cec4fmr2682139a91.13.1761879559939;
        Thu, 30 Oct 2025 19:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8UZxZTzI4+McEAYXu1qgEJFOfy6TCm9B//jkN8UZOlDMEj9SKaRXt8i5G8maNfGXC5APFPw==
X-Received: by 2002:a17:90b:2247:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-340813cec4fmr2682106a91.13.1761879559465;
        Thu, 30 Oct 2025 19:59:19 -0700 (PDT)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f24ef0asm590142a91.11.2025.10.30.19.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:59:19 -0700 (PDT)
Message-ID: <0d7e89b1-b676-434c-bea3-fbf6f5788448@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:59:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/6] wifi: ath11k: Register DBR event handler for
 CFR data
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-6-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030043150.3905086-6-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=69042608 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=73josGCDwRHW2riM0nMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Zzrm3IPpjnkCV9qIp70fI6QJ5EkvqHq5
X-Proofpoint-GUID: Zzrm3IPpjnkCV9qIp70fI6QJ5EkvqHq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfXzob0HhKURokF
 eVCpqQ4m3S73BWC+xoPBe/Wh78CPS/5X36f2KeiU5sNbhfnPtw+R/F+N8dyze9RUMeDlA7G8FpT
 1PFUCDlcx7Ync7RkIyJjKNrk2WjURF0TwfTXJzNsPphMbDvdqX1hj8mxcKDbf9bT2bxGkgIzhEd
 J3rZnSu36cXASgpV1hwyLfrJcdnlbgGysHPDufTJHRNbmaDWIEsw6YSDd6MkLQlrPMs+1YkXcUH
 0gEE6LytI4FRD/MQbqwRr7QswewGgnjTtI4Eqbde1XbiS+yhQzXOMyVG/iWLfixjXw2kmWjVQ86
 gDQV1XHNLYxSnJIf+EVoAA2o2gjhkPibgYrT7Ja3M0f7MY/pzmE9PFLZvyNFx5dJX+cSKnZr39J
 WmuBX9pXKC/UhS2rjUoP03Or51L/sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_195921_442766_60F447C9 
X-CRM114-Status: GOOD (  18.69  )
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



On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:

> +
> +/* Correlate and relay: This function correlate the data coming from
> + * WMI_PDEV_DMA_RING_BUF_RELEASE_EVENT(DBR event) and
> + * WMI_PEER_CFR_CAPTURE_EVENT(Tx capture event).
> + * If both the events are received and PPDU id matches from both the
> + * events, return CORRELATE_STATUS_RELEASE which means relay the
> + * correlated data to user space. Otherwise return CORRELATE_STATUS_HOLD
> + * which means wait for the second event to come.
> + *
> + * It also check for the pending DBR events and clear those events
> + * in case of corresponding TX capture event is not received for
> + * the PPDU.
> + */

please check comment style

> +
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
> +			/* We are using 64-bit counters here. So, it may take
> +			 * several year to hit wraparound. Hence, not handling
> +			 * the wraparound condition.
> +			 */

and here

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
> +			/* When there is a ppdu id mismatch, discard the TXRX
> +			 * event since multiple PPDUs are likely to have same
> +			 * dma addr, due to ucode aborts.
> +			 */

and here

> +
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


