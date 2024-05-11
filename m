Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37A3C25B10
	for <ath11k@archiver.kernel.org>; Sat, 11 May 2024 03:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQbJvDTDrl02dIQQnb7RNH6pl73AWqV5I1YMx8caNSA=; b=ubEVTMeLBXpalTl79NFuLJKLH9
	d1d7/8tE05ojqrGyxuRYSRoW5hetUQGFtaiPcJ+APCISQTqVHPo81cffVVb9OC5xEG/QbVGsHYbp5
	9EoT+IRuKKfTj9yscuec8F1v1+azMADV6+8QuPYIumwAvOT05L4V8niwIbohVx4kcNdF1t8A0p3jj
	1c3gPdsWxl55zGSH/yGGnxAKPYPaTMVCRvnnc13LICwGudEYuYA4ydlQshUnbI8Wz0/kw5HSyAnQZ
	crj/CSjvtNkl8487/x0mQgc6E3HGfWoqcALZk59GQMPJOYu2qTpTqE4phKry1wVFy5OEs7+7DnfBk
	h/D0Kk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5dA7-000000079zw-1qHn;
	Sat, 11 May 2024 03:12:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5dA4-000000079zV-2vjQ
	for ath11k@lists.infradead.org;
	Sat, 11 May 2024 03:12:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44B2qv49029832;
	Sat, 11 May 2024 03:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:cc:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SQbJvDTDrl02dIQQnb7RNH6pl73AWqV5I1YMx8caNSA=; b=YY
	TDL263pXNpDRLoK4C/+t2mnuJ+xVi4gOCzDh882QjlaXXT9vK8zZsrOxp7N+nCkf
	bbYmVcWPkM4k99GJzYmnm3awYEU8um++WbmU0p4mHoLhErEb2uHUaCOp24iWv4ob
	O+edczKfZPSubs+Crm7PB0Xbn3w7iNHo61DIepkYWUGB/5v6C921wJQho/Q2gijN
	z+4MUSa7cwVYL4XyeGlmwdzvaYnh+j1Z/80q4K2KTWK53eDHQooBAES+9pP6T74H
	vHAGa/OBKUaT5Kg+2Iy1mDVufIpNs3IQ9GutyR3AnIYVAT9/ustomAiOgfCvyjQ8
	avVo/wvewfagc1PTq2hA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y208vr0q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 03:12:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44B3CUE9001504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 03:12:30 GMT
Received: from [10.253.8.22] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 20:12:28 -0700
Message-ID: <4e21e556-527f-4d1e-aa29-cacec14155af@quicinc.com>
Date: Sat, 11 May 2024 11:12:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <quic_cjhuang@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
To: Kalle Valo <kvalo@kernel.org>
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
 <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
 <871q69lqh5.fsf@kernel.org>
Content-Language: en-US
From: Carl Huang <quic_cjhuang@quicinc.com>
In-Reply-To: <871q69lqh5.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0RwQJzx9_jyYlKQP-grVuROwfwo3bdnS
X-Proofpoint-GUID: 0RwQJzx9_jyYlKQP-grVuROwfwo3bdnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_18,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_201236_899048_89CC2D32 
X-CRM114-Status: GOOD (  15.05  )
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



On 2024/5/10 21:57, Kalle Valo wrote:
> Carl Huang <quic_cjhuang@quicinc.com> writes:
> 
>> On 2024/5/10 18:18, Kalle Valo wrote:
>>> "Luca Weiss" <luca.weiss@fairphone.com> writes:
>>>
>>>> On Fri Jul 14, 2023 at 4:38 AM CEST, Carl Huang wrote:
>>>>> Add hardware parameter support_dual_stations to indicate
>>>>> whether 2 station interfaces are supported. For chips which
>>>>> support this feature, limit total number of AP interface and
>>>>> mesh point to 1. The max interfaces are 3 for such chips.
>>>>>
>>>>> The chips affected are:
>>>>>    QCA6390 hw2.0
>>>>>    WCN6855 hw2.0
>>>>>    WCN6855 hw2.1
>>>>> Other chips are not affected.
>>>>>
>>>>> For affected chips, remove radar_detect_widths because now
>>>>> num_different_channels is set to 2. radar_detect_widths can
>>>>> be set only when num_different_channels is 1. See mac80211
>>>>> function wiphy_verify_combinations for details.
>>>>>
>>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>>
>>>> Hi Carl,
>>>>
>>>> Unfortunately this commit breaks wifi on a QCM6490 smartphone
>>>> (qcm6490-fairphone-fp5) and makes the board crash.
>>>>
>>>> Reverting this commit (plus for conflict resolution 5dc9d1a55e95 ("wifi:
>>>> ath11k: add support for QCA2066") and 24395ec11707 ("wifi: ath11k:
>>>> provide address list if chip supports 2 stations")) makes wifi work
>>>> again.
>>> Thanks for the report. So the broken commit is:
>>> f019f4dff2e4 wifi: ath11k: support 2 station interfaces
>>> This went into v6.9-rc1 so I'm guessing that WCN6750 support will be
>>> fully broken in v6.9? Not good. And most likely Linus will release v6.9
>>> on Sunday so it's too late to get a fix included in the final release.
>>> Carl, can you fix this ASAP? Or should we just revert the broken
>>> commits?
>>> Adding this to our regression tracking:
>>> #regzbot introduced: f019f4dff2e4 ^
>>> #regzbot title: ath11k: WCN6750 firmware crashes during initialisation
>>
>> Kalle, looks we're not able to fix it before Sunday as I don't have
>> WCN6750 setup to verify the fix.
> 
> We are so late in the cycle that we would have to send the fix directly
> to Linus and ask him to apply the fix before he tags the release. I
> prefer that we are on the safe side here and send the fix to v6.10-rc1
> via the usual route (the wireless tree). We get more testing time that
> way.
> 
No problem, Kalle.

I think more tags are needed like Tested-on WCN6750 and Tested-by Luca.

I'll send out the formal patch next week.

>> The fix could be to define a dedicated function
>> ath11k_init_wmi_config_wcn6750() for WCN6750. I'll send the patch out
>> so others like Luca can have a try.
> 
> Thanks for the quick patches!
> 

