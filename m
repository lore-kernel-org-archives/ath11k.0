Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNUCT-00047Z-Nc
 for ath11k@lists.infradead.org; Thu, 24 Oct 2019 03:54:15 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath11k: remove unused tx ring counters
Date: Wed, 23 Oct 2019 20:54:06 -0700
Message-Id: <1571889246-1793-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

remove unused counter to avoid taking locks inorder to optimize
cpu load.

Using Flamegraph, cpu usage of ath11k_dp_tx() observed to be decreased
from 5.58% to 3.74% with iperf traffic running with 80MHz bandwidth ap
mode. 

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 1 -
 drivers/net/wireless/ath/ath11k/dp_tx.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 4db71173db62..d087d515e8a3 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -63,7 +63,6 @@ struct dp_tx_ring {
 	struct dp_srng tcl_data_ring;
 	struct dp_srng tcl_comp_ring;
 	struct idr txbuf_idr;
-	u32 num_tx_pending;
 	/* Protects txbuf_idr and num_pending */
 	spinlock_t tx_idr_lock;
 	DECLARE_KFIFO_PTR(tx_status_fifo, struct hal_wbm_release_ring);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 51a02b8e66cc..a8b9557c2346 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -196,10 +196,6 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	spin_unlock_bh(&tcl_ring->lock);
 
-	spin_lock_bh(&tx_ring->tx_idr_lock);
-	tx_ring->num_tx_pending++;
-	spin_unlock_bh(&tx_ring->tx_idr_lock);
-
 	atomic_inc(&ar->dp.num_tx_pending);
 
 	return 0;
@@ -236,7 +232,6 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	skb_cb = ATH11K_SKB_CB(msdu);
 
 	idr_remove(&tx_ring->txbuf_idr, msdu_id);
-	tx_ring->num_tx_pending--;
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
@@ -272,7 +267,6 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	ar = skb_cb->ar;
 
 	idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
-	tx_ring->num_tx_pending--;
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -495,7 +489,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			continue;
 		}
 		idr_remove(&tx_ring->txbuf_idr, msdu_id);
-		tx_ring->num_tx_pending--;
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
-- 
2.1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
