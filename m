Return-Path: <SRS0=jp2b=P5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3141C433F5
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 14:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D3D61106
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 14:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70D3D61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qNwPJflD6FFj4B0YjB1f6GLZ24qDEqvg8M2d2ylPYaM=; b=3vdxEIpEjhUVf6
	zIoaKYzW179pdVQi5s+7Uu4KyP7yB8mWUwi99RJSmu/fx0Fb9GZ/CBRQkMtDI/rrozRqFkYwDUMyz
	KZG7Rzql2ZgX1ZneiB823y+5r4oYuqTmNylC+Fpntz0SNZKnCFPq2ZRSnLGeVZGIGjGh1XKnB9yjA
	HCfQv6qwjVn8P+1oNS8RIrfIXUGxsHG4fExXFaeWxfZV+Tww4tfGBezXMNYbgMRsJG+5Ha/7wzQ5v
	U36mdzh02+Z4hJHmehm+D7bye2JmRfRQQ68Qe2W4bpXHRV8r8qzJ1FuNf6ipcRgp0HQF6CkBOjG4F
	LlDSdxZB3/QgKHUZuqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkoW2-005cmW-QI; Wed, 10 Nov 2021 14:23:54 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkoVz-005cm8-IC
 for ath11k@lists.infradead.org; Wed, 10 Nov 2021 14:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636554231; x=1668090231;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=q3qNSKFcQq+TiIPXfvsf2+AVEG8VEuKs5xVYnQ4oWI0=;
 b=bJhpq7pX/wv7ceBqXHEkip3+3JMLIT6Pnvqmz1imLq2unBSfZ4RCUAYy
 g7wE/FRBc3h0+sGItTEMvEV/0SwtRuFykZTd15+eqt0Z6aRvu9q1xI0Yp
 7PWD5ere9GDFy2hmgBgEqCo8Qg8WkB2bQGmwr3MwH4XkHRKLICirbtJVP 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Nov 2021 06:23:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 06:23:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 06:23:48 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 06:23:45 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: [PATCH] ath11k: fix fw crash due to peer get authorized before key
 install
Date: Wed, 10 Nov 2021 19:53:20 +0530
Message-ID: <1636554200-12345-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_062351_675025_E81AA3B6 
X-CRM114-Status: GOOD (  14.84  )
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

Firmware expects host to authorize the peer after the successful key
install. But host authorize the peer before the key install, this trigger
the firmware assert which leads to Q6 crash. To avoid this Q6 crash, host
should authorize the peer after the key install. So introduce is_authorized
in peer object to identify that peer is authorize or not. When
IEEE80211_STA_CONTROL_PORT flag is unset, peer move to authorize state
before the vdev up. When the same flag is set then peer move to authorize
state after vdev up. So added authorise check in ath11k_bss_assoc() to
handle the earlier state transition case. Also added the WMI authorize
procedure in ath11k_mac_op_sta_state() to handle the non-earlier state
transition case.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c  | 53 +++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/peer.h |  1 +
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 50a6f88..5d860fe 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2397,6 +2397,8 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
 	struct peer_assoc_params peer_arg;
 	struct ieee80211_sta *ap_sta;
+	struct ath11k_peer *peer;
+	bool is_auth = false;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -2458,13 +2460,22 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 		   "mac vdev %d up (associated) bssid %pM aid %d\n",
 		   arvif->vdev_id, bss_conf->bssid, bss_conf->aid);
 
-	/* Authorize BSS Peer */
-	ret = ath11k_wmi_set_peer_param(ar, arvif->bssid,
-					arvif->vdev_id,
-					WMI_PEER_AUTHORIZE,
-					1);
-	if (ret)
-		ath11k_warn(ar->ab, "Unable to authorize BSS peer: %d\n", ret);
+	spin_lock_bh(&ar->ab->base_lock);
+
+	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, arvif->bssid);
+	if (peer && peer->is_authorized)
+		is_auth = true;
+
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	if (is_auth) {
+		ret = ath11k_wmi_set_peer_param(ar, arvif->bssid,
+						arvif->vdev_id,
+						WMI_PEER_AUTHORIZE,
+						1);
+		if (ret)
+			ath11k_warn(ar->ab, "Unable to authorize BSS peer: %d\n", ret);
+	}
 
 	ret = ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
 					   &bss_conf->he_obss_pd);
@@ -4131,6 +4142,34 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to associate station: %pM\n",
 				    sta->addr);
 	} else if (old_state == IEEE80211_STA_ASSOC &&
+		   new_state == IEEE80211_STA_AUTHORIZED) {
+		spin_lock_bh(&ar->ab->base_lock);
+
+		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
+		if (peer)
+			peer->is_authorized = true;
+
+		spin_unlock_bh(&ar->ab->base_lock);
+
+		if (vif->type == NL80211_IFTYPE_STATION && arvif->is_up) {
+			ret = ath11k_wmi_set_peer_param(ar, sta->addr,
+							arvif->vdev_id,
+							WMI_PEER_AUTHORIZE,
+							1);
+			if (ret)
+				ath11k_warn(ar->ab, "Unable to authorize peer %pM vdev %d: %d\n",
+					    sta->addr, arvif->vdev_id, ret);
+		}
+	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
+		   new_state == IEEE80211_STA_ASSOC) {
+		spin_lock_bh(&ar->ab->base_lock);
+
+		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
+		if (peer)
+			peer->is_authorized = false;
+
+		spin_unlock_bh(&ar->ab->base_lock);
+	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH &&
 		   (vif->type == NL80211_IFTYPE_AP ||
 		    vif->type == NL80211_IFTYPE_MESH_POINT ||
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 619db00..63fe566 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -28,6 +28,7 @@ struct ath11k_peer {
 	u8 ucast_keyidx;
 	u16 sec_type;
 	u16 sec_type_grp;
+	bool is_authorized;
 };
 
 void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
