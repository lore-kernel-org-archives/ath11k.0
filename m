Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A0C282DE
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyd0PuPrEvZkRqftsj8rSODoPBjUNY/8AIQClt1j3Qs=; b=iCqhDTD1/D0hab/OqBvgbVL1ur
	jEWP+9O4ndf78rNGXSIfbNWEYNqDtQvIvYERRShmmjuk95IWemPnyFJtGy8wTjzyu3WeDAa2VJaRl
	vCcQRQYr7kmnZhDNt2FRPU4IHifZ+Yk6gG11ZsKzH3VXHJbNK1mhyZeYyNEK6zAu5YZz1eVpU19vE
	3a6ElHdmiBaAspFAgsdFIdg/UEJJTeZ/heT8pRHEN1BdItIioygLYAEzmpP14otBK16Gram1glbU8
	jSR6WZT3v9W6MNJ5/OaIVG6zOTp2qBJJZOSGEr4Q8OpzWqvX438SngD7QUMVZ+EMKLM+RAYKq8lF5
	I5Bcs+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstQp-0000000CqnL-2UgX;
	Fri, 14 Mar 2025 01:01:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstQm-0000000Cqmz-46Du
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 01:01:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DH54pN022314;
	Fri, 14 Mar 2025 01:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyd0PuPrEvZkRqftsj8rSODoPBjUNY/8AIQClt1j3Qs=; b=H68JwsM6s8uCo40m
	pITvehJolHf2NX9NxsLbyHM0wV0nKcUpTl78+Sz00pGlm8S1I4EKggd8LxwDHXb/
	99PXW7MYhJgFisSlddCg5M2DcCK5Bsqo8ldc3/ypnVwppqC4fmBe6oRwCtGgmZbL
	OpsUM/07oMTknQVS1gRMjSVRLbTorM3ubrvUkItHIlhwRJGpSmY6r/wokfA1rytQ
	nHzgBXTQUefX3UqLvDhQFkqozBongsAN1++0ff4Nkueehxk9h8tBq3nBJxc85ci6
	A+ee+LpWYVyucug4+WCzNu1okD2Ut7Ab+D6r6cW892JSkea33IdJcgoXt10A8Mhv
	ORlglw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07jk5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 01:01:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52E11eGJ010213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 01:01:40 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 18:01:38 -0700
Message-ID: <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
Date: Fri, 14 Mar 2025 09:01:36 +0800
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
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z9METTzUJe9yqVEI@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u5GL11KPMAC99vtp7stGvfgBIP4VKSzo
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d37ff5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=zLdDCIhI1WCwxeRDdpgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: u5GL11KPMAC99vtp7stGvfgBIP4VKSzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=837
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_180145_139698_7F5E516E 
X-CRM114-Status: GOOD (  24.05  )
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



On 3/14/2025 12:14 AM, Johan Hovold wrote:
> On Thu, Mar 13, 2025 at 09:31:56PM +0800, Miaoqing Pan wrote:
>> On 3/13/2025 12:43 AM, Johan Hovold wrote:
>>> On Wed, Mar 12, 2025 at 09:11:45AM +0800, Miaoqing Pan wrote:
>>>> On 3/11/2025 11:20 PM, Jeff Johnson wrote:
> 
>>>>> That didn't answer Johan's first question:
>>>>> Are there ever any valid reasons for seeing a zero-length descriptor?
>>>>
>>>> The events currently observed are all firmware logs. The discarded
>>>> packets will not affect normal operation. I will adjust the logging to
>>>> debug level.
> 
> Have you looked at the device side of things as well? Could it be that
> the firmware is doing something wrong when forwarding the logs?
> 
> How sure are you that you only see this with firmware logs?
> 

Checked, no issues have been found so far.

>>> I've taken a closer look at the driver and it seems like we're missing a
>>> read barrier to make sure that the updated descriptor is not read until
>>> after the head pointer.
>>>
>>> Miaoqing, could you try the below patch with your reproducer and see if
>>> it is enough to fix the corruption?
>    
>>> +	/* Make sure descriptor is read after the head pointer. */
>>> +	dma_rmb();
>>> +
>>>    	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>>>    	if (*nbytes == 0) {
>>> +		WARN_ON_ONCE(1);	// FIXME: remove
>>>    		ret = -EIO;
>>>    		goto err;
>>>    	}
>>
>> This issue can still be reproduced.
>>
>> [ 3283.687469] WARNING: CPU: 0 PID: 0 at
>> /drivers/net/wireless/ath/ath11k/ce.c:405
>> ath11k_ce_per_engine_service+0x228/0x3e4 [ath11k]
> 
> Thanks for verifying.
> 
> Which platform are you testing on and which kernel are you using?
> 
> I'm still waiting to hear back from some people testing my patch on the
> X13s (sc8280xp).
> 
> Johan

qcs615-ride, kernel 6.6.65.

I think the hardware has already ensured synchronization between 
descriptor and head pointer, which isn't difficult to achieve. The issue 
is likely caused by something else and requires further debugging.


