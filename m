Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvzWK-0002BH-EY
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 07:41:05 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: Add debugfs per chip
Date: Fri,  9 Aug 2019 13:10:44 +0530
Message-Id: <1565336444-26904-1-git-send-email-akolli@codeaurora.org>
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

Add debugfs per chip [soc/pci] under ath11k debugfs entry.

Example:
$ls -l /sys/kernel/debug/ath11k/ipq8074/
mac0/              mac2/              soc_ring_stats
mac1/              simulate_fw_crash  soc_rx_stats
$ls -l /sys/kernel/debug/ieee80211/phy0/
lrwxrwxrwx    1 root     root             0 Aug  6 17:06 ath11k ->
../../ath11k/ipq8074/mac0
$ ls -l /sys/kernel/debug/ieee80211/phy0/ath11k/
dfs_block_radar_events  htt_stats               spectral_bins
dfs_simulate_radar      htt_stats_reset         spectral_count
ext_rx_stats            htt_stats_type          spectral_scan0
ext_tx_stats            pktlog/                 spectral_scan_ctl
fw_stats/               pktlog_filter

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  | 11 ++++++++++-
 drivers/net/wireless/ath/ath11k/core.h  |  1 +
 drivers/net/wireless/ath/ath11k/debug.c | 26 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/debug.h | 11 +++++++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2e523afc4da8..24140a664c9b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -374,11 +374,17 @@ static int ath11k_core_pdev_create(struct ath11k_base *sc)
 {
 	int ret;
 
+	ret = ath11k_debug_pdev_create(sc);
+	if (ret) {
+		ath11k_err(sc, "failed to create core pdev debugfs: %d\n", ret);
+		return ret;
+	}
+
 	ret = ath11k_mac_create(sc);
 	if (ret) {
 		ath11k_err(sc, "failed to create new hw device with mac80211 :%d\n",
 			   ret);
-		return ret;
+		goto err_pdev_debug;
 	}
 
 	ret = ath11k_dp_pdev_alloc(sc);
@@ -391,6 +397,8 @@ static int ath11k_core_pdev_create(struct ath11k_base *sc)
 
 err_mac_destroy:
 	ath11k_mac_destroy(sc);
+err_pdev_debug;
+	ath11k_debug_pdev_destroy(sc);
 
 	return ret;
 }
@@ -400,6 +408,7 @@ static void ath11k_core_pdev_destroy(struct ath11k_base *sc)
 	ath11k_mac_unregister(sc);
 	ath11k_ahb_ext_irq_disable(sc);
 	ath11k_dp_pdev_free(sc);
+	ath11k_debug_pdev_destroy(sc);
 }
 
 static int ath11k_core_start(struct ath11k_base *sc,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 79134c4fb2e7..4ba0d100ce1c 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -632,6 +632,7 @@ struct ath11k_base {
 	enum ath11k_dfs_region dfs_region;
 #ifdef CONFIG_ATH11K_DEBUGFS
 	struct dentry *debugfs_soc;
+	struct dentry *debugfs_ath11k;
 #endif
 	struct ath11k_soc_dp_rx_stats soc_stats;
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 4fd99417585c..197392cdf799 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -802,9 +802,9 @@ static ssize_t ath11k_debug_dump_soc_rx_stats(struct file *file,
 	.llseek = default_llseek,
 };
 
-int ath11k_debug_soc_create(struct ath11k_base *ab)
+int ath11k_debug_pdev_create(struct ath11k_base *ab)
 {
-	ab->debugfs_soc = debugfs_create_dir("ath11k", NULL);
+	ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
 
 	if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
 		if (IS_ERR(ab->debugfs_soc))
@@ -821,6 +821,26 @@ int ath11k_debug_soc_create(struct ath11k_base *ab)
 	return 0;
 }
 
+void ath11k_debug_pdev_destroy(struct ath11k_base *ab)
+{
+	debugfs_remove_recursive(ab->debugfs_ath11k);
+	ab->debugfs_ath11k = NULL;
+}
+
+
+int ath11k_debug_soc_create(struct ath11k_base *ab)
+{
+	ab->debugfs_ath11k = debugfs_create_dir("ath11k", NULL);
+
+	if (IS_ERR_OR_NULL(ab->debugfs_ath11k)) {
+		if (IS_ERR(ab->debugfs_ath11k))
+			return PTR_ERR(ab->debugfs_ath11k);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 void ath11k_debug_soc_destroy(struct ath11k_base *ab)
 {
 	debugfs_remove_recursive(ab->debugfs_soc);
@@ -1007,7 +1027,7 @@ int ath11k_debug_register(struct ath11k *ar)
 	}
 
 	/* Create a symlink under ieee80211/phy* */
-	snprintf(buf, 100, "../../%pd2", ar->debug.debugfs_pdev);
+	snprintf(buf, 100, "../../ath11k/%pd2", ar->debug.debugfs_pdev);
 	debugfs_create_symlink("ath11k", ar->hw->wiphy->debugfsdir, buf);
 
 	ath11k_debug_htt_stats_init(ar);
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 9d90c7ba8a45..81b5e6b39b2f 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -131,6 +131,8 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 #ifdef CONFIG_ATH11K_DEBUGFS
 int ath11k_debug_soc_create(struct ath11k_base *sc);
 void ath11k_debug_soc_destroy(struct ath11k_base *sc);
+int ath11k_debug_pdev_create(struct ath11k_base *sc);
+void ath11k_debug_pdev_destroy(struct ath11k_base *sc);
 int ath11k_debug_register(struct ath11k *ar);
 void ath11k_debug_unregister(struct ath11k *ar);
 void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
@@ -175,6 +177,15 @@ static inline void ath11k_debug_soc_destroy(struct ath11k_base *sc)
 {
 }
 
+static inline int ath11k_debug_pdev_create(struct ath11k_base *sc)
+{
+	return 0;
+}
+
+static inline void ath11k_debug_pdev_destroy(struct ath11k_base *sc)
+{
+}
+
 static inline int ath11k_debug_register(struct ath11k *ar)
 {
 	return 0;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
