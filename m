Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A467C77B60
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDm3mzd8B9daN1h3O6kJ4BgjB+zO6W4mihL29QTqlW0=; b=a4dbShgAmCbM3g
	pBBxbq4ji5jTU7mKG5eYAcjec2XAv40XhLB0o7pJxIsejjpX89UPmqNPdgpaWv62/kYYj1ufgcsRe
	PB4S3SsiWV0wngh2j//ebadI4571EvGShATOnp1QCoWzM9ZK6Gg57UEIJInCMANG/CS8Gpb2rGO75
	WRQSlz7qMldZNWj6HieNy+991V4UVjX4UjKkM7DlXKup/TwJvKw+Nl6LRZgNZXOjm+nvIgG09jwmp
	lTQbjJU4WeAB5nY17b04c0fwSjQpFKESbNxttz9dBr7in+56246Aqg7jCQo7+YH54ZMnFGTB+iJY8
	U3IXIm8AW81GI6hiMfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZlE-0033aI-2k;
	Wed, 26 Apr 2023 07:40:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZlC-0033Ya-07
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 07:40:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q4f98E002228;
	Wed, 26 Apr 2023 07:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/wn+UXvrkEcudbHBgVVgpcXn1/etkPr2gofIOA2w5fA=;
 b=Rz7zpAlTVAcHUUDWUZRbo3uKe/KquuiP0jUVDWWfrh+3LYYOiUx94EVqJkxakfdqlgGK
 ADh7TeVUmeGEIcuSbuRqNYMHA39V7tOdm5Zqi9Mp3vUq1MUM72RpHNc3GJgz90hLlW/l
 i7QAElrF+aQz6dnJa1xyIr/4xIFMNeRPejJ8wbdQpUCX5vVTthVc3TKvkY7dphUjL791
 3cOX76xIFZd78Gx0Xmy2KH9Tch7vP3ghZXGnMA7rkBiOYD+whhQE5v73sP8l+el0I2hY
 EIGGf/c/Fz94pr+uwbM+574kzFJlrocWNejPxlSoh1MC5NbXrWExYrk6eIq7V2REYcy4 Iw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6kw09e8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 07:40:11 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33Q7eAwW029366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 07:40:10 GMT
Received: from [10.242.242.48] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 00:40:08 -0700
Message-ID: <763c41bb-7452-1ded-ace5-8cda9ca64788@quicinc.com>
Date: Wed, 26 Apr 2023 13:09:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] wifi: ath11k: update proper pdev/vdev id for testmode
 command
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
References: <20230424092420.12794-1-quic_rajkbhag@quicinc.com>
 <87a5yvt831.fsf@kernel.org>
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <87a5yvt831.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n0BOrkUZLRU66NWJzGI6YnrYVJdKL9eN
X-Proofpoint-ORIG-GUID: n0BOrkUZLRU66NWJzGI6YnrYVJdKL9eN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_02,2023-04-26_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=912
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_004018_212349_E5D8D898 
X-CRM114-Status: GOOD (  12.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 4/26/2023 12:59 PM, Kalle Valo wrote:
> Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:
> 
>> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>>
>> User can extend test mode command support to set vdev and pdev params
>> for debug purpose at run time by sending vdev/pdev param set command
>> through the testmode command interface.
>>
>> Fill the proper pdev/vdev id in driver since, pdev/vdev id details may
>> not be available at user space. It will make sure that the proper
>> vdev/pdev ids are sent to firmware.
>>
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>
>> Depends-On:
>> 	[v3,3/4] wifi: ath11k: factory test mode support
>>
>> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
> 
> Please add 'Depends-on' after the '---' line. This is for future
> patches, no need to resend because of this.
> 

Thanks for pointing this. Will take care for future patches.

Thanks,
Raj

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
