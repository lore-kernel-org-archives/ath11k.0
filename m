Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2LX-0005YP-DB
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:03:44 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Fix misspelled warnings
Date: Fri, 21 Jun 2019 00:33:23 +0530
Message-Id: <1561057403-468-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/debug.h:157: 'vaild' may be misspelled - perhaps 'valid'?
drivers/net/wireless/ath/ath11k/debug.h:231: 'vaild' may be misspelled - perhaps 'valid'?
drivers/net/wireless/ath/ath11k/core.c:481: 'falied' may be misspelled - perhaps 'failed'?
drivers/net/wireless/ath/ath11k/dp.c:806: 'extention' may be misspelled - perhaps 'extension'?
drivers/net/wireless/ath/ath11k/debug_htt_stats.h:938: 'invaild' may be misspelled - perhaps 'invalid'?
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:2330: 'invaild' may be misspelled - perhaps 'invalid'?
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:2331: 'invaild' may be misspelled - perhaps 'invalid'?
drivers/net/wireless/ath/ath11k/dp_rx.c:781: 'udpate' may be misspelled - perhaps 'update'?
drivers/net/wireless/ath/ath11k/dp_rx.c:1127: 'Firmare' may be misspelled - perhaps 'Firmware'?
drivers/net/wireless/ath/ath11k/dp_rx.c:2676: 'vaild' may be misspelled - perhaps 'valid'?

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c            | 2 +-
 drivers/net/wireless/ath/ath11k/debug.h           | 4 ++--
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 4 ++--
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h | 2 +-
 drivers/net/wireless/ath/ath11k/dp.c              | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c           | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 221ba4da..ca80832 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -377,7 +377,7 @@ static int ath11k_core_pdev_create(struct ath11k_base *sc)
 
 	ret = ath11k_mac_create(sc);
 	if (ret) {
-		ath11k_err(sc, "falied to create new hw device with mac80211 :%d\n",
+		ath11k_err(sc, "failed to create new hw device with mac80211 :%d\n",
 			   ret);
 		return ret;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 4b30a7c..85fb2eb 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -153,7 +153,7 @@ static inline bool ath11k_debug_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 	return (!ar->debug.pktlog_peer_valid && ar->debug.pktlog_mode);
 }
 
-static inline bool ath11k_debug_is_pktlog_peer_vaild(struct ath11k *ar, u8 *addr)
+static inline bool ath11k_debug_is_pktlog_peer_valid(struct ath11k *ar, u8 *addr)
 {
 	return (ar->debug.pktlog_peer_valid && ar->debug.pktlog_mode &&
 		ether_addr_equal(addr, ar->debug.pktlog_peer_addr));
@@ -226,7 +226,7 @@ static inline bool ath11k_debug_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 	return false;
 }
 
-static inline bool ath11k_debug_is_pktlog_peer_vaild(struct ath11k *ar, u8 *addr)
+static inline bool ath11k_debug_is_pktlog_peer_valid(struct ath11k *ar, u8 *addr)
 {
 	return false;
 }
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index f683c31..8d92062 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -2327,8 +2327,8 @@ static inline void htt_print_tx_de_classify_failed_stats_tlv(const u32 *tag_buf,
 			   htt_stats_buf->sta_delete_in_progress);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ibss_no_bss_peer = %u",
 			   htt_stats_buf->ibss_no_bss_peer);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "invaild_vdev_type = %u",
-			   htt_stats_buf->invaild_vdev_type);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "invalid_vdev_type = %u",
+			   htt_stats_buf->invalid_vdev_type);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "invalid_ast_peer_entry = %u",
 			   htt_stats_buf->invalid_ast_peer_entry);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "peer_entry_invalid = %u",
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index 3ce4ba2..f59e002 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -939,7 +939,7 @@ struct htt_tx_de_classify_failed_stats_tlv {
 	u32 ap_bcast_mcast_no_peer;
 	u32 sta_delete_in_progress;
 	u32 ibss_no_bss_peer;
-	u32 invaild_vdev_type;
+	u32 invalid_vdev_type;
 	u32 invalid_ast_peer_entry;
 	u32 peer_entry_invalid;
 	u32 ethertype_not_ip;
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index c4770bb..32ed764 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -804,7 +804,7 @@ void ath11k_dp_vdev_tx_attach(struct ath11k *ar, struct ath11k_vif *arvif)
 			       FIELD_PREP(HTT_TCL_META_DATA_PDEV_ID,
 					  ar->pdev->pdev_id);
 
-	/* set HTT extention valid bit to 0 by default */
+	/* set HTT extension valid bit to 0 by default */
 	arvif->tcl_metadata &= ~HTT_TCL_META_DATA_VALID_HTT;
 
 	ath11k_dp_update_vdev_search(arvif);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6939716..a505e91 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -727,7 +727,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 						    ba_win_sz, ssn);
 		spin_unlock_bh(&ab->data_lock);
 		if (ret) {
-			ath11k_warn(ab, "failed to udpate reo for rx tid %d\n", tid);
+			ath11k_warn(ab, "failed to update reo for rx tid %d\n", tid);
 			return ret;
 		}
 
@@ -1073,7 +1073,7 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 
         /* Note: If host configured fixed rates and in some other special
 	 * cases, the broadcast/management frames are sent in different rates.
-	 * Firmare rate's control to be skipped for this?
+	 * Firmware rate's control to be skipped for this?
          */
 
 	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > 9) {
@@ -2625,7 +2625,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
 		ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
 
-		if (ath11k_debug_is_pktlog_peer_vaild(ar, peer->addr)) {
+		if (ath11k_debug_is_pktlog_peer_valid(ar, peer->addr)) {
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 		}
 		spin_unlock_bh(&ab->data_lock);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
