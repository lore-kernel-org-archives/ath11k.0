Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B710C47DA2
	for <ath11k@archiver.kernel.org>; Wed, 17 Jan 2024 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY13OMwURnYF3oJ+tMFaDllV/xPgD0V6VbV/1dumRA4=; b=PdwXyuahIl4eM/4dABoqBUbF7B
	K5J5Xaj8i8coW8md/Gco+qVSLocFD/0YZC1hi+q8LHCGgsW6tyNnV1nRbeuAb8nLIFp9/9GsNIBlj
	KZz8nx+yk7yE5xQTasXQG4MRmlY9Ts+U7ASsb4Euc7c4Pkv4f/Cvg5xDf5Q9en5zd1ljCSmVzx52k
	O+LmwuUMlRyKbPmd69uIrtTa7hxXgAumqwpdh7TukOssXJLFFsgEgNlil+MWLv1kB2Yh3/MHLio+b
	+iiV3B+BqF7l/qKuq9Zyt9/h1ll7o/fCjXOZEmD0yruqK7YC3tDJbF2hSLBKNb9CtY6dPmohObmKx
	IC1Po0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ7cZ-00HPJp-10;
	Wed, 17 Jan 2024 15:14:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ7cV-00HPFu-2Q
	for ath11k@lists.infradead.org;
	Wed, 17 Jan 2024 15:14:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40HAwJYW002388;
	Wed, 17 Jan 2024 15:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vY13OMwURnYF3oJ+tMFaDllV/xPgD0V6VbV/1dumRA4=; b=KF
	g5hoAfmkBzivgOtpz8B3rupTc9Hss47RdOPKc2lsWsn8GnP0dJtb1DA0FGKwhhbT
	mLK9eF3WNAZ+gjVll/yQSEU3FHYz63h8NsbzdVsSeZoqBMEGoaw4Mwpo7iv4YT4y
	TNPMRRGNiknkRr0kJr1Kl/mqMG5M5dnYJNZZR8rEI+AZL9caS5RhrtcS8qkLulCB
	D/ITKYAF3sy77749OxSTTb+VV3xCFJQfWW1fvrg6H+S7YKsR2gSPKV5m/NhXyqGG
	CZLEHJt9zBWflxsfsFwGNwJtR/yAh3NwdkZpymN20izbvUVq5Sqtsi3sWmjPkK7R
	rTEWUSUecHQvItg/wZBA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpdfgrhbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 15:14:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HFEJjF029359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 15:14:19 GMT
Received: from [10.110.99.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 07:14:19 -0800
Message-ID: <26a42f14-dd38-4c67-8f66-16baaff25885@quicinc.com>
Date: Wed, 17 Jan 2024 07:14:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: rely on mac80211 debugfs handling for
 vif
Content-Language: en-US
To: <benjamin@sipsolutions.net>, <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, Benjamin Berg <benjamin.berg@intel.com>
References: <20240115101805.1277949-1-benjamin@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240115101805.1277949-1-benjamin@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mdzieFL6KutfGEZTA3iOFLEC5scv_ncz
X-Proofpoint-ORIG-GUID: mdzieFL6KutfGEZTA3iOFLEC5scv_ncz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=525 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_071423_844147_DE577624 
X-CRM114-Status: UNSURE (   8.25  )
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

On 1/15/2024 2:18 AM, benjamin@sipsolutions.net wrote:
> From: Benjamin Berg <benjamin.berg@intel.com>
> 
> mac80211 started to delete debugfs entries in certain cases, causing a
> ath11k to crash when it tried to delete the entries later. Fix this by
> relying on mac80211 to delete the entries when appropriate and adding
> them from the vif_add_debugfs handler.
> 
> Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs entries as appropriate")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218364
> Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



