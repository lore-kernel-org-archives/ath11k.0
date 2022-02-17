Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9582C433F5
	for <ath11k@archiver.kernel.org>; Thu, 17 Feb 2022 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuIVtDtUDCoc+eX2VlmkC1FDlBorE9gRmbs9QT6XMoI=; b=ee+OAZVk6/kWYB
	m4cwL0RYsks7ZonY7vN1wbF6iEXXYXpC9cGq1NBKVCdqMvjhT/Q4UeHZbCTSs+SH6TGaeIJqz1wa/
	phNOLKP6o/vBCyBRgr0DbjK2RjkeAHhSkU0RwI8kPNWdInoVRCIux0WX97Ti+EOOowCF1QXNdfIy3
	jq1tnS96VvgE3IfPCKXKRLphMx9YAhpLp8MePhRbsVfXL9vlEnSDlpgUAjyxjrouHE52UGUJGL1G5
	Z1+s85xxpnufQ8JP2JbHtsELDyj8yyzevCU/wYc52sGBI++A1YTeuxXp74s3VFeDqmhYAzueGA07B
	jAf71/xa7VZxRaTGJy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKaFg-0095ye-UW; Thu, 17 Feb 2022 06:26:52 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKaFd-0095xy-Sc
 for ath11k@lists.infradead.org; Thu, 17 Feb 2022 06:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645079209; x=1676615209;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jNWdit3qKnRNT9F668SEgLXfD6+qTHHC7FIrfqkvDCw=;
 b=WPMy/vgSCyQk3UgMVVTivt1WUVadNVevsOT6Dzv1Qc22OccFuuG8LRf1
 O4CsvQvvbpAoNuCTGP17SGQVQESYIldpHahaOKU3ktAC+bBxoGAgI7aNl
 z3KFkfAsOQXqNVLVtwKR188cKMEnQjglYJux46og4kEbnh9HcQ5EJ1Lh6 Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Feb 2022 22:26:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:26:46 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 22:26:46 -0800
Received: from seevalam-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 22:26:44 -0800
From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Seevalamuthu Mariappan
 <quic_seevalam@quicinc.com>
Subject: [PATCH] ath11k: Handle failure in qmi firmware ready
Date: Thu, 17 Feb 2022 11:56:35 +0530
Message-ID: <1645079195-13564-1-git-send-email-quic_seevalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_222649_994204_CF62E805 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

In some scenarios like firmware crashes during init time
and hardware gets restarted after qmi firmware ready event.
During restart, ath11k_core_qmi_firmware_ready() returns timeout.
But, this failure is not handled and ATH11K_FLAG_REGISTERED is set.

When hardware restart completed, firmware sends firmware ready event
again. Since ATH11K_FLAG_REGISTERED is already set, ath11k handles
this as core restart. Inits are not done because of previous timeout.
But ath11k_core_restart does deinit's which causes NULL pointer crash.

Fix this by handling failure from ath11k_core_qmi_firmware_ready().

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-00881-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 42c2ad3..efb0146 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2959,7 +2959,11 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
 					  &ab->dev_flags);
 				clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
-				ath11k_core_qmi_firmware_ready(ab);
+				ret = ath11k_core_qmi_firmware_ready(ab);
+				if (ret) {
+					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
+					break;
+				}
 				set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
 			}
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
