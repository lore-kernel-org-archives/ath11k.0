Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE8FC25B77
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 01:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWjzaiPWRuE3Vzeje4HCkWx7RJMXwE1DcD52t2iq+IE=; b=or4VosnmoEL3PfPoVrgdPwnuUB
	NizeBdBWUWEb48QKo5ysPm17p35Y7EAYkH9uBgsP+Jn3L1Mh9dQ+SE/2bqclEdsJ6dKDztWyMHhBF
	KSxkf+sIrgpnLAQFR3Kv+RIs3seYqZAhc8BIQMS7C8BjsY4F42+bTm8++VHZ7fJaPt5yIHAWY32og
	bf62Ai6ZPHclpHCi00zXbXVemHLgEeUnVedpsVliOCR2xfTv4rOsB2ex+jUSW3eNKvb0WhX4hH/Vr
	sklbgQpLT20fsfB0iCpSd/r/kG16vesz11aeTQk6RzcPquMN1EGZwj7JdU4JI6QSDxYY5V3oShjQS
	dBTORyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Efq-0000000G1LB-1J0X;
	Tue, 21 May 2024 01:52:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Efn-0000000G1Ka-2zU8
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 01:52:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KDT005002246;
	Tue, 21 May 2024 01:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=TWjzaiPWRuE3Vzeje4HCkWx7RJMXwE1DcD52t2iq+IE=; b=io
	AkHrhEq+H0QhA5ginnabSrRj7x1+AQ2gwBp4xUE/LuQImKwxfpUuwdvVkw8a42jj
	G5t5fjRxcfV9mrq3D+FcDf7QP64/no3lj4OgvMFIzU+k8sxzicgAimnFfD/yzeOr
	RUYYIc8Kblet5VT1k6jJhK/W0SwujE6mjsxP8PIeM7+ohoUXhJCSUCJ1FrH68T/w
	HzU7Tt2XxTEbWp8Bsso7PmQjFp6gQqbdqOhfgf/X3tYz25a0qSzqI5dimEfWvhPd
	eWCJcolq9dvBv+AjeYQsRl6hy1CaK1QfxYTl+pncXUTtOHL/o3fjxtdQx3Cglu1v
	pSiTYD/UosJmc1BsMX8w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gcphc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44L1q9AZ019088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:52:10 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 18:52:08 -0700
Message-ID: <b6b23a29-78ef-4e4f-8042-e13833fcb1ec@quicinc.com>
Date: Tue, 21 May 2024 09:52:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <regressions@lists.linux.dev>
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
 <87wmo0k71i.fsf@kernel.org>
 <3dc28f34-45cc-4e14-b9ea-1f7b78a6a591@quicinc.com>
 <87h6esebu8.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87h6esebu8.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2hWElVs2tP-fpMHWuJBzUgjqxBzoLjQO
X-Proofpoint-ORIG-GUID: 2hWElVs2tP-fpMHWuJBzUgjqxBzoLjQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_185215_968360_563FA6A7 
X-CRM114-Status: GOOD (  15.10  )
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



On 5/20/2024 11:34 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 5/11/2024 5:54 PM, Kalle Valo wrote:
>>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>>
>>>> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>>>> ath11k fails to connect to 6 GHz AP.
>>>>
>>>> This is because currently ath11k checks AP's power type in
>>>> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
>>>> However with above commit power type is not available until ASSOC stage.
>>>> As a result power type check fails and therefore connection fails.
>>>>
>>>> Fix this by moving power type check to ASSOC stage, also move regulatory
>>>> rules update there because it depends on power type.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI
>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>>
>>>> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>>
>>> Oh, this fell through the cracks. Commit bc8a0fac8677 was introduced in
>>> v6.9-rc1 so I should have sent this to v6.9 but it's too late now. I'll
>>> need to queue this for v6.10 via wireless tree.
>>>
>>> Adding the regression also to regzbot:
>>>
>>> #regzbot introduced: bc8a0fac8677
>>> #regzbot title: ath11k: connection to 6 GHz AP fails
>>>
>> Hi Kalle, with an upcoming patch this regression is expected to be fixed:
>>
>> https://lore.kernel.org/all/20240506214536.310434f55f76.I6aca291ee06265e3f63e0f9024ba19a850b53a33@changeid/#t
>>
>> So here the ath11k fix would not be needed any more once above patch got merged.
> 
> What happens if we apply both patch 'wifi: ath11k: move power type check
> to ASSOC stage when connecting to 6 GHz AP' and patchset 'wifi:
> mac80211: build TPE handling'? In other words, do they conflict from
> functionality point of view?
No functional conflict, 6 GHz AP connection would also succeed with both of them applied.

> 
> I ask because I suspect Johannes is planning to take patchset 'wifi:
> mac80211: build TPE handling' to v6.11 but we should fix the ath11k bug
> in v6.10.
> 
>> But I don't have time to test this, so suggest keeping it pending. We
>> could drop it once above analysis got verified.
> 
> BTW for some this patch wasn't in the pending branch but it's there now.
> 

