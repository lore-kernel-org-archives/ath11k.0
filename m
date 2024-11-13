Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B4D597C6
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hdo54KNX6U9BaDxLyHu5BcLqMgjTZ9yLofe90SH96LI=; b=DNY6g4h1vhI5OrtSpLUtaVPK8u
	afy9CFmyT3Tl00CZRMQuiyOb+N7vVo8DJF8dQkJ3zCNwMRzLWqPvgEvl3C9a7n1CbdeIgPVoOEUym
	8lMqmco8rvcr1ODjUkqEUw/Rissn177+mSEhSgcCVFT6mKCPz6jk4aWXfUz6gKRQGHNtfMUrxSjS+
	tKFSJ235svGNOoimHbl0udPf+nEZqMrarn+O5sT+wRQMEtTWLX2/B+EJIFeqelSKUajFJFtRffd2a
	D5FgOtY/dM7b6+foWDYIX79zeXh6YHWlGY29aN+NG1DqvBn2z4EnT6bfilGfAdD58MSQGscXYeheW
	lSW9H8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cp-00000005YWE-2GDQ;
	Wed, 13 Nov 2024 01:56:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cm-00000005YTg-3Oh3
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:56:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRURh019976;
	Wed, 13 Nov 2024 01:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdo54KNX6U9BaDxLyHu5BcLqMgjTZ9yLofe90SH96LI=; b=Syiqf0rn5DW44VIX
	K/TWjaiJ2VDf1ZeNbT/JmD7E2d3SIcOx7HsAlz56LKrsEuTIgV1oeJHAADukJHmT
	XQQntoAHDTFjorLHhqdgs99w0LjwQRcHr0drvNpplqI0Qyly6BcGOWyKlprcmqCI
	mapU7uLM6yWJz0pFolG8iOpOLEq4az96hr9Ub7ekdEbT+tlyK9KDI2Ofhuu3lPHW
	/QhmJG9sKEd/X7ldV0KauoB4L1xMskfiwa8AK/hwplcr5k31BclY92eP8sSyRKdk
	EaUdClLlzHua/JNNgt4z/PWtgOfK+eJK/+Iv1jzLebI+4Eqy1484ZBs98GHgE4KB
	MrtX0Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60duf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD1uonh028169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:50 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 17:56:49 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 5/6] wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
Date: Wed, 13 Nov 2024 09:56:30 +0800
Message-ID: <20241113015631.3105-6-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113015631.3105-1-quic_bqiang@quicinc.com>
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 18iVTIzaqSCbj1m87ipQ5S0hZop2Sotq
X-Proofpoint-ORIG-GUID: 18iVTIzaqSCbj1m87ipQ5S0hZop2Sotq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_175652_998845_C1231B0A 
X-CRM114-Status: GOOD (  12.99  )
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

Currently ath11k_mac_get_fw_stats() is acquiring/releasing ar->conf_mutex by itself.
In order to reuse this function in a context where that lock is already taken, move
lock handling to its callers, then the function itself only has to assert it.

There is only one caller now, i.e., ath11k_mac_op_sta_statistics(), so add lock handling
there.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 318fd0bb6fe5..0ff430931bfd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9007,12 +9007,10 @@ static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
 	struct stats_request_params req_param;
 	int ret;
 
-	mutex_lock(&ar->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
 
-	if (ar->state != ATH11K_STATE_ON) {
-		ret = -ENETDOWN;
-		goto err_unlock;
-	}
+	if (ar->state != ATH11K_STATE_ON)
+		return -ENETDOWN;
 
 	req_param.pdev_id = pdev_id;
 	req_param.vdev_id = vdev_id;
@@ -9026,9 +9024,6 @@ static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
 		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
 		   pdev_id, vdev_id, stats_id);
 
-err_unlock:
-	mutex_unlock(&ar->conf_mutex);
-
 	return ret;
 }
 
@@ -9066,6 +9061,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 
 	ath11k_mac_put_chain_rssi(sinfo, arsta, "ppdu", false);
 
+	mutex_lock(&ar->conf_mutex);
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
 	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
 	    ar->ab->hw_params.supports_rssi_stats &&
@@ -9081,6 +9077,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
 				      WMI_REQUEST_VDEV_STAT)))
 		signal = arsta->rssi_beacon;
+	mutex_unlock(&ar->conf_mutex);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "sta statistics db2dbm %u rssi comb %d rssi beacon %d\n",
-- 
2.25.1


