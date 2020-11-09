Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc3ge-0007Vq-EB
 for ath11k@lists.infradead.org; Mon, 09 Nov 2020 09:42:09 +0000
From: P Praneesh <ppranees@codeaurora.org>
Subject: [PATCH v3] ath11k: add processor_id based ring_selector logic
Date: Mon,  9 Nov 2020 15:11:55 +0530
Message-Id: <1604914915-12831-1-git-send-email-ppranees@codeaurora.org>
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
Cc: P Praneesh <ppranees@codeaurora.org>, linux-wireless@vger.kernel.org

Current ring selector logic follows round-robin scheduling,
when a process switch from one processor to another each time,
the data in the cache would have to be invalidated
and re-loaded from RAM leads to poor cache utilization.

Therefore smp_processor_id() attempt to keep processes
on the same processor via processor affinity which improves
cache utilization. Also, ring selection could be chosen round
robin when the processor_id based ring selection does not
have the resources.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00874-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  | 3 ---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 8 ++++----
 2 files changed, 4 insertions(+), 7 deletions(-)
---
v3: corrected commit log.
v2: corrected tested tags.
---
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 1cd9ef3..c2a4a7d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -714,9 +714,6 @@ struct ath11k_base {
 	} stats;
 	u32 pktlog_defs_checksum;
 
-	/* Round robbin based TCL ring selector */
-	atomic_t tcl_ring_selector;
-
 	struct ath11k_dbring_cap *db_caps;
 	u32 num_db_cap;
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index a9632b7..897c368 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -99,14 +99,14 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
 
-	/* Let the default ring selection be based on a round robin
-	 * fashion where one of the 3 tcl rings are selected based on
-	 * the tcl_ring_selector counter. In case that ring
+	/* Let the default ring selection be based on current processor
+	 * number, where one of the 3 tcl rings are selected based on
+	 * the smp_processor_id(). In case that ring
 	 * is full/busy, we resort to other available rings.
 	 * If all rings are full, we drop the packet.
 	 * //TODO Add throttling logic when all rings are full
 	 */
-	ring_selector = atomic_inc_return(&ab->tcl_ring_selector);
+	ring_selector = smp_processor_id();
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
