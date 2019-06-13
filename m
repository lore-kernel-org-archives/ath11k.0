Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbHKS-0006Xm-1T
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 04:27:13 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E20360261
 for <ath11k@lists.infradead.org>; Thu, 13 Jun 2019 04:27:10 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH V2] ath11k: Fix Rx signal strength reporting
Date: Thu, 13 Jun 2019 09:56:39 +0530
Message-Id: <1560399999-14062-1-git-send-email-vthiagar@codeaurora.org>
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

Since rssi in not reported in MSDU_START tlv, current signal strength
reporting is always wrong. Correct rssi is reported in PPDU_END tlv.
Enable PPDU_END, PPDU_END_STATUS_DONE and MPDU_START tlv reporting in
monitor status by default. Pass the sta's Rx signal strength to mac80211
in sta_statistics() ops. This patch also makes sure the default rx filter
is always enabled whenever there is a call to reset the filter (from
extd_rx_stats debugfs and config_filter path). Since some of the rx_stats
are enabled by default, make memory allocation of arsta->rx_stats unconditional.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

---

V2:

- Rebase on top of latest ath11k-bringup

 drivers/net/wireless/ath/ath11k/core.h   |  1 +
 drivers/net/wireless/ath/ath11k/debug.c  |  2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 11 ++----
 drivers/net/wireless/ath/ath11k/dp_tx.c  |  2 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c |  4 +++
 drivers/net/wireless/ath/ath11k/mac.c    | 60 ++++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.h    |  2 ++
 7 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 038f905..dc5cf68 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -237,6 +237,7 @@ struct ath11k_rx_peer_stats {
 	u64 tid_count[IEEE80211_NUM_TIDS + 1];
 	u64 pream_cnt[HAL_RX_PREAMBLE_MAX];
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
+	u32 rssi_comb;
 };
 
 struct ath11k_peer {
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index e22e1c8..b1b4fcf 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -828,6 +828,8 @@ static ssize_t ath11k_write_extd_rx_stats(struct file *file,
 		tlv_filter.pkt_filter_flags2 = HTT_RX_FP_CTRL_FILTER_FLASG2;
 		tlv_filter.pkt_filter_flags3 = HTT_RX_FP_CTRL_FILTER_FLASG3 |
 			HTT_RX_FP_DATA_FILTER_FLASG3;
+	} else {
+		tlv_filter = mon_status_filter_default;
 	}
 
 	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 55148ff..fcb93a1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1771,11 +1771,6 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, void *rx_desc,
 
 	rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
-	/* TODO: Use real NF instead of default one */
-	rx_status->signal = ath11k_dp_rx_h_msdu_start_rssi(rx_desc) +
-			    ATH11K_DEFAULT_NOISE_FLOOR;
-	rx_status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
-
 	channel_num = ath11k_dp_rx_h_msdu_start_freq(rx_desc);
 
 	if (channel_num >= 1 && channel_num <= 14) {
@@ -2162,6 +2157,8 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 
 	rx_stats->num_mpdu_fcs_ok += ppdu_info->num_mpdu_fcs_ok;
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
+
+	rx_stats->rssi_comb = ppdu_info->rssi_comb;
 }
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
@@ -2484,9 +2481,7 @@ static void ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 	rx_status->encoding = RX_ENC_LEGACY;
 	rx_status->bw = RATE_INFO_BW_20;
 
-	/* TODO: Use real NF instead of default one */
-	rx_status->signal = ath11k_dp_rx_h_msdu_start_rssi(rx_desc) +
-			    ATH11K_DEFAULT_NOISE_FLOOR;
+	rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
 	rx_channel = ath11k_dp_rx_h_msdu_start_freq(rx_desc);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5670796..27ee47d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -931,6 +931,8 @@ int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
 	if (!reset)
 		tlv_filter.rx_filter =
 				HTT_RX_MON_FILTER_TLV_FLAGS_MON_STATUS_RING;
+	else
+		tlv_filter = mon_status_filter_default;
 
 	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
 					    HAL_RXDMA_MONITOR_STATUS,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index c37340f..0308089 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1129,6 +1129,10 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 		struct hal_rx_phyrx_rssi_legacy_info *rssi =
 			(struct hal_rx_phyrx_rssi_legacy_info *)tlv_data;
 
+		/* TODO: Please note that the combined rssi will not be accurate
+		 * in MU case. Rssi in MU needs to be retrieved from
+		 * PHYRX_OTHER_RECEIVE_INFO TLV.
+		 */
 		ppdu_info->rssi_comb =
 			FIELD_GET(HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB,
 				  __le32_to_cpu(rssi->info0));
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8c47e09..b71aaff 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -151,6 +151,15 @@
 	},
 };
 
+const struct htt_rx_ring_tlv_filter mon_status_filter_default = {
+	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
+	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
+	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
+	.pkt_filter_flags3 = HTT_RX_FP_DATA_FILTER_FLASG3
+};
+
 #define ATH11K_MAC_FIRST_OFDM_RATE_IDX 4
 #define ath11k_g_rates ath11k_legacy_rates
 #define ath11k_g_rates_size (ARRAY_SIZE(ath11k_legacy_rates))
@@ -2686,13 +2695,10 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 			goto exit;
 		}
 
-		if (ath11k_debug_is_extd_rx_stats_enabled(ar)) {
-			arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats),
-						  GFP_KERNEL);
-			if (!arsta->rx_stats) {
-				ret = -ENOMEM;
-				goto exit;
-			}
+		arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+		if (!arsta->rx_stats) {
+			ret = -ENOMEM;
+			goto exit;
 		}
 
 		peer_param.vdev_id = arvif->vdev_id;
@@ -2752,10 +2758,8 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 		if (ath11k_debug_is_extd_tx_stats_enabled(ar))
 			kfree(arsta->tx_stats);
 
-		if (ath11k_debug_is_extd_rx_stats_enabled(ar)) {
-			kfree(arsta->rx_stats);
-			arsta->rx_stats = NULL;
-		}
+		kfree(arsta->rx_stats);
+		arsta->rx_stats = NULL;
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
@@ -3581,6 +3585,21 @@ void ath11k_drain_tx(struct ath11k *ar)
 	ath11k_mgmt_over_wmi_tx_purge(ar);
 }
 
+static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
+{
+	struct htt_rx_ring_tlv_filter tlv_filter = {0};
+	u32 ring_id;
+
+	if (enable)
+		tlv_filter = mon_status_filter_default;
+
+	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
+
+	return ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
+					     HAL_RXDMA_MONITOR_STATUS,
+					     DP_RX_BUFFER_SIZE, &tlv_filter);
+}
+
 static int ath11k_start(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
@@ -3660,6 +3679,16 @@ static int ath11k_start(struct ieee80211_hw *hw)
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
 
+	/* Configure monitor status ring with default rx_filter to get rx status
+	 * such as rssi, rx_duration.
+	 */
+	ret = ath11k_mac_config_mon_status_default(ar, true);
+	if (ret) {
+		ath11k_err(ab, "failed to configure monitor status ring with default rx_filter: (%d)\n",
+			   ret);
+		goto err;
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
@@ -3678,10 +3707,16 @@ static void ath11k_stop(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
+	int ret;
 
 	ath11k_drain_tx(ar);
 
 	mutex_lock(&ar->conf_mutex);
+	ret = ath11k_mac_config_mon_status_default(ar, false);
+	if (ret)
+		ath11k_err(ar->ab, "failed to clear rx_filter for monitor status ring: (%d)\n",
+			   ret);
+
 	clear_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
 	ar->state = ATH11K_STATE_OFF;
 	mutex_unlock(&ar->conf_mutex);
@@ -5188,6 +5223,9 @@ static void ath11k_sta_statistics(struct ieee80211_hw *hw,
 	}
 	sinfo->txrate.flags = arsta->txrate.flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+
+	/* TODO: Use real NF instead of default one. */
+	sinfo->signal = arsta->rx_stats->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
 }
 
 static const struct ieee80211_ops ath11k_ops = {
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 586e016..c1a55a9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -164,6 +164,8 @@ struct ath11k_generic_iter {
 
 #define ATH11K_CHAN_WIDTH_NUM			8
 
+extern const struct htt_rx_ring_tlv_filter mon_status_filter_default;
+
 int ath11k_mac_create(struct ath11k_base *ab);
 void ath11k_mac_destroy(struct ath11k_base *ab);
 void ath11k_mac_unregister(struct ath11k_base *ab);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
