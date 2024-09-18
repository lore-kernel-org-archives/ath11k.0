Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACD5CAC5B2
	for <ath11k@archiver.kernel.org>; Wed, 18 Sep 2024 02:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Um7r5rj3kk8EY6ZPn8L7JsB5/s4PfF3T5yMHduM0z4=; b=CBpvs9crdggH6f2ra35KJASlaH
	VQO3B9wV5dwcexA47AByqU0I4QVxOrmxJDlu7vKOpjCuYQDU1xVADpUIicNtUJE7SPvLzQi0ybaeT
	OU8NaK4LcwCTWDxlAdycPZLToeccFlWJz2OW8JXXnPRapzd86XAipJUKDecsR+ZQXlDtffROZdE5W
	OVMDjAdojZrpFOMhoRRBvOkskNp1tob9dZ8UNHgQWkuOnW+nXfCu7wtA1mjsWjParlpQuPW1FEjiQ
	uypk8NNrq+NKi4meq+j1IDbGZ/WzhG4Q2PWrm6RPoPCfkA3XsI2/3HXGqUi0/lsnj2U4wezrljkj/
	hU6ICfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkK5-00000007Ja0-0ebz;
	Wed, 18 Sep 2024 02:21:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkJY-00000007JXm-2R88
	for ath11k@lists.infradead.org;
	Wed, 18 Sep 2024 02:21:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HHv6Lr022162;
	Wed, 18 Sep 2024 02:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Um7r5rj3kk8EY6ZPn8L7JsB5/s4PfF3T5yMHduM0z4=; b=KI1Oi7Eg77c2hbEi
	tps3CqMOvv2fPj4FaDkkIKcP9WZufkeoSoqJdhJ8jT3AL/zLnScrqGNxSuWaTc4U
	mHp3OcBH0ddaODwVAu8BL1UcFQ/sHtui5mQya2BivtjbSmsu7jF2y3Ueo5vRyA2o
	c9Y4Ly40b4Z/vslMVLufYqVJco/gkveDDxImDY4bxsSKMCeUIz8L31Ahz20JetvT
	avZVR0QSqNilY1pUbEGlVKFV1jHTJ6ocKazAZq3IBBc2Y/eOdVWHgl2ghlA3w1aY
	TIXiPxVegfAyEheNnBWw1ELCLRSYTqRmRnFpSuiKrZLATx832Z6eelUN5apiYYZu
	0dbrtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfggqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:21:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48I2L4IF005530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:21:04 GMT
Received: from [10.253.39.169] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 19:21:03 -0700
Message-ID: <33a441f4-c2ef-44f2-a67a-4633733c871a@quicinc.com>
Date: Wed, 18 Sep 2024 10:21:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath11k: fix full monitor mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240913100708.756-1-quic_kangyang@quicinc.com>
 <87ed5kaxxp.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87ed5kaxxp.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sC6O1iRV6hlH90_0nmiFq4nnQtuzuS5T
X-Proofpoint-ORIG-GUID: sC6O1iRV6hlH90_0nmiFq4nnQtuzuS5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=711 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409180012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_192108_658964_90854F8A 
X-CRM114-Status: UNSURE (   8.03  )
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



On 9/16/2024 2:56 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> Fix a warning and a bug for full monitor mode. With these two fixes,
>> full monitor mode can work properly to capture packets.
> 
> On what hardware versions?

Only for QCN9074. WCN6855/QCA6390 don't support the full monitor mode.

> 


