Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ9qH-0007y6-54
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 04:49:10 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Make the tx_status_fifo for each Tx completion ring
Date: Wed, 24 Apr 2019 10:18:20 +0530
Message-Id: <1556081300-12538-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

tx_statu_fifo is allocated with DP_TX_COMP_RING_SIZE and used
by three Tx completion ring, which get full when we start
Tx with different AC packets. To avoid this resource error,
Make the tx_status_fifo for each tx completion ring with
DP_TX_COMP_RING_SIZE, so that Tx path will not encounter
the resource full error.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 22 ++++++++++++----------
 drivers/net/wireless/ath/ath11k/dp.h    | 10 +++++-----
 drivers/net/wireless/ath/ath11k/dp_tx.c | 19 +++++++++----------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 127eb56..5a7b480 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -820,9 +820,11 @@ void ath11k_dp_free(struct ath11k_base *sc)
 			     ath11k_dp_tx_pending_cleanup, sc);
 		idr_destroy(&dp->tx_ring[i].txbuf_idr);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
-	}
 
-	kfifo_free(&dp->tx_status_fifo);
+		spin_lock_bh(&dp->tx_ring[i].tx_status_lock);
+		kfifo_free(&dp->tx_ring[i].tx_status_fifo);
+		spin_unlock_bh(&dp->tx_ring[i].tx_status_lock);
+	}
 
 	/* Deinit any SOC level resource */
 }
@@ -850,19 +852,19 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
 	if (ret)
 		goto fail_link_desc_cleanup;
 
+	size = roundup_pow_of_two(DP_TX_COMP_RING_SIZE);
+
 	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
-	}
 
-	size = roundup_pow_of_two(DP_TX_COMP_RING_SIZE);
-
-	spin_lock_init(&dp->tx_status_lock);
-	ret = kfifo_alloc(&dp->tx_status_fifo, size,
-			  GFP_KERNEL);
-	if (ret)
-		goto fail_cmn_srng_cleanup;
+		spin_lock_init(&dp->tx_ring[i].tx_status_lock);
+		ret = kfifo_alloc(&dp->tx_ring[i].tx_status_fifo, size,
+				  GFP_KERNEL);
+		if (ret)
+			goto fail_cmn_srng_cleanup;
+	}
 
 	for (i = 0; i < HAL_DSCP_TID_MAP_TBL_NUM_ENTRIES_MAX; i++)
 		ath11k_hal_tx_set_dscp_tid_map(sc, i);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5674053..efdfb5f 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -65,6 +65,11 @@ struct dp_tx_ring {
 	u32 num_tx_pending;
 	/* Protects txbuf_idr and num_pending */
 	spinlock_t tx_idr_lock;
+	DECLARE_KFIFO_PTR(tx_status_fifo, struct hal_wbm_release_ring);
+	/* lock to protect tx_status_fifo because tx_status_fifo can be
+	 * accessed concurrently.
+	 */
+	spinlock_t tx_status_lock;
 };
 
 struct ath11k_pdev_dp {
@@ -158,11 +163,6 @@ struct ath11k_dp {
 	struct list_head reo_cmd_cache_flush_list;
 	/* protects access to reo_cmd_list and reo_cmd_cache_flush_list */
 	spinlock_t reo_cmd_lock;
-	DECLARE_KFIFO_PTR(tx_status_fifo, struct hal_wbm_release_ring);
-	/* lock to protect tx_status_fifo because tx_status_fifo can be
-	 * accessed concurrently.
-	 */
-	spinlock_t tx_status_lock;
 };
 
 /* HTT definitions */
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index b2807a8..88f7fb1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -435,7 +435,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_wbm_release_ring tx_status;
 	struct hal_tx_status ts;
-	struct dp_tx_ring *tx_ring;
+	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	u32 *desc;
 	u32 msdu_id;
 	u8 pool_id;
@@ -446,27 +446,27 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	ath11k_hal_srng_access_begin(ab, status_ring);
 
-	spin_lock_bh(&dp->tx_status_lock);
-	while (!kfifo_is_full(&dp->tx_status_fifo) &&
+	spin_lock_bh(&tx_ring->tx_status_lock);
+	while (!kfifo_is_full(&tx_ring->tx_status_fifo) &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
 		ath11k_hal_tx_status_desc_sync((void *)desc,
 					       (void *)&tx_status);
-		kfifo_put(&dp->tx_status_fifo, tx_status);
+		kfifo_put(&tx_ring->tx_status_fifo, tx_status);
 	}
 
 	if ((ath11k_hal_srng_dst_peek(ab, status_ring) != NULL) &&
-	    kfifo_is_full(&dp->tx_status_fifo)) {
+	    kfifo_is_full(&tx_ring->tx_status_fifo)) {
 		/* TODO: Process pending tx_status messages when kfifo_is_full() */
 		ath11k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full \n");
 	}
 
-	spin_unlock_bh(&dp->tx_status_lock);
+	spin_unlock_bh(&tx_ring->tx_status_lock);
 
 	ath11k_hal_srng_access_end(ab, status_ring);
 	spin_unlock_bh(&status_ring->lock);
 
-	spin_lock_bh(&dp->tx_status_lock);
-	while (kfifo_get(&dp->tx_status_fifo, &tx_status)) {
+	spin_lock_bh(&tx_ring->tx_status_lock);
+	while (kfifo_get(&tx_ring->tx_status_fifo, &tx_status)) {
 		memset(&ts, 0, sizeof(ts));
 		ath11k_hal_tx_status_parse(ab, &tx_status, &ts);
 
@@ -474,7 +474,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		pool_id = FIELD_GET(DP_TX_DESC_ID_POOL_ID, ts.desc_id);
 		msdu_id = FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ts.desc_id);
 		tcl_id = ath11k_txq_tcl_ring_map[pool_id];
-		tx_ring = &dp->tx_ring[tcl_id];
 
 		if (ts.buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW) {
 			ath11k_dp_process_htt_tx_complete(ab,
@@ -506,7 +505,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		 */
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
-	spin_unlock_bh(&dp->tx_status_lock);
+	spin_unlock_bh(&tx_ring->tx_status_lock);
 }
 
 int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
