Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Gf7-0004mt-KA
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 11:17:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 10/12] ath11k: initialize wmi config based on hw_params
Date: Sun, 16 Aug 2020 14:16:37 +0300
Message-Id: <1597576599-8857-11-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
References: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

QCA6390 has very different wmi config parameters compared to IPQ8074,
so use different function to initialize wmi init config parameters.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c  | 98 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h  |  4 ++
 drivers/net/wireless/ath/ath11k/wmi.c |  4 +-
 3 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 5811eabf2275..338b784b0e84 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -31,12 +31,110 @@ static u8 ath11k_hw_ipq6018_mac_from_pdev_id(int pdev_idx)
 	return pdev_idx;
 }
 
+static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
+					   struct target_resource_config *config)
+{
+	config->num_vdevs = 4;
+	config->num_peers = 16;
+	config->num_tids = 32;
+
+	config->num_offload_peers = 3;
+	config->num_offload_reorder_buffs = 3;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+	config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = 0;
+	config->num_mcast_table_elems = 0;
+	config->mcast2ucast_mode = 0;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = 0;
+	config->dma_burst_size = 0;
+	config->rx_skip_defrag_timeout_dup_detection_check = 0;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = 2;
+	config->num_msdu_desc = 0x400;
+	config->beacon_tx_offload_max_vdev = 2;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+
+	config->peer_map_unmap_v2_support = 0;
+	config->use_pdev_id = 1;
+	config->max_frag_entries = 0xa;
+	config->num_tdls_vdevs = 0x1;
+	config->num_tdls_conn_table_entries = 8;
+	config->beacon_tx_offload_max_vdev = 0x2;
+	config->num_multicast_filter_entries = 0x20;
+	config->num_wow_filters = 0x16;
+	config->num_keep_alive_pattern = 0x1;
+	config->num_keep_alive_pattern = 0;
+}
+
+static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
+					   struct target_resource_config *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS;
+
+	if (ab->num_radios == 2) {
+		config->num_peers = TARGET_NUM_PEERS(DBS);
+		config->num_tids = TARGET_NUM_TIDS(DBS);
+	} else if (ab->num_radios == 3) {
+		config->num_peers = TARGET_NUM_PEERS(DBS_SBS);
+		config->num_tids = TARGET_NUM_TIDS(DBS_SBS);
+	} else {
+		/* Control should not reach here */
+		config->num_peers = TARGET_NUM_PEERS(SINGLE);
+		config->num_tids = TARGET_NUM_TIDS(SINGLE);
+	}
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+	config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_v2_support = 1;
+	config->twt_ap_pdev_count = 2;
+	config->twt_ap_sta_count = 1000;
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
+	.wmi_init_config = ath11k_init_wmi_config_qca6390,
 };
 
 const struct ath11k_hw_ops ipq6018_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq6018_mac_from_pdev_id,
+	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
 };
 
 const struct ath11k_hw_ops qca6390_ops = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 3dcd05ceeef7..4651aed2eaf0 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -6,6 +6,8 @@
 #ifndef ATH11K_HW_H
 #define ATH11K_HW_H
 
+#include "wmi.h"
+
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
@@ -116,6 +118,8 @@ struct ath11k_hw_ring_mask {
 
 struct ath11k_hw_ops {
 	u8 (*get_hw_mac_from_pdev_id)(int pdev_id);
+	void (*wmi_init_config)(struct ath11k_base *ab,
+				struct target_resource_config *config);
 };
 
 struct ath11k_hw_params {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c43f54a7c54d..21f9070a1300 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3181,7 +3181,7 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 			      (param->num_band_to_mac * sizeof(*band_to_mac));
 
 	len = sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*cfg) + hw_mode_len +
-	      (sizeof(*host_mem_chunks) * WMI_MAX_MEM_REQS);
+	      (param->num_mem_chunks ? (sizeof(*host_mem_chunks) * WMI_MAX_MEM_REQS) : 0);
 
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
@@ -3387,6 +3387,8 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	config.twt_ap_pdev_count = ab->num_radios;
 	config.twt_ap_sta_count = 1000;
 
+	ab->hw_params.hw_ops->wmi_init_config(ab, &config);
+
 	memcpy(&wmi_sc->wlan_resource_config, &config, sizeof(config));
 
 	init_param.res_cfg = &wmi_sc->wlan_resource_config;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
