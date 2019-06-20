Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdtCE-0000sI-Ks
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 09:17:31 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9733060254
 for <ath11k@lists.infradead.org>; Thu, 20 Jun 2019 09:17:28 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH V2 1/4] ath11k: Clean up void *per_transfer_context[] in ce
Date: Thu, 20 Jun 2019 14:47:06 +0530
Message-Id: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
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

Since per_transfer_context is used as an array of skb pointer always
no need that to be an array of void *.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---

V2:

- Dropped "[PATCH 4/5] ath11k: Clean up link_desc_addr buffer typecast"
  from the series. This will be addressed later.

 drivers/net/wireless/ath/ath11k/ce.c | 9 ++++-----
 drivers/net/wireless/ath/ath11k/ce.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index b9a57ec..048adc1 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -212,7 +212,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 }
 
 static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
-					 void **context, int *nbytes)
+					 struct sk_buff **context, int *nbytes)
 {
 	struct ath11k_base *ab = pipe->sc;
 	struct hal_srng *srng;
@@ -270,8 +270,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 	int ret;
 
 	__skb_queue_head_init(&list);
-	while (ath11k_ce_completed_recv_next(pipe, (void **)&skb,
-					     &nbytes) == 0) {
+	while (ath11k_ce_completed_recv_next(pipe, &skb, &nbytes) == 0) {
 		max_nbytes = skb->len + skb_tailroom(skb);
 		dma_unmap_single(ab->dev, ATH11K_SKB_RXCB(skb)->paddr,
 				 max_nbytes, DMA_FROM_DEVICE);
@@ -303,7 +302,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 }
 
 static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
-					 void **transfer_contextp)
+					 struct sk_buff **transfer_contextp)
 {
 	struct ath11k_base *ab = pipe->sc;
 	struct hal_srng *srng;
@@ -349,7 +348,7 @@ static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
 	struct ath11k_base *ab = pipe->sc;
 	struct sk_buff *skb;
 
-	while (ath11k_ce_completed_send_next(pipe, (void **)&skb) == 0) {
+	while (ath11k_ce_completed_send_next(pipe, &skb) == 0) {
 		if (!skb)
 			continue;
 
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index f9b5a0e..9f25bad 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -139,7 +139,7 @@ struct ath11k_ce_ring {
 	u32 hal_ring_id;
 
 	/* keep last */
-	void *per_transfer_context[0];
+	struct sk_buff *per_transfer_context[0];
 };
 
 struct ath11k_ce_pipe {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
