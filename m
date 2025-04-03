Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6CC36014
	for <ath11k@archiver.kernel.org>; Thu,  3 Apr 2025 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YozHisuMr6gjHnr8exh36BbW3xlWTSyUP+ePugPhofk=; b=pV+5em3Az3IQnR3hDfYH2ntBEz
	nhOgNZeCpzzU073nOq01ExipsPIhU67OOG7vZfB+kHWyWVKA+bje654ULu3mcQsvs5Qm3OR0GMucF
	SQWFhkmPendLy9PmCMKRkbPmHftZB/uUZAPX5E0Utglk6knZ2G8luHxby9LADSr+fjNPGhKX/seit
	IG5zl9MUGB7Nh8ige1fSdoVImb81bDYHtjEnZBedyAV/f8xgS/UhTbTwcxG2EHr8GpVu4vZknMRlu
	BSBJcL4d5Runo4hxKvrpA1iJTpeG6dK0uIHCBbsQVeESSCKal2wJcRBriI/6EZlJghYrt53yh4lpd
	IXciCrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Py5-00000009fMu-0qfG;
	Thu, 03 Apr 2025 19:11:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pt3-00000009e4O-4Bu8
	for ath11k@lists.infradead.org;
	Thu, 03 Apr 2025 19:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2842044180;
	Thu,  3 Apr 2025 19:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9538FC4CEE3;
	Thu,  3 Apr 2025 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707161;
	bh=/t8vcH3qynDQfOLkw7QMZ8Gv/WuYDCcCpzwNN7E5DRU=;
	h=From:To:Cc:Subject:Date:From;
	b=UH9FRWjGu5ZwFHUb17PreHUrToRiNIhpdM3T8rDUoG/Ma/mnIL2Xq/SEmsA4GzYPL
	 2SFpe1H+2b9+ar734pC0bWtVPl+uriDxJNV4J/uq/hhCpK5eKXIQr0h3vFYRssJe0g
	 3lMw5rfum8T9pV5+YonSLUGqTCDtB9ulgwenHnuGJDrxwVgTUquLlqMm8VvBT3qECh
	 rPiNqUnHN2KCoJkqvCwurYQ2GQ5zlMB40sD/oAKl3xDQGUNUEgNWRdXD7rYs+/wxi7
	 w/Sl5YiP1FZLeQuJQCBgdpa2rxhKAC/i8ofGyv7FHV8ALPzdn4cp6Df/0NSDlyG/R1
	 VP9XIYX2HXgmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 01/47] wifi: ath11k: Fix DMA buffer allocation to resolve SWIOTLB issues
Date: Thu,  3 Apr 2025 15:05:09 -0400
Message-Id: <20250403190555.2677001-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120602_068712_AC3A3EE9 
X-CRM114-Status: GOOD (  12.02  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 1bcd20981834928ccc5d981aacb806bb523d8b29 ]

Currently, the driver allocates cacheable DMA buffers for rings like
HAL_REO_DST and HAL_WBM2SW_RELEASE. The buffers for HAL_WBM2SW_RELEASE
are large (1024 KiB), exceeding the SWIOTLB slot size of 256 KiB. This
leads to "swiotlb buffer is full" error messages on systems without an
IOMMU that use SWIOTLB, causing driver initialization failures. The driver
calls dma_map_single() with these large buffers obtained from kzalloc(),
resulting in ring initialization errors on systems without an IOMMU that
use SWIOTLB.

To address these issues, replace the flawed buffer allocation mechanism
with the appropriate DMA API. Specifically, use dma_alloc_noncoherent()
for cacheable DMA buffers, ensuring proper freeing of buffers with
dma_free_noncoherent().

Error log:
[   10.194343] ath11k_pci 0000:04:00.0: swiotlb buffer is full (sz:1048583 bytes), total 32768 (slots), used 2529 (slots)
[   10.194406] ath11k_pci 0000:04:00.0: failed to set up tcl_comp ring (0) :-12
[   10.194781] ath11k_pci 0000:04:00.0: failed to init DP: -12

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Reported-by: Tim Harvey <tharvey@gateworks.com>
Closes: https://lore.kernel.org/all/20241210041133.GA17116@lst.de/
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Tested-by: Tim Harvey <tharvey@gateworks.com>
Link: https://patch.msgid.link/20250119164219.647059-2-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index fbf666d0ecf1d..f124b7329e1ac 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <crypto/hash.h>
@@ -104,14 +104,12 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring)
 	if (!ring->vaddr_unaligned)
 		return;
 
-	if (ring->cached) {
-		dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->size,
-				 DMA_FROM_DEVICE);
-		kfree(ring->vaddr_unaligned);
-	} else {
+	if (ring->cached)
+		dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_unaligned,
+				     ring->paddr_unaligned, DMA_FROM_DEVICE);
+	else
 		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
 				  ring->paddr_unaligned);
-	}
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -249,25 +247,14 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		default:
 			cached = false;
 		}
-
-		if (cached) {
-			ring->vaddr_unaligned = kzalloc(ring->size, GFP_KERNEL);
-			if (!ring->vaddr_unaligned)
-				return -ENOMEM;
-
-			ring->paddr_unaligned = dma_map_single(ab->dev,
-							       ring->vaddr_unaligned,
-							       ring->size,
-							       DMA_FROM_DEVICE);
-			if (dma_mapping_error(ab->dev, ring->paddr_unaligned)) {
-				kfree(ring->vaddr_unaligned);
-				ring->vaddr_unaligned = NULL;
-				return -ENOMEM;
-			}
-		}
 	}
 
-	if (!cached)
+	if (cached)
+		ring->vaddr_unaligned = dma_alloc_noncoherent(ab->dev, ring->size,
+							      &ring->paddr_unaligned,
+							      DMA_FROM_DEVICE,
+							      GFP_KERNEL);
+	else
 		ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
 							   &ring->paddr_unaligned,
 							   GFP_KERNEL);
-- 
2.39.5


