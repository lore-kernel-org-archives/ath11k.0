Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73949C021B1
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM78PW5IOxT4RquJ2mIvMWJtVRvZgtUSZFAVCJ2RgW0=; b=AtYBfqW4oRgs5hDrhl5ZBWCeg+
	Tr0M0U/IxJkqEYrNY/dTguLyZZPuT+QuK1N3i0wctmMOilHGokM4DbX1WLMDVSmV5uL3ox6plbWJA
	ZFDndw7aGm0KQx2MVDSoEaf8ZESr1Jz4B2Akz5TRclVrhVBsdRgtVzzRTgr9It58i4swko55Ij8Ey
	rIa5A2tsAf/EO++PuwAYT4r2JIbK2Q1gtQ7g4tzIauYS6O6myXw7gx+UbW4dtoqXf4L2KNQXwTk/e
	0xrGN86I79jeLHTEojsDG3KCnpINpnwIqBzLDniM6/WddFoXriZbR8k2lYNX7DIZR+arTu9UdDDuu
	XOff+Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1ru-0000000HLwJ-0ewN;
	Thu, 20 Feb 2025 08:25:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rq-0000000HLsH-3o7v
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 08:25:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6VsCt025577;
	Thu, 20 Feb 2025 08:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mM78PW5IOxT4RquJ2mIvMWJtVRvZgtUSZFAVCJ2RgW0=; b=NFC/d80FS+vT9ivf
	IAxIwrzF7Zc9ZbQcKvI6Pek++zo2IZfDcu2TBJWT12l+5rCnA7Jkwl5dPJ1U4s8U
	aOy3wlqoeIw/EUito4jz9YCajaR7QuHHlEmbeUFUltl7ONYc/mtI/a36PFITVRrr
	I8NV4VEk7F0cdquXKis66j4EG4/DtFLowLxw+WExkjuFigsJp1K6W96nk4gt/mPM
	1MDKWtdf3vpSJ3cgQYGg4QT4O901HRLeZQ7QiVSR5uN9m1RaZ6SwaOS/oF4vZ3uD
	1TKUMW17Cws/HIOyVzuvOrow4svI5AVLw0IoFltdyP/+/6g8Ennpn204CnbbrnWM
	9N21ww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0neuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K8P9VG003949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:09 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 00:25:08 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 6/7] wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
Date: Thu, 20 Feb 2025 16:24:47 +0800
Message-ID: <20250220082448.31039-7-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220082448.31039-1-quic_bqiang@quicinc.com>
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H3oITJdS1v7-R2YNklxfOPxkyr-IaXBe
X-Proofpoint-ORIG-GUID: H3oITJdS1v7-R2YNklxfOPxkyr-IaXBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002510_960700_F5E4DA88 
X-CRM114-Status: GOOD (  12.76  )
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
index abc01a11e3fd..8a01eb6c53d0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9047,12 +9047,10 @@ static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
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
@@ -9066,9 +9064,6 @@ static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
 		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
 		   pdev_id, vdev_id, stats_id);
 
-err_unlock:
-	mutex_unlock(&ar->conf_mutex);
-
 	return ret;
 }
 
@@ -9106,6 +9101,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 
 	ath11k_mac_put_chain_rssi(sinfo, arsta, "ppdu", false);
 
+	mutex_lock(&ar->conf_mutex);
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
 	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
 	    ar->ab->hw_params.supports_rssi_stats &&
@@ -9121,6 +9117,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
 				      WMI_REQUEST_VDEV_STAT)))
 		signal = arsta->rssi_beacon;
+	mutex_unlock(&ar->conf_mutex);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "sta statistics db2dbm %u rssi comb %d rssi beacon %d\n",
-- 
2.25.1


