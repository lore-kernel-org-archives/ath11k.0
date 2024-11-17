Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F27D68BEF
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brwuPL47toQb5coGGmvqXQtmXlmTQQm/vQCPztzwe90=; b=XX2g9VQDai69/KQJQxQfUKAocY
	Y2I8YFUvqFZE06iYle/gPqCnHplJevPvzff2UauB50pPaZL5/TE0dyV+LQCwsffgKsxvEqsQ3MTBQ
	9m4hqgjBytCFbjH5Nygrm7xuV04Q5LKZ9k9fQoxv+apzwdmNmBbpRtWpFsnSUKwZwlNhbEj8K7u4a
	OU+LKGpUL94dhE4qCteb90s9ljQGDBnHxsayOwNm5H3t2M35g/tg7WxmqvNs6ntZPMrgS9+DAPQsl
	txYkVIgELiZzW8+b041nyX7DtKfi06OmWqXUAtgtQ1hwljFs4G3VdGyrm8+EdCjh68hP8f/aPxKe7
	9Lcsf8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho2-00000007XPB-2rWG;
	Sun, 17 Nov 2024 16:07:22 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tChnz-00000007XN5-4439
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859634; bh=7QSLgipwvpNix2RzZJNlMHtn1/pzfskUDepBYEUCBOc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M5Jckyc4dp7hjVNPITd/v9q87xXQRE9lilIrY0GQdqGHuaIFbv9cj3y0I246XIVNI
	 ioLryxbRuT1/zKjX96aByhXj82wHAr7HRsK4Wr2FrGJ7338UzY6snFlTquUioPZTct
	 OvkPasr9sv2zHyzTS4oNKk23kzF/xKutpfaMNM9g=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 9902A14886C9
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:14 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 03/13] net: qrtr: smd: register rpmsg_device as endpoint-specific data
Date: Sun, 17 Nov 2024 17:06:02 +0100
Message-ID: <088a84589c1c21b848b75715d2507d2572756547.1731858974.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080720_473778_654B1E75 
X-CRM114-Status: UNSURE (   6.16  )
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

For the SMD backend, we will use the rpmsg_device pointer as the endpoint-specific data.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/smd.c b/net/qrtr/smd.c
index c91bf030fbc7..cb3eeb6835ca 100644
--- a/net/qrtr/smd.c
+++ b/net/qrtr/smd.c
@@ -68,6 +68,7 @@ static int qcom_smd_qrtr_probe(struct rpmsg_device *rpdev)
 	qdev->channel = rpdev->ept;
 	qdev->dev = &rpdev->dev;
 	qdev->ep.xmit = qcom_smd_qrtr_send;
+	qdev->ep.endpoint_data = rpdev;
 
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc)
-- 
2.45.2


