Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756DEC5B543
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCqkv7UIG3GLW1mbMtCLAQnW+VWrOS+08dSxfpBmZco=; b=c+oLz8DrFH4ViQLMEN7gvhMBKD
	9e7rXM/42fUFsDofcBFi7brGqXFuAgf85jRfadar6Tg3BikI8uKn98IjKxh3UuwnA5MCCv08rBFpK
	cvJl7H26lNsASfjYMCQvyYpi6K7pPbUDSQcxDxsQkNKmGo2WmByYnaxAI0IJlclYXN5h85hUGVtha
	KrFfyVqIwBld1Ilx0+JvJJRGZO5WwK+feYbygcf1eMnpkXvQGzHpclFOq8PBVG85bpk0a0O2lkxWi
	r79C6JB7GN4M+x4ia0nQMBOIFuK7zu030KgTCCwej4KhwNX705l22hlAlUqxsRihUZlX8EsSnawGE
	wJ0QFJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgjf-0000000Cd8j-3RNf;
	Wed, 04 Jun 2025 05:32:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgjd-0000000Cd8O-1Jhn
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 05:32:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FGnn013323;
	Wed, 4 Jun 2025 05:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCqkv7UIG3GLW1mbMtCLAQnW+VWrOS+08dSxfpBmZco=; b=NYlVCjvc/jOzbpMI
	/y/NN32WoxbZtb8FXj5YYMqlZFHq2eKImbd2s4P6Rg43qzuZfGrME+CQKWxhPQWG
	In0aCkKX+6HP0KpxFF/Jy8zJTEdXGdedonAPjW9dtVc/kw3JET4rnD3rnv+dWAB7
	/Gahdfno6Dr9lQRQJdPyfwkeBo/TVKhMJM2LV/1VUwYuGIWFejyak33BfNYWBZYd
	ZBdNBdY5sYXrVbLvVum+/N7Vf4flPPp1JcPjjqftsS7iEO6jpsQPo5lg2aoBSoGd
	1Z9dhFRIkNLZq4RyZXWAtRwEUKe2kUPxfD7NJ4c2VF+B5dXTceg7R+Um9TYQR+lH
	UMbhew==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be80n67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 05:32:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5545WD7k007882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 05:32:13 GMT
Received: from [10.133.33.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Jun 2025
 22:32:11 -0700
Message-ID: <7025db40-dda0-4cbb-80bd-09bd590584da@quicinc.com>
Date: Wed, 4 Jun 2025 13:32:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: Johan Hovold <johan@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
CC: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
Content-Language: en-US
In-Reply-To: <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683fda5e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=l3RNslKZv-DLmWWPsjIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5CzFIJzzY7eQU4d1_924Wcko4y-5WK1_
X-Proofpoint-ORIG-GUID: 5CzFIJzzY7eQU4d1_924Wcko4y-5WK1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0NCBTYWx0ZWRfX2FHJO/Td95ZZ
 eQfZ7Y/x9wjgG1bLUp3CA3BCSPsPnNN/uWSCK8HlpGKtnAXy3DYeFvhXwb8icnTUKsqjCyxjn/W
 5XUT/loFkXgD+KHLysFAgn70GMvuvJsjfq4LgIJ/OLLhJmKuMsrxtbwr+75MNTqwVGwsy+6geum
 3cWrXfLcwtJhFuqxLlVzUPsSVhklk07sigc4QQDvXgfoDz3XyV6o2qVB6UzLEPfpIeGHkCnGla4
 PunX6QkEDyKWblDtt5lxYDGRYhrE7wZanYdLPMxVocs4JI3UaFVtdvfcGVjFun1sese8x94+AzL
 xbDepyedus7DEAea5N85eD2tNcED5mNB3xPMZ7UrzkRcBA7duDG4UzipkV+mkirFANEYbBo3QTY
 1JUHF4QPYiLWbLCZNIz1bv5217Ecz2XHIpXLRL/UB/TjDtDthFfPjwjWH9d0xAlnUF7Zm4gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=603 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_223221_377434_CAEE882E 
X-CRM114-Status: GOOD (  17.20  )
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



On 6/4/2025 10:34 AM, Miaoqing Pan wrote:
> 
> 
> On 6/3/2025 7:51 PM, Johan Hovold wrote:
>> On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:
>>> On 6/2/2025 4:03 PM, Johan Hovold wrote:
>>
>>>> No, the barrier is needed between reading the head pointer and 
>>>> accessing
>>>> descriptor fields, that's what matters.
>>>>
>>>> You can still end up with reading stale descriptor data even when
>>>> ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to 
>>>> speculation
>>>> (that's what happens on the X13s).
>>>
>>> The fact is that a dma_rmb() does not even prevent speculation, no 
>>> matter where it is
>>> placed, right?
>>
>> It prevents the speculated load from being used.
>>
>>> If so the whole point of dma_rmb() is to prevent from compiler 
>>> reordering
>>> or CPU reordering, but is it really possible?
>>>
>>> The sequence is
>>>
>>>     1# reading HP
>>>         srng->u.dst_ring.cached_hp = READ_ONCE(*srng- 
>>> >u.dst_ring.hp_addr);
>>>
>>>     2# validate HP
>>>         if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
>>>             return NULL;
>>>
>>>     3# get desc
>>>         desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
>>>
>>>     4# accessing desc
>>>         ath11k_hal_desc_reo_parse_err(... desc, ...)
>>>
>>> Clearly each step depends on the results of previous steps. In this 
>>> case the compiler/CPU
>>> is expected to be smart enough to not do any reordering, isn't it?
>>
>> Steps 3 and 4 can be done speculatively before the load in step 1 is
>> complete as long as the result is discarded if it turns out not to be
>> needed.
>>
> 
> If the condition in step 2 is true and step 3 speculatively loads 
> descriptor from TP before step 1, could this cause issues?

Sorry for typo, if the condition in step 2 is false and step 3 
speculatively loads descriptor from TP before step 1, could this cause 
issues?

> 
> We previously had extensive discussions on this topic in the https:// 
> lore.kernel.org/linux-wireless/ecfe850c-b263-4bee-b888- 
> c34178e690fc@quicinc.com/ thread. On my platform, dma_rmb() did not work 
> as expected. The issue only disappeared after disabling PCIe endpoint 
> relaxed ordering in firmware side. So it seems that HP was updated 
> (Memory write) before descriptor (Memory write), which led to the problem.
> 
> 
> 
> 
> 


