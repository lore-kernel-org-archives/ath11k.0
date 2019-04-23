Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ0Fd-0007Fu-Vg
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 18:34:43 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH v2 2/3] ath11k: Add htt peer stats support
Date: Wed, 24 Apr 2019 00:03:50 +0530
Message-Id: <1556044431-32431-3-git-send-email-bperumal@codeaurora.org>
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

This adds separate debugfs entry to get per peer htt stats.
And adds config params in htt stats request, this is used
to enter peer mac addr for per peer stats and
other default settings.

Example output log is,

$cat /sys/kernel/debug/ieee80211/phy0/netdev:wlan0/stations/8c:fd:f0:07:3e:39/htt_peer_stats
HTT_PEER_DETAILS_TLV:
peer_type = 0
sw_peer_id = 6
vdev_id = 0
pdev_id = 0
ast_idx = 906
mac_addr = 8c:fd:f0:07:3e:39
peer_flags = 0x18b0
qpeer_flags = 0x8
....

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h           |  50 ++++++++++
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 115 +++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  30 ------
 drivers/net/wireless/ath/ath11k/debugfs_sta.c     |  56 +++++++++++
 drivers/net/wireless/ath/ath11k/dp.h              |  40 ++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c           |   8 +-
 drivers/net/wireless/ath/ath11k/dp_tx.h           |   1 +
 7 files changed, 243 insertions(+), 57 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 66a596c..4c1fcca 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -23,6 +23,48 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_ANY		= 0xffffffff,
 };
 
+/* htt_dbg_ext_stats_type */
+enum ath11k_dbg_htt_ext_stats_type {
+	ATH11K_DBG_HTT_EXT_STATS_RESET                      =  0,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX                    =  1,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_RX                    =  2,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_HWQ                =  3,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_SCHED              =  4,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_ERROR                 =  5,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TQM                   =  6,
+	ATH11K_DBG_HTT_EXT_STATS_TQM_CMDQ                   =  7,
+	ATH11K_DBG_HTT_EXT_STATS_TX_DE_INFO                 =  8,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_RATE               =  9,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_RX_RATE               =  10,
+	ATH11K_DBG_HTT_EXT_STATS_PEER_INFO                  =  11,
+	ATH11K_DBG_HTT_EXT_STATS_TX_SELFGEN_INFO            =  12,
+	ATH11K_DBG_HTT_EXT_STATS_TX_MU_HWQ                  =  13,
+	ATH11K_DBG_HTT_EXT_STATS_RING_IF_INFO               =  14,
+	ATH11K_DBG_HTT_EXT_STATS_SRNG_INFO                  =  15,
+	ATH11K_DBG_HTT_EXT_STATS_SFM_INFO                   =  16,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_MU                 =  17,
+	ATH11K_DBG_HTT_EXT_STATS_ACTIVE_PEERS_LIST          =  18,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS             =  19,
+	ATH11K_DBG_HTT_EXT_STATS_TWT_SESSIONS               =  20,
+	ATH11K_DBG_HTT_EXT_STATS_REO_RESOURCE_STATS         =  21,
+	ATH11K_DBG_HTT_EXT_STATS_TX_SOUNDING_INFO           =  22,
+
+	/* keep this last */
+	ATH11K_DBG_HTT_NUM_EXT_STATS,
+};
+
+struct debug_htt_stats_req {
+	bool done;
+	u8 pdev_id;
+	u8 type;
+	u8 peer_addr[ETH_ALEN];
+	struct completion cmpln;
+	u32 buf_len;
+	u8 buf[0];
+};
+
+#define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
+
 #define ATH11K_FW_STATS_BUF_SIZE (1024 * 1024)
 
 enum ath11k_pktlog_filter {
@@ -101,6 +143,8 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf,
 				   u32 len);
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar);
+int ath11k_dbg_htt_stats_req(struct ath11k *ar,
+			     struct debug_htt_stats_req *stats_req);
 
 static inline int ath11k_debug_is_extd_tx_stats_enabled(struct ath11k *ar)
 {
@@ -157,6 +201,12 @@ static inline int ath11k_debug_is_extd_rx_stats_enabled(struct ath11k *ar)
 {
 	return 0;
 }
+
+static inline int ath11k_dbg_htt_stats_req(struct ath11k *ar,
+					   struct debug_htt_stats_req *stats_req)
+{
+	return 0;
+}
 #endif /* CONFIG_ATH11K_DEBUGFS */
 
 #ifdef CONFIG_MAC80211_DEBUGFS
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 30e1664..c44ec49 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -12,7 +12,6 @@
 
 #define HTT_DBG_OUT(buf, len, fmt, ...) \
 			scnprintf(buf, len, fmt "\n", ##__VA_ARGS__)
-#define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
 
 #define HTT_MAX_STRING_LEN 256
 #define HTT_MAX_PRINT_CHAR_PER_ELEM 15
@@ -30,14 +29,6 @@
 		}									\
 	} while (0)
 
-struct debug_htt_stats_req {
-	bool done;
-	u8 pdev_id;
-	struct completion cmpln;
-	u32 buf_len;
-	u8 buf[0];
-};
-
 static inline void htt_print_stats_string_tlv(const u32 *tag_buf,
 					      u16 tag_len,
 					      u8 *user_data)
@@ -4262,10 +4253,11 @@ static ssize_t ath11k_write_htt_stats_type(struct file *file,
 	if (ret)
 		return ret;
 
-	if (type >= HTT_DBG_NUM_EXT_STATS)
+	if (type >= ATH11K_DBG_HTT_NUM_EXT_STATS)
 		return -E2BIG;
 
-	if (type == HTT_DBG_EXT_STATS_RESET)
+	if (type == ATH11K_DBG_HTT_EXT_STATS_RESET ||
+	    type == ATH11K_DBG_HTT_EXT_STATS_PEER_INFO)
 		return -EPERM;
 
 	ar->debug.htt_stats.type = type;
@@ -4275,20 +4267,63 @@ static ssize_t ath11k_write_htt_stats_type(struct file *file,
 	return ret;
 }
 
-static int ath11k_open_htt_stats(struct inode *inode, struct file *file)
+static int ath11k_prep_htt_stats_cfg_params(struct ath11k *ar, u8 type,
+					    const u8 *mac_addr,
+					    struct htt_ext_stats_cfg_params *cfg_params)
 {
-	struct ath11k *ar = inode->i_private;
-	struct debug_htt_stats_req *stats_req;
-	u8 type = ar->debug.htt_stats.type;
-	u64 cookie = 0;
-	int ret, pdev_id = ar->pdev->pdev_id;
+	if (!cfg_params)
+		return -EINVAL;
 
-	if (type == HTT_DBG_EXT_STATS_RESET)
-		return -EPERM;
+	switch (type) {
+	case ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_HWQ:
+	case ATH11K_DBG_HTT_EXT_STATS_TX_MU_HWQ:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ALL_HWQS;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_SCHED:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ALL_TXQS;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_TQM_CMDQ:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ALL_CMDQS;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_PEER_INFO:
+		cfg_params->cfg0 = HTT_STAT_PEER_INFO_MAC_ADDR;
+		cfg_params->cfg0 |= FIELD_PREP(GENMASK(15, 1),
+					HTT_PEER_STATS_REQ_MODE_FLUSH_TQM);
+		cfg_params->cfg1 = HTT_STAT_DEFAULT_PEER_REQ_TYPE;
+		cfg_params->cfg2 |= FIELD_PREP(GENMASK(7, 0), mac_addr[0]);
+		cfg_params->cfg2 |= FIELD_PREP(GENMASK(15, 8), mac_addr[1]);
+		cfg_params->cfg2 |= FIELD_PREP(GENMASK(23, 16), mac_addr[2]);
+		cfg_params->cfg2 |= FIELD_PREP(GENMASK(31, 24), mac_addr[3]);
+		cfg_params->cfg3 |= FIELD_PREP(GENMASK(7, 0), mac_addr[4]);
+		cfg_params->cfg3 |= FIELD_PREP(GENMASK(15, 8), mac_addr[5]);
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_RING_IF_INFO:
+	case ATH11K_DBG_HTT_EXT_STATS_SRNG_INFO:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ALL_RINGS;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_ACTIVE_PEERS_LIST:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ACTIVE_PEERS;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_CCA_CUMULATIVE;
+		break;
+	case ATH11K_DBG_HTT_EXT_STATS_TX_SOUNDING_INFO:
+		cfg_params->cfg0 = HTT_STAT_DEFAULT_CFG0_ACTIVE_VDEVS;
+		break;
+	default:
+		break;
+	}
 
-	stats_req = vmalloc(sizeof(*stats_req) + ATH11K_HTT_STATS_BUF_SIZE);
-	if (!stats_req)
-		return -ENOMEM;
+	return 0;
+}
+
+int ath11k_dbg_htt_stats_req(struct ath11k *ar,
+			     struct debug_htt_stats_req *stats_req)
+{
+	u8 type = stats_req->type;
+	u64 cookie = 0;
+	int ret, pdev_id = ar->pdev->pdev_id;
+	struct htt_ext_stats_cfg_params cfg_params = { 0 };
 
 	init_completion(&stats_req->cmpln);
 
@@ -4297,12 +4332,19 @@ static int ath11k_open_htt_stats(struct inode *inode, struct file *file)
 
 	cookie = (u64)(uintptr_t)stats_req;
 
+	ret = ath11k_prep_htt_stats_cfg_params(ar, type, stats_req->peer_addr,
+					       &cfg_params);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set htt stats cfg params: %d\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&ar->conf_mutex);
-	ret = ath11k_dp_htt_h2t_ext_stats_req(ar, type, cookie);
+	ret = ath11k_dp_htt_h2t_ext_stats_req(ar, type, &cfg_params, cookie);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
 		mutex_unlock(&ar->conf_mutex);
-		goto out;
+		return ret;
 	}
 	mutex_unlock(&ar->conf_mutex);
 
@@ -4312,12 +4354,33 @@ static int ath11k_open_htt_stats(struct inode *inode, struct file *file)
 			stats_req->done = true;
 			spin_unlock_bh(&ar->debug.htt_stats.lock);
 			ath11k_warn(ar->ab, "stats request timed out\n");
-			ret = -ETIMEDOUT;
-			goto out;
+			return -ETIMEDOUT;
 		}
 		spin_unlock_bh(&ar->debug.htt_stats.lock);
 	}
 
+	return 0;
+}
+
+static int ath11k_open_htt_stats(struct inode *inode, struct file *file)
+{
+	struct ath11k *ar = inode->i_private;
+	struct debug_htt_stats_req *stats_req;
+	u8 type = ar->debug.htt_stats.type;
+	int ret;
+
+	if (type == ATH11K_DBG_HTT_EXT_STATS_RESET)
+		return -EPERM;
+
+	stats_req = vzalloc(sizeof(*stats_req) + ATH11K_HTT_STATS_BUF_SIZE);
+	if (!stats_req)
+		return -ENOMEM;
+
+	stats_req->type = type;
+	ret = ath11k_dbg_htt_stats_req(ar, stats_req);
+	if (ret < 0)
+		goto out;
+
 	file->private_data = stats_req;
 	return 0;
 out:
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index ce1f8fb..a542bd3 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -6,36 +6,6 @@
 #ifndef DEBUG_HTT_STATS_H
 #define DEBUG_HTT_STATS_H
 
-/* htt_dbg_ext_stats_type */
-enum htt_dbg_ext_stats_type {
-	HTT_DBG_EXT_STATS_RESET                      =  0,
-	HTT_DBG_EXT_STATS_PDEV_TX                    =  1,
-	HTT_DBG_EXT_STATS_PDEV_RX                    =  2,
-	HTT_DBG_EXT_STATS_PDEV_TX_HWQ                =  3,
-	HTT_DBG_EXT_STATS_PDEV_TX_SCHED              =  4,
-	HTT_DBG_EXT_STATS_PDEV_ERROR                 =  5,
-	HTT_DBG_EXT_STATS_PDEV_TQM                   =  6,
-	HTT_DBG_EXT_STATS_TQM_CMDQ                   =  7,
-	HTT_DBG_EXT_STATS_TX_DE_INFO                 =  8,
-	HTT_DBG_EXT_STATS_PDEV_TX_RATE               =  9,
-	HTT_DBG_EXT_STATS_PDEV_RX_RATE               =  10,
-	HTT_DBG_EXT_STATS_PEER_INFO                  =  11,
-	HTT_DBG_EXT_STATS_TX_SELFGEN_INFO            =  12,
-	HTT_DBG_EXT_STATS_TX_MU_HWQ                  =  13,
-	HTT_DBG_EXT_STATS_RING_IF_INFO               =  14,
-	HTT_DBG_EXT_STATS_SRNG_INFO                  =  15,
-	HTT_DBG_EXT_STATS_SFM_INFO                   =  16,
-	HTT_DBG_EXT_STATS_PDEV_TX_MU                 =  17,
-	HTT_DBG_EXT_STATS_ACTIVE_PEERS_LIST          =  18,
-	HTT_DBG_EXT_STATS_PDEV_CCA_STATS             =  19,
-	HTT_DBG_EXT_STATS_TWT_SESSIONS               =  20,
-	HTT_DBG_EXT_STATS_REO_RESOURCE_STATS         =  21,
-	HTT_DBG_EXT_STATS_TX_SOUNDING_INFO           =  22,
-
-	/* keep this last */
-	HTT_DBG_NUM_EXT_STATS,
-};
-
 enum htt_tlv_tag_t {
 	HTT_STATS_TX_PDEV_CMN_TAG                           = 0,
 	HTT_STATS_TX_PDEV_UNDERRUN_TAG                      = 1,
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 41b2221..4e5dfeb 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -382,6 +382,60 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 	.llseek = default_llseek,
 };
 
+static int
+ath11k_dbg_sta_open_htt_peer_stats(struct inode *inode, struct file *file)
+{
+	struct ieee80211_sta *sta = inode->i_private;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k *ar = arsta->arvif->ar;
+	struct debug_htt_stats_req *stats_req;
+	int ret;
+
+	stats_req = vzalloc(sizeof(*stats_req) + ATH11K_HTT_STATS_BUF_SIZE);
+	if (!stats_req)
+		return -ENOMEM;
+
+	stats_req->type = ATH11K_DBG_HTT_EXT_STATS_PEER_INFO;
+	memcpy(stats_req->peer_addr, sta->addr, ETH_ALEN);
+	ret = ath11k_dbg_htt_stats_req(ar, stats_req);
+	if (ret < 0)
+		goto out;
+
+	file->private_data = stats_req;
+	return 0;
+out:
+	vfree(stats_req);
+	return ret;
+}
+
+static int
+ath11k_dbg_sta_release_htt_peer_stats(struct inode *inode, struct file *file)
+{
+	vfree(file->private_data);
+	return 0;
+}
+
+static ssize_t ath11k_dbg_sta_read_htt_peer_stats(struct file *file,
+						  char __user *user_buf,
+						  size_t count, loff_t *ppos)
+{
+	struct debug_htt_stats_req *stats_req = file->private_data;
+	char *buf;
+	u32 length = 0;
+
+	buf = stats_req->buf;
+	length = min_t(u32, stats_req->buf_len, ATH11K_HTT_STATS_BUF_SIZE);
+	return simple_read_from_buffer(user_buf, count, ppos, buf, length);
+}
+
+static const struct file_operations fops_htt_peer_stats = {
+	.open = ath11k_dbg_sta_open_htt_peer_stats,
+	.release = ath11k_dbg_sta_release_htt_peer_stats,
+	.read = ath11k_dbg_sta_read_htt_peer_stats,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
@@ -393,4 +447,6 @@ void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (ath11k_debug_is_extd_rx_stats_enabled(ar))
 		debugfs_create_file("rx_stats", 0400, dir, sta,
 				    &fops_rx_stats);
+	debugfs_create_file("htt_peer_stats", 0400, dir, sta,
+			    &fops_htt_peer_stats);
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index fb880df..2774a4c 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1161,6 +1161,46 @@ struct htt_ext_stats_cfg_cmd {
 	u32 cookie_msb;
 } __packed;
 
+/* htt stats config default params */
+#define HTT_STAT_DEFAULT_RESET_START_OFFSET 0
+#define HTT_STAT_DEFAULT_CFG0_ALL_HWQS 0xffffffff
+#define HTT_STAT_DEFAULT_CFG0_ALL_TXQS 0xffffffff
+#define HTT_STAT_DEFAULT_CFG0_ALL_CMDQS 0xffff
+#define HTT_STAT_DEFAULT_CFG0_ALL_RINGS 0xffff
+#define HTT_STAT_DEFAULT_CFG0_ACTIVE_PEERS 0xff
+#define HTT_STAT_DEFAULT_CFG0_CCA_CUMULATIVE 0x10
+#define HTT_STAT_DEFAULT_CFG0_ACTIVE_VDEVS 0xff
+
+/* HTT_DBG_EXT_STATS_PEER_INFO
+ * PARAMS:
+ * @config_param0:
+ *  [Bit0] - [0] for sw_peer_id, [1] for mac_addr based request
+ *  [Bit15 : Bit 1] htt_peer_stats_req_mode_t
+ *  [Bit31 : Bit16] sw_peer_id
+ * @config_param1:
+ *  peer_stats_req_type_mask:32 (enum htt_peer_stats_tlv_enum)
+ *   0 bit htt_peer_stats_cmn_tlv
+ *   1 bit htt_peer_details_tlv
+ *   2 bit htt_tx_peer_rate_stats_tlv
+ *   3 bit htt_rx_peer_rate_stats_tlv
+ *   4 bit htt_tx_tid_stats_tlv/htt_tx_tid_stats_v1_tlv
+ *   5 bit htt_rx_tid_stats_tlv
+ *   6 bit htt_msdu_flow_stats_tlv
+ * @config_param2: [Bit31 : Bit0] mac_addr31to0
+ * @config_param3: [Bit15 : Bit0] mac_addr47to32
+ *                [Bit31 : Bit16] reserved
+ */
+#define HTT_STAT_PEER_INFO_MAC_ADDR BIT(0)
+#define HTT_STAT_DEFAULT_PEER_REQ_TYPE 0x7f
+
+/* Used to set different configs to the specified stats type.*/
+struct htt_ext_stats_cfg_params {
+	u32 cfg0;
+	u32 cfg1;
+	u32 cfg2;
+	u32 cfg3;
+};
+
 /**
  * @brief target -> host extended statistics upload
  *
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 3ef9d45..79a81ee 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -859,7 +859,9 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	return ret;
 }
 
-int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type, u64 cookie)
+int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				    struct htt_ext_stats_cfg_params *cfg_params,
+				    u64 cookie)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -881,6 +883,10 @@ int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type, u64 cookie)
 	cmd->hdr.pdev_mask = 1 << ar->pdev->pdev_id;
 
 	cmd->hdr.stats_type = type;
+	cmd->cfg_param0 = cfg_params->cfg0;
+	cmd->cfg_param1 = cfg_params->cfg1;
+	cmd->cfg_param2 = cfg_params->cfg2;
+	cmd->cfg_param3 = cfg_params->cfg3;
 	cmd->cookie_lsb = lower_32_bits(cookie);
 	cmd->cookie_msb = upper_32_bits(cookie);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 8dd8e2b..4082c2f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -27,5 +27,6 @@ int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 
 int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
 int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				    struct htt_ext_stats_cfg_params *cfg_params,
 				    u64 cookie);
 #endif
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
