Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CFBD6DDF9
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM6ksZIEaAy5o8Jg/JDQMgrJUBhiEGMxhncfR1mgZdw=; b=l5IELa9QKZqpRGn++a6aX52Wre
	cAwC8UhfPXaH7a2WmEdGVlo9ref94RniMFm3XFlA5aIQ8DblpxrQ0wr10THxAqgKGMBJZChZljl59
	140dmSKav3Vxi4dJs16QJfCNLCQDJv1Gjmu2BjZMPEaBiwuUQ9k5yUxxGIyUnN40nNWa8J8Oz0mNn
	itAklDioU2lmQdv2BZauUcUjL7+3q5TFjGdU7fiKlcHsntJq4OXwqJPCqW4J+YoAInQZTz38dKz/u
	vJs6FnDkZEc3adeEt10bzRkmWRazWMVJJ9qiufMia+2LOjTiqASoaiVPCpJJjp3gjFq1ASwARw4+b
	cEZe0cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho8-00000007XVH-39Ic;
	Sun, 17 Nov 2024 16:07:28 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho3-00000007XP7-0rX9
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=6rAcvfWA/5la5My6v/FZo8Egkfvp+nOL/VDFHo+388E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vv4U8un4InaVgLmGrTew0O2bnSqYNysyS2cqEMErEkCYZEDtmNdonZGDMzsA78CD3
	 8GIHcfOeMdk531NpsL7usnyPFInn8BD7MuzoIDmAAcXOiMwoJ4B/YmQz0waV2DI0JL
	 aY7m34orEqP6yrGoOcly0TCdqVDnc37Hssh5y/t0=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 2178A14886FE
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 07/13] wifi: ath11k: add QRTR endpoint ID hif feature
Date: Sun, 17 Nov 2024 17:06:06 +0100
Message-ID: <78f597e4ad85b8a8c8c62677740c272101875126.1731858975.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080723_452503_A8493C70 
X-CRM114-Status: UNSURE (   7.90  )
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

This will allow fetching the QRTR endpoint ID via hardware-specific
means.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath11k/hif.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 674ff772b181..22324fe59d48 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -31,6 +31,7 @@ struct ath11k_hif_ops {
 	void (*ce_irq_enable)(struct ath11k_base *ab);
 	void (*ce_irq_disable)(struct ath11k_base *ab);
 	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
+	int (*set_qrtr_endpoint_id)(struct ath11k_base *ab);
 };
 
 static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
@@ -146,4 +147,11 @@ static inline void ath11k_get_ce_msi_idx(struct ath11k_base *ab, u32 ce_id,
 		*msi_data_idx = ce_id;
 }
 
+static inline int ath11k_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	if (!ab->hif.ops->set_qrtr_endpoint_id)
+		return -ENOSYS;
+	else
+		return ab->hif.ops->set_qrtr_endpoint_id(ab);
+}
 #endif /* _HIF_H_ */
-- 
2.45.2


