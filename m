Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC5FF8855
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaJWnG2TUmYaXY/GqVPohLhTNo2BQ8ByiLvDOJZwP7s=; b=Ag+NOiXzk6jRl8IbmkUrOzeTHu
	ZCeZJ5scT40AuckcGcs8ab/ObilJ5tqVfOsMkYBOq7tP9b1d1JdMoE7O8Dj9VjWlQY8rsNd0J7iXO
	1DM7Tx2sxmheketXs4c5AAqwaPdnW7q462Z+MFeqq0Gy0mY1VA5uXypCD4eKlgmYLxTv/NoVEozVC
	Jhm+jC+p/xlgqOL3QnZMCOGge/3o24lNW4W6Gm1NXtJeYaSbSeeqjy1++16cWwR+MYPd6NZHFf9bv
	iOiedO8kOIBJix3NDt2CSLsfVEqRtFmtNHruKn4C7XK0ef8nsGIoyUOx8NONRFkns0UFOHqUgYk7O
	OC0fu2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOJg-000000003sk-39GC;
	Tue, 05 May 2026 22:32:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOJd-000000003rs-1xAF
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 22:32:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645FFnIb2859060
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 22:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaJWnG2TUmYaXY/GqVPohLhTNo2BQ8ByiLvDOJZwP7s=; b=MmlwDAihjhVpWPIN
	KEMyT5XqozxLP06Y7Cn8o7Tpg+QlkhfqDmq0yAyX5QBGzYyLpJ5lrOdQUqcPJe+h
	3owMCecyLBTKAB+YiO24jL4mkbucjQHzvEss36ZJzkaMtbAuScP8iwo5pB1Osq+g
	eG+nh10+JS5On7clRmdiEh+eSYRHXgmYxrzKiPwyYMYjWG63ayCgtDzw3TxJ6alh
	BjxGoRHhJkrUZ3esbz3wj6q6dHYV4fSTtnFh5AXFaZvuXQjOj0VS1dmOQqRve+vS
	Wc2ooLpEWG5uGAPUhoz5lfExVGmpwfHTdHMu3qbTpQKCytLrSvL98rspTb5/dkvK
	s0bKLw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ak1se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 22:32:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so344444eec.0
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778020351; x=1778625151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZaJWnG2TUmYaXY/GqVPohLhTNo2BQ8ByiLvDOJZwP7s=;
        b=EteHnpu9luSS7trmyur3nN2FNgUKoLtQxTkFrgus5WvtRAZkQmlqZr4bdC21/9EKsh
         GEHDOV6yApKpmjM9nR/FdQnIuYUaDc0C0lgYQ9fZQTvoV5vvL9uTDixeILsccLcklAKe
         ShrRlrVR57ppn6CuvCRuK+8iwi+KcjBzxoJSD9RpF84G/xUtZeAm4xRV2ZtYH+QjNNVw
         6bdf3BEenxfklkZD2BxtvHdWF3dw5sTEtr2L4gOeYpNU8WVwoW+AqxR20Y2sHAJ/zNk4
         K9houCH+Zs0jBN8jvF+K1wLAx7+2KUA3dGYfGN42BqD810YcwnwJoFcyLf54siaNup1s
         KScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778020351; x=1778625151;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaJWnG2TUmYaXY/GqVPohLhTNo2BQ8ByiLvDOJZwP7s=;
        b=C2TDawwOc+BMQu3sZE0hMd0BJANmLaJNJwANaNeXdkeqFOTXBiHW1P4qlCdlERB/5z
         xbzIdjjmi9Ab4eAs8RFiAuQRwNQCKrKCOCf3j7BM1TdGdA0EaS0dECbLr1uxfYGNqvI8
         R2GRhWfSm81H8ZfWNGFt2RjtBbiYwskoLSgusuR+SzJDVb7Y6JH5PuVZauQmdp5a9GO7
         FXGl/EdPBe3znQJyk1K1W0R79MNbOoaRt587TNjgnfp966/HDb0Lr0/Wlq8ySqXtgYsW
         Hr/QOQSVaQUcGXNJtJxc2j8WmxIyaQ4eLH1S/GT1zxbnnw0ZYMjkPp+nRtnm7Feur9cG
         2Sog==
X-Gm-Message-State: AOJu0Ywve01KdRERM1Up4S+/ihDS3PO3b3Odkwlyjt/59ckhFtSbSY1U
	Co7IfT1lSywkfV5yVs+Dp9V2djTDZfxQuBA81aLOlAMAQ2NreKv8MUQBC3N8uAZXC+EgUYhHaKO
	QezIMFeaTlWv7XwMCsJVygEHoz6TgzP6fqD9r9Gq62+if8FQj/31gmgYdZQgHFOTi22lOAevC
X-Gm-Gg: AeBDieuVSFtuo8zQc4XKo/S3DsrjEkMVi3MEzqvPeHtKd0DLyk4SVowMe0mStFyT4UV
	bubqpwrDgreVWFMQ+swhjFICHwx6Uw+Nl3frKsE+H8NUC3miTv7pXNYaPuLE6Foaf9WyP2lhlaS
	P+VT3FEFEPSsMTdFqQTfbAdRWxIT5g5zY9ywUkGTbQtDl7AD5i1AJA6cMEGWW7HsNiBaWsr0Kew
	bFshmKY4cgWA7AfMLoCCLboAQ4M7O92ynOQc9b2PeW1gbNdjevvODw3Lv6DmTcVhOaHkAhsw8Ip
	TZnY8ynEQm/CvWgiYfMEjD8h6kpEwD+2IEK/bUkMToIlDQLV7z1IJO73de3+eA6ZSHzgixvQdCR
	RB7IcaIPoADIAR0FMvVXUuUvo+Z2uBNVk+bNLDCR4gzNCHB9uGcJuvzYu8xjTZbdUdJKQ+O8h6N
	Vx34V4+zDytB8g8p5STW7G2HsR
X-Received: by 2002:a05:7300:b10b:b0:2f3:b7b2:cbd3 with SMTP id 5a478bee46e88-2f558c796cdmr353923eec.5.1778020350572;
        Tue, 05 May 2026 15:32:30 -0700 (PDT)
X-Received: by 2002:a05:7300:b10b:b0:2f3:b7b2:cbd3 with SMTP id 5a478bee46e88-2f558c796cdmr353915eec.5.1778020350020;
        Tue, 05 May 2026 15:32:30 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm937403eec.5.2026.05.05.15.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 15:32:29 -0700 (PDT)
Message-ID: <32843bc8-15c3-4b18-8044-b0466b9223a9@oss.qualcomm.com>
Date: Tue, 5 May 2026 15:32:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: ath11k: fix monitor mode frame length by
 using correct descriptor size
To: Praneesh P <praneesh.p@oss.qualcomm.com>,
        Joshua Klinesmith <joshuaklinesmith@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
References: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
 <299f83be-748c-458c-be07-df6a0fe02f38@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <299f83be-748c-458c-be07-df6a0fe02f38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIxOSBTYWx0ZWRfXwsCCuLU7e7hg
 YsFOSbJHSGvX7M/3W4CEclk6dhwsx+IZ2zAbUVZ1ocJZZXUbswLDw8kjwbIoMELvYTzc54K4/mp
 F4J4dAk+3WgL1sq3345G25eVzlrmirDKhoCGLys2TLtHFnwEU73PiYbj7ktUNer7uGgva6SU90J
 4PDGI9+r22yPHzwT4nFfzo646y6bues+nVKjnErxD+yLltTt1f4GhnTJIQmp1zggV/C8svp8ZA2
 SV3dnS59ZE4EcgfOWiARMTWlExDNgTvnAMy/L2z6mILwZGrw99C2elIzxE64D3uxcsTZDMfjRfk
 E4m0z0NTC/wA1xngzwfEcmdbfsdQ3zgx8JIxAy9vU735KEhVCqp+wfRdTfGdZR+kN9iizS4eko2
 fc6k4D2qG2xFJFXkohmvihdN9qWPveyM8NkYC9ZtTxa8l2ShNEEFbVC/obnR8XcbsUxaNJufTlH
 yC9G3pgB59uZ2hiy1hg==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69fa7000 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=8pGESeWOdjOF7JQ2IL8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: S5u99FAeuoqaVG5-JVZg1bZHsCrfkgq7
X-Proofpoint-ORIG-GUID: S5u99FAeuoqaVG5-JVZg1bZHsCrfkgq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_153233_628493_FDA193A0 
X-CRM114-Status: GOOD (  25.68  )
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

On 4/29/2026 2:52 AM, Praneesh P wrote:
> On 4/7/2026 8:18 AM, Joshua Klinesmith wrote:
>> The monitor mode RX path in ath11k_dp_rx_mon_mpdu_pop() and
>> ath11k_dp_rx_full_mon_mpdu_pop() uses sizeof(struct hal_rx_desc) to
>> compute the packet buffer offset. This is the size of the union of all
>> chip-specific descriptors (the maximum), not the actual descriptor size
>> for the running chip. The later ath11k_dp_rx_msdus_set_payload() then
>> strips only hw_params.hal_desc_sz bytes (the chip-specific size) from
>> the front of the skb.
>>
>> On IPQ8074 and QCN9074, sizeof(struct hal_rx_desc) is 392 but
>> hal_desc_sz is 384, leaving 8 extra bytes of descriptor data at the
>> end of every monitor mode frame delivered to userspace. On WCN6855 the
>> sizes happen to match so the bug is not visible.
>>
>> The same mismatch in ath11k_dp_mon_set_frag_len() causes incorrect
>> fragment length calculation for multi-buffer MSDUs, under-counting
>> intermediate fragments by 8 bytes and over-counting the last fragment.
>>
>> Fix by using ar->ab->hw_params.hal_desc_sz consistently in both
>> monitor mpdu_pop functions and passing it through to set_frag_len.
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Link: https://github.com/openwrt/openwrt/issues/16183
>> Signed-off-by: Joshua Klinesmith <joshuaklinesmith@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/dp_rx.c | 27 ++++++++++++++-----------
>>   1 file changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index 85defe11750d..c86ffc203f15 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -4511,10 +4511,11 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
>>   	return 0;
>>   }
>>   
>> -static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
>> +static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len,
>> +				       u32 hal_desc_sz)
>>   {
>> -	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
>> -		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
>> +	if (*total_len >= (DP_RX_BUFFER_SIZE - hal_desc_sz)) {
>> +		*frag_len = DP_RX_BUFFER_SIZE - hal_desc_sz;
>>   		*total_len -= *frag_len;
>>   	} else {
>>   		*frag_len = *total_len;
>> @@ -4658,19 +4659,19 @@ static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
>>   
>>   static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
>>   				      bool *is_frag, u32 *total_len,
>> -				      u32 *frag_len, u32 *msdu_cnt)
>> +				      u32 *frag_len, u32 *msdu_cnt,
>> +				      u32 hal_desc_sz)
>>   {
>>   	if (info->msdu_flags & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) {
>>   		if (!*is_frag) {
>>   			*total_len = info->msdu_len;
>>   			*is_frag = true;
>>   		}
>> -		ath11k_dp_mon_set_frag_len(total_len,
>> -					   frag_len);
>> +		ath11k_dp_mon_set_frag_len(total_len, frag_len, hal_desc_sz);
>>   	} else {
>>   		if (*is_frag) {
>> -			ath11k_dp_mon_set_frag_len(total_len,
>> -						   frag_len);
>> +			ath11k_dp_mon_set_frag_len(total_len, frag_len,
>> +						   hal_desc_sz);
>>   		} else {
>>   			*frag_len = info->msdu_len;
>>   		}
>> @@ -4792,7 +4793,7 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
>>   
>>   			rx_desc = (struct hal_rx_desc *)msdu->data;
>>   
>> -			rx_pkt_offset = sizeof(struct hal_rx_desc);
>> +			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
>>   			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
>>   
>>   			if (is_first_msdu) {
>> @@ -4823,7 +4824,8 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
>>   			}
>>   			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
>>   						  &is_frag, &total_len,
>> -						  &frag_len, &msdu_cnt);
>> +						  &frag_len, &msdu_cnt,
>> +						  rx_pkt_offset);
>>   			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
>>   
>>   			ath11k_dp_pkt_set_pktlen(msdu, rx_buf_size);
>> @@ -5424,7 +5426,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
>>   
>>   			rx_desc = (struct hal_rx_desc *)msdu->data;
>>   
>> -			rx_pkt_offset = sizeof(struct hal_rx_desc);
>> +			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
>>   			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
>>   
>>   			if (is_first_msdu) {
>> @@ -5439,7 +5441,8 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
>>   
>>   			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
>>   						  &is_frag, &total_len,
>> -						  &frag_len, &msdu_cnt);
>> +						  &frag_len, &msdu_cnt,
>> +						  rx_pkt_offset);
>>   
>>   			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
> 
> Thanks for fixing the offset handling in the monitor Rx path, but still 
> there is another instance that still relies on sizeof(struct hal_rx_desc).
> 
> ath11k_dp_rx_h_ppdu(), which is also invoked from the monitor path, uses:
> 
> ath11k_dbg_dump(ab, ATH11K_DBG_DATA, NULL, "", rx_desc, sizeof(struct 
> hal_rx_desc));
> 
> This should likewise be converted to use hw_params.hal_desc_sz to avoid 
> dumping beyond the chip-specific descriptor size on platforms where they 
> differ.

Joshua, can you submit a v2 that addresses this observation?

/jeff

