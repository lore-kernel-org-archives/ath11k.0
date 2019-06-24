Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNTy-00052t-PU
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:50:00 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 4/8] ath11k: use ath11k_mac_op_ prefix for functions in
 ath11k_ops
Date: Mon, 24 Jun 2019 17:19:25 +0530
Message-Id: <1561376969-3999-4-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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

add ath11k_mac_op_ prefix for all functions defined in ath11k_ops
in mac.c file.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 146 +++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6c1b331..25f9b50 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -654,7 +654,7 @@ static int ath11k_monitor_vdev_up(struct ath11k *ar, int vdev_id)
 	return 0;
 }
 
-static int ath11k_config(struct ieee80211_hw *hw, u32 changed)
+static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 {
 	struct ath11k *ar = hw->priv;
 	int ret = 0;
@@ -1629,10 +1629,10 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 	/* TODO: cancel connection_loss_work */
 }
 
-static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
-				    struct ieee80211_vif *vif,
-				    struct ieee80211_bss_conf *info,
-				    u32 changed)
+static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif,
+					   struct ieee80211_bss_conf *info,
+					   u32 changed)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
@@ -1949,9 +1949,9 @@ static int ath11k_start_scan(struct ath11k *ar,
 	return 0;
 }
 
-static int ath11k_hw_scan(struct ieee80211_hw *hw,
-			  struct ieee80211_vif *vif,
-			  struct ieee80211_scan_request *hw_req)
+static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_scan_request *hw_req)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
@@ -2032,8 +2032,8 @@ static int ath11k_hw_scan(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_cancel_hw_scan(struct ieee80211_hw *hw,
-				  struct ieee80211_vif *vif)
+static void ath11k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
+					 struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
 
@@ -2147,9 +2147,9 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 	return first_errno;
 }
 
-static int ath11k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
-			  struct ieee80211_key_conf *key)
+static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+				 struct ieee80211_key_conf *key)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
@@ -2541,11 +2541,11 @@ static void ath11k_mac_dec_num_stations(struct ath11k_vif *arvif,
 	ar->num_stations--;
 }
 
-static int ath11k_sta_state(struct ieee80211_hw *hw,
-			    struct ieee80211_vif *vif,
-			    struct ieee80211_sta *sta,
-			    enum ieee80211_sta_state old_state,
-			    enum ieee80211_sta_state new_state)
+static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_sta *sta,
+				   enum ieee80211_sta_state old_state,
+				   enum ieee80211_sta_state new_state)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
@@ -2673,10 +2673,10 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_sta_rc_update(struct ieee80211_hw *hw,
-				 struct ieee80211_vif *vif,
-				 struct ieee80211_sta *sta,
-				 u32 changed)
+static void ath11k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta,
+					u32 changed)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
@@ -2816,9 +2816,9 @@ static int ath11k_conf_tx_uapsd(struct ath11k *ar, struct ieee80211_vif *vif,
 	return ret;
 }
 
-static int ath11k_conf_tx(struct ieee80211_hw *hw,
-			  struct ieee80211_vif *vif, u16 ac,
-			  const struct ieee80211_tx_queue_params *params)
+static int ath11k_mac_op_conf_tx(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif, u16 ac,
+				 const struct ieee80211_tx_queue_params *params)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
@@ -3481,7 +3481,7 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 						DP_RX_BUFFER_SIZE, &tlv_filter);
 }
 
-static int ath11k_start(struct ieee80211_hw *hw)
+static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
@@ -3585,7 +3585,7 @@ static int ath11k_start(struct ieee80211_hw *hw)
 	return ret;
 }
 
-static void ath11k_stop(struct ieee80211_hw *hw)
+static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
@@ -3703,8 +3703,8 @@ static int ath11k_set_he_mu_sounding_mode(struct ath11k *ar,
 	return ret;
 }
 
-static int ath11k_add_interface(struct ieee80211_hw *hw,
-				struct ieee80211_vif *vif)
+static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
@@ -3931,8 +3931,8 @@ static int ath11k_mac_vif_unref(int buf_id, void *skb, void *ctx)
 	return 0;
 }
 
-static void ath11k_remove_interface(struct ieee80211_hw *hw,
-				    struct ieee80211_vif *vif)
+static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
@@ -3995,10 +3995,10 @@ static void ath11k_remove_interface(struct ieee80211_hw *hw,
 	FIF_PROBE_REQ |				\
 	FIF_FCSFAIL)
 
-static void ath11k_configure_filter(struct ieee80211_hw *hw,
-				    unsigned int changed_flags,
-				    unsigned int *total_flags,
-				    u64 multicast)
+static void ath11k_mac_op_configure_filter(struct ieee80211_hw *hw,
+					   unsigned int changed_flags,
+					   unsigned int *total_flags,
+					   u64 multicast)
 {
 	struct ath11k *ar = hw->priv;
 	bool reset_flag = false;
@@ -4026,7 +4026,7 @@ static void ath11k_configure_filter(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
-static int ath11k_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
+static int ath11k_mac_op_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 {
 	struct ath11k *ar = hw->priv;
 
@@ -4040,7 +4040,7 @@ static int ath11k_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 	return 0;
 }
 
-static int ath11k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
+static int ath11k_mac_op_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 {
 	struct ath11k *ar = hw->priv;
 	int ret;
@@ -4052,9 +4052,9 @@ static int ath11k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	return ret;
 }
 
-static int ath11k_ampdu_action(struct ieee80211_hw *hw,
-			       struct ieee80211_vif *vif,
-			       struct ieee80211_ampdu_params *params)
+static int ath11k_mac_op_ampdu_action(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_ampdu_params *params)
 {
 	struct ath11k *ar = hw->priv;
 	int ret = -EINVAL;
@@ -4603,7 +4603,7 @@ ath11k_set_vdev_param_to_all_vifs(struct ath11k *ar, int param, u32 value)
 /* mac80211 stores device specific RTS/Fragmentation threshold value,
  * this is set interface specific to firmware from ath11k driver
  */
-static int ath11k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
+static int ath11k_mac_op_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 {
 	struct ath11k *ar = hw->priv;
 	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
@@ -4611,7 +4611,7 @@ static int ath11k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	return ath11k_set_vdev_param_to_all_vifs(ar, param_id, value);
 }
 
-static int ath11k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
+static int ath11k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 {
 	/* Even though there's a WMI vdev param for fragmentation threshold no
 	 * known firmware actually implements it. Moreover it is not possible to
@@ -4626,8 +4626,8 @@ static int ath11k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	return -EOPNOTSUPP;
 }
 
-static void ath11k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-			 u32 queues, bool drop)
+static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+				u32 queues, bool drop)
 {
 	struct ath11k *ar = hw->priv;
 	long time_left;
@@ -4985,8 +4985,8 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 }
 
 static void
-ath11k_reconfig_complete(struct ieee80211_hw *hw,
-			 enum ieee80211_reconfig_type reconfig_type)
+ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
+				enum ieee80211_reconfig_type reconfig_type)
 {
 	struct ath11k *ar = hw->priv;
 
@@ -5038,7 +5038,7 @@ ath11k_mac_update_bss_chan_survey(struct ath11k *ar,
 		ath11k_warn(ar->ab, "bss channel survey timed out\n");
 }
 
-static int ath11k_get_survey(struct ieee80211_hw *hw, int idx,
+static int ath11k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 			     struct survey_info *survey)
 {
 	struct ath11k *ar = hw->priv;
@@ -5083,10 +5083,10 @@ static int ath11k_get_survey(struct ieee80211_hw *hw, int idx,
 	return ret;
 }
 
-static void ath11k_sta_statistics(struct ieee80211_hw *hw,
-				  struct ieee80211_vif *vif,
-				  struct ieee80211_sta *sta,
-				  struct station_info *sinfo)
+static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
+					 struct ieee80211_vif *vif,
+					 struct ieee80211_sta *sta,
+					 struct station_info *sinfo)
 {
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
 
@@ -5115,35 +5115,35 @@ static void ath11k_sta_statistics(struct ieee80211_hw *hw,
 
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
-	.start                          = ath11k_start,
-	.stop                           = ath11k_stop,
-	.reconfig_complete              = ath11k_reconfig_complete,
-	.add_interface                  = ath11k_add_interface,
-	.remove_interface		= ath11k_remove_interface,
-	.config                         = ath11k_config,
-	.bss_info_changed               = ath11k_bss_info_changed,
-	.configure_filter		= ath11k_configure_filter,
-	.hw_scan                        = ath11k_hw_scan,
-	.cancel_hw_scan                 = ath11k_cancel_hw_scan,
-	.set_key                        = ath11k_set_key,
-	.sta_state                      = ath11k_sta_state,
-	.sta_rc_update			= ath11k_sta_rc_update,
-	.conf_tx                        = ath11k_conf_tx,
-	.set_antenna			= ath11k_set_antenna,
-	.get_antenna			= ath11k_get_antenna,
-	.ampdu_action			= ath11k_ampdu_action,
+	.start                          = ath11k_mac_op_start,
+	.stop                           = ath11k_mac_op_stop,
+	.reconfig_complete              = ath11k_mac_op_reconfig_complete,
+	.add_interface                  = ath11k_mac_op_add_interface,
+	.remove_interface		= ath11k_mac_op_remove_interface,
+	.config                         = ath11k_mac_op_config,
+	.bss_info_changed               = ath11k_mac_op_bss_info_changed,
+	.configure_filter		= ath11k_mac_op_configure_filter,
+	.hw_scan                        = ath11k_mac_op_hw_scan,
+	.cancel_hw_scan                 = ath11k_mac_op_cancel_hw_scan,
+	.set_key                        = ath11k_mac_op_set_key,
+	.sta_state                      = ath11k_mac_op_sta_state,
+	.sta_rc_update			= ath11k_mac_op_sta_rc_update,
+	.conf_tx                        = ath11k_mac_op_conf_tx,
+	.set_antenna			= ath11k_mac_op_set_antenna,
+	.get_antenna			= ath11k_mac_op_get_antenna,
+	.ampdu_action			= ath11k_mac_op_ampdu_action,
 	.add_chanctx			= ath11k_mac_op_add_chanctx,
 	.remove_chanctx			= ath11k_mac_op_remove_chanctx,
 	.change_chanctx			= ath11k_mac_op_change_chanctx,
 	.assign_vif_chanctx		= ath11k_mac_op_assign_vif_chanctx,
 	.unassign_vif_chanctx		= ath11k_mac_op_unassign_vif_chanctx,
 	.switch_vif_chanctx		= ath11k_mac_op_switch_vif_chanctx,
-	.set_rts_threshold		= ath11k_set_rts_threshold,
-	.set_frag_threshold		= ath11k_set_frag_threshold,
+	.set_rts_threshold		= ath11k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath11k_mac_op_set_frag_threshold,
 	.set_bitrate_mask		= ath11k_mac_op_set_bitrate_mask,
-	.get_survey			= ath11k_get_survey,
-	.flush				= ath11k_flush,
-	.sta_statistics			= ath11k_sta_statistics,
+	.get_survey			= ath11k_mac_op_get_survey,
+	.flush				= ath11k_mac_op_flush,
+	.sta_statistics			= ath11k_mac_op_sta_statistics,
 	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs		= ath11k_sta_add_debugfs,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
