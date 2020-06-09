Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jifO7-0002iM-OR
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 14:38:07 +0000
From: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Subject: [PATCH] ath11k: removing redundant reo unlock followed by immediate
 lock
Date: Tue,  9 Jun 2020 20:07:12 +0530
Message-Id: <1591713432-26426-1-git-send-email-ssreeela@codeaurora.org>
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
Cc: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>, linux-wireless@vger.kernel.org

Removed reo cmd lock and unlock which was acquiring the lock immediately
after unlock. Done for code clean up.

Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a54610d..a010cf7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -653,10 +653,8 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 	spin_lock_bh(&dp->reo_cmd_lock);
 	list_add_tail(&elem->list, &dp->reo_cmd_cache_flush_list);
 	dp->reo_cmd_cache_flush_count++;
-	spin_unlock_bh(&dp->reo_cmd_lock);
 
 	/* Flush and invalidate aged REO desc from HW cache */
-	spin_lock_bh(&dp->reo_cmd_lock);
 	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list,
 				 list) {
 		if (dp->reo_cmd_cache_flush_count > DP_REO_DESC_FREE_THRESHOLD ||
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
