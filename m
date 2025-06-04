Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2E8C61CE8
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+qlb57xxwaTCuFL52/E3275a9Fzz22EbNv/H6BVDLI=; b=lUhpcLxhBMQPX/hQS9ifh174Rj
	uq28Nm/+/oh9IGDWbMzewPP6ouOE9K07czblzM1xSdkHPmHsU0oR2l33ZWo0YMiHIgSYsOjPGW6bd
	ZUaHj6liFgCUMVnCx6sciJdfolDF3wLcR4k2kbB1yDsIaa9Wz0IdVQln7Dvd9tdtbYKAG4sqfDa51
	ziSod9ptZ75C4GIi6THek1BpAYue77sI1DqQrMPr03r5xw/3SIycTp4k0+L2KaAaQ8YQZFG1qu5jy
	h9CbSg1iwp6YDYEg0L/NGUw/te0p56IR/3loPNf+WPGZtUEIWiznQERI/sdnMzOiutVv6cZim1o9L
	aarF5VmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjjz-0000000CvjN-0QB4;
	Wed, 04 Jun 2025 08:44:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjKb-0000000CsBN-0VKG
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 08:18:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553L0T5t007388;
	Wed, 4 Jun 2025 08:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+qlb57xxwaTCuFL52/E3275a9Fzz22EbNv/H6BVDLI=; b=RBkmRJ7OeMZ7gRWo
	4KhEh7RW5NB+MOVVPvpXSo+QNKJ3a6DkjCdtxzYxNIqUKtkRwzJJNT7ZO1L9zXvf
	pMGzG71O1PhjKVcs2x69CwfYSKSJdgBdzP3LWUMTRq2T33FiHOcZhmPGs4zJI7IF
	WxwNIgafx7BxYKL7Mlkk4JKZQZQGW1DFnUAyyJep81bCi/+qld/m44ME3OG6Xiz2
	q/fDPHHri5uWlClr9fYVOv+Us1h+lWMJFhGzgdBPrdxAMxrHBo1RkegbniwGLZ/T
	OeOR2y+oNB7SgKQZJTbFdZfM/RpMGtMqfFeBAOq7GJGSDMcv17IPhgiVGUYXdBbQ
	+Kbh5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8swaks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:18:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5548IbBs023995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 08:18:37 GMT
Received: from [10.133.33.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 01:18:35 -0700
Message-ID: <94d95c9b-2fd7-45b1-b9ae-664d651071cc@quicinc.com>
Date: Wed, 4 Jun 2025 16:18:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
To: Johan Hovold <johan@kernel.org>
CC: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johan Hovold
	<johan+linaro@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
 <7025db40-dda0-4cbb-80bd-09bd590584da@quicinc.com>
 <aD_wgACEfm1_1GNz@hovoldconsulting.com>
 <79b4bac1-6e55-408c-a334-006eded4229f@quicinc.com>
 <aD_-zt755Jr_LsWM@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <aD_-zt755Jr_LsWM@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6840015e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=3_NjuXynapyhKrkUQyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NCBTYWx0ZWRfXyisOzIPuB7Dm
 ng6rMzjM7MgNzW96wtZtp62LdWw35OorI6YgJdnmQVZe2hx+GWXHGj28A5FTN549UKbV8E7C2fc
 0GsT/SAiikWo/KPvvj38mEUmIrgQKlx+a+H3pnQtPZj1W+y7QvDo0yEn/BjUd+iejZzM/x8CxiT
 xB/ztP/5/1c++tadyIVM9+rdCMcSmErn5Fq2NuEEIETOE/NytakmdUwiAK0KEx4O7nhQnXwMxA+
 Izeq+8CI28sMqngClKDQk1wb5Vr9Yw5nHDpSU01b85lpUqquZDXMPiMXAlwqAmS3gVhk0m47aBr
 T+vLJgM2QhSZDRHBUndvK1FhFZlv+yfu/cjxHnhBGTWHc3mLqWCnQKtDMWWPzsU5bVnp9lGhh+C
 vVnAS/3NKoRYPEQdvtOZIh96/T0nJWVEwMl3Ou1UcwRieTpH3Wrv+ePPmdCNSvV9rXYJNQ6k
X-Proofpoint-GUID: W_8y7Pib7JpzMR6Zj-Qj5nLBrlt1jASV
X-Proofpoint-ORIG-GUID: W_8y7Pib7JpzMR6Zj-Qj5nLBrlt1jASV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=602 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_011841_162143_2EC8EA3A 
X-CRM114-Status: GOOD (  14.60  )
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



On 6/4/2025 4:07 PM, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 03:57:57PM +0800, Miaoqing Pan wrote:
>> On 6/4/2025 3:06 PM, Johan Hovold wrote:
>>> On Wed, Jun 04, 2025 at 01:32:08PM +0800, Miaoqing Pan wrote:
>>>> On 6/4/2025 10:34 AM, Miaoqing Pan wrote:
>>>>> On 6/3/2025 7:51 PM, Johan Hovold wrote:
>>>>>> On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:
> 
>>>>>>> The sequence is
>>>>>>>
>>>>>>>       1# reading HP
>>>>>>>           srng->u.dst_ring.cached_hp = READ_ONCE(*srng-
>>>>>>>> u.dst_ring.hp_addr);
>>>>>>>
>>>>>>>       2# validate HP
>>>>>>>           if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
>>>>>>>               return NULL;
>>>>>>>
>>>>>>>       3# get desc
>>>>>>>           desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
>>>>>>>
>>>>>>>       4# accessing desc
>>>>>>>           ath11k_hal_desc_reo_parse_err(... desc, ...)
>>>>>>>
>>>>>>> Clearly each step depends on the results of previous steps. In this
>>>>>>> case the compiler/CPU
>>>>>>> is expected to be smart enough to not do any reordering, isn't it?
>>>>>>
>>>>>> Steps 3 and 4 can be done speculatively before the load in step 1 is
>>>>>> complete as long as the result is discarded if it turns out not to be
>>>>>> needed.
>>>
>>>>> If the condition in step 2 is true and step 3 speculatively loads
>>>>> descriptor from TP before step 1, could this cause issues?
>>>>
>>>> Sorry for typo, if the condition in step 2 is false and step 3
>>>> speculatively loads descriptor from TP before step 1, could this cause
>>>> issues?
>>>
>>> Almost correct; the descriptor can be loaded (from TP) before the head
>>> pointer is loaded and thus before the condition in step 2 has been
>>> evaluated. And if the condition in step 2 later turns out to be false,
>>> step 4 may use stale data from before the head pointer was updated.
>>
>> Actually, there's a missing step between step 3 and step 4: TP+1.
>>
>> TP+1:
>> 	srng->u.dst_ring.tp += srng->entry_size
> 
> Sure, but that is not relevant for the issue at hand.
> 
>> TP is managed by the CPU and points to the current first unprocessed
>> descriptor, while HP and the descriptor are asynchronously updated by
>> DMA. So are you saying that the descriptor obtained through speculative
>> loading has not yet been updated, or is in the process of being updated?
> 
> Exactly.
> 
> Johan

Thanks, make sense.

Reviewed-by: Miaoqing Pan <quic_miaoqing@quicinc.com>




