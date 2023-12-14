Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC5C4332F
	for <ath11k@archiver.kernel.org>; Thu, 14 Dec 2023 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVHWT6yzULOEBhIeWxrBXy0gU3nr/g5g5qK3WIioLV0=; b=C2VSvyLuZMSutHiKBq6Cyp0MW+
	2mmjGdWVXCqK1S0fmJOgsFKHoGjTsEK5KMRBP0E3CaOVIZIfAgv3uUN/BYLycjR8rZTXjFButPiev
	mszcqMS96+fEObfVBT7s8NxJUczte98MZNnho1bq9E2SjP6GZhQYV0yGucxcFTmB4r2yc2Y3NgRey
	spieZFjXswgKEh9hGWuGKpT0vwjDIjv5SOvETd5Z64bvczNFxKrjYLR+O4nrsWnX70UNgPCcdDIok
	loZiQuQwU7BFmuf0u2/nD0Zk5M7bgBy8WMJJcr3yPXyVJ+XYRQslD7nbf7/wsLJZgfose4Z+a7U3r
	d6Bad11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoyI-000r7j-10;
	Thu, 14 Dec 2023 16:54:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoyF-000r5I-26
	for ath11k@lists.infradead.org;
	Thu, 14 Dec 2023 16:54:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEGoKYO024003;
	Thu, 14 Dec 2023 16:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oVHWT6yzULOEBhIeWxrBXy0gU3nr/g5g5qK3WIioLV0=; b=FK
	NrKEjDi4c/+eNOoMc1C6qlfZ8xNAVy6eB2BmRISg+KMJfRgCfc28bC+4aDo+QnIx
	A0gFUYy43f1oQWoW6AVISCmDlqzqMC33xXBkpLgZ8ZKxTzh/QxRbEVJDeCDoaFtI
	ENjF7sxAuTMt00LeVKV5KUJQ9L/0ll2IZNrxbaH+XLQqdYfP/1JVe42EcIc3jgO1
	zRlUHpex0iEGU7tziMR0adm0H9o94WvSqiGUms31yIXYrrmz+WSVIBy2n9AfOT70
	YyIZ4ULZsEOyOoa3Kt2nYrzyUayygyxstH8YH/80xd+yA94EMvtxkF7+EycYC6w8
	ygHrld59lZCBB9UPYF+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v05jqg0aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 16:53:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEGrop7026390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 16:53:50 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Dec
 2023 08:53:49 -0800
Message-ID: <4f366e72-36bb-4e95-af1b-433005b3a92f@quicinc.com>
Date: Thu, 14 Dec 2023 08:53:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: workaround too long expansion sparse
 warnings
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231214161740.1582340-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231214161740.1582340-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1LXbdnIsEhG7-w5UHzsdYIzXiA5A_05d
X-Proofpoint-GUID: 1LXbdnIsEhG7-w5UHzsdYIzXiA5A_05d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=644 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_085359_727001_FBE33BF1 
X-CRM114-Status: UNSURE (   8.91  )
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

On 12/14/2023 8:17 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> In v6.7-rc1 sparse warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion
> 
> Workaround the warnings by refactoring the code to a new function, which also
> reduces code duplication. And in the new function use max3() to make the code
> more readable.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


