Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqKDc-000627-MJ
 for ath11k@lists.infradead.org; Wed, 24 Jul 2019 16:34:22 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v5 3/4] ath11k: register HE mesh capabilities
Date: Wed, 24 Jul 2019 18:33:58 +0200
Message-Id: <20190724163359.3507-4-sven@narfation.org>
In-Reply-To: <20190724163359.3507-1-sven@narfation.org>
References: <20190724163359.3507-1-sven@narfation.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

The capabilities for the HE mesh are generated from the capabilities
reported by the fw. But the firmware only reports the overall capabilities
and not the one which are specific for mesh. Some of them (TWT, MU UL/DL,
TB PPDU, ...) require an infrastructure setup with a main STA (AP)
controlling the operations. This is not the case for mesh and thus these
capabilities are removed from the list of capabilities.

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>

Forwarded: https://patchwork.kernel.org/patch/11029297/
---
 drivers/net/wireless/ath/ath11k/mac.c | 75 +++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ab425b5b60b9..4317608ff822 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3255,6 +3255,77 @@ static void ath11k_gen_ppe_thresh(struct ath11k_ppe_threshold *fw_ppet,
 	}
 }
 
+static void
+ath11k_mac_filter_he_cap_mesh(struct ieee80211_he_cap_elem *he_cap_elem)
+{
+	u8 m;
+
+	m = IEEE80211_HE_MAC_CAP0_TWT_RES |
+	    IEEE80211_HE_MAC_CAP0_TWT_REQ;
+	he_cap_elem->mac_cap_info[0] &= ~m;
+
+	m = IEEE80211_HE_MAC_CAP2_TRS |
+	    IEEE80211_HE_MAC_CAP2_BCAST_TWT |
+	    IEEE80211_HE_MAC_CAP2_MU_CASCADING;
+	he_cap_elem->mac_cap_info[2] &= ~m;
+
+	m = IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED |
+	    IEEE80211_HE_MAC_CAP2_BCAST_TWT |
+	    IEEE80211_HE_MAC_CAP2_MU_CASCADING;
+	he_cap_elem->mac_cap_info[3] &= ~m;
+
+	m = IEEE80211_HE_MAC_CAP4_BSRP_BQRP_A_MPDU_AGG |
+	    IEEE80211_HE_MAC_CAP4_BQR;
+	he_cap_elem->mac_cap_info[4] &= ~m;
+
+	m = IEEE80211_HE_MAC_CAP5_SUBCHAN_SELECVITE_TRANSMISSION |
+	    IEEE80211_HE_MAC_CAP5_UL_2x996_TONE_RU |
+	    IEEE80211_HE_MAC_CAP5_PUNCTURED_SOUNDING |
+	    IEEE80211_HE_MAC_CAP5_HT_VHT_TRIG_FRAME_RX;
+	he_cap_elem->mac_cap_info[5] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
+	    IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
+	he_cap_elem->phy_cap_info[2] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP3_RX_HE_MU_PPDU_FROM_NON_AP_STA |
+	    IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK |
+	    IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK;
+	he_cap_elem->phy_cap_info[3] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
+	he_cap_elem->phy_cap_info[4] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
+	he_cap_elem->phy_cap_info[5] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
+	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB |
+	    IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
+	    IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO;
+	he_cap_elem->phy_cap_info[6] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP7_SRP_BASED_SR |
+	    IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
+	    IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
+	    IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ;
+	he_cap_elem->phy_cap_info[7] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
+	    IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
+	    IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
+	    IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
+	he_cap_elem->phy_cap_info[8] &= ~m;
+
+	m = IEEE80211_HE_PHY_CAP9_LONGER_THAN_16_SIGB_OFDM_SYM |
+	    IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK |
+	    IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
+	    IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
+	    IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
+	    IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
+	he_cap_elem->phy_cap_info[9] &= ~m;
+}
+
 static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 				  struct ath11k_pdev_cap *cap,
 				  struct ieee80211_sband_iftype_data *data,
@@ -3271,6 +3342,7 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 		switch (i) {
 		case NL80211_IFTYPE_STATION:
 		case NL80211_IFTYPE_AP:
+		case NL80211_IFTYPE_MESH_POINT:
 			break;
 
 		default:
@@ -3311,6 +3383,9 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 			he_cap_elem->phy_cap_info[9] |=
 				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
 			break;
+		case NL80211_IFTYPE_MESH_POINT:
+			ath11k_mac_filter_he_cap_mesh(he_cap_elem);
+			break;
 		}
 
 		he_cap->he_mcs_nss_supp.rx_mcs_80 =
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
