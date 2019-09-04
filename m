Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RNy-0008S9-Ih
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 09:15:32 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: Disable SU support in meshpoint mode
Date: Wed,  4 Sep 2019 11:15:27 +0200
Message-Id: <20190904091527.27260-1-john@phrozen.org>
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
 drivers/net/wireless/ath/ath11k/mac.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4d40c9635a4a..0869900d7e18 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3365,19 +3365,20 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 			he_cap_elem->phy_cap_info[3] &=
 				~(IEEE80211_HE_PHY_CAP3_RX_HE_MU_PPDU_FROM_NON_AP_STA |
 				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK |
-				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK);
-			he_cap_elem->phy_cap_info[4] &=
-				~IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
-			he_cap_elem->phy_cap_info[5] &=
-				~IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
+				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK |
+			          IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER);
+			he_cap_elem->phy_cap_info[4] = 0;
+			he_cap_elem->phy_cap_info[5] = 0;
 			he_cap_elem->phy_cap_info[6] &=
 				~(IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
+				  IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
 				  IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB |
 				  IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
 				  IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO);
 			he_cap_elem->phy_cap_info[7] &=
 				~(IEEE80211_HE_PHY_CAP7_SRP_BASED_SR |
 				  IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
+				  IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
 				  IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
 				  IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ);
 			he_cap_elem->phy_cap_info[8] &=
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
