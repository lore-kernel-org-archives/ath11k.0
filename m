Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C00D1CA11
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ujd08FAfQ+ea9Y7SXw1Et4Zp1YIHJ7bJe3plKWMmm8=; b=qEnM31fLasLhY+bIV/2cK5hyPL
	h7uLFIJ5fJtSa5CaIPnDXHFa1JqvlnAnVmjl0p7HT7P1NQ2j/7vmcBYctfdANX3PwcFtoETqcOX96
	JnN09O4EW9jq8ok1ZMnfySzz/RmFSDIeW24Qp3DptOM6/gj9zGlSXAOTfeUXpMW1jRrvexBSJMWa7
	/npj9jCOL3vN16nrBN0LR2O2wWKyiOffH/+bo/2RQ8tkaWSyQvAUL7QoI20+9RkWzCRsHvQ/Ksx2y
	ovwoFmjvzB42dxqs54R5SRVZygCwOdIhXsJanDWdD1cxngRKaEwm+1Xti5AT9Q1GkNs4I+j0zLtdR
	BgH8WlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfI-0000000G9XD-3eb7;
	Tue, 05 Nov 2024 07:07:48 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfE-0000000G9Tx-1t0c
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790462; bh=xSlj1YUrUkAKQ5Amx9y6RxDotPJZIunP3HfZLG+xFsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bSwLe/pP7WG/xtNmIS9CFgcuNY+sQUt6atdj6CgKZrgHBRVQCeuCryDDtEYGC6f7w
	 LV7b38OK8mdvWhEwExRhrXGNLwtpfo0ROuc4nR/B0Eail8ik6Ok0zDNiwIqVM3M+p/
	 EYDpDAQz7Voo46fjg0oBxAbSdGagDySmE/boQpk0=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id C92E614886DE;
	Tue, 05 Nov 2024 08:07:42 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 02/11] net: qrtr: mhi: pass endpoint ID to MHI device on init
Date: Tue,  5 Nov 2024 08:06:16 +0100
Message-ID: <68763d194373e6a6ce3214d90130ea27c3115db3.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230744_682942_D98F06FF 
X-CRM114-Status: UNSURE (   9.42  )
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

This is the simple QRTR part of the ugly endpoint ID "IPC" hack.

On initialization, which is currently only implemented for the MHI
backend, the endpoint ID is written to the MHI device's MHI controller.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/mhi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 9a23c888e234..942b65a494e2 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -104,6 +104,10 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (device_create_file(&mhi_dev->dev, &dev_attr_endpoint) < 0)
 		dev_err(qdev->dev, "Failed to create endpoint attribute\n");
 
+	/* Pass endpoint ID to mhi_dev. */
+	dev_dbg(qdev->dev, "setting qdev->ep.id = %u as qrtr_endpoint_id for mhi_dev = %p\n", qdev->ep.id, mhi_dev);
+	mhi_set_qrtr_endpoint_id(mhi_dev, qdev->ep.id);
+
 	/* start channels */
 	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
 	if (rc) {
-- 
2.45.2


