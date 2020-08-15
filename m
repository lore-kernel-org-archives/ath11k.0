Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qAV-0005Wm-DY
 for ath11k@lists.infradead.org; Sat, 15 Aug 2020 06:59:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 09/12] ath11k: force single pdev only for QCA6390
Date: Sat, 15 Aug 2020 09:59:09 +0300
Message-Id: <1597474752-23287-10-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
References: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

For QCA6390, only one pdev is created and only one HW is registered to
mac80211. This one pdev manages both 2G radio and 5G radio.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  2 +
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 33 +++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 86 ++++++++++++++++++++++++----------
 5 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c55c886f6276..62fac8bbf221 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -35,6 +35,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.regs = &ipq8074_regs,
 		.host_ce_config = ath11k_host_ce_config_ipq8074,
 		.ce_count = 12,
+		.single_pdev_only = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -52,6 +53,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.regs = &qca6390_regs,
 		.host_ce_config = ath11k_host_ce_config_qca6390,
 		.ce_count = 9,
+		.single_pdev_only = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6e351e7bded8..48bf2954c97c 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -545,6 +545,7 @@ struct ath11k {
 };
 
 struct ath11k_band_cap {
+	u32 phy_id;
 	u32 max_bw_supported;
 	u32 ht_cap_info;
 	u32 he_cap_info[2];
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index ef553bafa158..3dcd05ceeef7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -139,6 +139,8 @@ struct ath11k_hw_params {
 	const struct ath11k_hw_regs *regs;
 	const struct ce_attr *host_ce_config;
 	u32 ce_count;
+
+	bool single_pdev_only;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0fd1f714429c..ec68b5eea847 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -521,6 +521,11 @@ struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 	int i;
 	struct ath11k_pdev *pdev;
 
+	if (ab->hw_params.single_pdev_only) {
+		pdev = rcu_dereference(ab->pdevs_active[0]);
+		return pdev ? pdev->ar : NULL;
+	}
+
 	if (WARN_ON(pdev_id > ab->num_radios))
 		return NULL;
 
@@ -5821,12 +5826,29 @@ static void ath11k_mac_update_ch_list(struct ath11k *ar,
 	}
 }
 
+static u32 ath11k_get_phy_id(struct ath11k *ar, u32 band)
+{
+	struct ath11k_pdev *pdev = ar->pdev;
+	struct ath11k_pdev_cap *pdev_cap = &pdev->cap;
+
+	if (band == WMI_HOST_WLAN_2G_CAP)
+		return pdev_cap->band[NL80211_BAND_2GHZ].phy_id;
+
+	if (band == WMI_HOST_WLAN_5G_CAP)
+		return pdev_cap->band[NL80211_BAND_5GHZ].phy_id;
+
+	ath11k_warn(ar->ab, "unsupported phy cap:%d\n", band);
+
+	return 0;
+}
+
 static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 					   u32 supported_bands)
 {
 	struct ieee80211_supported_band *band;
 	struct ath11k_hal_reg_capabilities_ext *reg_cap;
 	void *channels;
+	u32 phy_id;
 
 	BUILD_BUG_ON((ARRAY_SIZE(ath11k_2ghz_channels) +
 		      ARRAY_SIZE(ath11k_5ghz_channels) +
@@ -5849,6 +5871,11 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 		band->n_bitrates = ath11k_g_rates_size;
 		band->bitrates = ath11k_g_rates;
 		ar->hw->wiphy->bands[NL80211_BAND_2GHZ] = band;
+
+		if (ar->ab->hw_params.single_pdev_only) {
+			phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_2G_CAP);
+			reg_cap = &ar->ab->hal_reg_cap[phy_id];
+		}
 		ath11k_mac_update_ch_list(ar, band,
 					  reg_cap->low_2ghz_chan,
 					  reg_cap->high_2ghz_chan);
@@ -5893,6 +5920,12 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 			band->n_bitrates = ath11k_a_rates_size;
 			band->bitrates = ath11k_a_rates;
 			ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
+
+			if (ar->ab->hw_params.single_pdev_only) {
+				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
+				reg_cap = &ar->ab->hal_reg_cap[phy_id];
+			}
+
 			ath11k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
 						  reg_cap->high_5ghz_chan);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index cd1bdb2a75c9..c43f54a7c54d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -338,7 +338,7 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	mac_phy_caps = wmi_mac_phy_caps + phy_idx;
 
 	pdev->pdev_id = mac_phy_caps->pdev_id;
-	pdev_cap->supported_bands = mac_phy_caps->supported_bands;
+	pdev_cap->supported_bands |= mac_phy_caps->supported_bands;
 	pdev_cap->ampdu_density = mac_phy_caps->ampdu_density;
 
 	/* Take non-zero tx/rx chainmask. If tx/rx chainmask differs from
@@ -371,27 +371,33 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	pdev_cap->rx_chain_mask_shift =
 			find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32);
 
-	cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
-	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_2g;
-	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_2g;
-	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_2g;
-	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_2g_ext;
-	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_2g;
-	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_2g,
-	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet2g,
-	       sizeof(struct ath11k_ppe_threshold));
-
-	cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
-	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
-	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
-	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
-	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
-	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
-	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
-	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
-	       sizeof(struct ath11k_ppe_threshold));
+	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) {
+		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
+		cap_band->phy_id = mac_phy_caps->phy_id;
+		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_2g;
+		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_2g;
+		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_2g;
+		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_2g_ext;
+		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_2g;
+		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_2g,
+		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
+		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet2g,
+		       sizeof(struct ath11k_ppe_threshold));
+	}
+
+	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
+		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
+		cap_band->phy_id = mac_phy_caps->phy_id;
+		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
+		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
+		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
+		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
+		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
+		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
+		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
+		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
+		       sizeof(struct ath11k_ppe_threshold));
+	}
 
 	cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
 	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
@@ -3388,7 +3394,8 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	init_param.hw_mode_id = wmi_sc->preferred_hw_mode;
 	init_param.mem_chunks = wmi_sc->mem_chunks;
 
-	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE)
+	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE ||
+	    ab->hw_params.single_pdev_only)
 		init_param.hw_mode_id = WMI_HOST_HW_MODE_MAX;
 
 	init_param.num_band_to_mac = ab->num_radios;
@@ -3688,6 +3695,8 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		i++;
 	}
 
+	ath11k_dbg(soc, ATH11K_DBG_WMI, "preferred_hw_mode:%d\n",
+		   soc->wmi_ab.preferred_hw_mode);
 	if (soc->wmi_ab.preferred_hw_mode == WMI_HOST_HW_MODE_MAX)
 		return -EINVAL;
 
@@ -3778,6 +3787,7 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 	struct wmi_tlv_svc_rdy_ext_parse *svc_rdy_ext = data;
 	u8 hw_mode_id = svc_rdy_ext->pref_hw_mode_caps.hw_mode_id;
 	u32 phy_id_map;
+	int pdev_index = 0;
 	int ret;
 
 	svc_rdy_ext->soc_hal_reg_caps = (struct wmi_soc_hal_reg_capabilities *)ptr;
@@ -3793,7 +3803,7 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 							    svc_rdy_ext->soc_hal_reg_caps,
 							    svc_rdy_ext->mac_phy_caps,
 							    hw_mode_id, soc->num_radios,
-							    &soc->pdevs[soc->num_radios]);
+							    &soc->pdevs[pdev_index]);
 		if (ret) {
 			ath11k_warn(soc, "failed to extract mac caps, idx :%d\n",
 				    soc->num_radios);
@@ -3802,9 +3812,25 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 
 		soc->num_radios++;
 
+		/* For QCA6390, save mac_phy capability in the same pdev */
+		if (soc->hw_params.single_pdev_only)
+			pdev_index = 0;
+		else
+			pdev_index = soc->num_radios;
+
 		/* TODO: mac_phy_cap prints */
 		phy_id_map >>= 1;
 	}
+
+	/* For QCA6390, set num_radios to 1 because host manages
+	 * both 2G and 5G radio in one pdev.
+	 * Set pdev_id = 0 and 0 means soc level.
+	 */
+	if (soc->hw_params.single_pdev_only) {
+		soc->num_radios = 1;
+		soc->pdevs[0].pdev_id = 0;
+	}
+
 	return 0;
 }
 
@@ -5434,8 +5460,12 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	pdev_idx = reg_info->phy_id;
 
-	if (pdev_idx >= ab->num_radios)
-		goto fallback;
+	if (pdev_idx >= ab->num_radios) {
+		if (ab->hw_params.single_pdev_only)
+			goto mem_free;
+		else
+			goto fallback;
+	}
 
 	/* Avoid multiple overwrites to default regd, during core
 	 * stop-start after mac registration.
@@ -6728,6 +6758,10 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 	ab->wmi_ab.ab = ab;
 	ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_MAX;
 
+	/* It's overwritten when service_ext_ready is handled */
+	if (ab->hw_params.single_pdev_only)
+		ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_SINGLE;
+
 	/* TODO: Init remaining wmi soc resources required */
 	init_completion(&ab->wmi_ab.service_ready);
 	init_completion(&ab->wmi_ab.unified_ready);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
