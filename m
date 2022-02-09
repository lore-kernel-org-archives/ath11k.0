Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E018CC433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlDHA9V4/AdkEIkC0Fe2oTIzjs18TiDJ72IewBjoLHg=; b=JBlQkGoDHkFF7I
	0sBkt1X5Ytemibz8WBv8bJUBIk8kjHKx5PSUTZ4V1NkHie0mp0nU18vDmUopIMXx8BjLdUhetxa7z
	V2i/ww2tIjO5Bcu2oDZ5cYaUGJFWG2+bVSxfpL+LvWFS9osil4EQjETOIRAX/MPYqNb3dcJdhOCF9
	gMvkg6YymMoudXTX5ghESwvXyjUf8U812s44Rit/HNwPqIrTQP+kQyYP0tUmpTOr0rh1VTf+SUY5q
	lalCvhC9egpHJ7nraDrY6EUSkG9TSLQ3tmPlPBrzSVAuD1tOpbWkGBvQNbjoj64MVpqvyZ51VNMYw
	uicJvsMPg/8Ed+94GL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnjJ-000KjJ-SQ; Wed, 09 Feb 2022 14:13:57 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnjH-000Ki6-5R
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 14:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644416035; x=1675952035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SgfZoTpbJ+vtHHH9nljdF4CZCvNCNBdsIY/wBkAgJns=;
 b=iIaKHhfZeBRWQXGfAf3MVmycpaKPr/YdXjxgeQSTh3qWciXUdukOeNfH
 0WaSpln71aGwIM9ZAZlBHrXTPFHompFkX0DOystb/D9J1RgcaQ7bHrWcT
 Lfe4IUaJOZfKhwtJ96mmhytl6CLC9Taw7tNZpXZvt13SpD4sJYptNvQwB I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 06:13:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 06:13:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 06:13:53 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 06:13:52 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH 2/2] ath11k: fix radar detection in 160 Mhz
Date: Wed, 9 Feb 2022 19:43:39 +0530
Message-ID: <1644416019-820-2-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_061355_305474_228DB967 
X-CRM114-Status: GOOD (  14.51  )
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

Radar detection fails in the secondary 80 MHz when the
the AP's primary 80 MHz is in non-DFS region in 160 MHz.

This is due to WMI channel flag WMI_CHAN_INFO_DFS_FREQ2 is not set
properly in case of the primary 80 MHz is in non-DFS region.
HALPHY detects the radar pulses in the secondary 80 MHz only when
WMI_CHAN_INFO_DFS_FREQ2 is set.

Fix this issue by setting WMI channel flag WMI_CHAN_INFO_DFS_FREQ2
based on the radar_enabled flag from the channel context.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d5922a0..68754e9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6630,12 +6630,13 @@ static void ath11k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 
 static int
 ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
-			      const struct cfg80211_chan_def *chandef,
+			      struct ieee80211_chanctx_conf *ctx,
 			      bool restart)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
 	struct wmi_vdev_start_req_arg arg = {};
+	const struct cfg80211_chan_def *chandef = &ctx->def;
 	int he_support = arvif->vif->bss_conf.he_support;
 	int ret = 0;
 
@@ -6670,8 +6671,7 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		arg.channel.chan_radar =
 			!!(chandef->chan->flags & IEEE80211_CHAN_RADAR);
 
-		arg.channel.freq2_radar =
-			!!(chandef->chan->flags & IEEE80211_CHAN_RADAR);
+		arg.channel.freq2_radar = ctx->radar_enabled;
 
 		arg.channel.passive = arg.channel.chan_radar;
 
@@ -6781,15 +6781,15 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 }
 
 static int ath11k_mac_vdev_start(struct ath11k_vif *arvif,
-				 const struct cfg80211_chan_def *chandef)
+				 struct ieee80211_chanctx_conf *ctx)
 {
-	return ath11k_mac_vdev_start_restart(arvif, chandef, false);
+	return ath11k_mac_vdev_start_restart(arvif, ctx, false);
 }
 
 static int ath11k_mac_vdev_restart(struct ath11k_vif *arvif,
-				   const struct cfg80211_chan_def *chandef)
+				   struct ieee80211_chanctx_conf *ctx)
 {
-	return ath11k_mac_vdev_start_restart(arvif, chandef, true);
+	return ath11k_mac_vdev_start_restart(arvif, ctx, true);
 }
 
 struct ath11k_mac_change_chanctx_arg {
@@ -6864,7 +6864,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 		 * If vdev is down then it expect vdev_stop->vdev_start.
 		 */
 		if (arvif->is_up) {
-			ret = ath11k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
+			ret = ath11k_mac_vdev_restart(arvif, vifs[i].new_ctx);
 			if (ret) {
 				ath11k_warn(ab, "failed to restart vdev %d: %d\n",
 					    arvif->vdev_id, ret);
@@ -6878,7 +6878,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 				continue;
 			}
 
-			ret = ath11k_mac_vdev_start(arvif, &vifs[i].new_ctx->def);
+			ret = ath11k_mac_vdev_start(arvif, vifs[i].new_ctx);
 			if (ret)
 				ath11k_warn(ab, "failed to start vdev %d: %d\n",
 					    arvif->vdev_id, ret);
@@ -6967,7 +6967,8 @@ static void ath11k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	if (WARN_ON(changed & IEEE80211_CHANCTX_CHANGE_CHANNEL))
 		goto unlock;
 
-	if (changed & IEEE80211_CHANCTX_CHANGE_WIDTH)
+	if (changed & IEEE80211_CHANCTX_CHANGE_WIDTH ||
+	    changed & IEEE80211_CHANCTX_CHANGE_RADAR)
 		ath11k_mac_update_active_vif_chan(ar, ctx);
 
 	/* TODO: Recalc radar detection */
@@ -6987,7 +6988,7 @@ static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
 	if (WARN_ON(arvif->is_started))
 		return -EBUSY;
 
-	ret = ath11k_mac_vdev_start(arvif, &arvif->chanctx.def);
+	ret = ath11k_mac_vdev_start(arvif, &arvif->chanctx);
 	if (ret) {
 		ath11k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
@@ -7081,7 +7082,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	ret = ath11k_mac_vdev_start(arvif, &ctx->def);
+	ret = ath11k_mac_vdev_start(arvif, ctx);
 	if (ret) {
 		ath11k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
