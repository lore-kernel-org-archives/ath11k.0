Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLReS-0007cU-Dn
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 12:14:26 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 5/5] ath11k: add HE support
Date: Tue, 30 Apr 2019 14:14:13 +0200
Message-Id: <20190430121413.21288-6-john@phrozen.org>
In-Reply-To: <20190430121413.21288-1-john@phrozen.org>
References: <20190430121413.21288-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Add basic HE support to the driver. The sband_iftype data is generated from
the capabilities read from the FW.

Things that still need to implemented
* ppe_threshold support
* propagate the he_oper field from userland to wmi_peer_add
* 80p80 support - mac80211 cosniders 160/80p80 to be the same

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 175 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.h  |   5 +-
 3 files changed, 173 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 057835f5f348..4e76fc1d2718 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -432,6 +432,8 @@ struct ath11k {
 
 	struct {
 		struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
+		struct ieee80211_sband_iftype_data
+			iftype[NUM_NL80211_BANDS][NUM_NL80211_IFTYPES];
 	} mac;
 	unsigned long dev_flags;
 	unsigned int filter_flags;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ffddefc9d29d..46dc7d778589 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1266,7 +1266,44 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
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
+	       sizeof(arg->peer_he_cap_phyinfo));
+
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
+		arg->twt_responder = true;
+	if (he_cap->he_cap_elem.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
+		arg->twt_requester = true;
+
+	/* TODO - peer_ppet and peer_he_ops need to be set */
+
+	switch (sta->bandwidth) {
+	/* TODO - add 80p80 support */
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
@@ -1431,6 +1468,32 @@ static enum wmi_phy_mode ath11k_mac_get_phymode_vht(struct ath11k *ar,
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
@@ -1441,6 +1504,7 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 	enum nl80211_band band;
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
+	const u16 *he_mcs_mask;
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
 
 	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
@@ -1449,10 +1513,18 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 	band = def.chan->band;
 	ht_mcs_mask = arvif->bitrate_mask.control[band].ht_mcs;
 	vht_mcs_mask = arvif->bitrate_mask.control[band].vht_mcs;
+	he_mcs_mask = arvif->bitrate_mask.control[band].he_mcs;
 
 	switch (band) {
 	case NL80211_BAND_2GHZ:
-		if (sta->vht_cap.vht_supported &&
+		if (sta->he_cap.has_he) {
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
@@ -1469,12 +1541,12 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
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
+		if (sta->he_cap.has_he) {
+			phymode = ath11k_mac_get_phymode_he(ar, sta);
+		} else if (sta->vht_cap.vht_supported &&
 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
 			phymode = ath11k_mac_get_phymode_vht(ar, sta);
 		} else if (sta->ht_cap.ht_supported &&
@@ -1486,7 +1558,6 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 		} else {
 			phymode = MODE_11A;
 		}
-		/* TODO: HE Phymode */
 		break;
 	default:
 		break;
@@ -3029,6 +3100,92 @@ static int ath11k_check_chain_mask(struct ath11k *ar, u32 ant, bool is_tx_ant)
 	return 0;
 }
 
+static int ath11k_mac_copy_he_cap(struct ath11k_pdev_cap *cap,
+				  struct ieee80211_sband_iftype_data *data,
+				  int band)
+{
+	int i, idx = 0;
+
+	for (i = 0; i < NUM_NL80211_IFTYPES; i++) {
+		struct ieee80211_sta_he_cap *he_cap = &data[idx].he_cap;
+		struct ath11k_band_cap *band_cap = &cap->band[band];
+		struct ieee80211_he_cap_elem *he_cap_elem =
+				&he_cap->he_cap_elem;
+
+		switch (i) {
+		case NL80211_IFTYPE_STATION:
+		case NL80211_IFTYPE_AP:
+			break;
+
+		default:
+			continue;
+		}
+
+		data[idx].types_mask = BIT(i);
+		he_cap->has_he = true;
+		memcpy(he_cap_elem->mac_cap_info, band_cap->he_cap_info,
+		       sizeof(he_cap_elem->mac_cap_info));
+		memcpy(he_cap_elem->phy_cap_info, band_cap->he_cap_phy_info,
+		       sizeof(he_cap_elem->phy_cap_info));
+
+		switch (i) {
+		case NL80211_IFTYPE_STATION:
+			he_cap_elem->mac_cap_info[0] &=
+				~IEEE80211_HE_MAC_CAP0_TWT_RES;
+			he_cap_elem->mac_cap_info[0] |=
+				IEEE80211_HE_MAC_CAP0_TWT_REQ;
+			break;
+		}
+
+		he_cap->he_mcs_nss_supp.rx_mcs_80 =
+			cpu_to_le16(band_cap->he_mcs & 0xffff);
+		he_cap->he_mcs_nss_supp.tx_mcs_80 =
+			cpu_to_le16(band_cap->he_mcs & 0xffff);
+		he_cap->he_mcs_nss_supp.rx_mcs_160 =
+			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+		he_cap->he_mcs_nss_supp.tx_mcs_160 =
+			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+		he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
+			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+		he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
+			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+
+		/* TODO - disable ppe threshold until we can generate the
+		 * field from the fw capabilities
+		 */
+		he_cap_elem->phy_cap_info[6] &=
+			~IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+		idx++;
+	}
+
+	return idx;
+}
+
+static void ath11k_mac_setup_he_cap(struct ath11k *ar,
+				    struct ath11k_pdev_cap *cap)
+{
+	struct ieee80211_supported_band *band;
+	int count = 0;
+
+	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
+		count = ath11k_mac_copy_he_cap(cap,
+				ar->mac.iftype[NL80211_BAND_2GHZ],
+				NL80211_BAND_2GHZ);
+		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
+		band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
+	}
+
+	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
+		count = ath11k_mac_copy_he_cap(cap,
+				ar->mac.iftype[NL80211_BAND_5GHZ],
+				NL80211_BAND_5GHZ);
+		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
+		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
+	}
+
+	band->n_iftype_data = count;
+}
+
 static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 {
 	int ret;
@@ -3064,8 +3221,9 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
-	/* Reload HT/VHT capability */
+	/* Reload HT/VHT/HE capability */
 	ath11k_mac_setup_ht_vht_cap(ar, &ar->pdev->cap, NULL);
+	ath11k_mac_setup_he_cap(ar, &ar->pdev->cap);
 
 	return 0;
 }
@@ -4803,6 +4961,7 @@ static int ath11k_mac_register(struct ath11k *ar)
 		goto err_free;
 
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
+	ath11k_mac_setup_he_cap(ar, cap);
 
 	ar->hw->wiphy->available_antennas_rx = cap->rx_chain_mask;
 	ar->hw->wiphy->available_antennas_tx = cap->tx_chain_mask;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4dbda740a2b5..071537850c68 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3842,7 +3842,10 @@ struct wmi_vdev_install_key_arg {
 
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
