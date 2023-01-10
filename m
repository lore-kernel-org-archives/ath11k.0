Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFFCC54EBC
	for <ath11k@archiver.kernel.org>; Tue, 10 Jan 2023 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tgwIlTzhFJGpFGrnaV4PR0eifk6F6KWYpHoX5OwWnQ=; b=sph5ApH/ZNm8ox
	CIz8S2lj6WPi5wBjhKpWh80EmjdP96+FgzxPdCZgv0X3gCyeJjJugiYVK3zmTCELiziZo97mCCiLL
	EWZpv7fFhlKmijyjmU5d6SkONMv7w9nw8dM08L+u+isUiW/ECmt2zwXR+E0bBuoApXWbrnfGP1lWA
	KilYUbGtKQZnD6keEwo0i4KBHTtaaWsTLYCVFWxpUdVeFgn9c45WfvH8Rz2u9oDbl2mbE2ICJ6Va8
	gQNU4CusOfUXqmHki2U96XgcpnSQlIFg787a3NXDwiCce1CjG9GgZ3HcjI8yMYylFrhM3UJygUjRp
	hpn7ew/hP4eEk3BMNs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFDSn-006mqk-Jh; Tue, 10 Jan 2023 12:10:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFDSl-006mpO-6W
	for ath11k@lists.infradead.org; Tue, 10 Jan 2023 12:10:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A52AEO000718;
	Tue, 10 Jan 2023 12:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=8V6385O9I03FlBBmY00jjqr3kQVCNdGNU1h4m8bM3PY=;
 b=OPWVNmXto1KjHGHsUSt9sIV8qcZ4px30lamRSyvw38oZIFVKVpZVLQsuj8QS3/kgar3I
 nznjeeuN7EIWkiqaa8MxVFEQzgGUXPFXToeITK2ecgnnhV8VvXznOLX6R7XX72smhyaK
 EiD9IllrnlRMb8ckNUlWNYINp0PXjvsLf/yq2NzRlOY47mOaPoBQiAXpE1RXMjeNViiB
 tBh5iWs1NF3yf/tU0SnTVyRFVvVhH5bwNfkStaV/fZroN153N3OukRTow7uKAVkh4QRK
 dONGLLVf3FSWzM1EpPRu3n8WQOO3DQLNTeBnOvfcXAKTljrrk0TxilIyHmo945L3ubyd wQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n11fs8u45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 12:10:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ACAdv2020031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 12:10:39 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 10 Jan 2023 04:10:37 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH v3 0/3] wifi: ath11k: add support to parse new WMI event for 6 GHz
Date: Tue, 10 Jan 2023 17:40:21 +0530
Message-ID: <20230110121024.14051-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LYthq5Ysg8ZVwLaH7oodpOknuKlxrQvI
X-Proofpoint-ORIG-GUID: LYthq5Ysg8ZVwLaH7oodpOknuKlxrQvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_03,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=935 suspectscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_041043_394470_E7090528 
X-CRM114-Status: GOOD (  13.32  )
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

In order to support different power levels of 6 GHz AP and client,
new WMI event for regulatory - WMI_REG_CHAN_LIST_CC_EXT_EVENTID is
added in firmware. This event provides new parameters required for
6 GHz regulatory rules.

Firmware advertises its capability of handling new event in WMI
service ready event. Based on that, host needs to set
host_service_flags in WMI init command to indicate that host supports
processing of new WMI event. Based on advertised host capability,
firmware decides to send old event WMI_REG_CHAN_LIST_CC_EVENTID or
new event WMI_REG_CHAN_LIST_CC_EXT_EVENTID.

Add support for parsing 2.4 GHz, 5 GHz and 6 GHz reg rules and other
parameters from WMI_REG_CHAN_LIST_CC_EXT_EVENTID.

Aditya Kumar Singh (3):
  wifi: ath11k: use proper regulatory reference for bands
  wifi: ath11k: add support to parse new WMI event for 6 GHz
  wifi: ath11k: add debug prints in regulatory WMI event processing
---
v3: fix new warnings in [2/3] and [3/3]. (exceeds 90 columns warnings)

v2: fix warning reported by kernel test robot in [2/3]
---
 drivers/net/wireless/ath/ath11k/reg.c |  59 ++-
 drivers/net/wireless/ath/ath11k/wmi.c | 571 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h | 333 +++++++++++++--
 3 files changed, 873 insertions(+), 90 deletions(-)


base-commit: 5834aa7099b0f7c16cfc24af0aca4e065c568347
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
