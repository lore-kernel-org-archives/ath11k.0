Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcuZB-0005qm-UC
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 16:33:11 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49EF6607DE
 for <ath11k@lists.infradead.org>; Mon, 17 Jun 2019 16:33:07 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/5] ath11k: comparison is always true due to limited range of
 data type [-Wtype-limits]
Date: Mon, 17 Jun 2019 19:32:58 +0300
Message-Id: <1560789179-3857-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
References: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/hal_rx.c:57:18: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2375:21: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2378:20: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2382:20: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2385:22: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2389:21: warning: comparison is always true due to limited range of data type [-Wtype-limits]
drivers/net/wireless/ath/ath11k/dp_rx.c:2396:32: warning: comparison is always true due to limited range of data type [-Wtype-limits]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c           | 18 +++++++-----------
 drivers/net/wireless/ath/ath11k/hal_rx.c          |  6 +++---
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 9558c6ada6d8..22d44a59be14 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -52,7 +52,7 @@ static inline void htt_print_stats_string_tlv(const u32 *tag_buf,
 		index += snprintf(&data[index],
 				HTT_MAX_STRING_LEN - index,
 				"%.*s", 4, (char *)&(htt_stats_buf->data[i]));
-		if (index < 0 || index >= HTT_MAX_STRING_LEN)
+		if (index >= HTT_MAX_STRING_LEN)
 			break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0823f6761426..2c7a3585059a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2372,29 +2372,25 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	if (ppdu_info->nss > 0 && ppdu_info->nss <= HAL_RX_MAX_NSS)
 		rx_stats->nss_count[ppdu_info->nss - 1] += num_msdu;
 
-	if (ppdu_info->mcs >= 0 && ppdu_info->mcs <= HAL_RX_MAX_MCS)
+	if (ppdu_info->mcs <= HAL_RX_MAX_MCS)
 		rx_stats->mcs_count[ppdu_info->mcs] += num_msdu;
 
-	if (ppdu_info->gi >= HAL_RX_GI_0_8_US &&
-	    ppdu_info->gi < HAL_RX_GI_MAX)
+	if (ppdu_info->gi < HAL_RX_GI_MAX)
 		rx_stats->gi_count[ppdu_info->gi] += num_msdu;
 
-	if (ppdu_info->bw >= HAL_RX_BW_20MHZ && ppdu_info->bw < HAL_RX_BW_MAX)
+	if (ppdu_info->bw < HAL_RX_BW_MAX)
 		rx_stats->bw_count[ppdu_info->bw] += num_msdu;
 
-	if (ppdu_info->ldpc >= HAL_RX_SU_MU_CODING_BCC &&
-	    ppdu_info->ldpc < HAL_RX_SU_MU_CODING_MAX)
+	if (ppdu_info->ldpc < HAL_RX_SU_MU_CODING_MAX)
 		rx_stats->coding_count[ppdu_info->ldpc] += num_msdu;
 
-	if (ppdu_info->tid >= 0 && ppdu_info->tid <= IEEE80211_NUM_TIDS)
+	if (ppdu_info->tid <= IEEE80211_NUM_TIDS)
 		rx_stats->tid_count[ppdu_info->tid] += num_msdu;
 
-	if (ppdu_info->preamble_type >= HAL_RX_PREAMBLE_11A &&
-	    ppdu_info->preamble_type < HAL_RX_PREAMBLE_MAX)
+	if (ppdu_info->preamble_type < HAL_RX_PREAMBLE_MAX)
 		rx_stats->pream_cnt[ppdu_info->preamble_type] += num_msdu;
 
-	if (ppdu_info->reception_type >= HAL_RX_RECEPTION_TYPE_SU &&
-	    ppdu_info->reception_type < HAL_RX_RECEPTION_TYPE_MAX)
+	if (ppdu_info->reception_type < HAL_RX_RECEPTION_TYPE_MAX)
 		rx_stats->reception_type[ppdu_info->reception_type] += num_msdu;
 
 	if (ppdu_info->is_stbc)
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 0308089c88df..ca55855db2bc 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -54,10 +54,10 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, u32 *reo_desc,
 	u8 avail_slot = ffz(hal->avail_blk_resource);
 
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_BLOCK_LATER) {
-		if (avail_slot >= 0 && avail_slot < HAL_MAX_AVAIL_BLK_RES)
-			hal->current_blk_index = avail_slot;
-		else
+		if (avail_slot >= HAL_MAX_AVAIL_BLK_RES)
 			return -ENOSPC;
+
+		hal->current_blk_index = avail_slot;
 	}
 
 	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_FLUSH_CACHE) |
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
