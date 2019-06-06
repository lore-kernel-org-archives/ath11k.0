Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYkgt-0000Dj-TO
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 05:11:57 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: add locking on ppdu_stats_info list access
Date: Thu,  6 Jun 2019 10:41:39 +0530
Message-Id: <1559797899-16925-1-git-send-email-akolli@codeaurora.org>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

This patch fixes below issue on wifi interface with ping traffic
Unable to handle kernel paging request at virtual address fffffd78
PC is at ath11k_dp_htt_htc_t2h_msg_handler+0x19c/0x728
LR is at ath11k_dp_htt_htc_t2h_msg_handler+0x28/0x728

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 29 +++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   | 11 +++++++++--
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 73865ce2b3ab..2b4c46b839b2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1000,10 +1000,13 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 {
 	struct htt_ppdu_stats_info *ppdu_info = NULL;
 
+	spin_lock_bh(&ar->data_lock);
 	if (!list_empty(&ar->ppdu_stats_info)) {
 		list_for_each_entry(ppdu_info, &ar->ppdu_stats_info, list) {
-			if (ppdu_info && ppdu_info->ppdu_id == ppdu_id)
+			if (ppdu_info && ppdu_info->ppdu_id == ppdu_id) {
+				spin_unlock_bh(&ar->data_lock);
 				return ppdu_info;
+			}
 		}
 
 		if (ar->ppdu_stat_list_depth > HTT_PPDU_DESC_MAX_DEPTH) {
@@ -1015,13 +1018,16 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 			kfree(ppdu_info);
 		}
 	}
+	spin_unlock_bh(&ar->data_lock);
 
 	ppdu_info = kzalloc(sizeof(*ppdu_info), GFP_KERNEL);
 	if (!ppdu_info)
 		return NULL;
 
+	spin_lock_bh(&ar->data_lock);
 	list_add_tail(&ppdu_info->list, &ar->ppdu_stats_info);
 	ar->ppdu_stat_list_depth++;
+	spin_unlock_bh(&ar->data_lock);
 
 	return ppdu_info;
 }
@@ -1039,7 +1045,13 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *(u32 *)data);
 	pdev_id = DP_HW2SW_MACID(pdev_id);
 	ppdu_id = *((u32 *)data + 1);
-	ar = ab->pdevs[pdev_id].ar;
+
+	rcu_read_lock();
+	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
+	if (!ar) {
+		ret = -EINVAL;
+		goto exit;
+	}
 
 	if (ath11k_debug_is_pktlog_lite_mode_enabled(ar)) {
 		trace_ath11k_htt_ppdu_stats(ar, skb->data, len);
@@ -1049,8 +1061,10 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	data = (u8 *)data + 16;
 
 	ppdu_info = ath11k_dp_htt_get_ppdu_desc(ar, ppdu_id);
-	if (!ppdu_info)
-		return 0;
+	if (!ppdu_info) {
+		ret = -EINVAL;
+		goto exit;
+	}
 
 	ppdu_info->ppdu_id = ppdu_id;
 	ret = ath11k_dp_htt_tlv_iter(ab, data, len,
@@ -1058,10 +1072,13 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 				     (void *)ppdu_info);
 	if (ret) {
 		ath11k_warn(ab, "Failed to parse tlv %d\n", ret);
-		return ret;
+		goto exit;
 	}
 
-	return 0;
+exit:
+	rcu_read_unlock();
+
+	return ret;
 }
 
 static void ath11k_htt_pktlog(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e2aa60..38076afbe6d1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3342,8 +3342,6 @@ static int ath11k_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	INIT_LIST_HEAD(&ar->ppdu_stats_info);
-
 	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_ARP_AC_OVERRIDE,
 					0, pdev->pdev_id);
 	if (ret) {
@@ -3392,6 +3390,7 @@ static int ath11k_start(struct ieee80211_hw *hw)
 static void ath11k_stop(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
+	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
 
 	ath11k_drain_tx(ar);
 
@@ -3403,6 +3402,13 @@ static void ath11k_stop(struct ieee80211_hw *hw)
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->regd_update_work);
 
+	spin_lock_bh(&ar->data_lock);
+	list_for_each_entry_safe(ppdu_stats, tmp, &ar->ppdu_stats_info, list) {
+		list_del(&ppdu_stats->list);
+		kfree(ppdu_stats);
+	}
+	spin_unlock_bh(&ar->data_lock);
+
 	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
 
 	synchronize_rcu();
@@ -5192,6 +5198,7 @@ int ath11k_mac_create(struct ath11k_base *ab)
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
 		INIT_LIST_HEAD(&ar->arvifs);
+		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
 		init_completion(&ar->vdev_setup_done);
 		init_completion(&ar->peer_assoc_done);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
