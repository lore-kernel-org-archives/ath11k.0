Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaF3n-00016A-Ob
 for ath11k@lists.infradead.org; Thu, 28 Nov 2019 08:22:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 9/9] ath11k: fix indentation in ath11k_mac_prepare_he_mode()
Date: Thu, 28 Nov 2019 08:21:58 +0000
Message-ID: <0101016eb11a43dd-8eeb5e90-80fa-4b34-8662-e7a9e210ae0e-000000@us-west-2.amazonses.com>
In-Reply-To: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
References: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: John Crispin <john@phrozen.org>

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e4dfce6b63f0..978d8768d68a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3883,15 +3883,15 @@ ath11k_mac_prepare_he_mode(struct ath11k_pdev *pdev, u32 viftype)
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
