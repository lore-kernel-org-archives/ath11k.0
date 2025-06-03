Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6952C5AD49
	for <ath11k@archiver.kernel.org>; Tue,  3 Jun 2025 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMCjvR03QgSZdLfpCuMjqLMPO4INCEpPdDDU/B9aHz4=; b=O8b5u3P9NGbdTc1gJgEEzXbfH7
	Izl4PnWLgRNKNUKeBv0T4W9gw8r0F9xnpHot+sYhkZTysiBTRiN+x8++bjJoiukJgnST9MeSbI1W4
	1p7ej3GexYsNYuBB8lBoi8yujWjRGZunKLYcnXLWSjKRTo7J+vE5kaNfuH4dbJFpRlVoDT7mdhaE8
	F71RI2VQSv4dcnN1Cq6cP96PRTdniP+DeO9grDGBxFP+uE/yhh6uwxR223qjUGg5sdbKBb77iBw3D
	Pup38zaEbUWWAIXFvZRBeywCPjpbbXp6ATFcFvdCDb3c7dzEOvqrXsrHBPbMTY1h8TeFU5uI3s9nv
	HGK8gsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPGF-0000000Aj41-3H4B;
	Tue, 03 Jun 2025 10:52:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPGC-0000000Aj3g-3teP
	for ath11k@lists.infradead.org;
	Tue, 03 Jun 2025 10:52:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JLps007516;
	Tue, 3 Jun 2025 10:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMCjvR03QgSZdLfpCuMjqLMPO4INCEpPdDDU/B9aHz4=; b=O4jOfXRhytA54wdr
	EcwfuglfdJ77xESYdbEGNKSIZ7YJ1AMbOuG0pBwuB/x+EH2sIgTgn5qYAzie1wGi
	NH91gA+Ol/SITyK+xvU7MnVfHwuRqGxI2xTAsUL7q/TfSmS1WRpM03nYQ7XEUCr4
	2c2HIfaVgEpOCDVj3rgiVlps01T5W7QWt88bjpfzkKNQKyXPtv3hDOI3Pn0sTCgK
	OiQ9E9gVx77yuYpKeZbHbrmjQKWs5qkYjM2IPjCzDa5RbCD1IUvMn0XCXczidkA9
	9bNRg/ZrcUp6V051Q+QCmg7g88CIBeSNVh4SJ/nsLbF/prPoXe5RvBT7ATCFtlFW
	dRXI+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8st9m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 10:52:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 553AqinO020650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 10:52:44 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Jun 2025
 03:52:40 -0700
Message-ID: <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
Date: Tue, 3 Jun 2025 18:52:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
To: Johan Hovold <johan@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
CC: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <aD1axxSAJsbUfnHH@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683ed3fd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=fuL3aosLTfx4rvEMTfQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NSBTYWx0ZWRfX2HzFVb7TXzyr
 S7MAbFzAZ0Qr3dXyQwMIJDqp7/q2Na8jggz2eUialEuHzDVQ7mPvmXKDTbo4HG4EJSVcqytlQ/g
 JJmJjiwMgp001nb8tzc8ND+CtavgKEkOxIUd3DXLdkKhF5QwWDeuqtWCNr34gGPc/2BcMyWhlFD
 OAhTaZqnUlDRZs7uPCojgpRO/T9mUs6GnMzLOcbxPls7BLF5yyJgFZjVAnhkR8+7bYCXD3ZwZXV
 rDnqpRFKN7uI9BbOyJR32YItrz29sw5/o+3o8mH6x3jsJcD6dhOIVXYxywfwPFTdsHALrqP3Eyo
 6JRSFJSEmKWDSOtu14iaFHRpzOCvGF2Oh/498DxjR+bQOiwmNOMF/hHcxHNDVjIrkfzGcZ5RAB5
 xNvcJIhKdBWmkX6ZPnqBL1DPIvya2WfthnsUudOhKR45O5fXzkcshzy6DBEMctOsbBox9yQR
X-Proofpoint-GUID: 8Q8AepfSfv8Y5YMLfpk3eDiXt3_KX_3R
X-Proofpoint-ORIG-GUID: 8Q8AepfSfv8Y5YMLfpk3eDiXt3_KX_3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=857 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_035248_996245_1A83DC00 
X-CRM114-Status: GOOD (  29.59  )
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



On 6/2/2025 4:03 PM, Johan Hovold wrote:
> On Thu, May 29, 2025 at 03:03:38PM +0800, Miaoqing Pan wrote:
>> On 5/26/2025 7:48 PM, Johan Hovold wrote:
>>> Add the missing memory barriers to make sure that destination ring
>>> descriptors are read after the head pointers to avoid using stale data
>>> on weakly ordered architectures like aarch64.
> 
>>> @@ -3851,6 +3851,9 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
>>>   
>>>   	ath11k_hal_srng_access_begin(ab, srng);
>>>   
>>> +	/* Make sure descriptor is read after the head pointer. */
>>> +	dma_rmb();
>>> +
>>
>> Thanks Johan, for continuing to follow up on this issue. I have some 
>> different opinions.
>>
>> This change somewhat deviates from the fix approach described in 
>> https://lore.kernel.org/all/20250321095219.19369-1-johan+linaro@kernel.org/. 
>> In this case, the descriptor might be accessed before it is updated or 
>> while it is still being updated. Therefore, a dma_rmb() should be added 
>> after the call to ath11k_hal_srng_dst_get_next_entry() and before 
>> accessing ath11k_hal_ce_dst_status_get_length(), to ensure that the DMA 
>> has completed before reading the descriptor.
>>
>> However, in this patch, the memory barrier is used to protect the head 
>> pointer (HP). I don't think a memory barrier is necessary for HP, 
>> because even if an outdated HP is fetched, 
>> ath11k_hal_srng_dst_get_next_entry() will return NULL and exit safely. 
> 
> No, the barrier is needed between reading the head pointer and accessing
> descriptor fields, that's what matters.
> 
> You can still end up with reading stale descriptor data even when
> ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to speculation
> (that's what happens on the X13s).

The fact is that a dma_rmb() does not even prevent speculation, no matter where it is
placed, right? If so the whole point of dma_rmb() is to prevent from compiler reordering
or CPU reordering, but is it really possible?

The sequence is

	1# reading HP
		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);

	2# validate HP
		if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
			return NULL;

	3# get desc
		desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;

	4# accessing desc
		ath11k_hal_desc_reo_parse_err(... desc, ...)

Clearly each step depends on the results of previous steps. In this case the compiler/CPU
is expected to be smart enough to not do any reordering, isn't it?

> 
> Whether to place it before or after (or inside)
> ath11k_hal_srng_dst_get_next_entry() is a trade off between readability, 
> maintainability and whether we want to avoid unnecessary barriers in
> cases like the above where we strictly only need one barrier before the
> loop (or if we want to avoid the barrier in case the ring is ever
> empty).
> 
>> So, placing the memory barrier inside 
>> ath11k_hal_srng_dst_get_next_entry() would be more appropriate.
>>
>> @@ -678,6 +678,8 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct 
>> ath11k_base *ab,
>>          if (srng->flags & HAL_SRNG_FLAGS_CACHED)
>>                  ath11k_hal_srng_prefetch_desc(ab, srng);
>>
>> +       dma_rmb();
>> +
>>          return desc;
>>   }
> 
> So this will add a barrier in each iteration of the loop, but we only
> need a single one after reading the head pointer.
> 
> [ Also note that ath11k_hal_srng_dst_peek() would similarly need a
> barrier if we were to move them into those helpers. ]
> 
> Johan
> 


