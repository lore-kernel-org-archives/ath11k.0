Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D0DD68BEF
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcHg0NpJndK8CAHmWgdGCmFf9DFRmCFe0fyBYJRt1RQ=; b=vGo/LevL/en/zhwuNdl9o1HFGs
	Q/oUVHdih507KJ4me2Wnu9hAtQsDWoNLPgFtOKXxgffb3oeOqb/7rtU2TWnuqSiOoR78sqPvt3nus
	3zzNAS2o/moDkNW0eJ04eQcB22hgp15Vt4CKx8H1BijZaAawzhtS0v2r04hyhtzd//4X0khLeB20w
	r1iIN4ONqp/aZ18Gg0UzWj8SxB/ndsTcuVR64Y3AOhBcWR8LcYk+WHSCRnZXZWaABeAVl64kpjaLe
	zFSot0y6BHz+KUEvyHBIl+p6xHfbpqfzbzHSNAkjW6w5ImYzUojpbm2924QTuwrR9yLnfDX+NuiJ4
	JlAJkY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho6-00000007XTe-3uJd;
	Sun, 17 Nov 2024 16:07:26 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tChnz-00000007XN1-3xRx
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859634; bh=zKlkb1E23LWZlATB3jMn8UnXPziKG292u4yDkQGO9cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vo0fZE80CwjoHBCTQW+Efx3OpTUWoVWxwZneYaReobLLeiycv2YmbfSdJp/jxryaI
	 Vskdm3KPRVixotshR+5dMXXPaFFxbWLSZNUo0We5yVWWsBY4XSCSYaJZfVG5zFl3so
	 W1+ExyJj8moHqOGtXa7i/3HNyxQSi3UZbP+1mkjg=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 604131487382
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:14 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 01/13] net: qrtr: support registering endpoint-specific data
Date: Sun, 17 Nov 2024 17:06:00 +0100
Message-ID: <28e91368c9eac9f6fd4a39b1e2f6669696baa090.1731858974.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080720_483644_026BE69A 
X-CRM114-Status: GOOD (  32.27  )
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

This adds the infrastructure for registering endpoint-specific data for
endpoint IDs.

Endpoint-specific data can be used to map an endpoint ID to a specific
endpoint backend.

Additional API is introduced as a common header in include/net to allow
other parts of the kernel to query endpoint IDs for endpoint-specific
data or make the QRTR subsystem assign a new endpoint ID for passed
endpoint-specific data. This will allow other systems to register
endpoint IDs before actual socket creation and usage, which in turn
allows proper binding to endpoint IDs from the start.

The endpoint registration function is changed to re-use endpoint IDs
that match the backend's endpoint-specific data if possible, assign a
new endpoint ID if the endpoint-specific data is not known yet, or
create a new endpoint ID without endpoint-specific data attached to it
if all else fails.

There is one gripe with this implementation: other kernel subsystems
can, theoretically, assign an unlimited number of new new endpoint IDs
and thus exhaust endpoint ID space. No API is provided to delete
endpoint IDs and we also do not track which endpoint IDs are in use and
which are not, which means that even the QRTR-internal code cannot
easily clean up unused endpoint IDs. The only exception to this are
endpoint IDs attached to QRTR nodes, which will be deleted when the QRTR
nodes themselves are deleted.

This is probably a potential memory leak that we can live with.

Fixing that is rather difficult. We would either have to add some form
of refcounting, wrap the endpoint-specific data pointer into yet another
structure together with a kref and use that to free unused endpoint IDs,
or periodically clean unused endpoint IDs up in a timer (executing, say,
every 10 minutes), essentially doing garbage collection.

Garbage collection is being frowned upon, especially in the kernel, but
in this case, it really would make the most sense. Clients might
allocate endpoint IDs that are never actually used (for instance because
the client uses a wrong endpoint-specific data pointer, which is not
used by a QRTR backend), and will need to hold a reference to this for
their entire life time, which essentially defeats the concept of
cleanup of unused endpoint IDs via reference counting.

Clients can create endpoint IDs quite some time before the QRTR
subsystem uses them, but there is no way to easily tell when this will
be. The idea is that minutes as orders of magnitude would probably be a
safe value for which to regard an endpoint ID as unused.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Depends-on: 25a7151cdc98 ("net: qrtr: ns: support multiple endpoints")
Link: https://patch.msgid.link/20241018181842.1368394-1-denkenz@gmail.com
---
 include/net/qrtr.h |  11 ++++
 net/qrtr/af_qrtr.c | 124 +++++++++++++++++++++++++++++++++++++++++++--
 net/qrtr/qrtr.h    |   5 ++
 3 files changed, 137 insertions(+), 3 deletions(-)
 create mode 100644 include/net/qrtr.h

diff --git a/include/net/qrtr.h b/include/net/qrtr.h
new file mode 100644
index 000000000000..799c84eb35ad
--- /dev/null
+++ b/include/net/qrtr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __NET_QRTR_H
+#define __NET_QRTR_H
+
+#include <linux/types.h>
+
+int qrtr_endpoint_id_get(const void *data, u32 *id);
+int qrtr_endpoint_id_assign(void *data, u32 *id);
+int qrtr_endpoint_id_get_or_assign(void *data, u32 *id);
+
+#endif	/* __NET_QRTR_H */
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index cf8b5483ba2c..59227b3d49f4 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -11,6 +11,7 @@
 #include <linux/wait.h>
 
 #include <net/sock.h>
+#include <net/qrtr.h>
 
 #include "qrtr.h"
 
@@ -649,6 +650,114 @@ static struct sk_buff *qrtr_alloc_ctrl_packet(struct qrtr_ctrl_pkt **pkt,
 	return skb;
 }
 
+/**
+ * qrtr_endpoint_id_get() - get a registered endpoint for given data
+ * @data: endpoint-specific data to fetch ID for
+ * @id: pointer to store endpoint ID into
+ * Return: 0 on success, negative error code on failure
+ *
+ * The endpoint-specific data must not be NULL.
+ * The output parameter id must not be NULL.
+ * If no endpoint ID can be mapped to the endpoint-specific data, id will be
+ * set to 0.
+ */
+int qrtr_endpoint_id_get(const void *data, u32 *id)
+{
+	unsigned long idx = 0;
+	void *iter_data = NULL;
+
+	if (!id)
+		return -EINVAL;
+
+	if (!data)
+		return -EINVAL;
+
+	*id = 0;
+	rcu_read_lock();
+	xa_for_each_range(&qrtr_endpoints, idx, iter_data,
+			  QRTR_ENDPOINT_RANGE.min, QRTR_ENDPOINT_RANGE.max) {
+		if (iter_data == data) {
+			*id = idx;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_id_get);
+
+/**
+ * qrtr_endpoint_id_assign() - assigns a new endpoint ID for given data
+ * @data: endpoint-specific data to assign new ID for
+ * @id: pointer to store endpoint ID into
+ * Return: 0 on success, negative error code on failure
+ *
+ * The endpoint-specific data must not be NULL.
+ * The output parameter id must not be NULL.
+ * On error, id will be set to 0.
+ */
+int qrtr_endpoint_id_assign(void *data, u32 *id)
+{
+	int rc = 0;
+
+	if (!id)
+		return -EINVAL;
+
+	if (!data)
+		return -EINVAL;
+
+	rc = xa_alloc_cyclic(&qrtr_endpoints, id, data, QRTR_ENDPOINT_RANGE,
+			     &next_endpoint_id, GFP_KERNEL);
+	if (rc)
+		*id = 0;
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_id_assign);
+
+/**
+ * qrtr_endpoint_id_get_or_assign() - gets or assigns endpoint ID for data
+ * @data: endpoint-specific data to assign new ID for
+ * @id: pointer to store endpoint ID into
+ * Return: positive on success, negative error code on failure
+ *
+ * The endpoint-specific data must not be NULL.
+ *
+ * If the endpoint-specific data is already registered to an endpoint ID, this
+ * ID will be assigned to id. Otherwise, this function assigns a new
+ * endpoint ID and associates it with the given endpoint-specific data.
+ *
+ * The output parameter id must not be NULL. It will either be set to the
+ * fetched or newly assigned endpoint ID on success, or set to 0 on error.
+ */
+int qrtr_endpoint_id_get_or_assign(void *data, u32 *id)
+{
+	int rc = 0;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!id)
+		return -EINVAL;
+
+	rc = qrtr_endpoint_id_get(data, id);
+
+	if (rc) {
+		*id = 0;
+		return rc;
+	}
+
+	if (!*id)
+		rc = qrtr_endpoint_id_assign(data, id);
+
+	if (rc)
+		*id = 0;
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_id_get_or_assign);
+
 /**
  * qrtr_endpoint_register() - register a new endpoint
  * @ep: endpoint to register
@@ -670,9 +779,18 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	if (!node)
 		return -ENOMEM;
 
-	rc = xa_alloc_cyclic(&qrtr_endpoints, &endpoint_id, NULL,
-			     QRTR_ENDPOINT_RANGE, &next_endpoint_id,
-			     GFP_KERNEL);
+	rc = qrtr_endpoint_id_get_or_assign(ep->endpoint_data, &endpoint_id);
+
+	/*
+	 * The previous function fails if ep->endpoint_data is NULL, so retry.
+	 *
+	 * We're going to assign an endpoint ID without endpoint-specific data
+	 * set in this case.
+	 */
+	if (rc)
+		rc = xa_alloc_cyclic(&qrtr_endpoints, &endpoint_id, NULL,
+				     QRTR_ENDPOINT_RANGE, &next_endpoint_id,
+				     GFP_KERNEL);
 
 	if (rc < 0)
 		goto free_node;
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index b4f50336ae75..3509168e8a40 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -12,13 +12,18 @@ struct sk_buff;
 /**
  * struct qrtr_endpoint - endpoint handle
  * @xmit: Callback for outgoing packets
+ * @endpoint_data: endpoint-specific data pointer, can be NULL
  *
  * The socket buffer passed to the xmit function becomes owned by the endpoint
  * driver.  As such, when the driver is done with the buffer, it should
  * call kfree_skb() on failure, or consume_skb() on success.
+ *
+ * If endpoint_data is NULL, endpoint IDs can not be directly mapped to a
+ * specific endpoint.
  */
 struct qrtr_endpoint {
 	int (*xmit)(struct qrtr_endpoint *ep, struct sk_buff *skb);
+	void *endpoint_data;
 	/* private: not for endpoint use */
 	struct qrtr_node *node;
 	u32 id;
-- 
2.45.2


