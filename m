Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqKDf-00063S-7Z
 for ath11k@lists.infradead.org; Wed, 24 Jul 2019 16:34:24 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v5 4/4] ath11k: Disable SU support in meshpoint mode
Date: Wed, 24 Jul 2019 18:33:59 +0200
Message-Id: <20190724163359.3507-5-sven@narfation.org>
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

The firmware WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1 often stops sending
data on 5GHz when SU support is advertised. A simple throughput benchmark
will end up at only a couple hundred kilobytes per second (when finishing
at all).

Disabling SU related flags works around this problem and allowed a maximum
throughput of ~450 MBit/s in a simple test setup with an HK01 over air.

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4317608ff822..29964185b0a1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3290,16 +3290,24 @@ ath11k_mac_filter_he_cap_mesh(struct ieee80211_he_cap_elem *he_cap_elem)
 
 	m = IEEE80211_HE_PHY_CAP3_RX_HE_MU_PPDU_FROM_NON_AP_STA |
 	    IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK |
-	    IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK;
+	    IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK |
+	    IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
 	he_cap_elem->phy_cap_info[3] &= ~m;
 
-	m = IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
+	m = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
+	    IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER |
+	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK |
+	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK;
 	he_cap_elem->phy_cap_info[4] &= ~m;
 
-	m = IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
+	m = IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK |
+	    IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK |
+	    IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
+	    IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
 	he_cap_elem->phy_cap_info[5] &= ~m;
 
 	m = IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
+	    IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
 	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB |
 	    IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
 	    IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO;
@@ -3307,6 +3315,7 @@ ath11k_mac_filter_he_cap_mesh(struct ieee80211_he_cap_elem *he_cap_elem)
 
 	m = IEEE80211_HE_PHY_CAP7_SRP_BASED_SR |
 	    IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
+	    IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
 	    IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
 	    IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ;
 	he_cap_elem->phy_cap_info[7] &= ~m;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
