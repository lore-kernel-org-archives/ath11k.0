Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20063C7EE2A
	for <ath11k@archiver.kernel.org>; Thu, 29 Aug 2024 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grpaQsa39ruZF7BhOW0TIo1B/yCO1GRYYtif5zHil9k=; b=npp74o/owiJKBZSnWGrLzcK9dW
	HF8s7y5Lw0+Bjt2IUUhqtu+bWGOeXmO3LFAkO8wl9LW2u8KUePYeUqeEBB+hZ10B9x1xlV6autNi1
	x3zqoms9o1bBUGsaobAvuXEtw/EGvoUss7nTJFVJ6VX79Vc2B3nh+HoelcB02LicP8FXxFWgTmu5D
	OgpTmjGXXnCo2yfPFmoANUXqSpAHdEHush6/PWhHXzuC2IZ8/J8KrFxLKZ4t1YCtkI6THasykbiZi
	SuQWXSRWaqHoxznZGNrsNUczmUy5zFXDxJphbeB4Go+EqU/zUa/KUKEBc36RJCXJU05arEOXsEEZI
	2RuAo4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYwg-00000000ptp-1dlY;
	Thu, 29 Aug 2024 06:47:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYuf-00000000pXm-3e2g
	for ath11k@lists.infradead.org;
	Thu, 29 Aug 2024 06:45:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJLuE5023318;
	Thu, 29 Aug 2024 06:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=grpaQsa39ruZF7BhOW0TIo
	1B/yCO1GRYYtif5zHil9k=; b=n9v0Mq6H++ab3Vup1LQGmRh2iR+yPWBwBqTxv9
	rfwQeHR607RQYycFVUy10vFZ043tyrH6++2V4Q6nNqzqT54beQVQMLNYUUx7tttq
	hvX6LS+HK9o02D27TFuRO2Jo7OPSyOXLpnGTTO5UNmH7G2AeKOk0wNuBoEKO1YLb
	9waUcmK6o4m7i+795skCPT8qLxxfLfVLeLzjrfyQ8DLQ0He8Ch7iz9nzYzd0BDe3
	yj+sVdqGcGMhJn3VFUo32RhLHgNQs3+VOyO5q+TiEj5cVfHvkywnmNRg3FtwCcj+
	FITD3u+hELtaDvKzKY0j5OsNwSj9CtJRrVdhdrZa9w9odyVQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612j36q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 06:45:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T6jW6I008635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 06:45:32 GMT
Received: from yuzha-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 23:45:30 -0700
From: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <quic_yuzha@quicinc.com>
Subject: [PATCH] wifi: ath11k: support DBS and DFS compatibility
Date: Thu, 29 Aug 2024 14:44:20 +0800
Message-ID: <20240829064420.3074140-1-quic_yuzha@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w0b0Aq70CqQHoO6vXKI5HJpHIUfbrLdZ
X-Proofpoint-ORIG-GUID: w0b0Aq70CqQHoO6vXKI5HJpHIUfbrLdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=987 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_234546_058291_191CCFCB 
X-CRM114-Status: GOOD (  12.79  )
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

Now some chips which support 'support_dual_stations' will enable DBS,
but will disable DFS. Restructure the ath11k_mac_setup_iface_combinations
function to support DBS and DFS compatibility.

About 'support_dual_station' feature can refer:
https://msgid.link/20230714023801.2621802-2-quic_cjhuang@quicinc.com

Add a ieee80211_iface_combination to support DBS and DFS compatibility,
one combination can support DFS(same with non dual sta), another
combination can support DBS. When running different scenarios that will
use different ieee80211_iface_combination due to mac80211 will go through
all of possible interface combinations.

In addition, maximum number of interfaces of these types should be total
allowed in this group.

The chips affected are:

 QCA6390 hw2.0
 WCN6855 hw2.0
 WCN6855 hw2.1

Other chips are not affected.

Tested-on: WCN6855 WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1.

Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 42 +++++++++++++++------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f8068d2e848c..a37c4c420ab0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9912,12 +9912,17 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	struct ath11k_base *ab = ar->ab;
 	struct ieee80211_iface_combination *combinations;
 	struct ieee80211_iface_limit *limits;
-	int n_limits;
+	int n_limits, n_combos;
 	bool p2p;
 
 	p2p = ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_P2P_DEVICE);
 
-	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
+	if (ab->hw_params.support_dual_stations)
+		n_combos = 2;
+	else
+		n_combos = 1;
+
+	combinations = kcalloc(n_combos, sizeof(*combinations), GFP_KERNEL);
 	if (!combinations)
 		return -ENOMEM;
 
@@ -9932,7 +9937,9 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 		return -ENOMEM;
 	}
 
+	limits[0].max = 1;
 	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
+	limits[1].max = 16;
 	limits[1].types |= BIT(NL80211_IFTYPE_AP);
 	if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
 	    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
@@ -9942,25 +9949,24 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	combinations[0].n_limits = n_limits;
 	combinations[0].beacon_int_infra_match = true;
 	combinations[0].beacon_int_min_gcd = 100;
+	combinations[0].max_interfaces = 16;
+	combinations[0].num_different_channels = 1;
+	combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+						BIT(NL80211_CHAN_WIDTH_20) |
+						BIT(NL80211_CHAN_WIDTH_40) |
+						BIT(NL80211_CHAN_WIDTH_80) |
+						BIT(NL80211_CHAN_WIDTH_80P80) |
+						BIT(NL80211_CHAN_WIDTH_160);
 
 	if (ab->hw_params.support_dual_stations) {
 		limits[0].max = 2;
-		limits[1].max = 1;
-
-		combinations[0].max_interfaces = ab->hw_params.num_vdevs;
-		combinations[0].num_different_channels = 2;
-	} else {
-		limits[0].max = 1;
-		limits[1].max = 16;
 
-		combinations[0].max_interfaces = 16;
-		combinations[0].num_different_channels = 1;
-		combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
-							BIT(NL80211_CHAN_WIDTH_20) |
-							BIT(NL80211_CHAN_WIDTH_40) |
-							BIT(NL80211_CHAN_WIDTH_80) |
-							BIT(NL80211_CHAN_WIDTH_80P80) |
-							BIT(NL80211_CHAN_WIDTH_160);
+		combinations[1].limits = limits;
+		combinations[1].n_limits = n_limits;
+		combinations[1].beacon_int_infra_match = true;
+		combinations[1].beacon_int_min_gcd = 100;
+		combinations[1].max_interfaces = ab->hw_params.num_vdevs;
+		combinations[1].num_different_channels = 2;
 	}
 
 	if (p2p) {
@@ -9971,7 +9977,7 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	}
 
 	ar->hw->wiphy->iface_combinations = combinations;
-	ar->hw->wiphy->n_iface_combinations = 1;
+	ar->hw->wiphy->n_iface_combinations = n_combos;
 
 	return 0;
 }
-- 
2.34.1


