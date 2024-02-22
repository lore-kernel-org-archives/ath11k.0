Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BF1C48BEB
	for <ath11k@archiver.kernel.org>; Thu, 22 Feb 2024 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pfot7sAKRzjoMPJH/FBh9iX8mxb5jR44xgnyvxe9w3A=; b=ojhn8ZDOX/iHmHGWlN7FnlIz4O
	j5k+VVHn0AyMfzJC7s8sXfotTHrCGGmyyRN7qOBkc2MqC6hWLGaWMZJpKaP+kYM0Z6RobR7Hs/eIH
	wzidyLJxGmmpYrHV7IHrUNBZb8licea6nZEKDtWY0LaOMZSyZb+7DMZBdCWYcQF2Yh89SFRehGNt1
	zCm0LF8uWXuDiEEoa23bRcFbFJEGtepoHxKAzdvsTaMClztH3/brz4YArYW9e6iGHD7jYcAANBMMJ
	hBbJcLuFqL35L/vOQtjzLYYccv6QwM3ZPYgE4bnS51m4ok3GgMAzZdYFgoEBhjhaYWQZsnLIMPFDS
	l1PNzViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcyun-00000003GE0-2iNZ;
	Thu, 22 Feb 2024 02:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcyuk-00000003GDa-2YoB
	for ath11k@lists.infradead.org;
	Thu, 22 Feb 2024 02:34:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LNoOqp020539;
	Thu, 22 Feb 2024 02:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Pfot7sAKRzjoMPJH/FBh9iX8mxb5jR44xgnyvxe9w3A=; b=Fg
	yQFe6W6y9waBMoTqk66EaY+ha0J9286yY7SL99sBp28YKTsbyiMHRoxxVUvqClcr
	2oZ5uYug19eHIxhVGH7sn5RBs0qonxzkqPhyz6bCd0RuXyUouC0ZjQd6IVjSQAqE
	y77Bf+U1GtJcB2rXCXk/+iI8lOiWus8PCa4piRReTJyaTSTu0vUhuqpm70O2euIP
	l+LkQYygJmAg9alUppQdVlnC019x3P7/OWv4PupnI03qUyq8Gaa4RCzN+16MpuVT
	epvT5nETRKgCotsoHIqvOMXrAg4NTNP041cQbcHL6zgi1dibWWMLtQ9uDfvZUbbC
	W8Yfv0FY0ujQBRTdIllg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdpjn8uhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 02:34:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M2YLVw030842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 02:34:21 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 18:34:19 -0800
Message-ID: <5828b835-6b4d-4245-991a-7f6b54ee8b51@quicinc.com>
Date: Thu, 22 Feb 2024 10:34:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath11k: thermal: don't try to register multiple
 times
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        "Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
 <20240221024725.10057-6-quic_bqiang@quicinc.com>
 <df08dfd4-189c-407b-8a2e-6fd2bbf3b22f@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <df08dfd4-189c-407b-8a2e-6fd2bbf3b22f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uV9foEl_WsDLbFi93Q31RYrhryUItgOF
X-Proofpoint-GUID: uV9foEl_WsDLbFi93Q31RYrhryUItgOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_01,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=984 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_183422_694747_629BB69C 
X-CRM114-Status: GOOD (  18.47  )
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



On 2/22/2024 1:15 AM, Jeff Johnson wrote:
> On 2/20/2024 6:47 PM, Baochen Qiang wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> Every time the firmware boots we call ath11k_core_qmi_firmware_ready() which
>> ends up calling ath11k_thermal_register(). So we try to register thermal
>> devices multiple times. And when we power off the firmware during
>> suspend/hibernation (implemented in the next patch) we get a warning in resume:
>>
>> hwmon hwmon4: PM: parent phy0 should not be sleeping
>>
>> Workaround this similarly like ath11k_mac_register() does by testing
>> ATH11K_FLAG_REGISTERED.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> you need to add your own S-O-B
Oh, sorry for missing that.

Hi Kalle, I see you have put this series in pending branch. I am 
wondering if I need to send a v2 to add my S-O-B tag, or you have any 
other plan?

> 
>> ---
>>   drivers/net/wireless/ath/ath11k/thermal.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
>> index c29b11ab5bfa..41e7499f075f 100644
>> --- a/drivers/net/wireless/ath/ath11k/thermal.c
>> +++ b/drivers/net/wireless/ath/ath11k/thermal.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <linux/device.h>
>> @@ -163,6 +163,9 @@ int ath11k_thermal_register(struct ath11k_base *ab)
>>   	struct ath11k_pdev *pdev;
>>   	int i, ret;
>>   
>> +	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
>> +		return 0;
>> +
>>   	for (i = 0; i < ab->num_radios; i++) {
>>   		pdev = &ab->pdevs[i];
>>   		ar = pdev->ar;
> 

