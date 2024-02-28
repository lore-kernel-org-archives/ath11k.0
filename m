Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA00FC54E41
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiWUsyXpw5t79ba+ke6QpSk5O9AgzQN2yOHp6omEHrM=; b=4p/LcZsI7UDL8k6NYuj0wDNhLs
	YN0+hKWWlU9lrveZorWmllkdzmJShU0Mricu0H3ZS4Vf77/iPJjqjIVrbNCqs5icijguaqf3AQay9
	Rj+KC4OIGHh4TIjRfj/E3YkEQ78GVKUaw+xI1gqbQcbxhyvhQZZgY+o5t+U49yrZXXlbSF+NGlaGF
	OTsknlnZcuPCiHjZGHAJk2aZZGxtCmc9KlKe479ISk5vhoej2J42Rn010uZTugnYW4wzFJTbYXUv3
	3ras/k4r0g1N3DdJho30OfTPNtLP6OUzUt//2tP8uJ4WvLcK7+hqwK0P9lzOATOu1KJOR0GQi3Rvi
	+huZ4Gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM9-00000008hVg-0JMZ;
	Wed, 28 Feb 2024 09:36:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM2-00000008hQj-3EPS
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 09:36:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S8WCgE004856;
	Wed, 28 Feb 2024 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=EiWUsyXpw5t79ba+ke6QpSk5O9AgzQN2yOHp6omEHrM=; b=cn
	71L4Uzkh8PeIMmNDAKmZiMb8D5ru5E7RnzoZ6I77DAMb6m6LKfOeBl02KIguld+9
	FKo7CSfjeAmNZKTiPqx1Ccko5scdUqm1Ekdv9G7+h0Z1O8SQ0XofIS/EGfZTeZjg
	FBcq+U6e/TzR5NF0Mg6eee9lTx6qAClybOWV5BOfSKflrEQNyZJAv7aMmmeOGZva
	FbWN5YeXt14Hkx06QLImXkbqxdU1g1OFYr7ixZr9lyNWnmLOA96HlKYE3x1Qt6j6
	TAUAsC8qvimaQ9DFi65Fdt5s078YhxslRWiSWEMVQfSNspvJKssB8uSLgbQCOmHy
	QHKTrI7Nv/9NYwFHcKIQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj1d9r42u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:35:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41S9Zu2R022396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:35:56 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 01:35:54 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 1/6] wifi: ath11k: change interface combination for P2P mode
Date: Wed, 28 Feb 2024 17:35:32 +0800
Message-ID: <20240228093537.25052-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228093537.25052-1-quic_kangyang@quicinc.com>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vSwY1HcSMNqWMjdE0w7IN9eYgaWCqsFK
X-Proofpoint-ORIG-GUID: vSwY1HcSMNqWMjdE0w7IN9eYgaWCqsFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_013558_909097_8C071AAA 
X-CRM114-Status: GOOD (  12.13  )
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

Current interface combination doesn't support P2P mode.

So change it for P2P mode.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
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


