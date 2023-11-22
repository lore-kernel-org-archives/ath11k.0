Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F42C61D9B
	for <ath11k@archiver.kernel.org>; Wed, 22 Nov 2023 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6Srkhr79A2zEB2hmrDgCDjapCN+Mazv7nfZBio9RUU=; b=4HfIoAIWXoKS9L
	5f/Yd1go2JSYVLzhfoBYwxD2tbjxxbA4Qjyn1cnAmtDh9tbio/1SaE60qNzq11HDGblZC6LzVLcxD
	nptpSKLvSTHfDuLzPAjKvKBdvnPOnbUlFsbnTJ4b6dkeZL1dWdL4kBzIUmoQiLD18/SkMv1oQxL2N
	1o6LpCYX9sZ+skNxQYAXJ8ONj+2ChwGdK7wJfBry91U8iyJXqTwqNhya5dyhYb1baDjNsnrPENV5Y
	Nuw8v7FHAx5GVEkq9ZLQFbdLuO3260cABW6VCsaZsngSZIdof1vdHPbWyf9uRRLzYqTxpTBS0Rltf
	2pVmdD/+PsEXpiEMZIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLH-001Aa0-0g;
	Wed, 22 Nov 2023 09:16:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLC-001AX9-1c
	for ath11k@lists.infradead.org;
	Wed, 22 Nov 2023 09:16:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM7bfb0017995;
	Wed, 22 Nov 2023 09:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=N8XxmtRKtqNRPLO8lbssJxhIK27HetEQIZeqSuRnFzI=;
 b=CunjLx8iUcbj4S3lLIr/QIJeYxjSB0fNxx/+WKFPbL4Q1bJb4XucA36M3oJEh90+ofY5
 PCtCRCHtuP4GTMupTiayru/7JslQ0LkzOITLZUzpuXy+ZOuzjF7I5hVx/6mnqklgXmjV
 CINTK4ivsZ6KA7svN72smw22GmZET8QPCnc4uBqOoggRkdHYhEyPbk6PVx1SHSgw8997
 j7gZz8cYbPJmvMcZ5kvSfQX+t62SiPCJr71llNTD1eCXSnh3jKHLwVyKAiY+xrLIbndO
 8997S8Z2TusohsZdai0yhVrvDku2XOwVQUSxMlshQ5zysNWrQX2AVCBMaJy8bx6enAzR 2w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uh477hfwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AM9GAn6008032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:10 GMT
Received: from bqiang-Celadon-RN.lan (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 01:16:10 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v7 01/12] wifi: ath11k: add support to select 6 GHz regulatory type
Date: Wed, 22 Nov 2023 17:15:42 +0800
Message-ID: <20231122091553.10837-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122091553.10837-1-quic_bqiang@quicinc.com>
References: <20231122091553.10837-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LrbD54YyTF0BJFF04V4dIIY1eDZvGxsW
X-Proofpoint-GUID: LrbD54YyTF0BJFF04V4dIIY1eDZvGxsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=960 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_011614_543875_E48FF2C4 
X-CRM114-Status: GOOD (  20.24  )
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

From: Wen Gong <quic_wgong@quicinc.com>

There are 3 types of regulatory rules for AP mode and 6 type for
station mode. Add wmi_vdev_type and ieee80211_ap_reg_power to
select the exact reg rules.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v7:
 no change.

 drivers/net/wireless/ath/ath11k/reg.c | 66 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/reg.h |  6 ++-
 drivers/net/wireless/ath/ath11k/wmi.c |  3 +-
 3 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 3c7debae800a..26c4cdcbd5ac 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -617,25 +617,64 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	*rule_idx = i;
 }
 
+enum wmi_reg_6ghz_ap_type
+ath11k_reg_ap_pwr_convert(enum ieee80211_ap_reg_power power_type)
+{
+	switch (power_type) {
+	case IEEE80211_REG_LPI_AP:
+		return WMI_REG_INDOOR_AP;
+	case IEEE80211_REG_SP_AP:
+		return WMI_REG_STANDARD_POWER_AP;
+	case IEEE80211_REG_VLP_AP:
+		return WMI_REG_VERY_LOW_POWER_AP;
+	default:
+		return WMI_REG_MAX_AP_TYPE;
+	}
+}
+
 struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
-		      struct cur_regulatory_info *reg_info, bool intersect)
+		      struct cur_regulatory_info *reg_info, bool intersect,
+		      enum wmi_vdev_type vdev_type,
+		      enum ieee80211_ap_reg_power power_type)
 {
 	struct ieee80211_regdomain *tmp_regd, *default_regd, *new_regd = NULL;
-	struct cur_reg_rule *reg_rule;
+	struct cur_reg_rule *reg_rule, *reg_rule_6ghz;
 	u8 i = 0, j = 0, k = 0;
 	u8 num_rules;
 	u16 max_bw;
-	u32 flags;
+	u32 flags, reg_6ghz_number, max_bw_6ghz;
 	char alpha2[3];
 
 	num_rules = reg_info->num_5ghz_reg_rules + reg_info->num_2ghz_reg_rules;
 
-	/* FIXME: Currently taking reg rules for 6 GHz only from Indoor AP mode list.
-	 * This can be updated after complete 6 GHz regulatory support is added.
-	 */
-	if (reg_info->is_ext_reg_event)
-		num_rules += reg_info->num_6ghz_rules_ap[WMI_REG_INDOOR_AP];
+	if (reg_info->is_ext_reg_event) {
+		if (vdev_type == WMI_VDEV_TYPE_STA) {
+			enum wmi_reg_6ghz_ap_type ap_type;
+
+			ap_type = ath11k_reg_ap_pwr_convert(power_type);
+
+			if (ap_type == WMI_REG_MAX_AP_TYPE)
+				ap_type = WMI_REG_INDOOR_AP;
+			reg_6ghz_number = reg_info->num_6ghz_rules_client
+					[ap_type][WMI_REG_DEFAULT_CLIENT];
+			if (reg_6ghz_number == 0) {
+				ap_type = WMI_REG_INDOOR_AP;
+				reg_6ghz_number = reg_info->num_6ghz_rules_client
+						[ap_type][WMI_REG_DEFAULT_CLIENT];
+			}
+			reg_rule_6ghz = reg_info->reg_rules_6ghz_client_ptr
+					[ap_type][WMI_REG_DEFAULT_CLIENT];
+			max_bw_6ghz = reg_info->max_bw_6ghz_client
+					[ap_type][WMI_REG_DEFAULT_CLIENT];
+		} else {
+			reg_6ghz_number = reg_info->num_6ghz_rules_ap[WMI_REG_INDOOR_AP];
+			reg_rule_6ghz =
+				reg_info->reg_rules_6ghz_ap_ptr[WMI_REG_INDOOR_AP];
+			max_bw_6ghz = reg_info->max_bw_6ghz_ap[WMI_REG_INDOOR_AP];
+		}
+		num_rules += reg_6ghz_number;
+	}
 
 	if (!num_rules)
 		goto ret;
@@ -682,13 +721,10 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 			 * per other BW rule flags we pass from here
 			 */
 			flags = NL80211_RRF_AUTO_BW;
-		} else if (reg_info->is_ext_reg_event &&
-			   reg_info->num_6ghz_rules_ap[WMI_REG_INDOOR_AP] &&
-			   (k < reg_info->num_6ghz_rules_ap[WMI_REG_INDOOR_AP])) {
-			reg_rule = reg_info->reg_rules_6ghz_ap_ptr[WMI_REG_INDOOR_AP] +
-				   k++;
-			max_bw = min_t(u16, reg_rule->max_bw,
-				       reg_info->max_bw_6ghz_ap[WMI_REG_INDOOR_AP]);
+		} else if (reg_info->is_ext_reg_event && reg_6ghz_number &&
+			   (k < reg_6ghz_number)) {
+			reg_rule = reg_rule_6ghz + k++;
+			max_bw = min_t(u16, reg_rule->max_bw, max_bw_6ghz);
 			flags = NL80211_RRF_AUTO_BW;
 		} else {
 			break;
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 84daa6543b6a..8431d008a25b 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -33,7 +33,11 @@ void ath11k_reg_free(struct ath11k_base *ab);
 void ath11k_regd_update_work(struct work_struct *work);
 struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
-		      struct cur_regulatory_info *reg_info, bool intersect);
+		      struct cur_regulatory_info *reg_info, bool intersect,
+		      enum wmi_vdev_type vdev_type,
+		      enum ieee80211_ap_reg_power power_type);
 int ath11k_regd_update(struct ath11k *ar);
 int ath11k_reg_update_chan_list(struct ath11k *ar, bool wait);
+enum wmi_reg_6ghz_ap_type
+ath11k_reg_ap_pwr_convert(enum ieee80211_ap_reg_power power_type);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2845b4313d3a..8629e66eb771 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7151,7 +7151,8 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab,
 	    !ath11k_reg_is_world_alpha((char *)reg_info->alpha2))
 		intersect = true;
 
-	regd = ath11k_reg_build_regd(ab, reg_info, intersect);
+	regd = ath11k_reg_build_regd(ab, reg_info, intersect,
+				     WMI_VDEV_TYPE_AP, IEEE80211_REG_LPI_AP);
 	if (!regd) {
 		ath11k_warn(ab, "failed to build regd from reg_info\n");
 		goto fallback;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
