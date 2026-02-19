Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246AE9A05F
	for <ath11k@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=X6BtzNqCV0zsIhT39UiWtdUy1b
	k5VTNr0dk9xuCfRAiZs9Gmm/SDXDO/9r2sKO+4E6loq4/LQL2lW2Z3FceRmZkdyLM/MrEVAfnaR3X
	sTynnV/KgZ93kTcNycSpjDY6p+s7V50kvoa/LP8rrHK0U4E1pWvkTSOiM33UXTpHY1ro8tWlDgtRD
	p6Ykai1BvBsMmRCJLvhkGV3Jg56EcusVx0NyLybF4cY6yJ5I+g8gJvjWW216rpRooTl7dGEsBUBmb
	KokjPsdQoXPsdKAzjSeMEmf7LqI/XtEJSL+XtfLTYiOrVSPEVhinrci84MS1S3r9xsiu81POhN3k8
	n0I8y9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vY-0000000BrkC-0v27;
	Thu, 19 Feb 2026 19:43:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vU-0000000Brei-1Hhy
	for ath11k@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBMIKO3564470
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 19:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=P49TaiinQnf3Zapr
	kl0aQrMx7MQCzXDWhzNBGjFa4GzzO/I4lQvuwv3gn7t/7dpgnEnkeel3bzzDzUg4
	pLJSxmJrd4JCG/HxHovQxHBl3sphHqMcvXyngw+pFxISyHvk5VEqmmRJewTGRgHc
	VLqDrcUcqo68tT0NYr26VQc1dR/U0X0HKfIbTO6hXpj/Ikr/Os1OuMpojd8N6Yr9
	0AkfS0F3ztsEz43MAlkJ0hwqQXloESXfWNiiOe8YFnGejoSCV4D+6I0b+oNlTebv
	igMzu5rkmODUW1b+cOLY66Yw7bCZje5NqJfSsxF+iS0O0fvo8v68jFu4m/ADArv1
	Qnn0tw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k81hyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 19:43:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ab0b2e804cso15446905ad.3
        for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530182; x=1772134982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=a7AQtAknyzkzENFn/A81UdjTP6y3BaMlJePmve1HlGO7u9BJk5iS0+l2IztbhYyVHw
         MO0ACMHlJoYIbJWgeZIdwrjGb3gsNh/2yGCDmC++t5U5bpQj6zh4mtOe9DSPfn3KtjqP
         fQ+eRBLzdfTKQ9CA4qPX56H4rvE3f5dI2CH1F5KL+7SlK0X4684ubBEuw/S8cBJqykbL
         x82soj7WGv4SeA7l4ZPJ/Js4rthBPG5DlzUen6fwXJNeYDZRFVSr/41qNBxj7fkq3pv4
         9dWhSp/37S9hM5eQHQMeyCQVCNKQKqFkrc1Tm3l/v7y/gvICbfplUhWaq8qeHvPiiZyT
         GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530182; x=1772134982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=AGDON+fXf7/76sn1Ot021vx1fJYOxlr27xiWUNZJYs4Q4NxCphiEddEs7wKvlQ8A1h
         AEWHE6sPAD3e3iu/3eeCzEl+ULWaD/p62DiJR9/uy9xyL0VioqP5TANzYtCgHuPno1kC
         DFRTIiFnjVQoENGKb9Lg2wiWEppn/fuyieNif6PVNOr58ANFDcFLzW7TnubkltWxNZZt
         LV8ZCvfT6Q+tL4mdDXoHGv2iEWjmC5fWy3to6q3Ke2AXQq+/jtJ3pVpFw3O59pmP6IYK
         E9KU0/BkSx/x1csqltWKVhrDjmwhchTR4yokcu1aYwp55rXuS8UJFCRb536VLJwo9hqi
         rOmA==
X-Forwarded-Encrypted: i=1; AJvYcCXuC4z9+AQq3r7tb06NJ0VBcv79prjAX0j9O0lOozlE/gZ+fxkggLBTBBYEct8DC8vdjYv1P7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhDGlZRKE03O17wvhaahOtrc9vWkrmb34PaK9Bopm7OOWaFeEx
	glvxcCA4bcz5sbXRHyMCxFZHFxm4LdNt+oHHGRChYMqzmJ/MJjvkl9TV+S0fj9kgoPXlTDzFtCX
	nM0Hv+w8CdenpN8PwOI+JqyAs+S17QN8UuQUsb95PGTOuKnfIVmair5XevE0VR08+
X-Gm-Gg: AZuq6aIPxpf2DzYzpo+SYH/L0p85b9Pgi0qtbcDNfw901ki6zDmtUMvvzySuiXlC1MU
	PyaNKDhG/AEpcP+Y5mWPBZ0rtFfYWJRHo7YNbdEoweo1y8nTrGzpI2xh7tOTne/TpwvbuddT0nN
	YraX6esKRWt9XD3zjmKe4QyxBhWonNpoSmb59JxqlIzymNs1kxCKZ4SMJcdvN/kiNFrJ1tP7vwj
	qpuAsdlr7kpConXbA3+Ti1ps+EJTXqau+CVLQD/Uyu9VVFk+D7LkgJQcEhtxnp1wdN3S5rFIHoW
	AjrDTj/2D36uc7KDDBR5fM12lcgnGL/QzAQn11wXQUh+TGtGtKC32v4f0h8z/HsYeRpP3HwHAiE
	omBkiSvqcDv0unB0stcYGHWurr9lFG/FBVB4AlT5Zmzh+CchGvccuEtSHYoo2tP4WaRsMGcVS17
	UGpg9lqCiYlR2GUnGNcCMD6QnlUUTgqClfqAv+tNY=
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071625ad.44.1771530182050;
        Thu, 19 Feb 2026 11:43:02 -0800 (PST)
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071375ad.44.1771530181608;
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a712ed9sm264404225ad.20.2026.02.19.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 01:12:42 +0530
Subject: [PATCH wireless-next 2/2] wifi: mac80211: fetch unsolicited probe
 response template by link ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-fils-prob-by-link-v1-2-a2746a853f75@oss.qualcomm.com>
References: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
In-Reply-To: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: jCNzmFzpGnw43CdW8LUIadFkW0YTQwiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX36NO+Wf11jSJ
 /Xsk4xmF3ozwjp4EemTXdhHyQI1YfTlp+Lt7HRDxqTrYzXNqiDfnCWl9/wK//58ZdPZBCXMdRmC
 zV7p37EPl/5HLtWMs1xpUKDy2mfWk0EPRHeoQzohCESxF3+YMwLKcl9O0Xq2kurkLS3bFl2x/xu
 fvbTHXFNjGa4j2x/odDf09e4m+6/OQkeCIYcrmSDAcun7R17uS8u+0ihyVHS6FJv01OZg71J+QE
 6XnF9oB4vNqCUW6cnoMktBw4s/ONbCOL0CDJxAWrrrU1E3tliWVzYG/KDm/fMFtIe1WYN3T2CM6
 OJMN48uq8G4XByaxeFA73oC3e9MVUsFUtt6HNGWV+9itzPpIICpdAyE0lRsQqO13G83GMqREdVG
 Qzkjly+1oGdtkUw+dEBEwOTDGsus60CKKn+bKQ9l+w4mBGmmjRBMBZGKtqe3CGxNamMaNYhxJMG
 xtMOsBo5nM5U8eeXpBw==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=699767c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVayKBx9Dmlhv4CN5F0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jCNzmFzpGnw43CdW8LUIadFkW0YTQwiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114304_825679_C97C6F3C 
X-CRM114-Status: GOOD (  20.25  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently, the unsolicited probe response template is always fetched from
the default link of a virtual interface in both Multi-Link Operation (MLO)
and non-MLO cases. However, in the MLO case there is a need to fetch the
unsolicited probe response template from a specific link instead of the
default link.

Hence, add support for fetching the unsolicited probe response template
based on the link ID from the corresponding link data.

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c           |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c           |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  3 ++-
 include/net/mac80211.h                          |  4 +++-
 net/mac80211/tx.c                               | 20 +++++++++++++-------
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4776bb6fc889..d9b5eac6c7bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3314,7 +3314,7 @@ static int ath11k_mac_fils_discovery(struct ath11k_vif *arvif,
 		interval = info->unsol_bcast_probe_resp_interval;
 
 		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(ar->hw,
-								 arvif->vif);
+								 arvif->vif, 0);
 		if (tmpl)
 			ret = ath11k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 34f82cda4197..b281f81039fb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4320,7 +4320,8 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 		unsol_bcast_probe_resp_enabled = 1;
 		interval = info->unsol_bcast_probe_resp_interval;
 
-		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								 info->link_id);
 		if (tmpl)
 			ret = ath12k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 83ce06857a1e..2d2f34aa465d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1981,7 +1981,7 @@ mt7915_mcu_add_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   vif->bss_conf.unsol_bcast_probe_resp_interval) {
 		interval = vif->bss_conf.unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif, 0);
 	}
 
 	if (!skb) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 795a294fa904..c3cb4a33cb3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2868,7 +2868,8 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   link_conf->unsol_bcast_probe_resp_interval) {
 		interval = link_conf->unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								link_conf->link_id);
 	}
 
 	if (!skb) {
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d36c14a86c8a..89027e94ba5c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -7781,6 +7781,7 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  *	probe response template.
  * @hw: pointer obtained from ieee80211_alloc_hw().
  * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ * @link_id: valid link_id during MLO or 0 for non-MLO.
  *
  * The driver is responsible for freeing the returned skb.
  *
@@ -7788,7 +7789,8 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  */
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif);
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id);
 
 /**
  * ieee80211_obss_color_collision_notify - notify userland about a BSS color
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index f547cfb27666..9f2363a34511 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -5874,21 +5874,28 @@ EXPORT_SYMBOL(ieee80211_get_fils_discovery_tmpl);
 
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif)
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id)
 {
 	struct sk_buff *skb = NULL;
 	struct unsol_bcast_probe_resp_data *tmpl = NULL;
 	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+	struct ieee80211_link_data *link;
 
 	if (sdata->vif.type != NL80211_IFTYPE_AP)
 		return NULL;
 
-	rcu_read_lock();
-	tmpl = rcu_dereference(sdata->deflink.u.ap.unsol_bcast_probe_resp);
-	if (!tmpl) {
-		rcu_read_unlock();
+	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
+		return NULL;
+
+	guard(rcu)();
+	link = rcu_dereference(sdata->link[link_id]);
+	if (!link)
+		return NULL;
+
+	tmpl = rcu_dereference(link->u.ap.unsol_bcast_probe_resp);
+	if (!tmpl)
 		return NULL;
-	}
 
 	skb = dev_alloc_skb(sdata->local->hw.extra_tx_headroom + tmpl->len);
 	if (skb) {
@@ -5896,7 +5903,6 @@ ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
 		skb_put_data(skb, tmpl->data, tmpl->len);
 	}
 
-	rcu_read_unlock();
 	return skb;
 }
 EXPORT_SYMBOL(ieee80211_get_unsol_bcast_probe_resp_tmpl);

-- 
2.34.1


