Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFFAC36005
	for <ath11k@archiver.kernel.org>; Tue, 25 Mar 2025 01:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyTWSl4FFXzLuQLaenb4gwnDzJkBOmFvlp8r3VN/r4Y=; b=tBAZ5SAaCK9hTV3PbhanAaUWVD
	ESpfqrdkpVPVSziE4gZTkWmelnEwcDy/xzaWUx8UfX+7ngeXJT/UHpRE3kKwDBSjGal6RlHHP/J4N
	cryYnUDLTteXIM+e0g0xEoZ/CKUz+463ekbhLEh14n/vMQ7A22fiNMBB2xb6riqZt+t4xZHSA2b3f
	oqRZNfEiwk7cIvUL7DexdHiApt+RVJdPVcMQT+jQ3rDJ5cMPZ3GktGtpE3wQDmZVXSFHSiBpRp18x
	KHwijCs3QD88FDUg1lNStqNuvjjtvddxclRFZyTzemNREL1waEJuUeriI7GnmZRLfaZ2pvl9RoFAg
	ygSJBIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsiP-00000004aUz-1hfs;
	Tue, 25 Mar 2025 01:04:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsiM-00000004aU8-1tGK
	for ath11k@lists.infradead.org;
	Tue, 25 Mar 2025 01:04:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OMwZm4015560;
	Tue, 25 Mar 2025 01:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyTWSl4FFXzLuQLaenb4gwnDzJkBOmFvlp8r3VN/r4Y=; b=OQBosDV49WbHOgnU
	Z7GfNvehMbv6ZQq3zBEIdhvZ56LODp+sREM/w1NXyW9wXGcb+HtuKo6kmXEZFV/d
	tHwsFdODa8rGt26q2q8Kbt0A2qBdevtPMwyTrpuIzdH3VdWZXtwHo+/PgVxjgroZ
	y4usmUlEgD8CwX2oE81sq8burnKRIEGqUkMGwMwxzTOYVWDjHZrNvjyj66koT5EJ
	HM69xWevQ6Hwkr7q9cEPQ21Lwmca7Ed9H7+zr+5wYkjNiJexKzs5ValUuyqqwunk
	gB+NfjTUjcIErNRJi6qfWAplnN6SJbp799aEqPmkFA1iRxK6UiTgpqR9iohsIIZs
	ZbmLIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpcp5w31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 01:04:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P14FcK010205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 01:04:15 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 18:04:13 -0700
Message-ID: <8ab7dddb-b4dc-408c-806b-e34846737d74@quicinc.com>
Date: Tue, 25 Mar 2025 09:04:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <johan+linaro@kernel.org>
References: <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
 <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
 <ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com>
 <Z9gd9Aw5Bug8IKSV@hovoldconsulting.com>
 <f30cf771-a9cd-4d8f-8d10-1640afd33c23@quicinc.com>
 <Z9mwn3GzpPPZSiTG@hovoldconsulting.com>
 <a8fc9f07-013c-4e31-9d9e-46e042d81dbf@quicinc.com>
 <Z90yyrZcORhJJgNU@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z90yyrZcORhJJgNU@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hoScGWf54ahlJCS37E1mSFkrT-EBncqQ
X-Proofpoint-ORIG-GUID: hoScGWf54ahlJCS37E1mSFkrT-EBncqQ
X-Authority-Analysis: v=2.4 cv=PLYP+eqC c=1 sm=1 tr=0 ts=67e20110 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=xObAXXU4KUaL95rEUbgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_180422_522118_045EFDF2 
X-CRM114-Status: GOOD (  37.81  )
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



On 3/21/2025 5:35 PM, Johan Hovold wrote:
> On Wed, Mar 19, 2025 at 02:47:12PM +0800, Miaoqing Pan wrote:
>> On 3/19/2025 1:42 AM, Johan Hovold wrote:
> 
>>> It could if the CPU observes the updates out of order due to the missing
>>> barrier. The driver could be processing an earlier interrupt when the
>>> new descriptor is added and head pointer updated. If for example the CPU
>>> speculatively fetches the descriptor before the head pointer is updated,
>>> then the descriptor length may be zero when the CPU sees the updated
>>> head pointer.
>>
>> Sorry, I still think this situation won't happen. Please see the
>> following code.
>>
>> ath11k_hal_srng_access_begin(ab, srng);
>>     => srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
>> desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
>>     => if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp) return NULL;
>> //dma_rmb();
>> *nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>>
>> If the condition 'srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp' is
>> true, the descriptor retrieval fails.
> 
> The CPU can still speculate that this condition will be false and load
> the descriptor.
> 
> If the speculation later turns out to be correct, then the descriptor
> may have stale values from before the head pointer was updated.
> 
>>> This seems to be what is happening on the X13s since adding the memory
>>> barrier makes the zero-length descriptors go away.
>>
>> Hmm, it is indeed a bit strange. Could it be that dma_rmb() introduces
>> some delay ?
> 
> It's only expected since you must use memory barriers on weakly ordered
> architectures like aarch64 to guarantee the ordering.
>   
>>>> The Copy Engine hardware module copies the metadata to the Status
>>>> Descriptor after the DMA is complete, then updates the HP to trigger an
>>>> interrupt. I think there might be some issues in this process, such as
>>>> the lack of a wmb instruction after the copy is complete, causing the HP
>>>> to be updated first.
>>>
>>> Yeah, possibly. At least it seems there are more issues than the missing
>>> barrier on the machines you test.
>>>    
>>>>> Now obviously there are further issues in your system, which we should
>>>>> make sure we understand before adding workarounds to the driver.
>>>>>
>>>>> Do you have a pointer to the downstream kernel sources you are testing
>>>>> with? Or even better, can you reproduce the issue with mainline after
>>>>> adding the PCIe patches that were posted to the lists for these
>>>>> platforms?
>>>>>
>>>> https://github.com/qualcomm-linux/meta-qcom-hwe/blob/scarthgap/recipes-kernel/linux/linux-qcom-base_6.6.bb
>>>
>>> Thanks for the pointer. That's a lot of out-of-tree patches on top of
>>> stable so not that easy to check the state of the resulting tree.
>>
>> Yes, but there are only a few patches for ath11k.
> 
> Sure, but there are other components that come into play here such as
> the PCIe controller driver.
> 
> A colleague of yours recently submitted an updated patch that overrides
> the no_snoop bit for qcs8300:
> 
> 	https://lore.kernel.org/lkml/20250318053836.tievnd5ohzl7bmox@thinkpad/
> 
> but that flag appears not to be set in your downstream tree:
> 
> 	https://github.com/qualcomm-linux/meta-qcom-hwe/blob/scarthgap/recipes-kernel/linux/linux-qcom-base-6.6/drivers/qcs8300/0004-PCI-qcom-Add-QCS8300-PCIe-support.patch
> 
> Something like that may prevent a cached descriptor from being
> invalidated when the controller updates it.
> 
> Similarly, the PCIe controllers are marked as dma-coherent in your
> devicetrees. A misconfiguration there could also cause problems.

Thank you very much for these suggestions. I tried setting no_snoop and 
disabling relaxed_ordering, but unfortunately, these did not work.

> 
> I suggest we merge my fix that adds the missing memory barrier, and
> which users have now been testing for a week without hitting the
> corruption (which they used to see several times a day).
> 
Agreed, I previously mistakenly thought that the status descriptor was 
not updated by DMA.


> Then we can continue to track down why you are having coherency issues
> on qcs615 and qcs8300. You really want to make sure that that is fixed
> properly as it may lead to subtle bugs elsewhere too.
> 

The same WLAN card is attached to qcs615, qcs8300 and sa8775p, and the 
issue is never be seen on sa8775p, maybe I can compare the PCIE settings 
to track down the root cause.



