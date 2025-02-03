Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8995C0219D
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW6HwO/qyQ8ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=; b=t82faRUftyp95JE399qxq4alpZ
	ph4U5kXFWd1Tw9k+aWUPyLrCdPbk7Oaz5yhwxbkZdiYLc+CFSCfw6/ZPl2Ev/82Fb9IlPI/UbH0fQ
	w4M7y17EMbynCP1CEOd7MJ18sXBeF41rDjMtrHbO3q8i4QcwdZ8nQYhhl1X5zDouMn+W8cwWJlNq9
	W2zu9f1+hkKhkWNjbftAsoATfC8Imu/ZmP/f9Jb9pBTIosJSQlzEt0qpifpzTPjqUn3ZL/SQMXrst
	99opJ1DbusucKd1kqtCIIpidmXdHq5ntGGe/dixj3u+TROJP4VH937PrUpmYVy5o53zPbkzNrrxv1
	KPKlpn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fa-0000000GhrZ-1qnv;
	Mon, 03 Feb 2025 21:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FV-0000000GhlH-27Q7
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IaUoF008480
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jW6HwO/qyQ8
	ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=; b=Y5DEUB5wxzU/ErLzIpcWu03BLp0
	+BGR2FhT7SYgex4bcSADug7Wm1iSjs0C1tGD6oH/ozx4AyP30PhWLaTm/6ky+5WC
	cL47sPJxSAnZuayo6873UPjJZqwVvquQbuSpPkfp5LMw8uVEZkP+4FkAvQTsEkyo
	7cYcsNL+OPtlCAUzdlY8se0AR+QRm0D3RrL/v2RH7mREkbMG9TeR4P0JkP0+Gn78
	gyp1/GAa6VAxCTAC3WmF5UUqb3tDba27xJxSAiSLk1Gv9YlRE4VPaDdGjDKOqjun
	/utwRy8HmHhXRYiX3LHaBnUFy0HCFrjD6vFirJDYxnZAAOl+YkghmP3gYmQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k37u0c67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2efc3292021so13645413a91.1
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619095; x=1739223895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW6HwO/qyQ8ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=;
        b=QNMP2qbWo02NByciQVWr5XciSfq+I0Hb7L56PIzg7hM0ZaWYGZrCaijs+MWNS+RcDG
         teD65mgvUWzgZBZEZ/4gFIMZMHWKr28AeuBCiel0v8mPTeNp+fHz7Ifa9P47t9IpGmiG
         QFyMiHQgLkPywRvhwR//nt1kexCoxAU/9G8lzZPRU90+TcOmGUH92S/2loigMTnQrRn/
         FB49BJ6pt4OdE1J68Xj7z1VTnVInqftqMGZW1SxkMYX8u3yMPRwy1KsKf+ILuVcfdAbb
         EaJqgQK6uvl6W9DBtoUcmuRSHIC7kk/hxADXQQJfhKgu/ynEgkaQLkGEnVWzsbLoEyQd
         9lIg==
X-Gm-Message-State: AOJu0YxvICqjI5bI5q1mOujvR97D7Bk95m+yB+xE2ABkR66wVAcUNLOI
	cIQWcIOApgWCcclPHKihJmPjwfSUtKUJtdKjUPCyb1Oh/NDl1DY6vGZAmlBZVdmgW6oHa2tVZ1x
	+PuXBTRxr6l/Dyffms88OGi6GsyCw0z0CJHXs+h0xvSuDFkIEUSj85bNuUI1J1BmNGtP1
X-Gm-Gg: ASbGncsVoY+H8MvieS2GuMi5cuePfPhPLYVjvfEu1T1VngeMbwug2wGnpOtlbYW3+2L
	tTknHWfRXRHGgA/aUzFAXiVct9YLJiJWrCcg+U2ZBdITyJQkLQCNVlvlsMtETbd3qdZoAhswtaT
	EvEJcBWGGSqS3dwYcZ8ikJNI4xGxX5jnWOpL+pxa27tmZsQBDylxXRrMy3fKeYlWD1YernktifL
	8R/QF/xJzMFnZFbxi8SiNToPcE7gCCmpVxUVHeqOEOacIgoZWrrycx0RJP9KYvBswd+Imqivh56
	ONgCfmMm1z+vWzYbvTQ0iFHKnQGJJeKZv9GqlHcCrY3zA9dFllPnOCfEN59E
X-Received: by 2002:a17:90b:53c4:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr36001577a91.9.1738619095126;
        Mon, 03 Feb 2025 13:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwJd39vaZmazZzFpg8uh7/VVetZSQp/x673t3NGMiSgjrhKf3+jKS8K40tSAFiD6P8umYlEw==
X-Received: by 2002:a17:90b:53c4:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr36001555a91.9.1738619094789;
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 5/5] wifi: ath12k: pass BSSID index as input for EMA
Date: Mon,  3 Feb 2025 13:44:48 -0800
Message-Id: <20250203214448.1978156-6-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JCcfCsCOqo59VrAZDqywMd8PvEka94gs
X-Proofpoint-GUID: JCcfCsCOqo59VrAZDqywMd8PvEka94gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134457_677167_78202D60 
X-CRM114-Status: GOOD (  15.46  )
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

Function ath12k_mac_setup_bcn_tmpl_ema() retrieves 'bss_conf'
only to get BSSID index which is an overhead because the
caller ath12k_mac_setup_bcn_tmpl() has already stored this
locally. Pass the index as an input instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 90823b85b714..5ec82c881b3e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1643,24 +1643,15 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 }
 
 static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
-					 struct ath12k_link_vif *tx_arvif)
+					 struct ath12k_link_vif *tx_arvif,
+					 u8 bssid_index)
 {
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
 
-	bss_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!bss_conf) {
-		ath12k_warn(arvif->ar->ab,
-			    "failed to get link bss conf to update bcn tmpl for vif %pM link %u\n",
-			    ahvif->vif->addr, arvif->link_id);
-		return -ENOLINK;
-	}
-
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1676,7 +1667,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	for (i = 0; i < beacons->cnt; i++) {
 		if (tx_arvif != arvif && !nontx_profile_found)
 			ath12k_mac_set_arvif_ies(arvif, beacons->bcn[i].skb,
-						 bss_conf->bssid_index,
+						 bssid_index,
 						 &nontx_profile_found);
 
 		ema_args.bcn_cnt = beacons->cnt;
@@ -1695,7 +1686,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	if (tx_arvif != arvif && !nontx_profile_found)
 		ath12k_warn(arvif->ar->ab,
 			    "nontransmitted bssid index %u not found in beacon template\n",
-			    bss_conf->bssid_index);
+			    bssid_index);
 
 	ieee80211_beacon_free_ema_list(beacons);
 	return ret;
@@ -1730,7 +1721,8 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif,
+							     link_conf->bssid_index);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


