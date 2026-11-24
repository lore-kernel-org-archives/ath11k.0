Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F1606A31E
	for <ath11k@archiver.kernel.org>; Tue, 24 Nov 2026 01:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mvPoZIX3;
	dkim=pass (2048-bit key, unprotected) header.d=luixo.me header.i=@luixo.me header.a=rsa-sha256 header.s=protonmail3 header.b=siv+bPXC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AEPdrSonFnMm713LtxfgWTKetCF42gKUQZWQeqT3CgY=; b=mvPoZIX3EzZyasLsuGgnh9dGKQ
	O5HZHyQlP+M4kSmqBsFlFX8GCnUcEkAUG4P0v9+k+SGfUf24UNw8lvHHl42wiG229FeVYGpE4pYzI
	2hIv9UqEU+w5xCBjvM0qXkmzAFi7P86zuy4E6+66O/IO15GintmDHsPaVWbCEI47MvPd8yEH3PFBr
	ASLiqfa2jWfJ0B/RV5mNOm0GcRWHz+2l3vaUOtyxVMNo1CgKmiv+qCtYALMKWq2vHEvfVp+oEBjuQ
	WvHFwm+iHc1U244FJhIxPRMMYvaIir5OsJI03vFKhEZNa53P1mngMq2ls0zvsNmfDjo1Hb3OCkkXv
	ABm5FbRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfXB-00000005Kq9-0KRc;
	Tue, 24 Nov 2026 01:41:25 +0000
Received: from mail-244106.protonmail.ch ([109.224.244.106])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfX7-00000005Kow-1Odb
	for ath11k@lists.infradead.org;
	Tue, 24 Nov 2026 01:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luixo.me;
	s=protonmail3; t=1795484473; x=1795743673;
	bh=AEPdrSonFnMm713LtxfgWTKetCF42gKUQZWQeqT3CgY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=siv+bPXCrGItXu0b6pT1jsAhikxBRCe3ht0Ytm1cQOWxxjFjdiIJ3rqEkyujKpYHT
	 EIEKXIEEZbOfmeyRh9pSq0Dr5hFz8LSz2fSGaClIX25YMGZs+FalW0oiWA14RUItPb
	 3uXLGv/AgDtcQ+eVilIf5a7TdoQgyGbh9AAMn8ViqKpNwYaiXsvupQtZHt0EOUhHLp
	 zYZyyNz+L31bQjXP1B1Ty7qrzY18V1rUfBIn8/SP8alvBzNLL4Yy6OIixS1x/xsq0S
	 qqMNX2rGuMv92puxRRATpzhEeUR3QzHvhhsE4eCZUY+N/f3pArs8HprGspHHf768ke
	 I6Af3RZyPjt9w==
X-Pm-Submission-Id: 4jYQWW34Yyz1DDL2
From: Alexey Immoreev <luixo-public@luixo.me>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	julius@bairaktaris.de
Subject: [RFC PATCH] wifi: ath11k: use coherent DMA for destination rings
Date: Tue, 24 Nov 2026 01:40:57 +0000
Message-ID: <20261124014057.491428-1-luixo-public@luixo.me>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_174122_400906_EC7F27BD 
X-CRM114-Status: GOOD (  10.75  )
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

ath11k zeroes cached REO destination and WBM release rings mapped as
DMA_FROM_DEVICE, then enables them without syncing them for the device.
The DMA API requires that initial sync and treats this DMA direction
as CPU read-only.

Use coherent DMA for allocation and free, and stop setting the cached
ring flag. Leave the unused cache code for a follow-up.

Keeping non-coherent cached rings would require DMA_BIDIRECTIONAL and a
device sync before enable. It would also require safe ownership at
cache-line granularity: two 32-byte WBM descriptors can share a 64-byte
line while the CPU owns one and hardware owns the other. Syncing one
descriptor at a time does not solve that. Coherent DMA avoids the
overlap but may cost CPU time where coherent mappings are uncached.

Signed-off-by: Alexey Immoreev <luixo-public@luixo.me>
---
Downstream IPQ5018 (RA82) testing saw three zero-status TX completions
with cached WBM rings and none with coherent WBM rings. The dp.c change
compiles on ARM32 and AArch64 with OpenWrt backports headers.

Patch 5/10 of https://patchwork.kernel.org/series/1219647/ changes
runtime CPU sync, not startup. This RFC disables the cached path that
the series optimizes. The performance impact is not yet measured.

OpenAI GPT-6.2 Sol drafted the patch and ran the host checks.
GPT-6.2 Astra independently reviewed the DMA issue.
I reviewed the email and patch and signed off on the contribution.

base-commit: 03b7c601b6e314115015a57061f5b377afe13190

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..f23c37370280 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -103,12 +103,8 @@
 	if (!ring->vaddr_unaligned)
 		return;
 
-	if (ring->cached)
-		dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_unaligned,
-				     ring->paddr_unaligned, DMA_FROM_DEVICE);
-	else
-		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
-				  ring->paddr_unaligned);
+	dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
+			  ring->paddr_unaligned);
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -226,7 +222,6 @@
 	int entry_sz = ath11k_hal_srng_get_entrysize(ab, type);
 	int max_entries = ath11k_hal_srng_get_max_entries(ab, type);
 	int ret;
-	bool cached = false;
 
 	if (max_entries < 0 || entry_sz < 0)
 		return -EINVAL;
@@ -236,27 +231,9 @@
 
 	ring->size = (num_entries * entry_sz) + HAL_RING_BASE_ALIGN - 1;
 
-	if (ab->hw_params.alloc_cacheable_memory) {
-		/* Allocate the reo dst and tx completion rings from cacheable memory */
-		switch (type) {
-		case HAL_REO_DST:
-		case HAL_WBM2SW_RELEASE:
-			cached = true;
-			break;
-		default:
-			cached = false;
-		}
-	}
-
-	if (cached)
-		ring->vaddr_unaligned = dma_alloc_noncoherent(ab->dev, ring->size,
-							      &ring->paddr_unaligned,
-							      DMA_FROM_DEVICE,
-							      GFP_KERNEL);
-	else
-		ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
-							   &ring->paddr_unaligned,
-							   GFP_KERNEL);
+	ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
+						   &ring->paddr_unaligned,
+						   GFP_KERNEL);
 
 	if (!ring->vaddr_unaligned)
 		return -ENOMEM;
@@ -318,11 +295,6 @@
 		return -EINVAL;
 	}
 
-	if (cached) {
-		params.flags |= HAL_SRNG_FLAGS_CACHED;
-		ring->cached = 1;
-	}
-
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
 		ath11k_dp_srng_cleanup(ab, ring);

