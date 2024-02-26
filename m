Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54728C48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgVOtntWh4SWI1w8eTOBwVp20v5pUOsEfNO9D+YWACk=; b=j02uwmECk06MKsoWgp3T8Vm6D/
	Yl5sig3DlTxtXW4wVJP9drnrqDVtPkzus/NKFE3exPErEX9Fj4s/YGxZNhAt0+5BwUuXFQoQ1mMNj
	R5AFqWjPybsXnriBNnKuPv57p3Try4Z33jKXwux36c0Wtig0lfoLOvgi0x+1jSZIUeZkuMVWvkfSh
	UGQmHUyt7cJ5Iz721SRfSs60mHJgb7J/LRVZNwE+xYcmbT8GV/gT9zSxetNRxrr097lhskoK8BY2X
	vdk/H68jIvzGJ50bIE+jPW5C7wl3DyWIcK3wjYH4z3VaUj4yhz6Q4j5ZuKNdzYU2K850PAy0xDWHs
	PBkFcqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4U-0000000GbVS-1lTx;
	Mon, 26 Feb 2024 06:02:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4R-0000000GbUX-2xSP
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 06:02:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5fAem010955;
	Mon, 26 Feb 2024 06:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=fgVOtntWh4SWI1w8eTOBwVp20v5pUOsEfNO9D+YWACk=; b=Ep
	Ttv0OBi1ZXAR+RSDGB70+wHBvcvNrrlNUlrwq5KMXIdt5Ej5afbgnGIaLeSpHq8h
	cV3kGyTTMS/C6N9dyerSeLkOSbtxRzN4i6bhehtqfI6phP+3+F7b7xFQH28ihKBi
	vaCRITMyKntfcpDRbjtL676+dwzja43bwSFo5MOGJIvu/a/vTSUg/0pV+PkurGx5
	vpOf3rXM81F8Wv5/jwmn4Et4x3WnpOkmFhWg+InD7orxpJpWgkDwP43B4Nxe1VuA
	G5HRuXHiPSIRQwz64qur3jYO4d/17ouPoxWte3OqFrDp5PpjK0tnXdzMlcmK2h8J
	Fjo1gQPcWnOrtBrAPV5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxmg3dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q62LYU012956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:21 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 25 Feb 2024 22:02:20 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 1/6] wifi: ath11k: change interface combination for P2P mode
Date: Mon, 26 Feb 2024 14:01:58 +0800
Message-ID: <20240226060203.2040444-2-quic_kangyang@quicinc.com>
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
X-Proofpoint-GUID: MwutEkY7W1yDWzTPVoguUYNLyweSkAmK
X-Proofpoint-ORIG-GUID: MwutEkY7W1yDWzTPVoguUYNLyweSkAmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_220235_779453_2B108C37 
X-CRM114-Status: GOOD (  13.01  )
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

Current interafce combination doesn't support P2P mode.

So change it for P2P mode.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 47 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a6a37d67a50a..9240dedf3217 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9857,12 +9857,18 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	struct ieee80211_iface_combination *combinations;
 	struct ieee80211_iface_limit *limits;
 	int n_limits;
+	bool p2p;
+
+	p2p = ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_P2P_DEVICE);
 
 	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
 	if (!combinations)
 		return -ENOMEM;
 
-	n_limits = 2;
+	if (p2p)
+		n_limits = 3;
+	else
+		n_limits = 2;
 
 	limits = kcalloc(n_limits, sizeof(*limits), GFP_KERNEL);
 	if (!limits) {
@@ -9870,39 +9876,29 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 		return -ENOMEM;
 	}
 
+	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
+	limits[1].types |= BIT(NL80211_IFTYPE_AP);
+	if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
+	    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
+		limits[1].types |= BIT(NL80211_IFTYPE_MESH_POINT);
+
+	combinations[0].limits = limits;
+	combinations[0].n_limits = n_limits;
+	combinations[0].beacon_int_infra_match = true;
+	combinations[0].beacon_int_min_gcd = 100;
+
 	if (ab->hw_params.support_dual_stations) {
 		limits[0].max = 2;
-		limits[0].types |= BIT(NL80211_IFTYPE_STATION);
-
 		limits[1].max = 1;
-		limits[1].types |= BIT(NL80211_IFTYPE_AP);
-		if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
-		    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
-			limits[1].types |= BIT(NL80211_IFTYPE_MESH_POINT);
 
-		combinations[0].limits = limits;
-		combinations[0].n_limits = 2;
 		combinations[0].max_interfaces = ab->hw_params.num_vdevs;
 		combinations[0].num_different_channels = 2;
-		combinations[0].beacon_int_infra_match = true;
-		combinations[0].beacon_int_min_gcd = 100;
 	} else {
 		limits[0].max = 1;
-		limits[0].types |= BIT(NL80211_IFTYPE_STATION);
-
 		limits[1].max = 16;
-		limits[1].types |= BIT(NL80211_IFTYPE_AP);
-
-		if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
-		    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
-			limits[1].types |= BIT(NL80211_IFTYPE_MESH_POINT);
 
-		combinations[0].limits = limits;
-		combinations[0].n_limits = 2;
 		combinations[0].max_interfaces = 16;
 		combinations[0].num_different_channels = 1;
-		combinations[0].beacon_int_infra_match = true;
-		combinations[0].beacon_int_min_gcd = 100;
 		combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
 							BIT(NL80211_CHAN_WIDTH_20) |
 							BIT(NL80211_CHAN_WIDTH_40) |
@@ -9911,6 +9907,13 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 							BIT(NL80211_CHAN_WIDTH_160);
 	}
 
+	if (p2p) {
+		limits[1].types |= BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			BIT(NL80211_IFTYPE_P2P_GO);
+		limits[2].max = 1;
+		limits[2].types |= BIT(NL80211_IFTYPE_P2P_DEVICE);
+	}
+
 	ar->hw->wiphy->iface_combinations = combinations;
 	ar->hw->wiphy->n_iface_combinations = 1;
 
-- 
2.34.1


