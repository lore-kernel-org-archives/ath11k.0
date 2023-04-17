Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3977CC77B72
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 20:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XKBW+jVBu9sTYZ9D62RJt7+LeB0JazzRbjw9ZYxWS4k=; b=zLQofqRjs4t1s5
	vbWI24q1IiYwgLaTWpf/vTWLjZyXZSSO9lVe3IMu2Zd+7mOONLGVEUuD46JoMmxzrTztUuWFU1IE9
	ZpTSH6FhdOkloOSxqZ2g+Z8cdicY72p2dxzVU1vWhar4exC1pvkOZkfXK676fc1uaPDWiLOAhvnXR
	ugYGyXj40ibW+weJz9fP4Ar8LxVtEJtLSaaQYGbFz16pnj4kiA6EB2C4vuqY/a50IVbwVky+wuc8M
	AeKDy25zWNdRd44FopAKE5OwYIEra79WK3L6bLqI8XVb5YuNW22BYGIoKI74szm42Ih8sdlHIZwgS
	muucxIVwmeqpgRoliQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poVNG-00HWAh-0t;
	Mon, 17 Apr 2023 20:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poVND-00HW9I-0b
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 20:22:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HIsf5q010173;
	Mon, 17 Apr 2023 20:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=FGtbeAR6pG0KxyEKVLIRzkq1RXlKfaVfRT1iixzMcII=;
 b=jSdZBeFj4RAdCiUPrL/F9n+ufnpxT1pJNfZuA0tfEnUf54SCGUuHT5LtRdojYVh31YSS
 aAGDRFvl7tIKqq/c6h4tm7SDdlhWF+MU3sH1YJNrwDeMAUZD+RnviJjo+GfgnEtp9+z7
 PA75vGkpKiuMh6M8QFYB+/XxrJmx/XJBNESfMdAjBuMXnQf4S2yJ/IMwSxPkYKMU3lC6
 DNnUAcgC/8wawYt8T1d8gKWq5CgWls4i1quveZghsbGUuL01i7SRXdKVianDJJsHEa0G
 /brUp6LMMeJUgEI8wBfFAtcknzN0ADMVEqsJr+AHvQXnb1iHZyafl6BAeupXNS+Yi+fJ sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q171gh1hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 20:22:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HKMjHs007640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 20:22:46 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 17 Apr 2023 13:22:44 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH] wifi: ath11k: Remove disabling of 80+80 and 160 MHz
Date: Mon, 17 Apr 2023 13:22:27 -0700
Message-ID: <1681762947-13882-1-git-send-email-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wqGG1zw0KpXNYk_yFYb16HwLWt9V-6o4
X-Proofpoint-ORIG-GUID: wqGG1zw0KpXNYk_yFYb16HwLWt9V-6o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_13,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=796 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_132251_359382_B5D4F749 
X-CRM114-Status: GOOD (  15.94  )
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

This is a regression fix for 80+80 and 160 MHz support bits being
cleared, therefore not adverised. Remove disable of 80+80 and 160 MHz
capability flags and assign valid center frequency 2 similar to
VHT80_80.

Fixes: 38dfe775d0ab ("wifi: ath11k: push MU-MIMO params from hostapd to hardware")
Reported-by: Robert Marko <robert.marko@sartura.hr>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217299
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ----
 drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..4f0bf62eb29f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5552,10 +5552,6 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 
 		he_cap_elem->mac_cap_info[1] &=
 			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_MASK;
-		he_cap_elem->phy_cap_info[0] &=
-			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
-		he_cap_elem->phy_cap_info[0] &=
-			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
 
 		he_cap_elem->phy_cap_info[5] &=
 			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 27f3fceb33c5..fcc153df56d0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -865,7 +865,8 @@ static void ath11k_wmi_put_wmi_channel(struct wmi_channel *chan,
 
 		chan->band_center_freq2 = arg->channel.band_center_freq1;
 
-	} else if (arg->channel.mode == MODE_11AC_VHT80_80) {
+	} else if ((arg->channel.mode == MODE_11AC_VHT80_80) ||
+		   (arg->channel.mode == MODE_11AX_HE80_80)) {
 		chan->band_center_freq2 = arg->channel.band_center_freq2;
 	} else {
 		chan->band_center_freq2 = 0;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
