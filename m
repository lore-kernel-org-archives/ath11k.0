Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnO2w-0005kK-BY
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 14:03:12 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: rename the data_lock for better code
Date: Tue, 16 Jul 2019 19:32:50 +0530
Message-Id: <1563285770-13364-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Having same lock name in two different structure lead to
confuse the code readability. Avoid by renaming one of
the lock name as base_lock.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c        |  6 ++---
 drivers/net/wireless/ath/ath11k/core.h        |  2 +-
 drivers/net/wireless/ath/ath11k/debug.c       |  4 ++--
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 16 ++++++-------
 drivers/net/wireless/ath/ath11k/dp.c          |  6 ++---
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 34 +++++++++++++--------------
 drivers/net/wireless/ath/ath11k/mac.c         | 30 +++++++++++------------
 drivers/net/wireless/ath/ath11k/peer.c        | 28 +++++++++++-----------
 drivers/net/wireless/ath/ath11k/reg.c         |  6 ++---
 drivers/net/wireless/ath/ath11k/wmi.c         |  8 +++----
 10 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8fa18a7..2e523af 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -595,9 +595,9 @@ static void ath11k_core_restart(struct work_struct *work)
 	struct ath11k_pdev *pdev;
 	int i, ret = 0;
 
-	spin_lock_bh(&sc->data_lock);
+	spin_lock_bh(&sc->base_lock);
 	sc->stats.fw_crash_counter++;
-	spin_unlock_bh(&sc->data_lock);
+	spin_unlock_bh(&sc->base_lock);
 
 	for (i = 0; i < sc->num_radios; i++) {
 		pdev = &sc->pdevs[i];
@@ -726,7 +726,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev)
 		goto err_sc_free;
 
 	mutex_init(&sc->core_lock);
-	spin_lock_init(&sc->data_lock);
+	spin_lock_init(&sc->base_lock);
 
 	INIT_LIST_HEAD(&sc->peers);
 	init_waitqueue_head(&sc->peer_mapping_wq);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 60962b5..34cd861 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -596,7 +596,7 @@ struct ath11k_base {
 	/* To synchronize core_start/core_stop */
 	struct mutex core_lock;
 	/* Protects data like peers */
-	spinlock_t data_lock;
+	spinlock_t base_lock;
 	struct ath11k_pdev pdevs[MAX_RADIOS];
 	struct ath11k_pdev __rcu *pdevs_active[MAX_RADIOS];
 	struct ath11k_hal_reg_capabilities_ext hal_reg_cap[MAX_RADIOS];
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 76cbd22..f21f33f 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -265,10 +265,10 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb)
 		 */
 		num_peer_stats = ath11k_wmi_fw_stats_num_peers(&stats.peers);
 
-		spin_lock_bh(&ab->data_lock);
+		spin_lock_bh(&ab->base_lock);
 		list_for_each_entry(peer, &ab->peers, list)
 			total_num_peers++;
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 
 		for (i = 0; i < num_peer_stats; i++) {
 			num_peer++;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 4b1d2cb..ce595bd 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -156,11 +156,11 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	int ret;
 
 	rcu_read_lock();
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
 	if (!peer || !peer->sta) {
 		ath11k_warn(ab, "failed to find the peer\n");
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
 		return;
 	}
@@ -177,7 +177,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 							    &rate_idx,
 							    &rate);
 		if (ret < 0) {
-			spin_unlock_bh(&ab->data_lock);
+			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
 			return;
 		}
@@ -185,7 +185,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	} else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11N) {
 		if (ts->mcs > 7) {
 			ath11k_warn(ab, "Invalid HT mcs index %d\n", ts->mcs);
-			spin_unlock_bh(&ab->data_lock);
+			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
 			return;
 		}
@@ -197,7 +197,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	} else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AC) {
 		if (ts->mcs > 9) {
 			ath11k_warn(ab, "Invalid VHT mcs index %d\n", ts->mcs);
-			spin_unlock_bh(&ab->data_lock);
+			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
 			return;
 		}
@@ -214,7 +214,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	arsta->txrate.bw = ts->bw;
 
 	ath11k_accumulate_per_peer_tx_stats(arsta, peer_stats, rate_idx);
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 	rcu_read_unlock();
 }
 
@@ -342,7 +342,7 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 		return -ENOMEM;
 
 	mutex_lock(&ar->conf_mutex);
-	spin_lock_bh(&ar->ab->data_lock);
+	spin_lock_bh(&ar->ab->base_lock);
 
 	len += scnprintf(buf + len, size - len, "RX peer stats:\n");
 	len += scnprintf(buf + len, size - len, "Num of MSDUs: %llu\n",
@@ -395,7 +395,7 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 			 rx_stats->rx_duration);
 	len += scnprintf(buf + len, size - len, "\n");
 
-	spin_unlock_bh(&ar->ab->data_lock);
+	spin_unlock_bh(&ar->ab->base_lock);
 
 	if (len > size)
 		len = size;
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3f5174a..ae563ed 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -24,17 +24,17 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 
 	/* TODO: Any other peer specific DP cleanup */
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find(ab, vdev_id, addr);
 	if (!peer) {
 		ath11k_warn(ab, "failed to lookup peer %pM on vdev %d\n",
 			    addr, vdev_id);
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		return;
 	}
 
 	ath11k_peer_rx_tid_cleanup(ar, peer);
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 }
 
 int ath11k_dp_peer_setup(struct ath11k *ar, int vdev_id, const u8 *addr)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index d074d90..985a3ab 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -674,7 +674,7 @@ static void ath11k_dp_rx_tid_mem_free(struct ath11k_base *ab,
 	struct ath11k_peer *peer;
 	struct dp_rx_tid *rx_tid;
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
@@ -693,7 +693,7 @@ static void ath11k_dp_rx_tid_mem_free(struct ath11k_base *ab,
 	rx_tid->active = false;
 
 unlock_exit:
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 }
 
 int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
@@ -708,12 +708,12 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	dma_addr_t paddr;
 	int ret;
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
 		ath11k_warn(ab, "failed to find the peer to set up rx tid\n");
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		return -ENOENT;
 	}
 
@@ -723,7 +723,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 		paddr = rx_tid->paddr;
 		ret = ath11k_peer_rx_tid_reo_update(ar, peer, rx_tid,
 						    ba_win_sz, ssn);
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		if (ret) {
 			ath11k_warn(ab, "failed to update reo for rx tid %d\n", tid);
 			return ret;
@@ -752,7 +752,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 
 	vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_KERNEL);
 	if (!vaddr) {
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		return -ENOMEM;
 	}
 
@@ -765,7 +765,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 
 	ret = dma_mapping_error(ab->dev, paddr);
 	if (ret) {
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		goto err_mem_free;
 	}
 
@@ -774,7 +774,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	rx_tid->size = hw_desc_sz;
 	rx_tid->active = true;
 
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac,
 						     paddr, tid, 1, ba_win_sz);
@@ -820,12 +820,12 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	bool active;
 	int ret;
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find(ab, vdev_id, params->sta->addr);
 	if (!peer) {
 		ath11k_warn(ab, "failed to find the peer to stop rx aggregation\n");
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		return -ENOENT;
 	}
 
@@ -834,7 +834,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 
 	ath11k_peer_rx_tid_delete(ar, peer, params->tid);
 
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (!active)
 		return 0;
@@ -1101,11 +1101,11 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 	}
 
 	rcu_read_lock();
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find_by_id(ab, usr_stats->peer_id);
 
 	if (!peer || !peer->sta) {
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
 		return;
 	}
@@ -1182,7 +1182,7 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 		ath11k_accumulate_per_peer_tx_stats(arsta,
 						    peer_stats, rate_idx);
 
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 	rcu_read_unlock();
 }
 
@@ -2617,13 +2617,13 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		}
 
 		rcu_read_lock();
-		spin_lock_bh(&ab->data_lock);
+		spin_lock_bh(&ab->base_lock);
 		peer = ath11k_peer_find_by_id(ab, ppdu_info.peer_id);
 
 		if (!peer || !peer->sta) {
 			ath11k_warn(ab, "failed to find the peer with peer_id %d\n",
 				    ppdu_info.peer_id);
-			spin_unlock_bh(&ab->data_lock);
+			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
 			dev_kfree_skb_any(skb);
 			continue;
@@ -2635,7 +2635,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (ath11k_debug_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8cda555..7143129 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -608,13 +608,13 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		ath11k_peer_rx_tid_cleanup(ar, peer);
 		list_del(&peer->list);
 		kfree(peer);
 	}
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	ar->num_peers = 0;
 	ar->num_stations = 0;
@@ -2106,9 +2106,9 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (!peer)
 		return -ENOENT;
@@ -2127,9 +2127,9 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 			ath11k_warn(ab, "failed to remove peer key %d: %d\n",
 				    i, ret);
 
-		spin_lock_bh(&ab->data_lock);
+		spin_lock_bh(&ab->base_lock);
 		peer->keys[i] = NULL;
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 	}
 
 	return first_errno;
@@ -2171,9 +2171,9 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* the peer should not disappear in mid-way (unless FW goes awry) since
 	 * we already hold conf_mutex. we just make sure its there now.
 	 */
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (!peer) {
 		if (cmd == SET_KEY) {
@@ -2200,7 +2200,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		goto exit;
 	}
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
 	if (peer && cmd == SET_KEY)
 		peer->keys[key->keyidx] = key;
@@ -2209,7 +2209,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	else if (!peer)
 		/* impossible unless FW goes crazy */
 		ath11k_warn(ab, "peer %pM disappeared!\n", peer_addr);
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
@@ -2673,17 +2673,17 @@ static void ath11k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	struct ath11k_peer *peer;
 	u32 bw, smps;
 
-	spin_lock_bh(&ar->ab->data_lock);
+	spin_lock_bh(&ar->ab->base_lock);
 
 	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
 	if (!peer) {
-		spin_unlock_bh(&ar->ab->data_lock);
+		spin_unlock_bh(&ar->ab->base_lock);
 		ath11k_warn(ar->ab, "mac sta rc update failed to find peer %pM on vdev %i\n",
 			    sta->addr, arvif->vdev_id);
 		return;
 	}
 
-	spin_unlock_bh(&ar->ab->data_lock);
+	spin_unlock_bh(&ar->ab->base_lock);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "mac sta rc update for %pM changed %08x bw %d nss %d smps %d\n",
@@ -4183,9 +4183,9 @@ static inline int ath11k_mac_vdev_setup_sync(struct ath11k *ar)
 
 		arg.channel.passive = arg.channel.chan_radar;
 
-		spin_lock_bh(&ab->data_lock);
+		spin_lock_bh(&ab->base_lock);
 		arg.regdomain = ar->ab->dfs_region;
-		spin_unlock_bh(&ab->data_lock);
+		spin_unlock_bh(&ab->base_lock);
 
 		/* TODO: Notify if secondary 80Mhz also needs radar detection */
 		if (he_support) {
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 5e7aa96..d484a3b 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -12,7 +12,7 @@ struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
 {
 	struct ath11k_peer *peer;
 
-	lockdep_assert_held(&ab->data_lock);
+	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list) {
 		if (peer->vdev_id != vdev_id)
@@ -31,7 +31,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 {
 	struct ath11k_peer *peer;
 
-	lockdep_assert_held(&ab->data_lock);
+	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list) {
 		if (memcmp(peer->addr, addr, ETH_ALEN))
@@ -48,7 +48,7 @@ struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
 {
 	struct ath11k_peer *peer;
 
-	lockdep_assert_held(&ab->data_lock);
+	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list)
 		if (peer_id == peer->peer_id)
@@ -61,7 +61,7 @@ void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
 {
 	struct ath11k_peer *peer;
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find_by_id(ab, peer_id);
 	if (!peer) {
@@ -78,7 +78,7 @@ void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
 	wake_up(&ab->peer_mapping_wq);
 
 exit:
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 }
 
 void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
@@ -86,7 +86,7 @@ void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
 {
 	struct ath11k_peer *peer;
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	peer = ath11k_peer_find(ab, vdev_id, mac_addr);
 	if (!peer) {
 		peer = kzalloc(sizeof(*peer), GFP_ATOMIC);
@@ -105,7 +105,7 @@ void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
 		   vdev_id, mac_addr, peer_id);
 
 exit:
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 }
 
 static int ath11k_wait_for_peer_common(struct ath11k_base *ab, int vdev_id,
@@ -116,9 +116,9 @@ static int ath11k_wait_for_peer_common(struct ath11k_base *ab, int vdev_id,
 	ret = wait_event_timeout(ab->peer_mapping_wq, ({
 				bool mapped;
 
-				spin_lock_bh(&ab->data_lock);
+				spin_lock_bh(&ab->base_lock);
 				mapped = !!ath11k_peer_find(ab, vdev_id, addr);
-				spin_unlock_bh(&ab->data_lock);
+				spin_unlock_bh(&ab->base_lock);
 
 				(mapped == expect_mapped ||
 				 test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags));
@@ -137,7 +137,7 @@ void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		if (peer->vdev_id != vdev_id)
 			continue;
@@ -150,7 +150,7 @@ void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 		ar->num_peers--;
 	}
 
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 }
 
 static int ath11k_wait_for_peer_deleted(struct ath11k *ar, int vdev_id, const u8 *addr)
@@ -213,11 +213,11 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (ret)
 		return ret;
 
-	spin_lock_bh(&ar->ab->data_lock);
+	spin_lock_bh(&ar->ab->base_lock);
 
 	peer = ath11k_peer_find(ar->ab, param->vdev_id, param->peer_addr);
 	if (!peer) {
-		spin_unlock_bh(&ar->ab->data_lock);
+		spin_unlock_bh(&ar->ab->base_lock);
 		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
 			    param->peer_addr, param->vdev_id);
 		ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
@@ -230,7 +230,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	ar->num_peers++;
 
-	spin_unlock_bh(&ar->ab->data_lock);
+	spin_unlock_bh(&ar->ab->base_lock);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index f72b81f..9c3f79c 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -202,7 +202,7 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 	ab = ar->ab;
 	pdev_id = ar->pdev_idx;
 
-	spin_lock(&ab->data_lock);
+	spin_lock(&ab->base_lock);
 
 	if (init) {
 		/* Apply the regd received during init through
@@ -223,7 +223,7 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 
 	if (!regd) {
 		ret = -EINVAL;
-		spin_unlock(&ab->data_lock);
+		spin_unlock(&ab->base_lock);
 		goto err;
 	}
 
@@ -234,7 +234,7 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 	if (regd_copy)
 		ath11k_copy_regd(regd, regd_copy);
 
-	spin_unlock(&ab->data_lock);
+	spin_unlock(&ab->base_lock);
 
 	if (!regd_copy) {
 		ret = -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 1de2299..e98e9c9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4566,7 +4566,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 		goto fallback;
 	}
 
-	spin_lock(&ab->data_lock);
+	spin_lock(&ab->base_lock);
 	if (ab->mac_registered) {
 		/* Once mac is registered, ar is valid and all CC events from
 		 * fw is considered to be received due to user requests
@@ -4590,7 +4590,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 		ab->default_regd[pdev_idx] = regd;
 	}
 	ab->dfs_region = reg_info->dfs_region;
-	spin_unlock(&ab->data_lock);
+	spin_unlock(&ab->base_lock);
 
 	goto mem_free;
 
@@ -5021,7 +5021,7 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff
 
 	rcu_read_lock();
 
-	spin_lock_bh(&ab->data_lock);
+	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find_by_addr(ab, arg.mac_addr);
 
@@ -5052,7 +5052,7 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff
 	ieee80211_report_low_ack(sta, 10);
 
 exit:
-	spin_unlock_bh(&ab->data_lock);
+	spin_unlock_bh(&ab->base_lock);
 	rcu_read_unlock();
 }
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
