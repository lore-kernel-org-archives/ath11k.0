Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5qY-0005kF-37
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 04:35:51 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix extended stats update issue
Date: Tue, 18 Jun 2019 10:05:37 +0530
Message-Id: <1560832537-22777-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

user not able to see the valid tx stats. htt stats update
process get failed due to the wrong argument pass to
ath11k_get_ar_by_pdev_id API. Expected argument is pdev_id not
the pdev index. so avoid the conversion logic of pdev id to pdev
index in htt stats update process.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1d9892e..971c437 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1294,7 +1294,6 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 
 	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, *(u32 *)data);
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *(u32 *)data);
-	pdev_id = DP_HW2SW_MACID(pdev_id);
 	ppdu_id = *((u32 *)data + 1);
 
 	rcu_read_lock();
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
