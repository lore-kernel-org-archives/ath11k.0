Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F36D1CA3A
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hciMCJqke9FPrvfL4WezbyNYE+VBcENLpqIjraEYITs=; b=Qf1uql7l3ZbjbVpYVhvyNYvWB6
	/5joAnG7U9w1IhPcODVcMgTPd7WU60J7HBDX8yEwmDH4059YU9pbDOyU9G+HQFSPk5ajQlpqtb92H
	G29ryzIl+GsK4W6S7aprF81LXTrkJgNAhwqyNt4og4jNPIcozRaeo1V7MRGd9CbISJquH4FyMLUai
	FiU8FWkva9t7CU6YMq9YYvuzRmCnHcZjCTxdTeQy5k6IDaG8LdJ4tTJHtQIdatx27UpXPT8jLY6tN
	j0P97+1G3jRdbIXji8x2M2DZ+cmF7YVeExIuR/FEL6g1ccmNgs7Y8AmdztHB6knPBEER1ROLTsDO1
	znOXjl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfN-0000000G9ac-2BZl;
	Tue, 05 Nov 2024 07:07:53 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfH-0000000G9Vk-3iBl
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=lcAQnMSufW33MX7pAPzjL8693QDiyee7yXyRV45V8CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VfEYhRaJGQNtIFe603YoVEhPhHr7/78CdgDNzpwsI+hWo2lRkFmpxJnI1fwtiSoi9
	 /IRlJ1Es4vW6uLs9TE5AQH9wauco+/VQr2taKazhnr3xZaMMmUFMFXX+vig5h3BuL4
	 9Kc80d2hpgJYiRZgKpvzWGWqKr7uJ3IbObG8BULQ=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id B32A01489268;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 09/11] wifi: ath12k: add QRTR endpoint ID hif feature
Date: Tue,  5 Nov 2024 08:06:23 +0100
Message-ID: <b7c0bf53fe20b091a97fd29b02c9e9db27309785.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230748_184825_9DD37A36 
X-CRM114-Status: UNSURE (   7.81  )
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
 drivers/net/wireless/ath/ath12k/hif.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index e8840fab6061..c00234ec64c1 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -32,6 +32,7 @@ struct ath12k_hif_ops {
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	int (*panic_handler)(struct ath12k_base *ab);
 	void (*coredump_download)(struct ath12k_base *ab);
+	int (*set_qrtr_endpoint_id)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -162,4 +163,12 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline int ath12k_hif_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->set_qrtr_endpoint_id)
+		return -ENOSYS;
+	else
+		return ab->hif.ops->set_qrtr_endpoint_id(ab);
+}
 #endif /* ATH12K_HIF_H */
-- 
2.45.2


