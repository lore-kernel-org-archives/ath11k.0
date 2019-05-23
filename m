Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTlDE-0007RL-9Z
 for ath11k@lists.infradead.org; Thu, 23 May 2019 10:44:41 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] ath11k: properly convert bw
Date: Thu, 23 May 2019 12:44:31 +0200
Message-Id: <20190523104431.8996-2-john@phrozen.org>
In-Reply-To: <20190523104431.8996-1-john@phrozen.org>
References: <20190523104431.8996-1-john@phrozen.org>
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

The bandwidth inside the TX reporting code is not properly converted from
ath11k values to the rate_info ones.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 71d385cf55d7..38cc787671ee 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -954,7 +954,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	}
 
 	arsta->txrate.nss = nss;
-	arsta->txrate.bw = bw;
+	arsta->txrate.bw = ath11k_bw_to_mac80211_bw(bw);
 	arsta->tx_info.status.rates[0].flags |= ath11k_bw_to_mac80211_bwflags(bw);
 
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
