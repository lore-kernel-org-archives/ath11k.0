Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWftS-0002GV-0u
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 12:12:35 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/3] ath11k: remove superflous locking
Date: Mon, 18 Nov 2019 13:12:23 +0100
Message-Id: <20191118121224.26351-2-john@phrozen.org>
In-Reply-To: <20191118121224.26351-1-john@phrozen.org>
References: <20191118121224.26351-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The access to the fifo happens inside a napi context, which is an atomic
operation. Locking is therefore not required.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 4 ----
 drivers/net/wireless/ath/ath11k/dp.h    | 4 ----
 drivers/net/wireless/ath/ath11k/dp_tx.c | 8 --------
 3 files changed, 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 72c21cf6a352..d62115e9b41b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -822,10 +822,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
 			     ath11k_dp_tx_pending_cleanup, ab);
 		idr_destroy(&dp->tx_ring[i].txbuf_idr);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
-
-		spin_lock_bh(&dp->tx_ring[i].tx_status_lock);
 		kfifo_free(&dp->tx_ring[i].tx_status_fifo);
-		spin_unlock_bh(&dp->tx_ring[i].tx_status_lock);
 	}
 
 	/* Deinit any SOC level resource */
@@ -872,7 +869,6 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
 
-		spin_lock_init(&dp->tx_ring[i].tx_status_lock);
 		ret = kfifo_alloc(&dp->tx_ring[i].tx_status_fifo, size,
 				  GFP_KERNEL);
 		if (ret)
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index db216f055c42..5f98c5a49791 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -66,10 +66,6 @@ struct dp_tx_ring {
 	/* Protects txbuf_idr and num_pending */
 	spinlock_t tx_idr_lock;
 	DECLARE_KFIFO_PTR(tx_status_fifo, struct hal_wbm_release_ring);
-	/* lock to protect tx_status_fifo because tx_status_fifo can be
-	 * accessed concurrently.
-	 */
-	spinlock_t tx_status_lock;
 };
 
 struct ath11k_pdev_mon_stats {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 2d6255888cfb..8005ad60fda1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -445,7 +445,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	ath11k_hal_srng_access_begin(ab, status_ring);
 
-	spin_lock_bh(&tx_ring->tx_status_lock);
 	while (!kfifo_is_full(&tx_ring->tx_status_fifo) &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring)))
 		kfifo_in(&tx_ring->tx_status_fifo, (void *)desc, sizeof(struct hal_wbm_release_ring));
@@ -456,12 +455,9 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		ath11k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full\n");
 	}
 
-	spin_unlock_bh(&tx_ring->tx_status_lock);
-
 	ath11k_hal_srng_access_end(ab, status_ring);
 	spin_unlock_bh(&status_ring->lock);
 
-	spin_lock_bh(&tx_ring->tx_status_lock);
 	while (kfifo_get(&tx_ring->tx_status_fifo, &tx_status)) {
 		ath11k_hal_tx_status_parse(ab, &tx_status, &ts);
 
@@ -492,12 +488,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		/* TODO: Locking optimization so that tx_completion for an msdu
-		 * is not called with tx_status_lock acquired
-		 */
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
-	spin_unlock_bh(&tx_ring->tx_status_lock);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
