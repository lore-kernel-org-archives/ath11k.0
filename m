Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C51D10F22
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ltgiPrU+8DBiChf7xdp50JDMpq3CvTsamvR5LfKBhU=; b=c9j9cFy7ywOy4WZwoH8udo3WOj
	D8CUizhNU70EhsNEeHzJngXRDBqk0FO53e7/9DSurjUHkNtTmlRBI4+98mCqXXW6qTqdXvtHZaEVG
	aGhIXZ4tDkeTFTK4JRCXRcAEsaLRZFNKwLvVBF3OJKKxWeAmkqbgOQ0/3dSz+gHv02M1jXq/8QwEp
	jE0SeV2ugnmKjEMjXwBHA14LI3/2OLofX41VEH6QyMGBlMY25VZw/ifa55v+2YSmw7NpMpFp9OEvz
	6xuUvV6m6MT1hgivMg+DFjj2YMLHVu76dCMPdsS1Q83LVrixn9qRKMbWjn9O+bTdrR8YW45I1nd7P
	17qVTYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tChoA-00000007XYD-3D8P;
	Sun, 17 Nov 2024 16:07:30 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho4-00000007XPM-0STD
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=D/TYYXfZvA9zG5y0M3Kzv2Iy5oEehJvHxIumdmxOw5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BLDGsmUA2Z6TbsJOMgSuYhvq7oaGN5wcK7tn93oYCnwO+ShBVrevoaAipdTtjkD64
	 A2lexVLuXtSh6gPU4HjLjp1Kalvxd1tH3caViK7u1NIeP/C/MoVMd0XJsfNAwefVuM
	 eRw4Qmt+bmrmbRYnR7zs+EvbhHomuQw3y8PErWaw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 75E481488DD4
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 10/13] wifi: ath11k: bind to QRTR endpoint ID in ath11k_qmi_init_service
Date: Sun, 17 Nov 2024 17:06:09 +0100
Message-ID: <779dc6214ee37c057d493a7e2a41f468e42fcf70.1731858975.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080724_299492_BC924D2B 
X-CRM114-Status: UNSURE (   8.96  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

If possible, fetch the QRTR endpoint ID in ath11k_qmi_init_service, just
before calling qmi_handle_init, and make it available in the qmi_handle.

qmi_helpers will then automatically bind to this endpoint for us.

This finally allows using multiple ath11k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all).

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
---
 drivers/net/wireless/ath/ath11k/qmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7a22483b35cd..371db19543c1 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -15,6 +15,7 @@
 #include <linux/ioport.h>
 #include <linux/firmware.h>
 #include <linux/of_irq.h>
+#include <net/sock.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -3311,6 +3312,13 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->hw_params.fw_mem_mode;
+
+	ret = ath11k_set_qrtr_endpoint_id(ab);
+	if (ret)
+		ath11k_warn(ab, "failed to set QRTR endpoint ID: %d\n"
+				"continuing without, but only one device per "
+				"system will be supported\n", ret);
+
 	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
 			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
 	if (ret < 0) {
-- 
2.45.2


