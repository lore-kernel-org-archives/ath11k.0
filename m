Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB806C433EF
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1AuelIseVNDRwf3a2fDiitwHiqA0KVDx/8ECxAIEKjE=; b=4Y6l6doYfqIr72
	f1sC17E8hid7ue/NTTfogNqBqppPr0pce9rXO45yxQPw1EXa3Pmi+rFAlUt1EfNfSWBXDIyd1/9Tk
	yKcSgLQ4M+n1JjUuBHlTJB0kyHIqVDV0Zh/YUlTkBsJYUD05WO7oOmeNy3NaV6i9RQYRRk+CDAh3r
	0kGUpTQomMnLpObof9k4OW8PjXKVRnsjGR1me1Y2I4Ko3dBhsRsCkWGH+aWcrO2cYudbteAcNtCob
	byRe5p93NlO0ZrskfdV6GG7bfPsgxiycd37OPG8vteHfYuNpBgjWUOcnbAJr9kX9eMJY9lgbKFXBl
	O/H9LA3URX8Kjl84bA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnjL-000Kjn-Hw; Wed, 09 Feb 2022 14:13:59 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnjH-000KiB-V4
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 14:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644416035; x=1675952035;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=mWjJdHYODbZPfvSGWhcZc8pUvzmhPRg5+wfmSCaUo1A=;
 b=AlUJ3dCCtZ/3MFuqMvlL0uRs6IjsSZKJ6JcZsC17kcIY3Txrv4jyXjQ5
 7lMuz27/tCIHML6Qaojlz/nk2kggMx6TzeoiS1GLWU/BpmzeanIQusx7v
 9jQLL2WwNYZ0Nduv1X9orL4np2kTCRaP5UzhDL+ErqC3ItNATWvj77bvO w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 06:13:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 06:13:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 06:13:51 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 06:13:50 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH 1/2] ath11k: fix WARN_ON during ath11k_mac_update_vif_chan
Date: Wed, 9 Feb 2022 19:43:38 +0530
Message-ID: <1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_061356_068525_C6B3D4BC 
X-CRM114-Status: GOOD (  11.65  )
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

Fix WARN_ON() from ath11k_mac_update_vif_chan() if vdev is not up.
Since change_chanctx can be called even before vdev_up from
ieee80211_start_ap->ieee80211_vif_use_channel->
ieee80211_recalc_radar_chanctx.

Do vdev stop followed by a vdev start in case of vdev is down.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ed89905..d5922a0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6856,13 +6856,33 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 		if (WARN_ON(!arvif->is_started))
 			continue;
 
-		if (WARN_ON(!arvif->is_up))
-			continue;
+		/* change_chanctx can be called even before vdev_up from
+		 * ieee80211_start_ap->ieee80211_vif_use_channel->
+		 * ieee80211_recalc_radar_chanctx.
+		 *
+		 * Firmware expect vdev_restart only if vdev is up.
+		 * If vdev is down then it expect vdev_stop->vdev_start.
+		 */
+		if (arvif->is_up) {
+			ret = ath11k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
+			if (ret) {
+				ath11k_warn(ab, "failed to restart vdev %d: %d\n",
+					    arvif->vdev_id, ret);
+				continue;
+			}
+		} else {
+			ret = ath11k_mac_vdev_stop(arvif);
+			if (ret) {
+				ath11k_warn(ab, "failed to stop vdev %d: %d\n",
+					    arvif->vdev_id, ret);
+				continue;
+			}
+
+			ret = ath11k_mac_vdev_start(arvif, &vifs[i].new_ctx->def);
+			if (ret)
+				ath11k_warn(ab, "failed to start vdev %d: %d\n",
+					    arvif->vdev_id, ret);
 
-		ret = ath11k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
-		if (ret) {
-			ath11k_warn(ab, "failed to restart vdev %d: %d\n",
-				    arvif->vdev_id, ret);
 			continue;
 		}
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
