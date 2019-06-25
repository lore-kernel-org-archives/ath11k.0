Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfdqu-00073f-Sa
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 05:18:46 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 22CB860709
 for <ath11k@lists.infradead.org>; Tue, 25 Jun 2019 05:18:42 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k: Fix NULL pointer dereference in sta_statistics()
 callback
Date: Tue, 25 Jun 2019 10:48:18 +0530
Message-Id: <1561439898-24320-1-git-send-email-vthiagar@codeaurora.org>
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

It is possible to dereference NULL arsta->rx_stats memory to get
rssi information after STA disconnection. Instead of dereferencing
a memory which is allocated/freed in sta_state() callback, add a
new member for rssi in arsta itself and use it in sta_statistics().

	ath11k c000000.wifi1: Station 8c:fd:f0:0a:90:f3 moved to disassociated state
	ath11k c000000.wifi1: Removed peer: 8c:fd:f0:0a:90:f3 for VDEV: 0
	Unable to handle kernel NULL pointer dereference at virtual address 00000218
	Internal error: Oops: 5 [#1] PREEMPT SMP ARM
	PC is at ath11k_sta_statistics+0x90/0xa0 [ath11k]
	LR is at sta_set_sinfo+0xb8/0xcb4 [mac80211]

Fixes: ecdb3adeda5c ("ath11k: Fix Rx signal strength reporting")
Reported-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 65c1a6d..ff73ccf 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -237,7 +237,6 @@ struct ath11k_rx_peer_stats {
 	u64 tid_count[IEEE80211_NUM_TIDS + 1];
 	u64 pream_cnt[HAL_RX_PREAMBLE_MAX];
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
-	u32 rssi_comb;
 };
 
 #define ATH11K_HE_MCS_NUM       12
@@ -330,6 +329,7 @@ struct ath11k_sta {
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
+	u8 rssi_comb;
 	struct ath11k_htt_tx_stats *tx_stats;
 	struct ath11k_rx_peer_stats *rx_stats;
 };
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index afe8399..0467753 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2373,7 +2373,7 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	rx_stats->num_mpdu_fcs_ok += ppdu_info->num_mpdu_fcs_ok;
 	rx_stats->num_mpdu_fcs_err += ppdu_info->num_mpdu_fcs_err;
 
-	rx_stats->rssi_comb = ppdu_info->rssi_comb;
+	arsta->rssi_comb = ppdu_info->rssi_comb;
 }
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7a6c927..ada1dde 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5110,7 +5110,7 @@ static void ath11k_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 
 	/* TODO: Use real NF instead of default one. */
-	sinfo->signal = arsta->rx_stats->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
+	sinfo->signal = arsta->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
 }
 
 static const struct ieee80211_ops ath11k_ops = {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
