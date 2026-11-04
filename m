Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E0606D827
	for <ath11k@archiver.kernel.org>; Wed,  4 Nov 2026 02:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E9V7zDrb;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=b6EW8j7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=00pDn8gpWy1cmRkiYLDWSOCJsKkN0Wkf4UzyiZzW/0g=; b=E9V7zDrbZhKULNkh/iyv5CxhEH
	YjPUVnzh57b8B1KWB+DNdaYkgiJWLarsMrZxmmGE+V3+zZn5FMIF+egHieYB+r71QNLE2UacS3zlc
	fvN438nB6aKYsqiAJvGrlZjm6PjmVZSDrwAfMMeM6zYJiSlgBZcZVyVcvejJcDmgZdEkbjuGeQqzv
	Z1d3JsmXghndQve/jiqAx7HUByeoDNkw8tjPMz+XKqz7oEorSNGZcCsu7Xn//zu2s1/tilD4BNf5T
	lIj7BG8BmV64nhPR22MhGjBab028wE7D4vFpyh/ElF70bjsY396DJSVLuKdEBfvKJtfzM6iKH1NHL
	koqx7b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQp1-00000004A9Y-3YRU;
	Wed, 04 Nov 2026 02:33:55 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQow-00000004A60-1ZNc
	for ath11k@lists.infradead.org;
	Wed, 04 Nov 2026 02:33:54 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 536858af4;
	Wed, 4 Nov 2026 10:33:43 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: Fix potential SRNG configuration leak on init failure
Date: Wed,  4 Nov 2026 10:33:42 +0800
Message-ID: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a467b9e203a1kunmaae2da131636f3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEkaVk9OS0NCTkJOGhhCGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	1DVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=b6EW8j7XEFdsKNAiwEUbKbKqi/1IDrcwSLmlLU230HT8k4ypGyGCGP/fSsed5tmxnUDBO7C0IhPoabx71I10UZsL7mwNCMmob82kO8TaOMehT0e2FjAg8kZPm7a0PyidZQRhBLzK04mPR++ROeGz0I24z4rC2/5GclrwusAy71E=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=00pDn8gpWy1cmRkiYLDWSOCJsKkN0Wkf4UzyiZzW/0g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_183351_165967_8151C069 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If either DMA pointer-buffer allocation fails after the SRNG
configuration is copied, HAL initialization returns without freeing
the copy. Its callers skip HAL deinitialization on this error.

Free the configuration on both allocation failure paths and clear
its pointer before returning.

This issue was found by our static analysis tool under development.

Fixes: f7eb4b04ce6f ("ath11k: hal: create hw_srng_config dynamically")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: x86-64 Clang W=1 changed-object builds passed with
allmodconfig and allyesconfig. No hardware/kernel runtime test or full
linked-kernel build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 98bd9e3f0aae..8a4e5042d89a 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
 
 	ret = ath11k_hal_alloc_cont_rdp(ab);
 	if (ret)
-		goto err_hal;
+		goto err_free_config;
 
 	ret = ath11k_hal_alloc_cont_wrp(ab);
 	if (ret)
@@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
 
 err_free_cont_rdp:
 	ath11k_hal_free_cont_rdp(ab);
-
+err_free_config:
+	kfree(hal->srng_config);
+	hal->srng_config = NULL;
 err_hal:
 	return ret;
 }

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

