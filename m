Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbOPV-0000xa-BW
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 12:00:54 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH] ath11k: Cleanup in htt stats init function
Date: Thu, 13 Jun 2019 17:29:01 +0530
Message-Id: <1560427141-24367-1-git-send-email-bperumal@codeaurora.org>
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
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>

This renames htt stats init function and moves the function declaration
into debug_htt_stats.h.

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c           | 3 ++-
 drivers/net/wireless/ath/ath11k/debug.h           | 5 -----
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 2 +-
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h | 2 ++
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index e22e1c8..1658bb7 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -9,6 +9,7 @@
 #include "wmi.h"
 #include "hal_rx.h"
 #include "dp_tx.h"
+#include "debug_htt_stats.h"
 
 void ath11k_info(struct ath11k_base *sc, const char *fmt, ...)
 {
@@ -1145,7 +1146,7 @@ int ath11k_debug_register(struct ath11k *ar)
 	snprintf(buf, 100, "../../%pd2", ar->debug.debugfs_pdev);
 	debugfs_create_symlink("ath11k", ar->hw->wiphy->debugfsdir, buf);
 
-	ath11k_htt_stats_debugfs_init(ar);
+	ath11k_debug_htt_stats_init(ar);
 
 	ath11k_debug_fw_stats_init(ar);
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 13973d9..189205d 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -139,7 +139,6 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 void ath11k_debug_soc_destroy(struct ath11k_base *sc);
 int ath11k_debug_register(struct ath11k *ar);
 void ath11k_debug_unregister(struct ath11k *ar);
-void ath11k_htt_stats_debugfs_init(struct ath11k *ar);
 void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 				      struct sk_buff *skb);
 void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf,
@@ -193,10 +192,6 @@ static inline void ath11k_debug_unregister(struct ath11k *ar)
 {
 }
 
-static inline void ath11k_htt_stats_debugfs_init(struct ath11k *ar)
-{
-}
-
 static inline void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 						    struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index ac217d9..ae3814e 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4482,7 +4482,7 @@ static ssize_t ath11k_write_htt_stats_reset(struct file *file,
 	.llseek = default_llseek,
 };
 
-void ath11k_htt_stats_debugfs_init(struct ath11k *ar)
+void ath11k_debug_htt_stats_init(struct ath11k *ar)
 {
 	spin_lock_init(&ar->debug.htt_stats.lock);
 	debugfs_create_file("htt_stats_type", 0600, ar->debug.debugfs_pdev,
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index a542bd3..ce49ca48 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -1612,4 +1612,6 @@ struct htt_pdev_obss_pd_stats_tlv {
 	u32        num_obss_tx_ppdu_success;
 	u32        num_obss_tx_ppdu_failure;
 };
+
+void ath11k_debug_htt_stats_init(struct ath11k *ar);
 #endif
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
