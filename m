Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE8ED1CA3A
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXfVTJinFHcD/x5oXy68ywtZEHhDs1rj7aMGPRw3lcA=; b=Q/AFnaneqMTi39HEbaE3plbEYK
	KxARq3WpBT7haLAKXnF+gI1PTY4e0IWBUEfFpNM9CYjnJVQYIVvI+BzVDTWX4r9btT9U6pGM8mNcd
	zSIZCTt5ipcjgiT1Rmsk9PMBq/iCdTScmD+htZPsgavRm/h1cuNnyFd03yUGodV7tiAqMERiQKpIW
	aLqSq9tkx3mdyWRbltSRf7e68o5lO8LGXxLj6f0V51P+9AO52I2Q+VWuTdqQvTKuBpqKFH36biFr0
	RD+0tftpjj+j7vZjgbkFoF6jWr2yAmIvgmmC0XmiWbCXiHnTxhm0quk/hLSdwdqIO3GuL9YIpL8cM
	RP7nHi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfJ-0000000G9XQ-1NaC;
	Tue, 05 Nov 2024 07:07:49 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfE-0000000G9Tv-3Et8
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790462; bh=d55VIxvG1ImS6Ms9zxDA1thyPmQWmNIKKs8Q49AOfL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7QmrTawxnL5qitJ46aGduFPIMuFJxqbt9K9rUdrKD/d9oZlcUox7BzwMNLWrIoc8
	 xs6XiJ2oBrjpqs7NSS++7R8pv7f2ZojVmgY+yfxp1KUFyjpuBRE+k3eqPj837/xYj/
	 fX27FsE1zAiR7GFwMzVcnIvmFQg397JMYenTUCGw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id A9AFD14886D8;
	Tue, 05 Nov 2024 08:07:42 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 01/11] bus: mhi: host: add QRTR endpoint ID to mhi_device
Date: Tue,  5 Nov 2024 08:06:15 +0100
Message-ID: <68d2815535dd426b3a486d9b51f8f18ce779fcfe.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230745_064588_5D16B9B7 
X-CRM114-Status: GOOD (  19.12  )
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

We need a way to communicate between QMI clients (e.g., ath11k and
ath12k) and QRTR internals.

Unfortunately, clients are on the "wrong" side of a socket and cannot
really extract QRTR data easily, and, to make matters worse, not at all
until the socket is properly connected. Further complicating the matter
is that multiple clients can be connected to the same server socket, so
even if we would add additional control message support for fetching the
data we are interested in, there is no way for the QRTR system to know
what endpoint ID the client is actually interested in.

However, MHI and its data is a central place that essentially connects
both sides. Both the QRTR subsystem and QMI clients have access to MHI
devices, so we will employ a really ugly IPC scheme in which QRTR will
write the endpoint ID associated with an MHI (controller) device to
mhi_dev->mhi_cntrl->mhi_dev->qrtr_endpoint_id once the endpoint ID
initialization has happened for a specific MHI device, and clients can
then fetch this data at a later time by also going through
mhi_dev->mhi_cntrl->mhi_dev->qrtr_endpoint_id.

This is incredibly ugly. It also certainly is not the correct way to do
this. It is also racy, because clients need to fetch the QRTR endpoint
ID after QRTR has actually initialized it, or they will just see a value
of zero (which is an illegal endpoint ID, so at least we have some sort
of guard for this uglyness).

I just was not able to come up with any other idea that would actually
work.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Depends-on: 25a7151cdc98 ("net: qrtr: ns: support multiple endpoints")
Link: https://patch.msgid.link/20241018181842.1368394-1-denkenz@gmail.com
---
 drivers/bus/mhi/host/init.c |  1 +
 drivers/bus/mhi/host/main.c | 64 +++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         | 20 ++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index a9b1f8beee7b..b35e722b0802 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1262,6 +1262,7 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	mhi_dev->dev_wake = 0;
+	mhi_dev->qrtr_endpoint_id = 0;
 
 	return mhi_dev;
 }
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4de75674f193..c774e941fbb7 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1707,3 +1707,67 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+
+int mhi_set_qrtr_endpoint_id(struct mhi_device *mhi_dev, u32 qrtr_endpoint_id)
+{
+	struct mhi_controller *mhi_cntrl = NULL;
+	struct mhi_device *mhi_cntrl_dev = NULL;
+	struct device *dev = NULL;
+
+	if (!mhi_dev)
+		return -ENODEV;
+
+	mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	if (!mhi_cntrl)
+		return -ENODEV;
+
+	mhi_cntrl_dev = mhi_cntrl->mhi_dev;
+
+	if (!mhi_cntrl_dev)
+		return -ENODEV;
+
+	dev = &mhi_cntrl_dev->dev;
+
+	if (dev)
+		dev_dbg(dev, "setting qrtr_endpoint_id = %u for mhi_dev->mhi_cntrl->mhi_dev = %p", qrtr_endpoint_id, mhi_cntrl_dev);
+
+	mhi_cntrl_dev->qrtr_endpoint_id = qrtr_endpoint_id;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mhi_set_qrtr_endpoint_id);
+
+int mhi_get_qrtr_endpoint_id(struct mhi_device *mhi_dev, u32 *qrtr_endpoint_id)
+{
+	struct mhi_controller *mhi_cntrl = NULL;
+	struct mhi_device *mhi_cntrl_dev = NULL;
+	struct device *dev = NULL;
+
+	if (!qrtr_endpoint_id)
+		return -EINVAL;
+
+	if (!mhi_dev)
+		return -ENODEV;
+
+	mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	if (!mhi_cntrl)
+		return -ENODEV;
+
+	mhi_cntrl_dev = mhi_cntrl->mhi_dev;
+
+	if (!mhi_cntrl_dev)
+		return -ENODEV;
+
+	WRITE_ONCE(*qrtr_endpoint_id, mhi_cntrl_dev->qrtr_endpoint_id);
+
+	dev = &mhi_cntrl_dev->dev;
+
+	if (dev)
+		dev_dbg(dev, "queried qrtr_endpoint_id = %u for mhi_dev->mhi_ctrl->mhi_dev = %p", *qrtr_endpoint_id, mhi_cntrl_dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mhi_get_qrtr_endpoint_id);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 059dc94d20bb..2262be3ee5b1 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -462,6 +462,7 @@ struct mhi_controller {
  * @ul_chan_id: MHI channel id for UL transfer
  * @dl_chan_id: MHI channel id for DL transfer
  * @dev_wake: Device wakeup counter
+ * @qrtr_endpoint_id: endpoint ID associated with QRTR
  */
 struct mhi_device {
 	const struct mhi_device_id *id;
@@ -474,6 +475,7 @@ struct mhi_device {
 	int ul_chan_id;
 	int dl_chan_id;
 	u32 dev_wake;
+	u32 qrtr_endpoint_id;
 };
 
 /**
@@ -827,4 +829,22 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
  */
 int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
 
+/**
+ * mhi_set_qrtr_endpoint_id - Sets supplied QRTR endpoint ID
+ * @mhi_dev: Device to set the QRTR endpoint ID for
+ * @qrtr_endpoint_id: ID to set
+ *
+ * Return: 0 if setting data succeeded, a negative error code otherwise
+ */
+int mhi_set_qrtr_endpoint_id(struct mhi_device *mhi_dev, u32 qrtr_endpoint_id);
+
+/**
+ * mhi_get_qrtr_endpoint_id - Gets QRTR endpoint ID for specified MHI device
+ * @mhi_dev: Device to get the QRTR endpoint ID for
+ * @qrtr_endpoint_id: pointer to save the QRTR endpoint ID to
+ *
+ * Return: 0 if fetching data succeeded, a negative error code otherwise
+ */
+int mhi_get_qrtr_endpoint_id(struct mhi_device *mhi_dev, u32 *qrtr_endpoint_id);
+
 #endif /* _MHI_H_ */
-- 
2.45.2


