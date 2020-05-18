Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaisX-0002Wn-1u
 for ath11k@lists.infradead.org; Mon, 18 May 2020 16:44:39 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 3/9] ath11k: add support for 6GHz radio in driver
Date: Mon, 18 May 2020 09:44:18 -0700
Message-Id: <20200518164424.29497-4-pradeepc@codeaurora.org>
In-Reply-To: <20200518164424.29497-1-pradeepc@codeaurora.org>
References: <20200518164424.29497-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

This patch adds 6GHz band support and mac80211 registration for
the 6G phy radio.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  6 +-
 drivers/net/wireless/ath/ath11k/mac.c  | 89 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/wmi.c  | 11 ++++
 3 files changed, 89 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7e51445cfa20..83bffd7f633a 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -353,7 +353,10 @@ struct ath11k_sta {
 #endif
 };
 
-#define ATH11K_NUM_CHANS 41
+#define ATH11K_MIN_5G_FREQ 4150
+#define ATH11K_MIN_6G_FREQ 5935
+#define ATH11K_MAX_6G_FREQ 7105
+#define ATH11K_NUM_CHANS 100
 #define ATH11K_MAX_5G_CHAN 173
 
 enum ath11k_state {
@@ -431,6 +434,7 @@ struct ath11k {
 	u32 vht_cap_info;
 	struct ath11k_he ar_he;
 	enum ath11k_state state;
+	bool supports_6ghz;
 	struct {
 		struct completion started;
 		struct completion completed;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f699e882949b..8ddc7dad33e1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3492,6 +3492,18 @@ static void ath11k_mac_setup_ht_vht_cap(struct ath11k *ar,
 		band->vht_cap = ath11k_create_vht_cap(ar, rate_cap_tx_chainmask,
 						      rate_cap_rx_chainmask);
 	}
+
+	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
+	    ar->supports_6ghz) {
+		band = &ar->mac.sbands[NL80211_BAND_6GHZ];
+		ht_cap = cap->band[NL80211_BAND_6GHZ].ht_cap_info;
+		if (ht_cap_info)
+			*ht_cap_info = ht_cap;
+		band->ht_cap = ath11k_create_ht_cap(ar, ht_cap,
+						    rate_cap_rx_chainmask);
+		band->vht_cap = ath11k_create_vht_cap(ar, rate_cap_tx_chainmask,
+						      rate_cap_rx_chainmask);
+	}
 }
 
 static int ath11k_check_chain_mask(struct ath11k *ar, u32 ant, bool is_tx_ant)
@@ -3746,6 +3758,17 @@ static void ath11k_mac_setup_he_cap(struct ath11k *ar,
 		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
 		band->n_iftype_data = count;
 	}
+
+	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
+	    ar->supports_6ghz) {
+		count = ath11k_mac_copy_he_cap(ar, cap,
+					       ar->mac.iftype[NL80211_BAND_6GHZ],
+					       NL80211_BAND_6GHZ);
+		band = &ar->mac.sbands[NL80211_BAND_6GHZ];
+		band->iftype_data = ar->mac.iftype[NL80211_BAND_6GHZ];
+		band->n_iftype_data = count;
+	}
+
 }
 
 static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
@@ -4188,6 +4211,12 @@ ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
 		params->chains[NL80211_BAND_5GHZ].tx = ar->num_tx_chains;
 		params->chains[NL80211_BAND_5GHZ].rx = ar->num_rx_chains;
 	}
+	if (pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
+	    ar->supports_6ghz) {
+		params->chains[NL80211_BAND_6GHZ].tx = ar->num_tx_chains;
+		params->chains[NL80211_BAND_6GHZ].rx = ar->num_rx_chains;
+	}
+
 }
 
 static u32
@@ -5786,7 +5815,8 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	void *channels;
 
 	BUILD_BUG_ON((ARRAY_SIZE(ath11k_2ghz_channels) +
-		      ARRAY_SIZE(ath11k_5ghz_channels)) !=
+		      ARRAY_SIZE(ath11k_5ghz_channels) +
+		      ARRAY_SIZE(ath11k_6ghz_channels)) !=
 		     ATH11K_NUM_CHANS);
 
 	reg_cap = &ar->ab->hal_reg_cap[ar->pdev_idx];
@@ -5799,6 +5829,7 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 			return -ENOMEM;
 
 		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
+		band->band = NL80211_BAND_2GHZ;
 		band->n_channels = ARRAY_SIZE(ath11k_2ghz_channels);
 		band->channels = channels;
 		band->n_bitrates = ath11k_g_rates_size;
@@ -5810,23 +5841,48 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		channels = kmemdup(ath11k_5ghz_channels,
-				   sizeof(ath11k_5ghz_channels),
-				   GFP_KERNEL);
-		if (!channels) {
-			kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
-			return -ENOMEM;
+		if (reg_cap->high_5ghz_chan >= ATH11K_MAX_6G_FREQ) {
+			channels = kmemdup(ath11k_6ghz_channels,
+					   sizeof(ath11k_6ghz_channels), GFP_KERNEL);
+			if (!channels) {
+				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+				return -ENOMEM;
+			}
+
+			ar->supports_6ghz = true;
+			band = &ar->mac.sbands[NL80211_BAND_6GHZ];
+			band->band = NL80211_BAND_6GHZ;
+			band->n_channels = ARRAY_SIZE(ath11k_6ghz_channels);
+			band->channels = channels;
+			band->n_bitrates = ath11k_a_rates_size;
+			band->bitrates = ath11k_a_rates;
+			ar->hw->wiphy->bands[NL80211_BAND_6GHZ] = band;
+			ath11k_mac_update_ch_list(ar, band,
+						  reg_cap->low_5ghz_chan,
+						  reg_cap->high_5ghz_chan);
 		}
 
-		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
-		band->n_channels = ARRAY_SIZE(ath11k_5ghz_channels);
-		band->channels = channels;
-		band->n_bitrates = ath11k_a_rates_size;
-		band->bitrates = ath11k_a_rates;
-		ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
-		ath11k_mac_update_ch_list(ar, band,
-					  reg_cap->low_5ghz_chan,
-					  reg_cap->high_5ghz_chan);
+		if (reg_cap->low_5ghz_chan < ATH11K_MIN_6G_FREQ) {
+			channels = kmemdup(ath11k_5ghz_channels,
+					   sizeof(ath11k_5ghz_channels),
+					   GFP_KERNEL);
+			if (!channels) {
+				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
+				return -ENOMEM;
+			}
+
+			band = &ar->mac.sbands[NL80211_BAND_5GHZ];
+			band->band = NL80211_BAND_5GHZ;
+			band->n_channels = ARRAY_SIZE(ath11k_5ghz_channels);
+			band->channels = channels;
+			band->n_bitrates = ath11k_a_rates_size;
+			band->bitrates = ath11k_a_rates;
+			ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
+			ath11k_mac_update_ch_list(ar, band,
+						  reg_cap->low_5ghz_chan,
+						  reg_cap->high_5ghz_chan);
+		}
 	}
 
 	return 0;
@@ -5880,6 +5936,7 @@ static void __ath11k_mac_unregister(struct ath11k *ar)
 
 	kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
 	kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
+	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 
 	SET_IEEE80211_DEV(ar->hw, NULL);
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c2a972377687..f405c162c2b2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -368,6 +368,17 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
 	       sizeof(struct ath11k_ppe_threshold));
 
+	cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
+	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
+	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
+	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
+	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
+	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
+	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
+	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
+	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
+	       sizeof(struct ath11k_ppe_threshold));
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
