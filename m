Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF16C02198
	for <ath11k@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAbeSvzzDSRfK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=; b=QN724i62+aeBVtCw5Vqj82eNDS
	9j7yQ8yRZG//Ve2cQh8wh1TZLP2IwYMhtq2yNZnkkbLT504K4qZ38vkxeCluqtD6s+ZHwyqD5+DjI
	UNwCXDPlg45SCP+astx46Vo74n3hr5PKoAWrzZxyyWzpjhI0PRFBYdvujTczq49tGKbFK8AXD16n5
	vn0jSEJV5KIvaE/1CJDLI8jbpCOA7YkWN7/jVCQfDCN/IB86d4bwdgil35DEzIR7jdiZXq/suGHY5
	+cl4Xhl5BWO28r+GsGdaN90YL0xZckn2+SPRY3//qSQ/NM/vGGZq1tql8Ev4SpQcGczB4n4cFlfOO
	sGuNL+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfq-00000000xIv-3832;
	Mon, 10 Feb 2025 18:38:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVB-00000000v46-1Axh
	for ath11k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HmHw001454
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fAbeSvzzDSR
	fK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=; b=dP1oZgKAZtmQiVKlHICG2oUIMXp
	WRX97QuVLKEujuszqVVLSnLdlGcTq+IBmvaCIHFnhvQqdnnjabp8IOX8/EtcFwis
	NsJQX5iOr4TFPLqQmrk53kHzLm6vI6NijI3VDY0IOR13t6TOg9c8YPXglCKV5tLO
	vD39FZxejQiXwpEHwEFudFmjnkc6d5cIKijpqzs5CFFqfrdht+5jFrPUe5qvVhLJ
	fO1dcbEoR3TEaDWARctqODix+WKpcnfks6vua1Yt9f+50lBRBXTFoaqz/JtjUWEf
	h9AS60rCHAm/iFZWSYe93+F0qlIi5FdTXCJh/gX9pjfYj7kZ0zJKS8c1pyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxhf2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa57c42965so4061115a91.1
        for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212043; x=1739816843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAbeSvzzDSRfK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=;
        b=SbQcKFI5xbKXzzaGlvIYX/fXcCw4yPzueToiOBWPp7ChioMVPvm7PzyBGBDSwqPL+S
         r4t9zmrljmVa5qgDbiw24+yTqLy4p6A15Xj5gWkOmlMO+cMkpCBW9EuavkBqtowXEeSJ
         nPTilGiShSYkZAr1tA1PHejQ1AMQhfPGVYdNyBoW5hAK2z2rXaI2M3zUuuFv7JvYvYZm
         FcfneByizEihaS1xzIq5dayYdUxR2QHVIEVCeJI4nl+1fdBAqXEShjXkwJk3/7eaqxvz
         xatQJL99WKjIn2ND+1ZE6F9KX1tApoQmqT6LSYtDC4Xt1Gk2EhhKaPtFAmOQ3clV+5Oe
         SSVg==
X-Gm-Message-State: AOJu0YxRIjVRiL8oiRb/PL0Lj+RDQjv1ILcOvuexum6jMOouuTa9If3O
	m0sZ2E6d/K3Xnkqww5YxYDYlZaJNU5SlKpE2/lhGi5WQsHJa6DRxd96sFWgzqHCp4fwf9a6n7ET
	IQrLexyU8143M6NQdcN58KhbKThbFpY/VllS+I8cCC7MPQUq51lU5c/hO/YONgFXBPOhQ
X-Gm-Gg: ASbGncv7QXmHWkG6io6PRRK2Sm/NF1aSJOjirxVRxVr3qr+ONNXsQ9VgvlNto21urKH
	bUtZKxj9Wags5qVoWpsZSQSTr7hZc7jr+9TxGm9r71Ho41oIiojSPIAgfUY/WMevWI8PyY/7Kle
	AY//SJ5HCnUd6Liv35d/XVn3NHX9rcH3l10qIOeqBKEQXVQYVdPUJu4+LQ+mPUIcw60rE7Aym0q
	3S7KshXEPD6ozDIVxkiOg7UYBjEUDgEqUYNjQThpOOv0yk5/l/HT9/Yl4c9n/WrHqEq2FXawNxd
	ALeDw7qcqL+rGUpg++Ix1107oRUENxwOA04Pq8jKwhW3iskQgZplD3zITSj5
X-Received: by 2002:a05:6a00:f07:b0:730:8e2c:e53b with SMTP id d2e1a72fcca58-7308e2cff04mr7494887b3a.5.1739212042823;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl6HApPA5o/SXwLPe8SFpai7AOw0KUzZ5vMElwGSGjqDBkSWO7oTOcmETRxasiZPyDWmGWUQ==
X-Received: by 2002:a05:6a00:f07:b0:730:8e2c:e53b with SMTP id d2e1a72fcca58-7308e2cff04mr7494841b3a.5.1739212042353;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon, 10 Feb 2025 10:27:15 -0800
Message-Id: <20250210182718.408891-3-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _AwJn0L9Bo6sVYQOsUTTyDKqWBcrZXSN
X-Proofpoint-ORIG-GUID: _AwJn0L9Bo6sVYQOsUTTyDKqWBcrZXSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102725_463443_CF9E06D2 
X-CRM114-Status: GOOD (  17.89  )
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

Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
the same pointer. Instead store the pointer and pass it to the
latter two functions. Compile tested only.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 466a314b938b..97816916abac 100644
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
-	struct ath11k_vif *tx_arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-	if (tx_arvif && tx_arvif != arvif) {
+	if (tx_arvif != arvif) {
 		ar = tx_arvif->ar;
 		ab = ar->ab;
 		hw = ar->hw;
 		vif = tx_arvif->vif;
-	} else {
-		tx_arvif = arvif;
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


