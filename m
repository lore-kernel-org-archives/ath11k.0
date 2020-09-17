Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvpu-00057B-T4
 for ath11k@lists.infradead.org; Thu, 17 Sep 2020 15:28:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: wmi: remove redundant configuration values from init
Date: Thu, 17 Sep 2020 18:28:27 +0300
Message-Id: <1600356507-29237-1-git-send-email-kvalo@codeaurora.org>
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
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org

In commit 2d4bcbed5b7d ("ath11k: initialize wmi config based on hw_params") the
wmi config initialisation was moved to hw_ops->wmi_init_config() but the old
initialisation values were accidentally left to ath11k_wmi_cmd_init(). This
is very confusing, so remove the redundant values.

And this was actually so confusing that in commit aa2092a9bab3 ("ath11k: add
raw mode and software crypto support") I actually it caused a bug: when
ATH11K_FLAG_RAW_MODE was enabled rx_decap_mode was assigned back to
TARGET_DECAP_MODE_NATIVE_WIFI in ath11k_init_wmi_config_ipq8074(). Fix this at
the same time.

Compile tested only.

Fixes: 2d4bcbed5b7d ("ath11k: initialize wmi config based on hw_params")
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c  |  7 ++++-
 drivers/net/wireless/ath/ath11k/wmi.c | 49 -----------------------------------
 2 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 4d7d2dc691d2..11a411b76fe4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -103,7 +103,12 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
 	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
 	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
-	config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
 	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
 	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
 	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index adde14a390ec..92c7345dc150 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3342,55 +3342,6 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	memset(&init_param, 0, sizeof(init_param));
 	memset(&config, 0, sizeof(config));
 
-	config.num_vdevs = ab->num_radios * TARGET_NUM_VDEVS;
-
-	if (ab->num_radios == 2) {
-		config.num_peers = TARGET_NUM_PEERS(DBS);
-		config.num_tids = TARGET_NUM_TIDS(DBS);
-	} else if (ab->num_radios == 3) {
-		config.num_peers = TARGET_NUM_PEERS(DBS_SBS);
-		config.num_tids = TARGET_NUM_TIDS(DBS_SBS);
-	} else {
-		/* Control should not reach here */
-		config.num_peers = TARGET_NUM_PEERS(SINGLE);
-		config.num_tids = TARGET_NUM_TIDS(SINGLE);
-	}
-	config.num_offload_peers = TARGET_NUM_OFFLD_PEERS;
-	config.num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
-	config.num_peer_keys = TARGET_NUM_PEER_KEYS;
-	config.ast_skid_limit = TARGET_AST_SKID_LIMIT;
-	config.tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
-	config.rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
-	config.rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
-	config.rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
-	config.rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
-	config.rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
-	config.rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
-
-	if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
-		config.rx_decap_mode = TARGET_DECAP_MODE_RAW;
-
-	config.scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
-	config.bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
-	config.roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
-	config.roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
-	config.num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
-	config.num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
-	config.mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
-	config.tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
-	config.num_wds_entries = TARGET_NUM_WDS_ENTRIES;
-	config.dma_burst_size = TARGET_DMA_BURST_SIZE;
-	config.rx_skip_defrag_timeout_dup_detection_check =
-		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
-	config.vow_config = TARGET_VOW_CONFIG;
-	config.gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
-	config.num_msdu_desc = TARGET_NUM_MSDU_DESC;
-	config.beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
-	config.rx_batchmode = TARGET_RX_BATCHMODE;
-	config.peer_map_unmap_v2_support = 1;
-	config.twt_ap_pdev_count = ab->num_radios;
-	config.twt_ap_sta_count = 1000;
-
 	ab->hw_params.hw_ops->wmi_init_config(ab, &config);
 
 	memcpy(&wmi_sc->wlan_resource_config, &config, sizeof(config));
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
