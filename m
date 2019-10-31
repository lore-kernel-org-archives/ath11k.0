Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ318-0002jx-C2
 for ath11k@lists.infradead.org; Thu, 31 Oct 2019 05:29:08 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: update tx duration in station info
Date: Thu, 31 Oct 2019 10:52:40 +0530
Message-Id: <1572499360-4430-1-git-send-email-vnaralas@codeaurora.org>
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

Update tx duration in station info form PPDU stats so that
users can dump tx duration of the station.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 95447d1..8ed034d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -335,6 +335,7 @@ struct ath11k_sta {
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
+	u64 tx_duration;
 	u8 rssi_comb;
 	struct ath11k_htt_tx_stats *tx_stats;
 	struct ath11k_rx_peer_stats *rx_stats;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9491a47..e1e805c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1159,6 +1159,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	arsta->txrate.nss = nss;
 	arsta->txrate.bw = ath11k_bw_to_mac80211_bw(bw);
 	arsta->tx_info.status.rates[0].flags |= ath11k_bw_to_mac80211_bwflags(bw);
+	arsta->tx_duration += tx_duration;
 
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb025a4..c49c2cf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4962,6 +4962,9 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
 
+	sinfo->tx_duration = arsta->tx_duration;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
+
 	if (!arsta->txrate.legacy && !arsta->txrate.nss)
 		return;
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
