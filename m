Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD7C5AD49
	for <ath11k@archiver.kernel.org>; Mon, 26 May 2025 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyys+QWDhRSYCSryeTjxXXAtZCFXJU3NhR2m+IoOAB8=; b=TQz5l/D7Trp0AdReUygVs3fTTm
	RuawXWn0OsWdPORlWyIoamXbP3uKyrY2nadJuY/J+e8gkTVOYZs0avHjM5cUddegZ9bfpGJkUj2mB
	oE9MNT5a/nSGcC8crAstF3g8vbj6gMfyCB3dZuFP1+Tno3b9vEnF4zxVM5HPvLgeRZUl0UIS5/n2/
	s/Eo53/6b8mu7RzFsAkKqMNaW9G0EI3n0YOMzArxYTl0ZeJ0EWETpFjBojcnxCINhqe158ttGpNep
	7h04vMRU1lHio0fqIKG1UUuvczd1xDw1SiBGiXpstpYCvcuLgJgReA3poNR1RpToDsDf3B8k7+cYG
	pOySAc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJg-00000008jUz-2FaF;
	Mon, 26 May 2025 11:48:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJd-00000008jRc-0pE4
	for ath11k@lists.infradead.org;
	Mon, 26 May 2025 11:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E12544349;
	Mon, 26 May 2025 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD50FC4CEF3;
	Mon, 26 May 2025 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260103;
	bh=Z5e7LYUJWrN8Oqgcyb4aHiiFK/LIDVnO1Tn4lc/8a7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ye30ttZAMlNo34zgpSRrajqfBM4RbPOWOy6A87yyedXcwhwZ7mpVd59AFImhQJhTo
	 UBmLp43z0ow17lrUxBqfGK4Cf6/rm13cDeWu9wWfUncSU6ZzmP77EaI24KIM1Rzhx4
	 1f/io6bV48+6kFYvZsueZPywJLRLP+gva1yW+oQS0TuvcXxL5sXU2qSxJDrRnp94v5
	 eCQZCWGuV/txZb8XSueafxQx5FK9yRaEofsu8tbwX8p87I80dvcFCBOwZV2PfNlX/5
	 4PugJNjgKi2RueB0IA8QjcVcAcK5oXnqY5hOL1ftnXetSrw0a3YupEDAJgCth2FBzQ
	 xepCCq71VjhQA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWJd-000000000Yu-1hee;
	Mon, 26 May 2025 13:48:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/3] wifi: ath11k: use plain access for descriptor length
Date: Mon, 26 May 2025 13:48:02 +0200
Message-ID: <20250526114803.2122-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526114803.2122-1-johan+linaro@kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_044825_256563_693B7073 
X-CRM114-Status: UNSURE (   9.72  )
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

The read memory barrier added by commit 6d037a372f81 ("wifi: ath11k: fix
ring-buffer corruption") is enough to guarantee ordering also for plain
descriptor accesses if the length helper is ever inlined so drop the
unnecessary READ_ONCE().

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c..1ea7c494f387 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -599,7 +599,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	struct hal_ce_srng_dst_status_desc *desc = buf;
 	u32 len;
 
-	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, READ_ONCE(desc->flags));
+	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
 	desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
 
 	return len;
-- 
2.49.0


