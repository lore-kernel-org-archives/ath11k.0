Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblHw-0003od-Lr
 for ath11k@lists.infradead.org; Thu, 21 May 2020 13:31:17 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 1/3] ath11k: vdev delete synchronization with firmware
Date: Thu, 21 May 2020 19:00:27 +0530
Message-Id: <1590067829-26109-2-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1590067829-26109-1-git-send-email-mkenna@codeaurora.org>
References: <1590067829-26109-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Ritesh Singh <ritesi@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

From: Ritesh Singh <ritesi@codeaurora.org>

When the interface is added immediately after removing the
interface, vdev deletion in firmware might not have been
completed.

Hence, add vdev_delete_resp_event and wait_event_timeout
to synchronize with firmware.

Tested-on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 29 ++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c  | 62 +++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h  |  4 +++
 5 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 02501cc..cccd411 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -655,6 +655,7 @@ static void ath11k_core_restart(struct work_struct *work)
 		complete(&ar->peer_assoc_done);
 		complete(&ar->install_key_done);
 		complete(&ar->vdev_setup_done);
+		complete(&ar->vdev_delete_done);
 		complete(&ar->bss_survey_done);
 		complete(&ar->thermal.wmi_sync);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e7..f3b6dd9 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -413,6 +413,7 @@ struct ath11k_per_peer_tx_stats {
 };
 
 #define ATH11K_FLUSH_TIMEOUT (5 * HZ)
+#define ATH11K_VDEV_DELETE_TIMEOUT_HZ (5 * HZ)
 
 struct ath11k_vdev_stop_status {
 	bool stop_in_progress;
@@ -494,6 +495,7 @@ struct ath11k {
 	int last_wmi_vdev_start_status;
 	struct ath11k_vdev_stop_status vdev_stop_status;
 	struct completion vdev_setup_done;
+	struct completion vdev_delete_done;
 
 	int num_peers;
 	int max_num_peers;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a7e581..12f501e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4404,6 +4404,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_base *ab = ar->ab;
+	unsigned long time_left;
 	int ret;
 	int i;
 
@@ -4412,10 +4413,6 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	ath11k_dbg(ab, ATH11K_DBG_MAC, "mac remove interface (vdev %d)\n",
 		   arvif->vdev_id);
 
-	spin_lock_bh(&ar->data_lock);
-	list_del(&arvif->list);
-	spin_unlock_bh(&ar->data_lock);
-
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath11k_peer_delete(ar, arvif->vdev_id, vif->addr);
 		if (ret)
@@ -4423,16 +4420,33 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
+	reinit_completion(&ar->vdev_delete_done);
+
 	ret = ath11k_wmi_vdev_delete(ar, arvif->vdev_id);
-	if (ret)
+	if (ret) {
 		ath11k_warn(ab, "failed to delete WMI vdev %d: %d\n",
 			    arvif->vdev_id, ret);
+		goto err_vdev_del;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
+						ATH11K_VDEV_DELETE_TIMEOUT_HZ);
+	if (time_left == 0) {
+		ath11k_warn(ab, "Timeout in receiving vdev delete response\n");
+		goto err_vdev_del;
+	}
 
+	ab->free_vdev_map |= 1LL << (arvif->vdev_id);
+	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
 	ar->num_created_vdevs--;
+
 	ath11k_dbg(ab, ATH11K_DBG_MAC, "vdev %pM deleted, vdev_id %d\n",
 		   vif->addr, arvif->vdev_id);
-	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
-	ab->free_vdev_map |= 1LL << (arvif->vdev_id);
+
+err_vdev_del:
+	spin_lock_bh(&ar->data_lock);
+	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 	ath11k_peer_cleanup(ar, arvif->vdev_id);
 
@@ -6029,6 +6043,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
 		init_completion(&ar->vdev_setup_done);
+		init_completion(&ar->vdev_delete_done);
 		init_completion(&ar->peer_assoc_done);
 		init_completion(&ar->install_key_done);
 		init_completion(&ar->bss_survey_done);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c2a9723..5eae527 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -97,6 +97,8 @@ struct wmi_tlv_rdy_parse {
 		= { .min_len = sizeof(struct wmi_stats_event) },
 	[WMI_TAG_PDEV_CTL_FAILSAFE_CHECK_EVENT]
 		= { .min_len = sizeof(struct wmi_pdev_ctl_failsafe_chk_event) },
+	[WMI_TAG_VDEV_DELETE_RESP_EVENT] = {
+		.min_len = sizeof(struct wmi_vdev_delete_resp_event) },
 };
 
 #define PRIMAP(_hw_mode_) \
@@ -3740,6 +3742,34 @@ static int ath11k_pull_peer_del_resp_ev(struct ath11k_base *ab, struct sk_buff *
 	return 0;
 }
 
+static int ath11k_pull_vdev_del_resp_ev(struct ath11k_base *ab,
+					struct sk_buff *skb,
+					u32 *vdev_id)
+{
+	const void **tb;
+	const struct wmi_vdev_delete_resp_event *ev;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return ret;
+	}
+
+	ev = tb[WMI_TAG_VDEV_DELETE_RESP_EVENT];
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch vdev delete resp ev");
+		kfree(tb);
+		return -EPROTO;
+	}
+
+	*vdev_id = ev->vdev_id;
+
+	kfree(tb);
+	return 0;
+}
+
 static int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab, void *evt_buf,
 					u32 len, u32 *vdev_id,
 					u32 *tx_status)
@@ -5062,6 +5092,34 @@ static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, struct sk_buff
 	 */
 }
 
+static void ath11k_vdev_delete_resp_event(struct ath11k_base *ab,
+					  struct sk_buff *skb)
+{
+	struct ath11k *ar;
+	u32 vdev_id = 0;
+
+	if (ath11k_pull_vdev_del_resp_ev(ab, skb, &vdev_id) != 0) {
+		ath11k_warn(ab, "failed to extract vdev delete resp");
+		return;
+	}
+
+	rcu_read_lock();
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, vdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "invalid vdev id in vdev delete resp ev %d",
+			    vdev_id);
+		rcu_read_unlock();
+		return;
+	}
+
+	complete(&ar->vdev_delete_done);
+
+	rcu_read_unlock();
+
+	ath11k_dbg(ab, ATH11K_DBG_WMI, "vdev delete resp for vdev id %d\n",
+		   vdev_id);
+}
+
 static inline const char *ath11k_wmi_vdev_resp_print(u32 vdev_resp_status)
 {
 	switch (vdev_resp_status) {
@@ -5996,7 +6054,6 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 		break;
 	/* add Unsupported events here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
-	case WMI_VDEV_DELETE_RESP_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
 	case WMI_TWT_ENABLE_EVENTID:
 	case WMI_TWT_DISABLE_EVENTID:
@@ -6006,6 +6063,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_PDEV_DFS_RADAR_DETECTION_EVENTID:
 		ath11k_wmi_pdev_dfs_radar_detected_event(ab, skb);
 		break;
+	case WMI_VDEV_DELETE_RESP_EVENTID:
+		ath11k_vdev_delete_resp_event(ab, skb);
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath11k_warn(ab, "Unknown eventid: 0x%x\n", id);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b9f3e55..fb8068f 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3952,6 +3952,10 @@ struct wmi_regulatory_rule_struct {
 	u32  flag_info;
 };
 
+struct wmi_vdev_delete_resp_event {
+	u32 vdev_id;
+} __packed;
+
 struct wmi_peer_delete_resp_event {
 	u32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
