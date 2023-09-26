Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E0E7F128
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBvLYzPlhC9f5i7z16GPG8emLBGBwU+K0ZZfEC64nC4=; b=CmgxA7hi9zsK6/
	xqiHVtelLWxvonvOhqa6AdgT3Knsux7Iv9Q+QjldmLjHYHPv8wEbCnaI6Txs3QMQB7aqjhu6aWy8P
	1L6aq02fqAxVTnqTUWl8RFPg3HNJbYWN9RQJCkaUouo17xp/PjSohSgoShiSwTTYPQ3na3MofV+N7
	mQ5W/+nDL70g0SEwkWxoCPWWa6xLsHpldHfhDaEkTWAKmyGvKEO1EXYF270sSGDM6DCqGvp/4DR8E
	p8WKRhbrQHTkGCN/k65Zb4ZNQQRfNSxOUhrkDY4aowyH/GzeWGocKncYPFhyfTst9KMkEwLJ0f3AY
	uq4T1UTUee0TBK8+1Png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlF5b-00H1gh-22;
	Tue, 26 Sep 2023 20:55:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlF5Y-00H1gC-1K
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 20:55:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QKqotK024854;
	Tue, 26 Sep 2023 20:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NnIaeCTQlLYMDfNRAjt6gC50u/rje7hYhGKQNRxrJbo=;
 b=XgwZxj3u67WADaYY/1TBnq6Q7rOyvbE+EUaHJG9JC2sSYbPJ7D/c0hVAD2Z5LffuLsre
 3kI2yc9j+PUKfUUxz93B4EkBxdlsM61Rka/BjdpH8x0u8qwtiYgpNaqRYTFWX9HMXNym
 cvE5NfGmX7aXCEZANOAj8ICuM2gwDBI3gXcTTYmbXbG9jfG/a5WeT408++7DCIXEddTa
 6I9SeePVZt//rpBGnWPx27A44lfTCdh57E0S5ZioX2vfYp6lm9sJyGermrQ0MPNp0BaY
 lKdFowkb8KUL0GjTZzXFfXNx23MgLTwocvVAfLCwpK2zG93+n+ZUTGpYQvVJKquEIgxR 6w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbv661stb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 20:55:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QKtH2l009275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 20:55:17 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 13:55:17 -0700
Message-ID: <70a75205-8f27-4e73-9d32-d92b6f7bec68@quicinc.com>
Date: Tue, 26 Sep 2023 13:55:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230926163350.2641064-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230926163350.2641064-1-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GIGySks6rvU9zN3uuTIl6PTo12ebh1gr
X-Proofpoint-GUID: GIGySks6rvU9zN3uuTIl6PTo12ebh1gr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_15,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=930 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_135524_478803_6EA15733 
X-CRM114-Status: GOOD (  12.20  )
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

On 9/26/2023 9:33 AM, Kalle Valo wrote:
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
> though we should use for_each_sband_iftype_data() or similar. Fortunately
> there's ieee80211_get_he_iftype_cap_vif() which is just we need here so use it

nit: just *what* we need

> to get HE capabilities.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
