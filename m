Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E21CE79AB
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtGgCMX1/8ShU6p3ZLIvgb6+3Ew3qZ6kiwD/9ls80Wk=; b=Aac+FuWIXBhfQ4
	L7zgSv+JmBH5yBT6/mHzYGYVawGf9mNr4GMgIqKz/8RqSX5mRsAqzugt+WC7e6K4BU5WUeclK3iSd
	rJWUKI90jfiav+ibnL5Fs2R6nEfypRazaPzH/S1G7xTDzxRfVDnvokDuHYVY/IwYkywr+GgTX2EVL
	ZQ73ii2ehJRLJY2fs5lSadnxA/f4unog4cGmkQSy2iVE6CZ7KPoZIQz4aj2BX9H/8/NJVIP1IYfip
	FAFyiauO82Br8wDxGMB58P1IXjKaroxCdRQCahJUTFcZ5E+xjZ4EUgFabf3nq2SOPwqmPQNRny/n0
	2g9ps3Bj0K3HARIKxqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVc-002H5j-2K;
	Wed, 20 Sep 2023 08:24:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVZ-002H3K-2z
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 08:24:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38K6ovmD022153;
	Wed, 20 Sep 2023 08:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=VLJpq2idVqH8ykfT5tytYv41EGlmcWFkQ0RuFhFvsZA=;
 b=mZJQ7YXiFJRB6N8/De1lgFqegBUYL3aWnIVdDFz4S4N/D0iG6l81Ucm0c3nv7MV/BZNT
 B7QBVbSGRvE1p/IbEJnrV0Hz0oiJFJHqyZP8q0x6ZyQ992Bs/aZbX+mnshiMmPDkqXzf
 UWQw8EzlpgNoFdcolQOKdDChfO28lgG3HE4S05yX180OokjiRbGLZLyUHmgmu5KHyxdk
 PjHnY5LWQQ+tpE430wdOsTvDTAXORccP1pjSjlH8wehAIk/e0jlS9eh554AgEn3w+A0K
 IUsKMF0msncghdAzGbWlCK42P2M4zZ357vPMnOE1EZ8KiboZZRQCLadjHrqlqpdy1mih CA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t78upjmj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38K8ORi6006204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:27 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 20 Sep 2023 01:24:25 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 11/13] wifi: ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz
Date: Wed, 20 Sep 2023 04:23:47 -0400
Message-ID: <20230920082349.29111-12-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920082349.29111-1-quic_wgong@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: owjiQHBUJd9khcJdJyLW6RPc-DSSRMqa
X-Proofpoint-ORIG-GUID: owjiQHBUJd9khcJdJyLW6RPc-DSSRMqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012429_969167_D18722DF 
X-CRM114-Status: GOOD (  19.61  )
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

When station is connected to a 6 GHz AP, it has 2 way to configure
the power limit to firmware. The first way is to send 2 wmi command
WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
firmware which include more parameters for power control.

When firmware support SERVICE_EXT_TPC_REG, it means firmware support
the second way for WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k discard
BSS_CHANGED_TXPOWER flag from mac80211 which is used to the first way
for 6 GHz band in this patch and select the second way in the subsequent
patch.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f05d66913abd..a8ae281d2635 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3396,6 +3396,18 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
 	return 0;
 }
 
+static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
+					    struct ath11k_vif *arvif,
+					    const struct cfg80211_chan_def *chandef)
+{
+	return ath11k_mac_supports_6ghz_cc_ext(ar) &&
+		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
+		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
+		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
+		chandef->chan &&
+		chandef->chan->band == NL80211_BAND_6GHZ;
+}
+
 static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 					   struct ieee80211_vif *vif,
 					   struct ieee80211_bss_conf *info,
@@ -3595,9 +3607,13 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_TXPOWER) {
 		ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "vdev_id %i txpower %d\n",
 			   arvif->vdev_id, info->txpower);
-
-		arvif->txpower = info->txpower;
-		ath11k_mac_txpower_recalc(ar);
+		if (ath11k_mac_supports_station_tpc(ar, arvif, &info->chandef)) {
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "discard tx power, change to set TPC power\n");
+		} else {
+			arvif->txpower = info->txpower;
+			ath11k_mac_txpower_recalc(ar);
+		}
 	}
 
 	if (changed & BSS_CHANGED_PS &&
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
