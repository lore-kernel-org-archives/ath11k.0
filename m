Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF256C3ABB6
	for <ath11k@archiver.kernel.org>; Tue,  6 May 2025 00:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI+64kDwf5DIHh/spo+LcllnsqLrFWSr3FrEdnZl+LM=; b=dx71AodenJKCt0sPWLKzvrh3v+
	5l1LucvmsvtsAU67obH8lqvuQgGg63aBsCk1GGhuZWILRQ4eDToBPpm4NAjJ3yLwaMYdZ/yetn998
	N8dsazAL/pDXGMeEzweKDNOMhOU3LF3ubSqRj05hAvOInsx3Vu4g/WN9tm5z+bnYdOPqJtTRZMB8f
	vdk6f9UxrNMb2uuTYHe9VhsP5HvUku7cU/Gu5NbtGp2CnMYksU/CD4gLnhPARot3lABi/jKanfgj/
	fEI1xzwqXCuIscLbP6YmtF/xhQ7krWfq0MYWw2Hv8wW4Srvgqd2ZoTuc2ROJeiafAdeZGhnT8E5fQ
	AUftp04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6LV-00000009Kpd-0ngf;
	Tue, 06 May 2025 00:39:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Ro-00000008oad-1eLC
	for ath11k@lists.infradead.org;
	Mon, 05 May 2025 22:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06A56A4CF5D;
	Mon,  5 May 2025 22:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5654BC4CEED;
	Mon,  5 May 2025 22:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484683;
	bh=EAlbQTAjFJWx6aUjVJSLAKFhQ/gdt87jR7K03p7CFu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVRXCb3zG4ZUNnmG5bvjzG2ramzOZlr8X0hcUHQ7bxStiTJfQZ4mCRxbnzHm3kZTz
	 dD9tKPI9GgpSbrjfR9AI0QxaYLHl1FsR633GuVEUoQPIIVBfoXK8CFpyQTur4tuRGW
	 HBcke8Qv576WfirGzLyEqBx9PIcmUxHdA3TS6b3mptqx/PZ10QEni60vsak48aNx6X
	 t/9LKHx/fGCSWmh2sYPc3dXfYy3icEtTADyepHKzYqSLJWEK1Q7VtT0photVQZFntx
	 +K58hPQu30O/B8lHONV5kygIDBWoRuad3T5Ras3PytoebhJ7+0SStP9Qeft+y0yCNS
	 Vlh404JxsJ05w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 604/642] wifi: ath11k: Use dma_alloc_noncoherent for rx_tid buffer allocation
Date: Mon,  5 May 2025 18:13:40 -0400
Message-Id: <20250505221419.2672473-604-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153804_568775_C9915AB7 
X-CRM114-Status: GOOD (  17.13  )
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

[ Upstream commit eeadc6baf8b3dcd32787cc84f0473dc2a2850370 ]

Currently, the driver allocates cacheable DMA buffers for the rx_tid
structure using kzalloc() and dma_map_single(). These buffers are
long-lived and can persist for the lifetime of the peer, which is not
advisable. Instead of using kzalloc() and dma_map_single() for allocating
cacheable DMA buffers, utilize the dma_alloc_noncoherent() helper for the
allocation of long-lived cacheable DMA buffers, such as the peer's rx_tid.
Since dma_alloc_noncoherent() returns unaligned physical and virtual
addresses, align them internally before use within the driver. This
ensures proper allocation of non-coherent memory through the kernel
helper.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Tested-by: Tim Harvey <tharvey@gateworks.com>
Link: https://patch.msgid.link/20250119164219.647059-3-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 117 +++++++++++-------------
 2 files changed, 58 insertions(+), 65 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index f777314db8b36..7a55afd33be82 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_DP_H
@@ -20,7 +20,6 @@ struct ath11k_ext_irq_grp;
 
 struct dp_rx_tid {
 	u8 tid;
-	u32 *vaddr;
 	dma_addr_t paddr;
 	u32 size;
 	u32 ba_win_sz;
@@ -37,6 +36,9 @@ struct dp_rx_tid {
 	/* Timer info related to fragments */
 	struct timer_list frag_timer;
 	struct ath11k_base *ab;
+	u32 *vaddr_unaligned;
+	dma_addr_t paddr_unaligned;
+	u32 unaligned_size;
 };
 
 #define DP_REO_DESC_FREE_THRESHOLD  64
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b8b3dce9cdb53..a7a484a9ba7fb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/ieee80211.h>
@@ -675,11 +675,11 @@ void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_base *ab)
 	list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
 		list_del(&cmd->list);
 		rx_tid = &cmd->data;
-		if (rx_tid->vaddr) {
-			dma_unmap_single(ab->dev, rx_tid->paddr,
-					 rx_tid->size, DMA_BIDIRECTIONAL);
-			kfree(rx_tid->vaddr);
-			rx_tid->vaddr = NULL;
+		if (rx_tid->vaddr_unaligned) {
+			dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
+					     rx_tid->vaddr_unaligned,
+					     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+			rx_tid->vaddr_unaligned = NULL;
 		}
 		kfree(cmd);
 	}
@@ -689,11 +689,11 @@ void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_base *ab)
 		list_del(&cmd_cache->list);
 		dp->reo_cmd_cache_flush_count--;
 		rx_tid = &cmd_cache->data;
-		if (rx_tid->vaddr) {
-			dma_unmap_single(ab->dev, rx_tid->paddr,
-					 rx_tid->size, DMA_BIDIRECTIONAL);
-			kfree(rx_tid->vaddr);
-			rx_tid->vaddr = NULL;
+		if (rx_tid->vaddr_unaligned) {
+			dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
+					     rx_tid->vaddr_unaligned,
+					     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+			rx_tid->vaddr_unaligned = NULL;
 		}
 		kfree(cmd_cache);
 	}
@@ -708,11 +708,11 @@ static void ath11k_dp_reo_cmd_free(struct ath11k_dp *dp, void *ctx,
 	if (status != HAL_REO_CMD_SUCCESS)
 		ath11k_warn(dp->ab, "failed to flush rx tid hw desc, tid %d status %d\n",
 			    rx_tid->tid, status);
-	if (rx_tid->vaddr) {
-		dma_unmap_single(dp->ab->dev, rx_tid->paddr, rx_tid->size,
-				 DMA_BIDIRECTIONAL);
-		kfree(rx_tid->vaddr);
-		rx_tid->vaddr = NULL;
+	if (rx_tid->vaddr_unaligned) {
+		dma_free_noncoherent(dp->ab->dev, rx_tid->unaligned_size,
+				     rx_tid->vaddr_unaligned,
+				     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+		rx_tid->vaddr_unaligned = NULL;
 	}
 }
 
@@ -749,10 +749,10 @@ static void ath11k_dp_reo_cache_flush(struct ath11k_base *ab,
 	if (ret) {
 		ath11k_err(ab, "failed to send HAL_REO_CMD_FLUSH_CACHE cmd, tid %d (%d)\n",
 			   rx_tid->tid, ret);
-		dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
-				 DMA_BIDIRECTIONAL);
-		kfree(rx_tid->vaddr);
-		rx_tid->vaddr = NULL;
+		dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
+				     rx_tid->vaddr_unaligned,
+				     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+		rx_tid->vaddr_unaligned = NULL;
 	}
 }
 
@@ -802,10 +802,10 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 
 	return;
 free_desc:
-	dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
-			 DMA_BIDIRECTIONAL);
-	kfree(rx_tid->vaddr);
-	rx_tid->vaddr = NULL;
+	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
+			     rx_tid->vaddr_unaligned,
+			     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+	rx_tid->vaddr_unaligned = NULL;
 }
 
 void ath11k_peer_rx_tid_delete(struct ath11k *ar,
@@ -831,14 +831,16 @@ void ath11k_peer_rx_tid_delete(struct ath11k *ar,
 		if (ret != -ESHUTDOWN)
 			ath11k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
 				   tid, ret);
-		dma_unmap_single(ar->ab->dev, rx_tid->paddr, rx_tid->size,
-				 DMA_BIDIRECTIONAL);
-		kfree(rx_tid->vaddr);
-		rx_tid->vaddr = NULL;
+		dma_free_noncoherent(ar->ab->dev, rx_tid->unaligned_size,
+				     rx_tid->vaddr_unaligned,
+				     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+		rx_tid->vaddr_unaligned = NULL;
 	}
 
 	rx_tid->paddr = 0;
+	rx_tid->paddr_unaligned = 0;
 	rx_tid->size = 0;
+	rx_tid->unaligned_size = 0;
 }
 
 static int ath11k_dp_rx_link_desc_return(struct ath11k_base *ab,
@@ -982,10 +984,9 @@ static void ath11k_dp_rx_tid_mem_free(struct ath11k_base *ab,
 	if (!rx_tid->active)
 		goto unlock_exit;
 
-	dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
-			 DMA_BIDIRECTIONAL);
-	kfree(rx_tid->vaddr);
-	rx_tid->vaddr = NULL;
+	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size, rx_tid->vaddr_unaligned,
+			     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
+	rx_tid->vaddr_unaligned = NULL;
 
 	rx_tid->active = false;
 
@@ -1000,9 +1001,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_peer *peer;
 	struct dp_rx_tid *rx_tid;
-	u32 hw_desc_sz;
-	u32 *addr_aligned;
-	void *vaddr;
+	u32 hw_desc_sz, *vaddr;
+	void *vaddr_unaligned;
 	dma_addr_t paddr;
 	int ret;
 
@@ -1050,49 +1050,40 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	else
 		hw_desc_sz = ath11k_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX, tid);
 
-	vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_ATOMIC);
-	if (!vaddr) {
+	rx_tid->unaligned_size = hw_desc_sz + HAL_LINK_DESC_ALIGN - 1;
+	vaddr_unaligned = dma_alloc_noncoherent(ab->dev, rx_tid->unaligned_size, &paddr,
+						DMA_BIDIRECTIONAL, GFP_ATOMIC);
+	if (!vaddr_unaligned) {
 		spin_unlock_bh(&ab->base_lock);
 		return -ENOMEM;
 	}
 
-	addr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
-
-	ath11k_hal_reo_qdesc_setup(addr_aligned, tid, ba_win_sz,
-				   ssn, pn_type);
-
-	paddr = dma_map_single(ab->dev, addr_aligned, hw_desc_sz,
-			       DMA_BIDIRECTIONAL);
-
-	ret = dma_mapping_error(ab->dev, paddr);
-	if (ret) {
-		spin_unlock_bh(&ab->base_lock);
-		ath11k_warn(ab, "failed to setup dma map for peer %pM rx tid %d: %d\n",
-			    peer_mac, tid, ret);
-		goto err_mem_free;
-	}
-
-	rx_tid->vaddr = vaddr;
-	rx_tid->paddr = paddr;
+	rx_tid->vaddr_unaligned = vaddr_unaligned;
+	vaddr = PTR_ALIGN(vaddr_unaligned, HAL_LINK_DESC_ALIGN);
+	rx_tid->paddr_unaligned = paddr;
+	rx_tid->paddr = rx_tid->paddr_unaligned + ((unsigned long)vaddr -
+			(unsigned long)rx_tid->vaddr_unaligned);
+	ath11k_hal_reo_qdesc_setup(vaddr, tid, ba_win_sz, ssn, pn_type);
 	rx_tid->size = hw_desc_sz;
 	rx_tid->active = true;
 
+	/* After dma_alloc_noncoherent, vaddr is being modified for reo qdesc setup.
+	 * Since these changes are not reflected in the device, driver now needs to
+	 * explicitly call dma_sync_single_for_device.
+	 */
+	dma_sync_single_for_device(ab->dev, rx_tid->paddr,
+				   rx_tid->size,
+				   DMA_TO_DEVICE);
 	spin_unlock_bh(&ab->base_lock);
 
-	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac,
-						     paddr, tid, 1, ba_win_sz);
+	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac, rx_tid->paddr,
+						     tid, 1, ba_win_sz);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to setup rx reorder queue for peer %pM tid %d: %d\n",
 			    peer_mac, tid, ret);
 		ath11k_dp_rx_tid_mem_free(ab, peer_mac, vdev_id, tid);
 	}
 
-	return ret;
-
-err_mem_free:
-	kfree(rx_tid->vaddr);
-	rx_tid->vaddr = NULL;
-
 	return ret;
 }
 
-- 
2.39.5


