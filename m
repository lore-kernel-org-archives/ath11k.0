Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2MY-0005cT-Vc
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:04:48 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix unnecessary brace warnings
Date: Fri, 21 Jun 2019 00:34:28 +0530
Message-Id: <1561057468-542-1-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/core.c:193: braces {} are not necessary for single statement blocks
drivers/net/wireless/ath/ath11k/dp_rx.c:1306: braces {} are not necessary for single statement blocks
drivers/net/wireless/ath/ath11k/dp_rx.c:2647: braces {} are not necessary for single statement blocks
drivers/net/wireless/ath/ath11k/dp_rx.c:2676: braces {} are not necessary for single statement blocks
drivers/net/wireless/ath/ath11k/mac.c:5123: braces {} are not necessary for single statement blocks

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  3 +--
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  3 +--
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index ca80832..1ecbbd9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -190,9 +190,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 		bd->fw = ath11k_fetch_fw_file(sc,
 					      sc->hw_params.fw.dir,
 					      filename);
-	if (IS_ERR(bd->fw)) {
+	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
-	}
 
 	data = bd->fw->data;
 	len = bd->fw->size;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a505e91..cec27a8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1253,9 +1253,8 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 		goto exit;
 	}
 
-	if (ath11k_debug_is_pktlog_lite_mode_enabled(ar)) {
+	if (ath11k_debug_is_pktlog_lite_mode_enabled(ar))
 		trace_ath11k_htt_ppdu_stats(ar, skb->data, len);
-	}
 
 	ppdu_info = ath11k_dp_htt_get_ppdu_desc(ar, ppdu_id);
 	if (!ppdu_info) {
@@ -2596,9 +2595,8 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		memset(&ppdu_info, 0, sizeof(ppdu_info));
 		ppdu_info.peer_id = HAL_INVALID_PEERID;
 
-		if (ath11k_debug_is_pktlog_rx_stats_enabled(ar)) {
+		if (ath11k_debug_is_pktlog_rx_stats_enabled(ar))
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
-		}
 
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info,
 							    (u8 *)skb->data);
@@ -2625,9 +2623,9 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
 		ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
 
-		if (ath11k_debug_is_pktlog_peer_valid(ar, peer->addr)) {
+		if (ath11k_debug_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
-		}
+
 		spin_unlock_bh(&ab->data_lock);
 		rcu_read_unlock();
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ee187de..613590e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5031,9 +5031,8 @@ static void ath11k_mac_disable_peer_fixed_rate(void *data,
 	}
 
 	ret = wait_for_completion_timeout(&ar->bss_survey_done, 3 * HZ);
-	if (ret == 0) {
+	if (ret == 0)
 		ath11k_warn(ar->ab, "bss channel survey timed out\n");
-	}
 }
 
 static int ath11k_get_survey(struct ieee80211_hw *hw, int idx,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
