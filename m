Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D26C35FF6
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWMYNBNQo3yjPtpzhw+4+UtwxWTkNI2J/wxly3kI7cw=; b=RhWAj5rYw4sICM2zNuKCEM5YUu
	4F947oLM7KxdEaO2l2f1vHoLxLyATWepDvWbh5AcgoYBszWVpwkyRGwAB19U61RYsbJ+itRN1fNpE
	FS98ZN6azNh2LK5hQbmjQ/fuQHtOv8NswazzXOg1AGfcNiAbQ0qyffn4JArGoXcKkRIGR4oUSB33K
	on5mJ7qVfyDLpqS3QcpPth5hlSoJAqlh/xvIiXopjozMtHsiITtHhM5N0265vCOPNaHx9Fo559Goa
	BSivFvJ5p6HKQE9fl4rp3y7DIDKBr1MfVKbzpVniVA2hJQJK4Z5JzwRnFXQY+fHECGFZ6wwizZvFQ
	hUN3KHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0JE-0000000DRUF-1p29;
	Fri, 14 Mar 2025 08:22:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Gn-0000000DQmd-2kRy
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 08:19:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNugE7031769;
	Fri, 14 Mar 2025 08:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWMYNBNQo3yjPtpzhw+4+UtwxWTkNI2J/wxly3kI7cw=; b=RjmXgv775sM1hOMd
	6HMJRyboNt7SN/4B9mfZFltdEBrXkTZe7BMCWdXAcU7NERlapv/FEcgWD/+mZ4nw
	pby5qOtwBKugEg/9cvCL3x5kjPQB1oCAlh0ZFqJ2sQwOsn4YbhzN9J+Yjz/ojy0s
	SQYFO/mcDIeqwtey381a5UlQN/AIbCoGfeJqqd/9Io/U0utYwBetYiZdZfD2Qpqg
	nJSUTnzoOiadjkTI9AW8YPe7qUQg9isVsv2Bfnxk/Gci67O7vxz2I27PPZxDMg8l
	kif9Fu65XtcobnArhhZRMtMLnXtzf1GpKCYDvs4HYb6xuPjEbuGXHZiAFGWULz0D
	bTDgOA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jjyhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 08:19:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52E8JoXx009396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 08:19:50 GMT
Received: from [10.253.39.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Mar
 2025 01:19:48 -0700
Message-ID: <9e1fd1ae-e770-44a7-81b8-696b76c71850@quicinc.com>
Date: Fri, 14 Mar 2025 16:19:45 +0800
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
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
 <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d3e6a7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=IgN2TWT-nG-ZWJAHbY8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: o8zj47opkgqqgW2nFBn1kG00Ec9lddI2
X-Proofpoint-GUID: o8zj47opkgqqgW2nFBn1kG00Ec9lddI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=746 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_011953_718759_56933DD5 
X-CRM114-Status: GOOD (  20.15  )
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



On 3/14/2025 4:06 PM, Johan Hovold wrote:
> On Fri, Mar 14, 2025 at 09:01:36AM +0800, Miaoqing Pan wrote:
>> On 3/14/2025 12:14 AM, Johan Hovold wrote:
>>> On Thu, Mar 13, 2025 at 09:31:56PM +0800, Miaoqing Pan wrote:
>>>> On 3/13/2025 12:43 AM, Johan Hovold wrote:
> 
>>>>> +	/* Make sure descriptor is read after the head pointer. */
>>>>> +	dma_rmb();
>>>>> +
>>>>>     	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>>>>>     	if (*nbytes == 0) {
>>>>> +		WARN_ON_ONCE(1);	// FIXME: remove
>>>>>     		ret = -EIO;
>>>>>     		goto err;
>>>>>     	}
>>>>
>>>> This issue can still be reproduced.
>>>>
>>>> [ 3283.687469] WARNING: CPU: 0 PID: 0 at
>>>> /drivers/net/wireless/ath/ath11k/ce.c:405
>>>> ath11k_ce_per_engine_service+0x228/0x3e4 [ath11k]
>>>
>>> Thanks for verifying.
>>>
>>> Which platform are you testing on and which kernel are you using?
>>>
>>> I'm still waiting to hear back from some people testing my patch on the
>>> X13s (sc8280xp).
> 
>> qcs615-ride, kernel 6.6.65.
> 
> Ok, so a downstream vendor kernel?
> 

Yes.

> qcs615-ride does not even have PCIe enabled in mainline yet, but I
> assume that's what you use here?
>   

Yes, also reproduced on qcs8300-ride.

>> I think the hardware has already ensured synchronization between
>> descriptor and head pointer, which isn't difficult to achieve. The issue
>> is likely caused by something else and requires further debugging.
> 
> Yeah, but you still need memory barriers on the kernel side.
> 
> It could be that we are looking at two different causes for those
> zero-length descriptors.
> 
> The error handling for that obviously needs to be fixed either way, but
> I haven't heard anyone hitting the corruption with the memory barriers
> in place on the X13s yet (even if we'd need some more time to test
> this).
> 
> Johan

Agreed with you, let's waiting for the feedback.

