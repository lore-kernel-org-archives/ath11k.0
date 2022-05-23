Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35323C433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekWZCydoJRwt2R9ECZhVL3dJhGr1ZxQcoY52A4brzWg=; b=J+G68K0wzCdAPi
	vQFB7TKfPidvcPk0s1OhLiSp7ZsJu7XjS339VV8fFsz9AmCht5EFEcO9dxEliljUX9ZlnXIEn8tJT
	Ejq5tJpoedRWah4na9P37Ci2qHKWRQDgigsKZoUcqp0ehsBGr+65PH3ITe5gkujk0cCOI5xtqgsV+
	uPjKeJgCLQWASHTxNKo630iY1SUu4Z7Uu9XDMu9PkdskfTOraOQXhAEJnUMVyN8Z9vRjuocIYu8gH
	cS29U4hzDHGMFcoLFecO57VHj7ED4Tk+wHgs31zCmBa1W2Dvovw5pW1aR0vuPcQeZcU3teDAxsiVW
	dHKEihtytM3/M+BAn/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3iK-002YLR-A0; Mon, 23 May 2022 08:46:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ok-002AAA-TD
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=xMvM8K5/2JRocHqXV0x2xEjw4vheAWvTgCDBqHY1WwE=; b=Y3zl8AMF0YfMAX4JxnXz7eyc3i
 aeEDULUWdZHF3h6FonaO5v0ykgZ1Wj1OiDZirmf6E6jZiTUtnzKxN5lp9XW6E9ptGxJsOmDwd31Dv
 7iAvQxnM/Y2cCp4glBMluG67vGRla0DKocu5KK80PqoS1eiiT+L6QD5yKRKYRG67I5DirTv377Pln
 wSwQ7qdW8LmAgQPnEJFg2gOb6n1ERHBCAQxRFmSO01w+cNSun27iRAyJq6rDRLc4l32CTZbHDLwur
 2F6lJjQ21AwRLBawaDYn5w4UJzNQVaYgpf35UQuP2/DyEvY8DxeJfZy8vCkU8Gms9Qee0orTEG1Uj
 Sy+6gpdw==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19c-000seF-H9
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285776; x=1684821776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMvM8K5/2JRocHqXV0x2xEjw4vheAWvTgCDBqHY1WwE=;
 b=Cz+1RMHmhrv0veGutyQ79CrOIQvRgzZe5VP7AGrbuKvBGuJqcxiaj8H5
 4fQoWICuCi/WzNc0HRs8kTINOaLSqDSuUhz+2lZ1TGpKto7A/FFvzYm1T
 HTFZI4R6c1UBqzpxFY8Z0MYrGdp5z0W0woT4x8Ah17lEfWDhY4NmjkfKb M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:28 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:28 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 7/9] ath11k: move vif parameter setting in a different function
Date: Sun, 22 May 2022 23:01:06 -0700
Message-ID: <20220523060108.23982-8-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070257_335887_DC5ABFD1 
X-CRM114-Status: GOOD (  11.32  )
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

Move the configuration of struct ath11k_vif parameters rsnie_present,
and wpaie_present to a separate function.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 41 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 10d35cdfafdb..ff50341f1574 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1350,28 +1350,14 @@ static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
-static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+static void ath11k_mac_setup_bcn_tmpl_vif_params(struct ath11k_vif *arvif,
+						 struct sk_buff *bcn)
 {
-	struct ath11k *ar = arvif->ar;
-	struct ath11k_base *ab = ar->ab;
-	struct ieee80211_hw *hw = ar->hw;
-	struct ieee80211_vif *vif = arvif->vif;
-	struct ieee80211_mutable_offsets offs = {};
-	struct sk_buff *bcn;
 	struct ieee80211_mgmt *mgmt;
 	u8 *ies;
-	int ret;
-
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
-		return 0;
-
-	bcn = ieee80211_beacon_get_template(hw, vif, &offs);
-	if (!bcn) {
-		ath11k_warn(ab, "failed to get beacon template from mac80211\n");
-		return -EPERM;
-	}
 
 	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
+	mgmt = (struct ieee80211_mgmt *)bcn->data;
 	ies += sizeof(mgmt->u.beacon);
 
 	if (cfg80211_find_ie(WLAN_EID_RSN, ies, (skb_tail_pointer(bcn) - ies)))
@@ -1385,7 +1371,28 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 		arvif->wpaie_present = true;
 	else
 		arvif->wpaie_present = false;
+}
+
+static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ath11k_base *ab = ar->ab;
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct ieee80211_mutable_offsets offs = {};
+	struct sk_buff *bcn;
+	int ret;
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return 0;
+
+	bcn = ieee80211_beacon_get_template(hw, vif, &offs);
+	if (!bcn) {
+		ath11k_warn(ab, "failed to get beacon template from mac80211\n");
+		return -EPERM;
+	}
 
+	ath11k_mac_setup_bcn_tmpl_vif_params(arvif, bcn);
 	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 
 	kfree_skb(bcn);
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
