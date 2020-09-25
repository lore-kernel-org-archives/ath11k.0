Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjXk-0007eY-Ln
 for ath11k@lists.infradead.org; Fri, 25 Sep 2020 08:57:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: fix undefined reference to
 'ath11k_debugfs_htt_ext_stats_handler'
Date: Fri, 25 Sep 2020 11:57:21 +0300
Message-Id: <1601024241-16594-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

kbuild bot reported than link fails when CONFIG_ATH11K_DEBUGFS is disabled:

drivers/net/wireless/ath/ath11k/dp_rx.c:1662: undefined reference to `ath11k_debugfs_htt_ext_stats_handler'

This was because I had missed to move the static inline version of the function
(which are used when CONFIG_ATH11K_DEBUGFS is disabled) to debufs_htt_stats.h.
Also move ath11k_debugfs_htt_stats_req() at the same time. And create a stub
also for ath11k_debugfs_htt_stats_init() for consistency, even if it's not
needed.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 568f06036ee2 ("ath11k: debugfs: move some function declarations to correct header files")
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs.h           | 10 ----------
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index d1ed2e72e5d1..e5346af71f24 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -173,11 +173,6 @@ static inline void ath11k_debugfs_unregister(struct ath11k *ar)
 {
 }
 
-static inline void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
-						    struct sk_buff *skb)
-{
-}
-
 static inline void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab,
 						   struct sk_buff *skb)
 {
@@ -197,11 +192,6 @@ static inline int ath11k_debugfs_is_extd_rx_stats_enabled(struct ath11k *ar)
 	return 0;
 }
 
-static inline int ath11k_debugfs_htt_stats_req(struct ath11k *ar)
-{
-	return 0;
-}
-
 static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 {
 	return false;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index a36a4fed8800..74b2086eed9d 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -1685,9 +1685,29 @@ struct htt_ring_backpressure_stats_tlv {
 	u32 backpressure_hist[5];
 };
 
+#ifdef CONFIG_ATH11K_DEBUGFS
+
 void ath11k_debugfs_htt_stats_init(struct ath11k *ar);
 void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
 					  struct sk_buff *skb);
 int ath11k_debugfs_htt_stats_req(struct ath11k *ar);
 
+#else /* CONFIG_ATH11K_DEBUGFS */
+
+static inline void ath11k_debugfs_htt_stats_init(struct ath11k *ar)
+{
+}
+
+static inline void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
+							struct sk_buff *skb)
+{
+}
+
+static inline int ath11k_debugfs_htt_stats_req(struct ath11k *ar)
+{
+	return 0;
+}
+
+#endif /* CONFIG_ATH11K_DEBUGFS */
+
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
