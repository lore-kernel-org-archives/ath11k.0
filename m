Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNTn-0004zQ-JD
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:49:49 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 1/8] ath11k: correct prefix for public functions in mac.c
Date: Mon, 24 Jun 2019 17:19:22 +0530
Message-Id: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Use ath11k_mac_ prefix for all public functions defined
in mac.c file.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c            |  4 +--
 drivers/net/wireless/ath/ath11k/debug.c           |  2 +-
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c             | 32 ++++++++++-----------
 drivers/net/wireless/ath/ath11k/mac.h             | 20 ++++++-------
 drivers/net/wireless/ath/ath11k/wmi.c             | 34 +++++++++++------------
 7 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 74384b3..8fa18a7 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -577,7 +577,7 @@ void ath11k_core_halt(struct ath11k *ar)
 
 	ar->num_created_vdevs = 0;
 
-	ath11k_scan_finish(ar);
+	ath11k_mac_scan_finish(ar);
 	ath11k_mac_peer_cleanup_all(ar);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->regd_update_work);
@@ -606,7 +606,7 @@ static void ath11k_core_restart(struct work_struct *work)
 			continue;
 
 		ieee80211_stop_queues(ar->hw);
-		ath11k_drain_tx(ar);
+		ath11k_mac_drain_tx(ar);
 		complete(&ar->scan.started);
 		complete(&ar->scan.completed);
 		complete(&ar->peer_assoc_done);
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index f8081da..6aa260c 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -191,7 +191,7 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, stats.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
 	if (!ar) {
 		rcu_read_unlock();
 		ath11k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 66a5f2d..a9dffd1 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4296,7 +4296,7 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 
 	pdev_id = FIELD_GET(HTT_STATS_COOKIE_LSB, cookie);
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	rcu_read_unlock();
 	if (!ar) {
 		ath11k_warn(ab, "failed to get ar for pdev_id %d\n", pdev_id);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index afe8399..3452e53 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1247,7 +1247,7 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	ppdu_id = msg->ppdu_id;
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
 		ret = -EINVAL;
 		goto exit;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7a6c927..2e87b1a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -345,7 +345,7 @@ static void ath11k_get_arvif_iter(void *data, u8 *mac,
 		arvif_iter->arvif = arvif;
 }
 
-struct ath11k_vif *ath11k_get_arvif(struct ath11k *ar, u32 vdev_id)
+struct ath11k_vif *ath11k_mac_get_arvif(struct ath11k *ar, u32 vdev_id)
 {
 	struct ath11k_vif_iter arvif_iter;
 	u32 flags;
@@ -364,8 +364,8 @@ struct ath11k_vif *ath11k_get_arvif(struct ath11k *ar, u32 vdev_id)
 	return arvif_iter.arvif;
 }
 
-struct ath11k_vif *ath11k_get_arvif_by_vdev_id(struct ath11k_base *ab,
-					       u32 vdev_id)
+struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
+						   u32 vdev_id)
 {
 	int i;
 	struct ath11k_pdev *pdev;
@@ -377,7 +377,7 @@ struct ath11k_vif *ath11k_get_arvif_by_vdev_id(struct ath11k_base *ab,
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = rcu_dereference(ab->pdevs_active[i]);
 		if (pdev && pdev->ar) {
-			arvif = ath11k_get_arvif(pdev->ar, vdev_id);
+			arvif = ath11k_mac_get_arvif(pdev->ar, vdev_id);
 			if (arvif)
 				return arvif;
 		}
@@ -386,7 +386,7 @@ struct ath11k_vif *ath11k_get_arvif_by_vdev_id(struct ath11k_base *ab,
 	return NULL;
 }
 
-struct ath11k *ath11k_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
+struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 {
 	int i;
 	struct ath11k_pdev *pdev;
@@ -398,7 +398,7 @@ struct ath11k *ath11k_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = rcu_dereference(ab->pdevs_active[i]);
 		if (pdev && pdev->ar) {
-			arvif = ath11k_get_arvif(pdev->ar, vdev_id);
+			arvif = ath11k_mac_get_arvif(pdev->ar, vdev_id);
 			if (arvif)
 				return arvif->ar;
 		}
@@ -407,7 +407,7 @@ struct ath11k *ath11k_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 	return NULL;
 }
 
-struct ath11k *ath11k_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
+struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 {
 	int i;
 	struct ath11k_pdev *pdev;
@@ -428,8 +428,8 @@ struct ath11k *ath11k_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 	return NULL;
 }
 
-struct ath11k *ath11k_get_ar_vdev_stop_status(struct ath11k_base *ab,
-					      u32 vdev_id)
+struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
+						  u32 vdev_id)
 {
 	int i;
 	struct ath11k_pdev *pdev;
@@ -1790,7 +1790,7 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 /* Scanning */
 /************/
 
-void __ath11k_scan_finish(struct ath11k *ar)
+void __ath11k_mac_scan_finish(struct ath11k *ar)
 {
 	lockdep_assert_held(&ar->data_lock);
 
@@ -1820,10 +1820,10 @@ void __ath11k_scan_finish(struct ath11k *ar)
 	}
 }
 
-void ath11k_scan_finish(struct ath11k *ar)
+void ath11k_mac_scan_finish(struct ath11k *ar)
 {
 	spin_lock_bh(&ar->data_lock);
-	__ath11k_scan_finish(ar);
+	__ath11k_mac_scan_finish(ar);
 	spin_unlock_bh(&ar->data_lock);
 }
 
@@ -1865,7 +1865,7 @@ static int ath11k_scan_stop(struct ath11k *ar)
 	 */
 	spin_lock_bh(&ar->data_lock);
 	if (ar->scan.state != ATH11K_SCAN_IDLE)
-		__ath11k_scan_finish(ar);
+		__ath11k_mac_scan_finish(ar);
 	spin_unlock_bh(&ar->data_lock);
 
 	return ret;
@@ -3457,7 +3457,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	}
 }
 
-void ath11k_drain_tx(struct ath11k *ar)
+void ath11k_mac_drain_tx(struct ath11k *ar)
 {
 	/* make sure rcu-protected mac80211 tx path itself is drained */
 	synchronize_net();
@@ -3488,7 +3488,7 @@ static int ath11k_start(struct ieee80211_hw *hw)
 	struct ath11k_pdev *pdev = ar->pdev;
 	int ret;
 
-	ath11k_drain_tx(ar);
+	ath11k_mac_drain_tx(ar);
 	mutex_lock(&ar->conf_mutex);
 
 	switch (ar->state) {
@@ -3591,7 +3591,7 @@ static void ath11k_stop(struct ieee80211_hw *hw)
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
 	int ret;
 
-	ath11k_drain_tx(ar);
+	ath11k_mac_drain_tx(ar);
 
 	mutex_lock(&ar->conf_mutex);
 	ret = ath11k_mac_config_mon_status_default(ar, false);
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f6f8047..071fcbc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -176,20 +176,20 @@ u8 ath11k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
 u8 ath11k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
 			     u8 hw_rate, bool cck);
 
-void __ath11k_scan_finish(struct ath11k *ar);
-void ath11k_scan_finish(struct ath11k *ar);
+void __ath11k_mac_scan_finish(struct ath11k *ar);
+void ath11k_mac_scan_finish(struct ath11k *ar);
 
-struct ath11k_vif *ath11k_get_arvif(struct ath11k *ar, u32 vdev_id);
-struct ath11k_vif *ath11k_get_arvif_by_vdev_id(struct ath11k_base *ab,
-					       u32 vdev_id);
-struct ath11k *ath11k_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
-struct ath11k *ath11k_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
-struct ath11k *ath11k_get_ar_vdev_stop_status(struct ath11k_base *ab,
-					      u32 vdev_id);
+struct ath11k_vif *ath11k_mac_get_arvif(struct ath11k *ar, u32 vdev_id);
+struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
+						   u32 vdev_id);
+struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
+struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
+struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
+						  u32 vdev_id);
 
 void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work);
 void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar);
-void ath11k_drain_tx(struct ath11k *ar);
+void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index f800c77..eee3d82 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3432,7 +3432,7 @@ static void ath11k_wmi_event_scan_start_failed(struct ath11k *ar)
 		break;
 	case ATH11K_SCAN_STARTING:
 		complete(&ar->scan.started);
-		__ath11k_scan_finish(ar);
+		__ath11k_mac_scan_finish(ar);
 		break;
 	}
 }
@@ -3458,7 +3458,7 @@ static void ath11k_wmi_event_scan_completed(struct ath11k *ar)
 		break;
 	case ATH11K_SCAN_RUNNING:
 	case ATH11K_SCAN_ABORTING:
-		__ath11k_scan_finish(ar);
+		__ath11k_mac_scan_finish(ar);
 		break;
 	}
 }
@@ -4263,7 +4263,7 @@ ath11k_wmi_fw_vdev_stats_fill(struct ath11k *ar,
 {
 	u32 len = *length;
 	u32 buf_len = ATH11K_FW_STATS_BUF_SIZE;
-	struct ath11k_vif *arvif = ath11k_get_arvif(ar, vdev->vdev_id);
+	struct ath11k_vif *arvif = ath11k_mac_get_arvif(ar, vdev->vdev_id);
 	u8 *vif_macaddr;
 	int i;
 
@@ -4383,7 +4383,7 @@ ath11k_wmi_fw_bcn_stats_fill(struct ath11k *ar,
 {
 	u32 len = *length;
 	u32 buf_len = ATH11K_FW_STATS_BUF_SIZE;
-	struct ath11k_vif *arvif = ath11k_get_arvif(ar, bcn->vdev_id);
+	struct ath11k_vif *arvif = ath11k_mac_get_arvif(ar, bcn->vdev_id);
 	u8 *vdev_macaddr;
 
 	if (arvif) {
@@ -4724,7 +4724,7 @@ static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, u8 *evt_buf, u3
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_vdev_id(ab, vdev_start_resp.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, vdev_start_resp.vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in vdev start resp ev %d",
 			    vdev_start_resp.vdev_id);
@@ -4773,7 +4773,7 @@ static void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 l
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_vdev_stop_status(ab, vdev_id);
+	ar = ath11k_mac_get_ar_vdev_stop_status(ab, vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in vdev stopped ev %d",
 			    vdev_id);
@@ -4809,7 +4809,7 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 		   rx_ev.status);
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, rx_ev.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, rx_ev.pdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev_id %d in mgmt_rx_event\n",
@@ -4911,7 +4911,7 @@ static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *s
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, tx_compl_param.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, tx_compl_param.pdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id %d in mgmt_tx_compl_event\n",
 			    tx_compl_param.pdev_id);
@@ -4977,7 +4977,7 @@ static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	    scan_ev.reason == WMI_SCAN_REASON_CANCELLED)
 		ar = ath11k_get_ar_on_scan_abort(ab, scan_ev.vdev_id);
 	else
-		ar = ath11k_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
+		ar = ath11k_mac_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "Received scan event for unknown vdev");
@@ -5049,7 +5049,7 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u
 		goto exit;
 	}
 
-	ar = ath11k_get_ar_by_vdev_id(ab, peer->vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer->vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in peer sta kickout ev %d",
 			    peer->vdev_id);
@@ -5089,7 +5089,7 @@ static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 		   roam_ev.vdev_id, roam_ev.reason, roam_ev.rssi);
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_vdev_id(ab, roam_ev.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, roam_ev.vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in roam ev %d",
 			    roam_ev.vdev_id);
@@ -5147,7 +5147,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_vdev_id(ab, ch_info_ev.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, ch_info_ev.vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in chan info ev %d",
 			    ch_info_ev.vdev_id);
@@ -5231,7 +5231,7 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 		   tx, rx, rx_bss);
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_pdev_id(ab, bss_ch_info_ev.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, bss_ch_info_ev.pdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id %d in bss_chan_info event\n",
@@ -5285,7 +5285,7 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_
 		   install_key_compl.macaddr, install_key_compl.status);
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_vdev_id(ab, install_key_compl.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, install_key_compl.vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in install key compl ev %d",
 			    install_key_compl.vdev_id);
@@ -5357,7 +5357,7 @@ static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u3
 		   "peer assoc conf ev vdev id %d macaddr %pM\n",
 		   peer_assoc_conf.vdev_id, peer_assoc_conf.macaddr);
 
-	ar = ath11k_get_ar_by_vdev_id(ab, peer_assoc_conf.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer_assoc_conf.vdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in peer assoc conf ev %d",
@@ -5425,7 +5425,7 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 
 	rcu_read_lock();
 	for (i = 0; i < ev->num_vdevs; i++) {
-		arvif = ath11k_get_arvif_by_vdev_id(ab, vdev_ids[i]);
+		arvif = ath11k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);
 
 		if (!arvif) {
 			ath11k_warn(ab, "Recvd csa status for unknown vdev %d",
@@ -5506,7 +5506,7 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
 		   ev->detector_id, ev->segment_id, ev->timestamp, ev->is_chirp,
 		   ev->freq_offset, ev->sidx);
 
-	ar = ath11k_get_ar_by_pdev_id(ab, ev->pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "radar detected in invalid pdev %d\n",
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
