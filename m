Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B4C3DA49
	for <ath11k@archiver.kernel.org>; Wed, 31 Jul 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY0b9a3YdFoReXBMCcHc8XiEf/B/gSfwRerHUc6LDOY=; b=L7g4j+P4OnMYqVLswfMfxvuqGA
	HECjaddbHOpYXOv/tV1QQPJP3pC2G0yKV4cewX718wcNseVw9YRtrzBO8vNOtrqmSZ6Ri3zIyM9ZW
	P8wOyXpMMQb8Q+s1clo9twIRHNLP0nRF4WfbzZ2r5IHy8u4oVa0fTspfBwsXnskBEtc+H+bPXAw+n
	STRgPdi8lwck6XnqRwD5VYXao9OnlTbfV/r1lt44TemtH5uN+rEkndzIncvuyiXQQuHwdAPFNe9es
	1poVnR/pZANaQBm3ZVusqxBD0FWP/0lM+mLkMcFf7FoLh0EW4CYnBizgM9Vs+zqEy7POrlOHIhd1z
	r6Vdo6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYysN-0000000H0dp-1nPE;
	Wed, 31 Jul 2024 02:15:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYxvg-0000000Gupc-3gFI
	for ath11k@bombadil.infradead.org;
	Wed, 31 Jul 2024 01:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tY0b9a3YdFoReXBMCcHc8XiEf/B/gSfwRerHUc6LDOY=; b=hmTHoviNu0uQ2HtLaY6e93AIW1
	/kN8qP7Z+dZieVOVzm29Vq5LQuI7fLk92og7IxKYGVb9NqUv3MqY4+DCZ7U2nm+vlaLCXm0eB+XyX
	nVWsI0Kk1VahZsHzln7npCnOX+do79hFXsfTPOeqe7LphC58JonKzTBCToZel+KzZ7T8G9Zc781CK
	NXCStzSTUpgb5WlUytSTrgUsb/hIi3JQTPn+bdlnwak9W7d3OX/boq6Inr1fddk/bfFZGNhJY+7Yz
	9obcyjTBfmu1tykFm3ojVj0xgg8nqXkM5YvTt+AgpCYMaoq1ZOtWH4r/6g1rrHZJoQs8/x+viZgI3
	EekSIEwg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYxvd-000000056wp-01dK
	for ath11k@lists.infradead.org;
	Wed, 31 Jul 2024 01:14:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGR1ox004706;
	Wed, 31 Jul 2024 01:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tY0b9a3YdFoReXBMCcHc8XiEf/B/gSfwRerHUc6LDOY=; b=bvyyhaU+Dy9RLzYX
	ootVjz3HnQxTayvsGib6femIIXYdTVUkAmD52ChjbTfC3OPAtilGuGXpiYEUjg28
	qulLSpdEom02rJ+VWzxrrToE5ONiD06DJm3QBL+XoABgbqqDkWHmMRz5quBRSmbn
	s8Mi18QWzFiTYsCBMTDkw9UP79OdHLHR34GmJr6rmsteiUK+xt4TezAbSqqLMoKK
	/ZEoFIrSGsojy8Z6blTEBLXgl2EBdR0kDOi6VyPkQRT1gfQzPcTonBS0iUBQ946O
	SdZjY/F6wX/KtLvXdBDvsnHaaG3ggQEHIlTJHiV5EaszJklwwRIVkQdbm3zLCnKN
	GNDhUg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mryu1hx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 01:14:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V1ElVJ028297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 01:14:47 GMT
Received: from [10.231.216.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 18:14:46 -0700
Message-ID: <c65b4a74-966c-4750-9e23-6caf0aed5c21@quicinc.com>
Date: Wed, 31 Jul 2024 09:14:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] wifi: ath11k: use union for vaddr and iaddr in
 target_mem_chunk
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240730035955.788768-1-quic_miaoqing@quicinc.com>
 <6d516ba0-854e-4aec-8a53-4c2c658e9512@quicinc.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <6d516ba0-854e-4aec-8a53-4c2c658e9512@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A1yj7tE01uQYeB_wIJfpcxq3GW6Fu6qR
X-Proofpoint-GUID: A1yj7tE01uQYeB_wIJfpcxq3GW6Fu6qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_21,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_021457_443890_5075D1D3 
X-CRM114-Status: GOOD (  28.69  )
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



On 7/31/2024 1:42 AM, Jeff Johnson wrote:
> On 7/29/2024 8:59 PM, Miaoqing Pan wrote:
>> The value of 'ab->hw_params.fixed_mem_region' determins that
> 
> s/determins/determines/
> 
>> only one variable 'vaddr' or 'iaddr' is used in target_mem_chunk.
>> So use union instead, easy to check whether the memory is set
>> or not.
>>
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/qmi.c | 45 ++++++++++++++-------------
>>   drivers/net/wireless/ath/ath11k/qmi.h |  8 +++--
>>   2 files changed, 29 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 1bc648920ab6..ee32027badcf 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1955,19 +1955,21 @@ static void ath11k_qmi_free_target_mem_chunk(struct ath11k_base *ab)
>>   	int i;
>>   
>>   	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
>> -		if ((ab->hw_params.fixed_mem_region ||
>> -		     test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
>> -		     ab->qmi.target_mem[i].iaddr)
>> -			iounmap(ab->qmi.target_mem[i].iaddr);
>> +		if (!ab->qmi.target_mem[i].v.iaddr)
> 
> see my comment at the end about potentially adding a new member to test for NULL
> 
>> +			continue;
>>   
>> -		if (!ab->qmi.target_mem[i].vaddr)
>> +		if (ab->hw_params.fixed_mem_region ||
>> +		    test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
>> +			iounmap(ab->qmi.target_mem[i].v.iaddr);
>> +			ab->qmi.target_mem[i].v.iaddr = NULL;
>>   			continue;
>> +		}
>>   
>>   		dma_free_coherent(ab->dev,
>>   				  ab->qmi.target_mem[i].prev_size,
>> -				  ab->qmi.target_mem[i].vaddr,
>> +				  ab->qmi.target_mem[i].v.vaddr,
>>   				  ab->qmi.target_mem[i].paddr);
>> -		ab->qmi.target_mem[i].vaddr = NULL;
>> +		ab->qmi.target_mem[i].v.vaddr = NULL;
>>   	}
>>   }
>>   
>> @@ -1984,22 +1986,22 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>>   		/* Firmware reloads in coldboot/firmware recovery.
>>   		 * in such case, no need to allocate memory for FW again.
>>   		 */
>> -		if (chunk->vaddr) {
>> +		if (chunk->v.vaddr) {
>>   			if (chunk->prev_type == chunk->type &&
>>   			    chunk->prev_size == chunk->size)
>>   				continue;
>>   
>>   			/* cannot reuse the existing chunk */
>>   			dma_free_coherent(ab->dev, chunk->prev_size,
>> -					  chunk->vaddr, chunk->paddr);
>> -			chunk->vaddr = NULL;
>> +					  chunk->v.vaddr, chunk->paddr);
>> +			chunk->v.vaddr = NULL;
>>   		}
>>   
>> -		chunk->vaddr = dma_alloc_coherent(ab->dev,
>> -						  chunk->size,
>> -						  &chunk->paddr,
>> -						  GFP_KERNEL | __GFP_NOWARN);
>> -		if (!chunk->vaddr) {
>> +		chunk->v.vaddr = dma_alloc_coherent(ab->dev,
>> +						    chunk->size,
>> +						    &chunk->paddr,
>> +						    GFP_KERNEL | __GFP_NOWARN);
>> +		if (!chunk->v.vaddr) {
>>   			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
>>   				ath11k_dbg(ab, ATH11K_DBG_QMI,
>>   					   "dma allocation failed (%d B type %u), will try later with small size\n",
>> @@ -2055,10 +2057,10 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>   			}
>>   
>>   			ab->qmi.target_mem[idx].paddr = res.start;
>> -			ab->qmi.target_mem[idx].iaddr =
>> +			ab->qmi.target_mem[idx].v.iaddr =
>>   				ioremap(ab->qmi.target_mem[idx].paddr,
>>   					ab->qmi.target_mem[i].size);
>> -			if (!ab->qmi.target_mem[idx].iaddr)
>> +			if (!ab->qmi.target_mem[idx].v.iaddr)
>>   				return -EIO;
>>   
>>   			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>> @@ -2068,7 +2070,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>   			break;
>>   		case BDF_MEM_REGION_TYPE:
>>   			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
>> -			ab->qmi.target_mem[idx].vaddr = NULL;
>> +			ab->qmi.target_mem[idx].v.iaddr = NULL;
>>   			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>>   			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
>>   			idx++;
>> @@ -2083,18 +2085,19 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>   				if (hremote_node) {
>>   					ab->qmi.target_mem[idx].paddr =
>>   							res.start + host_ddr_sz;
>> -					ab->qmi.target_mem[idx].iaddr =
>> +					ab->qmi.target_mem[idx].v.iaddr =
>>   						ioremap(ab->qmi.target_mem[idx].paddr,
>>   							ab->qmi.target_mem[i].size);
>> -					if (!ab->qmi.target_mem[idx].iaddr)
>> +					if (!ab->qmi.target_mem[idx].v.iaddr)
>>   						return -EIO;
>>   				} else {
>>   					ab->qmi.target_mem[idx].paddr =
>>   						ATH11K_QMI_CALDB_ADDRESS;
>> +					ab->qmi.target_mem[idx].v.iaddr = NULL;
>>   				}
>>   			} else {
>>   				ab->qmi.target_mem[idx].paddr = 0;
>> -				ab->qmi.target_mem[idx].vaddr = NULL;
>> +				ab->qmi.target_mem[idx].v.iaddr = NULL;
>>   			}
>>   			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>>   			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
>> index 7e06d100af57..63c957a7075e 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.h
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.h
>> @@ -1,7 +1,7 @@
>>   /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>   /*
>>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #ifndef ATH11K_QMI_H
>> @@ -102,8 +102,10 @@ struct target_mem_chunk {
>>   	u32 prev_size;
>>   	u32 prev_type;
>>   	dma_addr_t paddr;
>> -	u32 *vaddr;
>> -	void __iomem *iaddr;
>> +	union {
>> +		u32 *vaddr;
>> +		void __iomem *iaddr;
>> +	} v;
> 
> is there a reason you didn't incorporate my prior observation:
> 
> ...if you make it an anonymous union then most, if not all, of the
> code changes are unnecessary.
> 
> I'm also thinking it may make the code even cleaner to add a third member to
> the union:
> 	void *anyaddr
> 
> So you set and clear either vaddr or iaddr based upon the usage, but test
> anyaddr when testing for NULL

Actually, I want ath11k to be the same as ath12k. Anyway, it's a good 
suggestion, will update.

