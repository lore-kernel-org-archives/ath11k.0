Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BCAC46CD2
	for <ath11k@archiver.kernel.org>; Tue, 23 Jan 2024 02:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ1pdH/ptColWCEzrk/uSZG5DmQk05A1hROfWdkwBh4=; b=Uot4gukkj9eUECssUZLf/XrPLH
	MQgPkQqlRkNS+zCTRI1XmwiyqBzfnJvblqvKY4cwpdc1FwXBO9OdDIP64dsQT9lkNxnIWYwGFGFdK
	POs+uN1/uTjEJw8tdruePQ768oiC7mqxbm6anLUUS1FEGVn16rHicO6RqBULygwbK0HpFAQi9j1N0
	bqyPpVLcWu2SMUVlEDew0A2DezNlsrq/sxPhprEk3nqeBhi/4l9cZWrANyCWgRfXSnfFRTNh3UQwP
	XYQaOE/eAyo9alvjJUuJsZr9YcDP/Jrtk6yPyTZv2mpHSjGMtCNdvvAmvJHPCdqIpDscaNOMexHuQ
	1e10g7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6yX-00ExG2-1T;
	Tue, 23 Jan 2024 02:57:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6yU-00ExDn-0m
	for ath11k@lists.infradead.org;
	Tue, 23 Jan 2024 02:57:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N0O8Xq014304;
	Tue, 23 Jan 2024 02:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=uQ1pdH/ptColWCEzrk/uSZG5DmQk05A1hROfWdkwBh4=; b=QH
	iKvw/ursSZX0WBSsjU0QEQl45Nq5KxRHkyra7aZ4GdrUNuS5rlyF2fbuMwBLGwU6
	g+ATTn7e9JQVnvisnEuDTZVZg1wqVvXtAHz9GiDdEKR8cE92hZ3kp6CYqlUUp+r9
	KjDccpaPXdZhHcyW0P7DdqW+C89ybTixkDDFWyHvgkzuWEPMOB8ggbhSYRHyE5y6
	Sw7H8Ktr7c+8VSEPuSe1gRZm5i16m+AyKrIMdqaZ0PKn3tdBD8X6WUwNaMqEL3uP
	Gl1ojsxLVtuZD97InbegAkfyEv+3zCsvNVp3K5Lv9PVknKOXs7WfRIUulMhQOQjw
	HTayRxoHhW+wM7Q2/9Og==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vst8w9h45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:57:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40N2vDfG008085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:57:13 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 18:57:12 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 2/4] wifi: ath11k: rename ath11k_start_vdev_delay()
Date: Tue, 23 Jan 2024 10:56:58 +0800
Message-ID: <20240123025700.2929-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123025700.2929-1-quic_bqiang@quicinc.com>
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d55pduNq_qljVY0CBDwlL1pwm3JxC_x4
X-Proofpoint-ORIG-GUID: d55pduNq_qljVY0CBDwlL1pwm3JxC_x4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=925 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_185718_308476_7D02EE6C 
X-CRM114-Status: GOOD (  12.32  )
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

Rename ath11k_start_vdev_delay() as ath11k_mac_start_vdev_delay()
to follow naming convention.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5c7a33d4ca8b..9c732fc22711 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -255,8 +255,8 @@ static const u32 ath11k_smps_map[] = {
 	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
 };
 
-static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
-				   struct ieee80211_vif *vif);
+static int ath11k_mac_start_vdev_delay(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif);
 
 enum nl80211_he_ru_alloc ath11k_mac_phy_he_ru_to_nl80211_he_ru_alloc(u16 ru_phy)
 {
@@ -4987,7 +4987,7 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 	if (ab->hw_params.vdev_start_delay &&
 	    !arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
-		ret = ath11k_start_vdev_delay(ar->hw, vif);
+		ret = ath11k_mac_start_vdev_delay(ar->hw, vif);
 		if (ret) {
 			ath11k_warn(ab, "failed to delay vdev start: %d\n", ret);
 			goto free_tx_stats;
@@ -7570,8 +7570,8 @@ static void ath11k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
-static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
-				   struct ieee80211_vif *vif)
+static int ath11k_mac_start_vdev_delay(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
-- 
2.25.1


