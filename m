Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htCol-0006DH-9y
 for ath11k@lists.infradead.org; Thu, 01 Aug 2019 15:16:37 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH] ath11k: Add missing pdev rx rate stats
Date: Thu,  1 Aug 2019 20:45:45 +0530
Message-Id: <1564672545-27675-1-git-send-email-bperumal@codeaurora.org>
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
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>

This adds missing rx rate info stats like pilot evm,
per chain rssi, per user ul ppdu and mpdu counts and
ul ofdma rate info etc.

And add null checks for memory alloc failures.

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 205 ++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  42 +++++
 2 files changed, 214 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index a9dffd1..f1fae81 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -817,11 +817,14 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
-	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
+	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS] = {0};
 	u8 j;
 
-	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++) {
 		tx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!tx_gi[j])
+			goto fail;
+	}
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PEER_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_ldpc = %u",
@@ -882,15 +885,16 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_dcm = %s\n", str_buf);
 
-	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
-		kfree(tx_gi[j]);
-
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
 	else
 		buf[len] = 0;
 
 	stats_req->buf_len = len;
+
+fail:
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(tx_gi[j]);
 }
 
 static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data)
@@ -903,15 +907,21 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	u8 j;
-	char *rssi_chain[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS];
-	char *rx_gi[HTT_RX_PEER_STATS_NUM_GI_COUNTERS];
+	char *rssi_chain[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS] = {0};
+	char *rx_gi[HTT_RX_PEER_STATS_NUM_GI_COUNTERS] = {0};
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 
-	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++)
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++) {
 		rssi_chain[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!rssi_chain[j])
+			goto fail;
+	}
 
-	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++)
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++) {
 		rx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!rx_gi[j])
+			goto fail;
+	}
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PEER_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "nsts = %u",
@@ -971,18 +981,19 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_pream = %s\n", str_buf);
 
-	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++)
-		kfree(rssi_chain[j]);
-
-	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++)
-		kfree(rx_gi[j]);
-
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
 	else
 		buf[len] = 0;
 
 	stats_req->buf_len = len;
+
+fail:
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++)
+		kfree(rssi_chain[j]);
+
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(rx_gi[j]);
 }
 
 static inline void htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const u32 *tag_buf, u8 *data)
@@ -2959,10 +2970,13 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 		(struct htt_tx_pdev_rate_stats_tlv *)tag_buf;
 	u8 j;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
-	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
+	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS] = {0};
 
-	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++) {
 		tx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!tx_gi[j])
+			goto fail;
+	}
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3115,15 +3129,15 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_dcm = %s\n", str_buf);
 
-	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
-		kfree(tx_gi[j]);
-
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
 	else
 		buf[len] = 0;
 
 	stats_req->buf_len = len;
+fail:
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(tx_gi[j]);
 }
 
 static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data)
@@ -3135,16 +3149,30 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf =
 		(struct htt_rx_pdev_rate_stats_tlv *)tag_buf;
-	u8 j;
-	char *rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
-	char *rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS];
+	u8 i, j;
+	u16 index = 0;
+	char *rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS] = {0};
+	char *rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS] = {0};
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
+	char *rx_pilot_evm_dB[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS] = {0};
 
-	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
 		rssi_chain[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!rssi_chain[j])
+			goto fail;
+	}
 
-	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++)
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
 		rx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!rx_gi[j])
+			goto fail;
+	}
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
+		rx_pilot_evm_dB[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+		if (!rx_pilot_evm_dB[j])
+			goto fail;
+	}
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3188,6 +3216,32 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_bw,
 			HTT_RX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_bw = %s ", str_buf);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_evm_nss_count = %u",
+			htt_stats_buf->nss_count);
+
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_evm_pilot_count = %u",
+			htt_stats_buf->pilot_count);
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
+		index = 0;
+
+		for (i = 0; i < HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS; i++)
+			index += snprintf(&rx_pilot_evm_dB[j][index],
+					  HTT_MAX_STRING_LEN - index,
+					  " %u:%d,",
+					  i,
+					  htt_stats_buf->rx_pilot_evm_dB[j][i]);
+		len += HTT_DBG_OUT(buf + len, buf_len - len, "pilot_evm_dB[%u] = %s ",
+				   j, rx_pilot_evm_dB[j]);
+	}
+
+	index = 0;
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
+		index += snprintf(&str_buf[index],
+				  HTT_MAX_STRING_LEN - index,
+				  " %u:%d,", i, htt_stats_buf->rx_pilot_evm_dB_mean[i]);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "pilot_evm_dB_mean = %s ", str_buf);
 
 	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
 		ARRAY_TO_STRING(rssi_chain[j], htt_stats_buf->rssi_chain[j],
@@ -3208,12 +3262,6 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_pream = %s", str_buf);
 
-	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
-		kfree(rssi_chain[j]);
-
-	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++)
-		kfree(rx_gi[j]);
-
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_11ax_su_ext = %u",
 			   htt_stats_buf->rx_11ax_su_ext);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_11ac_mumimo = %u",
@@ -3239,8 +3287,89 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_active_dur_us_low = %u",
 			   htt_stats_buf->rx_active_dur_us_low);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_active_dur_us_high = %u\n",
-			   htt_stats_buf->rx_active_dur_us_high);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_active_dur_us_high = %u",
+			htt_stats_buf->rx_active_dur_us_high);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_11ax_ul_ofdma = %u",
+			htt_stats_buf->rx_11ax_ul_ofdma);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ul_ofdma_rx_mcs,
+			HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_mcs = %s ", str_buf);
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
+		ARRAY_TO_STRING(rx_gi[j], htt_stats_buf->ul_ofdma_rx_gi[j],
+				HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
+		len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_gi[%u] = %s ",
+				   j, rx_gi[j]);
+	}
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ul_ofdma_rx_nss,
+			HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_nss = %s ", str_buf);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ul_ofdma_rx_bw,
+			HTT_RX_PDEV_STATS_NUM_BW_COUNTERS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_bw = %s ", str_buf);
+
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_stbc = %u",
+			htt_stats_buf->ul_ofdma_rx_stbc);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "ul_ofdma_rx_ldpc = %u",
+			htt_stats_buf->ul_ofdma_rx_ldpc);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_ulofdma_non_data_ppdu,
+			HTT_RX_PDEV_MAX_OFDMA_NUM_USER);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_ulofdma_non_data_ppdu = %s ",
+			   str_buf);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_ulofdma_data_ppdu,
+			HTT_RX_PDEV_MAX_OFDMA_NUM_USER);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_ulofdma_data_ppdu = %s ",
+			   str_buf);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_ulofdma_mpdu_ok,
+			HTT_RX_PDEV_MAX_OFDMA_NUM_USER);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_ulofdma_mpdu_ok = %s ", str_buf);
+
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_ulofdma_mpdu_fail,
+			HTT_RX_PDEV_MAX_OFDMA_NUM_USER);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_ulofdma_mpdu_fail = %s",
+			   str_buf);
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
+		index = 0;
+		memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+		for (i = 0; i < HTT_RX_PDEV_MAX_OFDMA_NUM_USER; i++)
+			index += snprintf(&str_buf[index],
+					  HTT_MAX_STRING_LEN - index,
+					  " %u:%d,",
+					  i, htt_stats_buf->rx_ul_fd_rssi[j][i]);
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "rx_ul_fd_rssi: nss[%u] = %s", j, str_buf);
+	}
+
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "per_chain_rssi_pkt_type = %#x",
+			   htt_stats_buf->per_chain_rssi_pkt_type);
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
+		index = 0;
+		memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_COUNTERS; i++)
+			index += snprintf(&str_buf[index],
+					  HTT_MAX_STRING_LEN - index,
+					  " %u:%d,",
+					  i,
+					  htt_stats_buf->rx_per_chain_rssi_in_dbm[j][i]);
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "rx_per_chain_rssi_in_dbm[%u] = %s ", j, str_buf);
+	}
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "\n");
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3248,6 +3377,16 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 		buf[len] = 0;
 
 	stats_req->buf_len = len;
+
+fail:
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
+		kfree(rssi_chain[j]);
+
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
+		kfree(rx_pilot_evm_dB[j]);
+
+	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; i++)
+		kfree(rx_gi[i]);
 }
 
 static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index f59e002..6a8a515 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -1231,6 +1231,8 @@ struct htt_tx_pdev_rate_stats_tlv {
 #define HTT_RX_PDEV_STATS_NUM_BW_COUNTERS          4
 #define HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS      8
 #define HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
+#define HTT_RX_PDEV_MAX_OFDMA_NUM_USER             8
+#define HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS 16
 
 struct htt_rx_pdev_rate_stats_tlv {
 	u32 mac_id__word;
@@ -1269,6 +1271,46 @@ struct htt_rx_pdev_rate_stats_tlv {
 	u32 rx_legacy_ofdm_rate[HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS];
 	u32 rx_active_dur_us_low;
 	u32 rx_active_dur_us_high;
+
+	u32 rx_11ax_ul_ofdma;
+
+	u32 ul_ofdma_rx_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	u32 ul_ofdma_rx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+			  [HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	u32 ul_ofdma_rx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	u32 ul_ofdma_rx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	u32 ul_ofdma_rx_stbc;
+	u32 ul_ofdma_rx_ldpc;
+
+	/* record the stats for each user index */
+	u32 rx_ulofdma_non_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER]; /* ppdu level */
+	u32 rx_ulofdma_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* ppdu level */
+	u32 rx_ulofdma_mpdu_ok[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];       /* mpdu level */
+	u32 rx_ulofdma_mpdu_fail[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* mpdu level */
+
+	u32 nss_count;
+	u32 pilot_count;
+	/* RxEVM stats in dB */
+	s32 rx_pilot_evm_dB[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
+			   [HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS];
+	/* rx_pilot_evm_dB_mean:
+	 * EVM mean across pilots, computed as
+	 *     mean(10*log10(rx_pilot_evm_linear)) = mean(rx_pilot_evm_dB)
+	 */
+	s32 rx_pilot_evm_dB_mean[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	s8 rx_ul_fd_rssi[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
+			[HTT_RX_PDEV_MAX_OFDMA_NUM_USER]; /* dBm units */
+	/* per_chain_rssi_pkt_type:
+	 * This field shows what type of rx frame the per-chain RSSI was computed
+	 * on, by recording the frame type and sub-type as bit-fields within this
+	 * field:
+	 * BIT [3 : 0]    :- IEEE80211_FC0_TYPE
+	 * BIT [7 : 4]    :- IEEE80211_FC0_SUBTYPE
+	 * BIT [31 : 8]   :- Reserved
+	 */
+	u32 per_chain_rssi_pkt_type;
+	s8 rx_per_chain_rssi_in_dbm[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
+				   [HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
 };
 
 /* == RX PDEV/SOC STATS == */
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
