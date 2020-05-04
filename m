Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVe60-0000Lj-8f
 for ath11k@lists.infradead.org; Mon, 04 May 2020 16:37:33 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath11k: Add support to reset htt peer stats
Date: Mon,  4 May 2020 22:05:47 +0530
Message-Id: <1588610147-20231-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

From: Ashok Raj Nagarajan <arnagara@codeaurora.org>

This patch add supports to reset the per peer htt stats.

Usage:

echo 1 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/<peer MAC addr>/htt_peer_stats_reset

While doing so, sync the wmi services between FW and host.

Signed-off-by: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h       |  2 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 67 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h         | 37 +++++++++++++++
 3 files changed, 106 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 45454fc..f8aa48e 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -80,6 +80,8 @@ struct ath_pktlog_hdr {
 	u8 payload[0];
 };
 
+#define ATH11K_HTT_PEER_STATS_RESET BIT(16)
+
 #define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
 #define ATH11K_FW_STATS_BUF_SIZE (1024 * 1024)
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 68963cf..6b720ee 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -8,6 +8,8 @@
 #include "core.h"
 #include "peer.h"
 #include "debug.h"
+#include "dp_tx.h"
+#include "debug_htt_stats.h"
 
 void
 ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
@@ -749,6 +751,66 @@ static ssize_t ath11k_dbg_sta_write_aggr_mode(struct file *file,
 	.llseek = default_llseek,
 };
 
+static ssize_t
+ath11k_write_htt_peer_stats_reset(struct file *file,
+				  const char __user *user_buf,
+				  size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k *ar = arsta->arvif->ar;
+	struct htt_ext_stats_cfg_params cfg_params = { 0 };
+	int ret;
+	u8 type;
+
+	ret = kstrtou8_from_user(user_buf, count, 0, &type);
+	if (ret)
+		return ret;
+
+	if (!type)
+		return ret;
+
+	mutex_lock(&ar->conf_mutex);
+	cfg_params.cfg0 = HTT_STAT_PEER_INFO_MAC_ADDR;
+	cfg_params.cfg0 |= FIELD_PREP(GENMASK(15, 1),
+				HTT_PEER_STATS_REQ_MODE_FLUSH_TQM);
+
+	cfg_params.cfg1 = HTT_STAT_DEFAULT_PEER_REQ_TYPE;
+
+	cfg_params.cfg2 |= FIELD_PREP(GENMASK(7, 0), sta->addr[0]);
+	cfg_params.cfg2 |= FIELD_PREP(GENMASK(15, 8), sta->addr[1]);
+	cfg_params.cfg2 |= FIELD_PREP(GENMASK(23, 16), sta->addr[2]);
+	cfg_params.cfg2 |= FIELD_PREP(GENMASK(31, 24), sta->addr[3]);
+
+	cfg_params.cfg3 |= FIELD_PREP(GENMASK(7, 0), sta->addr[4]);
+	cfg_params.cfg3 |= FIELD_PREP(GENMASK(15, 8), sta->addr[5]);
+
+	cfg_params.cfg3 |= ATH11K_HTT_PEER_STATS_RESET;
+
+	ret = ath11k_dp_tx_htt_h2t_ext_stats_req(ar,
+						 ATH11K_DBG_HTT_EXT_STATS_PEER_INFO,
+						 &cfg_params,
+						 0ULL);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send htt peer stats request: %d\n", ret);
+		mutex_unlock(&ar->conf_mutex);
+		return ret;
+	}
+
+	mutex_unlock(&ar->conf_mutex);
+
+	ret = count;
+
+	return ret;
+}
+
+static const struct file_operations fops_htt_peer_stats_reset = {
+	.write = ath11k_write_htt_peer_stats_reset,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
@@ -771,4 +833,9 @@ void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	debugfs_create_file("addba", 0200, dir, sta, &fops_addba);
 	debugfs_create_file("addba_resp", 0200, dir, sta, &fops_addba_resp);
 	debugfs_create_file("delba", 0200, dir, sta, &fops_delba);
+
+	if (test_bit(WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET,
+		     ar->ab->wmi_ab.svc_map))
+		debugfs_create_file("htt_peer_stats_reset", 0600, dir, sta,
+				    &fops_htt_peer_stats_reset);
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index ba05935..a47c6a6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1976,6 +1976,43 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI = 174,
 	WMI_TLV_SERVICE_NAN_DISABLE_SUPPORT = 175,
 	WMI_TLV_SERVICE_HTT_H2T_NO_HTC_HDR_LEN_IN_MSG_LEN = 176,
+	WMI_TLV_SERVICE_COEX_SUPPORT_UNEQUAL_ISOLATION = 177,
+	WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT = 178,
+	WMI_TLV_SERVICE_SUPPORT_EXTEND_ADDRESS = 179,
+	WMI_TLV_SERVICE_BEACON_RECEPTION_STATS = 180,
+	WMI_TLV_SERVICE_FETCH_TX_PN = 181,
+	WMI_TLV_SERVICE_PEER_UNMAP_RESPONSE_SUPPORT = 182,
+	WMI_TLV_SERVICE_TX_PER_PEER_AMPDU_SIZE = 183,
+	WMI_TLV_SERVICE_BSS_COLOR_SWITCH_COUNT = 184,
+	WMI_TLV_SERVICE_HTT_PEER_STATS_SUPPORT = 185,
+	WMI_TLV_SERVICE_UL_RU26_ALLOWED = 186,
+	WMI_TLV_SERVICE_GET_MWS_COEX_STATE = 187,
+	WMI_TLV_SERVICE_GET_MWS_DPWB_STATE = 188,
+	WMI_TLV_SERVICE_GET_MWS_TDM_STATE = 189,
+	WMI_TLV_SERVICE_GET_MWS_IDRX_STATE = 190,
+	WMI_TLV_SERVICE_GET_MWS_ANTENNA_SHARING_STATE = 191,
+	WMI_TLV_SERVICE_ENHANCED_TPC_CONFIG_EVENT = 192,
+	WMI_TLV_SERVICE_WLM_STATS_REQUEST = 193,
+	WMI_TLV_SERVICE_EXT_PEER_TID_CONFIGS_SUPPORT = 194,
+	WMI_TLV_SERVICE_WPA3_FT_SAE_SUPPORT = 195,
+	WMI_TLV_SERVICE_WPA3_FT_SUITE_B_SUPPORT = 196,
+	WMI_TLV_SERVICE_VOW_ENABLE = 197,
+	WMI_TLV_SERVICE_CFR_CAPTURE_IND_EVT_TYPE_1 = 198,
+	WMI_TLV_SERVICE_BROADCAST_TWT = 199,
+	WMI_TLV_SERVICE_RAP_DETECTION_SUPPORT = 200,
+	WMI_TLV_SERVICE_PS_TDCC = 201,
+	WMI_TLV_SERVICE_THREE_WAY_COEX_CONFIG_LEGACY   = 202,
+	WMI_TLV_SERVICE_THREE_WAY_COEX_CONFIG_OVERRIDE = 203,
+	WMI_TLV_SERVICE_TX_PWR_PER_PEER = 204,
+	WMI_TLV_SERVICE_STA_PLUS_STA_SUPPORT = 205,
+	WMI_TLV_SERVICE_WPA3_FT_FILS = 206,
+	WMI_TLV_SERVICE_ADAPTIVE_11R_ROAM = 207,
+	WMI_TLV_SERVICE_CHAN_RF_CHARACTERIZATION_INFO = 208,
+	WMI_TLV_SERVICE_FW_IFACE_COMBINATION_SUPPORT = 209,
+	WMI_TLV_SERVICE_TX_COMPL_TSF64 = 210,
+	WMI_TLV_SERVICE_DSM_ROAM_FILTER = 211,
+	WMI_TLV_SERVICE_PACKET_CAPTURE_SUPPORT = 212,
+	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 
 	WMI_MAX_EXT_SERVICE
 
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
