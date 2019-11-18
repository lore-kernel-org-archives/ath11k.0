Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWneO-0001Rx-Oq
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 20:29:34 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 2/2] ath11k: add debugfs for TWT debug calls
Date: Mon, 18 Nov 2019 21:29:24 +0100
Message-Id: <20191118202924.24427-2-john@phrozen.org>
In-Reply-To: <20191118202924.24427-1-john@phrozen.org>
References: <20191118202924.24427-1-john@phrozen.org>
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
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

These new debugfs files allow us to manually add/del/pause/resume TWT dialogs
for test/debug purposes.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |   1 +
 drivers/net/wireless/ath/ath11k/debug.c | 197 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/debug.h |   9 ++
 drivers/net/wireless/ath/ath11k/mac.c   |   4 +
 drivers/net/wireless/ath/ath11k/wmi.c   |  44 +++---
 5 files changed, 233 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 90b78360bb07..3120d553893c 100644
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
index c27fffd13a5d..4d73015657ee 100644
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
+	if (ret < 0) {
+		return ret;
+	}
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
+	if (ret < 0) {
+		return ret;
+	}
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
+	if (ret < 0) {
+		return ret;
+	}
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
+	if (ret < 0) {
+		return ret;
+	}
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
+		ath11k_warn(arvif->ar->ab, "failed to create twt debugfs: %p\n", arvif->debugfs_twt);
+		arvif->debugfs_twt = NULL;
+                return;
+        }
+
+	debugfs_create_file("add_dialog", 0200,
+			arvif->debugfs_twt, arvif,
+			&ath11k_fops_twt_add_dialog);
+
+	debugfs_create_file("del_dialog", 0200,
+			arvif->debugfs_twt, arvif,
+			&ath11k_fops_twt_del_dialog);
+
+	debugfs_create_file("pause_dialog", 0200,
+			arvif->debugfs_twt, arvif,
+			&ath11k_fops_twt_pause_dialog);
+
+	debugfs_create_file("resume_dialog", 0200,
+			arvif->debugfs_twt, arvif,
+			&ath11k_fops_twt_resume_dialog);
+}
+#endif
+
 #ifdef CONFIG_ATH11K_DEBUGFS
 static void ath11k_fw_stats_pdevs_free(struct list_head *head)
 {
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index a317a7bdb9a2..4eba6414024b 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -133,6 +133,15 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 }
 #endif /* CONFIG_ATH11K_DEBUG */
 
+#ifdef CONFIG_MAC80211_DEBUGFS
+void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable);
+#else
+static inline void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable)
+{
+
+}
+#endif
+
 #ifdef CONFIG_ATH11K_DEBUGFS
 int ath11k_debug_soc_create(struct ath11k_base *ab);
 void ath11k_debug_soc_destroy(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index fc9ada2caa9f..4e0800205a71 100644
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
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dba7bfd225c9..b0b9ea3243a9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -236,22 +236,22 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id)
 {
-	struct ath11k_wmi_base *wmi_sc = wmi->wmi_ab;
+	struct ath11k_wmi_base *wmi_ab = wmi->wmi_ab;
 	int ret = -EOPNOTSUPP;
 
 	might_sleep();
 
-	wait_event_timeout(wmi_sc->tx_credits_wq, ({
+	wait_event_timeout(wmi_ab->tx_credits_wq, ({
 		ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
-		if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH, &wmi_sc->ab->dev_flags))
+		if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH, &wmi_ab->ab->dev_flags))
 			ret = -ESHUTDOWN;
 
 		(ret != -EAGAIN);
 	}), WMI_SEND_TIMEOUT_HZ);
 
 	if (ret == -EAGAIN)
-		ath11k_warn(wmi_sc->ab, "wmi command %d timeout\n", cmd_id);
+		ath11k_warn(wmi_ab->ab, "wmi command %d timeout\n", cmd_id);
 
 	return ret;
 }
@@ -505,10 +505,10 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 	return 0;
 }
 
-struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len)
+struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_ab, u32 len)
 {
 	struct sk_buff *skb;
-	struct ath11k_base *ab = wmi_sc->ab;
+	struct ath11k_base *ab = wmi_ab->ab;
 	u32 round_len = roundup(len, 4);
 
 	skb = ath11k_htc_alloc_skb(ab, WMI_SKB_HEADROOM + round_len);
@@ -2587,14 +2587,14 @@ ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
 				   struct wmi_twt_add_dialog_params *params)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
-	struct ath11k_base *ab = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
 	struct wmi_twt_add_dialog_params_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
 
 	len = sizeof(*cmd);
 
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -2634,14 +2634,14 @@ ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
 				   struct wmi_twt_del_dialog_params *params)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
-	struct ath11k_base *ab = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
 	struct wmi_twt_del_dialog_params_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
 
 	len = sizeof(*cmd);
 
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -2668,14 +2668,14 @@ ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
 				     struct wmi_twt_pause_dialog_params *params)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
-	struct ath11k_base *ab = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
 	struct wmi_twt_pause_dialog_params_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
 
 	len = sizeof(*cmd);
 
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -2702,14 +2702,14 @@ ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
 				      struct wmi_twt_resume_dialog_params *params)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
-	struct ath11k_base *ab = wmi->wmi_sc->sc;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
 	struct wmi_twt_resume_dialog_params_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
 
 	len = sizeof(*cmd);
 
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -3008,7 +3008,7 @@ int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab)
 
 int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 {
-	struct ath11k_wmi_base *wmi_sc = &ab->wmi_ab;
+	struct ath11k_wmi_base *wmi_ab = &ab->wmi_ab;
 	struct wmi_init_cmd_param init_param;
 	struct target_resource_config  config;
 
@@ -3060,21 +3060,21 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	config.twt_ap_pdev_count = 2;
 	config.twt_ap_sta_count = 1000;
 
-	memcpy(&wmi_sc->wlan_resource_config, &config, sizeof(config));
+	memcpy(&wmi_ab->wlan_resource_config, &config, sizeof(config));
 
-	init_param.res_cfg = &wmi_sc->wlan_resource_config;
-	init_param.num_mem_chunks = wmi_sc->num_mem_chunks;
-	init_param.hw_mode_id = wmi_sc->preferred_hw_mode;
-	init_param.mem_chunks = wmi_sc->mem_chunks;
+	init_param.res_cfg = &wmi_ab->wlan_resource_config;
+	init_param.num_mem_chunks = wmi_ab->num_mem_chunks;
+	init_param.hw_mode_id = wmi_ab->preferred_hw_mode;
+	init_param.mem_chunks = wmi_ab->mem_chunks;
 
-	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE)
+	if (wmi_ab->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE)
 		init_param.hw_mode_id = WMI_HOST_HW_MODE_MAX;
 
 	init_param.num_band_to_mac = ab->num_radios;
 
 	ath11k_fill_band_to_mac_param(ab, init_param.band_to_mac);
 
-	return ath11k_init_cmd_send(&wmi_sc->wmi[0], &init_param);
+	return ath11k_init_cmd_send(&wmi_ab->wmi[0], &init_param);
 }
 
 static int ath11k_wmi_tlv_hw_mode_caps_parse(struct ath11k_base *soc,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
