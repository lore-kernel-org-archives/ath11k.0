Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2Hc-0003W4-Gq
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 18:59:42 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Avoid blank lines related warning
Date: Fri, 21 Jun 2019 00:29:20 +0530
Message-Id: <1561057160-32679-1-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/ce.c:496: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/core.h:156: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/core.c:325: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/debug.h:123: Please use a blank line after function/struct/union/enum declarations
drivers/net/wireless/ath/ath11k/debug.h:128: Blank lines aren't necessary after an open brace '{'
drivers/net/wireless/ath/ath11k/debug.h:129: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/debug.c:103: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/debug_htt_stats.h:1611: Blank lines aren't necessary after an open brace '{'
drivers/net/wireless/ath/ath11k/hal.h:251: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/dp_rx.c:2249: Blank lines aren't necessary after an open brace '{'
drivers/net/wireless/ath/ath11k/dp_rx.c:3223: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3430: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/rx_desc.h:380: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/mac.c:771: Please use a blank line after function/struct/union/enum declarations
drivers/net/wireless/ath/ath11k/mac.c:1832: Missing a blank line after declarations
drivers/net/wireless/ath/ath11k/mac.c:2627: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/mac.c:5558: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/mac.c:5636: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/wmi.h:5061: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/wmi.h:5134: Missing a blank line after declarations
drivers/net/wireless/ath/ath11k/wmi.c:532: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/wmi.c:2113: Please don't use multiple blank lines

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c              | 1 -
 drivers/net/wireless/ath/ath11k/core.c            | 1 -
 drivers/net/wireless/ath/ath11k/core.h            | 1 -
 drivers/net/wireless/ath/ath11k/debug.c           | 1 -
 drivers/net/wireless/ath/ath11k/debug.h           | 3 ++-
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 1 -
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h | 1 -
 drivers/net/wireless/ath/ath11k/dp_rx.c           | 2 --
 drivers/net/wireless/ath/ath11k/hal.h             | 1 -
 drivers/net/wireless/ath/ath11k/mac.c             | 5 ++---
 drivers/net/wireless/ath/ath11k/rx_desc.h         | 1 -
 drivers/net/wireless/ath/ath11k/wmi.c             | 2 --
 drivers/net/wireless/ath/ath11k/wmi.h             | 4 +---
 13 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 048adc1..33306b9 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -491,7 +491,6 @@ void ath11k_ce_per_engine_service(struct ath11k_base *ab, u16 ce_id)
 
 	if (pipe->recv_cb)
 		ath11k_ce_recv_process_cb(pipe);
-
 }
 
 void ath11k_ce_poll_send_completed(struct ath11k_base *ab, u8 pipe_id)
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c6dd9ba..8be6a62 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -321,7 +321,6 @@ int ath11k_core_fetch_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd)
 success:
 	ath11k_dbg(sc, ATH11K_DBG_BOOT, "using board api %d\n", sc->bd_api);
 	return 0;
-
 }
 
 static void ath11k_core_stop(struct ath11k_base *sc)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index f2990d3..e8278cc 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -153,7 +153,6 @@ enum ath11k_scan_state {
 	ATH11K_SCAN_ABORTING,
 };
 
-
 enum ath11k_dev_flags {
 	ATH11K_CAC_RUNNING,
 	ATH11K_FLAG_CORE_REGISTERED,
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 4aace02..4b124d7 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -100,7 +100,6 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
 			dev_printk(KERN_DEBUG, ab->dev, "%s\n", linebuf);
 		}
 	}
-
 }
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 04d9f32..d6a8135 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -120,12 +120,13 @@ static inline int __ath11k_dbg(struct ath11k_base *ab,
 {
 	return 0;
 }
+
 static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 		     enum ath11k_debug_mask mask,
 		     const char *msg, const char *prefix,
 		     const void *buf, size_t len)
 {
-
+	return;
 }
 #endif /* CONFIG_ATH11K_DEBUG */
 
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index cd8510c..596b763 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -3427,7 +3427,6 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_mgmt_subtype = %s ",
 			   fw_ring_mgmt_subtype);
 
-
 	ARRAY_TO_STRING(fw_ring_ctrl_subtype,
 			htt_stats_buf->fw_ring_ctrl_subtype,
 			HTT_STATS_SUBTYPE_MAX);
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index 377ddd8..3ce4ba2 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -1612,7 +1612,6 @@ struct htt_tx_sounding_stats_tlv {
 };
 
 struct htt_pdev_obss_pd_stats_tlv {
-
 	u32        num_obss_tx_ppdu_success;
 	u32        num_obss_tx_ppdu_failure;
 };
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c64beb5..854d8ca 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2196,7 +2196,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	ath11k_hal_srng_access_begin(ab, srng);
 
 	while ((rx_desc = ath11k_dp_rx_get_reo_desc(ab, srng))) {
-
 		memset(&meta_info, 0, sizeof(meta_info));
 		ath11k_hal_rx_parse_dst_ring_desc(ab, rx_desc, &meta_info);
 
@@ -3170,7 +3169,6 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 	if (!total_num_buffs_reaped)
 		goto done;
 
-
 	for (i = 0; i <  ab->num_radios; i++) {
 		if (!num_buffs_reaped[i])
 			continue;
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 6649dd2..8ee4446 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -248,7 +248,6 @@
 
 #define HAL_ADDR_MSB_REG_SHIFT				32
 
-
 /* WBM ring bit field mask and shift */
 #define HAL_WBM_LINK_DESC_IDLE_LIST_MODE		BIT(1)
 #define HAL_WBM_SCATTER_BUFFER_SIZE			GENMASK(10, 2)
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1e9c34..42ebc40 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -648,6 +648,7 @@ static int ath11k_monitor_vdev_up(struct ath11k *ar, int vdev_id)
 		   vdev_id);
 	return 0;
 }
+
 static int ath11k_config(struct ieee80211_hw *hw, u32 changed)
 {
 	struct ath11k *ar = hw->priv;
@@ -1710,6 +1711,7 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT) {
 		u32 cts_prot;
+
 		cts_prot = !!(info->use_cts_prot);
 		param_id = WMI_VDEV_PARAM_PROTECTION_MODE;
 
@@ -2504,7 +2506,6 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 			if (!wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ))
 				ath11k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
 					    sta->addr, arvif->vdev_id);
-
 		}
 	}
 
@@ -5468,7 +5469,6 @@ void ath11k_mac_unregister(struct ath11k_base *ab)
 		kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
 
 		SET_IEEE80211_DEV(ar->hw, NULL);
-
 	}
 	ab->mac_registered = false;
 }
@@ -5546,7 +5546,6 @@ int ath11k_mac_create(struct ath11k_base *ab)
 
 		idr_init(&ar->txmgmt_idr);
 		spin_lock_init(&ar->txmgmt_idr_lock);
-
 	}
 
 	/* Initialize channel counters frequency value in hertz */
diff --git a/drivers/net/wireless/ath/ath11k/rx_desc.h b/drivers/net/wireless/ath/ath11k/rx_desc.h
index 57518a0..3bc2bbe 100644
--- a/drivers/net/wireless/ath/ath11k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath11k/rx_desc.h
@@ -377,7 +377,6 @@ struct rx_attention {
 #define RX_MPDU_START_INFO3_RXDMA0_SRC_RING_SEL		GENMASK(12, 11)
 #define RX_MPDU_START_INFO3_RXDMA0_DST_RING_SEL		GENMASK(14, 13)
 
-
 #define RX_MPDU_START_INFO4_REO_QUEUE_DESC_HI	GENMASK(7, 0)
 #define RX_MPDU_START_INFO4_RECV_QUEUE_NUM	GENMASK(23, 8)
 #define RX_MPDU_START_INFO4_PRE_DELIM_ERR_WARN	BIT(24)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c9a239e..e563867 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -530,7 +530,6 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 	if (!skb)
 		return -ENOMEM;
 
-
 	cmd = (struct wmi_mgmt_send_cmd *)skb->data;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_MGMT_TX_SEND_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
@@ -2111,7 +2110,6 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_SCAN_CHAN_LIST_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "WMI no.of chan = %d len = %d\n", chan_list->nallchans, len);
 	cmd->pdev_id = chan_list->pdev_id;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 1239eaf..4e92bf0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5058,7 +5058,6 @@ enum ath11k_hw_txrx_mode {
 	ATH11K_HW_TXRX_ETHERNET = 2,
 };
 
-
 struct wmi_wmm_params {
 	u32 tlv_header;
 	u32 cwmin;
@@ -5131,8 +5130,7 @@ struct target_resource_config {
 	u32 tt_support;
 	u32 atf_config;
 	u32 iphdr_pad_config;
-	u32
-	    qwrap_config:16,
+	u32 qwrap_config:16,
 	    alloc_frag_desc_for_data_pkt:16;
 	u32 num_tdls_vdevs;
 	u32 num_tdls_conn_table_entries;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
