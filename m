Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76DFD6DDF9
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZBFpfMAxEc3iDN83dDGcQrDlarlTxPLO/VIWYe/840=; b=fb6paj4EVNSHQYgrNADOCm7+LY
	/Mm0HXnSHLC8iSmTVqomccYatMBCFYPXSE7C5tI+o+55j7t+hUoqy0UL+gUh2nVpESn1zygoMpGOG
	lQs9d+tInvqtyzVcpXcbOQS92zslIPmGvwwR90T1GDvZ4ozSgqeLEIau/wE6UF/eibTE3G2wR+Jjk
	EKm0qudfUdtfhPJh/SnqFlvMM6WnQAasa+DmBAbvJZtn3OW23QluKUQywGH+fLBXlCzTvagDqzRF5
	fCzXqTw+BrjG4ekXWNH4URviCYoD2Rb1I1VYhHCkjz1bKnQE8YOjZWO5lJtiV5Gd/pSZMaPXUBBF7
	9tPSzU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho5-00000007XSK-2Xz5;
	Sun, 17 Nov 2024 16:07:25 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tChnz-00000007XN3-3wF4
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859634; bh=3yCjE5tdSxEAWWiNtIYYOrdwsDaWqbpFW99BaTLk7HE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xpuv0TZboXUWg07BJBLOkbPu6/O19dgGIZmQ+3SOy1MUX2/12/1xvSih3GgwrjnX8
	 M7kbmfZV77r15Qz7e+efKIgNZMNOQMJY/Qi2qlMzNWm5hoEc9uIJmPf4PEE0rW42w+
	 9SFu5YSJKWNxaB5O1LI7ae76wrfJSWcVH/Eo/V/g=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 7CF39148850A
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:14 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 02/13] net: qrtr: mhi: register mhi_controller as endpoint-specific data
Date: Sun, 17 Nov 2024 17:06:01 +0100
Message-ID: <d9662f81a96cdcdd62d9b1fcc0030ccc771c4826.1731858974.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080720_484477_13D46E86 
X-CRM114-Status: UNSURE (   6.33  )
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

For the MHI backend, we will use the mhi_controller pointer as the
endpoint-specific data.

This means that we can only have one endpoint ID per MHI controller, but
since the MHI controller is the bus master in charge of the physical
link, this is probably okay.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 9a23c888e234..fc6869c3a7ec 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -95,6 +95,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->mhi_dev = mhi_dev;
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
+	qdev->ep.endpoint_data = mhi_dev->mhi_cntrl;
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
-- 
2.45.2


