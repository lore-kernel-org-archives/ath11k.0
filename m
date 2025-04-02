Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C0AC28B20
	for <ath11k@archiver.kernel.org>; Wed,  2 Apr 2025 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkcFHpWEAlY4rM9aIyFAYhMCRoLN5VKa+BwF+yLsfpc=; b=oRB3ORxid/gXNBT3PrPPpNMORS
	g+8o8kwB9VGQE+kXFayyATEqcXbT0pNHpTd+w+OWmKXMH5WGAiu+xVXp/JhUHLrYHVhnSbAP4BgHl
	DMtlKoOqUxbX6K5be2AG4LOTEWnwFv4y5pkxCKg+P2XyDloramO+/X2CbqnciS6EyX5X6aONfGXUz
	0kaDbb4v5MkwHJuoyk8o/JGbo2fmCtreHKjhyZYRwKgcUWtNRm6kis/rdROwQlm9Ha/lqjYcHGKgp
	Dp9iCyrm8GkmzXC7lylUZby8qxOwMgmytiPgpyC+kT/e03Zzd/USMDkMkx/XSCVg8J6GOdct6P/hp
	/vUCSg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxA5-000000064Hp-3dP4;
	Wed, 02 Apr 2025 12:25:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx82-000000063zL-03wz
	for ath11k@lists.infradead.org;
	Wed, 02 Apr 2025 12:23:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532C0JZY007268;
	Wed, 2 Apr 2025 12:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkcFHpWEAlY4rM9aIyFAYhMCRoLN5VKa+BwF+yLsfpc=; b=oTvPllBLGAaIe5u+
	OmbTk8Im+MvIdNV3CJREpZ4yrkl+jITWrbvM2mKbOp7xe01eCoB9Vpiyw1g9pFy8
	tXWfy6KJLnirJ+IaweQMrA3c0ZjzclLO5/BbOEBjroqJpV7Cg2EgP7UjfYbgwuBg
	06gVEQtZHVFQ01cY3r3oRHElotfs46J+h3z/qFwuGALsipAviWg1OAa7TL9MmTkY
	OZ3XWeUXLHXOBwl42D5Ady7H95ZlySWzCerm8oNEOHRs9Z9SDRBv9izc617JumQk
	CqZm+P6NohzDA+cDHnjzlOqampYFP6Od+dPhtLswOsYY3bINrtYYtUwRVXXeKwt6
	uN4+bA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7yk8gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 12:23:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532CNRO8021059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 12:23:28 GMT
Received: from [10.231.195.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 05:23:25 -0700
Message-ID: <1eb3933d-9aac-4e47-a7a5-818aa18b137a@quicinc.com>
Date: Wed, 2 Apr 2025 20:23:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
 <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ed2c41 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tPUOBYC6UmroMFteW7gA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4Q3ha7XTLwWm7TH7As6SR4qYtZIU77iW
X-Proofpoint-ORIG-GUID: 4Q3ha7XTLwWm7TH7As6SR4qYtZIU77iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=786
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_052334_177929_BA5A8666 
X-CRM114-Status: GOOD (  12.98  )
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



On 1/16/2025 8:31 AM, Jeff Johnson wrote:
> On 1/15/2025 5:03 AM, Jose Ignacio Tornos Martinez wrote:
>> Hello Yuriy,
>>
>> Thank you for the information.
>> My platform, as you said, is just wcn6855 hw2.1, but using NetworkManager
>> with the default configuration.
>> If this is the only stopper, you can skip and not consider as a wrong case,
>> because (sorry for repeating) it is just a matter of the number of available
>> resources that can be adjusted after some research from us.
>>
>> Thanks
>>
>> Best regards
>> Jose Ignacio
> 
> Thanks,
> 
> I was hesitant to take Yuriv's patch since your problem was not fixed. But I
> guess you are already broken with the current code, so I'll take his patch,
> and then we can work on fixing any other issues from there.
> 
> Kalle, can you review? You currently have this deferred in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/
> 
> /jeff
> 
Jeff

Could you help it?

Thanks,
Yuriy


