Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE8DC4167B
	for <ath11k@archiver.kernel.org>; Mon,  4 Dec 2023 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zckhU6XXrFTdhtAORHJZy/WUb4YCCPg2rHd44PDAeGA=; b=aVbFS+vkYyTHDfUwc4NzMsgvf2
	Q2KqeAA3I/7Q9mCxSEGlMVjr2CTcRv91grDQoc7J+FP6XkndCkMsWqIdgKGEvL3oDPmiUVKlhDbxi
	SqK1yWLknsIDSIG6/TWsw1C/RlTxrXo4deTFwoM57MTZxMhUho45exBsmG62136VIcKDDGmy32PE4
	BXD/gMl7ReQuFkwq/1XV7BMRYQK64j8XXRulFpQsPFlVyOKsle48sKNyOuUUQk0ZVh3Eex53JzBFJ
	fx6cHHdB0FF0CWvjfBd6G692PM/hyzIQybPpzbu2yhP00sFm87+mlg0thb3if0z4JHBHFFGeDnuhL
	xp2pyW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA45L-003EIk-3D;
	Mon, 04 Dec 2023 08:13:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA45H-003EGJ-1s
	for ath11k@lists.infradead.org;
	Mon, 04 Dec 2023 08:13:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B469wZB013912;
	Mon, 4 Dec 2023 08:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zckhU6XXrFTdhtAORHJZy/WUb4YCCPg2rHd44PDAeGA=;
 b=QzRryxFw0TZthy9Z0/QOoX8TkEudqPb5jqQKXQw8JojjSJ9sRTJtvlOqhmJ/hA30pFBY
 AkhBhHeT54oTmw8r/I/Dl8gMGtcCcV9Xd59eLGGlhwHwvZ/iOtFZ5mAuKp11YMdYx+pC
 S6+J8wIjm03V0Ok78+3MNyVEmWm2SkL+rloJVrwWuUn8GEMrB0tmMcTAELKttPwreWjE
 eVdQsvPshGfdel2A0f90PUVx//BGzH8PC1BBDgSjPWoSwvRkwmWYGDQVeAUNfRYvtSaF
 HSF0Qg/Cjyg2MhFcbGtdwpl9Q/kH9RI50qvYELpg9g/cTbOywJPzvvRnuV0jjH88m0py gA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqvp13cem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 08:13:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B48DfI8026271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 08:13:41 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 00:13:40 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v8 04/12] wifi: ath11k: update regulatory rules when interface added
Date: Mon, 4 Dec 2023 16:13:15 +0800
Message-ID: <20231204081323.5582-5-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204081323.5582-1-quic_bqiang@quicinc.com>
References: <20231204081323.5582-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r_tfC2Smy9Kvf5Hdv0XnwfVZ-8t_PGrI
X-Proofpoint-ORIG-GUID: r_tfC2Smy9Kvf5Hdv0XnwfVZ-8t_PGrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_001343_743074_3A182707 
X-CRM114-Status: GOOD (  19.90  )
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

From: Wen Gong <quic_wgong@quicinc.com>

There are two power types for 6 GHz regulatory, one is AP, another
is client.

When wlan boot up, WMI_REG_CHAN_LIST_CC_EXT_EVENTID is sent from
firmware at an early stage, the interface mode is not decided at
this point, then ath11k select reg rules of AP type as default.

After interface is created, it is exactly decided the interface
type such as AP/mesh point/station. Then ath11k need to update
reg rules to the exact power type matched to the interface type.

The client power type is used for station interface, and AP power
type is used for AP/mesh point interface.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v8:
 no change.
v7:
 1. move ath11k_mac_supports_6ghz_cc_ext() to
    wmi.c and renamed as ath11k_wmi_supports_6ghz_cc_ext().

 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 drivers/net/wireless/ath/ath11k/mac.h | 1 -
 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f7b39817773..1e314fcab41b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6943,6 +6943,14 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				    ret);
 	}
 
+	if (ath11k_wmi_supports_6ghz_cc_ext(ar)) {
+		struct cur_regulatory_info *reg_info;
+
+		reg_info = &ab->reg_info_store[ar->pdev_idx];
+		ath11k_dbg(ab, ATH11K_DBG_MAC, "mac interface added to change reg rules\n");
+		ath11k_reg_handle_chan_list(ab, reg_info, IEEE80211_REG_LPI_AP);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 774a9f01c030..498e537cd695 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -156,7 +156,6 @@ struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
 u8 ath11k_mac_get_target_pdev_id(struct ath11k *ar);
 u8 ath11k_mac_get_target_pdev_id_from_vif(struct ath11k_vif *arvif);
 struct ath11k_vif *ath11k_mac_get_vif_up(struct ath11k_base *ab);
-
 struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 void ath11k_mac_drain_tx(struct ath11k *ar);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6f0a35fcc9c1..9a0568676a74 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9858,3 +9858,9 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 
 	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
 }
+
+bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)
+{
+	return (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
+			 ar->ab->wmi_ab.svc_map)) && ar->supports_6ghz;
+}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index d46c70704774..fa85e6eb4ab4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -6485,4 +6485,5 @@ void ath11k_reg_reset_info(struct cur_regulatory_info *reg_info);
 int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 				struct cur_regulatory_info *reg_info,
 				enum ieee80211_ap_reg_power power_type);
+bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar);
 #endif
-- 
2.25.1


