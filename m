Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA27C4167B
	for <ath11k@archiver.kernel.org>; Wed,  6 Dec 2023 02:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHKQqyZy+g524fgsbEY/VwWQxSo6h1c/KOycwt/arPo=; b=CFxoYGqpoef+SeYlWWIab/hRAF
	s/XDZ9kmQH9WkJGqitFXPLEfU8g5cqJJdaAUa1j91YP1JbcDREdZNmi/iKNovVgWi38nbNmMdcuh2
	C/+lRLx8/FFuAY5qV7PhHHPBnFyj3vwijVqnqRtFsEgNKHbpl1cSldV9PMByA6qk7AS48kHbFzge5
	qvod2gOBjq+ZUe79HRWlGMbao6ee90mdo1sJ45nuGKljAgAh+09Cyak9svfIBWltkqzuKptAUS7Qr
	9RGVB+D7X/oKlxV1N6Q6ebpZU/GSXqQ+HSr4YvZbSUW5JY2Qq0aqxkzEhSF9qN79q/AccDC2+EJus
	scOntsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhtA-008uKN-2c;
	Wed, 06 Dec 2023 02:43:52 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAht7-008uJh-2c
	for ath11k@lists.infradead.org;
	Wed, 06 Dec 2023 02:43:51 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-67a8a745c43so3667046d6.0
        for <ath11k@lists.infradead.org>; Tue, 05 Dec 2023 18:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701830625; x=1702435425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHKQqyZy+g524fgsbEY/VwWQxSo6h1c/KOycwt/arPo=;
        b=h6aDy1DihnTuaZDbmphBumWIob//VX4SXUOU1yd2wvdbOgPp4l7v+QHc3ZNcOPNSR6
         S+qnGN6xKv4fe4JftYRkCZ7WrrcGRT17VzbNJuADX0yQ/AxU4HcJcRpQrC9KaJM9iUlv
         tDcILLLdedITBaCBRwAisvDGy/e14meaDJ8YP4Jo1xxSZYGc/oVwvnfrQbg8AqLvtv2S
         ocjWofKQKpTubG3WYprFKkr8UXRC/EeL8c1wQoI4CWM4lALEhaDsmna5/CSD7KgVc2UK
         VGr043flEPCVGpGG3VZry9Oz/7VIECD5vaICRV/7cJb3oXqrZdNWWahXfrvdZjDCj+tt
         U11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701830625; x=1702435425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHKQqyZy+g524fgsbEY/VwWQxSo6h1c/KOycwt/arPo=;
        b=tk2HISeqCVjXMvXblbfkMlLmUnaa2adDZ0mUW/6IQdWZuYbmBTkAHR1n62j/+zIACj
         zro80fHBPIjHVRpAZXCk8MMnMTBSZ4sQUCGTE6JHhvLVWHtKwuKrBevJHN0J4FozSWP6
         +Kje8PAgyJIi1bxGvMGOchl6XTz4EG7ojLeBQtW5v2lMSkyXgVaGk+Xvu6u/NAmh4DvP
         8VjxByKz9azp37ctmT+IaNRXFNuMN4UT2w3Fvkby3YvALzrtPH28GQR0korO6nwNl+0L
         3VnNXSpukwV4ywS/263cRTGPqcz4j/40D1i1CRnxdGfmkh+ntZW7klR5H1892tINFQkm
         9BBA==
X-Gm-Message-State: AOJu0Yy/eT9EsuBLAOyrk/XwAxtYPftW8xZgSr6Chh8bfuT8+boLBeTb
	qXykyau1zVNTW4JR5FkW29FNrqnjrTCXi7Uv
X-Google-Smtp-Source: AGHT+IGIaQYxmKovTvb6RA2ApPZOvr488kuKkXz5uSLu+X8THLgukkQscvjv1FJ0krvV6wp3T+2a4g==
X-Received: by 2002:a05:6214:f2c:b0:67a:a532:d33a with SMTP id iw12-20020a0562140f2c00b0067aa532d33amr4168215qvb.0.1701830625143;
        Tue, 05 Dec 2023 18:43:45 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9850:b60:48c0:d784:7e4c:676])
        by smtp.gmail.com with ESMTPSA id b16-20020a0ccd10000000b0067acbd864e0sm2015561qvm.69.2023.12.05.18.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 18:43:42 -0800 (PST)
From: Zhenghao Gu <imguzh@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Zhenghao Gu <imguzh@gmail.com>
Subject: [PATCH] wifi: ath11k: fix IOMMU errors on buffer rings
Date: Tue,  5 Dec 2023 20:43:25 -0600
Message-ID: <20231206024325.27283-1-imguzh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_184349_851002_B01F088D 
X-CRM114-Status: GOOD (  12.77  )
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

virt_to_phys doesn't work on systems with IOMMU enabled,
which have non-identity physical-to-IOVA mappings.
It leads to IO_PAGE_FAULTs like this:
[IO_PAGE_FAULT domain=0x0023 address=0x1cce00000 flags=0x0020]
and no link can be established.

This patch changes that to dma_map_single(), which works correctly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Signed-off-by: Zhenghao Gu <imguzh@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp.c  | 19 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal.c | 20 ++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hal.h |  2 ++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index d070bcb3f..c74230e4c 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -104,11 +104,14 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring)
 	if (!ring->vaddr_unaligned)
 		return;
 
-	if (ring->cached)
+	if (ring->cached) {
+		dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->size,
+				 DMA_FROM_DEVICE);
 		kfree(ring->vaddr_unaligned);
-	else
+	} else {
 		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
 				  ring->paddr_unaligned);
+	}
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -249,7 +252,17 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 
 		if (cached) {
 			ring->vaddr_unaligned = kzalloc(ring->size, GFP_KERNEL);
-			ring->paddr_unaligned = virt_to_phys(ring->vaddr_unaligned);
+			if (!ring->vaddr_unaligned)
+				return -ENOMEM;
+
+			ring->paddr_unaligned =
+				dma_map_single(ab->dev, ring->vaddr_unaligned,
+					       ring->size, DMA_FROM_DEVICE);
+			if (dma_mapping_error(ab->dev, ring->paddr_unaligned)) {
+				kfree(ring->vaddr_unaligned);
+				ring->vaddr_unaligned = NULL;
+				return -ENOMEM;
+			}
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 0a99aa7dd..bd4cccdba 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -628,15 +628,31 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
+u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
+				       struct hal_srng *srng, dma_addr_t *paddr)
+{
+	lockdep_assert_held(&srng->lock);
+
+	if (srng->u.dst_ring.tp != srng->u.dst_ring.cached_hp) {
+		*paddr = (srng->ring_base_paddr +
+			  sizeof(*srng->ring_base_vaddr) * srng->u.dst_ring.tp);
+		return (srng->ring_base_vaddr + srng->u.dst_ring.tp);
+	}
+
+	return NULL;
+}
+
 static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
 					  struct hal_srng *srng)
 {
 	u32 *desc;
+	dma_addr_t desc_paddr;
+
 
 	/* prefetch only if desc is available */
-	desc = ath11k_hal_srng_dst_peek(ab, srng);
+	desc = ath11k_hal_srng_dst_peek_with_dma(ab, srng, &desc_paddr);
 	if (likely(desc)) {
-		dma_sync_single_for_cpu(ab->dev, virt_to_phys(desc),
+		dma_sync_single_for_cpu(ab->dev, desc_paddr,
 					(srng->entry_size * sizeof(u32)),
 					DMA_FROM_DEVICE);
 		prefetch(desc);
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 1942d41d6..facaf8fe0 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -943,6 +943,8 @@ void ath11k_hal_srng_get_params(struct ath11k_base *ab, struct hal_srng *srng,
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng);
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
+u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
+				       struct hal_srng *srng, dma_addr_t *paddr);
 int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
 u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);

