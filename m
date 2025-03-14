Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9376C282DE
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 00:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDRWHFruEAw8rPKa3kcGgs8v9/GUou8yTUSzmrvxDdM=; b=jTAkkN3y1w1noQrxI8VsuxA2li
	83lD8tYKqTMyhQK7Ln8CLDJeV+bIPRQe3uXavcGXJ8GEwCsJmSSX/x/lENfJBlF+cp+yFxF0wS07P
	mIOl8+OZOP5lO2nJIuhU4pvpGpw975n/7EhJEXchsWkXt+7kJO5vtUfWmhFqNeqK/Hd5rfoX9EAPz
	g2BdGi82RqBG8p1yH8K/y9erBenfVdSAgAjUpy55+dAV0vqqRSMvxZZ2nBizucMLZMx5FUBU7g5vX
	hy9aNtr8FmoIKT/qPVOBHsVWvaOo52TMEtXzplmtj2nfWL0oHL71e5+tJ3vtZCOaeun8l0GkRFEDf
	ngvTQuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstG9-0000000Cq0h-1Pip;
	Fri, 14 Mar 2025 00:50:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstCT-0000000CpZg-2kYJ
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 00:46:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNQF87016250;
	Fri, 14 Mar 2025 00:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDRWHFruEAw8rPKa3kcGgs8v9/GUou8yTUSzmrvxDdM=; b=fSmv1uv2MQgLy0gj
	+vvJuNufAluGALzRhWf/zQID9l2Y8w65znN9MzHElqEiVBI3DM6y2DvFRpV7LTfy
	yAUgEqiHmPPycknnLhWrA7H52VCQZ4FJCzIykOCKtuTlF/U01QewC2YTCTOvLuJa
	R93F1eeFAMIjS6s1un4nQj34DVPcWXXu/SAp4w98iNHuUDJg5/f77/o33vD93F5G
	3n014c1yEH5HToSNoywUgDpdlmNNUk4yJ266F3SHGew2poe8ouONrEND1wIqFOv3
	a6qmFiP0MqnGP/sz1w4zbTA60Uz7cIWWqAE94tkLA4D5tuW5a31ndiuyZ0fLkdTF
	lzlNow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nykad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 00:46:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52E0ksUJ021665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 00:46:54 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 17:46:52 -0700
Message-ID: <08cfa289-111c-416d-8e5a-971961d954ca@quicinc.com>
Date: Fri, 14 Mar 2025 08:46:50 +0800
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
 <8251fc50-5df4-4a3f-91bf-40c09c33cf6e@quicinc.com>
 <Z9MAehaipGtwge8p@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z9MAehaipGtwge8p@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s6thM_5dezFFUxWCR1GvHQaUizI7jz3p
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d37c7e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Wml-KaHhdQLM07Bvzy4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: s6thM_5dezFFUxWCR1GvHQaUizI7jz3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_174657_728801_562150E6 
X-CRM114-Status: GOOD (  17.81  )
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



On 3/13/2025 11:57 PM, Johan Hovold wrote:
> On Thu, Mar 13, 2025 at 09:41:51AM +0800, Miaoqing Pan wrote:
>> On 3/13/2025 12:43 AM, Johan Hovold wrote:
> 
>>> I've taken a closer look at the driver and it seems like we're missing a
>>> read barrier to make sure that the updated descriptor is not read until
>>> after the head pointer.
>>>
>>> Miaoqing, could you try the below patch with your reproducer and see if
>>> it is enough to fix the corruption?
>>
>> Sure, the stress test is running.
> 
> Thanks.
> 
>>> If so I can resend with the warning removed and include a corresponding
>>> fix for ath12k (it looks like there are further places where barriers
>>> are missing too).
> 
>> If the DMA read barrier works, do you think my submitted patch series is
>> still needed? Because the error handling is incorrect.
> 
> Yeah, it would still be good to fix up the error handling even if you
> don't expect to ever see a descriptor with length 0.
> 
> But unless the device is doing something wrong here, there shouldn't be
> a need for peeking at the descriptor and retrying.
> 
> Johan

New version will be submitted based on the previous discussion.

