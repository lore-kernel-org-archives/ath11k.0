Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFzG-00019C-G6
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 04:46:27 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix packet drops seen in 5G LB and 2G pdevs
Date: Tue, 16 Apr 2019 10:16:02 +0530
Message-Id: <1555389962-18476-1-git-send-email-srirrama@codeaurora.org>
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

Before queueing the rx msdu's into pending_q, the driver's private info
in skb gets lost since mac80211 rx status info is retrieved and
stored in the same memory. Hence do not use driver private info
while retrieving the mac id or other driver info again while
processing of packets in the pending_q.
This avoid packet drops seen while using 2G (mac id 1)
and 5G LB(mac id 2). Issue might not be seen in pdev 0 since might
mostly the mac id matches with value 0 in rx_status.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 06b3c2e..0f9420a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1825,24 +1825,26 @@ static u32 *ath11k_dp_rx_get_reo_desc(struct ath11k_base *ab,
 static void ath11k_dp_rx_process_pending_packets(struct ath11k_base *ab,
 						 struct napi_struct *napi,
 						 struct sk_buff_head *pending_q,
-						 int *quota)
+						 int *quota, u8 mac_id)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
-	struct ath11k_skb_rxcb *rxcb;
+	struct ath11k_pdev *pdev;
 
 	if (skb_queue_empty(pending_q))
 		return;
 
+	ar = ab->pdevs[mac_id].ar;
+
 	rcu_read_lock();
+	pdev = rcu_dereference(ab->pdevs_active[mac_id]);
+
 	while (*quota && (msdu = __skb_dequeue(pending_q))) {
-		rxcb = ATH11K_SKB_RXCB(msdu);
-		if (!rcu_dereference(ab->pdevs_active[rxcb->mac_id])) {
+		if (!pdev) {
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
 
-		ar = ab->pdevs[rxcb->mac_id].ar;
 		ath11k_dp_rx_deliver_msdu(ar, napi, msdu);
 		(*quota)--;
 	}
@@ -1869,8 +1871,13 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	int quota = budget;
 	int ret;
 
-	/* Process any pending packets from the previous napi poll */
-	ath11k_dp_rx_process_pending_packets(ab, napi, pending_q, &quota);
+	/* Process any pending packets from the previous napi poll.
+	 * Note: All msdu's in this pending_q corresponds to the same mac id
+	 * due to pdev based reo dest mapping and also since each irq group id
+	 * maps to specific reo dest ring.
+	 */
+	ath11k_dp_rx_process_pending_packets(ab, napi, pending_q, &quota,
+					     mac_id);
 
 	__skb_queue_head_init(&msdu_list);
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
