Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUuFr-0002b6-5Z
 for ath11k@lists.infradead.org; Wed, 13 Nov 2019 15:08:27 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: Skip update peer stats for management packets
Date: Wed, 13 Nov 2019 20:38:17 +0530
Message-Id: <1573657697-10845-1-git-send-email-vnaralas@codeaurora.org>
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

Currently HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS tag of PPDU stats
doesn't have valid success bytes info of management frames.
So skip update peer stats for management packets.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    |  4 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 33 ++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index db216f0..82ddd70 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1176,7 +1176,9 @@ struct htt_ppdu_stats_usr_cmpltn_cmn {
 
 #define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MPDU_M	GENMASK(8, 0)
 #define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M	GENMASK(24, 9)
-#define HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM	GENMASK(3, 0)
+#define HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM	GENMASK(31, 25)
+
+#define HTT_PPDU_STATS_NON_QOS_TID	16
 
 struct htt_ppdu_stats_usr_cmpltn_ack_ba_status {
 	u32 ppdu_id;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8b88e56..be33ca85 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1034,6 +1034,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u32 succ_bytes = 0;
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
+	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
 	bool is_ampdu = false;
 
 	if (!usr_stats)
@@ -1051,6 +1052,8 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 		succ_bytes = usr_stats->ack_ba.success_bytes;
 		succ_pkts = FIELD_GET(HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M,
 				      usr_stats->ack_ba.info);
+		tid = FIELD_GET(HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM,
+				usr_stats->ack_ba.info);
 	}
 
 	if (common->fes_duration_us)
@@ -1156,19 +1159,23 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 		ieee80211_tx_rate_update(ar->hw, sta, &arsta->tx_info);
 	}
 
-	memset(peer_stats, 0, sizeof(*peer_stats));
-
-	peer_stats->succ_pkts = succ_pkts;
-	peer_stats->succ_bytes = succ_bytes;
-	peer_stats->is_ampdu = is_ampdu;
-	peer_stats->duration = tx_duration;
-	peer_stats->ba_fails =
-		HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
-		HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
-
-	if (ath11k_debug_is_extd_tx_stats_enabled(ar))
-		ath11k_accumulate_per_peer_tx_stats(arsta,
-						    peer_stats, rate_idx);
+	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
+	 * So skip peer stats update for mgmt packets.
+	 */
+	if (tid < HTT_PPDU_STATS_NON_QOS_TID) {
+		memset(peer_stats, 0, sizeof(*peer_stats));
+		peer_stats->succ_pkts = succ_pkts;
+		peer_stats->succ_bytes = succ_bytes;
+		peer_stats->is_ampdu = is_ampdu;
+		peer_stats->duration = tx_duration;
+		peer_stats->ba_fails =
+			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
+			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
+
+		if (ath11k_debug_is_extd_tx_stats_enabled(ar))
+			ath11k_accumulate_per_peer_tx_stats(arsta,
+							    peer_stats, rate_idx);
+	}
 
 	spin_unlock_bh(&ab->base_lock);
 	rcu_read_unlock();
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
