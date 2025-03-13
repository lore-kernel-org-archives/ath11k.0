Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA29C28B28
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 01:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3WuqxTgoKmIQDpMl5O5+Mc9CBvQKuAJmwCls7/LPMM=; b=YSDHWZazYaTEJ6+dLbcjTqIvtC
	+aSfCjjQEmSpUgtg395vRlsuC0/6C+llWqhJEoAdXJUGC5wmDWP1Px6EaI0d5aeY2vtSKoV2JWzTV
	UlDm0QPoxBMgTbE3jNtBrIjyGeFGAFtvtw8fU8qLdhbYV1jOEDwHQiyLELxRdTKOlQ4UmKxaq7TCo
	CqDMiXzINov2QMADcgFR7t826uNMi4otbqGFJd22X5ajhQrXJzaPNRqBpCNklnArmQWRKcHVf+nTv
	2objiyLtPbZW92z/NdPYkqLA1KrqL/Iigzxglp8J1IC4lpB1Sp2Ya2eaJc11BWZQq9I/A5/wX65R+
	6KMkTZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXaF-00000009sxu-413I;
	Thu, 13 Mar 2025 01:42:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXaD-00000009sxW-0qFm
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 01:42:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0m9so003543;
	Thu, 13 Mar 2025 01:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3WuqxTgoKmIQDpMl5O5+Mc9CBvQKuAJmwCls7/LPMM=; b=ClB2dS3TcoIcPPB5
	vzFpnsqXHpMfVn0gs3FWgg+RBzcOcEsDKkfjtvW99la0UGmL2ov/NOWM53sPi775
	9bRiVWkv33XMZcFGJOUMknpL/BNT0YkpzUZ8nPVAb6KJa9X9ABBeEr4DxoWOgAVD
	TyX3DqmU8tMWvTJWwxlqcT6UmfHtykcuqXDhffaPP7YF61YzSPf+GuhuXxcWAnQI
	EN4Le2owD/0rSJVE7yUZyMeQqX3e/SunVqIcVmGOVXi3IyD/UoZSt3XK/W6qPo7w
	Xs/qfji0kL5nmAj2Y3g2vS/7w8lQkKVJE4LTTRDqzYi+EgKcbwE6HfFvh/rWnFmr
	w5Q18g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ya19m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 01:41:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D1fudv015335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 01:41:56 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 18:41:54 -0700
Message-ID: <8251fc50-5df4-4a3f-91bf-40c09c33cf6e@quicinc.com>
Date: Thu, 13 Mar 2025 09:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <johan+linaro@kernel.org>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pWY8Qf7XDFYmi1Uu1LG3_sLpgHo3SVBs
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d237e5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=POYSu9ou3bP9OeXHj2YA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pWY8Qf7XDFYmi1Uu1LG3_sLpgHo3SVBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_184201_256259_ADEE2C90 
X-CRM114-Status: GOOD (  41.64  )
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



On 3/13/2025 12:43 AM, Johan Hovold wrote:
> On Wed, Mar 12, 2025 at 09:11:45AM +0800, Miaoqing Pan wrote:
>> On 3/11/2025 11:20 PM, Jeff Johnson wrote:
>>> On 3/11/2025 1:29 AM, Miaoqing Pan wrote:
>>>> On 3/10/2025 6:09 PM, Johan Hovold wrote:
>>>>> I'm still waiting for feedback from one user that can reproduce the
>>>>> ring-buffer corruption very easily, but another user mentioned seeing
>>>>> multiple zero-length descriptor warnings over the weekend when running
>>>>> with this patch:
>>>>>
>>>>> 	ath11k_pci 0006:01:00.0: rxed invalid length (nbytes 0, max 2048)
>>>>>
>>>>> Are there ever any valid reasons for seeing a zero-length descriptor
>>>>> (i.e. unrelated to the race at hand)? IIUC the warning would only be
>>>>> printed when processing such descriptors a second time (i.e. when
>>>>> is_desc_len0 is set).
>>>>
>>>> That's exactly the logic, only can see the warning in a second time. For
>>>> the first time, ath12k_ce_completed_recv_next() returns '-EIO'.
>>>
>>> That didn't answer Johan's first question:
>>> Are there ever any valid reasons for seeing a zero-length descriptor?
>>
>> The events currently observed are all firmware logs. The discarded
>> packets will not affect normal operation. I will adjust the logging to
>> debug level.
> 
> That still does not answer the question whether there are ever any valid
> reasons for seeing zero-length descriptors. I assume there are none?
> 
>>> We have an issue that there is a race condition where hardware updates the
>>> pointer before it has filled all the data. The current solution is just to
>>> read the data a second time. But if that second read also occurs before
>>> hardware has updated the data, then the issue isn't fixed.
>>   
>> Thanks for the addition.
>>
>>> So should there be some forced delay before we read a second time?
>>> Or should we attempt to read more times?
>>
>> The initial fix was to keep waiting for the data to be ready. The
>> observed phenomenon is that when the second read fails, subsequent reads
>> will continue to fail until the firmware's CE2 ring is full and triggers
>> an assert after timeout. However, this situation is relatively rare, and
>> in most cases, the second read will succeed. Therefore, adding a delay
>> or multiple read attempts is not useful.
> 
> The proposed fix is broken since ath11k_hal_ce_dst_status_get_length()
> not just reads the length but also sets it to zero so that the updated
> length may indeed never be seen.
> 
Good point!

> I've taken a closer look at the driver and it seems like we're missing a
> read barrier to make sure that the updated descriptor is not read until
> after the head pointer.
> 
> Miaoqing, could you try the below patch with your reproducer and see if
> it is enough to fix the corruption?
> 
Sure, the stress test is running.

> If so I can resend with the warning removed and include a corresponding
> fix for ath12k (it looks like there are further places where barriers
> are missing too).
> 
> Johan
> 
> 
If the DMA read barrier works, do you think my submitted patch series is 
still needed? Because the error handling is incorrect.


>  From 656dbd0894741445aeb16ee8357e6fef51b6084c Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan+linaro@kernel.org>
> Date: Wed, 12 Mar 2025 16:49:20 +0100
> Subject: [PATCH] wifi: ath11k: fix ring-buffer corruption
> 
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
> 	ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
> 	ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
> 
> Miaoqing Pan tracked it down to the host seeing the updated destination
> ring head pointer before the updated descriptor, and the error handling
> for that in turn leaves the ring buffer in an inconsistent state.
> 
> Add the missing the read barrier to make sure that the descriptor is
> read after the head pointer to address the root cause of the corruption.
> 
> The error handling can be fixed separately in case there can ever be
> actual zero-length descriptors.
> 
> FIXME: remove WARN_ON_ONCE() added for verification purposes
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Link: https://lore.kernel.org/20250310010217.3845141-3-quic_miaoqing@quicinc.com
> Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Cc: stable@vger.kernel.org	# 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/net/wireless/ath/ath11k/ce.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index e66e86bdec20..423b970e288c 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -393,8 +393,12 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>   		goto err;
>   	}
>   
> +	/* Make sure descriptor is read after the head pointer. */
> +	dma_rmb();
> +
>   	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>   	if (*nbytes == 0) {
> +		WARN_ON_ONCE(1);	// FIXME: remove
>   		ret = -EIO;
>   		goto err;
>   	}


