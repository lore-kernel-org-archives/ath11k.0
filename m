Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icNLs-000468-6R
 for ath11k@lists.infradead.org; Wed, 04 Dec 2019 05:37:31 +0000
From: John Crispin <john@phrozen.org>
Subject: [RESEND 6/9] ath11k: add debugfs for TWT debug calls
Date: Wed,  4 Dec 2019 06:37:10 +0100
Message-Id: <20191204053713.3064-7-john@phrozen.org>
In-Reply-To: <20191204053713.3064-1-john@phrozen.org>
References: <20191204053713.3064-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

These new debugfs files allow us to manually add/del/pause/resume TWT
dialogs for test/debug purposes.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |   1 +
 drivers/net/wireless/ath/ath11k/debug.c | 197 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/debug.h |   8 +
 drivers/net/wireless/ath/ath11k/mac.c   |   4 +
 4 files changed, 210 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 25cdcf71d0c4..65d8684364dd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -216,6 +216,7 @@ struct ath11k_vif {
 	int num_legacy_stations;
 	int rtscts_prot_mode;
 	int txpower;
+	struct dentry *debugfs_twt;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index c27fffd13a5d..bcae14e5de9f 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -104,6 +104,203 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
 
 #endif
 
+#ifdef CONFIG_MAC80211_DEBUGFS
+static ssize_t ath11k_write_twt_add_dialog(struct file *file,
+					   const char __user *ubuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_add_dialog_params params = { 0 };
+	u8 buf[128] = {0};
+	int ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u %u %u %hhu %hhu %hhu %hhu %hhu",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id,
+		     &params.wake_intvl_us,
+		     &params.wake_intvl_mantis,
+		     &params.wake_dura_us,
+		     &params.sp_offset_us,
+		     &params.twt_cmd,
+		     &params.flag_bcast,
+		     &params.flag_trigger,
+		     &params.flag_flow_type,
+		     &params.flag_protection);
+	if (ret != 16)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_add_dialog_cmd(arvif->ar, &params);
+
+	return ret ? ret : count;
+}
+
+static ssize_t ath11k_write_twt_del_dialog(struct file *file,
+					   const char __user *ubuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_del_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id);
+	if (ret != 7)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_del_dialog_cmd(arvif->ar, &params);
+
+	return ret ? ret : count;
+}
+
+static ssize_t ath11k_write_twt_pause_dialog(struct file *file,
+					     const char __user *ubuf,
+					     size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_pause_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id);
+	if (ret != 7)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_pause_dialog_cmd(arvif->ar, &params);
+
+	return ret ? ret : count;
+}
+
+static ssize_t ath11k_write_twt_resume_dialog(struct file *file,
+					      const char __user *ubuf,
+					      size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_resume_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id,
+		     &params.sp_offset_us,
+		     &params.next_twt_size);
+	if (ret != 9)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_resume_dialog_cmd(arvif->ar, &params);
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations ath11k_fops_twt_add_dialog = {
+	.write = ath11k_write_twt_add_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_del_dialog = {
+	.write = ath11k_write_twt_del_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_pause_dialog = {
+	.write = ath11k_write_twt_pause_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_resume_dialog = {
+	.write = ath11k_write_twt_resume_dialog,
+	.open = simple_open
+};
+
+void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable)
+{
+	if (!enable && arvif->debugfs_twt) {
+		debugfs_remove_recursive(arvif->debugfs_twt);
+		arvif->debugfs_twt = NULL;
+		return;
+	}
+
+	if (arvif->debugfs_twt)
+		return;
+
+	arvif->debugfs_twt = debugfs_create_dir("twt", arvif->vif->debugfs_dir);
+	if (IS_ERR_OR_NULL(arvif->debugfs_twt)) {
+		ath11k_warn(arvif->ar->ab,
+			    "failed to create twt debugfs: %p\n",
+			    arvif->debugfs_twt);
+		arvif->debugfs_twt = NULL;
+		return;
+	}
+
+	debugfs_create_file("add_dialog", 0200,
+			    arvif->debugfs_twt, arvif,
+			    &ath11k_fops_twt_add_dialog);
+
+	debugfs_create_file("del_dialog", 0200,
+			    arvif->debugfs_twt, arvif,
+			    &ath11k_fops_twt_del_dialog);
+
+	debugfs_create_file("pause_dialog", 0200,
+			    arvif->debugfs_twt, arvif,
+			    &ath11k_fops_twt_pause_dialog);
+
+	debugfs_create_file("resume_dialog", 0200,
+			    arvif->debugfs_twt, arvif,
+			    &ath11k_fops_twt_resume_dialog);
+}
+#endif
+
 #ifdef CONFIG_ATH11K_DEBUGFS
 static void ath11k_fw_stats_pdevs_free(struct list_head *head)
 {
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index a317a7bdb9a2..805e30c07e14 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -133,6 +133,14 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 }
 #endif /* CONFIG_ATH11K_DEBUG */
 
+#ifdef CONFIG_MAC80211_DEBUGFS
+void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable);
+#else
+static inline void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable)
+{
+}
+#endif
+
 #ifdef CONFIG_ATH11K_DEBUGFS
 int ath11k_debug_soc_create(struct ath11k_base *ab);
 void ath11k_debug_soc_destroy(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a2c8a52b8621..6a8c1c3b8da2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1920,6 +1920,8 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev_idx);
 		else
 			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev_idx);
+		if (vif->type == NL80211_IFTYPE_AP)
+			ath11k_debugfs_twt(arvif, info->twt_requester);
 	}
 
 	if (changed & BSS_CHANGED_HE_OBSS_PD)
@@ -4217,6 +4219,8 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 
 	/* TODO: recal traffic pause state based on the available vdevs */
 
+	debugfs_remove_recursive(arvif->debugfs_twt);
+	arvif->debugfs_twt = NULL;
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
