Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2KL-0005Ow-Ki
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:02:31 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Fix Alignment should match open parenthesis warning
Date: Fri, 21 Jun 2019 00:32:08 +0530
Message-Id: <1561057328-395-1-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/ce.c:741: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/ce.c:753: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/core.c:63: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/core.c:151: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/core.h:800: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/debug.h:125: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/debug.c:1085: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/dp_rx.h:77: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal.c:889: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal.c:894: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal.c:926: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal.c:931: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.h:171: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/dp_rx.c:2893: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4231: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:161: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:3358: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:3366: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:4528: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:4539: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:5551: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/wmi.c:2450: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/wmi.c:5192: Alignment should match open parenthesis

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c              | 16 ++++++-------
 drivers/net/wireless/ath/ath11k/core.c            |  7 +++---
 drivers/net/wireless/ath/ath11k/core.h            |  8 +++++++
 drivers/net/wireless/ath/ath11k/debug.c           |  4 ++--
 drivers/net/wireless/ath/ath11k/debug.h           |  6 ++---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  4 ++--
 drivers/net/wireless/ath/ath11k/dp_rx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h           |  8 +++----
 drivers/net/wireless/ath/ath11k/hal.c             | 26 ++++++++++----------
 drivers/net/wireless/ath/ath11k/mac.c             | 29 ++++++++++-------------
 drivers/net/wireless/ath/ath11k/mac.h             |  6 ++---
 drivers/net/wireless/ath/ath11k/wmi.c             |  9 +++----
 12 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 685b851..626e7d2 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -737,10 +737,10 @@ void ath11k_ce_free_pipes(struct ath11k_base *sc)
 		if (pipe->dest_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
 			dma_free_coherent(sc->dev,
-					 pipe->dest_ring->nentries * desc_sz +
-					 CE_DESC_RING_ALIGN,
-					 pipe->dest_ring->base_addr_owner_space,
-					 pipe->dest_ring->base_addr_ce_space);
+					  pipe->dest_ring->nentries * desc_sz +
+					  CE_DESC_RING_ALIGN,
+					  pipe->dest_ring->base_addr_owner_space,
+					  pipe->dest_ring->base_addr_ce_space);
 			kfree(pipe->dest_ring);
 			pipe->dest_ring = NULL;
 		}
@@ -749,10 +749,10 @@ void ath11k_ce_free_pipes(struct ath11k_base *sc)
 			desc_sz =
 			  ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST_STATUS);
 			dma_free_coherent(sc->dev,
-				pipe->status_ring->nentries * desc_sz +
-				CE_DESC_RING_ALIGN,
-				pipe->status_ring->base_addr_owner_space,
-				pipe->status_ring->base_addr_ce_space);
+					  pipe->status_ring->nentries * desc_sz +
+					  CE_DESC_RING_ALIGN,
+					  pipe->status_ring->base_addr_owner_space,
+					  pipe->status_ring->base_addr_ce_space);
 			kfree(pipe->status_ring);
 			pipe->status_ring = NULL;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 02e16e9..221ba4da 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -60,8 +60,8 @@ static int ath11k_core_create_board_name(struct ath11k_base *sc, char *name,
 }
 
 static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *sc,
-							const char *dir,
-							const char *file)
+						   const char *dir,
+						   const char *file)
 {
 	char filename[100];
 	const struct firmware *fw;
@@ -148,8 +148,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 				break;
 
 			ath11k_dbg(sc, ATH11K_DBG_BOOT,
-					"boot found board data for '%s'",
-					boardname);
+				   "boot found board data for '%s'", boardname);
 
 			bd->data = board_ie_data;
 			bd->len = board_ie_len;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e8278cc..65c1a6d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -778,6 +778,14 @@ struct ath11k_fw_stats_peer_extd {
 	u32 rx_mc_bc_cnt;
 };
 
+void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
+void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
+			   u8 *mac_addr, u16 ast_hash);
+struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
+				     const u8 *addr);
+struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
+					     const u8 *addr);
+struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 3eb8814..f8081da 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1085,8 +1085,8 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 }
 
 static ssize_t ath11k_read_pktlog_filter(struct file *file,
-						char __user *ubuf,
-						size_t count, loff_t *ppos)
+					 char __user *ubuf,
+					 size_t count, loff_t *ppos)
 
 {
 	char buf[32] = {0};
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index cfa14ee..4b30a7c 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -122,9 +122,9 @@ static inline int __ath11k_dbg(struct ath11k_base *ab,
 }
 
 static inline void ath11k_dbg_dump(struct ath11k_base *ab,
-		     enum ath11k_debug_mask mask,
-		     const char *msg, const char *prefix,
-		     const void *buf, size_t len)
+				   enum ath11k_debug_mask mask,
+				   const char *msg, const char *prefix,
+				   const void *buf, size_t len)
 {
 	return;
 }
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 596b763..f683c31 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4239,8 +4239,8 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 }
 
 static ssize_t ath11k_read_htt_stats_type(struct file *file,
-					 char __user *user_buf,
-					 size_t count, loff_t *ppos)
+					  char __user *user_buf,
+					  size_t count, loff_t *ppos)
 {
 	struct ath11k *ar = file->private_data;
 	char buf[32];
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3db3d54..6939716 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2840,7 +2840,7 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 			ab->soc_stats.invalid_rbm++;
 			ath11k_warn(ab, "invalid return buffer manager %d\n", rbm);
 			ath11k_dp_rx_link_desc_return(ab, desc,
-						HAL_WBM_REL_BM_ACT_REL_MSDU);
+						      HAL_WBM_REL_BM_ACT_REL_MSDU);
 			continue;
 		}
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 1fae945..0a243ec 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -74,10 +74,10 @@ int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 				    struct napi_struct *napi, int budget);
 int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
-					struct dp_rxdma_ring *rx_ring,
-					int req_entries,
-					enum hal_rx_buf_return_buf_manager mgr,
-					gfp_t gfp);
+					   struct dp_rxdma_ring *rx_ring,
+					   int req_entries,
+					   enum hal_rx_buf_return_buf_manager mgr,
+					   gfp_t gfp);
 int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar);
 int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar);
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index b7b9b9c..81fb773 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -886,14 +886,14 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
 	} else {
 		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 			ath11k_ahb_write32(ab,
-				(unsigned long)srng->u.src_ring.hp_addr -
-				(unsigned long)ab->mem,
-				srng->u.src_ring.hp);
+					   (unsigned long)srng->u.src_ring.hp_addr -
+					   (unsigned long)ab->mem,
+					   srng->u.src_ring.hp);
 		} else {
 			ath11k_ahb_write32(ab,
-				(unsigned long)srng->u.dst_ring.tp_addr -
-				(unsigned long)ab->mem,
-				srng->u.dst_ring.tp);
+					   (unsigned long)srng->u.dst_ring.tp_addr -
+					   (unsigned long)ab->mem,
+					   srng->u.dst_ring.tp);
 		}
 	}
 }
@@ -923,15 +923,13 @@ void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 	}
 
 	ath11k_ahb_write32(ab,
-		HAL_SEQ_WCSS_UMAC_WBM_REG +
-		HAL_WBM_R0_IDLE_LIST_CONTROL_ADDR,
-		FIELD_PREP(HAL_WBM_SCATTER_BUFFER_SIZE, reg_scatter_buf_sz) |
-		FIELD_PREP(HAL_WBM_LINK_DESC_IDLE_LIST_MODE, 0x1));
+			   HAL_SEQ_WCSS_UMAC_WBM_REG + HAL_WBM_R0_IDLE_LIST_CONTROL_ADDR,
+			   FIELD_PREP(HAL_WBM_SCATTER_BUFFER_SIZE, reg_scatter_buf_sz) |
+			   FIELD_PREP(HAL_WBM_LINK_DESC_IDLE_LIST_MODE, 0x1));
 	ath11k_ahb_write32(ab,
-		HAL_SEQ_WCSS_UMAC_WBM_REG +
-		HAL_WBM_R0_IDLE_LIST_SIZE_ADDR,
-		FIELD_PREP(HAL_WBM_SCATTER_RING_SIZE_OF_IDLE_LINK_DESC_LIST,
-			   reg_scatter_buf_sz * nsbufs));
+			   HAL_SEQ_WCSS_UMAC_WBM_REG + HAL_WBM_R0_IDLE_LIST_SIZE_ADDR,
+			   FIELD_PREP(HAL_WBM_SCATTER_RING_SIZE_OF_IDLE_LINK_DESC_LIST,
+				      reg_scatter_buf_sz * nsbufs));
 	ath11k_ahb_write32(ab,
 			   HAL_SEQ_WCSS_UMAC_WBM_REG +
 			   HAL_WBM_SCATTERED_RING_BASE_LSB,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 13fd431..ee187de 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -167,10 +167,8 @@
 #define ath11k_a_rates (ath11k_legacy_rates + 4)
 #define ath11k_a_rates_size (ARRAY_SIZE(ath11k_legacy_rates) - 4)
 
-int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc,
-					    u8 preamble,
-					    u8 *rateidx,
-					    u16 *rate)
+int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
+					  u16 *rate)
 {
 	/* As default, it is OFDM rates */
 	int i = ATH11K_MAC_FIRST_OFDM_RATE_IDX;
@@ -3231,16 +3229,16 @@ static void ath11k_mac_setup_he_cap(struct ath11k *ar,
 
 	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		count = ath11k_mac_copy_he_cap(ar, cap,
-				ar->mac.iftype[NL80211_BAND_2GHZ],
-				NL80211_BAND_2GHZ);
+					       ar->mac.iftype[NL80211_BAND_2GHZ],
+					       NL80211_BAND_2GHZ);
 		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
 		band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
 	}
 
 	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
 		count = ath11k_mac_copy_he_cap(ar, cap,
-				ar->mac.iftype[NL80211_BAND_5GHZ],
-				NL80211_BAND_5GHZ);
+					       ar->mac.iftype[NL80211_BAND_5GHZ],
+					       NL80211_BAND_5GHZ);
 		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
 		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
 	}
@@ -4432,9 +4430,9 @@ struct ath11k_mac_change_chanctx_arg {
 	lockdep_assert_held(&ar->conf_mutex);
 
 	ieee80211_iterate_active_interfaces_atomic(ar->hw,
-					IEEE80211_IFACE_ITER_NORMAL,
-					ath11k_mac_change_chanctx_cnt_iter,
-					&arg);
+						   IEEE80211_IFACE_ITER_NORMAL,
+						   ath11k_mac_change_chanctx_cnt_iter,
+						   &arg);
 	if (arg.n_vifs == 0)
 		return;
 
@@ -4443,9 +4441,9 @@ struct ath11k_mac_change_chanctx_arg {
 		return;
 
 	ieee80211_iterate_active_interfaces_atomic(ar->hw,
-					IEEE80211_IFACE_ITER_NORMAL,
-					ath11k_mac_change_chanctx_fill_iter,
-					&arg);
+						   IEEE80211_IFACE_ITER_NORMAL,
+						   ath11k_mac_change_chanctx_fill_iter,
+						   &arg);
 
 	ath11k_mac_update_vif_chan(ar, arg.vifs, arg.n_vifs);
 
@@ -5461,8 +5459,7 @@ void ath11k_mac_unregister(struct ath11k_base *ab)
 
 		ieee80211_unregister_hw(ar->hw);
 
-		idr_for_each(&ar->txmgmt_idr,
-					 ath11k_mac_tx_mgmt_pending_free, ar);
+		idr_for_each(&ar->txmgmt_idr, ath11k_mac_tx_mgmt_pending_free, ar);
 		idr_destroy(&ar->txmgmt_idr);
 
 		kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 6d9233a..f6f8047 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -169,10 +169,8 @@ struct ath11k_generic_iter {
 int ath11k_mac_create(struct ath11k_base *ab);
 void ath11k_mac_destroy(struct ath11k_base *ab);
 void ath11k_mac_unregister(struct ath11k_base *ab);
-int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc,
-					    u8 preamble,
-					    u8 *rateidx,
-					    u16 *rate);
+int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
+					  u16 *rate);
 u8 ath11k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
 			     u32 bitrate);
 u8 ath11k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c055b15..485e6ac 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2447,8 +2447,9 @@ int ath11k_wmi_pdev_pktlog_disable(struct ath11k *ar)
 	return ret;
 }
 
-static inline void ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
-				struct wmi_host_pdev_band_to_mac *band_to_mac)
+static inline void
+ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
+			      struct wmi_host_pdev_band_to_mac *band_to_mac)
 {
 	u8 i;
 	struct ath11k_hal_reg_capabilities_ext *hal_reg_cap;
@@ -5189,8 +5190,8 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	rcu_read_unlock();
 }
 
-static void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
-				     u32 len)
+static void
+ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct wmi_pdev_bss_chan_info_event bss_ch_info_ev = {};
 	struct survey_info *survey;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
