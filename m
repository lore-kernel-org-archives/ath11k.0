Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXsDf-0002tn-Vf
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 19:02:09 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V7 5/8] ath11k: extend reading of FW capabilities
Date: Mon,  3 Jun 2019 21:01:54 +0200
Message-Id: <20190603190157.25165-6-john@phrozen.org>
In-Reply-To: <20190603190157.25165-1-john@phrozen.org>
References: <20190603190157.25165-1-john@phrozen.org>
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Read the additional mcs and extended mac capabilities field from the
service ready callback and store them inside the ath11k_pdev_cap
structure. This allows us to generate the sband_iftype_data dynamically.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 3 ++-
 drivers/net/wireless/ath/ath11k/wmi.c  | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index ca0c14109d09..330f22f9d3ff 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -527,7 +527,7 @@ struct ath11k {
 struct ath11k_band_cap {
 	u32 max_bw_supported;
 	u32 ht_cap_info;
-	u32 he_cap_info;
+	u32 he_cap_info[2];
 	u32 he_mcs;
 	u32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
 	struct ath11k_ppe_threshold he_ppet;
@@ -538,6 +538,7 @@ struct ath11k_pdev_cap {
 	u32 ampdu_density;
 	u32 vht_cap;
 	u32 vht_mcs;
+	u32 he_mcs;
 	u32 tx_chain_mask;
 	u32 rx_chain_mask;
 	u32 tx_chain_mask_shift;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2afdaea913ec..4c3c70c6938a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -327,6 +327,7 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	} else if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
 		pdev_cap->vht_cap = mac_phy_caps->vht_cap_info_5g;
 		pdev_cap->vht_mcs = mac_phy_caps->vht_supp_mcs_5g;
+		pdev_cap->he_mcs = mac_phy_caps->he_supp_mcs_5g;
 		pdev_cap->tx_chain_mask = mac_phy_caps->tx_chain_mask_5g;
 		pdev_cap->rx_chain_mask = mac_phy_caps->rx_chain_mask_5g;
 	} else {
@@ -349,7 +350,8 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
 	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_2g;
 	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_2g;
-	cap_band->he_cap_info = mac_phy_caps->he_cap_info_2g;
+	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_2g;
+	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_2g_ext;
 	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_2g;
 	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_2g,
 	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
@@ -359,7 +361,8 @@ static int ath11k_pull_mac_phy_cap_service_ready_ext(
 	cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
 	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
 	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
-	cap_band->he_cap_info = mac_phy_caps->he_cap_info_5g;
+	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
+	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
 	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
 	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
 	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
