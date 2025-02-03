Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CAEC02192
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDahZQj7Tg4JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=; b=Yel7wAZUvslB/D4P/M8+2ynRCA
	LYAPkpV/qa1hkUvn9T5pdaI8kvi2yGaza2BwD8vgXSmDQ97B/EwU975ef4D6Q+D3Q4HOkUEyZNk5d
	nsfxDec6K2InMJgaYvST2xy1fkHoOR5GNU2Es4ndHSINaXc7L7t0bdlc93BqE1zrEyi1h+cF7s8Dm
	RMFxoQ1370yD7sOnR+cQCv36Rv4Rh5BDStAnEqDsKRwtgtzDkXajkJ3VjYCnV2qmkWVSsuq+3YaMa
	timcLBtc/vCFpj90ydMdyxL3hFlCS55GLgZ4xOnOYRu8ZF5rDZCc6qm+JQaGz+lhfheGh6EVkLvCZ
	eGF3laeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FZ-0000000Ghqs-2owY;
	Mon, 03 Feb 2025 21:45:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FU-0000000GhkL-1OYv
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GFgHq012131
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDahZQj7Tg4
	JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=; b=Qc5fHFvbD4IzSjCyHMpT4Zb2KrY
	S/XjFG+R1ZbZXZWY/AKK/eKlOE+zurBGMKBoZcqumlFB4rKv/nrUCBkEXVOJCTwu
	D8zSXffjCPBQxbQjE50cbNUIh+1WbtD7ORiAM1b62GvyQGwNqFVif8JmdhxXDnrP
	KX/IdSWstsxqnmPigFLmSSM3L9+pTTJtuCkWe2S3/LlbAatTKWjTbUb7U9yqPPil
	LraUnDl7BYa0LMGazOeoOdta9plGRhgyoDNZWcRbhsXNxo8B8xFhI7/RqX4qwh/i
	yxrj4+BiKyAs9wdQ9zoUa6bR/HM0a3+8OYQC9EhWh0AUSyAjWEYru9h817w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159gpkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166e907b5eso88518765ad.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619094; x=1739223894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDahZQj7Tg4JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=;
        b=Ei9rg2k/Pg8elOFjJRnTIngIfbNryKB1Lap44DhBO1QIKacOZCXuMUvQind2sSZcwT
         MRmreI/5PVgp8+VfBx8IPsTUEjcg84J0xtSUBaauQf1Gd5l3smsdVkJXqJiJ2rYevnPy
         H5CW3wG87z0wAWLmqsSsu/MQ8vYKPRorVWdtgn56bhcFa9DD4IApP8zh7Csl/gONXfXi
         W4xtO32SzdrNq6B2/yANhRLAQ7wUfSTVWB8wGhEkiI7/E47CPGieo+DNEGO8uTK2OIoS
         +utxokpVJmMVEbm6ZU9QvRXMnHAMyV6OG/xsTupsEWrv0UAzhZ5YCxfI5HPm0wo1csjR
         yLLw==
X-Gm-Message-State: AOJu0Ywp/ElRdXz7SCPbIR97j3Dv6UkauXsiVhiJ2m44bK0rOfQt0CYs
	WK/yn1xBXp6vYRBRkGXyY0WXWZnk9SVUblA7dF15MV6CrwnUnYeIufTbJE+hQeD0lSpykOgNqAG
	4O2e4/IJ6r4W148IFFRerm7/HCzcaM+YPps6WoBlnQG993pcGkM18BO12DNgn/GcAsUSN
X-Gm-Gg: ASbGnctTMlCtGA5MLHB3FX/e/nmgzRsJJkBIvvrRXZ/QkUkLOujp8rm1mMS5M27POl6
	bCCMFUmMGZHbM6ZhvJIRz/TG7wuldtaikRzXPbItjw4WQelxtZA9elofsET6GwRWGHynEKP2ie6
	R4OWmeOl2C7wbF/huY0M7WoNW6aD/wp2gwSBfPJYY7KUvfwVwgQ6bZi7VGD5gDUTgJx6LHogYdr
	tnb5T6uEds4ExXTXAECSnUBTSTFHGlDV94JwrOkWYuiKtkLoFkYHonAbEXs/3aDldIwFB6NA1zl
	2hY51tcXCzh75jGfd2CPA8K3Iyk1KtDcXFtn7Zdw1Pzv//4cWm4vUZt85iCk
X-Received: by 2002:a17:903:247:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21dd7dd5339mr372681375ad.45.1738619094100;
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGigjZfzxDKHl/nhSzaApNAcEsschatItTybiToZ1tQxWCU7pGocBtA+MUgi/U6h/Pr0vkLbQ==
X-Received: by 2002:a17:903:247:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21dd7dd5339mr372681155ad.45.1738619093749;
        Mon, 03 Feb 2025 13:44:53 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:53 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon,  3 Feb 2025 13:44:47 -0800
Message-Id: <20250203214448.1978156-5-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bgHj8qFFuIjZcfOF8dI0KlssFe2b-fVJ
X-Proofpoint-ORIG-GUID: bgHj8qFFuIjZcfOF8dI0KlssFe2b-fVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134456_490407_E871C6F2 
X-CRM114-Status: GOOD (  13.31  )
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

Add new input parameter to ath12k_mac_setup_bcn_tmpl_ema() for
'tx_arvif' as the caller ath12k_mac_setup_bcn_tmpl() already
stores it locally. Avoid duplicate retrieval.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index efd155031feb..90823b85b714 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1642,13 +1642,13 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 	}
 }
 
-static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
+static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
+					 struct ath12k_link_vif *tx_arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
-	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
@@ -1661,7 +1661,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1731,7 +1730,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


