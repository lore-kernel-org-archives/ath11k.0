Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iowkk-000830-JN
 for ath11k@lists.infradead.org; Tue, 07 Jan 2020 21:51:08 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath11k: fix debugfs build failure
Date: Tue,  7 Jan 2020 22:50:04 +0100
Message-Id: <20200107215036.1333983-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>, Manikanta Pubbisetty <mpubbise@codeaurora.org>, John Crispin <john@phrozen.org>, Sven Eckelmann <seckelmann@datto.com>, Bhagavathi Perumal S <bperumal@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Sriram R <srirrama@codeaurora.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, Muna Sinada <msinada@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Tamizh chelvam <tamizhr@codeaurora.org>, kbuild test robot <lkp@intel.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Sathishkumar Muruganandam <murugana@codeaurora.org>, ath11k@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Miles Hu <milehu@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, Govindaraj Saminathan <gsamin@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Karthikeyan Periyasamy <periyasa@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

When CONFIG_ATH11K_DEBUGFS is disabled, but CONFIG_MAC80211_DEBUGFS
is turned on, the driver fails to build:

drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function 'ath11k_dbg_sta_open_htt_peer_stats':
drivers/net/wireless/ath/ath11k/debugfs_sta.c:416:4: error: 'struct ath11k' has no member named 'debug'
  ar->debug.htt_stats.stats_req = stats_req;
    ^~

It appears that just using the former symbol is sufficient here,
adding a Kconfig dependency takes care of the corner cases.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath11k/Kconfig  |  2 +-
 drivers/net/wireless/ath/ath11k/Makefile |  3 +--
 drivers/net/wireless/ath/ath11k/debug.h  | 22 ++++++++++------------
 drivers/net/wireless/ath/ath11k/mac.c    |  2 +-
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index cfab4fb86aef..c88e16d4022b 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -22,7 +22,7 @@ config ATH11K_DEBUG
 
 config ATH11K_DEBUGFS
 	bool "QCA ath11k debugfs support"
-	depends on ATH11K && DEBUG_FS
+	depends on ATH11K && DEBUG_FS && MAC80211_DEBUGFS
 	---help---
 	  Enable ath11k debugfs support
 
diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
index a91d75c1cfeb..2761d07d938e 100644
--- a/drivers/net/wireless/ath/ath11k/Makefile
+++ b/drivers/net/wireless/ath/ath11k/Makefile
@@ -17,8 +17,7 @@ ath11k-y += core.o \
 	    ce.o \
 	    peer.o
 
-ath11k-$(CONFIG_ATH11K_DEBUGFS) += debug_htt_stats.o
-ath11k-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
+ath11k-$(CONFIG_ATH11K_DEBUGFS) += debug_htt_stats.o debugfs_sta.o
 ath11k-$(CONFIG_NL80211_TESTMODE) += testmode.o
 ath11k-$(CONFIG_ATH11K_TRACING) += trace.o
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index a317a7bdb9a2..8e8d5588b541 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -172,6 +172,16 @@ static inline int ath11k_debug_is_extd_rx_stats_enabled(struct ath11k *ar)
 {
 	return ar->debug.extd_rx_stats;
 }
+
+void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, struct dentry *dir);
+void
+ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
+				    struct ath11k_per_peer_tx_stats *peer_stats,
+				    u8 legacy_rate_idx);
+void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
+					       struct sk_buff *msdu,
+					       struct hal_tx_status *ts);
 #else
 static inline int ath11k_debug_soc_create(struct ath11k_base *ab)
 {
@@ -243,19 +253,7 @@ static inline bool ath11k_debug_is_pktlog_peer_valid(struct ath11k *ar, u8 *addr
 {
 	return false;
 }
-#endif /* CONFIG_ATH11K_DEBUGFS */
 
-#ifdef CONFIG_MAC80211_DEBUGFS
-void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-			    struct ieee80211_sta *sta, struct dentry *dir);
-void
-ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
-				    struct ath11k_per_peer_tx_stats *peer_stats,
-				    u8 legacy_rate_idx);
-void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
-					       struct sk_buff *msdu,
-					       struct hal_tx_status *ts);
-#else /* !CONFIG_MAC80211_DEBUGFS */
 static inline void
 ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 				    struct ath11k_per_peer_tx_stats *peer_stats,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 556eef9881a7..0ed3e4d19f7a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5468,7 +5468,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.flush				= ath11k_mac_op_flush,
 	.sta_statistics			= ath11k_mac_op_sta_statistics,
 	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
-#ifdef CONFIG_MAC80211_DEBUGFS
+#ifdef CONFIG_ATH11K_DEBUGFS
 	.sta_add_debugfs		= ath11k_sta_add_debugfs,
 #endif
 };
-- 
2.20.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
