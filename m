Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nT-0000Gl-Jq
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:48:05 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 2/2] ath11k: Added prefix to all the functions in dp_tx.c file
Date: Wed, 12 Jun 2019 16:19:12 +0530
Message-Id: <1560336554-14420-5-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Added a prefix "ath11k_dp_tx" to all the functions
in the file dp_tx.c

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c        |   2 +-
 drivers/net/wireless/ath/ath11k/debug.c       |  12 +-
 .../net/wireless/ath/ath11k/debug_htt_stats.c |  10 +-
 drivers/net/wireless/ath/ath11k/dp.h          |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  47 +++----
 drivers/net/wireless/ath/ath11k/dp_tx.c       | 128 +++++++++---------
 drivers/net/wireless/ath/ath11k/dp_tx.h       |  31 +++--
 drivers/net/wireless/ath/ath11k/mac.c         |   5 +-
 8 files changed, 122 insertions(+), 117 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e3e6b647888a..74a88f74dbb7 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -563,7 +563,7 @@ static int ath11k_core_start(struct ath11k_base *sc,
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_dp_htt_h2t_ver_req_msg(sc);
+	ret = ath11k_dp_tx_htt_h2t_ver_req_msg(sc);
 	if (ret) {
 		ath11k_err(sc, "failed to send htt version request message: %d\n",
 			   ret);
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index e22e1c8871cc..69a23404fe3b 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -831,9 +831,9 @@ static ssize_t ath11k_write_extd_rx_stats(struct file *file,
 	}
 
 	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
-	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
-					    HAL_RXDMA_MONITOR_STATUS,
-					    DP_RX_BUFFER_SIZE, &tlv_filter);
+	ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
+					       HAL_RXDMA_MONITOR_STATUS,
+					       DP_RX_BUFFER_SIZE, &tlv_filter);
 
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to set rx filter for moniter status ring\n");
@@ -1061,9 +1061,9 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 	}
 
 	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
-	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
-					    HAL_RXDMA_MONITOR_STATUS,
-					    DP_RX_BUFFER_SIZE, &tlv_filter);
+	ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
+					       HAL_RXDMA_MONITOR_STATUS,
+					       DP_RX_BUFFER_SIZE, &tlv_filter);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to set rx filter for moniter status ring\n");
 		goto out;
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index ac217d91bff4..e5147ae4d651 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4340,7 +4340,7 @@ int ath11k_dbg_htt_stats_req(struct ath11k *ar,
 	}
 
 	mutex_lock(&ar->conf_mutex);
-	ret = ath11k_dp_htt_h2t_ext_stats_req(ar, type, &cfg_params, cookie);
+	ret = ath11k_dp_tx_htt_h2t_ext_stats_req(ar, type, &cfg_params, cookie);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
 		mutex_unlock(&ar->conf_mutex);
@@ -4440,10 +4440,10 @@ static ssize_t ath11k_write_htt_stats_reset(struct file *file,
 	mutex_lock(&ar->conf_mutex);
 	cfg_params.cfg0 = HTT_STAT_DEFAULT_RESET_START_OFFSET;
 	cfg_params.cfg1 = 1 << (cfg_params.cfg0 + type);
-	ret = ath11k_dp_htt_h2t_ext_stats_req(ar,
-					      ATH11K_DBG_HTT_EXT_STATS_RESET,
-					      &cfg_params,
-					      0ULL);
+	ret = ath11k_dp_tx_htt_h2t_ext_stats_req(ar,
+						 ATH11K_DBG_HTT_EXT_STATS_RESET,
+						 &cfg_params,
+						 0ULL);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
 		mutex_unlock(&ar->conf_mutex);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 79b665816378..0891a363257f 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1464,8 +1464,8 @@ void ath11k_dp_free(struct ath11k_base *sc);
 int ath11k_dp_alloc(struct ath11k_base *sc);
 int ath11k_dp_pdev_alloc(struct ath11k_base *ab);
 void ath11k_dp_pdev_free(struct ath11k_base *ab);
-int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
-			     int mac_id, enum hal_ring_type ring_type);
+int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
+				int mac_id, enum hal_ring_type ring_type);
 int ath11k_dp_peer_setup(struct ath11k *ar, int vdev_id, const u8 *addr);
 void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr);
 void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 84e4dd147ff0..c5c69f7bdecb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -329,9 +329,9 @@ static void ath11k_dp_reo_cache_flush(struct ath11k_base *ab,
 		tot_desc_sz -= desc_sz;
 		cmd.addr_lo = lower_32_bits(rx_tid->paddr + tot_desc_sz);
 		cmd.addr_hi = upper_32_bits(rx_tid->paddr);
-		ret = ath11k_dp_send_reo_cmd(ab, rx_tid,
-					     HAL_REO_CMD_FLUSH_CACHE, &cmd,
-					     NULL);
+		ret = ath11k_dp_tx_send_reo_cmd(ab, rx_tid,
+						HAL_REO_CMD_FLUSH_CACHE, &cmd,
+						NULL);
 		if (ret)
 			ath11k_warn(ab,
 				    "failed to send HAL_REO_CMD_FLUSH_CACHE, tid %d (%d)\n",
@@ -342,9 +342,9 @@ static void ath11k_dp_reo_cache_flush(struct ath11k_base *ab,
 	cmd.addr_lo = lower_32_bits(rx_tid->paddr);
 	cmd.addr_hi = upper_32_bits(rx_tid->paddr);
 	cmd.flag |= HAL_REO_CMD_FLG_NEED_STATUS;
-	ret = ath11k_dp_send_reo_cmd(ab, rx_tid,
-				     HAL_REO_CMD_FLUSH_CACHE,
-				     &cmd, ath11k_dp_reo_cmd_free);
+	ret = ath11k_dp_tx_send_reo_cmd(ab, rx_tid,
+					HAL_REO_CMD_FLUSH_CACHE,
+					&cmd, ath11k_dp_reo_cmd_free);
 	if (ret) {
 		ath11k_err(ab, "failed to send HAL_REO_CMD_FLUSH_CACHE cmd, tid %d (%d)\n",
 			   rx_tid->tid, ret);
@@ -420,9 +420,9 @@ static void ath11k_peer_rx_tid_delete(struct ath11k *ar,
 	cmd.addr_lo = lower_32_bits(rx_tid->paddr);
 	cmd.addr_hi = upper_32_bits(rx_tid->paddr);
 	cmd.upd0 |= HAL_REO_CMD_UPD0_VLD;
-	ret = ath11k_dp_send_reo_cmd(ar->ab, rx_tid,
-				     HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
-				     ath11k_dp_rx_tid_del_func);
+	ret = ath11k_dp_tx_send_reo_cmd(ar->ab, rx_tid,
+					HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
+					ath11k_dp_rx_tid_del_func);
 	if (ret) {
 		ath11k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
 			   tid, ret);
@@ -458,8 +458,9 @@ static int ath11k_peer_rx_tid_reo_update(struct ath11k *ar,
 	cmd.ba_window_size = ba_win_sz;
 	cmd.upd2 = FIELD_PREP(HAL_REO_CMD_UPD2_SSN, ssn);
 
-	ret = ath11k_dp_send_reo_cmd(ar->ab, rx_tid,
-				     HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd, NULL);
+	ret = ath11k_dp_tx_send_reo_cmd(ar->ab, rx_tid,
+					HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
+					NULL);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to update rx tid queue, tid %d (%d)\n",
 			    rx_tid->tid, ret);
@@ -3184,7 +3185,7 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	}
 
 	ring_id = dp->rx_refill_buf_ring.refill_buf_ring.ring_id;
-	ret = ath11k_dp_htt_srng_setup(ab, ring_id, mac_id, HAL_RXDMA_BUF);
+	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id, mac_id, HAL_RXDMA_BUF);
 	if (ret) {
 		ath11k_warn(ab, "failed to configure rx_refill_buf_ring %d\n",
 			    ret);
@@ -3192,7 +3193,7 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	}
 
 	ring_id = dp->rxdma_err_dst_ring.ring_id;
-	ret = ath11k_dp_htt_srng_setup(ab, ring_id, mac_id, HAL_RXDMA_DST);
+	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id, mac_id, HAL_RXDMA_DST);
 	if (ret) {
 		ath11k_warn(ab, "failed to configure rxdma_err_dest_ring %d\n",
 			    ret);
@@ -3200,32 +3201,32 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	}
 
 	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
-	ret = ath11k_dp_htt_srng_setup(ab, ring_id,
-				       mac_id, HAL_RXDMA_MONITOR_BUF);
+	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id,
+					  mac_id, HAL_RXDMA_MONITOR_BUF);
 	if (ret) {
 		ath11k_warn(ab, "failed to configure rxdma_mon_buf_ring %d\n",
 			    ret);
 		return ret;
 	}
-	ret = ath11k_dp_htt_srng_setup(ab,
-				       dp->rxdma_mon_dst_ring.ring_id,
-				       mac_id, HAL_RXDMA_MONITOR_DST);
+	ret = ath11k_dp_tx_htt_srng_setup(ab,
+					  dp->rxdma_mon_dst_ring.ring_id,
+					  mac_id, HAL_RXDMA_MONITOR_DST);
 	if (ret) {
 		ath11k_warn(ab, "failed to configure rxdma_mon_dst_ring %d\n",
 			    ret);
 		return ret;
 	}
-	ret = ath11k_dp_htt_srng_setup(ab,
-				       dp->rxdma_mon_desc_ring.ring_id,
-				       mac_id, HAL_RXDMA_MONITOR_DESC);
+	ret = ath11k_dp_tx_htt_srng_setup(ab,
+					  dp->rxdma_mon_desc_ring.ring_id,
+					  mac_id, HAL_RXDMA_MONITOR_DESC);
 	if (ret) {
 		ath11k_warn(ab, "failed to configure rxdma_mon_dst_ring %d\n",
 			    ret);
 		return ret;
 	}
 	ring_id = dp->rx_mon_status_refill_ring.refill_buf_ring.ring_id;
-	ret = ath11k_dp_htt_srng_setup(ab, ring_id, mac_id,
-				       HAL_RXDMA_MONITOR_STATUS);
+	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id, mac_id,
+					  HAL_RXDMA_MONITOR_STATUS);
 	if (ret) {
 		ath11k_warn(ab,
 			    "failed to configure mon_status_refill_ring %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 21f0dcfad09d..328700ab2a13 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -13,13 +13,13 @@ static const u8
 ath11k_txq_tcl_ring_map[ATH11K_HW_MAX_QUEUES] = { 0x0, 0x1, 0x2, 0x2 };
 
 static enum hal_tcl_encap_type
-ath11k_dp_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
+ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
 	/* TODO: Determine encap type based on vif_type and configuration */
 	return HAL_TCL_ENCAP_TYPE_NATIVE_WIFI;
 }
 
-static void ath11k_dp_encap_nwifi(struct sk_buff *skb)
+static void ath11k_dp_tx_encap_nwifi(struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	u8 *qos_ctl;
@@ -36,7 +36,7 @@ static void ath11k_dp_encap_nwifi(struct sk_buff *skb)
 	hdr->frame_control &= ~__cpu_to_le16(IEEE80211_STYPE_QOS_DATA);
 }
 
-static u8 ath11k_dp_get_tid(struct sk_buff *skb)
+static u8 ath11k_dp_tx_get_tid(struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 
@@ -46,7 +46,7 @@ static u8 ath11k_dp_get_tid(struct sk_buff *skb)
 		return skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 }
 
-static enum hal_encrypt_type ath11k_dp_get_encrypt_type(u32 cipher)
+static enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 {
 	switch (cipher) {
 	case WLAN_CIPHER_SUITE_WEP40:
@@ -107,12 +107,12 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ti.desc_id = FIELD_PREP(DP_TX_DESC_ID_MAC_ID, ar->pdev_idx) |
 		     FIELD_PREP(DP_TX_DESC_ID_MSDU_ID, ret) |
 		     FIELD_PREP(DP_TX_DESC_ID_POOL_ID, pool_id);
-	ti.encap_type = ath11k_dp_get_encap_type(arvif, skb);
+	ti.encap_type = ath11k_dp_tx_get_encap_type(arvif, skb);
 	ti.meta_data_flags = arvif->tcl_metadata;
 
 	if (info->control.hw_key) {
 		ti.encrypt_type =
-			ath11k_dp_get_encrypt_type(info->control.hw_key->cipher);
+		ath11k_dp_tx_get_encrypt_type(info->control.hw_key->cipher);
 	} else {
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
 	}
@@ -136,11 +136,11 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_MESH_ENABLE, 1);
 	ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_TID_OVERWRITE, 1);
 
-	ti.tid = ath11k_dp_get_tid(skb);
+	ti.tid = ath11k_dp_tx_get_tid(skb);
 
 	switch (ti.encap_type) {
 	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
-		ath11k_dp_encap_nwifi(skb);
+		ath11k_dp_tx_encap_nwifi(skb);
 		break;
 	case HAL_TCL_ENCAP_TYPE_RAW:
 		/*  TODO: for CHECKSUM_PARTIAL case in raw mode, HW checksum offload
@@ -215,9 +215,9 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	return ret;
 }
 
-static void ath11k_dp_free_txbuf(struct ath11k_base *ab, u8 mac_id,
-				 int msdu_id,
-				 struct dp_tx_ring *tx_ring)
+static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
+				    int msdu_id,
+				    struct dp_tx_ring *tx_ring)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -246,9 +246,10 @@ static void ath11k_dp_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 		wake_up(&ar->dp.tx_empty_waitq);
 }
 
-static void ath11k_dp_htt_tx_complete_buf(struct ath11k_base *ab,
-					  struct dp_tx_ring *tx_ring,
-					  struct ath11k_dp_htt_wbm_tx_status *ts)
+static void
+ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
+				 struct dp_tx_ring *tx_ring,
+				 struct ath11k_dp_htt_wbm_tx_status *ts)
 {
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
@@ -295,9 +296,9 @@ static void ath11k_dp_htt_tx_complete_buf(struct ath11k_base *ab,
 }
 
 static void
-ath11k_dp_process_htt_tx_complete(struct ath11k_base *ab,
-				  void *desc, u8 mac_id,
-				  u32 msdu_id, struct dp_tx_ring *tx_ring)
+ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
+				     void *desc, u8 mac_id,
+				     u32 msdu_id, struct dp_tx_ring *tx_ring)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {0};
@@ -316,11 +317,11 @@ ath11k_dp_process_htt_tx_complete(struct ath11k_base *ab,
 		ts.msdu_id = msdu_id;
 		ts.ack_rssi = FIELD_GET(HTT_TX_WBM_COMP_INFO1_ACK_RSSI,
 					status_desc->info1);
-		ath11k_dp_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -333,9 +334,9 @@ ath11k_dp_process_htt_tx_complete(struct ath11k_base *ab,
 	}
 }
 
-static void ath11k_dp_cache_peer_stats(struct ath11k *ar,
-				       struct sk_buff *msdu,
-				       struct hal_tx_status *ts)
+static void ath11k_dp_tx_cache_peer_stats(struct ath11k *ar,
+					  struct sk_buff *msdu,
+					  struct hal_tx_status *ts)
 {
 	struct ath11k_per_peer_tx_stats *peer_stats = &ar->cached_stats;
 
@@ -417,7 +418,7 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 			ar->last_ppdu_id = ts->ppdu_id;
 		}
 
-		ath11k_dp_cache_peer_stats(ar, msdu, ts);
+		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
 	/* NOTE: Tx rate status reporting. Tx completion status does not have
@@ -481,10 +482,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		tcl_id = ath11k_txq_tcl_ring_map[pool_id];
 
 		if (ts.buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW) {
-			ath11k_dp_process_htt_tx_complete(ab,
-							  (void *)&tx_status,
-							  mac_id,
-							  msdu_id, tx_ring);
+			ath11k_dp_tx_process_htt_tx_complete(ab,
+							     (void *)&tx_status,
+							     mac_id, msdu_id,
+							     tx_ring);
 			continue;
 		}
 
@@ -513,11 +514,11 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	spin_unlock_bh(&tx_ring->tx_status_lock);
 }
 
-int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
-			   enum hal_reo_cmd_type type,
-			   struct ath11k_hal_reo_cmd *cmd,
-			   void (*cb)(struct ath11k_dp *, void *,
-				      enum hal_reo_cmd_status))
+int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
+			      enum hal_reo_cmd_type type,
+			      struct ath11k_hal_reo_cmd *cmd,
+			      void (*cb)(struct ath11k_dp *, void *,
+					 enum hal_reo_cmd_status))
 {
 	struct ath11k_dp *dp = &ab->dp;
 	struct dp_reo_cmd *dp_cmd;
@@ -555,11 +556,11 @@ int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 }
 
 static int
-ath11k_dp_get_ring_id_type(struct ath11k_base *ab,
-			   int mac_id, u32 ring_id,
-			   enum hal_ring_type ring_type,
-			   enum htt_srng_ring_type *htt_ring_type,
-			   enum htt_srng_ring_id *htt_ring_id)
+ath11k_dp_tx_get_ring_id_type(struct ath11k_base *ab,
+			      int mac_id, u32 ring_id,
+			      enum hal_ring_type ring_type,
+			      enum htt_srng_ring_type *htt_ring_type,
+			      enum htt_srng_ring_id *htt_ring_id)
 {
 	int lmac_ring_id_offset = 0;
 	int ret = 0;
@@ -603,8 +604,8 @@ ath11k_dp_get_ring_id_type(struct ath11k_base *ab,
 	return ret;
 }
 
-int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
-			     int mac_id, enum hal_ring_type ring_type)
+int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
+				int mac_id, enum hal_ring_type ring_type)
 {
 	struct htt_srng_setup_cmd *cmd;
 	struct hal_srng *srng = &ab->hal.srng_list[ring_id];
@@ -627,9 +628,9 @@ int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
 	tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
 
-	if (ath11k_dp_get_ring_id_type(ab, mac_id, ring_id,
-				       ring_type, &htt_ring_type,
-				       &htt_ring_id))
+	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					  ring_type, &htt_ring_type,
+					  &htt_ring_id))
 		goto err_free;
 
 	skb_put(skb, len);
@@ -713,7 +714,7 @@ int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 
 #define HTT_TARGET_VERSION_TIMEOUT_HZ (3 * HZ)
 
-int ath11k_dp_htt_h2t_ver_req_msg(struct ath11k_base *ab)
+int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 {
 	struct ath11k_dp *dp = &ab->dp;
 	struct sk_buff *skb;
@@ -754,7 +755,7 @@ int ath11k_dp_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 	return 0;
 }
 
-int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
+int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -786,10 +787,10 @@ int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 	return 0;
 }
 
-int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
-				  int mac_id, enum hal_ring_type ring_type,
-				  int rx_buf_size,
-				  struct htt_rx_ring_tlv_filter *tlv_filter)
+int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
+				     int mac_id, enum hal_ring_type ring_type,
+				     int rx_buf_size,
+				     struct htt_rx_ring_tlv_filter *tlv_filter)
 {
 	struct htt_rx_ring_selection_cfg_cmd *cmd;
 	struct hal_srng *srng = &ab->hal.srng_list[ring_id];
@@ -807,9 +808,9 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	memset(&params, 0, sizeof(params));
 	ath11k_hal_srng_get_params(ab, srng, &params);
 
-	if (ath11k_dp_get_ring_id_type(ab, mac_id, ring_id,
-				       ring_type, &htt_ring_type,
-				       &htt_ring_id))
+	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					  ring_type, &htt_ring_type,
+					  &htt_ring_id))
 		goto err_free;
 
 	skb_put(skb, len);
@@ -852,9 +853,10 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	return ret;
 }
 
-int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
-				    struct htt_ext_stats_cfg_params *cfg_params,
-				    u64 cookie)
+int
+ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				   struct htt_ext_stats_cfg_params *cfg_params,
+				   u64 cookie)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -894,7 +896,7 @@ int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 	return 0;
 }
 
-int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
+int ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
@@ -920,10 +922,10 @@ int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
 					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
 	}
 
-	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
-					    HAL_RXDMA_MONITOR_BUF,
-					    DP_RXDMA_REFILL_RING_SIZE,
-					    &tlv_filter);
+	ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
+					       HAL_RXDMA_MONITOR_BUF,
+					       DP_RXDMA_REFILL_RING_SIZE,
+					       &tlv_filter);
 	if (ret)
 		return ret;
 
@@ -932,9 +934,9 @@ int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
 		tlv_filter.rx_filter =
 				HTT_RX_MON_FILTER_TLV_FLAGS_MON_STATUS_RING;
 
-	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
-					    HAL_RXDMA_MONITOR_STATUS,
-					    DP_RXDMA_REFILL_RING_SIZE,
-					    &tlv_filter);
+	ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
+					       HAL_RXDMA_MONITOR_STATUS,
+					       DP_RXDMA_REFILL_RING_SIZE,
+					       &tlv_filter);
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 373e7ed75a05..0a1f151aad8a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -15,25 +15,26 @@ struct ath11k_dp_htt_wbm_tx_status {
 	int ack_rssi;
 };
 
-int ath11k_dp_htt_h2t_ver_req_msg(struct ath11k_base *ab);
+int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct sk_buff *skb);
 void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
-int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
-			   enum hal_reo_cmd_type type,
-			   struct ath11k_hal_reo_cmd *cmd,
-			   void (*func)(struct ath11k_dp *, void *,
-					enum hal_reo_cmd_status));
+int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
+			      enum hal_reo_cmd_type type,
+			      struct ath11k_hal_reo_cmd *cmd,
+			      void (*func)(struct ath11k_dp *, void *,
+					   enum hal_reo_cmd_status));
 
-int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
-int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
-				    struct htt_ext_stats_cfg_params *cfg_params,
-				    u64 cookie);
-int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset);
+int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
+int
+ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				   struct htt_ext_stats_cfg_params *cfg_params,
+				   u64 cookie);
+int ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset);
 
-int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
-				  int mac_id, enum hal_ring_type ring_type,
-				  int rx_buf_size,
-				  struct htt_rx_ring_tlv_filter *tlv_filter);
+int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
+				     int mac_id, enum hal_ring_type ring_type,
+				     int rx_buf_size,
+				     struct htt_rx_ring_tlv_filter *tlv_filter);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 13da2e8262ba..663d2221c997 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3638,7 +3638,8 @@ static int ath11k_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	ret = ath11k_dp_htt_h2t_ppdu_stats_req(ar, HTT_PPDU_STATS_TAG_DEFAULT);
+	ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+						  HTT_PPDU_STATS_TAG_DEFAULT);
 	if (ret) {
 		ath11k_err(ab, "failed to req ppdu stats: %d\n", ret);
 		goto err;
@@ -4090,7 +4091,7 @@ static void ath11k_configure_filter(struct ieee80211_hw *hw,
 	/* For monitor mode */
 	reset_flag = !(ar->filter_flags & FIF_BCN_PRBRESP_PROMISC);
 
-	ret = ath11k_dp_htt_monitor_mode_ring_config(ar, reset_flag);
+	ret = ath11k_dp_tx_htt_monitor_mode_ring_config(ar, reset_flag);
 	if (!ret) {
 		if (!reset_flag)
 			set_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
