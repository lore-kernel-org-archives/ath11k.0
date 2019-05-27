Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFXl-0000pE-A9
 for ath11k@lists.infradead.org; Mon, 27 May 2019 13:20:02 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: add CE specific callbacks
Date: Mon, 27 May 2019 18:49:50 +0530
Message-Id: <1558963190-30814-1-git-send-email-akolli@codeaurora.org>
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

CE5 is used for pktlog and other HTT messages.
CE5 does not have HTC header, add separate callbacks
to handle this.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 17 ++++++++++++-----
 drivers/net/wireless/ath/ath11k/ce.h |  4 +++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e5308def3..acae8b8d9ae9 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
-#include "core.h"
+#include "dp_rx.h"
 #include "debug.h"
 
 static const struct ce_attr host_ce_config_wlan[] = {
@@ -21,6 +21,7 @@
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
+		.recv_cb = ath11k_htc_rx_completion_handler,
 	},
 
 	/* CE2: target->host WMI */
@@ -29,6 +30,7 @@
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
+		.recv_cb = ath11k_htc_rx_completion_handler,
 	},
 
 	/* CE3: host->target WMI (mac0) */
@@ -53,6 +55,7 @@
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
+		.recv_cb = ath11k_dp_htt_htc_t2h_msg_handler,
 	},
 
 	/* CE6: target autonomous hif_memcpy */
@@ -93,6 +96,7 @@
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
+		.recv_cb = ath11k_htc_rx_completion_handler,
 	},
 
 	/* CE11: Not used */
@@ -283,8 +287,11 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 		__skb_queue_tail(&list, skb);
 	}
 
-	while ((skb = __skb_dequeue(&list)))
-		ath11k_htc_rx_completion_handler(ab, skb);
+	while ((skb = __skb_dequeue(&list))) {
+		ath11k_dbg(ab, ATH11K_DBG_AHB, "rx ce pipe %d len %d\n",
+			   pipe->pipe_num, skb->len);
+		pipe->recv_cb(ab, skb);
+	}
 
 	ret = ath11k_ce_rx_post_pipe(pipe);
 	if (ret && ret != -ENOSPC) {
@@ -459,7 +466,7 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *sc, int ce_id)
 	}
 
 	if (attr->dest_nentries) {
-		pipe->recv_cb = ath11k_ce_recv_process_cb;
+		pipe->recv_cb = attr->recv_cb;
 		nentries = roundup_pow_of_two(attr->dest_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
 		pipe->dest_ring = ath11k_ce_alloc_ring(sc, nentries, desc_sz);
@@ -484,7 +491,7 @@ void ath11k_ce_per_engine_service(struct ath11k_base *ab, u16 ce_id)
 		pipe->send_cb(pipe);
 
 	if (pipe->recv_cb)
-		pipe->recv_cb(pipe);
+		ath11k_ce_recv_process_cb(pipe);
 
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 072a84296070..f9b5a0eae432 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -94,6 +94,8 @@ struct ce_attr {
 
 	/* #entries in destination ring - Must be a power of 2 */
 	unsigned int dest_nentries;
+
+	void (*recv_cb)(struct ath11k_base *, struct sk_buff *);
 };
 
 #define CE_DESC_RING_ALIGN 8
@@ -148,7 +150,7 @@ struct ath11k_ce_pipe {
 	unsigned int rx_buf_needed;
 
 	void (*send_cb)(struct ath11k_ce_pipe *);
-	void (*recv_cb)(struct ath11k_ce_pipe *);
+	void (*recv_cb)(struct ath11k_base *, struct sk_buff *);
 
 	struct tasklet_struct intr_tq;
 	struct ath11k_ce_ring *src_ring;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
