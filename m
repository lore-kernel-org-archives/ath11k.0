Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJiwP-0008PM-Nz
 for ath11k@lists.infradead.org; Thu, 25 Apr 2019 18:17:53 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 1/4] ath11k: add HE handling to the debug code
Date: Thu, 25 Apr 2019 20:17:37 +0200
Message-Id: <20190425181740.1994-2-john@phrozen.org>
In-Reply-To: <20190425181740.1994-1-john@phrozen.org>
References: <20190425181740.1994-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, John Crispin <john@phrozen.org>

This patch allows the driver to also show the HE counters and stats.
Also extend the appropriate debug prints with HE info.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h        |  2 ++
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 24 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  3 ++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b2a3cacc7344..962c1f13c9e8 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -248,6 +248,7 @@ struct ath11k_peer {
 	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
 };
 
+#define ATH11K_HE_MCS_NUM       12
 #define ATH11K_VHT_MCS_NUM      10
 #define ATH11K_BW_NUM           4
 #define ATH11K_NSS_NUM          4
@@ -301,6 +302,7 @@ struct ath11k_htt_data_stats {
 	u64 legacy[ATH11K_COUNTER_TYPE_MAX][ATH11K_LEGACY_NUM];
 	u64 ht[ATH11K_COUNTER_TYPE_MAX][ATH11K_HT_MCS_NUM];
 	u64 vht[ATH11K_COUNTER_TYPE_MAX][ATH11K_VHT_MCS_NUM];
+	u64 he[ATH11K_COUNTER_TYPE_MAX][ATH11K_HE_MCS_NUM];
 	u64 bw[ATH11K_COUNTER_TYPE_MAX][ATH11K_BW_NUM];
 	u64 nss[ATH11K_COUNTER_TYPE_MAX][ATH11K_NSS_NUM];
 	u64 gi[ATH11K_COUNTER_TYPE_MAX][ATH11K_GI_NUM];
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 41b2221e0479..d05efe6c0498 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -45,7 +45,14 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH11K_STATS_TYPE_##name]
 
-	if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
+	if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
+		STATS_OP_FMT(SUCC).he[0][mcs] += peer_stats->succ_bytes;
+		STATS_OP_FMT(SUCC).he[1][mcs] += peer_stats->succ_pkts;
+		STATS_OP_FMT(FAIL).he[0][mcs] += peer_stats->failed_bytes;
+		STATS_OP_FMT(FAIL).he[1][mcs] += peer_stats->failed_pkts;
+		STATS_OP_FMT(RETRY).he[0][mcs] += peer_stats->retry_bytes;
+		STATS_OP_FMT(RETRY).he[1][mcs] += peer_stats->retry_pkts;
+	} else if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
 		STATS_OP_FMT(SUCC).vht[0][mcs] += peer_stats->succ_bytes;
 		STATS_OP_FMT(SUCC).vht[1][mcs] += peer_stats->succ_pkts;
 		STATS_OP_FMT(FAIL).vht[0][mcs] += peer_stats->failed_bytes;
@@ -73,7 +80,12 @@ ath11k_accumulate_per_peer_tx_stats(struct ath11k_sta *arsta,
 	if (peer_stats->is_ampdu) {
 		tx_stats->ba_fails += peer_stats->ba_fails;
 
-		if (txrate->flags & RATE_INFO_FLAGS_MCS) {
+		if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
+			STATS_OP_FMT(AMPDU).he[0][mcs] +=
+			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			STATS_OP_FMT(AMPDU).he[1][mcs] +=
+			peer_stats->succ_pkts + peer_stats->retry_pkts;
+		} else if (txrate->flags & RATE_INFO_FLAGS_MCS) {
 			STATS_OP_FMT(AMPDU).ht[0][mcs] +=
 			peer_stats->succ_bytes + peer_stats->retry_bytes;
 			STATS_OP_FMT(AMPDU).ht[1][mcs] +=
@@ -230,6 +242,14 @@ static ssize_t ath11k_dbg_sta_dump_tx_stats(struct file *file,
 					 str_name[k],
 					 str[j]);
 			len += scnprintf(buf + len, size - len,
+					 " HE MCS %s\n",
+					 str[j]);
+			for (i = 0; i < ATH11K_HE_MCS_NUM; i++)
+				len += scnprintf(buf + len, size - len,
+						 "  %llu ",
+						 stats->he[j][i]);
+			len += scnprintf(buf + len, size - len, "\n");
+			len += scnprintf(buf + len, size - len,
 					 " VHT MCS %s\n",
 					 str[j]);
 			for (i = 0; i < ATH11K_VHT_MCS_NUM; i++)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b57cd30be987..f95c2837bc40 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1760,7 +1760,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	status = IEEE80211_SKB_RXCB(msdu);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   ieee80211_get_SA(hdr),
@@ -1771,6 +1771,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
 		   (status->encoding == RX_ENC_HT) ? "ht" : "",
 		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
+		   (status->encoding == RX_ENC_HE) ? "he" : "",
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
