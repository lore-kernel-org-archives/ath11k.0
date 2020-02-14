Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2YGL-0006Ef-OH
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 10:31:59 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 1/2] ath11k: Configure hash based reo destination ring
 selection
Date: Fri, 14 Feb 2020 16:01:25 +0530
Message-Id: <1581676286-13265-2-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1581676286-13265-1-git-send-email-srirrama@codeaurora.org>
References: <1581676286-13265-1-git-send-email-srirrama@codeaurora.org>
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

Current implementation of pdev based reo destination ring
selection is replaced by hash based ring selection so as to
ensure all the available rings are utilized for better performance.

The 4 reo destination rings are selected by the HW based on the
hash value computed from the received packet based on the 5 tuple
{ip src/ip dst/src port/dst port/protocol}. Out of the 32 hash values
used by the hw, the driver assigns 8 values per reo destination ring
to each of the 4 reo destination rings.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c     | 17 +++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp.h     |  2 +-
 drivers/net/wireless/ath/ath11k/hal.h    | 12 ++++++++++-
 drivers/net/wireless/ath/ath11k/hal_rx.c | 15 +++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c    |  4 ++++
 drivers/net/wireless/ath/ath11k/wmi.c    | 35 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h    | 13 ++++++++++++
 7 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index a1371ab..b887520 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -218,6 +218,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 	struct ath11k_dp *dp = &ab->dp;
 	struct hal_srng *srng;
 	int i, ret;
+	u32 ring_hash_map;
 
 	ret = ath11k_dp_srng_setup(ab, &dp->wbm_desc_rel_ring,
 				   HAL_SW2WBM_RELEASE, 0, 0,
@@ -305,7 +306,21 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 		goto err;
 	}
 
-	ath11k_hal_reo_hw_setup(ab);
+	/* When hash based routing of rx packet is enabled, 32 entries to map
+	 * the hash values to the ring will be configured. Each hash entry uses
+	 * three bits to map to a particular ring. The ring mapping will be
+	 * 0:TCL, 1:SW1, 2:SW2, 3:SW3, 4:SW4, 5:Release, 6:FW and 7:Not used.
+	 */
+	ring_hash_map = HAL_HASH_ROUTING_RING_SW1 << 0 |
+			HAL_HASH_ROUTING_RING_SW2 << 3 |
+			HAL_HASH_ROUTING_RING_SW3 << 6 |
+			HAL_HASH_ROUTING_RING_SW4 << 9 |
+			HAL_HASH_ROUTING_RING_SW1 << 12 |
+			HAL_HASH_ROUTING_RING_SW2 << 15 |
+			HAL_HASH_ROUTING_RING_SW3 << 18 |
+			HAL_HASH_ROUTING_RING_SW4 << 21;
+
+	ath11k_hal_reo_hw_setup(ab, ring_hash_map);
 
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index c080b93..98cbbbc 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -160,7 +160,7 @@ struct ath11k_pdev_dp {
 #define DP_AVG_MPDUS_PER_TID_MAX 128
 #define DP_AVG_MSDUS_PER_MPDU 4
 
-#define DP_RX_HASH_ENABLE	0 /* Disable hash based Rx steering */
+#define DP_RX_HASH_ENABLE	1 /* Enable hash based Rx steering */
 
 #define DP_BA_WIN_SZ_MAX	256
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 4cfd934..449cd2f 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -96,6 +96,8 @@ struct ath11k_base;
 
 /* REO2SW(x) R0 ring configuration address */
 #define HAL_REO1_GEN_ENABLE			0x00000000
+#define HAL_REO1_DEST_RING_CTRL_IX_0		0x00000004
+#define HAL_REO1_DEST_RING_CTRL_IX_1		0x00000008
 #define HAL_REO1_DEST_RING_CTRL_IX_2		0x0000000c
 #define HAL_REO1_DEST_RING_CTRL_IX_3		0x00000010
 #define HAL_REO1_RING_BASE_LSB			0x0000029c
@@ -717,6 +719,14 @@ enum hal_ce_desc {
 	HAL_CE_DESC_DST_STATUS,
 };
 
+#define HAL_HASH_ROUTING_RING_TCL 0
+#define HAL_HASH_ROUTING_RING_SW1 1
+#define HAL_HASH_ROUTING_RING_SW2 2
+#define HAL_HASH_ROUTING_RING_SW3 3
+#define HAL_HASH_ROUTING_RING_SW4 4
+#define HAL_HASH_ROUTING_RING_REL 5
+#define HAL_HASH_ROUTING_RING_FW  6
+
 struct hal_reo_status_header {
 	u16 cmd_num;
 	enum hal_reo_cmd_status cmd_status;
@@ -850,7 +860,7 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 				u32 start_seq, enum hal_pn_type type);
 void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 				  struct hal_srng *srng);
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab);
+void ath11k_hal_reo_hw_setup(struct ath11k_base *ab, u32 ring_hash_map);
 void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 				     struct hal_wbm_idle_scatter_list *sbuf,
 				     u32 nsbufs, u32 tot_link_desc,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 3a66656..f277c94 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -799,7 +799,7 @@ void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 	}
 }
 
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab)
+void ath11k_hal_reo_hw_setup(struct ath11k_base *ab, u32 ring_hash_map)
 {
 	u32 reo_base = HAL_SEQ_WCSS_UMAC_REO_REG;
 	u32 val;
@@ -821,6 +821,19 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab)
 			   HAL_DEFAULT_REO_TIMEOUT_USEC);
 	ath11k_ahb_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_3,
 			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+
+	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_0,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_1,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_2,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
 }
 
 static enum hal_rx_mon_status
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3f7ad1c..576e950 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3949,6 +3949,9 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	/* Configure the hash seed for hash based reo dest ring selection */
+	ath11k_wmi_pdev_lro_cfg(ar, ar->pdev->pdev_id);
+
 	mutex_unlock(&ar->conf_mutex);
 
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
@@ -5766,6 +5769,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		ieee80211_hw_set(ar->hw, TX_AMPDU_SETUP_IN_HW);
 		ieee80211_hw_set(ar->hw, SUPPORTS_REORDERING_BUFFER);
 		ieee80211_hw_set(ar->hw, SUPPORTS_AMSDU_IN_AMPDU);
+		ieee80211_hw_set(ar->hw, USES_RSS);
 	}
 
 	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 4a9a7de..16efab4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2825,6 +2825,41 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 	return ret;
 }
 
+int ath11k_wmi_pdev_lro_cfg(struct ath11k *ar,
+			    int pdev_id)
+{
+	struct ath11k_wmi_pdev_lro_config_cmd *cmd;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, sizeof(*cmd));
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct ath11k_wmi_pdev_lro_config_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_LRO_INFO_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+
+	get_random_bytes(cmd->th_4, sizeof(uint32_t) * ATH11K_IPV4_TH_SEED_SIZE);
+	get_random_bytes(cmd->th_6, sizeof(uint32_t) * ATH11K_IPV6_TH_SEED_SIZE);
+
+	cmd->pdev_id = pdev_id;
+
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_LRO_CONFIG_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send lro cfg req wmi cmd\n");
+		goto err;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "WMI lro cfg cmd pdev_id 0x%x\n", pdev_id);
+	return 0;
+err:
+	dev_kfree_skb(skb);
+	return ret;
+}
+
 int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab)
 {
 	unsigned long time_left;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 1fde15c..2cc6c85 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4571,6 +4571,18 @@ struct wmi_obss_spatial_reuse_params_cmd {
 	u32 vdev_id;
 } __packed;
 
+#define ATH11K_IPV4_TH_SEED_SIZE 5
+#define ATH11K_IPV6_TH_SEED_SIZE 11
+
+struct ath11k_wmi_pdev_lro_config_cmd {
+	u32 tlv_header;
+	u32 lro_enable;
+	u32 res;
+	u32 th_4[ATH11K_IPV4_TH_SEED_SIZE];
+	u32 th_6[ATH11K_IPV6_TH_SEED_SIZE];
+	u32 pdev_id;
+} __packed;
+
 struct target_resource_config {
 	u32 num_vdevs;
 	u32 num_peers;
@@ -4761,4 +4773,5 @@ int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 				 struct ieee80211_he_obss_pd *he_obss_pd);
+int ath11k_wmi_pdev_lro_cfg(struct ath11k *ar, int pdev_id);
 #endif
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
