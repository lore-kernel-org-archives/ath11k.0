Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F913C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D1760E05
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D1760E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb4O+fAjYR1i3d+moATXdh5gB5tWYU+KCJpJ+deccP8=; b=UkvKZxzYkvl+oT
	AB6FLfO1PH7RmIb5gLR2yoXP6mWn7WNfWzovNNqpexNhH9PEsH4Oix60l+VU7p+rvpLr6rB5E5M7Y
	S1TyV5UMIkwFmY5ByaD1s5peQjaS+W1y6uOCzP2kBqWNLgDsCVH/vvIy72ZME8W7FdMzALQzkNcF7
	ZxHiIyqGlJviaS3smpi7TNkJZDvbbPA4eAUjscH48OScSNAAKS1dHqelkPGX+aiNy3dDPX/u3bhcb
	7Y3DX90uIv5UlXJjgvye+52E9RcFUDT9B3UJd+k5lo8mRulUJm3G8Gd2GjNjdw6PaREYdJ05I54vS
	z80wiE5RPf2xaytpwLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZtj4-009AG0-Ho; Mon, 11 Oct 2021 11:44:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtck-0097bV-N1
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 11:37:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633952264; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=E0yPcG9FmEudpWKWHwpyoEds6JGnlNM7F5gZRlhnjPI=;
 b=UKB1CBf79llOwemAegqGh5CYfH7Ew8rrVGrLJOp8FH1gXTioYFWd26O6KHJugCbm6bjcy5/S
 OBFq2hgHpJ3T/JS+uIPZbZcLjAbb//clWToPHt7upBFSLmhpaf203SRtX1yVRchE5aPnu3uN
 lN1O3OyI9ZjyZrbJS40NQPMZlcY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 616421f903355859c80054a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 11:37:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BEA36C43460; Mon, 11 Oct 2021 11:37:29 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F5B2C4338F;
 Mon, 11 Oct 2021 11:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F5B2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/6] ath11k: purge rx pktlog when entering WoW
Date: Mon, 11 Oct 2021 15:37:48 -0400
Message-Id: <20211011193750.4891-5-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011193750.4891-1-cjhuang@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_043744_657283_5C251443 
X-CRM114-Status: GOOD (  13.73  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This change is to purge rx pktlog when entering WoW and reap
the mon_status buffer to keep it empty. When leaving WoW, host
restarts the reap timer. In WoW state, it's not allowed to feed
into mon_status rings per firmware request.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  7 +------
 drivers/net/wireless/ath/ath11k/dp_rx.c |  4 +---
 drivers/net/wireless/ath/ath11k/dp_rx.h |  2 +-
 drivers/net/wireless/ath/ath11k/wow.c   | 19 +++++++++++++++++++
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e67136b..9747659 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -327,12 +327,7 @@ int ath11k_core_resume(struct ath11k_base *ab)
 	ath11k_hif_ce_irq_enable(ab);
 	ath11k_hif_irq_enable(ab);
 
-	ret = ath11k_dp_rx_pktlog_start(ab);
-	if (ret) {
-		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
-			    ret);
-		return ret;
-	}
+	ath11k_dp_rx_pktlog_start(ab);
 
 	ret = ath11k_wow_wakeup(ab);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d769ba..ae6db5d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5105,13 +5105,11 @@ int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar)
 	return 0;
 }
 
-int ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
+void ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
 {
 	/* start reap timer */
 	mod_timer(&ab->mon_reap_timer,
 		  jiffies + msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
-
-	return 0;
 }
 
 int ath11k_dp_rx_pktlog_stop(struct ath11k_base *ab, bool stop_timer)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 623da3b..2e63f2f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -92,7 +92,7 @@ int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar);
 int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar);
 int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id);
 
-int ath11k_dp_rx_pktlog_start(struct ath11k_base *ab);
+void ath11k_dp_rx_pktlog_start(struct ath11k_base *ab);
 int ath11k_dp_rx_pktlog_stop(struct ath11k_base *ab, bool stop_timer);
 
 #endif /* ATH11K_DP_RX_H */
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 35f1c5c..8bd2ca2 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -13,6 +13,7 @@
 #include "debug.h"
 #include "wmi.h"
 #include "wow.h"
+#include "dp_rx.h"
 
 static const struct wiphy_wowlan_support ath11k_wowlan_support = {
 	.flags = WIPHY_WOWLAN_DISCONNECT |
@@ -557,6 +558,14 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 
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
@@ -590,6 +599,14 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
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
 
@@ -640,6 +657,8 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 	ath11k_hif_ce_irq_enable(ar->ab);
 	ath11k_hif_irq_enable(ar->ab);
 
+	ath11k_dp_rx_pktlog_start(ar->ab);
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
