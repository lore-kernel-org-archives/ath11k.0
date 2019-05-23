Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTlG8-0000VL-Bw
 for ath11k@lists.infradead.org; Thu, 23 May 2019 10:47:41 +0000
From: John Crispin <john@phrozen.org>
Subject: [RFC] ath11k: add HE rate reporting
Date: Thu, 23 May 2019 12:47:30 +0200
Message-Id: <20190523104730.15256-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

We need to figure out how to read the ru_alloc and DCM values from FW.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    |  9 +++++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 45 ++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 79b665816378..0bb7cbc92e11 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1049,6 +1049,13 @@ struct htt_ppdu_stats_common {
 	u16 bw_mhz;
 } __packed;
 
+enum htt_ppdu_stats_gi {
+	HTT_PPDU_STATS_SGI_0_8_US,
+	HTT_PPDU_STATS_SGI_0_4_US,
+	HTT_PPDU_STATS_SGI_1_6_US,
+	HTT_PPDU_STATS_SGI_3_2_US,
+};
+
 #define HTT_PPDU_STATS_USER_RATE_INFO0_USER_POS_M	GENMASK(3,0)
 #define HTT_PPDU_STATS_USER_RATE_INFO0_MU_GROUP_ID_M	GENMASK(11,4)
 
@@ -1077,6 +1084,8 @@ struct htt_ppdu_stats_common {
 		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_MCS_M, _val)
 #define HTT_USR_RATE_GI(_val) \
 		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M, _val)
+#define HTT_USR_RATE_DCM(_val) \
+		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M, _val)
 
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_LTF_SIZE_M		GENMASK(1,0)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_STBC_M		BIT(2)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 38cc787671ee..c8f190be3e82 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -831,6 +831,24 @@ static inline u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 	return bwflags;
 }
 
+static inline u32 ath11k_he_gi_to_nl80211_he_gi(u8 sgi)
+{
+	u32 ret = 0;
+
+	switch (sgi) {
+	case RX_MSDU_START_SGI_0_8_US:
+		ret = NL80211_RATE_INFO_HE_GI_0_8;
+		break;
+	case RX_MSDU_START_SGI_1_6_US:
+		ret = NL80211_RATE_INFO_HE_GI_1_6;
+		break;
+	case RX_MSDU_START_SGI_3_2_US:
+		ret = NL80211_RATE_INFO_HE_GI_3_2;
+		break;
+	}
+	return ret;
+}
+
 static void
 ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 				struct htt_ppdu_user_stats *usr_stats)
@@ -843,7 +861,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	struct ieee80211_chanctx_conf *conf = NULL;
 	struct ath11k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
 	int ret;
-	u8 flags, mcs, nss, bw, sgi, rate_idx = 0;
+	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
 	u32 succ_bytes = 0;
 	u16 rate = 0, succ_pkts = 0;
 	bool is_ampdu = false;
@@ -871,12 +889,18 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	nss = HTT_USR_RATE_NSS(user_rate->rate_flags) + 1;
 	mcs = HTT_USR_RATE_MCS(user_rate->rate_flags);
 	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
+	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
 
         /* Note: If host configured fixed rates and in some other special
 	 * cases, the broadcast/management frames are sent in different rates.
 	 * Firmare rate's control to be skipped for this?
          */
 
+	if (flags == WMI_RATE_PREAMBLE_HE && mcs > 11) {
+		ath11k_warn(ab, "Invalid HE mcs %hhd peer stats",  mcs);
+		return;
+	}
+
 	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > 9) {
 		ath11k_warn(ab, "Invalid VHT mcs %hhd peer stats",  mcs);
 		return;
@@ -951,6 +975,23 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 						IEEE80211_TX_RC_SHORT_GI;
 		}
 		break;
+	case WMI_RATE_PREAMBLE_HE:
+		arsta->txrate.mcs = mcs;
+		arsta->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
+		arsta->txrate.he_dcm = dcm;
+		/* TODO how do we get the RU rate ? */
+		arsta->txrate.he_ru_alloc = 0;
+		arsta->txrate.he_gi = ath11k_he_gi_to_nl80211_he_gi(sgi);
+		/* TODO arsta->tx_info.status.rates cannot be set as there are not
+		 * enough bits left. Use VHT for now.
+		 */
+		arsta->tx_info.status.rates[0].flags |= IEEE80211_TX_RC_VHT_MCS;
+		if (sgi) {
+			arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+			arsta->tx_info.status.rates[0].flags |=
+						IEEE80211_TX_RC_SHORT_GI;
+		}
+		break;
 	}
 
 	arsta->txrate.nss = nss;
@@ -1737,6 +1778,8 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 		rx_status->encoding = RX_ENC_HE;
 		rx_status->nss = nss;
 		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
+		rx_status->he_gi = ath11k_he_gi_to_nl80211_he_gi(sgi);
+		/* TODO DCM and RU are missing */
 		break;
 	}
 }
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
