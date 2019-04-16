Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFzv-0001Bv-To
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 04:47:09 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Restrict reo dest ring reap based on remaining quota
Date: Tue, 16 Apr 2019 10:16:56 +0530
Message-Id: <1555390016-18524-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Stop reaping from the reo dest ring once the available quota
after processing the pending queue is exhausted and all msdu's
in the the AMSDU is received. The additional msdu's reaped
in excess of quota would be pushed into the pending queue
to be processed during the next napi poll.
This avoid uncontrolled increase in pending_q size if packets
are continuously reaped.
Note: More profiling can be done to see the impact on
pending_q and throughput during various traffic & density
and how use of budget instead of remaining quota affects it.

Suggested-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 926674da..b57cd30 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1900,6 +1900,12 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	ath11k_dp_rx_process_pending_packets(ab, napi, pending_q, &quota,
 					     mac_id);
 
+	/* If all quota is exhausted by processing the pending_q,
+	 * Wait for the next napi poll to reap the new info
+	 */
+	if (!quota)
+		goto exit;
+
 	__skb_queue_head_init(&msdu_list);
 
 	srng = &ab->hal.srng_list[dp->reo_dst_ring.ring_id];
@@ -1933,7 +1939,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 				 DMA_FROM_DEVICE);
 
 		num_buffs_reaped++;
-		budget--;
 
 		if (meta_info.push_reason !=
 		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
@@ -1948,6 +1953,19 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 		rxcb->is_continuation = meta_info.msdu_meta.continuation;
 		rxcb->mac_id = mac_id;
 		__skb_queue_tail(&msdu_list, msdu);
+
+		/* Stop reaping from the ring once quota is exhausted
+		 * and we've received all msdu's in the the AMSDU. The
+		 * additional msdu's reaped in excess of quota here would
+		 * be pushed into the pending queue to be processed during
+		 * the next napi poll.
+		 * Note: More profiling can be done to see the impact on
+		 * pending_q and throughput during various traffic & density
+		 * and how use of budget instead of remaining quota affects it.
+		 */
+		if (num_buffs_reaped >= quota && rxcb->is_last_msdu &&
+		    !rxcb->is_continuation)
+			break;
 	}
 
 	ath11k_hal_srng_access_end(ab, srng);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
