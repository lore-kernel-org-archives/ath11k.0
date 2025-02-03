Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A60C02193
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkn/KbsZrRPP00bPrOxcPIgQ5D81kLJKQ+TUyRg86pk=; b=5DhNE4r3hoEKkjDCMFJHmN9HtP
	EBgZw3cd19ppBZhpMkOpxe22lDJj+j8l5GvpQo8yhX3gSRpJPqpamWLpRgYBaj0l4mTK89QVpAGHN
	xnoisI1oF0muvsPjKzs3kkGj2nwmnKb8hQIp8bQTkRgRxCXwX3X8GbY3Q4jKgg5TNQujxfBIvX+YP
	o68ac9cNltQD2m6A5WB+L8pYCqq506O0RPyg+CO+5tSxoKnBzS6Ds3l6IKT3+4fehWdYa+gOM2HI2
	uogvLuFAQYgA6G0TKCl2bBNxhlFjxrb7kihZduB1tEHjkBfqXuPriOKhVpHtkM3Y1mJNQXqQPAPKh
	9jWB7z+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FV-0000000GhlY-2CuV;
	Mon, 03 Feb 2025 21:44:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FS-0000000Ghj4-0bmG
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQg9x026951
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gkn/KbsZrRP
	P00bPrOxcPIgQ5D81kLJKQ+TUyRg86pk=; b=DN/amMK9/cGuFUb6GUzlMJJ5jg+
	wbZsE/VyRFd/vxMuDZn7pEW5qBIrYJ35/z846wx2zHdHCW0UoTzw6XzXRmXTofs2
	W4/P6msdDsqNpPjS14j4FCQJst2o7bg/cYUbtsoWT9EyuATG0sVd7orwVT/f91B2
	JYJGIEoVziVPmfaM4Sr0Eq2s6EMvtl2hsGrwmXPkFfCLCkEDxDAwGTVrDEtgaUNG
	taY5WkbT6ENYvJbnjmaQHq5w/oI9t4Mhoceri2rCu2p2XN90aGFhe3fJ4YQqVtco
	RFJah+eUPBO2LIiSH7BETGLKQgcoJsLYfPMU1M3y5gQG8sMLR36H1jSf43Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufr4wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f03af09e9so348775ad.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619092; x=1739223892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkn/KbsZrRPP00bPrOxcPIgQ5D81kLJKQ+TUyRg86pk=;
        b=g/rK0x91Bv6h1nyBM70Yiz5+QY7/wYQZt1LKZAzFaDLmHyJ1jSV5D0Mz6pYvARe3Ge
         2/YlUgIGOd7yCUQ3+qHDah1s30B6tkSMM2OaC+xAHuWeL4M8zTcPv2yOzko/X1LktdXp
         +yop2CJR65yzAFpI6vBAa2JFr0YiqkHhxqLWBGbdFBYrAhAwVKzdM3m36MsIUOGGGpaJ
         TW2cObSflyA8u5zRzhAIm4vaa4X0sSOQhywofjEYxy7biQ63pXwuLuNs97li7Bp4edeO
         T7qiicu8Haw4822XJ6j0Cmnivx4TZoUutSxVxjpnBA32eNsQLBEq2RpF/LE0t1ixqUPb
         wshw==
X-Gm-Message-State: AOJu0Ywse3tlE/8O8MpnRnir+eiDxSCo3An05KyuWnt0Ng+mJoS5jKaA
	xuHt5O0p+suxQo65kfQ2yQVvALpkLdbZM6qOf3uQwL76T065GgUTB1nvA6OS4tq21GpQZj7Zniq
	e1J60NfdgQmXqYKzPL2LuytjIVDBAEDuLGQDpa9265Ai9unntgTc6ihoEx4HZzuXG1All
X-Gm-Gg: ASbGncvSDIpYDTQJcOHZng3QOm0DhZnw5NLZMXGI7/Mg1eFh94RBpQ05RIeq0WZ7/KD
	ByqranAQLVevZeZUfqj1aQ6qzXaIWwCjPOZRgUKg1b6Lll0DQMnNXlH3P9SMW71GTTpyL+RdqSd
	Abwdzk3wkjX0nNGFRhwmaEwLCEYzyYxlmh8ufcPs6j3MryWF6nMGCgzy1WkaS9+GmKQip9IafA8
	zBzj+6ymqR8V+x36nocPneAgx4GkzebYCVtuhqY/5QQ7Sf9TnyQlAlChk+eTWmOj2HvfyIsO/Wo
	CXdyZAuzw9Q1ENHyw87gonyC+4TUEeXUFfVmtbMTJLsLGMNAXS6jHqzcKqNx
X-Received: by 2002:a17:902:ccc8:b0:215:9894:5679 with SMTP id d9443c01a7336-21dd7b71973mr384991185ad.0.1738619092480;
        Mon, 03 Feb 2025 13:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEskV29JE4JQGNqDGNQyNuMsPsH38/NHc5F5JRg6DoAdqV7uysCzJlpYZd14A/hsIMpF95Blg==
X-Received: by 2002:a17:902:ccc8:b0:215:9894:5679 with SMTP id d9443c01a7336-21dd7b71973mr384990895ad.0.1738619092128;
        Mon, 03 Feb 2025 13:44:52 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:51 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon,  3 Feb 2025 13:44:45 -0800
Message-Id: <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: icqkXZ8kFW6MZ0yS3ukCnSdTGm_ezJfm
X-Proofpoint-ORIG-GUID: icqkXZ8kFW6MZ0yS3ukCnSdTGm_ezJfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=998
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134454_188597_1E6C8E71 
X-CRM114-Status: GOOD (  17.66  )
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
latter two functions.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8b81f450a216..67f733aac759 100644
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


