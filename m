Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0676C5472F
	for <ath11k@archiver.kernel.org>; Mon, 26 Aug 2024 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejUiGfGXLBo3+0XPv6rD4bCCGasyHGZc97m2ozGVeV4=; b=ckRUisxtDee/0rXyHFW9eb0K+b
	sx8YO+74tZItpKERYUSiZ4GQQUXNZOoQl72GS8VMcVPy7C4ZeutPW75j67MCRt7oJgW5u6s57Lxf3
	jIGn3tRuvf6OU7Uxqg0sB/d2bWsWcmDPUlip9Dh2oQprQFrtla0x33l+12Htk/5mbt/AuzFMPsO39
	J2aYUG0TDQ0rddK+fbIgd7M18Sv2s0zaaFoqLkvWtp2vWFC0MSkWSdnpFSg+0iC3RTJRcfF6Obxdb
	0E2ZW9/USeG9HeRqRtTO7G5AdlK6YDv6hLYntlrX+HITLzuLzD6BPDTAWAyWjKSIe8YJPWPq8Cna6
	V8YZEk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOs1-00000005Ta6-1fns;
	Mon, 26 Aug 2024 01:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOrw-00000005TY5-1bQm
	for ath11k@lists.infradead.org;
	Mon, 26 Aug 2024 01:50:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PNkugu004858;
	Mon, 26 Aug 2024 01:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejUiGfGXLBo3+0XPv6rD4bCCGasyHGZc97m2ozGVeV4=; b=iN7FPDo+sB5ilMmR
	EKbyAGJvPjnp/PtewDIQ73w2zwtipdqS7svg06AWYDvLPw4NJFeWYUQi4dO8eqxl
	8XEnPJ5+8oJXDINaafScyFpxnkmjpE8XP81eFTifGNimgjw+yBmadMRNNrpfrBTt
	U9ejXZxl9E3xrAtha6s2gSeZzwr5+PatqOflHejYeFVCtU2aBS4Hx4qfpogCY1WI
	X1GFaOE6f375hooAGywOcFZ3WgKXEUw5yHVLNFjgXUrCqdrv2hufQNkq46UQWGfi
	/qeoV+wuUZpDdUsh4ixzi2DQ//1TnDhHtMPQRUzt00UPT/I60gfAueN4TYv8j05+
	X1rN4Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179ant5yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q1o7aI022347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:07 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 Aug
 2024 18:50:05 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 3/3] wifi: ath11k: fix leaking station RX/TX stats in reset scenario
Date: Mon, 26 Aug 2024 09:49:42 +0800
Message-ID: <20240826014942.87783-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826014942.87783-1-quic_bqiang@quicinc.com>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2xM3e83qnwQoIzvfZC77YJ-w2TJ1nXiE
X-Proofpoint-ORIG-GUID: 2xM3e83qnwQoIzvfZC77YJ-w2TJ1nXiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_20,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_185008_486276_0CC3AABA 
X-CRM114-Status: GOOD (  15.51  )
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

Currently ath12k_sta::rx_stats/tx_stats would only get freed when the station
transit from NONE to NOTEXIST state within ath11k_mac_op_sta_state(). However
in reset scenario, there is no chance for it to go through such transition.
Further, after reset, when a new connection to AP starts, ath12k_sta is zerod
in NOTEXIST to NONE transition, making rx_stats/tx_stats leaked:

Kmemleak reports:
unreferenced object 0xffff9a3cd0a23400 (size 1024):
  backtrace (crc 21ee4c52):
    kmalloc_trace_noprof+0x2ba/0x360
    ath11k_mac_op_sta_state+0x1b6/0xca0 [ath11k]
    drv_sta_state+0x11e/0x9c0 [mac80211]
    sta_info_insert_rcu+0x469/0x880 [mac80211]
    sta_info_insert+0x10/0x80 [mac80211]
    ieee80211_prep_connection+0x295/0x950 [mac80211]
    ieee80211_mgd_auth+0x230/0x5a0 [mac80211]
    cfg80211_mlme_auth+0xeb/0x2a0 [cfg80211]

Add a new function which frees them, and call it during reset to fix this issue.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 27 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/mac.h  |  3 ++-
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 03187df26000..586217de9581 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1972,6 +1972,7 @@ void ath11k_core_halt(struct ath11k *ar)
 	ar->allocated_vdev_map = 0;
 
 	ath11k_mac_scan_finish(ar);
+	ath11k_mac_station_cleanup_all(ar);
 	ath11k_mac_peer_cleanup_all(ar);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->regd_update_work);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f21d37cefb65..a02fd07f8f1c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9512,6 +9512,15 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 	return ret;
 }
 
+static void ath11k_mac_station_free_stats(struct ath11k_sta *arsta)
+{
+	kfree(arsta->tx_stats);
+	arsta->tx_stats = NULL;
+
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
+}
+
 static int ath11k_mac_station_remove(struct ath11k *ar,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta)
@@ -9545,15 +9554,23 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 
 	ath11k_mac_dec_num_stations(arvif, sta);
 
-	kfree(arsta->tx_stats);
-	arsta->tx_stats = NULL;
-
-	kfree(arsta->rx_stats);
-	arsta->rx_stats = NULL;
+	ath11k_mac_station_free_stats(arsta);
 
 	return ret;
 }
 
+static void ath11k_mac_station_cleanup(void *data, struct ieee80211_sta *sta)
+{
+	ath11k_mac_station_free_stats(ath11k_sta_to_arsta(sta));
+}
+
+void ath11k_mac_station_cleanup_all(struct ath11k *ar)
+{
+	ieee80211_iterate_stations_atomic(ar->hw,
+					  ath11k_mac_station_cleanup,
+					  NULL);
+}
+
 static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f5800fbecff8..17d0bbfc52bf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_MAC_H
@@ -179,4 +179,5 @@ int ath11k_mac_vif_set_keepalive(struct ath11k_vif *arvif,
 void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
 				  struct ieee80211_vif *vif,
 				  struct ieee80211_chanctx_conf *ctx);
+void ath11k_mac_station_cleanup_all(struct ath11k *ar);
 #endif
-- 
2.25.1


