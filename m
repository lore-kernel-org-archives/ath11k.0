Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CDCC4167D
	for <ath11k@archiver.kernel.org>; Tue, 12 Dec 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xAckxPqjIrdFZFrGXJnExxD4gp1JEUGn4xQyRliaGg0=; b=VAunT0K/ytom2Lp+UKow9hRnP4
	XcAZS536VZ9ddn5RWEt20ieL7L8RlLWhYDbT5ZHY/eY44Nk0Vw0DOtr7f7KAe9iPzZKCriruCV4Jl
	CudpwR+lOCxpsxegYpEWjHMf5O56Z9H6qP4TkpJGSYEGjdkCQCyl8aZawLDqQm57dxyd3RlmxWF8t
	RLC3VbvQPJWICXYs3zqjiuV/GmbtS/hcv8rBVlGgPdjzQQPaoKD/yrJru0zE5kp6TKTYnnPBXqCsm
	kNIaHBhFaEugJs/sTs9/JLIwOG5WYY/M7snFvry/RvNRsnRzfxBxlwXBjD+0BZwFG0cHXIoozDZZF
	0pHIV1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtIu-00AcFO-2z;
	Tue, 12 Dec 2023 03:19:28 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtIr-00AcD1-2W
	for ath11k@lists.infradead.org;
	Tue, 12 Dec 2023 03:19:27 +0000
Received: by mail-qt1-x843.google.com with SMTP id d75a77b69052e-4258026a9fdso32709981cf.0
        for <ath11k@lists.infradead.org>; Mon, 11 Dec 2023 19:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702351161; x=1702955961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAckxPqjIrdFZFrGXJnExxD4gp1JEUGn4xQyRliaGg0=;
        b=aejol9l3EzmCWYrsZwK7710/zKf2jD9+c31siO6Rhd1cdLuN6VXhkYLuEx5mVeUQI7
         UVFIrhWQTZcGF+5OabeHqVgnQ1UvUWY8Jku29QvyOTk0dG70j1jf15yyVlWNpaEFHLdC
         +O3Qr3UgLa6OnZOmrxlcE8rLkXLjKcs8QxOjxKSHHozWVOkzEbbzJDNYJUgzR7mtfIMJ
         aCkIRJgnsT6m5kWRONU3HfdhjrYvjXCvw27zgpO14BKMRMj3Dxh2rDKS50Op9TONwFL5
         y/RvcAtE5+p2H2YFT17OKZqV8gE104bNeEpoCFXdJ6s2iO81Nd3zKc5rh8MKCuxtEfi7
         nmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702351161; x=1702955961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAckxPqjIrdFZFrGXJnExxD4gp1JEUGn4xQyRliaGg0=;
        b=TOY4MsoX7ynf96Dshv50HsT6po10eqX+udLQzHBNJBf0cySigWqOWC8+AGYCmsZXt7
         SL9qrYdLzraHKhq9+XzizBS1fAC/3ntcV/nYnN3mfTO8+SCS4c85l1Fmu1lQxaIpePB3
         MYZQOiIkZ/yY1Febmt/p32Nlfq6MD0sEZX3axdNj5QfV6mvjgGaQQDfSKLcw3cayTfnR
         8hfqBM24jhdatPSLdIe79vc675ekatAS03V9wNDj28Svo3ELFEdx7yG2FDvcNqJyQPtC
         57LrogzbjMs02prW9ZoVEELG3uaZcM5HrDJSy8mC5QXPURS15kdWiGQfXHQ4PlNT9aR5
         3upg==
X-Gm-Message-State: AOJu0Yylfo6hi0q8mrmCa6xFASQrLe2y0xxtvKDoM6CePDoobdZYBv9a
	vUh0Pmk3sEdDAzCWR0ahoPDTGcJygEQ8Ew==
X-Google-Smtp-Source: AGHT+IH2q+mXo52zkWaMEIyKZ41K8oBqKAXUH+p2t4Gqqye4TNl89owV8H1G3ZaaebJiYU4Vd0DB6w==
X-Received: by 2002:a05:622a:54c:b0:425:8856:36e with SMTP id m12-20020a05622a054c00b004258856036emr7282988qtx.124.1702351160730;
        Mon, 11 Dec 2023 19:19:20 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9850:b60:6f2b:256b:f6ec:b44b])
        by smtp.gmail.com with ESMTPSA id ca25-20020a05622a1f1900b004259ba7bc08sm3688769qtb.42.2023.12.11.19.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 19:19:20 -0800 (PST)
From: Zhenghao Gu <imguzh@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Zhenghao Gu <imguzh@gmail.com>
Subject: [PATCH v2] wifi: ath11k: fix IOMMU errors on buffer rings
Date: Mon, 11 Dec 2023 21:19:14 -0600
Message-ID: <20231212031914.47339-1-imguzh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_191925_833312_5F4E3E81 
X-CRM114-Status: GOOD (  12.74  )
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
Changes in v2:
- ath11k_hal_srng_dst_peek_with_dma() is made static
---
 drivers/net/wireless/ath/ath11k/dp.c  | 19 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal.c | 20 ++++++++++++++++++--
 2 files changed, 34 insertions(+), 5 deletions(-)

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
index 0a99aa7dd..7e4a8c820 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -628,15 +628,31 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
+static u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
+					      struct hal_srng *srng, dma_addr_t *paddr)
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

