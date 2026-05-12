Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBFFCD484E
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nOVCL/9tt+FInVx9R38fMMLDSnoK60AMq8V0QYUjeo=; b=geYccB/t2hrqifxb/Baje2B6m3
	FRIQHcQw+JQUMwCZ7EZwyyFzsSbyVLPEUTE3dBXN8P9S9l9paaXgQxwJ9zV5Gi7YB7YP7b6IjUmxp
	X5nvjcEv+kLdhwMTqzLFdo8qR2cLj/nf2Gyfkf7sFkJ5yuJvPNprlulSMvU+sXVdh4O8H65xThGDS
	M5ICm8urMmYFDbNnWrAx3LBJFaxBWIrZmToNX18zD3hoePhaqFbWE3bieGM5xJzomHDgQN8gfUduB
	AkOCBocKiymbybA4PXcQAQ5+jGqtUmm//CUg3egiKZw7v2UShlzX5UzUHex7PLi/Gd9Kj46/xRWMW
	v+OxAHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgco-0000000Fm5j-3Jnu;
	Tue, 12 May 2026 06:29:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgcm-0000000Fm5K-1mCu
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 06:29:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BsIN2172833
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 06:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nOVCL/9tt+FInVx9R38fMMLDSnoK60AMq8V0QYUjeo=; b=jWvtS6hgJM725QLn
	KWV4w9cADpqkRltOpMl2/CDsmyzZnJDF5vCB3UbesQaO4DbAsR+dL0Cw2T97bIJi
	8OSMJIWSvPZHPoP5Rj2X+6bJGVsbhiK1d824WbXakWO+MNO0YPwybPeKFAPOzzPM
	x2M10slANvezixQBkrK/zgYuEo0pITsL3XYsR31g3eBSTY6eDS6p1xywH69iBi7O
	94a2D+v4uwiyyWRuM1Lyv2wTMGG0cMkojJjvUZbEsHmHjmBc9/CI5RHDVeeqiwsV
	HRzwaP62g1ODd5LNI/GPWNUv101DH87hvZljwOz8vMKSvNsgntI1D5wO3Hjug5Bb
	3pxxqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj9un4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 06:29:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc977e6aedso26116585ad.2
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778567386; x=1779172186; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nOVCL/9tt+FInVx9R38fMMLDSnoK60AMq8V0QYUjeo=;
        b=HZiaYdvVXsQLKlsOSlQnFqHFPOLjjr4DJCUEpDECmOjeqEIglxwQciO5xPpikQcNz0
         PHfWAaG0hTBXwQarMupupuUtIcwpaF14GpWY+jeoOhGBcOIvukpG8gWUYDVo/ypZ4wTe
         VA3BLyVFbXDCmyOfehz4656SNcUobO1PBAX+SzWfgeI+Dzyn0jF6ESX26F9Lt/xkaz6e
         WAB+RvMlzzoUJOcp+uPMfmMdvsONIbdDSnXIk00LCl/JE95djo0L057VUBifqjVyKtxM
         QsXij9hbT4gGYHXCS2IHPBdtVipSNZlaQfFA+jArIwABGhySilK4tRItq7ddGyQJdOd/
         7ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567386; x=1779172186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nOVCL/9tt+FInVx9R38fMMLDSnoK60AMq8V0QYUjeo=;
        b=oTXyKjxwRaAc11u6VQ+DAULai/fSwmCl7ASD12f8JEMO4xqZODSQ+hgL3C0sfRxlKT
         dQaZEhF8/IKD8UeoN/aGetklIVZbGRSZjFHFT1u90+S/5LFlIUOUNnBHLv49iu29ew1O
         bO2qICJxzjQmdpiAYdOAYjLr7SDyPquVMzdwfb5oswLXarTBHnUomyr1ipXoKLBBKBtx
         xooC86WrgUkgkDS61Vf1qg1ZyjhlTPNSQlcvfg4Sc+Sa+u9HnFqeGH9a3Tw4TKih3gvf
         5QFUEIZyfAye7U2F6M7GXHOzvk+zc4wCXt3CHoyVpFNyUw7Mcvqa0BSdmHGy+eh4ci0R
         8aJA==
X-Forwarded-Encrypted: i=1; AFNElJ/5o65LZYay/xmeyMIVVhrxcXsPp0FuFDP5LdFRjCIANGk9EXfWIYX5ZpSVWe6vCEbU5tw59v4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJThTypvSIIF9LaB5EE/ZAp0Hl4FE0DBG7QexqgaGYZkPSnBj
	QOYkjv2mNqAHa0/ZLkhbbOA+728dU+EHJ1TLTd2vFzrOaj0zlW65QQMWdltCRsq+uEGnJJNLMy8
	B0CS84I4o+no6B91jwfCaKY37wi8M6CScouK3Y2t1f2SDUAGshy6569qEN9I1QgOc
X-Gm-Gg: Acq92OFAxFMZY3tS/yq15tFgCtOobYFXGS80MKj0tGO6WdmH3gWb1h95nVYhnbZUhH/
	XKk2un7q3kOswaTDO2ctwntwxtqG6mxaxHqGYL+ieD0plJag/dNV3ypFXSYaBCpW/f1IGm3aeKU
	3XNJ5hVDoMPP6hEYjZ2vwExq/h5rFqpZ4J1FujfPlG/b/2WD8tVOepFT50f1Kk6V7khifk16Hoa
	YAG7UzLJUOZwlODjjSYC/rrCR99Il3cMWuQIdrXL3/kq3W4ei1NVBztbmm+tzcgOeYU2oBUn+XZ
	PMVtXBWjrfCUfazgzkZM00j/ba/81JhO3MY+x2xMu01jW63xTKJevWKTYSOZKVDWeKSY2xuTHYL
	7WDQDem9fxCL6Q451TfGSgUlzfenslj1dutSUsTDWU0J/2kg=
X-Received: by 2002:a17:902:ff8e:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2baf0dd594fmr173790175ad.21.1778567385952;
        Mon, 11 May 2026 23:29:45 -0700 (PDT)
X-Received: by 2002:a17:902:ff8e:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2baf0dd594fmr173789715ad.21.1778567385398;
        Mon, 11 May 2026 23:29:45 -0700 (PDT)
Received: from [172.20.10.2] ([171.79.60.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d4094fsm124649425ad.19.2026.05.11.23.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:29:45 -0700 (PDT)
Message-ID: <32ba727a-e4e9-4895-92ea-2bb9c61e491d@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:59:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A4g5NDs2vkYxkKQ24L8sL7l8pMr-Mu2O
X-Proofpoint-GUID: A4g5NDs2vkYxkKQ24L8sL7l8pMr-Mu2O
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02c8db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=roY0INCFEICOlP0VhbB1ZQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=4RyH2EuIL7uwbwVYth0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2MSBTYWx0ZWRfXzL7I8TloAMjm
 j6BqN//fHlOp21X7YKt1MpdJ+z22ztqmnEI5dOsIZCgmzCTtav1Mfvc0wMKGBit0vfjwr6kG8JR
 IvyjH/Wmb612XL3RKy5DBwxBOGsq34exDnFySK4jSJEzaZmPqFIoXgXMUN6diLrWe3UDLmFA5pI
 z2TTMbyay1KZWDsqeNnfKliUGT3j5J3XgkfYDmQVnT7NSK93STzDMJCQDkoziEvuVokMNiEE8MQ
 dVITpSTi1VbWaorEZXeeO/TprSBO/bV0Vd3InPYNVi6eOPpAyhyT8Ysl9wnNbmUKJaIC/1tHnTx
 3FlTr1IpoJGkQ0P+oUyacg2B7L/yZ9WcH5E4CpMhu51yduZVHsw7CNLRTPMRJuJYEdH4oZYAs1N
 p4CoZmaXeaVEKitd9fwbSeIRGJJGIxkXD4QZwKnAjNR5Ab7GiCb3+JJHW3W7HjuSFCLu0WXzo/N
 +S7rhAUscQzsmNdrj1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_232948_589957_02B0B39D 
X-CRM114-Status: GOOD (  27.20  )
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


On 4/24/2026 3:20 PM, Matthew Leach wrote:
> It has been observed that on certain chipsets a peer can be assigned
> peer_id=0. For reception of non-aggregated MPDUs this is fine as
> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
> based upon the source MAC address. On an aggregated link, the mpdu_start
> header is only populated by hardware on the first sub-MSDU. This causes
> the peer resolution to be skipped for the subsequent MSDUs and the
> encryption type of these frames to be set to an incorrect value,
> resulting in these MSDUs being dropped by ieee80211.
>
> ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
> ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1
>
> Remove the null peer_id checks in ath11k_dp_rx_h_find_peer() and
> ath11k_hal_rx_parse_mon_status_tlv(), allowing peers with an assigned ID
> of 0 to be resolved.
>
> Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
> Changes in v4:
> - Prefix subsystem with 'wifi:'.
> - Added the 'Tested-by' and 'Fixes' trailers.
> - Link to v3: https://patch.msgid.link/20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com
>
> Changes in v3:
> - Clarified that the mpdu_start header isn't populated by the h/w for
>    all sub-MSDUs in the commit message.
> - Fix second null-peer check in ath11k_hal_rx_parse_mon_status_tlv().
> - Link to v2: https://patch.msgid.link/20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com
>
> Changes in v2:
>
> - Since peer_id=0 is a valid condition on some chips, remove the guard
>    that prevented the peer lookup.
> - Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com
>
> To: Jeff Johnson <jjohnson@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: ath11k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/net/wireless/ath/ath11k/dp_rx.c  | 3 +--
>   drivers/net/wireless/ath/ath11k/hal_rx.c | 5 +----
>   2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 49d959b2e148..ff2c78a4e5f3 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
>   
>   	lockdep_assert_held(&ab->base_lock);
>   
> -	if (rxcb->peer_id)
> -		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
> +	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
>   
>   	if (peer)
>   		return peer;
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
> index 753bd93f0212..51e0840bc0d1 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
> @@ -1467,11 +1467,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
>   	case HAL_RX_MPDU_START: {
>   		struct hal_rx_mpdu_info *mpdu_info =
>   				(struct hal_rx_mpdu_info *)tlv_data;
> -		u16 peer_id;
>   
> -		peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
> -		if (peer_id)
> -			ppdu_info->peer_id = peer_id;
> +		ppdu_info->peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
>   		break;
>   	}
>   	case HAL_RXPCU_PPDU_END_INFO: {
>
> ---
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1
>
> Best regards,
> --
> Matt
Reviewed-by: P Praneesh <praneesh.p@oss.qualcomm.com>

