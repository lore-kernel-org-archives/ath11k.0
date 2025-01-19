Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CCC02188
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWF2AYasCMg5uCMhaNoiBso1sId8vJR61mxzZj14q9M=; b=yWhrDEIiO/epFnZE6/mqyKAV7g
	4jQuiiWOLO/HagngT7IClVDYKAydBRurHAn9wp2G5rAcfjZ85VulIthPAAp7DWQfP1JEgcuhGKVxn
	f4pH646mszpwwksVLHUcHMVbIZLyiQw6rxBgkZdQs6PqRIQNHXfGeldjzTYOAoA1txcIGKxlIPefC
	FdnBR0oAyHv3kScWq8rTv7vRsu2VU008ry/Fr37xTgKxLrXVrTF4Getfl73hIEGy0cVE8M1mb0jT4
	LCoO8aUlJs+kCrdz6LGww1jic0bas5kG3BZIaA24t1TkbBXhX4/kDjrYpoKdKDuCNwWx+HzJk7La6
	r8iLRdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmg-00000003QTi-0foX;
	Sun, 19 Jan 2025 05:23:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNm3-00000003QLu-3tvS
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J4e2t2031842
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bWF2AYasCMg
	5uCMhaNoiBso1sId8vJR61mxzZj14q9M=; b=UYUuPU9Q3OofOf9goAdh2P9CoAz
	uZFsEGS2pXWC22tfMDg/HDLjj4+iLS5bVCmU76w8PZDazM8XJjsgb56wH3BgeMQi
	kuJfCloOxeh48Ixjj54SfocvIu4r+xNNEpYwV5CAvmCMKM7tPZ019wlw8hvuKZzA
	F1A3Fi0sfn9TVCHbt0ZQSw1gkOYOYpSpkp47j1JMHGkIIXLgIwzGCpxh8EwrnP2E
	+oJiUlOcNlYC36h+4CggBKUg2JFKKrpZ3c/1UIlwfFA9w/lRKEot2noaR0tQFKjI
	0YC8m1huvlfQku21M3wQHhYa9rrd80HDQnWkwUWWgcvTRaqyEyKqsvdD4xA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44838qsnvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so6380994a91.0
        for <ath11k@lists.infradead.org>; Sat, 18 Jan 2025 21:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264182; x=1737868982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWF2AYasCMg5uCMhaNoiBso1sId8vJR61mxzZj14q9M=;
        b=Esl3qhCmzf27Dq6qINglmAf/7zUQyV2WF/3waH2PT8S4naNm9WS3l0jTs1nJTQuQaE
         OffgrLtn9IqKzvfESV1tYnjm0vBPIN1Zj6wfWtFnb3kVgqv6dbx/Jv5jpOydT9IjOXg+
         jeXCaxgDRMwASSNJO0nfeMWjQMceTnPrmspeKwqm4STvD27OyhABtS8/hFguKy1/O9ry
         rwnZ5Z/4GwY+NHOE0MYyFrzXVmMIO+5j23OSZbZ73CKSllsk9m2pnZfqCrocHacIspPQ
         krtorTFnHFyKtsz2K7l9XRqprLEfWP9cLAXI4FuXvQyHcgA8IisEht7dq1STo1uGOsj6
         x7Qw==
X-Gm-Message-State: AOJu0YwlET8WHeg028xJ31jWM2bSplNYotr+5hPqReBLnVC2+H0GmgD1
	qpLKOa26ISjhL1v8qcDU/IFWwAqCaIuZfH55zzXxqtSg22CBvLweHUV4+TQOFv13lVme5WnB15c
	9NWOuIaiPPOjkhrJWc4b2BwGoM/HIxAm7i2bvKUQbEU/s1Z5eUGy6fVBuNsdesqiIse0z
X-Gm-Gg: ASbGncsHHBvWdk/1bVORpw2sTzvt1yZ7JLxjd24h/cIHFTR7f5wat79/MH+gK13/cFd
	cWF8vvYzBezPHIDzE8gHA75VPvQM+Iw/wjzjI9M9XwqueaI6Dqtur+UPnBp8xi0FqWvTSqADTf3
	ohgmdMU0Xh4QZIKK6ysutzMxh5fTKo36t5kSmzjuUX9d8oMooDccOc43msbb+gRjEQhX3ymSqFF
	0ZPt83/FXJ1pBs5VA9Jxsvy7aUMplk0Qb1NOksaJWSTCWcuy42WU3ESf8QKcZkNGNI+TzUxU2tG
	NthaqPssxOLA8qIZoZuatCwKkNUl77LtUw1x8Va8KLSdeF1RIw==
X-Received: by 2002:a17:90b:3d47:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f782c9cb29mr12805280a91.15.1737264181694;
        Sat, 18 Jan 2025 21:23:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF46jJvNdu6YUYpU2g2VsKnzXDiiDvWlUcaQ9i4OcqEH1lgmDFUeIsxaU2CLgHGUCdIzvTh5A==
X-Received: by 2002:a17:90b:3d47:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f782c9cb29mr12805259a91.15.1737264181270;
        Sat, 18 Jan 2025 21:23:01 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:23:00 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 5/5] wifi: ath12k: pass BSSID index as input for EMA
Date: Sat, 18 Jan 2025 21:22:50 -0800
Message-Id: <20250119052250.3488343-6-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pzi2x_KhkDTsQ6lJfjh7y-6bHcfMMDmB
X-Proofpoint-GUID: Pzi2x_KhkDTsQ6lJfjh7y-6bHcfMMDmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212304_054198_7AA86F84 
X-CRM114-Status: GOOD (  14.85  )
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
index 8a856cc1d801..05a0a6f0dc9b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1563,24 +1563,15 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
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
@@ -1596,7 +1587,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	for (i = 0; i < beacons->cnt; i++) {
 		if (tx_arvif != arvif && !nontx_profile_found)
 			ath12k_mac_set_arvif_ies(arvif, beacons->bcn[i].skb,
-						 bss_conf->bssid_index,
+						 bssid_index,
 						 &nontx_profile_found);
 
 		ema_args.bcn_cnt = beacons->cnt;
@@ -1615,7 +1606,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	if (tx_arvif != arvif && !nontx_profile_found)
 		ath12k_warn(arvif->ar->ab,
 			    "nontransmitted bssid index %u not found in beacon template\n",
-			    bss_conf->bssid_index);
+			    bssid_index);
 
 	ieee80211_beacon_free_ema_list(beacons);
 	return ret;
@@ -1650,7 +1641,8 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
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


