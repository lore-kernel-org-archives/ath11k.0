Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQP3L-0002Wc-Mo
 for ath11k@lists.infradead.org; Tue, 14 May 2019 04:28:37 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2BDF6028D
 for <ath11k@lists.infradead.org>; Tue, 14 May 2019 04:28:33 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Merging v5.1
Date: Tue, 14 May 2019 07:28:31 +0300
Message-ID: <87k1etfymo.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Hi,

I'm planning today to merge v5.1 into ath11k-bringup. There's one API
change DMA allocations, patch below how I'm planning to fix that. If
there are any issues with this merge please let me know ASAP.

Kalle

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e5308def3..fa2c7d13b2f5 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -420,9 +420,9 @@ ath11k_ce_alloc_ring(struct ath11k_base *sc, int nentries, int desc_sz)
 	 * coherent DMA are unsupported
 	 */
 	ce_ring->base_addr_owner_space_unaligned =
-		dma_zalloc_coherent(sc->dev,
-				    nentries * desc_sz + CE_DESC_RING_ALIGN,
-				    &base_addr, GFP_KERNEL);
+		dma_alloc_coherent(sc->dev,
+				   nentries * desc_sz + CE_DESC_RING_ALIGN,
+				   &base_addr, GFP_KERNEL);
 	if (!ce_ring->base_addr_owner_space_unaligned) {
 		kfree(ce_ring);
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 2fddbef1b172..5d30fc231ab0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -103,9 +103,9 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		num_entries = max_entries;
 
 	ring->size = (num_entries * entry_sz) + HAL_RING_BASE_ALIGN - 1;
-	ring->vaddr_unaligned = dma_zalloc_coherent(ab->dev, ring->size,
-						    &ring->paddr_unaligned,
-						    GFP_KERNEL);
+	ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
+						   &ring->paddr_unaligned,
+						   GFP_KERNEL);
 	if (!ring->vaddr_unaligned)
 		return -ENOMEM;
 
@@ -353,10 +353,9 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 		return -EINVAL;
 
 	for (i = 0; i < num_scatter_buf; i++) {
-		slist[i].vaddr = dma_zalloc_coherent(
-					ab->dev,
-					HAL_WBM_IDLE_SCATTER_BUF_SIZE_MAX,
-					&slist[i].paddr, GFP_KERNEL);
+		slist[i].vaddr = dma_alloc_coherent(ab->dev,
+						    HAL_WBM_IDLE_SCATTER_BUF_SIZE_MAX,
+						    &slist[i].paddr, GFP_KERNEL);
 		if (!slist[i].vaddr) {
 			ret = -ENOMEM;
 			goto err;
@@ -436,10 +435,9 @@ static int ath11k_dp_link_desc_bank_alloc(struct ath11k_base *ab,
 		if (i == (n_link_desc_bank - 1) && last_bank_sz)
 			desc_sz = last_bank_sz;
 
-		desc_bank[i].vaddr_unaligned = dma_zalloc_coherent(
-						ab->dev, desc_sz,
-						&desc_bank[i].paddr_unaligned,
-						GFP_KERNEL);
+		desc_bank[i].vaddr_unaligned = dma_alloc_coherent(ab->dev, desc_sz,
+								  &desc_bank[i].paddr_unaligned,
+								  GFP_KERNEL);
 		if (!desc_bank[i].vaddr_unaligned) {
 			ret = -ENOMEM;
 			goto err;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
