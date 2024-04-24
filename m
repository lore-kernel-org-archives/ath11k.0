Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44512C4345F
	for <ath11k@archiver.kernel.org>; Wed, 24 Apr 2024 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLpixUn7RJFTBrbvGL1PC0hi1XN0K5AWYQA3NCBGJB8=; b=zbDjX71xIbnlBJp6XnKA8LxiFu
	aZV6S6fZd6azQf36vNBnCYoHc3j0uMOdlIUMRQPhcB71Lzs6mJJptBrhd2Jjx5M6EvsohWiVk7oX4
	Tk3P1QI/OsThrYumcDXTVKcEwwIq89XzOW+NMiac2rIS2TeO4Br1qrzdEfIK+5DqrSCkQ5hNTb8ZJ
	QtTtfBo2srfJUe7iBXbUkT5kyuGerGwdp76DeJ/mC6mUMHZrFCnfBR6gIa+CG17p086LJSy1Wr49i
	McqAzc8MS2XgXExJroqkandvpiT6usJYEUygHME2M2C6clwdSuYFKs5kHgaDL+v3k9aJ94hs3+gXF
	fcr8uRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWJ4-00000002ulj-2wax;
	Wed, 24 Apr 2024 06:40:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWIz-00000002uiK-3Xmw
	for ath11k@lists.infradead.org;
	Wed, 24 Apr 2024 06:40:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O6X8ig026957;
	Wed, 24 Apr 2024 06:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=uLpixUn
	7RJFTBrbvGL1PC0hi1XN0K5AWYQA3NCBGJB8=; b=lAUFwekgMPrTyYVESSUV90y
	S6O7CbgCjn9FNNlAV658lSCLqi+jhGvtht2gIqv/Ey/21h7mliznKhALDbVOgVI8
	Y7l2K99ff5CWzYRRgG3e7opo63KsjuWgczqS4+TkGjmBcTX5gvHP6YJAcbbMyq0m
	jizLUKjjJPt8/i5qktMK8uWVTwDJahQ0bkppDzR3gdW6P22vaWcY0Z5jpEdOehve
	zuu+oQOVt2JYnHmwAhKpvXiBJ/oirl17Pvh9MVjbOPkHPnKRUQ4LzAtpDn4k1hV4
	kvu0JpwSTH6xIJYY0PQFljsyaW4li9Y3mAC5eiwpiSWmXAPrGsqIEZ2oPEKuy+Q=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9dg351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:40:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43O6eUDP011782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:40:30 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Apr 2024 23:40:28 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP
Date: Wed, 24 Apr 2024 14:40:19 +0800
Message-ID: <20240424064019.4847-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3oWTPK9R37IIWQc3oW3pMyjst5fJm6aC
X-Proofpoint-ORIG-GUID: 3oWTPK9R37IIWQc3oW3pMyjst5fJm6aC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_04,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404240028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_234034_032221_8F2419FC 
X-CRM114-Status: GOOD (  14.30  )
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

With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
ath11k fails to connect to 6 GHz AP.

This is because currently ath11k checks AP's power type in
ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
However with above commit power type is not available until ASSOC stage.
As a result power type check fails and therefore connection fails.

Fix this by moving power type check to ASSOC stage, also move regulatory
rules update there because it depends on power type.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 - add check on 'arvif->chanctx.def.chan' in ath11k_mac_op_sta_state()
   to avoid NULL pointer dereference.
 - add 'Fixes:' tag.

 drivers/net/wireless/ath/ath11k/mac.c | 38 ++++++++++++++++++---------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3202e36f9663..69ad38e0efe0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7988,8 +7988,6 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	int ret;
-	struct cur_regulatory_info *reg_info;
-	enum ieee80211_ap_reg_power power_type;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -8000,17 +7998,6 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	if (ath11k_wmi_supports_6ghz_cc_ext(ar) &&
 	    ctx->def.chan->band == NL80211_BAND_6GHZ &&
 	    arvif->vdev_type == WMI_VDEV_TYPE_STA) {
-		reg_info = &ab->reg_info_store[ar->pdev_idx];
-		power_type = vif->bss_conf.power_type;
-
-		ath11k_dbg(ab, ATH11K_DBG_MAC, "chanctx power type %d\n", power_type);
-
-		if (power_type == IEEE80211_REG_UNSET_AP) {
-			ret = -EINVAL;
-			goto out;
-		}
-
-		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
 		arvif->chanctx = *ctx;
 		ath11k_mac_parse_tx_pwr_env(ar, vif, ctx);
 	}
@@ -9626,6 +9613,8 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	enum ieee80211_ap_reg_power power_type;
+	struct cur_regulatory_info *reg_info;
 	struct ath11k_peer *peer;
 	int ret = 0;
 
@@ -9705,6 +9694,29 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				ath11k_warn(ar->ab, "Unable to authorize peer %pM vdev %d: %d\n",
 					    sta->addr, arvif->vdev_id, ret);
 		}
+
+		if (!ret &&
+		    ath11k_wmi_supports_6ghz_cc_ext(ar) &&
+		    arvif->vdev_type == WMI_VDEV_TYPE_STA &&
+		    arvif->chanctx.def.chan &&
+		    arvif->chanctx.def.chan->band == NL80211_BAND_6GHZ) {
+			reg_info = &ar->ab->reg_info_store[ar->pdev_idx];
+			power_type = vif->bss_conf.power_type;
+
+			if (power_type == IEEE80211_REG_UNSET_AP) {
+				ath11k_warn(ar->ab, "invalid power type %d\n",
+					    power_type);
+				ret = -EINVAL;
+			} else {
+				ret = ath11k_reg_handle_chan_list(ar->ab,
+								  reg_info,
+								  power_type);
+				if (ret)
+					ath11k_warn(ar->ab,
+						    "failed to handle chan list with power type %d\n",
+						    power_type);
+			}
+		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
 		spin_lock_bh(&ar->ab->base_lock);

base-commit: 1b61047b44218a00c7a7836eff4f8e037d5634d8
-- 
2.25.1


