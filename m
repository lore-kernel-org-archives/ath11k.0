Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izG9s-00078W-Ut
 for ath11k@lists.infradead.org; Wed, 05 Feb 2020 08:35:42 +0000
From: Venkateswara Rao Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: fix incorrect peer stats counters update
Date: Wed,  5 Feb 2020 14:05:30 +0530
Message-Id: <1580891730-23868-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Convert mac80211 bw to ath11k bw before updating peer stats
bw counters, which fixes incorrect peer stats counters update.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c         | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.h         |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 743760c..8e8f2a8 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -24,7 +24,7 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 	tx_stats = arsta->tx_stats;
 	gi = FIELD_GET(RATE_INFO_FLAGS_SHORT_GI, arsta->txrate.flags);
 	mcs = txrate->mcs;
-	bw = txrate->bw;
+	bw = ath11k_mac_mac80211_bw_to_ath11k_bw(txrate->bw);
 	nss = txrate->nss - 1;
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH11K_STATS_TYPE_##name]
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6640662..da117e1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -178,6 +178,22 @@ u8 ath11k_mac_bw_to_mac80211_bw(u8 bw)
 	return ret;
 }
 
+enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw)
+{
+	switch (bw) {
+	case RATE_INFO_BW_20:
+		return ATH11K_BW_20;
+	case RATE_INFO_BW_40:
+		return ATH11K_BW_40;
+	case RATE_INFO_BW_80:
+		return ATH11K_BW_80;
+	case RATE_INFO_BW_160:
+		return ATH11K_BW_160;
+	default:
+		return ATH11K_BW_20;
+	}
+}
+
 int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
 					  u16 *rate)
 {
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f286531..f4937a0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -144,4 +144,5 @@ void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
+enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw);
 #endif
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
