Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86497FF8864
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXVaAU1x/VRaf2sNF3EoAOzNFxD9AonZN9toVdN7ibg=; b=TvK2itlV7deWaWVKu2+PkYQlXi
	xlMf2Y2ZF7M9mN41EjREIeZuJT2oxxZGgU3T/gF3kZRbB4QUwTGDVB/GvAht/gCa2XcBX+Wfn9O2t
	Gt9dTAPxQ2jgHOHB8xWXopTteJo0SkrADJJM0SCKHIHlgwm4NDq6GgwOvqbRQd23byE3esH8FIkxf
	mJfdgim3jjaJFpFkcCVDadq/fWFvAIIZADFsqjuYS+CBZLCwGP3S4vr1acrbWtzG3admqU34KokAU
	PNVgy7z1fhi2az3xhytVv+L3C94xqHvoaBJTgfOE0tbcpouN4vLElkAsEIqdqpcTltBqkQEnJVcol
	CdjR8N1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzV0-00000003AVe-2sy1;
	Wed, 29 Apr 2026 07:38:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzUy-00000003AVH-2JMq
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 07:38:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZVjh1016142
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXVaAU1x/VRaf2sNF3EoAOzNFxD9AonZN9toVdN7ibg=; b=nDS20lTULIkN0Q9b
	z1TAE6+NrHwNlwY1YHn+YfRCr/3Bcmz5uwOtoRIGXx/wOjS0+gF99u/TXmZ2X1Fg
	sdCxRuK+RHhP7g/pvMSbXpeHFN0C+oP9JSu1m2ooKj4gfsKb3I3fQ2lytFEta02L
	zpFd/Fnp2yB26NExg9RjzO+Cc3M5zRq2ZrSbq1rs9dqLmzHt9vrJnwBjtpAsISJn
	Nbb4fXg2QxlcCredh8hovnX00oPMuwjWcjVI1/VL4zeqBXTrcsicaRgOu/U973Lj
	JzbrrUzvaKcfEch9AkRpsyACJlpdxIRmKAJ3fwJ63qh9kZPm8BXhwTSEKaA7V4GX
	blfKQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730u81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:38:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so294776a12.1
        for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448295; x=1778053095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXVaAU1x/VRaf2sNF3EoAOzNFxD9AonZN9toVdN7ibg=;
        b=kVvQd0T3X2gC70M4fdh/JqXe1V84auVGJD0Pc8GSvGS44TiDYKTbUyqSWbY68+Ote/
         c+Ee8srFQm6smWagW+EJfRx/wslUaGeb21Jvc+20tNS9f+ssdYwbrCWPNiJrWpfDYsmZ
         M39EJ/fAVbdg/OESq+Y3IOFMw3Cm1zIgW+YQONgkQhR+Otp4eDlNlEiEMQJfdzCFbJuV
         qJzUc1JeTVO9IS3iC6yHxl1uDwoC+y726GNcj+u8ySaV/A4sYn9D/RqTCkvhSnaSHlXm
         QoWd0yinQHNcuHLnHf9g8ZQXBFHSy0tSs3L4WXjq8cmKh1T9+LFdTGAhesX7+HZSROtn
         xuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448295; x=1778053095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXVaAU1x/VRaf2sNF3EoAOzNFxD9AonZN9toVdN7ibg=;
        b=boqdliMSLZfJXuij8gIXHFqkjKbUb3OP3B/Zuz8TbIaU3qMwbnQ7gjo6A29Nsr0mkL
         5npGMBsP4m7dqb4gSA98q6NcGMuAEMtEjC2AmZlXMlTOcWh67pPyFVcywxMiBBL9xoBy
         WxjTnRtR1JDCxjEjwbv8N7+lChfdCKvCrMhIDrQaLXwo7L4m+od4eqKPvP1KLmQCBbNy
         7lxgZb5AeB/tZ/yzJHdkdYv8k7icaqhAOdMOlZVWfGwkn/tLeKzOkaXIXhxXV/adgijM
         syL/2HSe5b9JuuFrH6jHOVQ3GUm+Fv9lnzK3cbEdkiOAiGfP1u/a/m7OXxOGZf2NE98T
         6f5w==
X-Gm-Message-State: AOJu0Yz+FIVyBAHZf3uL2vDh0D02wQi2kuxRyjPezNzVCQrC6yyF/MKy
	KCuGWsDzLPFt478KQjbd0cgKP6Vj0X5L4RY7OyyUoD3hqaquBSFbXFqBij0iGQEgveXBG8D5yay
	S1wfKA450iPuQ7UL/pMqAYJr9IsDsNw4eXZHkm/jpeWRdn1YOqT47GJOIS5fKn9ECJo0sHI5E
X-Gm-Gg: AeBDietz1mALeorVuTr3ad1j4Rf09FvW/sFCCMXn4zpGHPwmRN0/80nse7ftIdSm463
	PHoIoQG/xV7hki2maBP6PBscHxTSMp6ULM/ujqEL6Mo5eLNZVaLS68yVuIPJTH9Ew49FFC4t6+v
	MNEnxHq42Symey+G1Lr9y0vltH7B59gPFJ78buR7qahI256tYcyRAfKP010H478rhXcav+aU8/p
	D8Ci27Lh4W4CjJyTsckK1XCHWgLXSN56dJH2OlGyZoFvCRKJgAuLuhCd9Am7OpIOPn0mBaTaa+B
	Y2eFzRVZZpLUkbTwnxhTzzLp7qY4fJEJmA59UtIGkq0YVBtp3Zu3s5X+GcqeezcgvKOQrqFQFcU
	t75IOnb7HbXkcwfVKw5glzNr5GJgWiVhc9bOvMLh+vcfa5eUaCCGx0SQWAevpMKDAz3193BHR
X-Received: by 2002:a05:6a00:1950:b0:82c:6b16:c894 with SMTP id d2e1a72fcca58-834eb51b962mr1847888b3a.20.1777448295410;
        Wed, 29 Apr 2026 00:38:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:1950:b0:82c:6b16:c894 with SMTP id d2e1a72fcca58-834eb51b962mr1847855b3a.20.1777448294872;
        Wed, 29 Apr 2026 00:38:14 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6debe4sm1089895b3a.36.2026.04.29.00.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:38:14 -0700 (PDT)
Message-ID: <525f1330-eed2-43ed-a274-ead57b928ae9@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 13:08:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: ath11k: fix monitor mode frame length by
 using correct descriptor size
To: Joshua Klinesmith <joshuaklinesmith@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
References: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1b568 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4T2M7ptt_QytPgkP2eEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NCBTYWx0ZWRfX8GeasAuTtKXK
 qmohkhD54EDTMe7X7s0b/ZPnnba7LndjsLZwvwAszS5GsMrOFor4EpOJhFFOx6rYwkZfI8v9/u0
 s15xoGh2Dsewp3BmRocS968DAMePdC78Y2llwZMEaenCWm0qwAkzdeXx433VUFclKl9A9CDMBdW
 9P4tGWqnbhYNlsW8QVXTRCO7WsKOxdmOCgwHblmGDBUvVfTDCOjBg1mUPy9kYCZ9PcrKzqhWDLl
 fhbY8koR6nE8foZrqHPhSbo0t1GonqAbZaMwG63wHwZxruCjNgjjFFKClhtVsoLtf+l+GcvsXi1
 GBULBbfmL9shQJjSePI7VtzQ+CjFOmk+R9OR28xab0cJelk2YQJg5cjse0Lpd/0p0KpCG9FmMwH
 W7BTERq3mJX0+LP5GghSbgZAaZD17yhwf7GKWQOH5bkjbvn4+iZfhSO9SIiisGu1MuJETgGQydi
 u79wCjsPEHSm/qU90ag==
X-Proofpoint-GUID: PHNp9m3zVnaOpxqu2F5-KmQCN3gl6mWl
X-Proofpoint-ORIG-GUID: PHNp9m3zVnaOpxqu2F5-KmQCN3gl6mWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_003820_603894_11DF639B 
X-CRM114-Status: GOOD (  27.38  )
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

On 4/7/2026 8:18 AM, Joshua Klinesmith wrote:
> The monitor mode RX path in ath11k_dp_rx_mon_mpdu_pop() and
> ath11k_dp_rx_full_mon_mpdu_pop() uses sizeof(struct hal_rx_desc) to
> compute the packet buffer offset. This is the size of the union of all
> chip-specific descriptors (the maximum), not the actual descriptor size
> for the running chip. The later ath11k_dp_rx_msdus_set_payload() then
> strips only hw_params.hal_desc_sz bytes (the chip-specific size) from
> the front of the skb.
> 
> On IPQ8074 and QCN9074, sizeof(struct hal_rx_desc) is 392 but
> hal_desc_sz is 384, leaving 8 extra bytes of descriptor data at the
> end of every monitor mode frame delivered to userspace. On WCN6855 the
> sizes happen to match so the bug is not visible.
> 
> The same mismatch in ath11k_dp_mon_set_frag_len() causes incorrect
> fragment length calculation for multi-buffer MSDUs, under-counting
> intermediate fragments by 8 bytes and over-counting the last fragment.
> 
> Fix by using ar->ab->hw_params.hal_desc_sz consistently in both
> monitor mpdu_pop functions and passing it through to set_frag_len.

It would be useful to add a Tested-on: tag if this was validated on
affected hardware, as suggested in the ath11k submission guidelines.

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

Since the full_mon side was added later by 7e2ea2e94704, it may be worth 
adding that as a second Fixes: tag for completeness.

> Link: https://github.com/openwrt/openwrt/issues/16183
> Signed-off-by: Joshua Klinesmith <joshuaklinesmith@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/dp_rx.c | 27 ++++++++++++++-----------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 85defe11750d..c86ffc203f15 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -4511,10 +4511,11 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
>   	return 0;
>   }
>   
> -static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
> +static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len,
> +				       u32 hal_desc_sz)
>   {
> -	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
> -		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
> +	if (*total_len >= (DP_RX_BUFFER_SIZE - hal_desc_sz)) {
> +		*frag_len = DP_RX_BUFFER_SIZE - hal_desc_sz;
>   		*total_len -= *frag_len;
>   	} else {
>   		*frag_len = *total_len;
> @@ -4658,19 +4659,19 @@ static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
>   
>   static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
>   				      bool *is_frag, u32 *total_len,
> -				      u32 *frag_len, u32 *msdu_cnt)
> +				      u32 *frag_len, u32 *msdu_cnt,
> +				      u32 hal_desc_sz)
>   {
>   	if (info->msdu_flags & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) {
>   		if (!*is_frag) {
>   			*total_len = info->msdu_len;
>   			*is_frag = true;
>   		}
> -		ath11k_dp_mon_set_frag_len(total_len,
> -					   frag_len);
> +		ath11k_dp_mon_set_frag_len(total_len, frag_len, hal_desc_sz);
>   	} else {
>   		if (*is_frag) {
> -			ath11k_dp_mon_set_frag_len(total_len,
> -						   frag_len);
> +			ath11k_dp_mon_set_frag_len(total_len, frag_len,
> +						   hal_desc_sz);
>   		} else {
>   			*frag_len = info->msdu_len;
>   		}
> @@ -4792,7 +4793,7 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
>   
>   			rx_desc = (struct hal_rx_desc *)msdu->data;
>   
> -			rx_pkt_offset = sizeof(struct hal_rx_desc);
> +			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
>   			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
>   
>   			if (is_first_msdu) {
> @@ -4823,7 +4824,8 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
>   			}
>   			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
>   						  &is_frag, &total_len,
> -						  &frag_len, &msdu_cnt);
> +						  &frag_len, &msdu_cnt,
> +						  rx_pkt_offset);
>   			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
>   
>   			ath11k_dp_pkt_set_pktlen(msdu, rx_buf_size);
> @@ -5424,7 +5426,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
>   
>   			rx_desc = (struct hal_rx_desc *)msdu->data;
>   
> -			rx_pkt_offset = sizeof(struct hal_rx_desc);
> +			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
>   			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
>   
>   			if (is_first_msdu) {
> @@ -5439,7 +5441,8 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
>   
>   			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
>   						  &is_frag, &total_len,
> -						  &frag_len, &msdu_cnt);
> +						  &frag_len, &msdu_cnt,
> +						  rx_pkt_offset);
>   
>   			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
>   

The code change itself looks correct to me.

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



