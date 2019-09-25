Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzDG-0003Mg-7j
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:39 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A35516115A
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:36 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 2/3] ath11k: Clean up parameter list in
 ath11k_ce_completed_send_next()
Date: Wed, 25 Sep 2019 10:14:17 +0530
Message-Id: <1569386658-1325-2-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
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

Make ath11k_ce_completed_send_next() to return skb instead of
through a double pointer argument of type sk_buff.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 205f28e..03e7cf0 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -296,15 +296,14 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 	}
 }
 
-static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
-					 struct sk_buff **skb)
+static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe)
 {
 	struct ath11k_base *ab = pipe->ab;
 	struct hal_srng *srng;
 	unsigned int sw_index;
 	unsigned int nentries_mask;
+	struct sk_buff *skb;
 	u32 *desc;
-	int ret = 0;
 
 	spin_lock_bh(&ab->ce.ce_lock);
 
@@ -319,11 +318,11 @@ static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
 
 	desc = ath11k_hal_srng_src_reap_next(ab, srng);
 	if (!desc) {
-		ret = -EIO;
+		skb = ERR_PTR(-EIO);
 		goto err_unlock;
 	}
 
-	*skb = pipe->src_ring->skb[sw_index];
+	skb = pipe->src_ring->skb[sw_index];
 
 	pipe->src_ring->skb[sw_index] = NULL;
 
@@ -335,7 +334,7 @@ static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
 
 	spin_unlock_bh(&ab->ce.ce_lock);
 
-	return ret;
+	return skb;
 }
 
 static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
@@ -343,7 +342,7 @@ static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
 	struct ath11k_base *ab = pipe->ab;
 	struct sk_buff *skb;
 
-	while (ath11k_ce_completed_send_next(pipe, &skb) == 0) {
+	while (!IS_ERR(skb = ath11k_ce_completed_send_next(pipe))) {
 		if (!skb)
 			continue;
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
