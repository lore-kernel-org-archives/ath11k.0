Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8SK-0007hr-Dj
 for ath11k@lists.infradead.org; Mon, 09 Nov 2020 14:47:43 +0000
From: Ramya Gnanasekar <rgnanase@codeaurora.org>
Subject: [PATCH] ath11k: Fix beamformee STS in HE cap
Date: Mon,  9 Nov 2020 20:17:09 +0530
Message-Id: <1604933229-15815-1-git-send-email-rgnanase@codeaurora.org>
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
Cc: Ramya Gnanasekar <rgnanase@codeaurora.org>, linux-wireless@vger.kernel.org

STS Beamformee capability sent from firmware is overwritten as
num_tx_chains - 1.
When num_tx_chains is 2, then STS is set to invalid value 1.
Since STS is not limited by number of TX chain, not overwriting the
capability received from firmware.

Tested on: IPQ6018 WLAN.HK.2.4.0.1-00303-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramya Gnanasekar <rgnanase@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f8dd47..787b052 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3729,11 +3729,6 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 
 		he_cap_elem->mac_cap_info[1] &=
 			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_MASK;
-		he_cap_elem->phy_cap_info[4] &=
-			~IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK;
-		he_cap_elem->phy_cap_info[4] &=
-			~IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK;
-		he_cap_elem->phy_cap_info[4] |= (ar->num_tx_chains - 1) << 2;
 
 		he_cap_elem->phy_cap_info[5] &=
 			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
