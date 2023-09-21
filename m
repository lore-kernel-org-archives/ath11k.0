Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C782E71096
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vroCmcReDjtTBVWdICAQ5ajY6whPbEbC5HyykRDQjVA=; b=BocVHkQoJWWd5H
	lRPeoDxuz0FfRI5zXG2c+g81qSGKCFEvNOYDz+I6l6vhbG9t3/PpD5pom21g6oHVKC2NsL0TE0Udi
	zLbdVixuHYyICMauuZdWtbys7xid6DUipK/7oipyI+TALkYEOCKNSRTBsiWQeUpmlU+fuu4r737VH
	dXlUUK5k5SxIoVDwo/RbPiObycXyxYY+r/Lu3BiPrwfuUkWO+8tBJTdChN0L1tuzUW+Kgjw2DtRcd
	VHa9n7R1NrjDBXmxLSQdscvTDF2kgcjX4HGiDs7SycdOFOxnOjHFUpCXwHdcKCRU201nEqE9hYlIO
	KgJoMyg4yEk2yXxhHCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNBD-006bY1-0r;
	Thu, 21 Sep 2023 17:09:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNBA-006bWM-03
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 17:09:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LF7K1m001558;
	Thu, 21 Sep 2023 17:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LNygmIKmXn3TloZGMOTcy11agEPItZJYdzbjy1HGvWk=;
 b=SliNADxf7u5WBn+rq01ZtCA+qs2wlN0DEJJ28EcgQx8VXnh4Kb2Huo5xbh7NJ/ctQFSX
 BsKVmeDIllju3Dzh8olDIbrCpZLZGrVyUZtVeHkN/9XLxA5NlO7x/FnQ4Wo9keoOIrx3
 pF6cgEBmu/f5bOthkhqLQnj5e7LW2BNesu1WEOjKFY5ANydhXkBq3GlqVHyLCOzlbFqo
 rKESAlss6RNw8kxpU06XF9w87hsLN57arPDV+WLDXqsYZPa1yLRk1jUS3keJT3RsVwmx
 8XkIvE6CkfQZ2qYCroq1YMfQt+UpbBeN1+UghIXzuVRJy/rhyhH+sYzYBM127gTPLHuv Uw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8892252b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 17:09:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LH9KKK010028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 17:09:20 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 10:09:20 -0700
Message-ID: <edd759d5-855e-4438-b649-db7915bab3e0@quicinc.com>
Date: Thu, 21 Sep 2023 10:09:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data
 handling
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230921075440.1539515-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230921075440.1539515-1-kvalo@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jcGFp4CQEDmuo_hanOfCvgozzez4Wq8H
X-Proofpoint-ORIG-GUID: jcGFp4CQEDmuo_hanOfCvgozzez4Wq8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_14,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=947 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309210148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_100928_188849_4EB87819 
X-CRM114-Status: GOOD (  12.02  )
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

On 9/21/2023 12:54 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with
> sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
> which immediately found an issue in ath11k:
> 
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    expected struct ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *
> 
> The problem here is that we are accessing sband->iftype_data directly even
> though we should use for_each_sband_iftype_data(). Now we iterate over each
> item in the array and use the correct vif type which this vif is using.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
