Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5021EC02183
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtwpAc6bTYOZp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=; b=PTmu5XK1LV3n1xxEKkdjxZ2GDE
	JRxppphMxslWNjqPmyezh5ZM3wxDtFxdQwYZvi3U6e0xfD/StrIrQGG6zjGdknqCueXUmrzSUDfUM
	gLLuBT0SLi3hFjQ/n2C3uitanhM2qlLpwqlK+fqQ+BrgkY0tW6mxqiakYBcskH8Az56cyB/mzuxVw
	ZtJT8H12iGJ0TcGWe68diDA8f/kDkLVV6GOwu4RYu4z7Czew+Paw3IVObO1JUZ89c5qKFlcPPbdJT
	S6n+cPaOURiDnCv119+cwZbUz0SAY2dSBwhfHuTHAXGqUAolplgZ0f+3XCls3TCC9PaqIwJYZVGRS
	zGbAHCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNm6-00000003QMq-0yC2;
	Sun, 19 Jan 2025 05:23:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNly-00000003QJt-2D46
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J5KgWY027697
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZtwpAc6bTYO
	Zp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=; b=oImtoWZbx2aaHYXVfYmKDe+mh1F
	fs0UTXyhmpUxdCk+T1F6mBLKFmF6iOMyTKUmOuayAhV3X38eTTiGvLqNkwo9LDPG
	Qh8hkTaZHGwPn4438MKCmAr/yJcaf/4PdHN7ae611rG23usgRD30i9wu5YP3vdwA
	B50gNauxKByw9nW9hVJw6+lgw2b+FDjY8fkWWPAlre8iEm0Ge3B5gl6cVr6DEIcQ
	h5N5AI4NIqBzWQnCmiEATwE3+99j3ymlW/VpnoUhan3DpT3git2chquEWcHMBApt
	2sEZEjpI7CxYbmFM2DgSZZ/wrcaopCQLCC9gTaw3vy9clbTVYMhfBTfG4MQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4484h19juv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so9864465a91.0
        for <ath11k@lists.infradead.org>; Sat, 18 Jan 2025 21:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264177; x=1737868977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtwpAc6bTYOZp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=;
        b=E2j+xkcl/wYc3UlKCeUQ5fXWSMiMoWeStc3vWvO4z1gYauPu0lLWIXe8UXesSWLmLG
         4dA3JTgtOtjKU+jFn4avPvpCffoQtUVRV8J6Fod0m4Yn09QJMfWROh4h9vZQFCpd9f7I
         idbGmROAmVD+mjL9vTxyjgg7DhaRe5ohqTTnY2XXLtVThMKHvwLsnb06VQNRXuw2TrPj
         LxPH2l3AxZQ2y9g2GXpNx1UFBQTxfUzyXAEP9+dRzWdNEOWPR7RlX3/JoXyNMpuUWQ9N
         QfbiZNeT+rVALnxsItjeiRiZo5C4UPG2gMx5PC1yZnD52kZ3sDY1gK7xqUqIn34bdDls
         KfnA==
X-Gm-Message-State: AOJu0YyRnXgns3YcjpHF4s7IJx/IZ5AG58B48eCJ/WUWLiYISR9/r419
	wAluaBCT57I1z5d4F3TLPikldRLQyip7KEhvHuUG2bAiieRj5qIrEQhuR4+mfc81TluF4vcSq1q
	qhG/GSEE0oK8gkVku/tgzLjTGdnHLOKWFPSe5MzP4wsEhKVwMPIgFHbaRhllSWd+AVfDX
X-Gm-Gg: ASbGncuhGw5pZsrH01QW2aKZTjkKQscvhN8jHpGg91m8qj8EWrfNoXlH1nIU9AyMsRp
	vfM2x37Gfzk1uvslXBFGWbPP2brz8Ev5QlIwMKrjihxUYk7XniswytPOK9kvOlTFu2gr2+5C4rF
	5BEoA61hADlkQPR9z+Q08mNzvbVcx+reeZXpY51t7WuYDWrqD7Ulu3//6sY0ceby+JyOXpaFW02
	kUj5/7cWoHkdkBbchMDXpAO6ZpZq6OQvAVYYmDMv/8KmhblLSsjD2hTwhKMrjkD4pizxYiIkEyQ
	MXFwW8Jvz7JGaRXhJukmVr15J5uIDyO6z6O5RPiw9YiD8K7eWg==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr13280280a91.15.1737264176974;
        Sat, 18 Jan 2025 21:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SYzua+L9zOXH7ZMjBP2BXe/Zm+CgoCUSMQWNJge1vtZEYocFxke10dX6xubn0KCvA3fnFw==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr13280265a91.15.1737264176605;
        Sat, 18 Jan 2025 21:22:56 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:55 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
Date: Sat, 18 Jan 2025 21:22:47 -0800
Message-Id: <20250119052250.3488343-3-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I9ME9a1Fgdwa7tDpzPuwsraZS--t_Z-7
X-Proofpoint-GUID: I9ME9a1Fgdwa7tDpzPuwsraZS--t_Z-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212300_930392_D27770BE 
X-CRM114-Status: GOOD (  17.76  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
the same pointer. Instead store the pointer and pass it to the
latter two functions.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b1a79d8f980e..67f733aac759 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1537,17 +1537,15 @@ static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
 	return NULL;
 }
 
-static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
+static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
+					 struct ath11k_vif *tx_arvif)
 {
-	struct ath11k_vif *tx_arvif;
 	struct ieee80211_ema_beacons *beacons;
 	int ret = 0;
 	bool nontx_vif_params_set = false;
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
 	if (!beacons || !beacons->cnt) {
@@ -1593,25 +1591,22 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	return ret;
 }
 
-static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
+static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
+					    struct ath11k_vif *tx_arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *tx_arvif = arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-		if (tx_arvif != arvif) {
-			ar = tx_arvif->ar;
-			ab = ar->ab;
-			hw = ar->hw;
-			vif = tx_arvif->vif;
-		}
+	if (tx_arvif != arvif) {
+		ar = tx_arvif->ar;
+		ab = ar->ab;
+		hw = ar->hw;
+		vif = tx_arvif->vif;
 	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
@@ -1640,6 +1635,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->vif;
+	struct ath11k_vif *tx_arvif;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
 		return 0;
@@ -1647,14 +1643,18 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	/* Target does not expect beacon templates for the already up
 	 * non-transmitting interfaces, and results in a crash if sent.
 	 */
-	if (vif->mbssid_tx_vif &&
-	    arvif != ath11k_vif_to_arvif(vif->mbssid_tx_vif) && arvif->is_up)
-		return 0;
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
+		if (arvif != tx_arvif && arvif->is_up)
+			return 0;
 
-	if (vif->bss_conf.ema_ap && vif->mbssid_tx_vif)
-		return ath11k_mac_setup_bcn_tmpl_ema(arvif);
+		if (vif->bss_conf.ema_ap)
+			return ath11k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
+	} else {
+		tx_arvif = arvif;
+	}
 
-	return ath11k_mac_setup_bcn_tmpl_mbssid(arvif);
+	return ath11k_mac_setup_bcn_tmpl_mbssid(arvif, tx_arvif);
 }
 
 void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif)
-- 
2.34.1


