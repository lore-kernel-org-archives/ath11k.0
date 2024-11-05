Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F5D1CA3E
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtZtsx3J1DM4w4TRChgg8BgAljLxNkTg3b3lmHLJas0=; b=pNnla+r+Xf9s7sszywt91heI/Y
	ubQsNW9zkeQ3sdp2prZheg8M1atE7Smu1VNqeRSS/9Uxkr1sG/M0euIxGIuD5l12XI9hJIJGPCcb8
	rnS3qUqEYVe9lywcmKbFzLo3JDl3TVI67st7QhFjWsUcGGL0j2AwaOlo3Lx3EZk4DxtMEgbiDbefK
	ySJW/cFnPDQuIZlqrutyqTAXiG070pP5sZokGkMik9PmQiYS4yFJbq/fqQuT8aZKS3wHXhYVcHgLC
	zSBfkaolwLBd4v6flLsxdYWdCDP6DcCOIXPiedrmmZSTO86ATylaxEwHluJ8x1kJGojvM7FKqeTF1
	KPM6ohKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfM-0000000G9Zl-184H;
	Tue, 05 Nov 2024 07:07:52 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfH-0000000G9VN-2AHP
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=CfP5tKuL7Tijffi/Hz69BzH2rEFJgUrJsmhk5Vsc4Wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nO7YvQwfXXNyZhY/2yYCZQ2RBC1A194BJy70tHNtwf+34hrhpmeiV/NqlyKymLKsL
	 LXb+KOS+e7KXhilAobBmw1aRM3ifDG2fSPW4s2ZA2mdizXN8a5EAO/rUhAysqBpVt1
	 XYRYIaxugUMtnSlt7NWm0Yl5P9JyES//8iVjdLgI=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 938FE148924C;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 08/11] wifi: ath11k: bind to QRTR endpoint ID in ath11k_qmi_ops_new_server
Date: Tue,  5 Nov 2024 08:06:22 +0100
Message-ID: <8cce85264f1f1e4e3e51bf491dc6d4fe030ad98d.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230747_739699_4D2BECA2 
X-CRM114-Status: GOOD (  16.13  )
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

If possible, fetch the QRTR endpoint ID in ath11k_qmi_ops_new_server,
which should be late enough for all initializations to already have
happened, and bind to this endpoint ID if fetching it worked.

This finally allows using multiple ath11k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all).

Caveat: it would be better to actually bind to the correct QRTR endpoint
ID right at socket creation time (i.e., when qmi_handle_init is called).
However, we cannot do this, because the socket creation is the part that
actually kicks off qrtr-mhi probing and initialization.
ath11k_qmi_ops_new_server is "early enough" in that it should work
mostly fine, but obviously, there is a time in which messages for other
endpoints can be coming in as well before we actually bound to the
endpoint ID we are interested in.

Unfortunately, I have no idea how to avoid this and properly get the
QRTR endpoint ID before actually creating the socket.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
---
 drivers/net/wireless/ath/ath11k/qmi.c | 50 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/qmi.h |  1 +
 2 files changed, 51 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7a22483b35cd..4c88e04362bc 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -15,6 +15,7 @@
 #include <linux/ioport.h>
 #include <linux/firmware.h>
 #include <linux/of_irq.h>
+#include <net/sock.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -3164,6 +3165,23 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	ret = ath11k_set_qrtr_endpoint_id(ab);
+	if (ret)
+		ath11k_warn(ab, "failed to set QRTR endpoint ID: %d\n", ret);
+	else {
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "trying to bind qrtr endpoint...\n");
+		ret = ath11k_qmi_bind_endpoint_id(ab);
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "bound bind qrtr endpoint...\n");
+
+		if (ret)
+			ath11k_warn(ab, "failed to bind to QRTR endpoint ID: "
+					"%d\n", ret);
+	}
+
+	if (ret)
+		ath11k_warn(ab, "continuing without, but only one device per "
+				"system will be supported\n");
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
@@ -3355,3 +3373,35 @@ void ath11k_qmi_free_resource(struct ath11k_base *ab)
 	ath11k_qmi_free_target_mem_chunk(ab);
 	ath11k_qmi_m3_free(ab);
 }
+
+int ath11k_qmi_bind_endpoint_id(struct ath11k_base *ab)
+{
+	struct ath11k_qmi *qmi = NULL;
+	struct qmi_handle *handle = NULL;
+	const struct proto_ops *ops = NULL;
+	int ret;
+
+	if (!ab)
+		return -EINVAL;
+
+	qmi = &ab->qmi;
+	handle = &qmi->handle;
+
+	if (!handle->sock)
+		return -ENODEV;
+
+	ops = READ_ONCE(handle->sock->ops);
+
+	if (!ops)
+		return -ENODEV;
+
+	if (!ops->setsockopt)
+		return -ENXIO;
+
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "calling ops->setsockopt...\n");
+	ret = ops->setsockopt(handle->sock, SOL_QRTR, QRTR_BIND_ENDPOINT,
+			      KERNEL_SOCKPTR(&handle->endpoint_id),
+			      sizeof(handle->endpoint_id));
+
+	return ret;
+}
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7e06d100af57..35361f844874 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -518,5 +518,6 @@ void ath11k_qmi_deinit_service(struct ath11k_base *ab);
 int ath11k_qmi_init_service(struct ath11k_base *ab);
 void ath11k_qmi_free_resource(struct ath11k_base *ab);
 int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab);
+int ath11k_qmi_bind_endpoint_id(struct ath11k_base *ab);
 
 #endif
-- 
2.45.2


