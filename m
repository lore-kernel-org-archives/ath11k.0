Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7173CD11BF
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP3CJvzB68AL2eNTCfS0fR/NdaIV2BOHr1dcun4WeRE=; b=yGsGsE+HXWbThT1UDqLoF6GOJa
	O45XE+30Vp5ogoR2z2r8wGP0yvMfX1H4EFvuwAtkI+GSHzaNrI7pqqzT4E5kLq9vD6kBD77MEAlYy
	By3Icfmu6lUv3RyuZB6IHO+F+5TfkwZB3yyaq0sZ68xr3NNxurovQgCtNDU5Gum211nsXPAwqn701
	eTSaRwFNyIrdXIyWJ0lTD/AMpePRqnqMnFh/mt5yF9HpJVlPOFu1Hou3nXmMgbVhGRvVLpRxwJPbY
	1vRSdqBPrsQubTSEcFp64iwYfxnfedJXlp2PPGM+iwLA+yhI/MBbIPk2TaiLGf/JX7sg6afXFXbR5
	ubs1Jwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8am-00000001dh9-3iLs;
	Thu, 21 Mar 2024 02:55:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8ak-00000001dfo-19KG
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 02:55:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L1u4DT017430;
	Thu, 21 Mar 2024 02:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JP3CJvzB68AL2eNTCfS0fR/NdaIV2BOHr1dcun4WeRE=; b=WD
	qe1HTk/zxiYeXRL9L1ga5T8GtkAnh3tpMf+7oQFKKxtgYI9/uCGFHfT11zKVoZsF
	N3UZ5/B5WppOjb9TDLYZQo26vvzreshxK5hHktqTPIuzvnxa1TLfLdSdPlkjZ7TZ
	X3U2zFN1ZutIScIkEcFSewWIUfL6UKXZRiURJZjwUsLyeRfu20AsmX3BiVG8fK+x
	BEpWcnXAMv9mcnrqINCBX5DEBcnwI8tthGSEG2kxXgOPrZ7zq6ZnoPU13BLPWONu
	EHGHt1EDZMVvQOsjkbY1ySPkavwSGFZ4WgAPSpywxLquKV2KH6Y5ItPfTZhHU48G
	HKlaIzVQYaiDxGFTZfvQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x038xs5g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 02:55:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42L2tb2X008490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 02:55:37 GMT
Received: from [10.110.69.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 19:55:36 -0700
Message-ID: <2ef372a8-7d9f-4a9e-a664-cb8170487911@quicinc.com>
Date: Thu, 21 Mar 2024 10:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal strength in station mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
 <171034681684.2322265.9660346495295315212.kvalo@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <171034681684.2322265.9660346495295315212.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Eofo4WGdy1UcS_H-e0zJ_VHrP4-iG_Mj
X-Proofpoint-ORIG-GUID: Eofo4WGdy1UcS_H-e0zJ_VHrP4-iG_Mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_14,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=982
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_195542_470965_F2969AD0 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On 2024/3/14 0:20, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> wrote:
> 
>> Currently, the calculation of the average signal strength in station mode
>> is incorrect.
>>
>> This is because before calculating the average signal strength, ath11k need
>> to determine whether the hardware and firmware support db2dbm, if the
>> hardware and firmware support db2dbm, do not need to add noise floor,
>> otherwise, need to add noise floor.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> What about AP chipsets like QCN9074, do they also work similarly?
> 

yes, i asked WIN's colleague Ashok Raj Nagarajan for helping to test 
this patch.
they work similarly.

Best regards
Lingbo Kong

