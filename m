Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFYT-0000d8-0m
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 16:18:38 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: properly convert peer stats
Date: Tue, 17 Dec 2019 17:18:28 +0100
Message-Id: <20191217161828.1318-1-john@phrozen.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

The bandwidth was not converted from mac80211 to ath11k values correctly.
This patch adds a helper function to do it for us.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index d851d87e8a37..1d562133ae1e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -11,6 +11,28 @@
 #include "dp_tx.h"
 #include "debug_htt_stats.h"
 
+static u8 mac80211_bw_to_ath11k_bw(u8 bw)
+{
+	u8 ret = 0;
+
+	switch (bw) {
+	case RATE_INFO_BW_20:
+		ret = ATH11K_BW_20;
+		break;
+	case RATE_INFO_BW_40:
+		ret = ATH11K_BW_40;
+		break;
+	case RATE_INFO_BW_80:
+		ret = ATH11K_BW_80;
+		break;
+	case RATE_INFO_BW_160:
+		ret = ATH11K_BW_160;
+		break;
+	}
+
+	return ret;
+}
+
 void
 ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 				    struct ath11k_per_peer_tx_stats *peer_stats,
@@ -26,7 +48,7 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 	tx_stats = arsta->tx_stats;
 	gi = FIELD_GET(RATE_INFO_FLAGS_SHORT_GI, arsta->txrate.flags);
 	mcs = txrate->mcs;
-	bw = txrate->bw;
+	bw = mac80211_bw_to_ath11k_bw(txrate->bw);
 	nss = txrate->nss - 1;
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH11K_STATS_TYPE_##name]
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
