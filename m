Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRCtw-0000sx-4x
 for ath11k@lists.infradead.org; Wed, 22 Apr 2020 10:46:47 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix reo flush send
Date: Wed, 22 Apr 2020 16:16:18 +0530
Message-Id: <1587552378-4884-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

we are sending the reo flush command for the deleted peer
tid after the ageout period reaches 1 second. This handling
causes reo ring get full when more than 128 clients are
disconnected continuously. so added the count for flush list
and reo flush command is triggered after the list count reaches
the threshold value, it is configured as 64 (half of the reo ring).
This will avoid the situation where reo ring get full.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 2 ++
 drivers/net/wireless/ath/ath11k/dp.h    | 9 ++++++++-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 +++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 50350f7..8d6fb84 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -880,6 +880,8 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
 	spin_lock_init(&dp->reo_cmd_lock);
 
+	dp->reo_cmd_cache_flush_count = 0;
+
 	ret = ath11k_wbm_idle_ring_setup(ab, &n_link_desc);
 	if (ret) {
 		ath11k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index d4e19dc..222de10 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -36,6 +36,7 @@ struct dp_rx_tid {
 	struct ath11k_base *ab;
 };
 
+#define DP_REO_DESC_FREE_THRESHOLD  64
 #define DP_REO_DESC_FREE_TIMEOUT_MS 1000
 
 struct dp_reo_cache_flush_elem {
@@ -222,7 +223,13 @@ struct ath11k_dp {
 	struct hal_wbm_idle_scatter_list scatter_list[DP_IDLE_SCATTER_BUFS_MAX];
 	struct list_head reo_cmd_list;
 	struct list_head reo_cmd_cache_flush_list;
-	/* protects access to reo_cmd_list and reo_cmd_cache_flush_list */
+	u32 reo_cmd_cache_flush_count;
+	/**
+	 * protects access to below fields,
+	 * - reo_cmd_list
+	 * - reo_cmd_cache_flush_list
+	 * - reo_cmd_cache_flush_count
+	 */
 	spinlock_t reo_cmd_lock;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index bbd7da4..d3d2a33 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -565,6 +565,7 @@ void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_base *ab)
 	list_for_each_entry_safe(cmd_cache, tmp_cache,
 				 &dp->reo_cmd_cache_flush_list, list) {
 		list_del(&cmd_cache->list);
+		dp->reo_cmd_cache_flush_count--;
 		dma_unmap_single(ab->dev, cmd_cache->data.paddr,
 				 cmd_cache->data.size, DMA_BIDIRECTIONAL);
 		kfree(cmd_cache->data.vaddr);
@@ -651,15 +652,18 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 
 	spin_lock_bh(&dp->reo_cmd_lock);
 	list_add_tail(&elem->list, &dp->reo_cmd_cache_flush_list);
+	dp->reo_cmd_cache_flush_count++;
 	spin_unlock_bh(&dp->reo_cmd_lock);
 
 	/* Flush and invalidate aged REO desc from HW cache */
 	spin_lock_bh(&dp->reo_cmd_lock);
 	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list,
 				 list) {
-		if (time_after(jiffies, elem->ts +
+		if (dp->reo_cmd_cache_flush_count > DP_REO_DESC_FREE_THRESHOLD ||
+		    time_after(jiffies, elem->ts +
 			       msecs_to_jiffies(DP_REO_DESC_FREE_TIMEOUT_MS))) {
 			list_del(&elem->list);
+			dp->reo_cmd_cache_flush_count--;
 			spin_unlock_bh(&dp->reo_cmd_lock);
 
 			ath11k_dp_reo_cache_flush(ab, &elem->data);
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
