Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D8EA71A4
	for <ath11k@archiver.kernel.org>; Mon, 20 Apr 2026 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xXtD8l8YqLF0HZdr+8U1U57kN59Gw5OqLqwwXN9jN8=; b=yStrdKHoLRhjs0UUwmNCNiBIsp
	fagCdAKN5wD9pQkJ/NZ18pET8saFg6j32W4vOkNUpDWVUuwySSaSsOJc7+fiBRmtTeWfWi7gtm8MV
	Szk3aJmBfBGMoLTOqukg3dq2kpgHJqFtJviYUtwlmnu5K3RVtaAVYR1uy/tBjNJ8f2eWJQ/sR8qKC
	Q1e74A3TQhn3pkJKQFiQxkidoWEUYjLFmB47VcpSPMLAEi1Sv/J7hIauHjS26f5y3KKRI+rpDG9xA
	9Lwcug9Abht8lBNVTQX4+ezv92RinoarTlsSq+7+wZpgmTFojXvZnh6Mr1GHojHOM2CyPNgozUJiJ
	tt010lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeH9-00000006Jt7-1VX4;
	Mon, 20 Apr 2026 02:22:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeH6-00000006Js6-0QtR
	for ath11k@lists.infradead.org;
	Mon, 20 Apr 2026 02:22:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K0cXY82379609
	for <ath11k@lists.infradead.org>; Mon, 20 Apr 2026 02:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xXtD8l8YqLF0HZdr+8U1U57kN59Gw5OqLqwwXN9jN8=; b=WnUfbfkWTrTf2ikC
	6sqd2t3rhWYMO+07Lqwi5JWBB1anc2qy4nIQOYE5sHOTPlcIifznNfziScfRRrpe
	lQvB8TjinNgA0MyrFDtdXb3WNDOCM2192TrIuRPHUii6uCzlwyW1uiNVFv2+HIkc
	SKLUE0D34Iw/R1ykfYql/qAhBrjfxRwCMgMQKopVvsCI2YB5yiZe5Xz5b47uhciq
	q6Kdq7a6bId7Al8m4vGz+vJKSXZpfEflAV3AOMmGnZAcVHVDKjjcZlKViCAYljoA
	YspjB3YZZhqmDAmkCTL7b3uKyL0ol1GnSKFeWienY3umS/gfJt9VYwDH4MTIAZnd
	MKOFyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3tpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 20 Apr 2026 02:22:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso6014161a91.1
        for <ath11k@lists.infradead.org>; Sun, 19 Apr 2026 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651730; x=1777256530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xXtD8l8YqLF0HZdr+8U1U57kN59Gw5OqLqwwXN9jN8=;
        b=AZejSnbVmW63ZbIQVnIX6piTcTlT9NyeKQAZjY7JTZD1GkbSE9oknAHWa4ctnlZjia
         hugMW2ZdZbUay3mynKSYgMTN7fCct0oYFqc0iyGFnzywsZbtIhXi746CK5gBdV0HPJZ7
         F91Q3XNIX5/JzLWpgLHYG7ex4krE6JVxDV4YU8/QhtPQNbEQ9PBT/vu/4j+gzoyRS/oD
         t3GFi43Nih6cTenvKweXfv+gm03o+WrZlTu12+0o7+UHx7kvD7xaVPAwKEtJZN+lXF8V
         MNHX+jeEtG3K1DrpNf5qyzTexRxeS55uVOvEWOoBKaUsrzUp4YrH6uMID0M7r203ZKor
         SZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651730; x=1777256530;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xXtD8l8YqLF0HZdr+8U1U57kN59Gw5OqLqwwXN9jN8=;
        b=Q4uNSmHuQxvGS8+W95nReYH/Hv4ly+SXUzjjzXe+H+jVwKshc6GTMklRasb3vWZB6e
         fXJz6P7x5XXPCktOeCvV0yLQN2wQmouLHB5aTpLFjwe0/zyxIxVHl7WpNnaCMsGOau0e
         23eOuS/TgLlTagRk1EGk15QtYV+PYA4DiS56nEvC0HdczkgYWCo3AWRv1fJIkifcVILw
         bX2WOeMcEcbIM2eNNSRsX2ornJP7Tq+grDnpCTRQ7nDww64NIBrmyzwCcQj/uTNPlYwi
         2v4Y6sSMjOEX2VxQ6nPDnk1M6dM2BsZU5vAGO3QD5WccjvfgxpdtQvFdfyPUN3Ld3Rx7
         J+1w==
X-Forwarded-Encrypted: i=1; AFNElJ+mM4ZGd4j9Mn1XVb9iFAJVsYmZagdskxDEcsawE0MjBnWrG9Df8xQ3rY7mzAaHY7bclnp/szY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVN6bhHH7Aa8c20YfSu+KvOFjnk1Zs3JI9Dl41bD5EYz5HnLo/
	NIy3TU6IsDiyYIsWKiRilp3lKFau7k0OaNrfZQ9VnKa9L2P+tJqNkfxiJj87Odept+NXV4DMdVs
	L91ujmDJBDBE/fx7sg9Qr3H5OINeIGV6wZHYd6ja2uCDSjdepZC9qMZevZpSQJgcu
X-Gm-Gg: AeBDietMkyaibpf18Z1pDVcOAwJ5OxwMLVOcnwGv9+FXHJ/Lzd8+Ioi/riNlksr/Uc6
	nGg7edKoASlF1j58xVthYyLISSy+22MB8fh98VUvytL+qovaUzhmqG/0awINa5SZoqDchb1dGue
	iKnMXwnW9PZbUhbzlpoFSfNpGt+I+rqfHhN1/zfac7xhTINFs4iak3lXcp0PE/5iTFWryz5oTfg
	Z/HJNyedOS77/JEHid3tk9jOEVDqAT56r+EJLTEy7ruW6oJh27XdBk1fwmLhgFO7G9wNL9RvcvQ
	dmnh8o1kRUcMcXENgZU6rAf16NxxEHzvI4gi5rvxa9G/bqL0tth5rDcFhn5o4ixQbtnawlrWguA
	YwN9xjeybKE8uC2DhuwYoCt1y4rSp0/xKEpgiSKX0AOyjNR+HgkS9dzMaZjab9sok1hCg2opmTZ
	eovYxt62bVE0y1wgtWj4hXQE1XWlWCaw==
X-Received: by 2002:a17:90b:1a8d:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-361403fa894mr11911244a91.12.1776651729592;
        Sun, 19 Apr 2026 19:22:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8d:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-361403fa894mr11911243a91.12.1776651729112;
        Sun, 19 Apr 2026 19:22:09 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb7118esm4336837a91.4.2026.04.19.19.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 19:22:08 -0700 (PDT)
Message-ID: <44c5e877-15eb-4a89-8498-328b77d27d0f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:22:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ath11k: fix peer resolution on rx path when peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfXzXF0ulJW4bPg
 Zsz9hRtayDBzDmx+rIknmAd0l90/hHFw46QH5qqaa22qczxdqrykaeOx8hdsh8RqQeF+YXFLWpt
 hGv75a8heXw9D6eEqyfazIgFge97gj8ElQbP1EpiY7u4V5ocTh/5C64zT3bt6yXuCAsklDExy8y
 VF0BeMDwyFFDjb4+uijmAibdRuZHj1wiWynRCu/AsPS/GojHqlHbaiXbNNF/zGZvrqRoGoKnmVD
 asZ+MMYhzwLTCHj8QCckhXXxN1SzTbayxfWc9cfCCZkOOkn8d74uJAr0Iu5nX8sp0ekAH2InSMw
 Ms7absNJkt0HIl4QMiIOo8CEWSN+jz123usv9HAkHJ70Vnp1nibo786TY8CugkeUcwCnEU8QR7j
 Jp2QIkCg1A6I4oNmnuRiFlVDFtp3G7xM5MGnedyryAM4qYvrkg+U/iqO1S0JlOxZq/LqmOs77SK
 AGXVR3T0vZdzeQKgZMQ==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e58dd2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=H35CScFOu-zhalx1qioA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: tNmYow6gqLMilfPLao0YIedeDF24R2rR
X-Proofpoint-GUID: tNmYow6gqLMilfPLao0YIedeDF24R2rR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_192212_174832_DBE7ADC4 
X-CRM114-Status: GOOD (  25.58  )
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



On 4/17/2026 7:07 PM, Matthew Leach wrote:
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
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


