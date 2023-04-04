Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59B5C6FD1D
	for <ath11k@archiver.kernel.org>; Tue,  4 Apr 2023 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXAhwWgjBVQIYM0TXbLn79hkLzYZOBuXjenm1AcIGTc=; b=k546TJ0vrl00PP
	MGN/sUfk7yDQHbItEvbRKPsx26ebTjxMnD+7qBDTaVZlsFiUY2WPadUBEeuCvsRdu/kPPx2Moa8UH
	waqY0oDN7o85YnEiDsWE1JeuP9cdYW/lMfWfsoUCSyJgcqKcaMYtcbCtBu7F75I2v7Y43n/n21PAL
	h1eO6KixQ2KSZxmpBgKS8OCMXKsl/uOqizfsFwjlGGtHluSy1tChYTCNgtmw24bwAFoJpw6pYvynB
	P5a3SgtCriMSo4zmWAJX/C3Fns472OY90NLGOKw2J6CMTWnpIT47kpIQXQRRL82XsC0fN2qh2mOdT
	nJtrahi/inG7sSU8Y5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0p-000Ibv-0z;
	Tue, 04 Apr 2023 07:23:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0m-000Iaf-2t
	for ath11k@lists.infradead.org;
	Tue, 04 Apr 2023 07:23:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3346B9Gn022550;
	Tue, 4 Apr 2023 07:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=mAzCkR2VqhS11ARx312yaABAYga51ffC2WXsE4hi42Y=;
 b=DnuKvYehH3W8aHPcnIK3Y/X2AC6UbctK/0krYuaNEqZxYGjIUyQh42oRcOnDAU3K5X5H
 YuFu9TLxhX2ufBfAAC4kZ1wXg7cXjMftCQOedNxNX6sWA1hVAlckr3qury0eq2cpL8k2
 nat/8QjWY+3UzW+DjZvU4nQWqf0yOwRQFLkCYl5k0X95eTxg7A/5ixtcrKfDTtMELuds
 EnOfVFFjuK5bZ6uyR7wxsg1IN+KgNhMdtE5U2A0CB8OnFF4TpoVbY4mTAoBo2lWi18U9
 9MyVw2Uj3zD5PJh+y5Zslle411Kh+okw4TaLD+11AG11URZ64GfCLMHDs9yWVc5oRJay 0Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pquxtjr1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 07:23:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3347NNWP014135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 07:23:24 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 00:23:21 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 3/3] wifi: ath11k: Populate the signal average field properly
Date: Tue, 4 Apr 2023 12:52:34 +0530
Message-ID: <20230404072234.18503-4-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230404072234.18503-1-quic_youghand@quicinc.com>
References: <20230404072234.18503-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fKrIbQp3Y7dHpLOoKB1Z-IBlw3vtQ6JM
X-Proofpoint-ORIG-GUID: fKrIbQp3Y7dHpLOoKB1Z-IBlw3vtQ6JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_01,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=860 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_002324_944124_BA148D38 
X-CRM114-Status: GOOD (  15.88  )
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

Currently on WCN6750, we are seeing an issue where signal average field
value in station dump is incorrect. Signal average field is populated
without checking for dB to dBm conversion. For WCN6750 devices, the
signal average value is already in dBm units, so no need to convert it
again.

If signal average is valid, then fill it based on dB to dBm conversion
condition to fix this.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..531a881d8623 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8278,7 +8278,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 {
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
 	struct ath11k *ar = arsta->arvif->ar;
-	s8 signal;
+	s8 signal, signal_avg;
 	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
 			       ar->ab->wmi_ab.svc_map);
 
@@ -8330,9 +8330,12 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
 
-	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) +
-		ATH11K_DEFAULT_NOISE_FLOOR;
-	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+	signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
+	if (signal_avg) {
+		sinfo->signal_avg = db2dbm ? signal_avg : signal_avg + ATH11K_DEFAULT_NOISE_FLOOR;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+	}
+
 }
 
 #if IS_ENABLED(CONFIG_IPV6)
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
