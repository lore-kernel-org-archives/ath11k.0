Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFED9C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958BE61AF7
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 958BE61AF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AXG4UzQf0rz0DNGkqyUP8KTO/QJoX8jcVyGd5HrnK1Q=; b=Iyw1DELJKupIsw
	saZHN58CugEmtotOIy/rOH2d13XtWrz7LtDYfUx8t1fH9M5gzxGPmP13gUn55kkCP/+h29TtvBzq4
	2zeBdRKtZb3YwALyDGUte0h0oJbPpLBKdtaKkn3lYRi9CDgZvVqD7FZZ/gRyIgqT5vjq/WpTsiY+e
	P8CRebrHcpATNspr8d91QQkx+GwDQnTPXpEA7mOynkQLBA6CiR2AbWhLn28NCFzeQX9u/s8jb4mh4
	0E1oU7w7xacDlwOFuXEkBWoFhJIWgP0rmQ91rV3rXMdOHooBROf0AY3FNARtFFuhmZ3Rd91bLYynK
	Lci9Wg8zQONHVq5fjrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneCQ-007OVU-Ed; Thu, 18 Nov 2021 09:59:22 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneCN-007OUq-AW
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 09:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637229559; x=1668765559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QoWGoOyQvErGWgrbmuo0CNtxStgDp/nC3/B7aJLxAns=;
 b=lJiEWbJSMEppTMxd8lmdHFiIXFlWDHoBW+7/6Vur/i4lOhajJ56hGsSm
 fK38Cf6SsGTg6eUD4SnWVuLThFUT0ZlpzA90Bk2gpnrjgQBxLt2Aqu2GF
 +pl9TkcJEUwxzEnZLPETkIwZ5DZOitylUhr50U3FfhR+wn9Hx87BLynZr g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2021 01:59:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:59:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:59:16 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:59:15 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: skip sending vdev down for channel switch
Date: Thu, 18 Nov 2021 04:59:01 -0500
Message-ID: <20211118095901.8271-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_015919_418396_ED2466A8 
X-CRM114-Status: GOOD (  10.87  )
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

The ath11k driver currently sends vdev down to the firmware before
updating the channel context, which is followed by a vdev restart
command.

Sending vdev down is not required before sending a vdev restart,
because the firmware internally does vdev down when ath11k sends
a vdev restart command.

Firmware will happen crash while channel switch without this change.

Hence skip the vdev down command sending when updating the channel
context and then fix the firmware crash issue.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to latest ath.git master ath-202111170737

 drivers/net/wireless/ath/ath11k/mac.c | 32 +--------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 292b2b7eab11..fe03836c9a84 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6363,37 +6363,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	for (i = 0; i < n_vifs; i++) {
-		arvif = (void *)vifs[i].vif->drv_priv;
-
-		if (vifs[i].vif->type == NL80211_IFTYPE_MONITOR)
-			monitor_vif = true;
-
-		ath11k_dbg(ab, ATH11K_DBG_MAC,
-			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
-			   arvif->vdev_id,
-			   vifs[i].old_ctx->def.chan->center_freq,
-			   vifs[i].new_ctx->def.chan->center_freq,
-			   vifs[i].old_ctx->def.width,
-			   vifs[i].new_ctx->def.width);
-
-		if (WARN_ON(!arvif->is_started))
-			continue;
-
-		if (WARN_ON(!arvif->is_up))
-			continue;
-
-		ret = ath11k_wmi_vdev_down(ar, arvif->vdev_id);
-		if (ret) {
-			ath11k_warn(ab, "failed to down vdev %d: %d\n",
-				    arvif->vdev_id, ret);
-			continue;
-		}
-
-		ar->num_started_vdevs--;
-	}
-
-	/* All relevant vdevs are downed and associated channel resources
+	/* Associated channel resources of all relevant vdevs
 	 * should be available for the channel switch now.
 	 */
 

base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
