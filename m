Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlAoF-0002jS-09
 for ath11k@lists.infradead.org; Wed, 10 Jul 2019 11:30:52 +0000
From: Ganesh Sesetti <gseset@codeaurora.org>
Subject: [PATCH v4] ath11k: Fix rx_duration reporting
Date: Wed, 10 Jul 2019 17:00:43 +0530
Message-Id: <1562758243-12336-1-git-send-email-gseset@codeaurora.org>
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

v4:
	Changed the cumulative rx duration for all the frames

v3: 	
	changed pointer type to 'struct hal_rx_ppdu_end_duration *'

v2:
	rebased to patch

v1:
	Added the rx duration

 drivers/net/wireless/ath/ath11k/core.h        | 1 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 2 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c      | 8 ++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.h      | 8 ++++++++
 drivers/net/wireless/ath/ath11k/mac.c         | 4 +++-
 6 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index d4b44f82d22b..dceea126fa5b 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -237,6 +237,7 @@ struct ath11k_rx_peer_stats {
 	u64 tid_count[IEEE80211_NUM_TIDS + 1];
 	u64 pream_cnt[HAL_RX_PREAMBLE_MAX];
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
+	u64 rx_duration;
 };
 
 #define ATH11K_HE_MCS_NUM       12
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 82bada5a7479..e14b66d1cb5b 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -389,6 +389,8 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nNSS(1-8):");
 	for (i = 0; i < HAL_RX_MAX_NSS; i++)
 		len += scnprintf(buf + len, size - len, "%llu ", rx_stats->nss_count[i]);
+	len += scnprintf(buf + len, size - len, "\nRX Duration:%llu ",
+			 rx_stats->rx_duration);
 	len += scnprintf(buf + len, size - len, "\n");
 
 	spin_unlock_bh(&ar->ab->data_lock);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9a1c24705a32..28e77b467c34 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2373,6 +2373,8 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
 
 	arsta->rssi_comb = ppdu_info->rssi_comb;
+	rx_stats->rx_duration += ppdu_info->rx_duration;
+	arsta->rx_duration = rx_stats->rx_duration;
 }
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 63da0d29147c..06765ef3f57b 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1148,6 +1148,14 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 			ppdu_info->peer_id = peer_id;
 		break;
 	}
+	case HAL_RXPCU_PPDU_END_INFO: {
+		struct hal_rx_ppdu_end_duration *ppdu_rx_duration =
+			(struct hal_rx_ppdu_end_duration *)tlv_data;
+		ppdu_info->rx_duration =
+			FIELD_GET(HAL_RX_PPDU_END_DURATION,
+				  __le32_to_cpu(ppdu_rx_duration->info0));
+		break;
+	}
 	case HAL_DUMMY:
 		return HAL_RX_MON_STATUS_BUF_DONE;
 	case HAL_RX_PPDU_END_STATUS_DONE:
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index bd6b8d2e9d5e..bd1db6d6fa73 100644
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
index dd164b5bb51a..8cda55591643 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -136,7 +136,9 @@
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
