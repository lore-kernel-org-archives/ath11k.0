Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdGF7-0006dp-3u
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 15:41:54 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath11k: fetch and report DCM and RU stats from ppdu stats
Date: Tue, 18 Jun 2019 21:11:46 +0530
Message-Id: <1560872506-21217-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

HE DCM and RU allocation info is reported out of bound data path
by firmware in ppdu stats. These are reported to mac80211 using
sta_statistics() api.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h        |  2 ++
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  7 +++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 19 +++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.c      | 13 ++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.h      | 28 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/rx_desc.h     |  8 ++++++++
 6 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 4d42ab403e9b..19692ca05b3a 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -238,6 +238,8 @@ struct ath11k_rx_peer_stats {
 	u64 tid_count[IEEE80211_NUM_TIDS + 1];
 	u64 pream_cnt[HAL_RX_PREAMBLE_MAX];
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
+	u64 dcm_count;
+	u64 ru_alloc_cnt[HAL_RX_RU_ALLOC_TYPE_MAX];
 };
 
 struct ath11k_peer {
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index cff6a3f048ea..490a9e1291ca 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -382,6 +382,13 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nNSS(1-8):");
 	for (i = 0; i < HAL_RX_MAX_NSS; i++)
 		len += scnprintf(buf + len, size - len, "%llu ", rx_stats->nss_count[i]);
+	len += scnprintf(buf + len, size - len,
+			 "\nDCM: %llu\nRU: 26 %llu 52: %llu 106: %llu 242: %llu 484: %llu 996: %llu\n",
+			 rx_stats->dcm_count, rx_stats->ru_alloc_cnt[0],
+			 rx_stats->ru_alloc_cnt[1], rx_stats->ru_alloc_cnt[2],
+			 rx_stats->ru_alloc_cnt[3], rx_stats->ru_alloc_cnt[4],
+			 rx_stats->ru_alloc_cnt[5]);
+
 	len += scnprintf(buf + len, size - len, "\n");
 
 	spin_unlock_bh(&ar->ab->data_lock);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 54cb7a4eab85..56ba5bf2f1f1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1093,7 +1093,7 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 	struct ieee80211_chanctx_conf *conf = NULL;
 	struct ath11k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
 	int ret;
-	u8 flags, mcs, nss, bw, sgi, rate_idx = 0;
+	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
 	u32 succ_bytes = 0;
 	u16 rate = 0, succ_pkts = 0;
 	bool is_ampdu = false;
@@ -1127,12 +1127,17 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 	 * Firmare rate's control to be skipped for this?
          */
 
-	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > 9) {
+	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH11K_HE_MCS_MAX) {
+		ath11k_warn(ab, "Invalid HE mcs %hhd peer stats",  mcs);
+		return;
+	}
+
+	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH11K_VHT_MCS_MAX) {
 		ath11k_warn(ab, "Invalid VHT mcs %hhd peer stats",  mcs);
 		return;
 	}
 
-	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > 7 || nss < 1)) {
+	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH11K_HT_MCS_MAX || nss < 1)) {
 		ath11k_warn(ab, "Invalid HT mcs %hhd nss %hhd peer stats",
 			    mcs, nss);
 		return;
@@ -1201,6 +1206,12 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 						IEEE80211_TX_RC_SHORT_GI;
 		}
 		break;
+	case WMI_RATE_PREAMBLE_HE:
+		arsta->txrate.he_dcm = dcm;
+		arsta->txrate.he_ru_alloc = ath11k_he_ru_tones_to_nl80211_he_ru_alloc(
+						(user_rate->ru_end -
+						 user_rate->ru_start) + 1);
+		break;
 	}
 
 	arsta->txrate.nss = nss;
@@ -2419,6 +2430,8 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 
 	rx_stats->num_mpdu_fcs_ok += ppdu_info->num_mpdu_fcs_ok;
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
+	rx_stats->dcm_count += ppdu_info->dcm;
+	rx_stats->ru_alloc_cnt[ppdu_info->ru_alloc] += num_msdu;
 }
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 77779e50d6bc..36051591c52f 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1046,6 +1046,7 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 		}
 
 		ppdu_info->nss = nsts + 1;
+		ppdu_info->dcm = dcm;
 		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 		break;
 	}
@@ -1083,9 +1084,15 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 		break;
 	}
 	case HAL_PHYRX_HE_SIG_B1_MU: {
-		/* TODO: Check if resource unit(RU) allocation stats
-		 * are required
-		 */
+		struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu =
+			(struct hal_rx_he_sig_b1_mu_info *)tlv_data;
+		u16 ru_tones;
+
+		info0 = __le32_to_cpu(he_sig_b1_mu->info0);
+
+		ru_tones = FIELD_GET(HAL_RX_HE_SIG_B1_MU_INFO_INFO0_RU_ALLOCATION,
+				     info0);
+		ppdu_info->ru_alloc = ath11k_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
 		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 650ebe5d952c..06d170f70f60 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -123,6 +123,8 @@ struct hal_rx_mon_ppdu_info {
 	u8 beamformed;
 	u8 rssi_comb;
 	u8 tid;
+	u8 dcm;
+	u8 ru_alloc;
 	u8 reception_type;
 };
 
@@ -337,4 +339,30 @@ enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
 			       u8 *data);
+static inline u32 ath11k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
+{
+	u32 ret = 0;
+
+	switch (ru_tones) {
+	case RU_26:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
+		break;
+	case RU_52:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
+		break;
+	case RU_106:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
+		break;
+	case RU_242:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
+		break;
+	case RU_484:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
+		break;
+	case RU_996:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
+		break;
+	}
+	return ret;
+}
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/rx_desc.h b/drivers/net/wireless/ath/ath11k/rx_desc.h
index 57518a0661ea..7971367eda85 100644
--- a/drivers/net/wireless/ath/ath11k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath11k/rx_desc.h
@@ -1210,4 +1210,12 @@ struct hal_rx_desc {
 	u8 msdu_payload[0];
 } __packed;
 
+#define HAL_RX_RU_ALLOC_TYPE_MAX 6
+#define RU_26  1
+#define RU_52  2
+#define RU_106 4
+#define RU_242 9
+#define RU_484 18
+#define RU_996 37
+
 #endif /* ATH11K_RX_DESC_H */
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
