Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76ABD68BFC
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRYSapjcjqKeATWdLsJDDqibuOr2+HWPjcTXe4vZeIQ=; b=irYBCw9Jmq1ghaNoWz4ATEEsIV
	3ykwMNgB3VIlh6SdlskLC+pUdItxRH9Oyw23afg+JpFoVNoxlY/tsUa09z4hCyUiL1StmBBkOYJ2r
	Gy4DhwGyynIF40EmmqCDABFy8YDqnRfY3PKNhArV+G/5/e55qzEkOynXe887BdRkKJheXoC8g+e/J
	j0VqLI0VwFapiMp9XrObTdc8kXlZZZhaTgbibXmoYzImwwBIx9AMC4uW4C23z8ue1adXBq2KgFn0r
	bYuYCyhq4Nq13wmvllEtxP73bxAnCff8iQuJ0Uz4h4J/vOSjes7Ac/PSahneohiGa2j+PrWjow0FF
	hNE6qidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho3-00000007XPK-0UYn;
	Sun, 17 Nov 2024 16:07:23 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tChnz-00000007XN6-3y0I
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859634; bh=/TxftBZVC6BIvR/Gwo+BWSTKZXeqnUC8BxeBqGxS5zM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JxMcIH0Wh0QdGH0SvjonfOycMk8m/+NN+it6VVQkp3T0GnQM+6isPXe7s16MybLGp
	 M5iONoDZg4rr7FF12dfsbZ6/vvBglZCRkqAX8uYcBJQqvjm2Wx54domAON9Du+Wq83
	 HmV6/UGz9Rd9/Q0d/HCNKpyM775/7d27GTkPzUJk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id BADBD14886F1
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:14 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 04/13] net: qrtr: tun: register inode as endpoint-specific data
Date: Sun, 17 Nov 2024 17:06:03 +0100
Message-ID: <5b7251014b902cb3a9fd259b2a610561aa8e0e17.1731858974.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080720_469820_B1CCC56F 
X-CRM114-Status: UNSURE (   6.27  )
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

For the TUN backend, we will use the inode pointer as the endpoint-specific data.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/tun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/tun.c b/net/qrtr/tun.c
index 304b41fea5ab..9dcfecd529f7 100644
--- a/net/qrtr/tun.c
+++ b/net/qrtr/tun.c
@@ -41,6 +41,7 @@ static int qrtr_tun_open(struct inode *inode, struct file *filp)
 	init_waitqueue_head(&tun->readq);
 
 	tun->ep.xmit = qrtr_tun_send;
+	tun->ep.endpoint_data = inode;
 
 	filp->private_data = tun;
 
-- 
2.45.2


