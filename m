Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A189ECE7B1D
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzcv8pUBe0hyPv1CXrZbBMCtmJQh55CjwDqiQkwKLeY=; b=ulqGelCMGp/oJ0dG0NVzbVwJFg
	YkvTBUH8hT7WxykYjZiDZjmKMDYDD/qfKfZFNmYhx5b/tVoSybtswhWbrAdZT01JG88bUfv5az/bh
	nQIKi55CRkfefWuQKGNkq6gYvp4XT6swvis/TQgxjWr3oi5cZ6HUp+tz7xXXABT0D8DRCUUNGaTpK
	+3+wBAZrDYYSwAREU5Cmfl9VhJSzDEcMk7glQ00J2g5k3UuN0Lv3CRXvWGocXFWrNG8VE/0vH/gnF
	/S+LoVBYxMwXUiv81ofbCFzbbbBPDbF0Abf+el4o6aHIXaapYDuOmoUCW9lAT3OUnzmPkynswYpji
	2Hqkj/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaGJ-0000000CbrA-1WS1;
	Fri, 06 Sep 2024 14:48:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaGH-0000000CbqM-0Ag9
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 14:48:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868nYpI028679;
	Fri, 6 Sep 2024 14:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzcv8pUBe0hyPv1CXrZbBMCtmJQh55CjwDqiQkwKLeY=; b=JcronXvxYsyd/qpJ
	yVelI1vYZCZz11+kwynSfIKkmsXjwMzhsCkOxk8sshFJCwT74SzezkkIgivRZ6hG
	WSlYr0R+Fwva9RAQTB0wQ0hxqcz820ix5m+AGeEV3OtU2tQ1q08mFhY2RYNrH9SV
	IokJJO5oT+CfPoAQulsAPlzhAKHNlbnf0rD7lx+nqbHk97EECOD1SIO8Jy9swDm9
	eK4zGjnVFuwQwnbkkGTDgH4W4TMgPNfeaZ+asLqal7kTzCLurWF9yVwqLRF8f1dD
	pQzKvWFdr74guBcckvvRKhnuHpDhXGoXERBB549v7fi1jp8miaZuMy7jyaaNw/Cv
	eAllJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu2hk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 14:48:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486EmRtT007315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 14:48:27 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 07:48:27 -0700
Message-ID: <f2cc8048-2302-40dd-add9-e3ddcd5557c9@quicinc.com>
Date: Fri, 6 Sep 2024 07:48:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: allow missing memory-regions
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240904095815.1572186-2-caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OYknvDksipTpsuZAFt9D0lPXqKnz5oO-
X-Proofpoint-GUID: OYknvDksipTpsuZAFt9D0lPXqKnz5oO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=716 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_074833_119398_1C4C43C8 
X-CRM114-Status: GOOD (  10.63  )
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

On 9/4/2024 2:57 AM, Caleb Connolly wrote:
> On SC7280 platforms which are running with TrustZone, it is not
> necessary to manually map the memory regions used by the wifi hardware.
> However, ath11k will currently fail to load unless both memory regions
> are specified.
> 
> This breaks wifi on the rb3gen2 which only specifies the firmware memory
> region and does not use the CE region.
> 
> Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> check for the wifi-firmware subnode before attempting to parse the
> memory regions.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



