Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF0D10F24
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZzUJxRauaNbeoxCL8TaKWlCJX+USTueasbu1UwQ354=; b=DEorS3smv+C+CXoL4UZEKVYm3I
	wYZqYyGkeiddco7rZd9Dmejri12hfqCf5mZMUti/FBckeXwvo+slY+VrXAs0v4IA46L/KA0CYoRtl
	AM6wWmbNi5o8REEgBSZnCS+cS5oQILzpM25KVMPZ5bNl2AQH/fuYOVDZSWm4C2tSxPLiW6fmGzRXw
	4UJE+FFB0L4mq8llOYQOhaYWdUbjgsR+PPp0dR8xIn3mSFZl8k9LFJeptuU/1VPkZJIM7hnneTjtM
	vPoIWBjPQ2Qi+F7xraZjjcLAzDIk00jsG9TmbsGIQ7KUA/2CpdFtnajRrVcjZ/fw+YWuzSM/5aGsK
	lx2htRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tChoB-00000007XZt-46s3;
	Sun, 17 Nov 2024 16:07:31 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho4-00000007XQW-2mQk
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=lj2hdylAcNLWLvw2Quu+jjKA/wF8E1oFIaBkbLgAyGE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=exlih8+dLvdxB3ESskhPUZzWzZTMC9Fem3c6NLAFHEwlSFDLWeuiKNVWLwqWwFyUC
	 sWXyE3E6b6sLs5aNjjbpV7jjP5u3eQt6Zs2TfByxyer8Bw9Jk1OwVYIRnYCvBGlWAU
	 mUtVrsy2kvavHiUuRjrK6yv9VjM8rkdM25vw0NFU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id CB2E214892A6
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 13/13] wifi: ath12k: bind to QRTR endpoint ID in ath12k_qmi_init_service
Date: Sun, 17 Nov 2024 17:06:12 +0100
Message-ID: <94b2d667a387e1d13c55c80c660243b37cf91c32.1731858976.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080724_889268_8F8C98C1 
X-CRM114-Status: UNSURE (   9.08  )
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

If possible, fetch the QRTR endpoint ID in ath12k_qmi_init_service, just
before calling qmi_handle_init, and make it available in the qmi_handle.

qmi_helpers will then automatically bind to this endpoint for us.

This finally allows using multiple ath12k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all), including combinations of ath11k-based and ath12k-based cards.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
---
 drivers/net/wireless/ath/ath12k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index d2d9d03c7a28..b7bfcb184a6f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -9,8 +9,10 @@
 #include "qmi.h"
 #include "core.h"
 #include "debug.h"
+#include "hif.h"
 #include <linux/of.h>
 #include <linux/firmware.h>
+#include <net/sock.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -3371,6 +3373,13 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ATH12K_QMI_TARGET_MEM_MODE_DEFAULT;
+
+	ret = ath12k_hif_set_qrtr_endpoint_id(ab);
+	if (ret)
+		ath12k_warn(ab, "failed to set QRTR endpoint ID: %d\n"
+				"continuing without, but only one device per "
+				"system will be supported\n", ret);
+
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
 			      &ath12k_qmi_ops, ath12k_qmi_msg_handlers);
 	if (ret < 0) {
-- 
2.45.2


