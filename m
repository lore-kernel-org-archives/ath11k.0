Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6E2D1CA3D
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM6ksZIEaAy5o8Jg/JDQMgrJUBhiEGMxhncfR1mgZdw=; b=DxqyBFgvK2gHf/mou3QDzAqMeb
	eg8oWpILCh7pBluLFj6409J/J5sygpiBM/AgITG4WQISe60x0X5fa2yncY7wNKs3lki6CXLQ6xL7B
	oDoU1yOi7Ax9d27b8hffGVAo4WqwFUqm+DcYRsx1tLq3kCDfSV3ZHczOAQgaPoElatrxzOT/p5gGZ
	CzD9UHzK1HOySF1o6NDffYkPPtpXSmwSOw23TNDHNNVw9EazfC74i7NV+4lLi8vRgtVll0JMxtxUr
	cwA+64w9p7gAdsT93ThDj5K/A8BR5NMFGSP1oj0vBgWfSFgKDtfB9EewulOYVBgeVLvIxM83I3kZT
	tU7zO7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfK-0000000G9YK-1cRr;
	Tue, 05 Nov 2024 07:07:50 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfG-0000000G9V2-2WIS
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=6rAcvfWA/5la5My6v/FZo8Egkfvp+nOL/VDFHo+388E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nlxipZ2EHdDABB3a2BBDOJpEj73MfPqNz4BJdCkgyuB0p7iADM2jgA22Ouvs+zhSy
	 3xL0qa4GeCOX/nS2jK3nfTQ72EVR1TADP/JDXu2PbtEzscy8zpuLojxWJYJfjSmdYq
	 hFqvgIvb0uDHwq4UwvFHhzhCAds64g5EZthbwMe0=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 33D4F14886E4;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 05/11] wifi: ath11k: add QRTR endpoint ID hif feature
Date: Tue,  5 Nov 2024 08:06:19 +0100
Message-ID: <250c7e36b24f71cd462f93f66616806010d8a5f4.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230746_888559_9EC3379B 
X-CRM114-Status: UNSURE (   8.18  )
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


