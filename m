Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85762C46467
	for <ath11k@archiver.kernel.org>; Tue,  3 Jan 2023 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkmSKO48PRwbsRrWkIvL3k61nW9i0/3p2hezDMtgmc0=; b=dAFJJbUPjBe2Lv
	4FUM8jMOpuKREZwPfNjrK6Uo84pxLEJHK1P6+ed3NZ8OAWKYhKiJluwipI0rgaZDew9+cz+dmeQoG
	AGuUgjKXzsuBxFd6Uenrod3htLmthmbmFautHtXh1aAGfp9fReBv34i63zEv7ibLAO0oUJOWqJY8W
	rEr3agG3nUdKJ5trhAXrJcslx2hmF/RcRBJrb35xGxKPcNA6tfLYQtEXTarZiAdF/v7IWn7fxI+YI
	PScnwPsGv8ImU+tXVartYSi6TkKwZODwBcSQj2ele6LFIO8iISwBgGn7m/Dg+jfpIOfYA1Bpj4Uky
	eZwFxO3y2bVBodcg62Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeSI-000hXN-Sj; Tue, 03 Jan 2023 10:23:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeGQ-000e3G-JB
	for ath11k@lists.infradead.org; Tue, 03 Jan 2023 10:11:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303AA4aR002381;
	Tue, 3 Jan 2023 10:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ljmQ9bAZPmXSfDHDUrqKM7wdCfMQ9H7Pk1+q5jufEQU=;
 b=Z4CLxw4ZWVM9MARvB/FxbBbMEyCHQhwKEbmZTD2DbrQ1/575tQXaR1R2uR3GQuLKtSwQ
 sFyq4GiaeCtPaUw0kuxLH9A/RqRSW7OITuGXPiSoP/7+eHGnB4a22UTGJPea4nT/dxOt
 9qOp13FbvGceIx1nPJzJDQnCjsBEAsL+GpAgRd0MDCnoUwOtD+PxfAyE2H6joWfnjMdV
 AzW2KUhFw/QXQ3+JWbkesCNGj9sFMq35GTQg6t23hs3Jtp3MFMdopB64XBQRKOWKMPKi
 oMs+oOHuF3upxpTtYcP7Q17pLzNPI3hhFEXSI8Hq1rgekJLei4egGXmXS0YHkm97NX2T gw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtd61cfyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 10:11:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 303ABHhg005249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jan 2023 10:11:17 GMT
Received: from [10.253.13.254] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 02:11:15 -0800
Message-ID: <55142d40-bc76-a67f-9750-1417cdaa0578@quicinc.com>
Date: Tue, 3 Jan 2023 18:11:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] wifi: cfg80211: call reg_notifier for self managed wiphy
 from driver hint
Content-Language: en-US
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221214093937.14987-1-quic_wgong@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20221214093937.14987-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kTXqjwl4NXc6v8YhW3Q0QdkV4aBE7o9p
X-Proofpoint-ORIG-GUID: kTXqjwl4NXc6v8YhW3Q0QdkV4aBE7o9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_01,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=736
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_021122_864171_6501441C 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 12/14/2022 5:39 PM, Wen Gong wrote:
> Currently the regulatory driver does not call the regulatory callback
> reg_notifier for self managed wiphys. Sometimes driver needs cfg80211
> to calculate the info of ieee80211_channel such as flags and power,
> and driver needs to get the info of ieee80211_channel after hint of
> driver, but driver does not know when calculation of the info of
> ieee80211_channel become finished, so add notify to driver after
> reg_process_self_managed_hint() from cfg80211 is a good way, then
> driver could get the correct info in callback of reg_notifier.
>
Hi Johannes,

Could I get your comment for this?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
