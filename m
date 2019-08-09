Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1A3-0000ar-QF
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:13 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D4CA9602B7
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:09 +0000 (UTC)
Subject: [PATCH 01/15] ath11k: rename per_transfer_context to skb
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:07 +0300
Message-ID: <156534276745.30736.11736417077894270794.stgit@x230>
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

Rename the field to skb to make it more clear what it contains. While at it,
change also two function parameters to use skb instead context.

No functional changes. Only compile tested.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c |   24 +++++++++++-------------
 drivers/net/wireless/ath/ath11k/ce.h |    2 +-
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 4ac65a16d72f..c1b170cf45ba 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -142,7 +142,7 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 
 	ath11k_hal_ce_dst_set_desc(desc, paddr);
 
-	ring->per_transfer_context[write_index] = skb;
+	ring->skb[write_index] = skb;
 	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
 	ring->write_index = write_index;
 
@@ -212,7 +212,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 }
 
 static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
-					 struct sk_buff **context, int *nbytes)
+					 struct sk_buff **skb, int *nbytes)
 {
 	struct ath11k_base *ab = pipe->ab;
 	struct hal_srng *srng;
@@ -244,8 +244,8 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 		goto err;
 	}
 
-	*context = pipe->dest_ring->per_transfer_context[sw_index];
-	pipe->dest_ring->per_transfer_context[sw_index] = NULL;
+	*skb = pipe->dest_ring->skb[sw_index];
+	pipe->dest_ring->skb[sw_index] = NULL;
 
 	sw_index = CE_RING_IDX_INCR(nentries_mask, sw_index);
 	pipe->dest_ring->sw_index = sw_index;
@@ -302,7 +302,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 }
 
 static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
-					 struct sk_buff **transfer_contextp)
+					 struct sk_buff **skb)
 {
 	struct ath11k_base *ab = pipe->ab;
 	struct hal_srng *srng;
@@ -328,9 +328,9 @@ static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
 		goto err_unlock;
 	}
 
-	*transfer_contextp = pipe->src_ring->per_transfer_context[sw_index];
+	*skb = pipe->src_ring->skb[sw_index];
 
-	pipe->src_ring->per_transfer_context[sw_index] = NULL;
+	pipe->src_ring->skb[sw_index] = NULL;
 
 	sw_index = CE_RING_IDX_INCR(nentries_mask, sw_index);
 	pipe->src_ring->sw_index = sw_index;
@@ -412,9 +412,7 @@ ath11k_ce_alloc_ring(struct ath11k_base *ab, int nentries, int desc_sz)
 	struct ath11k_ce_ring *ce_ring;
 	dma_addr_t base_addr;
 
-	ce_ring = kzalloc(sizeof(*ce_ring) +
-			  (nentries *
-			   sizeof(*ce_ring->per_transfer_context)),
+	ce_ring = kzalloc(sizeof(*ce_ring) + (nentries * sizeof(*ce_ring->skb)),
 			  GFP_KERNEL);
 	if (ce_ring == NULL)
 		return ERR_PTR(-ENOMEM);
@@ -568,7 +566,7 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 	ath11k_hal_ce_src_set_desc(desc, ATH11K_SKB_CB(skb)->paddr,
 				   skb->len, transfer_id, byte_swap_data);
 
-	pipe->src_ring->per_transfer_context[write_index] = skb;
+	pipe->src_ring->skb[write_index] = skb;
 	pipe->src_ring->write_index = CE_RING_IDX_INCR(nentries_mask,
 						       write_index);
 
@@ -599,11 +597,11 @@ static void ath11k_ce_rx_pipe_cleanup(struct ath11k_ce_pipe *pipe)
 		return;
 
 	for (i = 0; i < ring->nentries; i++) {
-		skb = ring->per_transfer_context[i];
+		skb = ring->skb[i];
 		if (!skb)
 			continue;
 
-		ring->per_transfer_context[i] = NULL;
+		ring->skb[i] = NULL;
 		dma_unmap_single(ab->dev, ATH11K_SKB_RXCB(skb)->paddr,
 				 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
 		dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 5cc3fea55e0f..40926d06463e 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -139,7 +139,7 @@ struct ath11k_ce_ring {
 	u32 hal_ring_id;
 
 	/* keep last */
-	struct sk_buff *per_transfer_context[0];
+	struct sk_buff *skb[0];
 };
 
 struct ath11k_ce_pipe {


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
