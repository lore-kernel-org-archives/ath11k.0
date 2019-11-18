Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWnjv-0004Eo-8X
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 20:35:16 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] trivial: ath11k: fix indentation error
Date: Mon, 18 Nov 2019 21:35:11 +0100
Message-Id: <20191118203511.25068-1-john@phrozen.org>
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

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4e0800205a71..3ef723efad34 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3885,15 +3885,15 @@ ath11k_mac_prepare_he_mode(struct ath11k_pdev *pdev, u32 viftype)
 	hecap_phy_ptr = &cap_band->he_cap_phy_info[0];
 
 	hemode = FIELD_PREP(HE_MODE_SU_TX_BFEE, HE_SU_BFEE_ENABLE) |
-		FIELD_PREP(HE_MODE_SU_TX_BFER, HECAP_PHY_SUBFMR_GET(hecap_phy_ptr)) |
-		FIELD_PREP(HE_MODE_UL_MUMIMO, HECAP_PHY_ULMUMIMO_GET(hecap_phy_ptr));
+		 FIELD_PREP(HE_MODE_SU_TX_BFER, HECAP_PHY_SUBFMR_GET(hecap_phy_ptr)) |
+		 FIELD_PREP(HE_MODE_UL_MUMIMO, HECAP_PHY_ULMUMIMO_GET(hecap_phy_ptr));
 
 	/* TODO WDS and other modes */
 	if (viftype == NL80211_IFTYPE_AP) {
 		hemode |= FIELD_PREP(HE_MODE_MU_TX_BFER,
-			   HECAP_PHY_MUBFMR_GET(hecap_phy_ptr)) |
-			FIELD_PREP(HE_MODE_DL_OFDMA, HE_DL_MUOFDMA_ENABLE) |
-			FIELD_PREP(HE_MODE_UL_OFDMA, HE_UL_MUOFDMA_ENABLE);
+			  HECAP_PHY_MUBFMR_GET(hecap_phy_ptr)) |
+			  FIELD_PREP(HE_MODE_DL_OFDMA, HE_DL_MUOFDMA_ENABLE) |
+			  FIELD_PREP(HE_MODE_UL_OFDMA, HE_UL_MUOFDMA_ENABLE);
 	} else {
 		hemode |= FIELD_PREP(HE_MODE_MU_TX_BFEE, HE_MU_BFEE_ENABLE);
 	}
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
