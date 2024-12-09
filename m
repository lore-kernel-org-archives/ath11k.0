Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC39E77180
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkDMC4n+nmNheTZrmeWXtlAoFZY5epZRSAMxvpIPWdU=; b=EfZQ5yVsUsBGmvpWfN7dOX+hPv
	6UjjCFb1bQXhoS79l1/pKA1oj+jZaAC48TSptQKegUCd0NXm87cnviCjPmR2r802/Rc+nRSjHAfLm
	7KwiO7BcmaBP0FAE3bFJkTJ+GxJ4FfnzNg8dJvTvbkVzTz8xI8GlU3/IPOdTUNl0+/WGQ00mdOmh/
	mp0ERxOl9Qkel/tbpHrIsokMCvbtW/sdE/LrsVnJWO/T9NNgz6RBMumCDljXH65etMAnkwJOtQrd3
	+bHStycWJvgtofB4YCGxSX5HL+ealU/h01OPMawjP2GTdTqIFT0Uje0jTj+88WtZw8Lx2w8J96DEu
	8uJXwsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKTWO-00000006CXC-0NJq;
	Mon, 09 Dec 2024 02:29:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKTWL-00000006CWX-3T85
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 02:29:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NOr9P022763;
	Mon, 9 Dec 2024 02:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkDMC4n+nmNheTZrmeWXtlAoFZY5epZRSAMxvpIPWdU=; b=aLoI5MLLrcCarm1h
	xPOX0f64GN6qIBUxn/Jx2XBZBQFtzgmjHGzFLnEyQa/+OoxkRyelJWDvf1wMUlGy
	L/T2F0jv3ehEyURgQmj6Bwdw2rKFaqni9z9ZEOtT/esIXIbr3kw48hMTi6MdCYRy
	QRp92pRnbEWVnn/rsIW+FFaqKpRS0VwaucMPUC10BfeeXrYV5sQri7QnGbx53jRo
	lqwRwI9/9UCwUySjEFpLTusSC+TT/4sCUEaD1H7eUS7kkyTTOCRuvUR3QmyvqrrL
	B+CH/gEtK5s1vOAkz8eWJ7g20OTfNvT5hQAWeU/K+QskydwD9DcGD7HhX1VNRE9n
	jvRVHQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cer6k2cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 02:29:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B92T8dq032403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 02:29:08 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 18:29:06 -0800
Message-ID: <1123551c-1a6d-4d0d-b3c7-f65c15509280@quicinc.com>
Date: Mon, 9 Dec 2024 10:29:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <0f24e115-e76d-4c8a-8a1b-591a157ee78e@quicinc.com>
 <20241208121321.9760-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20241208121321.9760-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hAWil-3zcNZNZj6diss3URCGw0hEV4V1
X-Proofpoint-ORIG-GUID: hAWil-3zcNZNZj6diss3URCGw0hEV4V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=565 clxscore=1011 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_182914_002306_0867C833 
X-CRM114-Status: UNSURE (   7.80  )
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



On 12/8/2024 8:13 PM, Jose Ignacio Tornos Martinez wrote:
>> My point is that you can try setup with ap type interface,
> This is what I am doing!
So you can't up with ap type or can't up with managed interface?
>> now combination limits not allow up 3 inferfaces with managed interface.
> Why? The limits were bigger previously.
> Why cannot allow the old configuration (previous to the commit f019f4dff2e4
> ("wifi: ath11k: support 2 station interfaces"a))?
> In another way, your proposed configuration is limited for me.
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 


