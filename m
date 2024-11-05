Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AB2D12663
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCmJoUidPx4N3HfbgdYK9IweQkLydvR+8kCRyOkcnWs=; b=Jn6mSjsxNEEga2NEshp6f/FkMo
	FrRsa0baS7xghIdezxdUwcg0Qex+qE3lsvR/ra8VXD1WH7UFtGpshYDmZCGL5tnrvfJqby8Hee4k0
	HpdMBQGt4fk6wGJajosotOOZm1TFJrgo02famN6ALtCdUcc04NJgCH7bYELhBd6FGIXMsA2Br/BRE
	9z3X99S2ie/bHL+b0Et7m8ecpoHLKW1QsC0IFsDNqfheZ1dwEbEZIDHJ34SiRAWoiGF5p4ArK7i4E
	1Xn4CQMLz50q/sQO3PKSlAuhUBsT/XZLohNE5yTPzQLYg6zsK0O1zIBbTzMs3wzL1hIeYIiSYvJTD
	GN1MSpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ejb-0000000GJ0t-4BSf;
	Tue, 05 Nov 2024 08:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfQ-0000000G9ci-280F
	for ath11k@bombadil.infradead.org;
	Tue, 05 Nov 2024 07:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qCmJoUidPx4N3HfbgdYK9IweQkLydvR+8kCRyOkcnWs=; b=VL3cqKvaviNPBMW1GIurH4GlKY
	KCgdyobYr9663h5HYWHTG9iIFYaNiKQY7XQ6GwEko/4Irxs67vrcUv+c1+cjs8zxEu7/cYVqr5djN
	UA1X1AnMMxChcWnhwbHxKckXiMyJemoqsKbePLe3k3/6Kfc21TGfbwvi7UTGzmFba8zOrVLG2XShb
	RQfAaS5gSsAs39ZZCMsRv9q8UyhR0dxa9bxQzG3tFjFo5TAz39VmeBd0cyHIylXVN5x7Vk3QUy3H+
	0BMB63qsFZR/ZbZGBHu1I3BVlEeV4bDzfnz2cf5liIaymXPjt3TXfQrmDhSJb213bf73Grwi4XojP
	toPwwrjg==;
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfL-0000000BgbP-2OYG
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790464; bh=ScpSXg/0FiF7Ex9C0udBuI29VQhQBPAQMP+q9EuYLR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTr9hqDETJQXFuGhHLt+qeXnzkCRIc51tVBfF+MitVHrHvv7SSkZQUgRdMHAVAdcC
	 w2WgYRRAJyjIjk3eKQjtInJ1EGNoqASaNj9gwwELRR8dQPoaOTABMvt37OZhXCexAn
	 e4OEB+AHU3Za4KDuJiO8C89ZMANIAS/NYz4zb2+o=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id F3606148928E;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 11/11] wifi: ath12k: bind to QRTR endpoint ID in ath12k_qmi_ops_new_server
Date: Tue,  5 Nov 2024 08:06:25 +0100
Message-ID: <ddf328610f626b23737ec52af3e8a5931beac29f.1730790063.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070753_385547_FB272843 
X-CRM114-Status: GOOD (  16.64  )
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

If possible, fetch the QRTR endpoint ID in ath12k_qmi_ops_new_server,
which should be late enough for all initializations to already have
happened, and bind to this endpoint ID if fetching it worked.

This finally allows using multiple ath12k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all), including combinations of ath11k-based and ath12k-based cards.

Caveat: it would be better to actually bind to the correct QRTR endpoint
ID right at socket creation time (i.e., when qmi_handle_init is called).
However, we cannot do this, because the socket creation is the part that
actually kicks off qrtr-mhi probing and initialization.
ath12k_qmi_ops_new_server is "early enough" in that it should work
mostly fine, but obviously, there is a time in which messages for other
endpoints can be coming in as well before we actually bound to the
endpoint ID we are interested in.

Unfortunately, I have no idea how to avoid this and properly get the
QRTR endpoint ID before actually creating the socket.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
---
 drivers/net/wireless/ath/ath12k/qmi.c | 49 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index d2d9d03c7a28..96bc0a3cb86f 100644
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
@@ -3264,6 +3266,21 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	ret = ath12k_hif_set_qrtr_endpoint_id(ab);
+	if (ret)
+		ath12k_warn(ab, "failed to set QRTR endpoint ID: %d\n", ret);
+	else {
+		ret = ath12k_qmi_bind_endpoint_id(ab);
+
+		if (ret)
+			ath12k_warn(ab, "failed to bind to QRTR endpoint ID: "
+					"%d\n", ret);
+	}
+
+	if (ret)
+		ath12k_warn(ab, "continuing without, but only one device per "
+				"system will be supported\n");
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
@@ -3414,3 +3431,35 @@ void ath12k_qmi_free_resource(struct ath12k_base *ab)
 	ath12k_qmi_free_target_mem_chunk(ab);
 	ath12k_qmi_m3_free(ab);
 }
+
+int ath12k_qmi_bind_endpoint_id(struct ath12k_base *ab)
+{
+	struct ath12k_qmi *qmi = NULL;
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
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "calling ops->setsockopt...\n");
+	ret = ops->setsockopt(handle->sock, SOL_QRTR, QRTR_BIND_ENDPOINT,
+			      KERNEL_SOCKPTR(&handle->endpoint_id),
+			      sizeof(handle->endpoint_id));
+
+	return ret;
+}
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 0dfcbd8cb59b..6358f75475cf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -600,5 +600,6 @@ void ath12k_qmi_firmware_stop(struct ath12k_base *ab);
 void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 void ath12k_qmi_free_resource(struct ath12k_base *ab);
+int ath12k_qmi_bind_endpoint_id(struct ath12k_base *ab);
 
 #endif
-- 
2.45.2


