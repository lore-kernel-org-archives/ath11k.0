Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E74C4338F
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 06:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2257161250
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 06:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2257161250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3s4tPnBPIb4oSmk8chdCj++NSgzg+sUkSZ0bzfry3Is=; b=vnOt+vHERpklqD
	sSmB+FKpVGL0WIQII6sC8KZZTTdEvr83Yu1a2NaihcYRG6sGyYxNu7u2oJPFQd5BRCqi5Bs5/CtBP
	wjfWs3sArG12AJJMu+UYJeUUTewcimbFN/ofJnMIIKaFcFtxQWhw3fGPfb1HeFSv18P97SY+RQzob
	TED2DRnKIzZsW+1OXSz4MTKL25K/wc/kkCot7X3i+hxp2lcUEK8zniS1+dUUt8QQRh9rTGPl9ubxe
	OuX/XAQ1Alrre2xJ+SbTbHuM8qgU6+2n9gEAuPH5OObFD7rAytrJwnhEpCf5CQTlej3cyf64WFb73
	XMu7E9EVYk1a0CHdyJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI3WU-00FWdS-P0; Mon, 23 Aug 2021 06:33:30 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI3WP-00FWcp-24
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 06:33:29 +0000
Received: from localhost.localdomain (unknown [222.129.32.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3D0F13F047; 
 Mon, 23 Aug 2021 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629700394;
 bh=h+Lqrx8H7LFmJq35FTa1ano+uoUiw14tzRykgsn21aY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Pf3gWNoLWK9ZMYRbMud+Fp0XQcZFJf6Bg/N6xYN8pNVgXMQb/9YZtpYel5QJbdFrN
 3LdFDkzXx6CZ722tsWyYyjb8uF02uusjuvKMmAuZOHsHfl9rGb3s1PGKSRtT3Xp+BF
 DkVO5uwMbY81nvY8N4QhjZFb8DoTeAGZ1/3XtgZvYPqxy8kjrB7cpVnJtGz+D2aIuY
 mdISgHsA9dqWO3avZM602szwpTscLYa6fs0ETxE0BYHNjJcR84GYHlERUgd+wF49/7
 DJ+QMVmVAOkxQE0bhCkNhPkmgT1wqKBBEL37huCmrTIYB8UGO3lSZB8N6+z308GBL2
 SYPSrJKEbryCQ==
From: Aaron Ma <aaron.ma@canonical.com>
To: aaron.ma@canonical.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: qmi: avoid error messages when dma allocation fails
Date: Mon, 23 Aug 2021 14:32:58 +0800
Message-Id: <20210823063258.37747-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_233325_278738_890E639F 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

qmi tries to allocate a large contiguous dma memory at first,
on the AMD Ryzen platform it fails, then retries with small slices.
So set flag GFP_NOWARN to avoid flooding dmesg.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b5e34d670715..d6270e96d46c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1770,7 +1770,7 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 		chunk->vaddr = dma_alloc_coherent(ab->dev,
 						  chunk->size,
 						  &chunk->paddr,
-						  GFP_KERNEL);
+						  GFP_KERNEL | __GFP_NOWARN);
 		if (!chunk->vaddr) {
 			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
