Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGP4A-0000Ig-5n
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 14:28:09 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2] ath11k: add HE support
Date: Tue, 16 Apr 2019 16:27:58 +0200
Message-Id: <20190416142758.23437-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, John Crispin <john@phrozen.org>

Add basic HE support to the driver. Things still missing are
* fixed HE mcs/nss rates
* reading the caps from the FW
* 80P80 support
* verify if the mac_caps are correct
* he_operations is not yet propagated to the FW yet

For HE to work the following hostapd patches need to be used
--> http://lists.infradead.org/pipermail/hostap/2019-April/039962.html

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in V2
* fix copy paste error twt_responder vs twt_requester

 drivers/net/wireless/ath/ath11k/core.h        |   3 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  24 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |   3 +-
 drivers/net/wireless/ath/ath11k/mac.c         | 405 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c         |   1 +
 drivers/net/wireless/ath/ath11k/wmi.h         |   5 +-
 6 files changed, 382 insertions(+), 59 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index d51eddcd78a0..296c0a5bde7e 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -251,6 +251,7 @@ struct ath11k_peer {
 	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
 };
 
+#define ATH11K_HE_MCS_NUM       12
 #define ATH11K_VHT_MCS_NUM      10
 #define ATH11K_BW_NUM           4
 #define ATH11K_NSS_NUM          4
@@ -304,6 +305,7 @@ struct ath11k_htt_data_stats {
 	u64 legacy[ATH11K_COUNTER_TYPE_MAX][ATH11K_LEGACY_NUM];
 	u64 ht[ATH11K_COUNTER_TYPE_MAX][ATH11K_HT_MCS_NUM];
 	u64 vht[ATH11K_COUNTER_TYPE_MAX][ATH11K_VHT_MCS_NUM];
+	u64 he[ATH11K_COUNTER_TYPE_MAX][ATH11K_HE_MCS_NUM];
 	u64 bw[ATH11K_COUNTER_TYPE_MAX][ATH11K_BW_NUM];
 	u64 nss[ATH11K_COUNTER_TYPE_MAX][ATH11K_NSS_NUM];
 	u64 gi[ATH11K_COUNTER_TYPE_MAX][ATH11K_GI_NUM];
@@ -520,6 +522,7 @@ struct ath11k_pdev_cap {
 	u32 ampdu_density;
 	u32 vht_cap;
 	u32 vht_mcs;
+	u32 he_mcs;
 	u32 tx_chain_mask;
 	u32 rx_chain_mask;
 	u32 tx_chain_mask_shift;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 41b2221e0479..d05efe6c0498 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -45,7 +45,14 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH11K_STATS_TYPE_##name]
 
-	if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
+	if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
+		STATS_OP_FMT(SUCC).he[0][mcs] += peer_stats->succ_bytes;
+		STATS_OP_FMT(SUCC).he[1][mcs] += peer_stats->succ_pkts;
+		STATS_OP_FMT(FAIL).he[0][mcs] += peer_stats->failed_bytes;
+		STATS_OP_FMT(FAIL).he[1][mcs] += peer_stats->failed_pkts;
+		STATS_OP_FMT(RETRY).he[0][mcs] += peer_stats->retry_bytes;
+		STATS_OP_FMT(RETRY).he[1][mcs] += peer_stats->retry_pkts;
+	} else if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
 		STATS_OP_FMT(SUCC).vht[0][mcs] += peer_stats->succ_bytes;
 		STATS_OP_FMT(SUCC).vht[1][mcs] += peer_stats->succ_pkts;
 		STATS_OP_FMT(FAIL).vht[0][mcs] += peer_stats->failed_bytes;
@@ -73,7 +80,12 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 	if (peer_stats->is_ampdu) {
 		tx_stats->ba_fails += peer_stats->ba_fails;
 
-		if (txrate->flags & RATE_INFO_FLAGS_MCS) {
+		if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
+			STATS_OP_FMT(AMPDU).he[0][mcs] +=
+			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			STATS_OP_FMT(AMPDU).he[1][mcs] +=
+			peer_stats->succ_pkts + peer_stats->retry_pkts;
+		} else if (txrate->flags & RATE_INFO_FLAGS_MCS) {
 			STATS_OP_FMT(AMPDU).ht[0][mcs] +=
 			peer_stats->succ_bytes + peer_stats->retry_bytes;
 			STATS_OP_FMT(AMPDU).ht[1][mcs] +=
@@ -230,6 +242,14 @@ static ssize_t ath11k_dbg_sta_dump_tx_stats(struct file *file,
 					 str_name[k],
 					 str[j]);
 			len += scnprintf(buf + len, size - len,
+					 " HE MCS %s\n",
+					 str[j]);
+			for (i = 0; i < ATH11K_HE_MCS_NUM; i++)
+				len += scnprintf(buf + len, size - len,
+						 "  %llu ",
+						 stats->he[j][i]);
+			len += scnprintf(buf + len, size - len, "\n");
+			len += scnprintf(buf + len, size - len,
 					 " VHT MCS %s\n",
 					 str[j]);
 			for (i = 0; i < ATH11K_VHT_MCS_NUM; i++)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 06b3c2e494f8..e980fcb9b320 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1739,7 +1739,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	status = IEEE80211_SKB_RXCB(msdu);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   ieee80211_get_SA(hdr),
@@ -1750,6 +1750,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
 		   (status->encoding == RX_ENC_HT) ? "ht" : "",
 		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
+		   (status->encoding == RX_ENC_HE) ? "he" : "",
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 19d7cd4817f1..aa7603d5aa7f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -152,59 +152,151 @@ static int get_num_chains(u32 mask)
 }
 
 static inline enum wmi_phy_mode
-chan_to_phymode(const struct cfg80211_chan_def *chandef)
+chan_to_phymode_2ghz(const struct cfg80211_chan_def *chandef)
+{
+	enum wmi_phy_mode phymode = MODE_UNKNOWN;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
+			phymode = MODE_11B;
+		else
+			phymode = MODE_11G;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+		phymode = MODE_11NG_HT20;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		phymode = MODE_11NG_HT40;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+	case NL80211_CHAN_WIDTH_10:
+	case NL80211_CHAN_WIDTH_80:
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_160:
+		phymode = MODE_UNKNOWN;
+		break;
+	}
+
+	return phymode;
+}
+
+static inline enum wmi_phy_mode
+chan_to_phymode_5ghz(const struct cfg80211_chan_def *chandef)
+{
+	enum wmi_phy_mode phymode = MODE_UNKNOWN;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		phymode = MODE_11A;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+		phymode = MODE_11NA_HT20;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		phymode = MODE_11NA_HT40;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		phymode = MODE_11AC_VHT80;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		phymode = MODE_11AC_VHT160;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		phymode = MODE_11AC_VHT80_80;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+	case NL80211_CHAN_WIDTH_10:
+		phymode = MODE_UNKNOWN;
+		break;
+	}
+
+	return phymode;
+}
+
+static inline enum wmi_phy_mode
+chan_to_phymode_2ghz_he(const struct cfg80211_chan_def *chandef)
+{
+	enum wmi_phy_mode phymode = MODE_UNKNOWN;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
+			phymode = MODE_11B;
+		else
+			phymode = MODE_11G;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+		phymode = MODE_11AX_HE20_2G;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		phymode = MODE_11AX_HE40_2G;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		phymode = MODE_11AX_HE80_2G;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+	case NL80211_CHAN_WIDTH_10:
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_160:
+		phymode = MODE_UNKNOWN;
+		break;
+	}
+
+	return phymode;
+}
+
+static inline enum wmi_phy_mode
+chan_to_phymode_5ghz_he(const struct cfg80211_chan_def *chandef)
+{
+	enum wmi_phy_mode phymode = MODE_UNKNOWN;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		phymode = MODE_11A;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+		phymode = MODE_11AX_HE20;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		phymode = MODE_11AX_HE40;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		phymode = MODE_11AX_HE80;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		phymode = MODE_11AX_HE160;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		phymode = MODE_11AX_HE80_80;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+	case NL80211_CHAN_WIDTH_10:
+		phymode = MODE_UNKNOWN;
+		break;
+	}
+
+	return phymode;
+}
+
+static inline enum wmi_phy_mode
+chan_to_phymode(const struct cfg80211_chan_def *chandef, int he_support)
 {
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
 
 	switch (chandef->chan->band) {
 	case NL80211_BAND_2GHZ:
-		switch (chandef->width) {
-		case NL80211_CHAN_WIDTH_20_NOHT:
-			if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
-				phymode = MODE_11B;
-			else
-				phymode = MODE_11G;
-			break;
-		case NL80211_CHAN_WIDTH_20:
-			phymode = MODE_11NG_HT20;
-			break;
-		case NL80211_CHAN_WIDTH_40:
-			phymode = MODE_11NG_HT40;
-			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-		case NL80211_CHAN_WIDTH_80:
-		case NL80211_CHAN_WIDTH_80P80:
-		case NL80211_CHAN_WIDTH_160:
-			phymode = MODE_UNKNOWN;
-			break;
-		}
+		if (he_support)
+			phymode = chan_to_phymode_2ghz_he(chandef);
+		else
+			phymode = chan_to_phymode_2ghz(chandef);
 		break;
 	case NL80211_BAND_5GHZ:
-		switch (chandef->width) {
-		case NL80211_CHAN_WIDTH_20_NOHT:
-			phymode = MODE_11A;
-			break;
-		case NL80211_CHAN_WIDTH_20:
-			phymode = MODE_11AC_VHT20;
-			break;
-		case NL80211_CHAN_WIDTH_40:
-			phymode = MODE_11AC_VHT40;
-			break;
-		case NL80211_CHAN_WIDTH_80:
-			phymode = MODE_11AC_VHT80;
-			break;
-		case NL80211_CHAN_WIDTH_160:
-			phymode = MODE_11AC_VHT160;
-			break;
-		case NL80211_CHAN_WIDTH_80P80:
-			phymode = MODE_11AC_VHT80_80;
-			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-			phymode = MODE_UNKNOWN;
-			break;
-		}
+		if (he_support)
+			phymode = chan_to_phymode_5ghz_he(chandef);
+		else
+			phymode = chan_to_phymode_5ghz(chandef);
+
 		break;
 	default:
 		break;
@@ -1028,6 +1120,18 @@ ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
 	return true;
 }
 
+static bool
+ath11k_peer_assoc_h_he_masked(const u16 he_mcs_mask[NL80211_HE_NSS_MAX])
+{
+	int nss;
+
+	for (nss = 0; nss < NL80211_HE_NSS_MAX; nss++)
+		if (he_mcs_mask[nss])
+			return false;
+
+	return true;
+}
+
 static void ath11k_peer_assoc_h_ht(struct ath11k *ar,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -1284,7 +1388,58 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 				   struct ieee80211_sta *sta,
 				   struct peer_assoc_params *arg)
 {
-	/* TODO: Implementation */
+	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+
+	if (!he_cap->has_he)
+		return;
+
+	arg->he_flag = true;
+
+	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
+	       sizeof(arg->peer_he_cap_macinfo));
+	memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
+	       WMI_HOST_MAX_HECAP_PHY_SIZE);
+	memcpy(&arg->peer_ppet, he_cap->ppe_thres,
+	       sizeof(he_cap->ppe_thres));
+
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
+		arg->twt_responder = true;
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
+		arg->twt_requester = true;
+
+/*
+	TODO requires an extra mac80211 patch
+	arg->peer_he_ops = he_cap->he_operation;
+ */
+
+	switch (sta->bandwidth) {
+/*
+	TODO - does FW currently support this mode ?
+	case IEEE80211_MODE_11AXA_HE80_80:
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
+			he_cap->he_mcs_nss_supp.rx_mcs_80p80;
+		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
+			he_cap->he_mcs_nss_supp.tx_mcs_80p80;
+		arg->peer_he_mcs_count++;
+ */
+		/* drop through */
+
+	case IEEE80211_STA_RX_BW_160:
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
+			he_cap->he_mcs_nss_supp.rx_mcs_160;
+		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
+			he_cap->he_mcs_nss_supp.tx_mcs_160;
+		arg->peer_he_mcs_count++;
+		/* drop through */
+
+	default:
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
+			he_cap->he_mcs_nss_supp.rx_mcs_80;
+		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
+			he_cap->he_mcs_nss_supp.tx_mcs_80;
+		arg->peer_he_mcs_count++;
+		break;
+	}
 }
 
 static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
@@ -1449,6 +1604,33 @@ static enum wmi_phy_mode ath11k_mac_get_phymode_vht(struct ath11k *ar,
 	return MODE_UNKNOWN;
 }
 
+static enum wmi_phy_mode ath11k_mac_get_phymode_he(struct ath11k *ar,
+						   struct ieee80211_sta *sta)
+{
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_160) {
+		if (sta->he_cap.he_cap_elem.phy_cap_info[0] &
+		     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G)
+			return MODE_11AX_HE160;
+		else if (sta->he_cap.he_cap_elem.phy_cap_info[0] &
+		     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
+			return MODE_11AX_HE80_80;
+
+		/* not sure if this is a valid case? */
+		return MODE_11AX_HE160;
+	}
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+		return MODE_11AX_HE80;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+		return MODE_11AX_HE40;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
+		return MODE_11AX_HE20;
+
+	return MODE_UNKNOWN;
+}
+
 static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -1459,6 +1641,7 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 	enum nl80211_band band;
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
+	const u16 *he_mcs_mask;
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
 
 	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
@@ -1467,10 +1650,19 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 	band = def.chan->band;
 	ht_mcs_mask = arvif->bitrate_mask.control[band].ht_mcs;
 	vht_mcs_mask = arvif->bitrate_mask.control[band].vht_mcs;
+	he_mcs_mask = arvif->bitrate_mask.control[band].he_mcs;
 
 	switch (band) {
 	case NL80211_BAND_2GHZ:
-		if (sta->vht_cap.vht_supported &&
+		if (sta->he_cap.has_he &&
+		    !ath11k_peer_assoc_h_he_masked(he_mcs_mask)) {
+			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+				phymode = MODE_11AX_HE80_2G;
+			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+				phymode = MODE_11AX_HE40_2G;
+			else
+				phymode = MODE_11AX_HE20_2G;
+		} else if (sta->vht_cap.vht_supported &&
 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
 			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
 				phymode = MODE_11AC_VHT40;
@@ -1487,12 +1679,13 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 		} else {
 			phymode = MODE_11B;
 		}
-		/* TODO: HE */
-
 		break;
 	case NL80211_BAND_5GHZ:
-		/* Check VHT first */
-		if (sta->vht_cap.vht_supported &&
+		/* Check HE first */
+		if (sta->he_cap.has_he &&
+		    !ath11k_peer_assoc_h_he_masked(he_mcs_mask)) {
+			phymode = ath11k_mac_get_phymode_he(ar, sta);
+		} else if (sta->vht_cap.vht_supported &&
 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
 			phymode = ath11k_mac_get_phymode_vht(ar, sta);
 		} else if (sta->ht_cap.ht_supported &&
@@ -1504,7 +1697,6 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 		} else {
 			phymode = MODE_11A;
 		}
-		/* TODO: HE Phymode */
 		break;
 	default:
 		break;
@@ -3047,6 +3239,106 @@ static int ath11k_check_chain_mask(struct ath11k *ar, u32 ant, bool is_tx_ant)
 	return 0;
 }
 
+static const struct ieee80211_sband_iftype_data ath11k_he_capa[] = {
+	{
+		.types_mask = BIT(NL80211_IFTYPE_STATION),
+		.he_cap = {
+			.has_he = true,
+			.he_cap_elem = {
+				.mac_cap_info[0] =
+					IEEE80211_HE_MAC_CAP0_HTC_HE |
+					IEEE80211_HE_MAC_CAP0_TWT_REQ,
+				.mac_cap_info[1] =
+					IEEE80211_HE_MAC_CAP1_MIN_FRAG_SIZE_128 |
+					IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
+					IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US |
+					IEEE80211_HE_MAC_CAP1_MULTI_TID_AGG_RX_QOS_1,
+				.mac_cap_info[2] =
+					IEEE80211_HE_MAC_CAP2_BSR,
+				.mac_cap_info[3] =
+					IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
+					IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_USE_VHT,
+				.mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMDSU_IN_AMPDU,
+				.mac_cap_info[5] = 0,
+				.phy_cap_info[0] = IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G,
+				.phy_cap_info[1] =
+					IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD |
+					IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US,
+				.phy_cap_info[2] =
+					IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
+					IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO,
+			},
+			.he_mcs_nss_supp = {
+				.rx_mcs_80 = cpu_to_le16(0xaaaa),
+				.tx_mcs_80 = cpu_to_le16(0xaaaa),
+				.rx_mcs_160 = cpu_to_le16(0xaaaa),
+				.tx_mcs_160 = cpu_to_le16(0xaaaa),
+		},
+		},
+	}, {
+		.types_mask = BIT(NL80211_IFTYPE_AP),
+		.he_cap = {
+			.has_he = true,
+			.he_cap_elem = {
+				.mac_cap_info[0] =
+					IEEE80211_HE_MAC_CAP0_HTC_HE |
+					IEEE80211_HE_MAC_CAP0_TWT_RES |
+					IEEE80211_HE_MAC_CAP0_DYNAMIC_FRAG_LEVEL_1,
+				.mac_cap_info[1] =
+					IEEE80211_HE_MAC_CAP1_MIN_FRAG_SIZE_128 |
+					IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
+					IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US |
+					IEEE80211_HE_MAC_CAP1_MULTI_TID_AGG_RX_QOS_1,
+				.mac_cap_info[2] =
+					IEEE80211_HE_MAC_CAP2_BSR,
+				.mac_cap_info[3] =
+					IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
+					IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_USE_VHT,
+				.mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMDSU_IN_AMPDU,
+				.phy_cap_info[0] = IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G,
+				.phy_cap_info[1] =
+					IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD |
+					IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US,
+				.phy_cap_info[2] =
+					IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
+					IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO,
+			},
+			.he_mcs_nss_supp = {
+				.rx_mcs_80 = cpu_to_le16(0xaaaa),
+				.tx_mcs_80 = cpu_to_le16(0xaaaa),
+				.rx_mcs_160 = cpu_to_le16(0xaaaa),
+				.tx_mcs_160 = cpu_to_le16(0xaaaa),
+			},
+		},
+	},
+};
+
+static void ath11k_mac_setup_he_cap(struct ath11k *ar,
+				    struct ath11k_pdev_cap *cap)
+{
+	struct ieee80211_supported_band *band;
+
+	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
+		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
+		band->iftype_data =
+			(struct ieee80211_sband_iftype_data *)
+				ath11k_he_capa;
+		band->n_iftype_data = 2;
+	}
+
+	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
+		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
+		band->iftype_data =
+			(struct ieee80211_sband_iftype_data *)
+				ath11k_he_capa;
+		band->n_iftype_data = 2;
+	}
+}
+
 static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 {
 	int ret;
@@ -3082,8 +3374,9 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
-	/* Reload HT/VHT capability */
+	/* Reload HT/VHT/HE capability */
 	ath11k_mac_setup_ht_vht_cap(ar, &ar->pdev->cap, NULL);
+	ath11k_mac_setup_he_cap(ar, &ar->pdev->cap);
 
 	return 0;
 }
@@ -3824,7 +4117,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	arg.channel.freq = chandef->chan->center_freq;
 	arg.channel.band_center_freq1 = chandef->center_freq1;
 	arg.channel.band_center_freq2 = chandef->center_freq2;
-	arg.channel.mode = chan_to_phymode(chandef);
+	arg.channel.mode = chan_to_phymode(chandef,
+					   arvif->vif->bss_conf.he_support);
 
 	arg.channel.min_power = 0;
 	arg.channel.max_power = chandef->chan->max_power * 2;
@@ -4817,6 +5111,7 @@ static int ath11k_mac_register(struct ath11k *ar)
 		goto err_free;
 
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
+	ath11k_mac_setup_he_cap(ar, cap);
 
 	ar->hw->wiphy->available_antennas_rx = cap->rx_chain_mask;
 	ar->hw->wiphy->available_antennas_tx = cap->tx_chain_mask;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7951ba772247..399d01367ac5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -325,6 +325,7 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	} else if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
 		pdev_cap->vht_cap = mac_phy_caps->vht_cap_info_5g;
 		pdev_cap->vht_mcs = mac_phy_caps->vht_supp_mcs_5g;
+		pdev_cap->he_mcs = mac_phy_caps->he_supp_mcs_5g;
 		pdev_cap->tx_chain_mask = mac_phy_caps->tx_chain_mask_5g;
 		pdev_cap->rx_chain_mask = mac_phy_caps->rx_chain_mask_5g;
 	} else {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 01c20345a1d2..76596ef141da 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3858,7 +3858,10 @@ struct wmi_vdev_install_key_arg {
 
 #define WMI_MAX_SUPPORTED_RATES			128
 #define WMI_HOST_MAX_HECAP_PHY_SIZE		3
-#define WMI_HOST_MAX_HE_RATE_SET		1
+#define WMI_HOST_MAX_HE_RATE_SET		3
+#define WMI_HECAP_TXRX_MCS_NSS_IDX_80		0
+#define WMI_HECAP_TXRX_MCS_NSS_IDX_160		1
+#define WMI_HECAP_TXRX_MCS_NSS_IDX_80_80	2
 
 struct wmi_rate_set_arg {
 	u32 num_rates;
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
