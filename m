Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ0Fn-0007HA-Vm
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 18:34:53 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH v2 3/3] ath11k: Add debugfs entry to support htt stats reset
Date: Wed, 24 Apr 2019 00:03:51 +0530
Message-Id: <1556044431-32431-4-git-send-email-bperumal@codeaurora.org>
In-Reply-To: <1556044431-32431-1-git-send-email-bperumal@codeaurora.org>
References: <1556044431-32431-1-git-send-email-bperumal@codeaurora.org>
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

This adds debugfs entry htt_stats_reset to reset htt stats.

Example to reset pdev tx stats and it's output logs are,

 $echo 1 >/sys/kernel/debug/ath11k/mac0/htt_stats_reset
 $cat /sys/kernel/debug/ath11k/mac0/htt_stats_reset
 1

 $echo 1 >/sys/kernel/debug/ath11k/mac0/htt_stats_type
 $cat /sys/kernel/debug/ath11k/mac0/htt_stats_type
 1

 $cat /sys/kernel/debug/ath11k/mac0/htt_stats
 HTT_TX_PDEV_STATS_CMN_TLV:
 mac_id = 0
 hw_queued = 112
 hw_reaped = 112
 ...

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h            |  1 +
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 61 +++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c5f0a71..c2068b5 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -368,6 +368,7 @@ struct ath11k_fw_stats {
 
 struct ath11k_dbg_htt_stats {
 	u8 type;
+	u8 reset;
 	/* protects shared stats req buffer */
 	spinlock_t lock;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index c44ec49..876134a 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4407,6 +4407,57 @@ static ssize_t ath11k_read_htt_stats(struct file *file,
 	return simple_read_from_buffer(user_buf, count, ppos, buf, length);
 }
 
+static ssize_t ath11k_read_htt_stats_reset(struct file *file,
+					   char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	char buf[32];
+	size_t len;
+
+	len = scnprintf(buf, sizeof(buf), "%u\n", ar->debug.htt_stats.reset);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static ssize_t ath11k_write_htt_stats_reset(struct file *file,
+					    const char __user *user_buf,
+					    size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	u8 type;
+	struct htt_ext_stats_cfg_params cfg_params = { 0 };
+	int ret;
+
+	ret = kstrtou8_from_user(user_buf, count, 0, &type);
+	if (ret)
+		return ret;
+
+	if (type >= ATH11K_DBG_HTT_NUM_EXT_STATS ||
+	    type == ATH11K_DBG_HTT_EXT_STATS_RESET)
+		return -E2BIG;
+
+	mutex_lock(&ar->conf_mutex);
+	cfg_params.cfg0 = HTT_STAT_DEFAULT_RESET_START_OFFSET;
+	cfg_params.cfg1 = 1 << (cfg_params.cfg0 + type);
+	ret = ath11k_dp_htt_h2t_ext_stats_req(ar,
+					      ATH11K_DBG_HTT_EXT_STATS_RESET,
+					      &cfg_params,
+					      0ULL);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
+		mutex_unlock(&ar->conf_mutex);
+		return ret;
+	}
+
+	ar->debug.htt_stats.reset = type;
+	mutex_unlock(&ar->conf_mutex);
+
+	ret = count;
+
+	return ret;
+}
+
 static const struct file_operations fops_htt_stats_type = {
 	.read = ath11k_read_htt_stats_type,
 	.write = ath11k_write_htt_stats_type,
@@ -4423,6 +4474,14 @@ static ssize_t ath11k_read_htt_stats(struct file *file,
 	.llseek = default_llseek,
 };
 
+static const struct file_operations fops_htt_stats_reset = {
+	.read = ath11k_read_htt_stats_reset,
+	.write = ath11k_write_htt_stats_reset,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath11k_htt_stats_debugfs_init(struct ath11k *ar)
 {
 	spin_lock_init(&ar->debug.htt_stats.lock);
@@ -4430,4 +4489,6 @@ void ath11k_htt_stats_debugfs_init(struct ath11k *ar)
 			    ar, &fops_htt_stats_type);
 	debugfs_create_file("htt_stats", 0400, ar->debug.debugfs_pdev,
 			    ar, &fops_dump_htt_stats);
+	debugfs_create_file("htt_stats_reset", 0600, ar->debug.debugfs_pdev,
+			    ar, &fops_htt_stats_reset);
 }
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
