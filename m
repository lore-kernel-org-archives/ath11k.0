Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeQ-0003e6-Bd
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:05:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/10] ath11k: remove unused tx ring counters
Date: Tue, 26 Nov 2019 11:04:54 +0000
Message-ID: <0101016ea762b47b-4cd50d91-8b0f-438a-9373-0c14463589a0-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

remove unused counter to avoid taking locks inorder to optimize
cpu load.

Using Flamegraph, cpu usage of ath11k_dp_tx() observed to be decreased
from 5.58% to 3.74% with iperf traffic running with 80MHz bandwidth ap
mode.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 1 -
 drivers/net/wireless/ath/ath11k/dp_tx.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index eb0f3df131c5..db216f055c42 100644
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
