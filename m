Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgUaw-00072k-Us
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 13:37:48 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: update tx duration in peer stats
Date: Thu, 27 Jun 2019 19:06:35 +0530
Message-Id: <1561642595-16359-1-git-send-email-vnaralas@codeaurora.org>
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

Update the tx duraion in peer stats from ppdu stats.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h        |  2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 16 ++++++++++------
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index af5c66f..da39610 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -389,7 +389,7 @@ struct ath11k_per_peer_tx_stats {
 	u16 succ_pkts;
 	u16 retry_pkts;
 	u16 failed_pkts;
-	u16 duration;
+	u32 duration;
 	u8 ba_fails;
 	bool is_ampdu;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 4a30293..c270e6c 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -138,6 +138,8 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 	STATS_OP_FMT(RETRY).bw[1][bw] += peer_stats->retry_pkts;
 	STATS_OP_FMT(RETRY).nss[1][nss] += peer_stats->retry_pkts;
 	STATS_OP_FMT(RETRY).gi[1][gi] += peer_stats->retry_pkts;
+
+	tx_stats->tx_duration += peer_stats->duration;
 }
 
 void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 14a20f3..692c301 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1030,7 +1030,7 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 
 static void
 ath11k_update_per_peer_tx_stats(struct ath11k *ar,
-				struct htt_ppdu_user_stats *usr_stats)
+				struct htt_ppdu_stats *ppdu_stats, u8 user)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_peer *peer;
@@ -1039,10 +1039,13 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	struct htt_ppdu_stats_user_rate *user_rate;
 	struct ieee80211_chanctx_conf *conf = NULL;
 	struct ath11k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
+	struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
+	struct htt_ppdu_stats_common *common = &ppdu_stats->common;
 	int ret;
 	u8 flags, mcs, nss, bw, sgi, rate_idx = 0;
 	u32 succ_bytes = 0;
 	u16 rate = 0, succ_pkts = 0;
+	u32 tx_duration = 0;
 	bool is_ampdu = false;
 
 	if (!usr_stats)
@@ -1062,6 +1065,9 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 				      usr_stats->ack_ba.info);
 	}
 
+	if (common->fes_duration_us)
+		tx_duration = common->fes_duration_us;
+
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
 	bw = HTT_USR_RATE_BW(user_rate->rate_flags) - 2;
@@ -1167,6 +1173,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	peer_stats->succ_pkts = succ_pkts;
 	peer_stats->succ_bytes = succ_bytes;
 	peer_stats->is_ampdu = is_ampdu;
+	peer_stats->duration = tx_duration;
 	peer_stats->ba_fails =
 		HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
 		HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
@@ -1182,13 +1189,10 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 static void ath11k_htt_update_ppdu_stats(struct ath11k *ar,
 					 struct htt_ppdu_stats *ppdu_stats)
 {
-	struct htt_ppdu_user_stats *usr_stats;
 	u8 user;
 
-	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++) {
-		usr_stats = &ppdu_stats->user_stats[user];
-		ath11k_update_per_peer_tx_stats(ar, usr_stats);
-	}
+	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++)
+		ath11k_update_per_peer_tx_stats(ar, ppdu_stats, user);
 }
 
 static
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
