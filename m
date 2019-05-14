Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPGA-0001C5-M3
 for ath11k@lists.infradead.org; Tue, 14 May 2019 04:41:52 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 2/3] ath11k: Initialize and enable dfs radar detection
Date: Tue, 14 May 2019 10:11:18 +0530
Message-Id: <1557808879-26933-3-git-send-email-srirrama@codeaurora.org>
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

IPQ8074 firmware supports radar detection offload, which
enables complete radar detection algorithm to be offloaded to firmware.
Initialize dfs support by adding supported radar detect
widths and introduce the CAC_RUNNING flag to be used
when mac80211 triggers cac for the dfs channel.
This flag is used to check and drop any
rx packets if received during the CAC period.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 20 +++++++++---
 drivers/net/wireless/ath/ath11k/mac.c   | 54 +++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c   |  8 ++---
 drivers/net/wireless/ath/ath11k/wmi.h   |  1 +
 5 files changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c8c1cd6..7b98649 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -438,6 +438,7 @@ struct ath11k {
 	struct {
 		struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
 	} mac;
+	unsigned long dev_flags;
 	unsigned int filter_flags;
 	unsigned long monitor_flags;
 	u32 min_tx_power;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0796f3b..323b021 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1779,10 +1779,6 @@ static void ath11k_dp_rx_process_amsdu(struct ath11k *ar,
 	if (first_mpdu)
 		ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
 
-	/* TODO: Check if we need to drop frames in certain cases something
-	 * like while in the middle of CAC.
-	 */
-
 	ath11k_dp_rx_h_mpdu(ar, amsdu_list, rx_desc, rx_status);
 }
 
@@ -2039,6 +2035,11 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 		goto rcu_unlock;
 	}
 
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		__skb_queue_purge(&msdu_list);
+		goto rcu_unlock;
+	}
+
 	while (!skb_queue_empty(&msdu_list)) {
 		__skb_queue_head_init(&amsdu_list);
 		ret = ath11k_dp_rx_retrieve_amsdu(ar, &msdu_list, &amsdu_list);
@@ -2536,6 +2537,11 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, struct napi_struct *napi,
 		goto exit;
 	}
 
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		dev_kfree_skb_any(msdu);
+		goto exit;
+	}
+
 	rx_desc = msdu->data;
 	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
 	skb_put(msdu, HAL_RX_DESC_SIZE + msdu_len);
@@ -2956,6 +2962,12 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 		}
 
 		ar = ab->pdevs[i].ar;
+
+		if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+			__skb_queue_purge(&msdu_list[i]);
+			continue;
+		}
+
 		while ((msdu = __skb_dequeue(&msdu_list[i])) != NULL)
 			ath11k_dp_rx_wbm_err(ar, napi, msdu, &msdu_list[i]);
 	}
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index dc2733c..bb9bf61 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3351,6 +3351,13 @@ static int ath11k_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	ret = ath11k_wmi_send_dfs_phyerr_offload_enable_cmd(ar, pdev->pdev_id);
+	if (ret) {
+		ath11k_err(ab, "failed to offload radar detection: %d\n",
+			   ret);
+		goto err;
+	}
+
 	ret = ath11k_dp_htt_h2t_ppdu_stats_req(ar, HTT_PPDU_STATS_TAG_DEFAULT);
 	if (ret) {
 		ath11k_err(ab, "failed to req ppdu stats: %d\n", ret);
@@ -3388,6 +3395,7 @@ static void ath11k_stop(struct ieee80211_hw *hw)
 	ath11k_drain_tx(ar);
 
 	mutex_lock(&ar->conf_mutex);
+	clear_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
 	ar->state = ATH11K_STATE_OFF;
 	mutex_unlock(&ar->conf_mutex);
 
@@ -3822,8 +3830,6 @@ static int ath11k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	ar->rx_channel = ctx->def.chan;
 	spin_unlock_bh(&ar->data_lock);
 
-	/* TODO: CAC */
-
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
@@ -3848,8 +3854,6 @@ static void ath11k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	ar->rx_channel = NULL;
 	spin_unlock_bh(&ar->data_lock);
 
-	/* TODO: CAC */
-
 	mutex_unlock(&ar->conf_mutex);
 }
 
@@ -3907,9 +3911,25 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		arg.channel.chan_radar =
 			!!(chandef->chan->flags & IEEE80211_CHAN_RADAR);
 
+		arg.channel.passive = arg.channel.chan_radar;
+
+		spin_lock_bh(&ab->data_lock);
+
+		/* Use the new reg info if available */
+		if (ar->ab->new_regd[ar->pdev_idx])
+			arg.regdomain =
+				ar->ab->new_regd[ar->pdev_idx]->dfs_region;
+		else
+			arg.regdomain =
+				ar->ab->default_regd[ar->pdev_idx]->dfs_region;
+
+		spin_unlock_bh(&ab->data_lock);
+
 		/* TODO: Notify if secondary 80Mhz also needs radar detection */
 	}
 
+	arg.channel.passive |= !!(chandef->chan->flags & IEEE80211_CHAN_NO_IR);
+
 	ath11k_dbg(ab, ATH11K_DBG_MAC,
 		   "mac vdev %d start center_freq %d phymode %s\n",
 		   arg.vdev_id, arg.channel.freq,
@@ -3931,7 +3951,21 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 
 	ar->num_started_vdevs++;
 
-	/* TODO: Recalc radar */
+	/* Enable CAC Flag in the driver by checking the channel DFS cac time,
+	 * i.e dfs_cac_ms value which will be valid only for radar channels
+	 * and state as NL80211_DFS_USABLE which indicates CAC needs to be
+	 * done before channel usage. This flags is used to drop rx packets.
+	 * during CAC.
+	 */
+	/* TODO Set the flag for other interface types as required */
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP &&
+	    chandef->chan->dfs_cac_ms &&
+	    chandef->chan->dfs_state == NL80211_DFS_USABLE) {
+		set_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
+		ath11k_dbg(ab, ATH11K_DBG_MAC,
+			   "CAC Started in chan_freq %d for vdev %d\n",
+			   arg.channel.freq, arg.vdev_id);
+	}
 
 	return 0;
 }
@@ -3970,7 +4004,11 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 
 	ar->num_started_vdevs--;
 
-	/* TODO: Recalc radar */
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		clear_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
+		ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "CAC Stopped for vdev %d\n",
+			   arvif->vdev_id);
+	}
 
 	return 0;
 err:
@@ -4797,6 +4835,10 @@ static const struct ieee80211_iface_combination ath11k_if_comb[] = {
 		.max_interfaces = 16,
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
+		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+					BIT(NL80211_CHAN_WIDTH_20) |
+					BIT(NL80211_CHAN_WIDTH_40) |
+					BIT(NL80211_CHAN_WIDTH_80),
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 434508f..8364e44 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -788,6 +788,7 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 	cmd->preferred_rx_streams = arg->pref_rx_streams;
 	cmd->preferred_tx_streams = arg->pref_tx_streams;
 	cmd->cac_duration_ms = arg->cac_duration_ms;
+	cmd->regdomain = arg->regdomain;
 	cmd->he_ops = arg->he_ops;
 
 	if (!restart) {
@@ -5151,10 +5152,9 @@ void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 		goto exit;
 	}
 
-	/* TODO: Check CAC running state */
-
-	if (rx_ev.status & (WMI_RX_STATUS_ERR_DECRYPT |
-	    WMI_RX_STATUS_ERR_KEY_CACHE_MISS | WMI_RX_STATUS_ERR_CRC)) {
+	if ((test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) ||
+	    (rx_ev.status & (WMI_RX_STATUS_ERR_DECRYPT |
+	    WMI_RX_STATUS_ERR_KEY_CACHE_MISS | WMI_RX_STATUS_ERR_CRC))) {
 		dev_kfree_skb(skb);
 		goto exit;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index d640cdf..bd7e88a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3134,6 +3134,7 @@ struct wmi_vdev_start_req_arg {
 	bool pmf_enabled;
 	u32 he_ops;
 	u32 cac_duration_ms;
+	u32 regdomain;
 	u32 pref_rx_streams;
 	u32 pref_tx_streams;
 	u32 num_noa_descriptors;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
