Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21ADC433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dipM+3wrvvecnRPlXddD2wTHZZUFdFY3ZL6N4ue7o6U=; b=v2JG8ZsWoLa0Up
	sXDuK0bTpOq2scS9u7/GRbx0bwQ5Eoai5VryrTES+ITLT/n2uU2ymVC6d8KXvdY4j2zsVgFGNj/kg
	FfSsMv5z8AoEQyRwaSHPDiTnImKixDgRjnLDUYVm13Y15k/WBL2C5jsvcm3bTG+6vF6xN2z9qR1cn
	zr20AYRHg1Mck279GEKLFHJdT3oA3wy4iciklZTQygc3b8hhgT+tlg3d+LeNkp8YqTIKIejPHabzr
	imPD8a2ep8X3KTesc7Qwc7rHt2OTAIQe6pmHfO6oTQhuAr8f4H897pvwc7mlVyesoA0CrztYhXoMa
	xvshsr4D6XO31UzZtLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3kO-002ZMw-2J; Mon, 23 May 2022 08:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ok-002A7b-Rt
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=gODjbkNAiqr7YYTSKhZn/JtSF6AkaSsDoz79JBEI2VU=; b=DUcYkA06yoO+crzzZeLdPWzAau
 xYJAexwi9wu/NMWF42eCi3Iy9EGQ7zrJzo9xnWDPCOg9DCGM+2+mQp7GhIx39bOeCujMEx98ahOfc
 O590AqNvRQyDjQc7KjkaGfurHngN1QYusDWQGVCS5C45lBjp3vjOIKUWzdl9qTUpiwXNuq0tEFX5g
 OuvkBmYbdDehK4dNn8gWc9vSQ9aIDINkqY7GZqRhwTFanEKk3nEkJ5OH1hM1QO7GCKyj/0MF2Jpxc
 YxbnjovIX243h56fOeWVoM6dHGNlWISmP8ZapyMf0WzNdEhFw9zZG8vwhID2dHNS0UfGhMRjtWTPL
 /ATum0kg==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19g-000seF-0A
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285780; x=1684821780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gODjbkNAiqr7YYTSKhZn/JtSF6AkaSsDoz79JBEI2VU=;
 b=cwNO8LZkU9+vCU+Zt7QMty02Ml02MDEXAX6sAJhziS/Q+VODpBeAa6SY
 yltasCRIgItD2eu2XecH80HOYJdm2ivOQEdSI2VIHcIR7wpkHFbZKy4CC
 7DJC7g/2j3+LLw6PKiKalLiKLAatqRcoPwKMixOQW/dMexnJG9k4D2qO7 M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:29 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:28 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 9/9] ath11k: configure WPA and RSN parameters for
 nontransmitting interface
Date: Sun, 22 May 2022 23:01:08 -0700
Message-ID: <20220523060108.23982-10-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070300_614344_E30AD68B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Set rsnie_present and wpaie_present fields for the non-transmitting
interfaces when MBSSID is enabled.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 99 ++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4ead94554724..cee505a1bada 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1373,6 +1373,89 @@ static void ath11k_mac_setup_bcn_tmpl_vif_params(struct ath11k_vif *arvif,
 		arvif->wpaie_present = false;
 }
 
+static void ath11k_mac_setup_bcn_tmpl_nontx_vif_rsnie(struct ath11k_vif *arvif,
+						      bool tx_arvif_rsnie_present,
+						      const u8 *profile,
+						      u8 profile_len)
+{
+	if (cfg80211_find_ie(WLAN_EID_RSN, profile, profile_len)) {
+		arvif->rsnie_present = true;
+	} else if (tx_arvif_rsnie_present) {
+		int i;
+		u8 nie_len;
+		const u8 *nie = cfg80211_find_ext_ie(WLAN_EID_EXT_NON_INHERITANCE,
+						     profile, profile_len);
+		if (!nie)
+			return;
+
+		nie_len = nie[1];
+		nie += 2;
+		for (i = 0; i < nie_len; i++) {
+			if (nie[i] == WLAN_EID_RSN) {
+				arvif->rsnie_present = false;
+				break;
+			}
+		}
+	}
+}
+
+static bool ath11k_mac_setup_bcn_tmpl_nontx_vif_params(struct ath11k_vif *tx_arvif,
+						       struct ath11k_vif *arvif,
+						       struct sk_buff *bcn)
+{
+	struct ieee80211_mgmt *mgmt;
+	const u8 *ies, *profile, *next_profile;
+	int ies_len;
+
+	if (arvif == tx_arvif)
+		return true;
+
+	arvif->rsnie_present = tx_arvif->rsnie_present;
+
+	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
+	mgmt = (struct ieee80211_mgmt *)bcn->data;
+	ies += sizeof(mgmt->u.beacon);
+	ies_len = skb_tail_pointer(bcn) - ies;
+
+	ies = cfg80211_find_ie(WLAN_EID_MULTIPLE_BSSID, ies, ies_len);
+
+	while (ies) {
+		u8 mbssid_len;
+
+		ies_len -= (2 + ies[1]);
+		mbssid_len = ies[1] - 1;
+		profile = &ies[3];
+
+		while (mbssid_len) {
+			u8 profile_len;
+
+			profile_len = profile[1];
+			next_profile = profile + (2 + profile_len);
+			mbssid_len -= (2 + profile_len);
+
+			profile += 2;
+			profile_len -= (2 + profile[1]);
+			profile += (2 + profile[1]); /* nontx capabilities */
+			profile_len -= (2 + profile[1]);
+			profile += (2 + profile[1]); /* SSID */
+			if (profile[2] == arvif->vif->bss_conf.bssid_index) {
+				profile_len -= 5;
+				profile = profile + 5;
+				ath11k_mac_setup_bcn_tmpl_nontx_vif_rsnie(arvif,
+									  tx_arvif->rsnie_present,
+									  profile,
+									  profile_len);
+				return true;
+			}
+			profile = next_profile;
+		}
+		ies = cfg80211_find_ie(WLAN_EID_MULTIPLE_BSSID, profile,
+				       ies_len);
+	}
+
+	return false;
+}
+
 static int __ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif,
 				       struct sk_buff *bcn,
 				       struct ieee80211_mutable_offsets offs,
@@ -1399,6 +1482,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	struct ieee80211_ema_beacons *beacons;
 	u8 i = 0;
 	int ret = 0;
+	bool found_vdev = false;
 
 	if (!arvif->vif->mbssid_tx_vif)
 		return -1;
@@ -1412,11 +1496,21 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 		return -EPERM;
 	}
 
-	if (tx_arvif == arvif)
+	if (tx_arvif == arvif) {
 		ath11k_mac_setup_bcn_tmpl_vif_params(tx_arvif,
 						     beacons->bcn[0].skb);
+		found_vdev = true;
+	} else {
+		arvif->wpaie_present = tx_arvif->wpaie_present;
+	}
 
 	for (i = 0; i < beacons->cnt; i++) {
+		if (!found_vdev)
+			found_vdev =
+				ath11k_mac_setup_bcn_tmpl_nontx_vif_params(tx_arvif,
+									   arvif,
+									   beacons->bcn[i].skb);
+
 		ret = __ath11k_mac_setup_bcn_tmpl(tx_arvif, beacons->bcn[i].skb,
 						  beacons->bcn[i].offs,
 						  i, beacons->cnt);
@@ -1452,6 +1546,9 @@ static int ath11k_mac_setup_bcn_tmpl_non_ema(struct ath11k_vif *arvif)
 
 	if (tx_arvif == arvif)
 		ath11k_mac_setup_bcn_tmpl_vif_params(tx_arvif, bcn);
+	else
+		(void)ath11k_mac_setup_bcn_tmpl_nontx_vif_params(tx_arvif,
+								 arvif, bcn);
 
 	ret = __ath11k_mac_setup_bcn_tmpl(tx_arvif, bcn, offs, 0, 0);
 	if (ret)
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
