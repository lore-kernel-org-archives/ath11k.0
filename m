Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfiFT-0001R3-Ai
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 10:00:25 +0000
From: Ganesh Sesetti <gseset@codeaurora.org>
Subject: [PATCH] ath11k: Fix rx_duration reporting
Date: Tue, 25 Jun 2019 15:30:16 +0530
Message-Id: <1561456816-27459-1-git-send-email-gseset@codeaurora.org>
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
Cc: Ganesh Sesetti <gseset@codeaurora.org>

Since rx duration is wrongly reported in iw wlanX station dump,
fetch correct rx duration reported in PPDU_END tlv.
Enable PPDU_END, MPDU_START and PPDU_END_STATUS_DONE tlv
reporting in monitor status by default. Pass the sta's Rx duration
to mac80211 in sta_statistics() ops.

Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h        | 1 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 2 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c      | 8 ++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.h      | 8 ++++++++
 drivers/net/wireless/ath/ath11k/mac.c         | 4 +++-
 6 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c05bce994956..3f62d67ce705 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -239,6 +239,7 @@ struct ath11k_rx_peer_stats {
 	u64 pream_cnt[HAL_RX_PREAMBLE_MAX];
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
 	u32 rssi_comb;
+	u64 rx_duration;
 };
 
 struct ath11k_peer {
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index c39b6e1d22c3..6c88dd26fec4 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -362,6 +362,8 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nNSS(1-8):");
 	for (i = 0; i < HAL_RX_MAX_NSS; i++)
 		len += scnprintf(buf + len, size - len, "%llu ", rx_stats->nss_count[i]);
+	len += scnprintf(buf + len, size - len, "\nRX Duration:%llu ",
+			 rx_stats->rx_duration);
 	len += scnprintf(buf + len, size - len, "\n");
 
 	spin_unlock_bh(&ar->ab->data_lock);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3566258c0c6d..ad4e2ea73119 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2146,6 +2146,7 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
 
 	rx_stats->rssi_comb = ppdu_info->rssi_comb;
+	rx_stats->rx_duration = ppdu_info->rx_duration;
 }
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
@@ -2399,6 +2400,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		}
 
 		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
+		arsta->rx_duration = ppdu_info.rx_duration;
 		ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
 
 		if (ath11k_debug_is_pktlog_peer_vaild(ar, peer->addr)) {
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 0308089c88df..6b06826394b9 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1149,6 +1149,14 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 			ppdu_info->peer_id = peer_id;
 		break;
 	}
+	case HAL_RXPCU_PPDU_END_INFO: {
+		struct hal_rx_ppdu_end_duration *ppdu_rx_duration =
+			(struct hal_rx_ppdu_start *)tlv_data;
+		ppdu_info->rx_duration =
+			FIELD_GET(HAL_RX_PPDU_END_DURATION,
+				  __le32_to_cpu(ppdu_rx_duration->info0));
+		break;
+	}
 	case HAL_DUMMY:
 		return HAL_RX_MON_STATUS_BUF_DONE;
 	case HAL_RX_PPDU_END_STATUS_DONE:
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 650ebe5d952c..eaf53b9ca4af 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -124,6 +124,7 @@ struct hal_rx_mon_ppdu_info {
 	u8 rssi_comb;
 	u8 tid;
 	u8 reception_type;
+	u64 rx_duration;
 };
 
 #define HAL_RX_PPDU_START_INFO0_PPDU_ID		GENMASK(15, 0)
@@ -275,6 +276,13 @@ struct hal_rx_mpdu_info {
 	__le32 rsvd1[21];
 } __packed;
 
+#define HAL_RX_PPDU_END_DURATION	GENMASK(23, 0)
+struct hal_rx_ppdu_end_duration {
+	__le32 rsvd0[9];
+	__le32 info0;
+	__le32 rsvd1[4];
+} __packed;
+
 struct hal_rx_rxpcu_classification_overview {
 	u32 rsvd0;
 } __packed;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index fe5c4a888ea7..2d7ec9404bcc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -111,7 +111,9 @@
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-	.pkt_filter_flags3 = HTT_RX_FP_DATA_FILTER_FLASG3
+	.pkt_filter_flags2 = HTT_RX_FP_CTRL_FILTER_FLASG2,
+	.pkt_filter_flags3 = HTT_RX_FP_DATA_FILTER_FLASG3 |
+			     HTT_RX_FP_CTRL_FILTER_FLASG3
 };	
 
 #define ATH11K_MAC_FIRST_OFDM_RATE_IDX 4
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
