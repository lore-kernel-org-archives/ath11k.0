Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3996EC5478C
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 06:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVSajQ4ipY7CK01ECej57ZZ4nv+x5sAtuaAw3OxTecM=; b=JV4OtB3ucnBkr6TjITddzttCk2
	awJle1FO5sCoj41FFtNy6GR/OTJblZIDq4RDVOHFVXzYzhC2SxIPqVo2XEekz4Hp80pYAwhF+GhEu
	3gDrzzNbDJXvLvqw/sQ4F8YRHrpXaRGz4fgHx/rPoQVnc/KZMG5vKwcg89YiCdPMzO7PQWy4Zy3vz
	LLSb2kQX0jalJYknb5IwHZBdZF2YyyqqDB5kC2p40vYRa4TpMOZMqBWf5tDNtFmZPg51ZIm3QVz78
	O19U+0W0KNmzSIdNrJiFOGOCguHqWcQoLn2ofhGQdPv/6XcedV/xOChBas+/tRfMe97o8S9dccnAT
	MvC7AhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4s-0000000Gbfe-3Rm6;
	Mon, 26 Feb 2024 06:03:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4p-0000000GbdR-0dyG
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 06:03:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5ed6v004214;
	Mon, 26 Feb 2024 06:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=FVSajQ4ipY7CK01ECej57ZZ4nv+x5sAtuaAw3OxTecM=; b=Iv
	Sk1tSWepVeslOXbeu4dNFhHmC4BETp4l4YvPkFPDWxcj6wekZWLKKbpV95Dl3R+Q
	rb/8QUlUAbePWUqqp+puVFiFIXXVTv6WjYzk0CUTVXqGagDmdohgbDYA9qYHabP4
	CRmmxuRkPy8DqQZBcib5UjktBVBXNRsEuhaMi8mb4AzxY+KLSeZwyzahoV21HNbZ
	ijWxqSfngvEH6qktZTouwOejMRVV7exiMT5TwdJBXSJwsEjpy8OiJGmCt/TXBjTz
	FAp9DAAWjfdtwD32BVPEcbMURkSFfYGVpJ67fJYJi0KNhGsZl3FA4sLBJlFncaGb
	6YzQxRVB4mtprUovmrHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxp83k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q62TGs013463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:29 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 25 Feb 2024 22:02:27 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 6/6] wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066
Date: Mon, 26 Feb 2024 14:02:03 +0800
Message-ID: <20240226060203.2040444-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UDIU1emLCcPkKu7p5cOkcKtfJZvNUJXb
X-Proofpoint-GUID: UDIU1emLCcPkKu7p5cOkcKtfJZvNUJXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=682 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_220259_272304_A7B74260 
X-CRM114-Status: GOOD (  11.55  )
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

Now that all the necessary pieces are implemented we can enable P2P
support for QCA6390/WCN6855/QCA2066.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 20 ++++++++++++++++----
 drivers/net/wireless/ath/ath11k/mac.c  |  9 +++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c78bce19bd75..6e9f16f01ebd 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -247,7 +247,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_P2P_DEVICE) |
+					BIT(NL80211_IFTYPE_P2P_CLIENT) |
+					BIT(NL80211_IFTYPE_P2P_GO),
 		.supports_monitor = false,
 		.full_monitor_mode = false,
 		.supports_shadow_regs = true,
@@ -416,7 +419,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_P2P_DEVICE) |
+					BIT(NL80211_IFTYPE_P2P_CLIENT) |
+					BIT(NL80211_IFTYPE_P2P_GO),
 		.supports_monitor = false,
 		.full_monitor_mode = false,
 		.supports_shadow_regs = true,
@@ -501,7 +507,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_P2P_DEVICE) |
+					BIT(NL80211_IFTYPE_P2P_CLIENT) |
+					BIT(NL80211_IFTYPE_P2P_GO),
 		.supports_monitor = false,
 		.supports_shadow_regs = true,
 		.idle_ps = true,
@@ -750,7 +759,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_P2P_DEVICE) |
+					BIT(NL80211_IFTYPE_P2P_CLIENT) |
+					BIT(NL80211_IFTYPE_P2P_GO),
 		.supports_monitor = false,
 		.full_monitor_mode = false,
 		.supports_shadow_regs = true,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f52dd52dabbb..053785e0eba8 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6657,17 +6657,26 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_UNSPECIFIED:
 	case NL80211_IFTYPE_STATION:
 		arvif->vdev_type = WMI_VDEV_TYPE_STA;
+		if (vif->p2p)
+			arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_CLIENT;
 		break;
 	case NL80211_IFTYPE_MESH_POINT:
 		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
 		fallthrough;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
+		if (vif->p2p)
+			arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_GO;
 		break;
 	case NL80211_IFTYPE_MONITOR:
 		arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
 		ar->monitor_vdev_id = bit;
 		break;
+	case NL80211_IFTYPE_P2P_DEVICE:
+		arvif->vdev_type = WMI_VDEV_TYPE_STA;
+		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_DEVICE;
+		break;
+
 	default:
 		WARN_ON(1);
 		break;
-- 
2.34.1


