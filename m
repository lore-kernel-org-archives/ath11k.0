Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B130D10F20
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hciMCJqke9FPrvfL4WezbyNYE+VBcENLpqIjraEYITs=; b=u6hf4DeQzVp2UPG0Rl0wF7F4zP
	kJDSXOyFmWkg4mla0R7DV9Jwvnp19NOBrWodyhGK/93sejhIPSb4nSd1ES7WVnGLDOOVpHXyVekoE
	n9kAGe8jd8Q1w43IZ2JFmVEhgBhtqqmXMJj58muYVrD0YgMhcfrxOxpxGgM0cFuJqZSogNwmp2RR3
	j5RvkEb+HmVfonCKPhKNxS3CC/6n0wXtfnk1qc/TSX9FDyc9gGhKXZQPws0iQxn6M+GYmBgn48dhP
	x06tjD4hLHMox1ZqIPI3PEq1XV3qFZckrjcURz2sfHOEywxm4en18KEKfVpTsAggoiWMop7JXwjW+
	D8Gq0Ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tChoA-00000007XXM-1895;
	Sun, 17 Nov 2024 16:07:30 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho4-00000007XQS-2K6a
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=lcAQnMSufW33MX7pAPzjL8693QDiyee7yXyRV45V8CE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ImV4wEI2NwhUehk5kuvCziBBx/7499kVHVUeR9veHquRS+MlV4IgXPkCopfumsIXC
	 QQWGRr9Xnn6ZdAbmQkzBXLUzUL/Sbl6uDy9L2L1qE4Bg1oZ1wp5U7ojbM/QU0WPLv+
	 jH4bldtr71I+WapchlcxkakecBcAV4Qmf+nzSjF0=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 91EA814892A4
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 11/13] wifi: ath12k: add QRTR endpoint ID hif feature
Date: Sun, 17 Nov 2024 17:06:10 +0100
Message-ID: <d0b3079f77e486d5da5a4c988d2bf7e4a53be6ed.1731858975.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080724_790595_A7949E70 
X-CRM114-Status: UNSURE (   7.53  )
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


