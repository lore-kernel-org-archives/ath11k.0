Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMx5s-0004Pi-2j
 for ath11k@lists.infradead.org; Fri, 10 Apr 2020 17:05:30 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Fix rx_filter flags setting for per peer rx_stats
Date: Fri, 10 Apr 2020 22:36:45 +0530
Message-Id: <1586538405-16226-3-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1586538405-16226-1-git-send-email-mkenna@codeaurora.org>
References: <1586538405-16226-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

Rx_filter flags are set with default filter flags during
wifi up/down sequence even though the 'ext_rx_stats' debugfs
is enabled as 1. So, that we are not getting proper per peer
rx_stats.
Hence, fixing this by setting the missing rx_filter when
ext_rx_stats is already set/enabled.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  1 +
 drivers/net/wireless/ath/ath11k/debug.c |  2 ++
 drivers/net/wireless/ath/ath11k/debug.h | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  4 +++-
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b4c3e041..a8ef95f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -392,6 +392,7 @@ struct ath11k_debug {
 	u32 pktlog_mode;
 	u32 pktlog_peer_valid;
 	u8 pktlog_peer_addr[ETH_ALEN];
+	u32 rx_filter;
 };
 
 struct ath11k_per_peer_tx_stats {
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 8d48517..e479504 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -698,6 +698,8 @@ static ssize_t ath11k_write_extd_rx_stats(struct file *file,
 		tlv_filter = ath11k_mac_mon_status_filter_default;
 	}
 
+	ar->debug.rx_filter = tlv_filter.rx_filter;
+
 	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
 	ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
 					       HAL_RXDMA_MONITOR_STATUS,
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 4a3ff82..45454fc 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -188,6 +188,11 @@ static inline int ath11k_debug_is_extd_rx_stats_enabled(struct ath11k *ar)
 	return ar->debug.extd_rx_stats;
 }
 
+static inline int ath11k_debug_rx_filter(struct ath11k *ar)
+{
+	return ar->debug.rx_filter;
+}
+
 void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir);
 void
@@ -269,6 +274,11 @@ static inline bool ath11k_debug_is_pktlog_peer_valid(struct ath11k *ar, u8 *addr
 	return false;
 }
 
+static inline int ath11k_debug_rx_filter(struct ath11k *ar)
+{
+	return 0;
+}
+
 static inline void
 ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 				    struct ath11k_per_peer_tx_stats *peer_stats,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9f8bc19..3665e72 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3877,8 +3877,10 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
 	u32 ring_id;
 
-	if (enable)
+	if (enable) {
 		tlv_filter = ath11k_mac_mon_status_filter_default;
+		tlv_filter.rx_filter = ath11k_debug_rx_filter(ar);
+	}
 
 	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
 
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
