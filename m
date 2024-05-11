Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B709EC25B10
	for <ath11k@archiver.kernel.org>; Sat, 11 May 2024 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQKzXWC6ppx+6MllNXSbbJaAbYoPLAQn1w7SipaJxC0=; b=4vSvUE5otX/yQVdlmRUnawF1IF
	6pOjQJHXrThndUEOeCJn9WdrLXGfNY8odXb6bht7wM+eTtjKoMM/Ns7ZPalaGXGbuTykzCygEEHUS
	/1ySIQ2akCjP93ODwbK43W72edCotc+5oGuu506lBxOJIYNzxnXXa0MRP2qE2t3kdGogRSq6VbXt7
	x8gSzGZqd8z81lbpEzLMW7TENSKUqNUBBn986bJcpQbILx8v9mIsioXOSYRPYAxemZTb0EH7v8X7j
	uJOsjsrcftBzlMFy0m0ra0OJ4pz78ykQmA07J6WvBSWqyzzZ/4c+AHg71C63OSaLKXebLHT/6gywz
	gGoruaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5cpA-0000000780p-0bau;
	Sat, 11 May 2024 02:51:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5cp6-00000007805-0VRC
	for ath11k@lists.infradead.org;
	Sat, 11 May 2024 02:50:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44B1oCG8011434;
	Sat, 11 May 2024 02:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:cc:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nQKzXWC6ppx+6MllNXSbbJaAbYoPLAQn1w7SipaJxC0=; b=Uy
	RprLxk+udaFk16txGvMUlTsJJvmTQ+KJj0tJP30L/c6Xk2rUXIErLejfSKH3xMp5
	bHvBhMqPH80f3OR9ayadbqq0WiY7JufW/FFlNqP7horO+YWerpMGKYAsOfFT24dh
	rOFiAjc5umvo1oQaKf/n742QRzrHH5fxXM1dfjsqk9rK3bjEHqlSrtxW0shBTJ+4
	WkmMwPE0zaqY+Qw6muaRmp37Iek3SZjGtdIU7bBCuxPLYPTz0ip9p3FK0BGppRjP
	cZCBq8SncJOXLRx/89xbA8zjYRhTj2sdzSoLoV9sHVQMhSujwzoWxyTecbYT0kNj
	/qWWplLUjC42CDp79fZg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1ybx01yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 02:50:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44B2olNB004390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 02:50:47 GMT
Received: from [10.253.8.22] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 19:50:46 -0700
Message-ID: <88af0514-d618-4a47-94d4-163b0e58b9f2@quicinc.com>
Date: Sat, 11 May 2024 10:50:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <quic_cjhuang@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
To: Luca Weiss <luca.weiss@fairphone.com>, Kalle Valo <kvalo@kernel.org>
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
 <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
 <4d60ccf3-455d-4189-9100-d35488b00236@quicinc.com>
 <D15ZZ5V3YU6Z.10FO9XK11WXFB@fairphone.com>
Content-Language: en-US
From: Carl Huang <quic_cjhuang@quicinc.com>
In-Reply-To: <D15ZZ5V3YU6Z.10FO9XK11WXFB@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fQYglQo8Rf-s60w4UhR-OSnk24GZTlDt
X-Proofpoint-GUID: fQYglQo8Rf-s60w4UhR-OSnk24GZTlDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_18,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_195056_600790_6DAD5347 
X-CRM114-Status: GOOD (  11.32  )
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



On 2024/5/10 21:26, Luca Weiss wrote:
> On Fri May 10, 2024 at 3:04 PM CEST, Carl Huang wrote:
> 
> <snip>
> 
>>> Kalle, looks we're not able to fix it before Sunday as I don't have
>>> WCN6750 setup to verify the fix. The fix could be to define a dedicated
>>> function ath11k_init_wmi_config_wcn6750() for WCN6750. I'll send the
>>> patch out so others like Luca can have a try.
>>>
>> Sorry, I have problem to run "git send-email" as it prompts "5.7.60
>> SMTP; Client does not have permissions to send as this sender".
>>
>> The patch looks like:
>>
>>   From 19bb7f1377a5e3c5d42ab2bedbaf9e976c1068b4 Mon Sep 17 00:00:00 2001
>> From: Carl Huang <quic_cjhuang@quicinc.com>
>> Date: Fri, 10 May 2024 19:40:37 +0800
>> Subject: [PATCH] wifi:ath11k: fix WCN6750 firmware crash
>>
>> WCN6750 firmware crashed because of vdev_number changed to 3 from 4
>> in commit f019f4dff2e4("wifi: ath11k: support 2 station interfaces").
>>
>> Fix it by defining a separate function ath11k_init_wmi_config_wcn6750()
>> for WCN6750 to initialize its' specific parameters.
>>
>> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
>> Tested-on: WCN6855 hw2.0 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> 
> This seems to work fine also.
> 
Thank you Luca for the test.

