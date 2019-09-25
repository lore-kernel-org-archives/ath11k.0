Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzDE-0003MJ-ND
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:37 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A1C661572
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:34 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 1/3] ath11k: Clean ups in
 ath11k_ce_rx_buf_enqueue_pipe() error path
Date: Wed, 25 Sep 2019 10:14:16 +0530
Message-Id: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
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

Unify the unlock/ring_access_end calls with error path in
ath11k_ce_rx_buf_enqueue_pipe(). Update to ce_pipe->rx_buf_needed
is done inside srng->lock before ath11k_hal_srng_access_end().
Also rename the goto label from err to exit.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index c1b170c..205f28e 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -131,13 +131,13 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 
 	if (unlikely(ath11k_hal_srng_src_num_free(ab, srng, false) < 1)) {
 		ret = -ENOSPC;
-		goto err;
+		goto exit;
 	}
 
 	desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
 	if (!desc) {
 		ret = -ENOSPC;
-		goto err;
+		goto exit;
 	}
 
 	ath11k_hal_ce_dst_set_desc(desc, paddr);
@@ -146,15 +146,10 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
 	ring->write_index = write_index;
 
-	ath11k_hal_srng_access_end(ab, srng);
-
-	spin_unlock_bh(&srng->lock);
-
 	pipe->rx_buf_needed--;
 
-	return 0;
-
-err:
+	ret = 0;
+exit:
 	ath11k_hal_srng_access_end(ab, srng);
 
 	spin_unlock_bh(&srng->lock);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
