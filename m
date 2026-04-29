Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB9CFF8867
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxVEKYY0dWTGsyxKYcIlCqWw+5zr0t/mtNf6F1e0geQ=; b=Qa5M/JvH6bUNMEg625QItLRpo1
	I9pgTf/JGtvZS6JgAlRxPTJG3HB2ftyjDxYTyr3J/fc78ElerpsYepbt1hMnnkSk/u4GKV69SpzyB
	/NKHEb38/c7VP1tpW7sKEJBpDQw6A05kDY2bCh88hdtnp3n7epjKXPHhPoGn4wy4Khv9amBqkAJUJ
	jPcnf/CxKfM7ORmYkc6U3fYDgd1GS9DXf4kVySSD0PHSRiXAYplc5jIh/kAauVsXDZjj1EclV/Zwz
	Q9aOTG+OiO1/owvKCsdFHZw8c9d0TkFIcl1xA6TF8X813mVTztyzZB+fXr6LOkFJ3KyNM6Mr6gomp
	bOPwHK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2S5-00000003Tht-1urp;
	Wed, 29 Apr 2026 10:47:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2S2-00000003ThR-40Bf
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 10:47:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqKS1641536
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 10:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxVEKYY0dWTGsyxKYcIlCqWw+5zr0t/mtNf6F1e0geQ=; b=c27k3Ryx//VaQ5A7
	DL7wWwca+Zmq5GMroQfryHSwRzDUB25vBKdDdw6k8+2NeKre17Y4PhnlgjxUjGck
	B9agAIg4e/IzcpijX259856DwvhtzSY8COhX6s8wq+GuUBP6Q6+K1C4A/0RZVexr
	QPFlFtwOPJi6dG9dObEL/XdE4t1KWQA0/8iDJ2oB6tz5vKxRtAg0Hmm8HM1J2zas
	tBLr2TSt8S+jqi2aU7X3wfIBZsgQWhK7WLgVrNNEgRA7VAXzds9H3xcLu5KFmZ/B
	B+k6oe8wy2PM4MZVPqLbz7h+jh4cdeewXqjtvhy7ZJm6nYtCduBDqO7QTmweruxx
	xyhKyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj8158m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 10:47:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f71437218so8216107b3a.2
        for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459649; x=1778064449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxVEKYY0dWTGsyxKYcIlCqWw+5zr0t/mtNf6F1e0geQ=;
        b=GOoG7Cfihcfn1j1P04yZb1dPk1IHEvYGw/zeA/hqB8VClwBv8s0iBy45szKtJsC2MZ
         HmjwXVKbFaNkr6Hxhm2PVSYXSI1eh13UYTWkLntkBuxnCpuTxTG/7ypDjLRGkJLJniqO
         Vp/m2w+/fmNLCJyBqKDHJCXVGkCZJ41AdpJkunIU1vPneM0MXe7sucLdtlSP6/KX3oFl
         cIb7fUwxQSWTs4vTFpy/lVNydsB7yfmWjvbCicKOHtjd17a5o4b5RNnN4Il3W7YLZ7/a
         arn0OYSLKIqr7uL5bTMs9/EfvS6sc6Ct93EIzwfbBw7QtotToGaAEXcGXF6NyZHT5H4u
         F1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459649; x=1778064449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxVEKYY0dWTGsyxKYcIlCqWw+5zr0t/mtNf6F1e0geQ=;
        b=tPnBcoUk+B6i4gYuv6U6S/a/XuY8mvSVfjCcjbGw9USAc3XQdSOc1CJPXCGUzzjT9Y
         YFiw2tR/chmGUEk0bcsqavdCvC0r4OHwo3MgxtoBuqruAB4vTPpr4ILi67lERyi7zaPI
         Ym5TPzLbbRwYZlxpKdkBVPHXny/fkhBWwUEnpqoSO0knaIwPntPYTKMLdq9QmaGGiXyK
         vG2MVvAjc4+gJOIBWXFkYTANhbRzO4x6Tt2wlk9TTJqnAnkFh/g9Y5kLJsrAs/QXMgNR
         IeMFOUTjx+Dnh26mEI9kgRDYifQOvf1K/fkWsuReJM6LYT3TSVg0l3ZtYZ7xrHMbtvMw
         lZlg==
X-Forwarded-Encrypted: i=1; AFNElJ8rQNQuEjiDGFSGG4AjC2ybFEEBx2yD6GwGNH1RpSCPQRv6PDj/9LgbdGLt7buuWW2qLt3jWaY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzR3CxdcsDzwrzp7wDwMjnQct1MVVGvaOTKAFWdOrZrhtz7Wpd1
	3FcOd21wTa40LZ6OQWeo3OowmTzaNrDmT3+NKgTjYc70Bp8tdlHKhXAW3CDE8NSn7tq32EJVHGP
	rf1yb3nDtQ0dbXA8dMRXVTkgEyeBAyR8QapYW/10qTudZnRMza3fpL65gq1VX+AvZ
X-Gm-Gg: AeBDieu0BjAmX420nrZQh/tY4YM24btQ1YlodTM7JVSmyBk95Cohlfjo4IYvVllkoSR
	uER2XLeXoDv9WkfySWjLokln7eZkdPUYT21SK14TOYHitzDQZPnWyG3mTHOQXs5wnGJqeYXxMHK
	4Ha0ucjmJmZogAcXCVKjPxKBi/+y94+Tpobcaxr93jmbghoY9CEzhsGdNxbu+ojw6fHI/iAYgSe
	8CadN2BnBUchOMUaAEXOsVg0qqs/am/50DNDGw+kNSAgEGzZ9Qx56W2RZz52K8fFoecaBeJmieG
	gE9rxFldC/XhPP8Plnu0a4yIqLjKFCDf2XofB+yK64tj7jGB+zAcwkwkIkiqfUuIWcy6RNa8YcK
	t/+ZmAAlwT3tOLfOPH1TaRoX+z/yHnzWseSs6dDanLYhNFuNJkkGnlr1+fgba
X-Received: by 2002:a05:6a00:440f:b0:827:441a:c970 with SMTP id d2e1a72fcca58-834dda62f5cmr7028210b3a.6.1777459648661;
        Wed, 29 Apr 2026 03:47:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:440f:b0:827:441a:c970 with SMTP id d2e1a72fcca58-834dda62f5cmr7028175b3a.6.1777459648170;
        Wed, 29 Apr 2026 03:47:28 -0700 (PDT)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80df96sm1642551b3a.54.2026.04.29.03.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:47:27 -0700 (PDT)
Message-ID: <e248e911-d317-41ee-a590-1385c39ee2e1@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:17:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
 <530a9e0b-ae5e-48ae-a2c8-73152e2dd6df@oss.qualcomm.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <530a9e0b-ae5e-48ae-a2c8-73152e2dd6df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oLuMyBo2MCLNJdVov9YGefTL6AMrS0JH
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1e1c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=_3_nlreopyH617X7MHwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: oLuMyBo2MCLNJdVov9YGefTL6AMrS0JH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfXzjNkkX70P05o
 YFZXpybn0bUeYjaBz6MvKYlSPYwyQDGDEHaRR3kWr7s9Z0IQc4eFibCenAok0nK9hUGWPa2LaXu
 cMhH5QaFGyoAebUHUZgBwo5MJ6AE66tV6w+PC/3TtZyUk98HZPRdV7tzihh63+8DCf6BKl9+SO9
 yHQdTiXeqaRGB53Ra3tWrmzVWFZHaobAs4ov4rOO11GWug97P/XqneYL3Mxkruc4dHsW/Rt6gjh
 A6GG2AoX7Ya/ZvjInSN5RojZ77qgVM82aBqEI1C3PogsxvXGYs9KmMPBLWEKfoJFGo0vqPtXHMj
 tcFWLKjpGpsHDYSSJOog/jBnwFtPadXpLegy8UKkhP9xgHMvp3EaZeQYfAwfIwoI8mGMcfJ7+45
 VgT5VafP4vQN/gK5FVn9eTLp98g1qgxdH7qDCcKJTEZjE553OXG+vwapLJhlDqWg+Fcb3vYUt3u
 wLK0suCGNlD1FRR4D0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_034731_117563_B0506712 
X-CRM114-Status: GOOD (  23.11  )
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


On 4/29/2026 1:06 PM, Baochen Qiang wrote:
>
> On 4/24/2026 5:50 PM, Matthew Leach wrote:
>> It has been observed that on certain chipsets a peer can be assigned
>> peer_id=0. For reception of non-aggregated MPDUs this is fine as
>> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
>> based upon the source MAC address. On an aggregated link, the mpdu_start
>> header is only populated by hardware on the first sub-MSDU. This causes
>> the peer resolution to be skipped for the subsequent MSDUs and the
>> encryption type of these frames to be set to an incorrect value,
>> resulting in these MSDUs being dropped by ieee80211.
>>
>> ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
>> ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1
>>
>> Remove the null peer_id checks in ath11k_dp_rx_h_find_peer() and
>> ath11k_hal_rx_parse_mon_status_tlv(), allowing peers with an assigned ID
>> of 0 to be resolved.
>>
>> Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
>> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
> Tested-on: is not an official tag but is ath driver specific, so generally it is put above
> all official tags:
>
> Tested-on: ...
> <blank line>
> Fixes: ...
> s-o-b: ...
>
> But since this is trivial I think Jeff can make the change when he merges it, so no need
> to respin just for it.
For QCN9074, IPQ8074, IPQ5018 and IPQ6018, Peer_id 0 is not a expected 
value. Like ath12k, it is better to handle it through hw_params.
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
>> ---
>> Changes in v4:
>> - Prefix subsystem with 'wifi:'.
>> - Added the 'Tested-by' and 'Fixes' trailers.
>> - Link to v3: https://patch.msgid.link/20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com
>>
>> Changes in v3:
>> - Clarified that the mpdu_start header isn't populated by the h/w for
>>    all sub-MSDUs in the commit message.
>> - Fix second null-peer check in ath11k_hal_rx_parse_mon_status_tlv().
>> - Link to v2: https://patch.msgid.link/20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com
>>
>> Changes in v2:
>>
>> - Since peer_id=0 is a valid condition on some chips, remove the guard
>>    that prevented the peer lookup.
>> - Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com
>>
>> To: Jeff Johnson <jjohnson@kernel.org>
>> Cc: linux-wireless@vger.kernel.org
>> Cc: ath11k@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/net/wireless/ath/ath11k/dp_rx.c  | 3 +--
>>   drivers/net/wireless/ath/ath11k/hal_rx.c | 5 +----
>>   2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index 49d959b2e148..ff2c78a4e5f3 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
>>   
>>   	lockdep_assert_held(&ab->base_lock);
>>   
>> -	if (rxcb->peer_id)
>> -		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
>> +	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
>>   
>>   	if (peer)
>>   		return peer;
>> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
>> index 753bd93f0212..51e0840bc0d1 100644
>> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
>> @@ -1467,11 +1467,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
>>   	case HAL_RX_MPDU_START: {
>>   		struct hal_rx_mpdu_info *mpdu_info =
>>   				(struct hal_rx_mpdu_info *)tlv_data;
>> -		u16 peer_id;
>>   
>> -		peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
>> -		if (peer_id)
>> -			ppdu_info->peer_id = peer_id;
>> +		ppdu_info->peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
>>   		break;
>>   	}
>>   	case HAL_RXPCU_PPDU_END_INFO: {
>>
>> ---
>> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
>> change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1
>>
>> Best regards,
>> --
>> Matt
>>
>

