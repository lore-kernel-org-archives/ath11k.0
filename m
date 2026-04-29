Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C6FF8867
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvh+8vnqhl3eI9dfiDX9TT8F7CSs+e0gJ3YIPyEvXHM=; b=OfosGZLvrCBX7I0EMK4b0tkE7a
	WiVz6dDVYZQ1srt2YuX4KFvrnSH3lOIHFsg1p66iLqtWZRdBNBOEu15lhbnAaRYaLNrCES0dZ2eay
	LW1rP8Bw49U9RUCxM3JuK6lIOWz4/uF88PC05XRYIeaXisI3PbEpo4XZf8aTPnUPcRyQ159thUPJQ
	2rbq6Hpy9FShlXbBxCI1oHGW+9walWfaHkDMYPJgdCbfntzwUa46cyXle/FYeXI/URpkunA9x9spZ
	QWfkl/2WjCNEj3gEs4NTnKWnQupjM02ibVwIuS7YdTvxW9QR4xwTUWG8LbGfdwYa61aHH/ejKEQhT
	uWN6io3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1ag-00000003OKR-1spo;
	Wed, 29 Apr 2026 09:52:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1ae-00000003OJw-0TSe
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 09:52:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqf61728556
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 09:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvh+8vnqhl3eI9dfiDX9TT8F7CSs+e0gJ3YIPyEvXHM=; b=h+RpaMqT/MsnAu83
	vk+n2+v49xYxaFAX7AZBCiBpwlZUTHx7qSlz90+HCCX81cgfulG3JYns6pt9EcRt
	Y8Ksw1e556GczKCXP9N9YWSlFILjMYqKKNgaCKpQPJfMVDAFoQwO3geG+l/zfaPG
	g8m5FHH63jpZ0Yu49DhzU25qnCTj/3lmhZYVnkSndibgHTPLG3Vl3LpEeqU5dnlR
	CHyR+wJ5xexNfepFhyejdw9eAtx4s12DkClIgYbRdaY1b8+iyPGIuhGxbiQdH3mL
	jx1/HffI43GTRwFOG4v/Ut51MO17Lnem90SFgQHURnvHgAzGSfsm8oZ0D3mLZFZT
	q/KLSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5krebq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 09:52:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso14733230a91.1
        for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777456338; x=1778061138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvh+8vnqhl3eI9dfiDX9TT8F7CSs+e0gJ3YIPyEvXHM=;
        b=ImreUUsxHBWs97DCqNOVZjgKJa1wJ1GNu8IDl2ze+LOEQbfhO2cqjrLLD+z0aclu0U
         XQqFhSgRZ5KMBulZ1cuC659FsJyDrtbERHPYyyZHweU/fb6151OYmcE15L9LDyBg18Yg
         XKr+CgZIS5ljmePz8ZLmn/O4FwK+8kYeZ5LyNVZJ7J/xoJOAmtL9isKiT4C/LZ4pxswO
         w4VR1igZc3lzR0MQ3xB/EiorF6SVPZfmERlnpcSWgx1dDHTAQFOLIWhEEz5fPFyGfNjV
         3j2vd08dfhKmE2MdrKMHIE81aheUD23YRPdl2KJ/kpZdegaDS6oGj5ts1NYaS0Waacsy
         efJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456338; x=1778061138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvh+8vnqhl3eI9dfiDX9TT8F7CSs+e0gJ3YIPyEvXHM=;
        b=iaU+lHaLUN8lJGTGi5mzmdrt22w2/MjMGKmdwiigDfd+ZIDV6d/mew8dlsIGY7d7LX
         EKSIv8ncgt3TJOkyWZkII9bybumK/12bDTDD3tn7d+hGCHm+59nIOyKJfWWS4yLHz45q
         C/FwMxGdHBCg8JOAfyzOHOd1Ksk596GUvIJ3CxaOplrDKN5sD9U/V1SWXMycJXTjG3No
         lJ1WsJSu6KuOMcwwnn1GK9fUpVT5rESjy9cQbim1PT7O8486rxPlrCUCaPpJ6VUYHOt0
         CnDijnSLuKtCXj2nMhNg4JCRI46dKLQy3Bgw9+gN5f0Pf8ckPiLB0nRBGxvSNw7WjsBm
         0jrw==
X-Gm-Message-State: AOJu0Yzg5JdrDSAY9yUWB5K4eQBsHqfjMwjMDIMoyMMiG29HAw3nbQcV
	R85V+xjoZdjASlveHozFUPaMFGmIVWNLZi0LISZMGrviRIUs+h6WjuJR2ZK6uLc0Y0fcFdYuhOT
	u9hiwmZx5biOtpi6kYXqNUnLDrws6d7J/iMq1gruVXyUkICB8U98o0JAQz7H0JdxF
X-Gm-Gg: AeBDievISWXtT1aUfo88eQjSS+W+plogVyMHWOSz84e22aD9mKSFCAlICN7E2OActGQ
	AzdFAJX0ie/MZiaVhW03+ghoKsLcnC3GjDqm9Ww0FJcCQBkKvfZi7SxX9EwIEZhM8OhN1tjLU9e
	stIVvJzowEmvuEgNigUdJva9+sTcIV6iAD5K3mJlBw8Gg7l3NNOs28qpvKKqKoNYAIgn8wtNzJC
	I1i9L0mL6HtRpAteKI5ZTXuX+DT0C/iwr7OSqHweSVtOxVxEg9V4Js+OJKfq285tXwp2p/UqGtx
	QU0KScYYdgFlOu1BvuNzi/wb6KOeaE7vOyd8SpwfDd8z5VseeBHOTpKA7OCcacPI/1rcdZw3gf5
	Cap/7gvkhp3JkHNYFq+G4I1jk0KHPRhUHiGVaUnNN9dMM0FxlPJRk4S9IQKAp
X-Received: by 2002:a17:90b:562c:b0:359:d54:846f with SMTP id 98e67ed59e1d1-364a0b240a3mr3193495a91.7.1777456337926;
        Wed, 29 Apr 2026 02:52:17 -0700 (PDT)
X-Received: by 2002:a17:90b:562c:b0:359:d54:846f with SMTP id 98e67ed59e1d1-364a0b240a3mr3193470a91.7.1777456337382;
        Wed, 29 Apr 2026 02:52:17 -0700 (PDT)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6cf4asm1510633a12.2.2026.04.29.02.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:52:17 -0700 (PDT)
Message-ID: <299f83be-748c-458c-be07-df6a0fe02f38@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:22:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: ath11k: fix monitor mode frame length by
 using correct descriptor size
To: Joshua Klinesmith <joshuaklinesmith@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
References: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5OSBTYWx0ZWRfX8Iv/fTA/W0ia
 qNb5yZftBROOFyow1ZVdAh2uZKBAeIPlJ3XKJ0/CjH7gy8AaUXRpsYXJoAEm9NR6bZfN4KDdxT/
 V7EX+RNcdG0EB243x+1epow3gk2bzIy07MHP6uQcA3IBprhgwwinnkoEqeCGvooaWpWoqrvV0HG
 WFOipcWAx/iex7IW/Sr1QOGfOOKVoCKSINhtTb7IRb9ZOCK/DcH+IOQVZKJc8b8uD3QrbZQ3AYn
 C8JbDq/RXTWAxkYHWsgTeqVUiZQ5HvCpjr5PXljxa//rmE86xICf2hSmBhhOGfLgN6mvw+WACuu
 V8CSRKauZv5FEyR8YW21Yy6E7yW/99DMuWyYA2o+GFzA9qBKJj1c7LdmX0PzNU3/O11nUupfP2q
 Bn2Er5bbTlJfJ7xdOhIe+0UELAb4M4GT73PkRW5A7GNinMIO3YlGIb7gkwK9ARbosq4K0Nke76n
 yEhHdZx6LvFAIXGjaEg==
X-Proofpoint-GUID: hb2oh4M2L3_eg3946MFq_cE-I4PTTh44
X-Proofpoint-ORIG-GUID: hb2oh4M2L3_eg3946MFq_cE-I4PTTh44
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1d4d2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=nzbe1GnBzjegX-K0-XkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025220_276306_B48316DF 
X-CRM114-Status: GOOD (  27.48  )
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
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
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

Thanks for fixing the offset handling in the monitor Rx path, but still 
there is another instance that still relies on sizeof(struct hal_rx_desc).

ath11k_dp_rx_h_ppdu(), which is also invoked from the monitor path, uses:

ath11k_dbg_dump(ab, ATH11K_DBG_DATA, NULL, "", rx_desc, sizeof(struct 
hal_rx_desc));

This should likewise be converted to use hw_params.hal_desc_sz to avoid 
dumping beyond the chip-specific descriptor size on platforms where they 
differ.


