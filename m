Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4Z-00082a-35
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:17 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 02/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 ce.c
Date: Thu,  8 Aug 2019 18:32:59 +0530
Message-Id: <1565269392-2838-3-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in ce.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 96 ++++++++++++++--------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 626e7d264a63..4ac65a16d72f 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -111,7 +111,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
 static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 					 struct sk_buff *skb, dma_addr_t paddr)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct ath11k_ce_ring *ring = pipe->dest_ring;
 	struct hal_srng *srng;
 	unsigned int write_index;
@@ -164,7 +164,7 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 
 static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 {
-	struct ath11k_base *sc = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct sk_buff *skb;
 	dma_addr_t paddr;
 	int ret = 0;
@@ -172,7 +172,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 	if (!(pipe->dest_ring || pipe->status_ring))
 		return 0;
 
-	spin_lock_bh(&sc->ce.ce_lock);
+	spin_lock_bh(&ab->ce.ce_lock);
 	while (pipe->rx_buf_needed) {
 		skb = dev_alloc_skb(pipe->buf_sz);
 		if (!skb) {
@@ -182,11 +182,11 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 
 		WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
 
-		paddr = dma_map_single(sc->dev, skb->data,
+		paddr = dma_map_single(ab->dev, skb->data,
 				       skb->len + skb_tailroom(skb),
 				       DMA_FROM_DEVICE);
-		if (unlikely(dma_mapping_error(sc->dev, paddr))) {
-			ath11k_warn(sc, "failed to dma map ce rx buf\n");
+		if (unlikely(dma_mapping_error(ab->dev, paddr))) {
+			ath11k_warn(ab, "failed to dma map ce rx buf\n");
 			dev_kfree_skb_any(skb);
 			ret = -EIO;
 			goto exit;
@@ -197,8 +197,8 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 		ret = ath11k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
 
 		if (ret) {
-			ath11k_warn(sc, "failed to enqueue rx buf: %d\n", ret);
-			dma_unmap_single(sc->dev, paddr,
+			ath11k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
+			dma_unmap_single(ab->dev, paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_FROM_DEVICE);
 			dev_kfree_skb_any(skb);
@@ -207,14 +207,14 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 	}
 
 exit:
-	spin_unlock_bh(&sc->ce.ce_lock);
+	spin_unlock_bh(&ab->ce.ce_lock);
 	return ret;
 }
 
 static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 					 struct sk_buff **context, int *nbytes)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct hal_srng *srng;
 	unsigned int sw_index;
 	unsigned int nentries_mask;
@@ -263,7 +263,7 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 
 static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct sk_buff *skb;
 	struct sk_buff_head list;
 	unsigned int nbytes, max_nbytes;
@@ -304,7 +304,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
 					 struct sk_buff **transfer_contextp)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct hal_srng *srng;
 	unsigned int sw_index;
 	unsigned int nentries_mask;
@@ -345,7 +345,7 @@ static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
 
 static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct sk_buff *skb;
 
 	while (ath11k_ce_completed_send_next(pipe, &skb) == 0) {
@@ -358,7 +358,7 @@ static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
 	}
 }
 
-static int ath11k_ce_init_ring(struct ath11k_base *sc,
+static int ath11k_ce_init_ring(struct ath11k_base *ab,
 			       struct ath11k_ce_ring *ce_ring,
 			       int ce_id, enum hal_ring_type type)
 {
@@ -389,15 +389,15 @@ static int ath11k_ce_init_ring(struct ath11k_base *sc,
 		}
 		break;
 	default:
-		ath11k_warn(sc, "Invalid CE ring type %d\n", type);
+		ath11k_warn(ab, "Invalid CE ring type %d\n", type);
 		return -EINVAL;
 	}
 
 	/* TODO: Init other params needed by HAL to init the ring */
 
-	ret = ath11k_hal_srng_setup(sc, type, ce_id, 0, &params);
+	ret = ath11k_hal_srng_setup(ab, type, ce_id, 0, &params);
 	if (ret < 0) {
-		ath11k_warn(sc, "failed to setup srng: %d ring_id %d\n",
+		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
 			    ret, ce_id);
 		return ret;
 	}
@@ -407,7 +407,7 @@ static int ath11k_ce_init_ring(struct ath11k_base *sc,
 }
 
 static struct ath11k_ce_ring *
-ath11k_ce_alloc_ring(struct ath11k_base *sc, int nentries, int desc_sz)
+ath11k_ce_alloc_ring(struct ath11k_base *ab, int nentries, int desc_sz)
 {
 	struct ath11k_ce_ring *ce_ring;
 	dma_addr_t base_addr;
@@ -426,7 +426,7 @@ ath11k_ce_alloc_ring(struct ath11k_base *sc, int nentries, int desc_sz)
 	 * coherent DMA are unsupported
 	 */
 	ce_ring->base_addr_owner_space_unaligned =
-		dma_alloc_coherent(sc->dev,
+		dma_alloc_coherent(ab->dev,
 				   nentries * desc_sz + CE_DESC_RING_ALIGN,
 				   &base_addr, GFP_KERNEL);
 	if (!ce_ring->base_addr_owner_space_unaligned) {
@@ -446,9 +446,9 @@ ath11k_ce_alloc_ring(struct ath11k_base *sc, int nentries, int desc_sz)
 	return ce_ring;
 }
 
-static int ath11k_ce_alloc_pipe(struct ath11k_base *sc, int ce_id)
+static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 {
-	struct ath11k_ce_pipe *pipe = &sc->ce.ce_pipe[ce_id];
+	struct ath11k_ce_pipe *pipe = &ab->ce.ce_pipe[ce_id];
 	const struct ce_attr *attr = &host_ce_config_wlan[ce_id];
 	int nentries;
 	int desc_sz;
@@ -459,7 +459,7 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *sc, int ce_id)
 		pipe->send_cb = ath11k_ce_send_done_cb;
 		nentries = roundup_pow_of_two(attr->src_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
-		pipe->src_ring = ath11k_ce_alloc_ring(sc, nentries, desc_sz);
+		pipe->src_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
 		if (!pipe->src_ring)
 			return -ENOMEM;
 	}
@@ -468,13 +468,13 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *sc, int ce_id)
 		pipe->recv_cb = attr->recv_cb;
 		nentries = roundup_pow_of_two(attr->dest_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
-		pipe->dest_ring = ath11k_ce_alloc_ring(sc, nentries, desc_sz);
+		pipe->dest_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
 
 		if (!pipe->dest_ring)
 			return -ENOMEM;
 
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST_STATUS);
-		pipe->status_ring = ath11k_ce_alloc_ring(sc, nentries, desc_sz);
+		pipe->status_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
 		if (!pipe->status_ring)
 			return -ENOMEM;
 	}
@@ -590,7 +590,7 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 
 static void ath11k_ce_rx_pipe_cleanup(struct ath11k_ce_pipe *pipe)
 {
-	struct ath11k_base *ab = pipe->sc;
+	struct ath11k_base *ab = pipe->ab;
 	struct ath11k_ce_ring *ring = pipe->dest_ring;
 	struct sk_buff *skb;
 	int i;
@@ -626,22 +626,22 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 	}
 }
 
-void ath11k_ce_rx_post_buf(struct ath11k_base *sc)
+void ath11k_ce_rx_post_buf(struct ath11k_base *ab)
 {
 	struct ath11k_ce_pipe *pipe;
 	int i;
 	int ret;
 
 	for (i = 0; i < CE_COUNT; i++) {
-		pipe = &sc->ce.ce_pipe[i];
+		pipe = &ab->ce.ce_pipe[i];
 		ret = ath11k_ce_rx_post_pipe(pipe);
 		if (ret) {
 			if (ret == -ENOSPC)
 				continue;
 
-			ath11k_warn(sc, "failed to post rx buf to pipe: %d err: %d\n",
+			ath11k_warn(ab, "failed to post rx buf to pipe: %d err: %d\n",
 				    i, ret);
-			mod_timer(&sc->rx_replenish_retry,
+			mod_timer(&ab->rx_replenish_retry,
 				  jiffies + ATH11K_CE_RX_POST_RETRY_JIFFIES);
 
 			return;
@@ -656,20 +656,20 @@ void ath11k_ce_rx_replenish_retry(struct timer_list *t)
 	ath11k_ce_rx_post_buf(ab);
 }
 
-int ath11k_ce_init_pipes(struct ath11k_base *sc)
+int ath11k_ce_init_pipes(struct ath11k_base *ab)
 {
 	struct ath11k_ce_pipe *pipe;
 	int i;
 	int ret;
 
 	for (i = 0; i < CE_COUNT; i++) {
-		pipe = &sc->ce.ce_pipe[i];
+		pipe = &ab->ce.ce_pipe[i];
 
 		if (pipe->src_ring) {
-			ret = ath11k_ce_init_ring(sc, pipe->src_ring, i,
+			ret = ath11k_ce_init_ring(ab, pipe->src_ring, i,
 						  HAL_CE_SRC);
 			if (ret) {
-				ath11k_warn(sc, "failed to init src ring: %d\n",
+				ath11k_warn(ab, "failed to init src ring: %d\n",
 					    ret);
 				/* Should we clear any partial init */
 				return ret;
@@ -680,10 +680,10 @@ int ath11k_ce_init_pipes(struct ath11k_base *sc)
 		}
 
 		if (pipe->dest_ring) {
-			ret = ath11k_ce_init_ring(sc, pipe->dest_ring, i,
+			ret = ath11k_ce_init_ring(ab, pipe->dest_ring, i,
 						  HAL_CE_DST);
 			if (ret) {
-				ath11k_warn(sc, "failed to init dest ring: %d\n",
+				ath11k_warn(ab, "failed to init dest ring: %d\n",
 					    ret);
 				/* Should we clear any partial init */
 				return ret;
@@ -697,10 +697,10 @@ int ath11k_ce_init_pipes(struct ath11k_base *sc)
 		}
 
 		if (pipe->status_ring) {
-			ret = ath11k_ce_init_ring(sc, pipe->status_ring, i,
+			ret = ath11k_ce_init_ring(ab, pipe->status_ring, i,
 						  HAL_CE_DST_STATUS);
 			if (ret) {
-				ath11k_warn(sc, "failed to init dest status ing: %d\n",
+				ath11k_warn(ab, "failed to init dest status ing: %d\n",
 					    ret);
 				/* Should we clear any partial init */
 				return ret;
@@ -714,18 +714,18 @@ int ath11k_ce_init_pipes(struct ath11k_base *sc)
 	return 0;
 }
 
-void ath11k_ce_free_pipes(struct ath11k_base *sc)
+void ath11k_ce_free_pipes(struct ath11k_base *ab)
 {
 	struct ath11k_ce_pipe *pipe;
 	int desc_sz;
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++) {
-		pipe = &sc->ce.ce_pipe[i];
+		pipe = &ab->ce.ce_pipe[i];
 
 		if (pipe->src_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
-			dma_free_coherent(sc->dev,
+			dma_free_coherent(ab->dev,
 					  pipe->src_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
 					  pipe->src_ring->base_addr_owner_space,
@@ -736,7 +736,7 @@ void ath11k_ce_free_pipes(struct ath11k_base *sc)
 
 		if (pipe->dest_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
-			dma_free_coherent(sc->dev,
+			dma_free_coherent(ab->dev,
 					  pipe->dest_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
 					  pipe->dest_ring->base_addr_owner_space,
@@ -748,7 +748,7 @@ void ath11k_ce_free_pipes(struct ath11k_base *sc)
 		if (pipe->status_ring) {
 			desc_sz =
 			  ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST_STATUS);
-			dma_free_coherent(sc->dev,
+			dma_free_coherent(ab->dev,
 					  pipe->status_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
 					  pipe->status_ring->base_addr_owner_space,
@@ -759,26 +759,26 @@ void ath11k_ce_free_pipes(struct ath11k_base *sc)
 	}
 }
 
-int ath11k_ce_alloc_pipes(struct ath11k_base *sc)
+int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 {
 	struct ath11k_ce_pipe *pipe;
 	int i;
 	int ret;
 	const struct ce_attr *attr;
 
-	spin_lock_init(&sc->ce.ce_lock);
+	spin_lock_init(&ab->ce.ce_lock);
 
 	for (i = 0; i < CE_COUNT; i++) {
 		attr = &host_ce_config_wlan[i];
-		pipe = &sc->ce.ce_pipe[i];
+		pipe = &ab->ce.ce_pipe[i];
 		pipe->pipe_num = i;
-		pipe->sc = sc;
+		pipe->ab = ab;
 		pipe->buf_sz = attr->src_sz_max;
 
-		ret = ath11k_ce_alloc_pipe(sc, i);
+		ret = ath11k_ce_alloc_pipe(ab, i);
 		if (ret) {
 			/* Free any parial successful allocation */
-			ath11k_ce_free_pipes(sc);
+			ath11k_ce_free_pipes(ab);
 			return ret;
 		}
 	}
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
