Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2B0C021A4
	for <ath11k@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YS0ZCnpU0032ewMQjAnzpro93E+rCTYfGMOjixjaM4E=; b=k6rEJjpAHMEaDh8dbbo+G29uvU
	tfqAHb7yXxxaz58L3OvdSqqG36VGv5MfYQGoM1Ae+Ykti+14dOsCJIMyFoCmHI1Hz3LBpHXtb2SBp
	ZzevRXocn3k4ELSLjtUkl+U1fpxtcpTO3y43VLVGEzTF3voo5grl+AMWQtHGFevyrL2o9DpxfVDbF
	Uj6zGXqNoQ9fttwJux1fKpJlg1R9+vB3AfHNNffCZgi3W7YBeocoZx1IPgNOycFValaKRss2SFEhe
	boRdIWkcgIpyic4cy2suckS5pfB5Vbu+poO06szt9osfwly72yo8AenfFGZxUd9SRJyAJuTnx6oyT
	VlyT5g8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeC-00000001AXb-1WwG;
	Mon, 10 Feb 2025 19:40:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVA-00000000v3B-25rk
	for ath11k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HoR3001462
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YS0ZCnpU003
	2ewMQjAnzpro93E+rCTYfGMOjixjaM4E=; b=ngL4R8SX4Hox42L9fRtmpEBk7Pw
	ew3bMpKK8K42VXh8+t766HoAtis1WN2ZDsWG7YwWLzWpWO9Btq9jQJA1jwgEAk5U
	cczpLuh+KHbdI0qoTUDgMdjc8v6n1ak8n/0AcbhwtvRWoMjUpYutmgfLyGN/9XEW
	/QAMKtQQiTyp6a07ze6ptDBjsk2P5nfSPBCHjrOfTy68RO3ALPHEGwSLI87YDquW
	TXxaRNT+a4gdX+W9Yf6fjI0mgqSO53D+igzOydHy2aXEITKYFV7Dj8a7Pao+Z1st
	9JEuTVIJODOfSfraZxAUtqNsTY3baGWZ8BtBK70QM/5mRsrqvXUAO9A58Sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxhf2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa668c0d35so3098371a91.1
        for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212042; x=1739816842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS0ZCnpU0032ewMQjAnzpro93E+rCTYfGMOjixjaM4E=;
        b=hbd0LPWm0Z75DhaSLE9SFlgK2y6/m3sGrevnMIaiBHoUetwwbCK12ouMyo3qYiR9as
         eQEh2YeBfP+Pl18wAs6keO9B0fvuq+stcNzF6AlQQq7qsfkiORQ5APtlKE7FcacxacWL
         F+ta6xT7DGtUuBQbHKq/YpvYM8vZOWHf/EaacunGONIfztFZrH8jGyQo9j8nu/G3Yaaa
         uAObL+jb1+z68EgHd9rxN5CtLSnk0HHre517va4Ih2m6RkE5MJvklULz61n4NuR84GoN
         Jq9z9kacKcq7sQJZudt9Iv0PSJB29ENW9RuGSopj7ih9fUEl4E0e25iXB7vyQFLXpuWB
         jt1A==
X-Gm-Message-State: AOJu0Yyx3qZE3V7xiKXH2CEhrJyQFVr7TFTcSZcI+LAyCO20UCHOKO4O
	uzzWJB7zvBqVTaaEZWIjl9LNe8UI1xQ+fGjqKaXeQP8ktxh/j7kvCl5HpPJ9EInfEih/VJVERcT
	rbMVU6QiDjQdoXYSQQz56kzbP4noWMx0+mwDJ/qISX0F2zllzEqblufv3CZDKt7IYcy8X
X-Gm-Gg: ASbGncuLRHOwdVOkxITUhHWfA8PdQ3ygzKW6pqn/EJZHLJWJDtLexCWOSGKfAKF7crl
	OoNAjHTSVfjB89lXy4wBnouVgKK6oMasZZyXGcVAW/jqSn8WUoXu/5QAVmU8eLDs51CJR3UOSaa
	bhLPR0c8ukcw96CYGac5ZG1eEZvB4yOEdN82yQq4GWWuUx9adEq9nShnbLdA0Uw3DCx9QKt7Pa+
	+goDaW/OS220MIslAb5gKgZ0C4NHWVyLjBqNoe9jn5Ey+8I0UZwjI6EPpofVJcXBtKV6QKurMxl
	p2nryZBdnt2txUI1R8Qd+u8trzQn9qeqztXlgM0St8ek7r6c1fnrxxMegcJB
X-Received: by 2002:a05:6a21:1394:b0:1ed:a4ae:3b80 with SMTP id adf61e73a8af0-1ee03a23e9dmr24386864637.6.1739212042041;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjy5laiiBdq36IQJpPuZtXJaWXF9jBvHkUSZ40R6JY7aV8/MptL4xA8ZePCFex81rCp7YnZw==
X-Received: by 2002:a05:6a21:1394:b0:1ed:a4ae:3b80 with SMTP id adf61e73a8af0-1ee03a23e9dmr24386805637.6.1739212041491;
        Mon, 10 Feb 2025 10:27:21 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:21 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Date: Mon, 10 Feb 2025 10:27:14 -0800
Message-Id: <20250210182718.408891-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jv9S8Q1_iev4I9fCbNoCGDEpLyd9qHBv
X-Proofpoint-ORIG-GUID: Jv9S8Q1_iev4I9fCbNoCGDEpLyd9qHBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=935 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102724_645904_0589D21B 
X-CRM114-Status: GOOD (  20.07  )
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

Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This will help
modifying the same code path to reflect mac80211 data structure
changes to support MLO. This also fixes an issue in
ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
inside for loop during each iteration. Compile tested only.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 53 +++++++++++++--------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 14ed53836589..466a314b938b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1529,6 +1529,14 @@ static int ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 	return ret;
 }
 
+static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
+{
+	if (arvif->vif->mbssid_tx_vif)
+		return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+
+	return NULL;
+}
+
 static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 {
 	struct ath11k_vif *tx_arvif;
@@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
@@ -1589,21 +1597,21 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *tx_arvif = arvif;
+	struct ath11k_vif *tx_arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
-		if (tx_arvif != arvif) {
-			ar = tx_arvif->ar;
-			ab = ar->ab;
-			hw = ar->hw;
-			vif = tx_arvif->vif;
-		}
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (tx_arvif && tx_arvif != arvif) {
+		ar = tx_arvif->ar;
+		ab = ar->ab;
+		hw = ar->hw;
+		vif = tx_arvif->vif;
+	} else {
+		tx_arvif = arvif;
 	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
@@ -1674,7 +1682,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
 	struct ath11k *ar = arvif->ar;
-	struct ath11k_vif *tx_arvif = NULL;
+	struct ath11k_vif *tx_arvif;
 	int ret = 0;
 
 	lockdep_assert_held(&arvif->ar->conf_mutex);
@@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 
 	ether_addr_copy(arvif->bssid, info->bssid);
 
-	if (arvif->vif->mbssid_tx_vif)
-		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
-
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 				 arvif->bssid,
 				 tx_arvif ? tx_arvif->bssid : NULL,
@@ -6385,23 +6391,20 @@ static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_vif *tx_arvif;
-	struct ieee80211_vif *tx_vif;
 
 	*tx_vdev_id = 0;
-	tx_vif = arvif->vif->mbssid_tx_vif;
-	if (!tx_vif) {
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
 		return 0;
 	}
 
-	tx_arvif = ath11k_vif_to_arvif(tx_vif);
-
 	if (arvif->vif->bss_conf.nontransmitted) {
-		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ar->hw->wiphy != tx_arvif->ar->hw->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
-		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
+		*tx_vdev_id = tx_arvif->vdev_id;
 	} else if (tx_arvif == arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
 	} else {
@@ -7361,8 +7364,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			   int n_vifs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif, *tx_arvif = NULL;
-	struct ieee80211_vif *mbssid_tx_vif;
+	struct ath11k_vif *arvif, *tx_arvif;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -7416,10 +7418,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
-		mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
-		if (mbssid_tx_vif)
-			tx_arvif = ath11k_vif_to_arvif(mbssid_tx_vif);
-
+		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 					 arvif->bssid,
 					 tx_arvif ? tx_arvif->bssid : NULL,
-- 
2.34.1


