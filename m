Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heBs3-0003Uj-JB
 for ath11k@lists.infradead.org; Fri, 21 Jun 2019 05:13:57 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: fix possible mem leak in extd tx stats
Date: Fri, 21 Jun 2019 10:43:44 +0530
Message-Id: <1561094024-32433-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

This patch fix the memory leak in extd tx stats.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1e9c34..586c725 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2597,8 +2597,10 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 		if (ath11k_debug_is_extd_tx_stats_enabled(ar)) {
 			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
 						  GFP_KERNEL);
-			if (!arsta->tx_stats)
+			if (!arsta->tx_stats) {
+				ret = -ENOMEM;
 				goto exit;
+			}
 		}
 
 		if (ieee80211_vif_is_mesh(vif)) {
@@ -2634,8 +2636,8 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 
 		ath11k_mac_dec_num_stations(arvif, sta);
 
-		if (ath11k_debug_is_extd_tx_stats_enabled(ar))
-			kfree(arsta->tx_stats);
+		kfree(arsta->tx_stats);
+		arsta->tx_stats = NULL;
 
 		kfree(arsta->rx_stats);
 		arsta->rx_stats = NULL;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
