Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJEG-0000SO-1x
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/8] ath11k: add interface_modes to hw_params
Date: Tue, 29 Sep 2020 20:15:31 +0300
Message-Id: <1601399736-3210-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

As QCA6390 does not support mesh interfaces, move the interface_modes to
hw_params. Also create interface combinations dynamically so that it's easy to
change the values.

Now QCA6390 does not claim to support mesh interfaces to user space, but
IPQ8074 continues to do that.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  11 ++++
 drivers/net/wireless/ath/ath11k/hw.h   |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 101 ++++++++++++++++++++-------------
 3 files changed, 75 insertions(+), 39 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0a85f20b6499..28aeb9fe602b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -58,6 +58,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.htt_peer_map_v2 = true,
 		.tcl_0_only = false,
 		.spectral_fft_sz = 2,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -88,6 +92,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.htt_peer_map_v2 = true,
 		.tcl_0_only = false,
 		.spectral_fft_sz = 4,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -118,6 +126,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.htt_peer_map_v2 = false,
 		.tcl_0_only = true,
 		.spectral_fft_sz = 0,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP),
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 975d44e9c083..5bd3fe618dd8 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -156,6 +156,8 @@ struct ath11k_hw_params {
 	bool htt_peer_map_v2;
 	bool tcl_0_only;
 	u8 spectral_fft_sz;
+
+	u16 interface_modes;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 32cbe643f734..491e62d66edc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5874,35 +5874,6 @@ static const struct ieee80211_ops ath11k_ops = {
 #endif
 };
 
-static const struct ieee80211_iface_limit ath11k_if_limits[] = {
-	{
-		.max = 1,
-		.types = BIT(NL80211_IFTYPE_STATION),
-	},
-	{
-		.max    = 16,
-		.types  = BIT(NL80211_IFTYPE_AP)
-#ifdef CONFIG_MAC80211_MESH
-			| BIT(NL80211_IFTYPE_MESH_POINT)
-#endif
-	},
-};
-
-static const struct ieee80211_iface_combination ath11k_if_comb[] = {
-	{
-		.limits = ath11k_if_limits,
-		.n_limits = ARRAY_SIZE(ath11k_if_limits),
-		.max_interfaces = 16,
-		.num_different_channels = 1,
-		.beacon_int_infra_match = true,
-		.beacon_int_min_gcd = 100,
-		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
-					BIT(NL80211_CHAN_WIDTH_20) |
-					BIT(NL80211_CHAN_WIDTH_40) |
-					BIT(NL80211_CHAN_WIDTH_80),
-	},
-};
-
 static void ath11k_mac_update_ch_list(struct ath11k *ar,
 				      struct ieee80211_supported_band *band,
 				      u32 freq_low, u32 freq_high)
@@ -6028,6 +5999,50 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	return 0;
 }
 
+static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
+{
+	struct ath11k_base *ab = ar->ab;
+	struct ieee80211_iface_combination *combinations;
+	struct ieee80211_iface_limit *limits;
+	int n_limits;
+
+	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
+	if (!combinations)
+		return -ENOMEM;
+
+	n_limits = 2;
+
+	limits = kcalloc(n_limits, sizeof(*limits), GFP_KERNEL);
+	if (!limits)
+		return -ENOMEM;
+
+	limits[0].max = 1;
+	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
+
+	limits[1].max = 16;
+	limits[1].types |= BIT(NL80211_IFTYPE_AP);
+
+	if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
+	    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
+		limits[1].types |= BIT(NL80211_IFTYPE_MESH_POINT);
+
+	combinations[0].limits = limits;
+	combinations[0].n_limits = n_limits;
+	combinations[0].max_interfaces = 16;
+	combinations[0].num_different_channels = 1;
+	combinations[0].beacon_int_infra_match = true;
+	combinations[0].beacon_int_min_gcd = 100;
+	combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+						BIT(NL80211_CHAN_WIDTH_20) |
+						BIT(NL80211_CHAN_WIDTH_40) |
+						BIT(NL80211_CHAN_WIDTH_80);
+
+	ar->hw->wiphy->iface_combinations = combinations;
+	ar->hw->wiphy->n_iface_combinations = 1;
+
+	return 0;
+}
+
 static const u8 ath11k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
@@ -6078,6 +6093,9 @@ static void __ath11k_mac_unregister(struct ath11k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 
+	kfree(ar->hw->wiphy->iface_combinations[0].limits);
+	kfree(ar->hw->wiphy->iface_combinations);
+
 	SET_IEEE80211_DEV(ar->hw, NULL);
 }
 
@@ -6129,12 +6147,16 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
 	ath11k_mac_setup_he_cap(ar, cap);
 
+	ret = ath11k_mac_setup_iface_combinations(ar);
+	if (ret) {
+		ath11k_err(ar->ab, "failed to setup interface combinations: %d\n", ret);
+		goto err_free_channels;
+	}
+
 	ar->hw->wiphy->available_antennas_rx = cap->rx_chain_mask;
 	ar->hw->wiphy->available_antennas_tx = cap->tx_chain_mask;
 
-	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					 BIT(NL80211_IFTYPE_AP) |
-					 BIT(NL80211_IFTYPE_MESH_POINT);
+	ar->hw->wiphy->interface_modes = ab->hw_params.interface_modes;
 
 	ieee80211_hw_set(ar->hw, SIGNAL_DBM);
 	ieee80211_hw_set(ar->hw, SUPPORTS_PS);
@@ -6195,9 +6217,6 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->vif_data_size = sizeof(struct ath11k_vif);
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
-	ar->hw->wiphy->iface_combinations = ath11k_if_comb;
-	ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath11k_if_comb);
-
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 
@@ -6219,25 +6238,29 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ret = ieee80211_register_hw(ar->hw);
 	if (ret) {
 		ath11k_err(ar->ab, "ieee80211 registration failed: %d\n", ret);
-		goto err_free;
+		goto err_free_if_combs;
 	}
 
 	/* Apply the regd received during initialization */
 	ret = ath11k_regd_update(ar, true);
 	if (ret) {
 		ath11k_err(ar->ab, "ath11k regd update failed: %d\n", ret);
-		goto err_free;
+		goto err_free_if_combs;
 	}
 
 	ret = ath11k_debugfs_register(ar);
 	if (ret) {
 		ath11k_err(ar->ab, "debugfs registration failed: %d\n", ret);
-		goto err_free;
+		goto err_free_if_combs;
 	}
 
 	return 0;
 
-err_free:
+err_free_if_combs:
+	kfree(ar->hw->wiphy->iface_combinations[0].limits);
+	kfree(ar->hw->wiphy->iface_combinations);
+
+err_free_channels:
 	kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
 	kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
