Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPGE-0001Cy-FH
 for ath11k@lists.infradead.org; Tue, 14 May 2019 04:41:56 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 3/3] ath11k: Add dfs debug and test interface
Date: Tue, 14 May 2019 10:11:19 +0530
Message-Id: <1557808879-26933-4-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1557808879-26933-1-git-send-email-srirrama@codeaurora.org>
References: <1557808879-26933-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Add support to simulate radar to validate DFS implementation of NOL, NOP in firmware,
host and CSA offload. This is done with the help of FW Unit test commands.
Also block_radar_events is used to validate the firmware/host DFS implementation
and behavior when the detected radar is not indicated to mac80211.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |   1 +
 drivers/net/wireless/ath/ath11k/debug.c |  28 +++++++++
 drivers/net/wireless/ath/ath11k/wmi.c   | 104 +++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h   |  28 +++++++++
 4 files changed, 159 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7b98649..148c9a4 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -515,6 +515,7 @@ struct ath11k {
 #ifdef CONFIG_ATH11K_DEBUGFS
 	struct ath11k_debug debug;
 #endif
+	bool dfs_block_radar_events;
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index b6e1893..4580c15 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1099,12 +1099,31 @@ static ssize_t ath11k_read_pktlog_filter(struct file *file,
 	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
 }
 
+static ssize_t ath11k_write_simulate_radar(struct file *file,
+					   const char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	int ret;
+
+	ret = ath11k_wmi_simulate_radar(ar);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static const struct file_operations fops_pktlog_filter = {
 	.read = ath11k_read_pktlog_filter,
 	.write = ath11k_write_pktlog_filter,
 	.open = simple_open
 };
 
+static const struct file_operations fops_simulate_radar = {
+	.write = ath11k_write_simulate_radar,
+	.open = simple_open
+};
+
 int ath11k_debug_register(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
@@ -1140,6 +1159,15 @@ int ath11k_debug_register(struct ath11k *ar)
 			    ar->debug.debugfs_pdev, ar,
 			    &fops_pktlog_filter);
 
+	if (ar->hw->wiphy->bands[NL80211_BAND_5GHZ]) {
+		debugfs_create_file("dfs_simulate_radar", 0200,
+				    ar->debug.debugfs_pdev, ar,
+				    &fops_simulate_radar);
+		debugfs_create_bool("dfs_block_radar_events", 0200,
+				    ar->debug.debugfs_pdev,
+				    &ar->dfs_block_radar_events);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8364e44..4f2ac21 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5815,10 +5815,13 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
 		goto exit;
 	}
 
-	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "Radar Detected in pdev %d\n",
+	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "DFS Radar Detected in pdev %d\n",
 		   ev->pdev_id);
 
-	ieee80211_radar_detected(ar->hw);
+	if (ar->dfs_block_radar_events)
+		ath11k_info(ab, "DFS Radar detected, but ignored as requested\n");
+	else
+		ieee80211_radar_detected(ar->hw);
 
 exit:
 	kfree(tb);
@@ -5960,6 +5963,103 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *sc,
 	return 0;
 }
 
+static int
+ath11k_wmi_send_unit_test_cmd(struct ath11k *ar,
+			      struct wmi_unit_test_cmd ut_cmd,
+			      u32 *test_args)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_unit_test_cmd *cmd;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	void *ptr;
+	u32 *ut_cmd_args;
+	int buf_len, arg_len;
+	int ret;
+	int i;
+
+	arg_len = (sizeof(u32) * ut_cmd.num_args);
+	buf_len = sizeof(ut_cmd) + arg_len + TLV_HDR_SIZE;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, buf_len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_unit_test_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_UNIT_TEST_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, sizeof(ut_cmd) - TLV_HDR_SIZE);
+
+	cmd->vdev_id = ut_cmd.vdev_id;
+	cmd->module_id = ut_cmd.module_id;
+	cmd->num_args = ut_cmd.num_args;
+	cmd->diag_token = ut_cmd.diag_token;
+
+	ptr = skb->data + sizeof(ut_cmd);
+
+	tlv = ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
+		      FIELD_PREP(WMI_TLV_LEN, arg_len);
+
+	ptr += TLV_HDR_SIZE;
+
+	ut_cmd_args = ptr;
+	for (i = 0; i < ut_cmd.num_args; i++)
+		ut_cmd_args[i] = test_args[i];
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_UNIT_TEST_CMDID);
+
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send WMI_UNIT_TEST CMD :%d\n",
+			    ret);
+		dev_kfree_skb(skb);
+	}
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "WMI unit test : module %d vdev %d n_args %d token %d\n",
+		   cmd->module_id, cmd->vdev_id, cmd->num_args,
+		   cmd->diag_token);
+
+	return ret;
+}
+
+int ath11k_wmi_simulate_radar(struct ath11k *ar)
+{
+	struct ath11k_vif *arvif;
+	u32 dfs_args[DFS_MAX_TEST_ARGS];
+	struct wmi_unit_test_cmd wmi_ut;
+	bool arvif_found = false;
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif->is_started && arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+			arvif_found = true;
+			break;
+		}
+	}
+
+	if (!arvif_found)
+		return -EINVAL;
+
+	dfs_args[DFS_TEST_CMDID] = 0;
+	dfs_args[DFS_TEST_PDEV_ID] = ar->pdev->pdev_id;
+	/* Currently we could pass segment_id(b0 - b1), chirp(b2)
+	 * freq offset (b3 - b10) to unit test. For simulation
+	 * purpose this can be set to 0 which is valid.
+	 */
+	dfs_args[DFS_TEST_RADAR_PARAM] = 0;
+
+	wmi_ut.vdev_id = arvif->vdev_id;
+	wmi_ut.module_id = DFS_UNIT_TEST_MODULE;
+	wmi_ut.num_args = DFS_MAX_TEST_ARGS;
+	wmi_ut.diag_token = DFS_UNIT_TEST_TOKEN;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "Triggering Radar Simulation\n");
+
+	return ath11k_wmi_send_unit_test_cmd(ar, wmi_ut, dfs_args);
+}
+
 int ath11k_wmi_connect(struct ath11k_base *sc)
 {
 	u32 i;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index bd7e88a..e972154 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4113,6 +4113,32 @@ struct wmi_pktlog_disable_cmd {
 	u32 pdev_id;
 } __packed;
 
+#define DFS_PHYERR_UNIT_TEST_CMD 0
+#define DFS_UNIT_TEST_MODULE	0x2b
+#define DFS_UNIT_TEST_TOKEN	0xAA
+
+enum dfs_test_args_idx {
+	DFS_TEST_CMDID = 0,
+	DFS_TEST_PDEV_ID,
+	DFS_TEST_RADAR_PARAM,
+	DFS_MAX_TEST_ARGS,
+};
+
+struct wmi_dfs_unit_test_arg {
+	u32 cmd_id;
+	u32 pdev_id;
+	u32 radar_param;
+};
+
+struct wmi_unit_test_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 module_id;
+	u32 num_args;
+	u32 diag_token;
+	/* Followed by test args*/
+} __packed;
+
 #define MAX_SUPPORTED_RATES 128
 
 #define WMI_PEER_AUTH           0x00000001
@@ -4199,6 +4225,7 @@ enum wmi_vdev_start_resp_status_code {
 	WMI_VDEV_START_RESPONSE_DFS_VIOLATION = 3,
 };
 
+;
 enum cc_setting_code {
 	REG_SET_CC_STATUS_PASS = 0,
 	REG_CURRENT_ALPHA2_NOT_FOUND = 1,
@@ -5204,4 +5231,5 @@ size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head);
 void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 			      struct ath11k_fw_stats *fw_stats, u32 stats_id,
 			      char *buf);
+int ath11k_wmi_simulate_radar(struct ath11k *ar);
 #endif
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
