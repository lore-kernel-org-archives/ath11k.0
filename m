Return-Path: <SRS0=qRpf=PP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E4FC433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 09:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC426103C
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 09:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CC426103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDgb9FgSw3JDwn65E1ueloTnsaC0+ceAdECKvUMx4eo=; b=DJlh9VrM+/5vhD
	MSIip+zBDpZzpdiNw7agbV726nJldpUZ7LY2C2wQyTGoh9YBx1Is7ZzV5vnDRywdmroGvr3YQAhSS
	5qZIKHqbogVC5pMbG3Ou6fiYITnk+ow61fzuvJOg2RYmC3tWnTDe7+qp1KzQbratD88m7tMBE/hvs
	fNrKPdGGvWbdqKc8PcB4Cwy2LrxKTWrfw5Jk4YK/LScP+z9JxVnaodrBL3aQim0zixJLiTaWWql8s
	qYIReWJuRF2zM6iI0O/KkE7ktizyZh4kMoK1smv4AVtK6HQnR34md6FP6+TSX9cKxjXIwBoIHMICq
	eZPix3ziCpihG9FzDbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffYI-004TY2-8x; Wed, 27 Oct 2021 09:48:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffYE-004TWx-E6
 for ath11k@lists.infradead.org; Wed, 27 Oct 2021 09:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635328134; x=1666864134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N4WIC0PYLvAwbctoYHTdFtMV3c7neUJd/qJhuebSOKc=;
 b=ATGegBWOSlm+ze8t/C2g/0B13/xXm2xrmgcjgyRPhdJkFSCFSEZT1/Is
 FewOzH3w06+TRu8ZoTFlboW3l2jGJkfIeN3FkIOtzLGT0onqsZsu4WjOd
 p/xrIEKSoAuoYrP/vZnZHf01Vu0KRgIScN4TQDmBu+43djUtRl9Hz9XLc o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Oct 2021 02:48:53 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:48:54 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 02:48:51 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: skip sending vdev down for channel switch
Date: Wed, 27 Oct 2021 05:48:36 -0400
Message-ID: <20211027094836.12524-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_024854_591517_1FC8231F 
X-CRM114-Status: GOOD (  10.46  )
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
 drivers/net/wireless/ath/ath11k/mac.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9e7cffc4dffa..f0f71e9c6e94 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5440,32 +5440,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	for (i = 0; i < n_vifs; i++) {
-		arvif = (void *)vifs[i].vif->drv_priv;
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
-	}
-
-	/* All relevant vdevs are downed and associated channel resources
+	/* Associated channel resources of all relevant vdevs
 	 * should be available for the channel switch now.
 	 */
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
