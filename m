Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnbK9-0003AO-DB
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 04:13:50 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 54261611CF
 for <ath11k@lists.infradead.org>; Wed, 17 Jul 2019 04:13:47 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k/dp: Fix possible invalid skb memory access
Date: Wed, 17 Jul 2019 09:43:26 +0530
Message-Id: <1563336807-23646-1-git-send-email-vthiagar@codeaurora.org>
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

In ath11k_dp_rx_null_q_desc_sg_drop(), Use skb_queue_walk_safe()
instead of skb_queue_walk() while processing skb from the queue
since this involves removing skb from the list. Using just
skb_queue_walk() could result in using invalid (or already freed)
skb memory.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index d074d90..fbe7f34 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2907,14 +2907,14 @@ static void ath11k_dp_rx_null_q_desc_sg_drop(struct ath11k *ar,
 					     int msdu_len,
 					     struct sk_buff_head *msdu_list)
 {
-	struct sk_buff *skb;
+	struct sk_buff *skb, *tmp;
 	struct ath11k_skb_rxcb *rxcb;
 	int n_buffs;
 
 	n_buffs = DIV_ROUND_UP(msdu_len,
 			       (DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE));
 
-	skb_queue_walk(msdu_list, skb) {
+	skb_queue_walk_safe(msdu_list, skb, tmp) {
 		rxcb = ATH11K_SKB_RXCB(skb);
 		if (rxcb->err_rel_src == HAL_WBM_REL_SRC_MODULE_REO &&
 		    rxcb->err_code == HAL_REO_DEST_RING_ERROR_CODE_DESC_ADDR_ZERO) {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
