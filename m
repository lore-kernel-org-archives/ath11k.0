Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdBZI-0006cx-Le
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 10:42:26 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH 2/2] ath11k: fix invalid htt extd stats processing
Date: Tue, 18 Jun 2019 16:12:14 +0530
Message-Id: <1560854534-29013-2-git-send-email-vnaralas@codeaurora.org>
In-Reply-To: <1560854534-29013-1-git-send-email-vnaralas@codeaurora.org>
References: <1560854534-29013-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Check for valid cookie before processing htt extd stats event,
which prevents processing invalid htt extd stats event.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h            |  1 +
 drivers/net/wireless/ath/ath11k/debug.h           |  6 ++----
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 26 +++++++++++++++--------
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  4 ++++
 drivers/net/wireless/ath/ath11k/debugfs_sta.c     |  5 ++++-
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 038f905..1ac5b31 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -385,6 +385,7 @@ struct ath11k_fw_stats {
 struct ath11k_dbg_htt_stats {
 	u8 type;
 	u8 reset;
+	struct debug_htt_stats_req *stats_req;
 	/* protects shared stats req buffer */
 	spinlock_t lock;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 5774f53..e569aba 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -141,8 +141,7 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf,
 				   u32 len);
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar);
-int ath11k_dbg_htt_stats_req(struct ath11k *ar,
-			     struct debug_htt_stats_req *stats_req);
+int ath11k_dbg_htt_stats_req(struct ath11k *ar);
 
 static inline bool ath11k_debug_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 {
@@ -216,8 +215,7 @@ static inline int ath11k_debug_is_extd_rx_stats_enabled(struct ath11k *ar)
 	return 0;
 }
 
-static inline int ath11k_dbg_htt_stats_req(struct ath11k *ar,
-					   struct debug_htt_stats_req *stats_req)
+static inline int ath11k_dbg_htt_stats_req(struct ath11k *ar)
 {
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 57fdb8c..b330b5d 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4202,11 +4202,13 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 
 	msg = (struct ath11k_htt_extd_stats_msg *)skb->data;
 	cookie = msg->cookie;
-	stats_req = (struct debug_htt_stats_req *)(uintptr_t)cookie;
-	if (!stats_req)
+
+	if (FIELD_GET(HTT_STATS_COOKIE_MSB, cookie) != HTT_STATS_MAGIC_VALUE) {
+		ath11k_warn(ab, "received invalid htt ext stats event\n");
 		return;
+	}
 
-	pdev_id = stats_req->pdev_id;
+	pdev_id = FIELD_GET(HTT_STATS_COOKIE_LSB, cookie);
 	rcu_read_lock();
 	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
 	rcu_read_unlock();
@@ -4215,6 +4217,10 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 		return;
 	}
 
+	stats_req = ar->debug.htt_stats.stats_req;
+	if (!stats_req)
+		return;
+
 	spin_lock_bh(&ar->debug.htt_stats.lock);
 	if (stats_req->done) {
 		spin_unlock_bh(&ar->debug.htt_stats.lock);
@@ -4322,9 +4328,9 @@ static int ath11k_prep_htt_stats_cfg_params(struct ath11k *ar, u8 type,
 	return 0;
 }
 
-int ath11k_dbg_htt_stats_req(struct ath11k *ar,
-			     struct debug_htt_stats_req *stats_req)
+int ath11k_dbg_htt_stats_req(struct ath11k *ar)
 {
+	struct debug_htt_stats_req *stats_req = ar->debug.htt_stats.stats_req;
 	u8 type = stats_req->type;
 	u64 cookie = 0;
 	int ret, pdev_id = ar->pdev->pdev_id;
@@ -4335,7 +4341,8 @@ int ath11k_dbg_htt_stats_req(struct ath11k *ar,
 	stats_req->done = false;
 	stats_req->pdev_id = pdev_id;
 
-	cookie = (u64)(uintptr_t)stats_req;
+	cookie = FIELD_PREP(HTT_STATS_COOKIE_MSB, HTT_STATS_MAGIC_VALUE) |
+		 FIELD_PREP(HTT_STATS_COOKIE_LSB, pdev_id);
 
 	ret = ath11k_prep_htt_stats_cfg_params(ar, type, stats_req->peer_addr,
 					       &cfg_params);
@@ -4344,14 +4351,12 @@ int ath11k_dbg_htt_stats_req(struct ath11k *ar,
 		return ret;
 	}
 
-	mutex_lock(&ar->conf_mutex);
 	ret = ath11k_dp_tx_htt_h2t_ext_stats_req(ar, type, &cfg_params, cookie);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
 		mutex_unlock(&ar->conf_mutex);
 		return ret;
 	}
-	mutex_unlock(&ar->conf_mutex);
 
 	while (!wait_for_completion_timeout(&stats_req->cmpln, 3 * HZ)) {
 		spin_lock_bh(&ar->debug.htt_stats.lock);
@@ -4381,8 +4386,11 @@ static int ath11k_open_htt_stats(struct inode *inode, struct file *file)
 	if (!stats_req)
 		return -ENOMEM;
 
+	mutex_lock(&ar->conf_mutex);
+	ar->debug.htt_stats.stats_req = stats_req;
 	stats_req->type = type;
-	ret = ath11k_dbg_htt_stats_req(ar, stats_req);
+	ret = ath11k_dbg_htt_stats_req(ar);
+	mutex_unlock(&ar->conf_mutex);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index a542bd3..b7482de 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -6,6 +6,10 @@
 #ifndef DEBUG_HTT_STATS_H
 #define DEBUG_HTT_STATS_H
 
+#define HTT_STATS_COOKIE_LSB    GENMASK_ULL(31, 0)
+#define HTT_STATS_COOKIE_MSB    GENMASK_ULL(63, 32)
+#define HTT_STATS_MAGIC_VALUE   0xF0F0F0F0
+
 enum htt_tlv_tag_t {
 	HTT_STATS_TX_PDEV_CMN_TAG                           = 0,
 	HTT_STATS_TX_PDEV_UNDERRUN_TAG                      = 1,
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index cff6a3f..dc54e83 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -415,9 +415,12 @@ ath11k_dbg_sta_open_htt_peer_stats(struct inode *inode, struct file *file)
 	if (!stats_req)
 		return -ENOMEM;
 
+	mutex_lock(&ar->conf_mutex);
+	ar->debug.htt_stats.stats_req = stats_req;
 	stats_req->type = ATH11K_DBG_HTT_EXT_STATS_PEER_INFO;
 	memcpy(stats_req->peer_addr, sta->addr, ETH_ALEN);
-	ret = ath11k_dbg_htt_stats_req(ar, stats_req);
+	ret = ath11k_dbg_htt_stats_req(ar);
+	mutex_unlock(&ar->conf_mutex);
 	if (ret < 0)
 		goto out;
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
