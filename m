Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC05C433F5
	for <ath11k@archiver.kernel.org>; Thu, 20 Jan 2022 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3q5OZUaBAJiAfj953SGjXJE9eJWIcXGpd5+ttKRrcGo=; b=KYWyZ/2P2V6zFh
	A8h8XmsSERdmAZQ6DBdtEyLWKzze7w3QgIDuQH9FiB5CRLiVIbo9zGT+JEHtPDFfFJwBk+Ax7DndB
	3J/xIslDVEY7E2Hz8x8gghws+4LArcPFonsx4Aze8g/S5/TjNCvz2nJcf0+EhkbJPqgcFNFJpumQT
	2PKl+R1Efyabt8P/+cljZMlbguiHdFMcL5R8yRkYytOVI48PPUxwpHH0OB7jwaM3zLhJaTbx0Mcum
	Qn5Smu4YxHK1iKJb0Aec42QlWYpiKdvGw8b7C8Qvmt8byVBH1a74lV0ZcOABL8K8V9/tlZBIQ4t2v
	BGv6NpHwBR8atJzZRV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUSG-00AabZ-4u; Thu, 20 Jan 2022 10:14:08 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUSB-00AaVT-Hz
 for ath11k@lists.infradead.org; Thu, 20 Jan 2022 10:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642673643; x=1674209643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BZJ+DIxvb2j0GeQ/G334YF7NQNDd9xwnFW15IwmF5Xg=;
 b=D3GY+I1730XStD+Yy/BugJKIeh3WKcSzAPciYIHqMQVDCuQnIBRw9EZs
 iFnq8YpMP/lVKJKEE8tHymRFLTk65ja0KyDJUrBrk0RfqWUXfM08SyF+s
 J6EtP3J7EATW5T+/fhucq6p1T1bTD6PZb0LOj9sBx2tpfnBDg/CFt/0Dt 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 02:14:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:14:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:14:03 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:14:01 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 4/6] ath11k: purge rx pktlog when entering WoW
Date: Thu, 20 Jan 2022 18:13:25 +0800
Message-ID: <1642673607-8896-5-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642673607-8896-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1642673607-8896-1-git-send-email-quic_cjhuang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_021403_717260_E59316DE 
X-CRM114-Status: GOOD (  13.34  )
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

This change is to purge rx pktlog when entering WoW and reap
the mon_status buffer to keep it empty. When leaving WoW, host
restarts the reap timer. In WoW state, it's not allowed to feed
into mon_status rings per firmware team's recommendation.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c  |  3 +--
 drivers/net/wireless/ath/ath11k/dp_rx.c |  1 -
 drivers/net/wireless/ath/ath11k/wow.c   | 23 +++++++++++++++++++++++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 1acb2d1..136e2fe 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -478,8 +478,7 @@ int ath11k_core_resume(struct ath11k_base *ab)
 
 	ret = ath11k_dp_rx_pktlog_start(ab);
 	if (ret) {
-		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
-			    ret);
+		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n", ret);
 		return ret;
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 38eeb6e..18eeb84 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5609,7 +5609,6 @@ int ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
 	/* start reap timer */
 	mod_timer(&ab->mon_reap_timer,
 		  jiffies + msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
-
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 63577e0..f798b5c 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -13,6 +13,7 @@
 #include "debug.h"
 #include "wmi.h"
 #include "wow.h"
+#include "dp_rx.h"
 
 static const struct wiphy_wowlan_support ath11k_wowlan_support = {
 	.flags = WIPHY_WOWLAN_DISCONNECT |
@@ -562,6 +563,14 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	ret = ath11k_dp_rx_pktlog_stop(ar->ab, true);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to stop dp rx (and timer) pktlog during wow suspend: %d\n",
+			    ret);
+		goto exit;
+	}
+
 	ret =  ath11k_wow_cleanup(ar);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to clear wow wakeup events: %d\n",
@@ -595,6 +604,14 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ret = ath11k_dp_rx_pktlog_stop(ar->ab, false);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to stop dp rx pktlog during wow suspend: %d\n",
+			    ret);
+		goto cleanup;
+	}
+
 	ath11k_ce_stop_shadow_timers(ar->ab);
 	ath11k_dp_stop_shadow_timers(ar->ab);
 
@@ -645,6 +662,12 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 	ath11k_hif_ce_irq_enable(ar->ab);
 	ath11k_hif_irq_enable(ar->ab);
 
+	ret = ath11k_dp_rx_pktlog_start(ar->ab);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to start rx pktlog from wow: %d\n", ret);
+		return ret;
+	}
+
 	ret = ath11k_wow_wakeup(ar->ab);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to wakeup from wow: %d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
