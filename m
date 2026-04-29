Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C305BFF8864
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDWgIDq5XCnUvo9INAHbb5YVPgRJthGn8S98sJx+YIg=; b=VWE1HQnl50Cbdq8GNHqWSI0rZ9
	Xyqjm2KyzjqTfcmgp+Bp+Gl/hBuZB39wWDv4g0e4JDxmnkztScx7cx5kto0LmBtfhgvPBfDFfeXI9
	q6ofRSMcwnw9vdAmsMVTuq2NeHn30iicD1LP7Y/z3i1vKkHy+bDmfX0ah+FuYpWAqa7GnVTIYaJDS
	XjIOzPq4tCmtqd+PxU3MO96deQqHBzBUK8W5bClXzXqm4NAwpVjKHY275sxtqWCpv2XMQSFV50DDY
	QD35mfhkEOV7zRh/kPz1Kuw41WnvR8TbfST8lQEBtnFuOiMCwaUE7BBDzbQv9pIbToNANvd7k37sh
	+NkWabkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzTK-00000003ANQ-1KLq;
	Wed, 29 Apr 2026 07:36:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzTG-00000003AMl-3apW
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 07:36:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZB0c1015347
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDWgIDq5XCnUvo9INAHbb5YVPgRJthGn8S98sJx+YIg=; b=prRYYcvWAHrxiQLO
	Bni57N/Mib0yWKf3XhN0nypyILeai5UBJeS5K3poYhFPOY2jQBaU8lPpUqolY57J
	SJcngiS5wzAkFS4La/BgyHINalMbDrFSg5Ok1HshSbcVup+M3fcd89UgfPUk1MXe
	wWEz4baRVV6VF0pclWim+8NhnlhplDCHUmbJT1/b7lF8P5lPtuwi+Rf010ds7lrm
	LVJDTK13kPRc8V+B2jxaCpY4ILmtGsNkv/oxL9dsQ0XEfQchT7rMuSusW9vxZMSf
	0r4KNs7sEH3hnp72Uej7z8nno6amO/u1nOGnXT+RdB3imr8RqoPlGXu98glXKBH5
	9AJnrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730tvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:36:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so4820295ad.0
        for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448189; x=1778052989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDWgIDq5XCnUvo9INAHbb5YVPgRJthGn8S98sJx+YIg=;
        b=VENMIosDzi4Q5NnDJJ+kOrgX8JHeuFK9JNkJxg6QWC84xnnzghXn+vm+cZqO6New0x
         B8bHxtfITVGl4kU9qsaLVXlGjWL0IExZPwNWbVPvXRb7SF2yVXmB15xcFV3bEo6fRmK4
         WhCCleEyn10nQNGlB+v0G4CeqLOddDX3VQvetb3Pzyj+5AcGsWdDylbus6iXCxnh9drJ
         0Ae07LaNts+SA6A3reTZRuJACtNqyCz+xaMuDOlkluskqWEd/+vMd3MgNhunb+tvkLBf
         Wi4gzMy2OeKoV6n1lXEk5aYpCw96pi6x3THZJHoGXUAilTDdQcxFPDkBkuHY3KaZv9UE
         LtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448189; x=1778052989;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDWgIDq5XCnUvo9INAHbb5YVPgRJthGn8S98sJx+YIg=;
        b=VmbdWQjFV5q+dh7VyViVH/8urEvpa2pbHu9SDZKTM/M2ePhOBr/khHuAs4t6AgTRmx
         rlOjYZBb+h57hwALfih8kxsFxEGWBWVoMppAs4/BC8PGpoCxnAqPKFTckJ9W0ctS7VFf
         fu/XlGwZk14PTDMY1sCcpUVTfd8ayBjoKY1LLHdfsqzffH0MgFvwAhp2MdscdoowUAS5
         u/wFprSSj1cdMo25fulihlZDSrmwCZxERAccJ4LkER5TfO7Fea210daVhtKGjt5EEIfv
         sdmpSEMnr6N6Fa5hNUvn7YeuKwzS7RKtpiATK1i2jCvxcMjAvPBnVIuhmEhrCuUNJPB7
         BFng==
X-Forwarded-Encrypted: i=1; AFNElJ8jb2m9FBab58JzewoIR/3+2o9K05w2wEr0WOdi2EfTdR1t0t7rQ1RZLY8pDNJ0vGCDDDYNo3Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tpCUzzYDB6LTZRYSdFQrgnsCcxo/QvQgM/6ZdOGPvbMt14nC
	EB3y/ZvAQZCcWONH5vJOAGSGdPjVdSFbB5g/A3Z1fASHP53v5DzUoksfY7oGFvTMPxg+Q3WLMV5
	GEcFa6EYDV8pylWqr2NVOOta36CZdBfMKvobidAi/J6PkLJMF3eA8bKOzbtAmyz9z
X-Gm-Gg: AeBDiev4gM4EufvGxTYDXEjWl7DRcbXKtkjWy5eOhEiAMrSMFjg+83nUqB4a0qX9Lf0
	QZLYQL2rfB0Z5cMTpL+qw50+lTvg6g0tuIDWIih+ZmVpUcG7DCOLJ0IuMWjvFgZLtg2xT9ERJNW
	B/Ib22792KUEnBDBgiAHYmb3BbClHxIKOhLE9mnFeNEyjyb3jzOKcYMAMg/4toscw21thmi4wth
	F8VIW2twXgs/XTdVqc2izxtdSeVMwT7MIL3KBOB5NGdyCIpFVucWd/l19x4jVWAZETxN5PJoTwI
	HxbQ9QwSuBPG46FEo1oUKb2UMUTICp42kpREbo43jAVF443eFs2Fqo+BF1CYZYylgY6oyBUx8t0
	KDaS0H3ZEjs5joVMukPuzmO548O0CqPXFWJzhJZxC4oWC4XdmsuLaBP0Ui5iJ5AwIlZE8pKZt7H
	NO0sCR9Qzm24q21r6zhNQxro6naoUyEg==
X-Received: by 2002:a17:903:3c23:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2b988188786mr19793565ad.5.1777448188998;
        Wed, 29 Apr 2026 00:36:28 -0700 (PDT)
X-Received: by 2002:a17:903:3c23:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2b988188786mr19793235ad.5.1777448188427;
        Wed, 29 Apr 2026 00:36:28 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887a6cb0sm13376865ad.33.2026.04.29.00.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:36:28 -0700 (PDT)
Message-ID: <530a9e0b-ae5e-48ae-a2c8-73152e2dd6df@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:36:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1b4fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=4RyH2EuIL7uwbwVYth0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NCBTYWx0ZWRfX7ZqQ3Jt2LeBt
 Aq/qMVkHbzMfp5cWM2l4zyd2APMg8XUll6KcSvqanaZV50971pNQrOnIPn/SI8JbfSwHbOiJ/tg
 pDdgKJYVMWA0m4wTKv7gBdT+ikyKF1fvNSSqpuAUkWx/dhwXZjNdxg/e3fTNcF34Fft5+keqEM3
 QGLyasGf+s9X2qyriOjBWlQADRWt8elBALmMzqoDnETp03qqv4NSZbHlDhTCXQzuSbGSo0Ex/Ji
 HFOE8Y69I22W12KhExZy53kkiQCV9qbhHqTv/TPaMXwz0GsnsA1OvxBeYK394eKFJx9N6vu/m8B
 101iRf7Hyjvf/zyYy3L0clhsMfPgHDUdjrcT+MjQZOMKGkDfZkfT/iNxiOs+xvukDHdhDTVRRtM
 tC0yOM9YzMi1zcNmtxvSuq3wUMYftNWmYX06g036dJ+UrLvjVi1JFqb8E/Q1jCbMmw3yZM66I5c
 2MimG9/eA22vxZk6Yhw==
X-Proofpoint-GUID: slhsdCZzFkS5BRxMXz-ufMmc4xMpUWkO
X-Proofpoint-ORIG-GUID: slhsdCZzFkS5BRxMXz-ufMmc4xMpUWkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_003634_911485_1750119B 
X-CRM114-Status: GOOD (  27.95  )
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



On 4/24/2026 5:50 PM, Matthew Leach wrote:
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

Tested-on: is not an official tag but is ath driver specific, so generally it is put above
all official tags:

Tested-on: ...
<blank line>
Fixes: ...
s-o-b: ...

But since this is trivial I think Jeff can make the change when he merges it, so no need
to respin just for it.

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
>   all sub-MSDUs in the commit message.
> - Fix second null-peer check in ath11k_hal_rx_parse_mon_status_tlv().
> - Link to v2: https://patch.msgid.link/20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com
> 
> Changes in v2:
> 
> - Since peer_id=0 is a valid condition on some chips, remove the guard
>   that prevented the peer lookup.
> - Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com
> 
> To: Jeff Johnson <jjohnson@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: ath11k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c  | 3 +--
>  drivers/net/wireless/ath/ath11k/hal_rx.c | 5 +----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 49d959b2e148..ff2c78a4e5f3 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
>  
>  	lockdep_assert_held(&ab->base_lock);
>  
> -	if (rxcb->peer_id)
> -		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
> +	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
>  
>  	if (peer)
>  		return peer;
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
> index 753bd93f0212..51e0840bc0d1 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
> @@ -1467,11 +1467,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
>  	case HAL_RX_MPDU_START: {
>  		struct hal_rx_mpdu_info *mpdu_info =
>  				(struct hal_rx_mpdu_info *)tlv_data;
> -		u16 peer_id;
>  
> -		peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
> -		if (peer_id)
> -			ppdu_info->peer_id = peer_id;
> +		ppdu_info->peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
>  		break;
>  	}
>  	case HAL_RXPCU_PPDU_END_INFO: {
> 
> ---
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1
> 
> Best regards,
> --  
> Matt
> 


