Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A7C001B5
	for <ath11k@archiver.kernel.org>; Mon,  6 Nov 2023 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RaE8yQwAATLEifkCgNXfxMOx/SBluAgVcZRx9CWPO6E=; b=iLhmLyUBj96QG5
	2eC6Ga/93xaPZVv2xXxox9j0SVj3xDOZfQF3QlclNWRcLD7hg0hw/HeMxckni8xbEGqjkGALZDyfD
	cO6WlS+rZW6iBP3bF4L3srIQkj7yo0uTOOKgpP7bv2mBhHPLi4GBIu6jbv01Tm1YotKVf6WVKIy0a
	FCKTnfhuQgjr/vz08n2cxEIPULGCTojNv/1D69G1Mo/UImCz2a3kpg+L4BuNdQQ7nLgYARGfXAxV4
	D8s3sDeoh5HNePNIA4mgeId+qvCIEWw0wuY/7FytKun13rMm37jHMnXCzWmfRoHFjL4Gy/PGFRdcJ
	2i4Za7t4EnPv887yg8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ds-00HJBZ-2R;
	Mon, 06 Nov 2023 18:21:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Do-00HJ9D-1L;
	Mon, 06 Nov 2023 18:21:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6Gknvh011661;
	Mon, 6 Nov 2023 18:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=ceL5f11GRLXt9jwnLwk2T1E0KMg/oQbyhBZC5O9i/ck=;
 b=mVWEBAGscTxmDukwqBjGf+txaRZLHnP7zohArfTVAqvVr+w8b/7Rb1avsMAT39wLMHra
 mqxjLBy5lAbqdaMXtZpy8PqJCtCbKsDdpiKnP1fCYJQ5pwXZRhlA960FjPt1BoWiMYSn
 vv7ke/ILMhCaGJTb9SUO7b+cVInW5yXZBH+9da3MWNBDBBUVkO+SmN6obNeB90ZgoU5G
 MmZk6cqvhTll3TcFDNI0BSxw/N5r6GQ9gEZj/nE0V6JUeLMcoO9oneiNufP6khvzFZ9Q
 fTTJKRVVyGrsL3oZje123x6P0zVfcdVBm+iDKW+V87fu5+/TQ5twJf+PgUeMOnZZdnug Cw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u72c00hum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:21:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IL44E005509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:21:04 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:21:04 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: ath: Remove unused struct ieee80211_ops *ops
Date: Mon, 6 Nov 2023 10:21:03 -0800
Message-ID: <20231106-ath12k-remove-ieee80211_ops-v1-0-d72cef1a855b@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI8uSWUC/42NQQ6CMBBFr0JmbU2nSFNdcQ9DDLajnRgotthoC
 He3cgKX7/3k/QUSRaYEp2qBSJkTh7EA7iqwvh/vJNgVBiVVjShr0c8e1UNEGkIuIxEZqRAvYUo
 CtXRGN3Sk/gClMEW68Xurn7vCntMc4mc7y/iz/3UzCika7bS+GmNJ2/b5Ysuj3dswQLeu6xd2O
 oF4yAAAAA==
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ha_CJw8WRaAxs88KjvnrEMgUSSCEFpxc
X-Proofpoint-GUID: Ha_CJw8WRaAxs88KjvnrEMgUSSCEFpxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=453 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2311060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102112_466789_3D7B29D5 
X-CRM114-Status: GOOD (  10.59  )
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

Both ath11k and ath12k define the following:
	struct ieee80211_ops *ops;

This is being flagged by checkpatch.pl:
WARNING: struct ieee80211_ops should normally be const

But it turns out that in both cases this is unused, so remove it.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Jeff Johnson (2):
      wifi: ath11k: Remove struct ath11k::ops
      wifi: ath12k: Remove struct ath12k::ops

 drivers/net/wireless/ath/ath11k/core.h | 1 -
 drivers/net/wireless/ath/ath12k/core.h | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: ac2f43d3d34e52b0d388b4c573ff6bbac90235b9
change-id: 20231103-ath12k-remove-ieee80211_ops-160d865e9ea4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
