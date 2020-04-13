Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNyfP-0000Uc-Fb
 for ath11k@lists.infradead.org; Mon, 13 Apr 2020 12:58:27 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Add dynamic tcl ring selection logic with retry
 mechanism
Date: Mon, 13 Apr 2020 18:27:02 +0530
Message-Id: <1586782622-22570-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

IPQ8074 HW supports three TCL rings for tx. Currently these rings
are mapped based on the Access categories, viz. VO, VI, BE, BK.
In case, one of the traffic type dominates, then it could stress
the same tcl rings. Rather, it would be optimal to make use of all
the rings in a round robin fashion irrespective of the traffic type
so that the load could be evenly distributed among all the rings.
Also, in case the selected ring is busy or full, a retry mechanism
is used to ensure other available ring is selected without dropping
the packet.

In SMP systems, this change avoids a single CPU from getting hogged
when heavy traffic of same category is transmitted.
The tx completion interrupts corresponding to the used tcl ring
would be more which causes the assigned CPU to get hogged.
Distribution of tx packets to different tcl rings helps balance
this load.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  3 +++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 46 +++++++++++++++++++++++++++------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b4c3e041..2e20faa 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -656,6 +656,9 @@ struct ath11k_base {
 		u32 fw_crash_counter;
 	} stats;
 	u32 pktlog_defs_checksum;
+
+	/* Round robbin based TCL ring selector */
+	atomic_t tcl_ring_selector;
 };
 
 struct ath11k_fw_stats_pdev {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 7aac4b0..e9a436e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -9,10 +9,6 @@
 #include "hw.h"
 #include "peer.h"
 
-/* NOTE: Any of the mapped ring id value must not exceed DP_TCL_NUM_RING_MAX */
-static const u8
-ath11k_txq_tcl_ring_map[ATH11K_HW_MAX_QUEUES] = { 0x0, 0x1, 0x2, 0x2 };
-
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
@@ -84,6 +80,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	u8 pool_id;
 	u8 hal_ring_id;
 	int ret;
+	u8 ring_selector = 0, ring_map = 0;
+	bool tcl_ring_retry;
 
 	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
@@ -92,7 +90,20 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		return -ENOTSUPP;
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
-	ti.ring_id = ath11k_txq_tcl_ring_map[pool_id];
+
+	/* Let the default ring selection be based on a round robin
+	 * fashion where one of the 3 tcl rings are selected based on
+	 * the tcl_ring_selector counter. In case that ring
+	 * is full/busy, we resort to other available rings.
+	 * If all rings are full, we drop the packet.
+	 * //TODO Add throttling logic when all rings are full
+	 */
+	ring_selector = atomic_inc_return(&ab->tcl_ring_selector);
+
+tcl_ring_sel:
+	tcl_ring_retry = false;
+	ti.ring_id = ring_selector % DP_TCL_NUM_RING_MAX;
+	ring_map |= BIT(ti.ring_id);
 
 	tx_ring = &dp->tx_ring[ti.ring_id];
 
@@ -101,8 +112,14 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
-	if (ret < 0)
-		return -ENOSPC;
+	if (ret < 0) {
+		if (ring_map == (BIT(DP_TCL_NUM_RING_MAX) - 1))
+			return -ENOSPC;
+
+		/* Check if the next ring is available */
+		ring_selector++;
+		goto tcl_ring_sel;
+	}
 
 	ti.desc_id = FIELD_PREP(DP_TX_DESC_ID_MAC_ID, ar->pdev_idx) |
 		     FIELD_PREP(DP_TX_DESC_ID_MSDU_ID, ret) |
@@ -178,11 +195,21 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (!hal_tcl_desc) {
 		/* NOTE: It is highly unlikely we'll be running out of tcl_ring
 		 * desc because the desc is directly enqueued onto hw queue.
-		 * So add tx packet throttling logic in future if required.
 		 */
 		ath11k_hal_srng_access_end(ab, tcl_ring);
 		spin_unlock_bh(&tcl_ring->lock);
 		ret = -ENOMEM;
+
+		/* Checking for available tcl descritors in another ring in
+		 * case of failure due to full tcl ring now, is better than
+		 * checking this ring earlier for each pkt tx.
+		 * Restart ring selection if some rings are not checked yet.
+		 */
+		if (ring_map != (BIT(DP_TCL_NUM_RING_MAX) - 1)) {
+			tcl_ring_retry = true;
+			ring_selector++;
+		}
+
 		goto fail_unmap_dma;
 	}
 
@@ -206,6 +233,9 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		   FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
+	if (tcl_ring_retry)
+		goto tcl_ring_sel;
+
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
