Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG3vJ-00081J-7b
 for ath11k@lists.infradead.org; Mon, 15 Apr 2019 15:53:39 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH 1/3] ath11k: Fix few coding bugs in htt stats
Date: Mon, 15 Apr 2019 21:22:47 +0530
Message-Id: <1555343569-2072-2-git-send-email-bperumal@codeaurora.org>
In-Reply-To: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
References: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
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

Identified incorrect processing of tlv buffer,
fix it by removing tlv headers from stats tlv structures.

And fix few bugs to make htt stats work,
 -Fix NULL deferences when accessing variable tlv buffers.
 -Setting correct pdev id when requesting htt stats.

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h            |   10 +-
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 1182 +++++++--------------
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  108 +-
 drivers/net/wireless/ath/ath11k/dp.h              |    1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c           |    6 +-
 drivers/net/wireless/ath/ath11k/dp_tx.h           |    3 +-
 6 files changed, 417 insertions(+), 893 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b2a3cac..c5f0a71 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -366,11 +366,15 @@ struct ath11k_fw_stats {
 	struct list_head peers_extd;
 };
 
+struct ath11k_dbg_htt_stats {
+	u8 type;
+	/* protects shared stats req buffer */
+	spinlock_t lock;
+};
+
 struct ath11k_debug {
 	struct dentry *debugfs_pdev;
-	u32 htt_stats_type;
-	/* protects shared stats req buffer */
-	spinlock_t stats_lock;
+	struct ath11k_dbg_htt_stats htt_stats;
 	u32 extd_tx_stats;
 	struct ath11k_fw_stats fw_stats;
 	struct completion fw_stats_complete;
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index bb663c5..b77dfd4 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/vmalloc.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
@@ -18,11 +19,16 @@
 
 #define HTT_TLV_HDR_LEN HTT_T2H_EXT_STATS_CONF_TLV_HDR_SIZE
 
-enum debug_htt_stats_req_state {
-	DEBUG_HTT_STATS_REQ_DONE,
-	DEBUG_HTT_STATS_REQ_INIT,
-	DEBUG_HTT_STATS_REQ_FILL,
-};
+#define ARRAY_TO_STRING(out, arr, len)							\
+	do {										\
+		int index = 0; u8 i;							\
+		for (i = 0; i < len; i++) {						\
+			index += snprintf(out + index, HTT_MAX_STRING_LEN - index,	\
+					  " %u:%u,", i, arr[i]);			\
+			if (index < 0 || index >= HTT_MAX_STRING_LEN)			\
+				break;							\
+		}									\
+	} while (0)
 
 struct debug_htt_stats_req {
 	bool done;
@@ -32,7 +38,9 @@ struct debug_htt_stats_req {
 	u8 buf[0];
 };
 
-static inline void htt_print_stats_string_tlv(const u32 *tag_buf, u8 *user_data)
+static inline void htt_print_stats_string_tlv(const u32 *tag_buf,
+					      u16 tag_len,
+					      u8 *user_data)
 {
 	struct htt_stats_string_tlv *htt_stats_buf =
 			(struct htt_stats_string_tlv *)tag_buf;
@@ -44,7 +52,8 @@ static inline void htt_print_stats_string_tlv(const u32 *tag_buf, u8 *user_data)
 	u8  i;
 	u16 index = 0;
 	char data[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+
+	tag_len = tag_len >> 2;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_STATS_STRING_TLV:");
 
@@ -52,6 +61,8 @@ static inline void htt_print_stats_string_tlv(const u32 *tag_buf, u8 *user_data)
 		index += snprintf(&data[index],
 				HTT_MAX_STRING_LEN - index,
 				"%.*s", 4, (char *)&(htt_stats_buf->data[i]));
+		if (index < 0 || index >= HTT_MAX_STRING_LEN)
+			break;
 	}
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "data = %s\n", data);
@@ -184,7 +195,9 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf,
+						      u16 tag_len,
+						      u8 *data)
 {
 	struct htt_tx_pdev_stats_urrn_tlv_v *htt_stats_buf =
 			(struct htt_tx_pdev_stats_urrn_tlv_v *)tag_buf;
@@ -193,19 +206,12 @@ static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf, u8 *da
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8  i;
-	u16 index = 0;
 	char urrn_stats[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_URRN_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_URRN_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&urrn_stats[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->urrn_stats[i]);
-	}
-
+	ARRAY_TO_STRING(urrn_stats, htt_stats_buf->urrn_stats, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "urrn_stats = %s\n", urrn_stats);
 
 	if (len >= buf_len)
@@ -216,7 +222,9 @@ static inline void htt_print_tx_pdev_stats_urrn_tlv_v(const u32 *tag_buf, u8 *da
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf,
+						       u16 tag_len,
+						       u8 *data)
 {
 	struct htt_tx_pdev_stats_flush_tlv_v *htt_stats_buf =
 			(struct htt_tx_pdev_stats_flush_tlv_v *)tag_buf;
@@ -225,19 +233,12 @@ static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf, u8 *d
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8  i;
-	u16 index = 0;
 	char flush_errs[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_FLUSH_REASON_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_FLUSH_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&flush_errs[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->flush_errs[i]);
-	}
-
+	ARRAY_TO_STRING(flush_errs, htt_stats_buf->flush_errs, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "flush_errs = %s\n", flush_errs);
 
 	if (len >= buf_len)
@@ -248,7 +249,9 @@ static inline void htt_print_tx_pdev_stats_flush_tlv_v(const u32 *tag_buf, u8 *d
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf,
+						      u16 tag_len,
+						      u8 *data)
 {
 	struct htt_tx_pdev_stats_sifs_tlv_v *htt_stats_buf =
 			(struct htt_tx_pdev_stats_sifs_tlv_v *)tag_buf;
@@ -257,19 +260,12 @@ static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf, u8 *da
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sifs_status[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_SIFS_BURST_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_SIFS_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&sifs_status[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->sifs_status[i]);
-	}
-
+	ARRAY_TO_STRING(sifs_status, htt_stats_buf->sifs_status, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sifs_status = %s\n",
 			   sifs_status);
 
@@ -281,7 +277,9 @@ static inline void htt_print_tx_pdev_stats_sifs_tlv_v(const u32 *tag_buf, u8 *da
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf,
+							 u16 tag_len,
+							 u8 *data)
 {
 	struct htt_tx_pdev_stats_phy_err_tlv_v *htt_stats_buf =
 			(struct htt_tx_pdev_stats_phy_err_tlv_v *)tag_buf;
@@ -290,19 +288,12 @@ static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf, u8
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char phy_errs[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_PHY_ERR_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_PHY_ERR_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&phy_errs[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->phy_errs[i]);
-	}
-
+	ARRAY_TO_STRING(phy_errs, htt_stats_buf->phy_errs, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "phy_errs = %s\n", phy_errs);
 
 	if (len >= buf_len)
@@ -314,6 +305,7 @@ static inline void htt_print_tx_pdev_stats_phy_err_tlv_v(const u32 *tag_buf, u8
 }
 
 static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const u32 *tag_buf,
+							   u16 tag_len,
 							   u8 *data)
 {
 	struct htt_tx_pdev_stats_sifs_hist_tlv_v *htt_stats_buf =
@@ -323,20 +315,12 @@ static inline void htt_print_tx_pdev_stats_sifs_hist_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sifs_hist_status[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_MAX_SIFS_BURST_HIST_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_SIFS_HIST_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&sifs_hist_status[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i + 1,
-				  htt_stats_buf->sifs_hist_status[i]);
-	}
-
+	ARRAY_TO_STRING(sifs_hist_status, htt_stats_buf->sifs_hist_status, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sifs_hist_status = %s\n",
 			   sifs_hist_status);
 
@@ -385,7 +369,9 @@ static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const u32 *tag_bu
 }
 
 static inline void
-htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf, u8 *data)
+htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
+						  u16 tag_len,
+						  u8 *data)
 {
 	struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf =
 		(struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v *)tag_buf;
@@ -394,23 +380,18 @@ static inline void htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const u32 *tag_bu
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char tried_mpdu_cnt_hist[HTT_MAX_STRING_LEN] = {0};
-	u32  num_elements = ((FIELD_GET(HTT_TLV_LEN, *tag_buf) -
-			    sizeof(htt_stats_buf->hist_bin_size)) >> 2);
+	u32  num_elements = ((tag_len - sizeof(htt_stats_buf->hist_bin_size)) >> 2);
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_TRIED_MPDU_CNT_HIST_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u",
 			   htt_stats_buf->hist_bin_size);
+
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
-		for (i = 0; i < num_elements; i++) {
-			index += snprintf(&tried_mpdu_cnt_hist[index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->tried_mpdu_cnt_hist[i]);
-		}
+		ARRAY_TO_STRING(tried_mpdu_cnt_hist,
+				htt_stats_buf->tried_mpdu_cnt_hist,
+				num_elements);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "tried_mpdu_cnt_hist = %s\n",
 				   tried_mpdu_cnt_hist);
 	} else {
@@ -722,18 +703,13 @@ static inline void htt_print_counter_tlv(const u32 *tag_buf, u8 *data)
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index                            = 0;
 	char counter_name[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_COUNTER_TLV:");
 
-	for (i = 0; i < HTT_MAX_COUNTER_NAME; i++) {
-		index += snprintf(&counter_name[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->counter_name[i]);
-	}
-
+	ARRAY_TO_STRING(counter_name,
+			htt_stats_buf->counter_name,
+			HTT_MAX_COUNTER_NAME);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "counter_name = %s ", counter_name);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "count = %u\n",
 			   htt_stats_buf->count);
@@ -844,13 +820,12 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i, j;
-	u16 index = 0;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS] = {0};
+	u8 j;
 
-	for (i = 0; i < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		tx_gi[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		tx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PEER_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_ldpc = %u",
@@ -860,96 +835,59 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ack_rssi = %u",
 			   htt_stats_buf->ack_rssi);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++) {
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_mcs[i]);
-	}
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_su_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_su_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_su_mcs = %s ", str_buf);
-	index = 0;
-	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_mu_mcs[i]);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_mu_mcs = %s ", str_buf);
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_mu_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_mu_mcs = %s ", str_buf);
 
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_nss[i]);
-
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_nss = %s ", str_buf);
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf,
+			htt_stats_buf->tx_nss,
+			HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_nss = %s ", str_buf);
 
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_bw[i]);
-
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_bw = %s ", str_buf);
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf,
+			htt_stats_buf->tx_bw,
+			HTT_TX_PDEV_STATS_NUM_BW_COUNTERS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_bw = %s ", str_buf);
 
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_stbc[i]);
-
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_stbc = %s ", str_buf);
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_stbc,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_stbc = %s ", str_buf);
 
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_pream[i]);
-
+	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_pream,
+			HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_pream = %s ", str_buf);
 
 	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_TX_PEER_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&tx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->tx_gi[j][i]);
-
+		ARRAY_TO_STRING(tx_gi[j],
+				htt_stats_buf->tx_gi[j],
+				HTT_TX_PEER_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_gi[%u] = %s ",
-				   j, tx_gi[j]);
+				j, tx_gi[j]);
 	}
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_dcm[i]);
-
+	ARRAY_TO_STRING(str_buf,
+			htt_stats_buf->tx_dcm,
+			HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_dcm = %s\n", str_buf);
 
-	for (i = 0; i < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		kfree(tx_gi[i]);
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(tx_gi[j]);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -968,17 +906,16 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i, j;
-	u16 index;
+	u8 j;
 	char *rssi_chain[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS];
 	char *rx_gi[HTT_RX_PEER_STATS_NUM_GI_COUNTERS];
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 
-	for (i = 0; i < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; i++)
-		rssi_chain[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++)
+		rssi_chain[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
-	for (i = 0; i < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		rx_gi[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		rx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PEER_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "nsts = %u",
@@ -994,99 +931,55 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rssi_comb = %u",
 			   htt_stats_buf->rssi_comb);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_mcs,
+			HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_nss,
+			HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_dcm[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_dcm,
+			HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_dcm = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_stbc[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_stbc,
+			HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_stbc = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_bw,
+			HTT_RX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_bw = %s ", str_buf);
 
 	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++) {
-		memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-		index = 0;
-
-		for (i = 0; i < HTT_RX_PEER_STATS_NUM_BW_COUNTERS; i++)
-			index += snprintf(&rssi_chain[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->rssi_chain[j][i]);
-
+		ARRAY_TO_STRING(rssi_chain[j], htt_stats_buf->rssi_chain[j],
+				HTT_RX_PEER_STATS_NUM_BW_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "rssi_chain[%u] = %s ",
 				   j, rssi_chain[j]);
 	}
 
 	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&rx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->rx_gi[j][i]);
-
+		ARRAY_TO_STRING(rx_gi[j], htt_stats_buf->rx_gi[j],
+				HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_gi[%u] = %s ",
-				   j, rx_gi[j]);
+				j, rx_gi[j]);
 	}
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES; i++) {
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_pream[i]);
-	}
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_pream,
+			HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_pream = %s\n", str_buf);
 
-	for (i = 0; i < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; i++)
-		kfree(rssi_chain[i]);
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS; j++)
+		kfree(rssi_chain[j]);
 
-	for (i = 0; i < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		kfree(rx_gi[i]);
+	for (j = 0; j < HTT_RX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(rx_gi[j]);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1248,6 +1141,7 @@ static inline void htt_print_tx_hwq_stats_cmn_tlv(const u32 *tag_buf, u8 *data)
 }
 
 static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
+							     u16 tag_len,
 							     u8 *data)
 {
 	struct htt_tx_hwq_difs_latency_stats_tlv_v *htt_stats_buf =
@@ -1257,24 +1151,17 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
+	u16 data_len = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS);
 	char difs_latency_hist[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_DIFS_LATENCY_STATS_TLV_V:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "hist_intvl = %u",
 			htt_stats_buf->hist_intvl);
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&difs_latency_hist[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->difs_latency_hist[i]);
-	}
-
+	ARRAY_TO_STRING(difs_latency_hist, htt_stats_buf->difs_latency_hist,
+			data_len);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "difs_latency_hist = %s\n",
-			   difs_latency_hist);
+			difs_latency_hist);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1285,6 +1172,7 @@ static inline void htt_print_tx_hwq_difs_latency_stats_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
+							   u16 tag_len,
 							   u8 *data)
 {
 	struct htt_tx_hwq_cmd_result_stats_tlv_v *htt_stats_buf =
@@ -1294,18 +1182,14 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
+	u16 data_len;
 	char cmd_result[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+
+	data_len = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_CMD_RESULT_STATS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_CMD_RESULT_STATS_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&cmd_result[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->cmd_result[i]);
-	}
+	ARRAY_TO_STRING(cmd_result, htt_stats_buf->cmd_result, data_len);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "cmd_result = %s\n", cmd_result);
 
@@ -1318,6 +1202,7 @@ static inline void htt_print_tx_hwq_cmd_result_stats_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const u32 *tag_buf,
+							  u16 tag_len,
 							  u8 *data)
 {
 	struct htt_tx_hwq_cmd_stall_stats_tlv_v *htt_stats_buf =
@@ -1327,20 +1212,14 @@ static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
+	u16 num_elems;
 	char cmd_stall_status[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_CMD_STALL_STATS_TLV_V:");
+	num_elems = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_CMD_STALL_STATS);
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&cmd_stall_status[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->cmd_stall_status[i]);
-	}
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_CMD_STALL_STATS_TLV_V:");
 
+	ARRAY_TO_STRING(cmd_stall_status, htt_stats_buf->cmd_stall_status, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "cmd_stall_status = %s\n",
 			   cmd_stall_status);
 
@@ -1352,7 +1231,9 @@ static inline void htt_print_tx_hwq_cmd_stall_stats_tlv_v(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf,
+							   u16 tag_len,
+							   u8 *data)
 {
 	struct htt_tx_hwq_fes_result_stats_tlv_v *htt_stats_buf =
 			(struct htt_tx_hwq_fes_result_stats_tlv_v *)tag_buf;
@@ -1361,19 +1242,14 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf, u
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index                          = 0;
+	u16 num_elems;
 	char fes_result[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len                        = FIELD_GET(HTT_TLV_LEN, *tag_buf);
 
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_FES_RESULT_STATS_TLV_V:");
+	num_elems = min_t(u16, (tag_len >> 2), HTT_TX_HWQ_MAX_FES_RESULT_STATS);
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&fes_result[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->fes_result[i]);
-	}
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_FES_RESULT_STATS_TLV_V:");
 
+	ARRAY_TO_STRING(fes_result, htt_stats_buf->fes_result, num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fes_result = %s\n", fes_result);
 
 	if (len >= buf_len)
@@ -1385,6 +1261,7 @@ static inline void htt_print_tx_hwq_fes_result_stats_tlv_v(const u32 *tag_buf, u
 }
 
 static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf,
+							      u16 tag_len,
 							      u8 *data)
 {
 	struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v *htt_stats_buf =
@@ -1394,10 +1271,8 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char tried_mpdu_cnt_hist[HTT_MAX_STRING_LEN] = {0};
-	u32  num_elements = ((FIELD_GET(HTT_TLV_LEN, *tag_buf) -
+	u32  num_elements = ((tag_len -
 			    sizeof(htt_stats_buf->hist_bin_size)) >> 2);
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
@@ -1406,13 +1281,9 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 			   htt_stats_buf->hist_bin_size);
 
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
-		for (i = 0; i < num_elements; i++) {
-			index += snprintf(&tried_mpdu_cnt_hist[index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,",
-					  i,
-					  htt_stats_buf->tried_mpdu_cnt_hist[i]);
-		}
+		ARRAY_TO_STRING(tried_mpdu_cnt_hist,
+				htt_stats_buf->tried_mpdu_cnt_hist,
+				num_elements);
 		len += HTT_DBG_OUT(buf + len, buf_len - len,
 				   "tried_mpdu_cnt_hist = %s\n",
 				   tried_mpdu_cnt_hist);
@@ -1429,6 +1300,7 @@ static inline void htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const u32 *tag_buf
 }
 
 static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
+							     u16 tag_len,
 							     u8 *data)
 {
 	struct htt_tx_hwq_txop_used_cnt_hist_tlv_v *htt_stats_buf =
@@ -1438,21 +1310,16 @@ static inline void htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char txop_used_cnt_hist[HTT_MAX_STRING_LEN] = {0};
-	u32 num_elements = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u32 num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_HWQ_TXOP_USED_CNT_HIST_TLV_V:");
 
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
-		for (i = 0; i < num_elements; i++) {
-			index += snprintf(&txop_used_cnt_hist[index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->txop_used_cnt_hist[i]);
-		}
+		ARRAY_TO_STRING(txop_used_cnt_hist,
+				htt_stats_buf->txop_used_cnt_hist,
+				num_elements);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "txop_used_cnt_hist = %s\n",
 				   txop_used_cnt_hist);
 	} else {
@@ -1932,7 +1799,9 @@ static inline void htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf,
+							u16 tag_len,
+							u8 *data)
 {
 	struct htt_sched_txq_cmd_posted_tlv_v *htt_stats_buf =
 			(struct htt_sched_txq_cmd_posted_tlv_v *)tag_buf;
@@ -1941,20 +1810,13 @@ static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf, u8 *
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sched_cmd_posted[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elements = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_SCHED_TX_MODE_MAX);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_CMD_POSTED_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&sched_cmd_posted[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->sched_cmd_posted[i]);
-	}
-
+	ARRAY_TO_STRING(sched_cmd_posted, htt_stats_buf->sched_cmd_posted,
+			num_elements);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_cmd_posted = %s\n",
 			   sched_cmd_posted);
 
@@ -1966,7 +1828,9 @@ static inline void htt_print_sched_txq_cmd_posted_tlv_v(const u32 *tag_buf, u8 *
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf,
+							u16 tag_len,
+							u8 *data)
 {
 	struct htt_sched_txq_cmd_reaped_tlv_v *htt_stats_buf =
 			(struct htt_sched_txq_cmd_reaped_tlv_v *)tag_buf;
@@ -1975,20 +1839,13 @@ static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf, u8 *
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sched_cmd_reaped[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elements = min_t(u16, (tag_len >> 2), HTT_TX_PDEV_SCHED_TX_MODE_MAX);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_CMD_REAPED_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&sched_cmd_reaped[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->sched_cmd_reaped[i]);
-	}
-
+	ARRAY_TO_STRING(sched_cmd_reaped, htt_stats_buf->sched_cmd_reaped,
+			num_elements);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_cmd_reaped = %s\n",
 			   sched_cmd_reaped);
 
@@ -2001,6 +1858,7 @@ static inline void htt_print_sched_txq_cmd_reaped_tlv_v(const u32 *tag_buf, u8 *
 }
 
 static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
+							    u16 tag_len,
 							    u8 *data)
 {
 	struct htt_sched_txq_sched_order_su_tlv_v *htt_stats_buf =
@@ -2010,27 +1868,15 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sched_order_su[HTT_MAX_STRING_LEN] = {0};
 	/* each entry is u32, i.e. 4 bytes */
-	u32 sched_order_su_num_entries = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u32 sched_order_su_num_entries =
+		min_t(u32, (tag_len >> 2), HTT_TX_PDEV_NUM_SCHED_ORDER_LOG);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_SCHED_ORDER_SU_TLV_V:");
 
-	for (i = 0; i < sched_order_su_num_entries ; i++) {
-		index += snprintf(&sched_order_su[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->sched_order_su[i]);
-
-		/* Only process the next array element if there's enough space within
-		 * the print buffer to hold the entire array element printout.
-		 */
-		if (index >= (HTT_MAX_STRING_LEN - HTT_MAX_PRINT_CHAR_PER_ELEM))
-			break;
-	}
-
+	ARRAY_TO_STRING(sched_order_su, htt_stats_buf->sched_order_su,
+			sched_order_su_num_entries);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_order_su = %s\n",
 			   sched_order_su);
 
@@ -2043,6 +1889,7 @@ static inline void htt_print_sched_txq_sched_order_su_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const u32 *tag_buf,
+								 u16 tag_len,
 								 u8 *data)
 {
 	struct htt_sched_txq_sched_ineligibility_tlv_v *htt_stats_buf =
@@ -2052,28 +1899,14 @@ static inline void htt_print_sched_txq_sched_ineligibility_tlv_v(const u32 *tag_
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u8 i;
-	u16 index = 0;
 	char sched_ineligibility[HTT_MAX_STRING_LEN] = {0};
 	/* each entry is u32, i.e. 4 bytes */
-	u32 sched_ineligibility_num_entries = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u32 sched_ineligibility_num_entries = tag_len >> 2;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SCHED_TXQ_SCHED_INELIGIBILITY_V:");
 
-	for (i = 0; i < sched_ineligibility_num_entries &&
-	     index < HTT_MAX_STRING_LEN; i++) {
-		index += snprintf(&sched_ineligibility[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->sched_ineligibility[i]);
-
-		/* Only process the next array element if there's enough space within
-		 * the print buffer to hold the entire array element printout.
-		 */
-		if (index >= (HTT_MAX_STRING_LEN - HTT_MAX_PRINT_CHAR_PER_ELEM))
-			break;
-	}
-
+	ARRAY_TO_STRING(sched_ineligibility, htt_stats_buf->sched_ineligibility,
+			sched_ineligibility_num_entries);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "sched_ineligibility = %s\n",
 			   sched_ineligibility);
 
@@ -2175,7 +2008,9 @@ static inline void htt_print_stats_tx_sched_cmn_tlv(const u32 *tag_buf,
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf,
+							 u16 tag_len,
+							 u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
 			(struct debug_htt_stats_req *)data;
@@ -2184,20 +2019,13 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf, u8
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_tx_tqm_gen_mpdu_stats_tlv_v *htt_stats_buf =
 		(struct htt_tx_tqm_gen_mpdu_stats_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char gen_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elements = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_GEN_MPDU_STATS_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&gen_mpdu_end_reason[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->gen_mpdu_end_reason[i]);
-	}
-
+	ARRAY_TO_STRING(gen_mpdu_end_reason, htt_stats_buf->gen_mpdu_end_reason,
+			num_elements);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "gen_mpdu_end_reason = %s\n",
 			   gen_mpdu_end_reason);
 
@@ -2209,7 +2037,9 @@ static inline void htt_print_tx_tqm_gen_mpdu_stats_tlv_v(const u32 *tag_buf, u8
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf,
+							  u16 tag_len,
+							  u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
 			(struct debug_htt_stats_req *)data;
@@ -2218,20 +2048,13 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf, u8
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_tx_tqm_list_mpdu_stats_tlv_v *htt_stats_buf =
 		(struct htt_tx_tqm_list_mpdu_stats_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char list_mpdu_end_reason[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_LIST_MPDU_STATS_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&list_mpdu_end_reason[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->list_mpdu_end_reason[i]);
-	}
-
+	ARRAY_TO_STRING(list_mpdu_end_reason, htt_stats_buf->list_mpdu_end_reason,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "list_mpdu_end_reason = %s\n",
 			   list_mpdu_end_reason);
 	if (len >= buf_len)
@@ -2243,6 +2066,7 @@ static inline void htt_print_tx_tqm_list_mpdu_stats_tlv_v(const u32 *tag_buf, u8
 }
 
 static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const u32 *tag_buf,
+							u16 tag_len,
 							u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
@@ -2252,20 +2076,14 @@ static inline void htt_print_tx_tqm_list_mpdu_cnt_tlv_v(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_tx_tqm_list_mpdu_cnt_tlv_v *htt_stats_buf =
 		(struct htt_tx_tqm_list_mpdu_cnt_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char list_mpdu_cnt_hist[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2),
+			      HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_TQM_LIST_MPDU_CNT_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&list_mpdu_cnt_hist[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->list_mpdu_cnt_hist[i]);
-	}
-
+	ARRAY_TO_STRING(list_mpdu_cnt_hist, htt_stats_buf->list_mpdu_cnt_hist,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "list_mpdu_cnt_hist = %s\n",
 			   list_mpdu_cnt_hist);
 
@@ -2749,7 +2567,9 @@ static inline void htt_print_tx_de_compl_stats_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf, u8 *data)
+static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf,
+							     u16 tag_len,
+							     u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
 			(struct debug_htt_stats_req *)data;
@@ -2758,20 +2578,16 @@ static inline void htt_print_tx_de_fw2wbm_ring_full_hist_tlv(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_tx_de_fw2wbm_ring_full_hist_tlv *htt_stats_buf =
 		(struct htt_tx_de_fw2wbm_ring_full_hist_tlv *)tag_buf;
-	u8 i;
-	u16 index                                  = 0;
 	char fw2wbm_ring_full_hist[HTT_MAX_STRING_LEN] = {0};
-	u32  num_elements = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16  num_elements = tag_len >> 2;
 	u32  required_buffer_size = HTT_MAX_PRINT_CHAR_PER_ELEM * num_elements;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_DE_FW2WBM_RING_FULL_HIST_TLV");
+
 	if (required_buffer_size < HTT_MAX_STRING_LEN) {
-		for (i = 0; i < num_elements; i++) {
-			index += snprintf(&fw2wbm_ring_full_hist[index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->fw2wbm_ring_full_hist[i]);
-		}
+		ARRAY_TO_STRING(fw2wbm_ring_full_hist,
+				htt_stats_buf->fw2wbm_ring_full_hist,
+				num_elements);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "fw2wbm_ring_full_hist = %s\n",
 				   fw2wbm_ring_full_hist);
 	} else {
@@ -2829,8 +2645,6 @@ static inline void htt_print_ring_if_stats_tlv(const u32 *tag_buf, u8 *data)
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_ring_if_stats_tlv *htt_stats_buf =
 		(struct htt_ring_if_stats_tlv *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char low_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 	char high_wm_hit_count[HTT_MAX_STRING_LEN] = {0};
 
@@ -2868,25 +2682,13 @@ static inline void htt_print_ring_if_stats_tlv(const u32 *tag_buf, u8 *data)
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "cons_blockwait_count = %u",
 			   htt_stats_buf->cons_blockwait_count);
 
-	for (i = 0; i < HTT_STATS_LOW_WM_BINS; i++) {
-		index += snprintf(&low_wm_hit_count[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->low_wm_hit_count[i]);
-	}
-
+	ARRAY_TO_STRING(low_wm_hit_count, htt_stats_buf->low_wm_hit_count,
+			HTT_STATS_LOW_WM_BINS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "low_wm_hit_count = %s ",
 			   low_wm_hit_count);
 
-	index = 0;
-
-	for (i = 0; i < HTT_STATS_HIGH_WM_BINS; i++) {
-		index += snprintf(&high_wm_hit_count[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->high_wm_hit_count[i]);
-	}
-
+	ARRAY_TO_STRING(high_wm_hit_count, htt_stats_buf->high_wm_hit_count,
+			HTT_STATS_HIGH_WM_BINS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "high_wm_hit_count = %s\n",
 			   high_wm_hit_count);
 
@@ -2922,7 +2724,9 @@ static inline void htt_print_ring_if_cmn_tlv(const u32 *tag_buf, u8 *data)
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_sfm_client_user_tlv_v(const u32 *tag_buf, u8 *data)
+static inline void htt_print_sfm_client_user_tlv_v(const u32 *tag_buf,
+						   u16 tag_len,
+						   u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
 			(struct debug_htt_stats_req *)data;
@@ -2931,21 +2735,16 @@ static inline void htt_print_sfm_client_user_tlv_v(const u32 *tag_buf, u8 *data)
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_sfm_client_user_tlv_v *htt_stats_buf =
 		(struct htt_sfm_client_user_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char dwords_used_by_user_n[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = tag_len >> 2;
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_SFM_CLIENT_USER_TLV_V:");
 
-	for (i = 0; i < tag_len; i++)
-		index += snprintf(&dwords_used_by_user_n[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->dwords_used_by_user_n[i]);
-
+	ARRAY_TO_STRING(dwords_used_by_user_n,
+			htt_stats_buf->dwords_used_by_user_n,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "dwords_used_by_user_n = %s\n",
-			dwords_used_by_user_n);
+			   dwords_used_by_user_n);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3105,13 +2904,12 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_tx_pdev_rate_stats_tlv *htt_stats_buf =
 		(struct htt_tx_pdev_rate_stats_tlv *)tag_buf;
-	u8 i, j;
-	u16 index = 0;
+	u8 j;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
 
-	for (i = 0; i < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		tx_gi[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		tx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_TX_PDEV_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3131,14 +2929,6 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ack_rssi = %u",
 			   htt_stats_buf->ack_rssi);
 
-	index = 0;
-	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_mcs[i]);
-
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "Legacy CCK Rates: 1 Mbps: %u, 2 Mbps: %u, 5.5 Mbps: %u, 11 Mbps: %u",
 			   htt_stats_buf->tx_legacy_cck_rate[0],
 			   htt_stats_buf->tx_legacy_cck_rate[1],
@@ -3156,144 +2946,74 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			   htt_stats_buf->tx_legacy_ofdm_rate[6],
 			   htt_stats_buf->tx_legacy_ofdm_rate[7]);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ac_mu_mimo_tx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ac_mu_mimo_tx_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_tx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ax_mu_mimo_tx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ax_mu_mimo_tx_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_tx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ofdma_tx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ofdma_tx_mcs,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofdma_tx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_nss,
+			HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ac_mu_mimo_tx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ac_mu_mimo_tx_nss,
+			HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_tx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ax_mu_mimo_tx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ax_mu_mimo_tx_nss,
+			HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_tx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ofdma_tx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ofdma_tx_nss,
+			HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofdma_tx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_bw,
+			HTT_TX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_bw = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ac_mu_mimo_tx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ac_mu_mimo_tx_bw,
+			HTT_TX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_tx_bw = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ax_mu_mimo_tx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ax_mu_mimo_tx_bw,
+			HTT_TX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_tx_bw = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->ofdma_tx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->ofdma_tx_bw,
+			HTT_TX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "ofdma_tx_bw = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_stbc[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_stbc,
+			HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_stbc = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_pream[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_pream,
+			HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_pream = %s ", str_buf);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HE LTF: 1x: %u, 2x: %u, 4x: %u",
@@ -3303,72 +3023,43 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 
 	/* SU GI Stats */
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&tx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->tx_gi[j][i]);
-
+		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->tx_gi[j],
+				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
 	/* AC MU-MIMO GI Stats */
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&tx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->ac_mu_mimo_tx_gi[j][i]);
-
+		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->ac_mu_mimo_tx_gi[j],
+				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "ac_mu_mimo_tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
 	/* AX MU-MIMO GI Stats */
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&tx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->ax_mu_mimo_tx_gi[j][i]);
-
+		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->ax_mu_mimo_tx_gi[j],
+				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "ax_mu_mimo_tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
 	/* DL OFDMA GI Stats */
 	for (j = 0; j < HTT_TX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&tx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->ofdma_tx_gi[j][i]);
-
+		ARRAY_TO_STRING(tx_gi[j], htt_stats_buf->ofdma_tx_gi[j],
+				HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "ofdma_tx_gi[%u] = %s ",
 				   j, tx_gi[j]);
 	}
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->tx_dcm[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->tx_dcm,
+			HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_dcm = %s\n", str_buf);
 
-	for (i = 0; i < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; i++)
-		kfree(tx_gi[i]);
+	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
+		kfree(tx_gi[j]);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3387,17 +3078,16 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_rate_stats_tlv *htt_stats_buf =
 		(struct htt_rx_pdev_rate_stats_tlv *)tag_buf;
-	u8 i, j;
-	u16 index = 0;
+	u8 j;
 	char *rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	char *rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS];
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
 
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		rssi_chain[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
+		rssi_chain[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; i++)
-		rx_gi[i] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++)
+		rx_gi[j] = kmalloc(HTT_MAX_STRING_LEN, GFP_ATOMIC);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_RATE_STATS_TLV:");
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mac_id = %u",
@@ -3418,95 +3108,54 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 			   htt_stats_buf->rssi_in_dbm);
 
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_mcs[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_mcs,
+			HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_mcs = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_nss[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_nss,
+			HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_nss = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_dcm[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_dcm,
+			HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_dcm = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_stbc[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_stbc,
+			HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_stbc = %s ", str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_bw[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_bw,
+			HTT_RX_PDEV_STATS_NUM_BW_COUNTERS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_bw = %s ", str_buf);
 
 	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-			index += snprintf(&rssi_chain[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->rssi_chain[j][i]);
-
+		ARRAY_TO_STRING(rssi_chain[j], htt_stats_buf->rssi_chain[j],
+				HTT_RX_PDEV_STATS_NUM_BW_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "rssi_chain[%u] = %s ",
 				   j, rssi_chain[j]);
 	}
 
 	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
-		index = 0;
-
-		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS; i++)
-			index += snprintf(&rx_gi[j][index],
-					  HTT_MAX_STRING_LEN - index,
-					  " %u:%u,", i,
-					  htt_stats_buf->rx_gi[j][i]);
-
+		ARRAY_TO_STRING(rx_gi[j], htt_stats_buf->rx_gi[j],
+				HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS);
 		len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_gi[%u] = %s ",
 				   j, rx_gi[j]);
 	}
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_pream[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_pream,
+			HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_pream = %s", str_buf);
 
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		kfree(rssi_chain[i]);
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++)
+		kfree(rssi_chain[j]);
 
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; i++)
-		kfree(rx_gi[i]);
+	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++)
+		kfree(rx_gi[j]);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_11ax_su_ext = %u",
 			   htt_stats_buf->rx_11ax_su_ext);
@@ -3519,25 +3168,15 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "txbf = %u",
 			   htt_stats_buf->txbf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_legacy_cck_rate[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_legacy_cck_rate,
+			HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_legacy_cck_rate = %s ",
 			   str_buf);
 
-	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
-
-	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS; i++)
-		index += snprintf(&str_buf[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->rx_legacy_ofdm_rate[i]);
-
+	ARRAY_TO_STRING(str_buf, htt_stats_buf->rx_legacy_ofdm_rate,
+			HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rx_legacy_ofdm_rate = %s ",
 			   str_buf);
 
@@ -3597,6 +3236,7 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const u32 *tag_buf, u8 *data)
 }
 
 static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_buf,
+							       u16 tag_len,
 							       u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
@@ -3606,19 +3246,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_bu
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_soc_fw_refill_ring_empty_tlv_v *htt_stats_buf =
 			(struct htt_rx_soc_fw_refill_ring_empty_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char refill_ring_empty_cnt[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV_V:");
 
-	for (i = 0; i < tag_len; i++)
-		index += snprintf(&refill_ring_empty_cnt[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->refill_ring_empty_cnt[i]);
-
+	ARRAY_TO_STRING(refill_ring_empty_cnt,
+			htt_stats_buf->refill_ring_empty_cnt,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "refill_ring_empty_cnt = %s\n",
 			   refill_ring_empty_cnt);
 
@@ -3630,8 +3265,10 @@ static inline void htt_print_rx_soc_fw_refill_ring_empty_tlv_v(const u32 *tag_bu
 	stats_req->buf_len = len;
 }
 
-static inline void htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32 *tag_buf,
-								       u8 *data)
+static inline void
+htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32 *tag_buf,
+						    u16 tag_len,
+						    u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
 			(struct debug_htt_stats_req *)data;
@@ -3640,20 +3277,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *htt_stats_buf =
 			(struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char rxdma_err_cnt[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_RXDMA_MAX_ERR_CODE);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&rxdma_err_cnt[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->rxdma_err[i]);
-	}
-
+	ARRAY_TO_STRING(rxdma_err_cnt,
+			htt_stats_buf->rxdma_err,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "rxdma_err = %s\n",
 			   rxdma_err_cnt);
 
@@ -3666,6 +3297,7 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(const u32
 }
 
 static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const u32 *tag_buf,
+								     u16 tag_len,
 								     u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
@@ -3675,20 +3307,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(const u32 *
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *htt_stats_buf =
 			(struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char reo_err_cnt[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_REO_MAX_ERR_CODE);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&reo_err_cnt[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->reo_err[i]);
-	}
-
+	ARRAY_TO_STRING(reo_err_cnt,
+			htt_stats_buf->reo_err,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "reo_err = %s\n",
 			   reo_err_cnt);
 
@@ -3742,6 +3368,7 @@ static inline void htt_print_rx_reo_debug_stats_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const u32 *tag_buf,
+								    u16 tag_len,
 								    u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
@@ -3751,20 +3378,14 @@ static inline void htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(const u32 *t
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *htt_stats_buf =
 			(struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char refill_ring_num_refill[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_REFILL_MAX_RING);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&refill_ring_num_refill[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->refill_ring_num_refill[i]);
-	}
-
+	ARRAY_TO_STRING(refill_ring_num_refill,
+			htt_stats_buf->refill_ring_num_refill,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "refill_ring_num_refill = %s\n",
 			   refill_ring_num_refill);
 
@@ -3786,8 +3407,6 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf =
 		(struct htt_rx_pdev_fw_stats_tlv *)tag_buf;
-	u8 i;
-	u16 index = 0;
 	char fw_ring_mgmt_subtype[HTT_MAX_STRING_LEN] = {0};
 	char fw_ring_ctrl_subtype[HTT_MAX_STRING_LEN] = {0};
 
@@ -3811,25 +3430,16 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_mpdu_ind = %u",
 			   htt_stats_buf->fw_ring_mpdu_ind);
 
-	for (i = 0; i < HTT_STATS_SUBTYPE_MAX; i++) {
-		index += snprintf(&fw_ring_mgmt_subtype[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->fw_ring_mgmt_subtype[i]);
-	}
-
+	ARRAY_TO_STRING(fw_ring_mgmt_subtype,
+			htt_stats_buf->fw_ring_mgmt_subtype,
+			HTT_STATS_SUBTYPE_MAX);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_mgmt_subtype = %s ",
 			   fw_ring_mgmt_subtype);
 
-	index = 0;
-
-	for (i = 0; i < HTT_STATS_SUBTYPE_MAX; i++) {
-		index += snprintf(&fw_ring_ctrl_subtype[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->fw_ring_ctrl_subtype[i]);
-	}
 
+	ARRAY_TO_STRING(fw_ring_ctrl_subtype,
+			htt_stats_buf->fw_ring_ctrl_subtype,
+			HTT_STATS_SUBTYPE_MAX);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_ctrl_subtype = %s ",
 			   fw_ring_ctrl_subtype);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_mcast_data_msdu = %u",
@@ -3921,19 +3531,13 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *htt_stats_buf =
 		(struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v *)tag_buf;
-	u8 i;
-	u16 index                                = 0;
 	char fw_ring_mpdu_err[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV_V:");
 
-	for (i = 0; i < HTT_RX_STATS_RXDMA_MAX_ERR; i++) {
-		index += snprintf(&fw_ring_mpdu_err[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i,
-				  htt_stats_buf->fw_ring_mpdu_err[i]);
-	}
-
+	ARRAY_TO_STRING(fw_ring_mpdu_err,
+			htt_stats_buf->fw_ring_mpdu_err,
+			HTT_RX_STATS_RXDMA_MAX_ERR);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_ring_mpdu_err = %s\n",
 			   fw_ring_mpdu_err);
 
@@ -3946,6 +3550,7 @@ static inline void htt_print_rx_pdev_fw_ring_mpdu_err_tlv_v(const u32 *tag_buf,
 }
 
 static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const u32 *tag_buf,
+							u16 tag_len,
 							u8 *data)
 {
 	struct debug_htt_stats_req *stats_req =
@@ -3955,19 +3560,14 @@ static inline void htt_print_rx_pdev_fw_mpdu_drop_tlv_v(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_fw_mpdu_drop_tlv_v *htt_stats_buf =
 		(struct htt_rx_pdev_fw_mpdu_drop_tlv_v *)tag_buf;
-	u8 i;
-	u16 index                            = 0;
 	char fw_mpdu_drop[HTT_MAX_STRING_LEN] = {0};
-	u32 tag_len                          = FIELD_GET(HTT_TLV_LEN, *tag_buf);
+	u16 num_elems = min_t(u16, (tag_len >> 2), HTT_RX_STATS_FW_DROP_REASON_MAX);
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_MPDU_DROP_TLV_V:");
 
-	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&fw_mpdu_drop[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->fw_mpdu_drop[i]);
-	}
-
+	ARRAY_TO_STRING(fw_mpdu_drop,
+			htt_stats_buf->fw_mpdu_drop,
+			num_elems);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "fw_mpdu_drop = %s\n", fw_mpdu_drop);
 
 	if (len >= buf_len)
@@ -3988,8 +3588,6 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	struct htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf =
 		(struct htt_rx_pdev_fw_stats_phy_err_tlv *)tag_buf;
-	u8 i;
-	u16 index                        = 0;
 	char phy_errs[HTT_MAX_STRING_LEN] = {0};
 
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:");
@@ -3998,12 +3596,9 @@ static inline void htt_print_rx_pdev_fw_stats_phy_err_tlv(const u32 *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tota_phy_err_nct = %u",
 			   htt_stats_buf->total_phy_err_cnt);
 
-	for (i = 0; i < HTT_STATS_PHY_ERR_MAX; i++) {
-		index += snprintf(&phy_errs[index],
-				  HTT_MAX_STRING_LEN - index,
-				  " %u:%u,", i, htt_stats_buf->phy_err[i]);
-	}
-
+	ARRAY_TO_STRING(phy_errs,
+			htt_stats_buf->phy_err,
+			HTT_STATS_PHY_ERR_MAX);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "phy_errs = %s\n", phy_errs);
 
 	if (len >= buf_len)
@@ -4259,19 +3854,19 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		htt_print_tx_pdev_stats_cmn_tlv(tag_buf, user_data);
 		break;
 	case HTT_STATS_TX_PDEV_UNDERRUN_TAG:
-		htt_print_tx_pdev_stats_urrn_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_urrn_tlv_v(tag_buf, len, user_data);
 		break;
 	case HTT_STATS_TX_PDEV_SIFS_TAG:
-		htt_print_tx_pdev_stats_sifs_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_sifs_tlv_v(tag_buf, len, user_data);
 		break;
 	case HTT_STATS_TX_PDEV_FLUSH_TAG:
-		htt_print_tx_pdev_stats_flush_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_flush_tlv_v(tag_buf, len, user_data);
 		break;
 	case HTT_STATS_TX_PDEV_PHY_ERR_TAG:
-		htt_print_tx_pdev_stats_phy_err_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_phy_err_tlv_v(tag_buf, len, user_data);
 		break;
 	case HTT_STATS_TX_PDEV_SIFS_HIST_TAG:
-		htt_print_tx_pdev_stats_sifs_hist_tlv_v(tag_buf, user_data);
+		htt_print_tx_pdev_stats_sifs_hist_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_PDEV_TX_PPDU_STATS_TAG:
@@ -4279,12 +3874,12 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_TX_PDEV_TRIED_MPDU_CNT_HIST_TAG:
-		htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(tag_buf,
+		htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(tag_buf, len,
 								  user_data);
 		break;
 
 	case HTT_STATS_STRING_TAG:
-		htt_print_stats_string_tlv(tag_buf, user_data);
+		htt_print_stats_string_tlv(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMN_TAG:
@@ -4292,38 +3887,38 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_TX_HWQ_DIFS_LATENCY_TAG:
-		htt_print_tx_hwq_difs_latency_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_difs_latency_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMD_RESULT_TAG:
-		htt_print_tx_hwq_cmd_result_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_cmd_result_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_CMD_STALL_TAG:
-		htt_print_tx_hwq_cmd_stall_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_cmd_stall_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_FES_STATUS_TAG:
-		htt_print_tx_hwq_fes_result_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_fes_result_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_TRIED_MPDU_CNT_HIST_TAG:
-		htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_HWQ_TXOP_USED_CNT_HIST_TAG:
-		htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(tag_buf, user_data);
+		htt_print_tx_hwq_txop_used_cnt_hist_tlv_v(tag_buf, len, user_data);
 		break;
 	case HTT_STATS_TX_TQM_GEN_MPDU_TAG:
-		htt_print_tx_tqm_gen_mpdu_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_tqm_gen_mpdu_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_TQM_LIST_MPDU_TAG:
-		htt_print_tx_tqm_list_mpdu_stats_tlv_v(tag_buf, user_data);
+		htt_print_tx_tqm_list_mpdu_stats_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_TQM_LIST_MPDU_CNT_TAG:
-		htt_print_tx_tqm_list_mpdu_cnt_tlv_v(tag_buf, user_data);
+		htt_print_tx_tqm_list_mpdu_cnt_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_TQM_CMN_TAG:
@@ -4363,7 +3958,7 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_TX_DE_FW2WBM_RING_FULL_HIST_TAG:
-		htt_print_tx_de_fw2wbm_ring_full_hist_tlv(tag_buf, user_data);
+		htt_print_tx_de_fw2wbm_ring_full_hist_tlv(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_TX_DE_CMN_TAG:
@@ -4395,7 +3990,7 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_RX_PDEV_FW_MPDU_DROP_TAG:
-		htt_print_rx_pdev_fw_mpdu_drop_tlv_v(tag_buf, user_data);
+		htt_print_rx_pdev_fw_mpdu_drop_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_RX_SOC_FW_STATS_TAG:
@@ -4403,21 +3998,21 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_RX_SOC_FW_REFILL_RING_EMPTY_TAG:
-		htt_print_rx_soc_fw_refill_ring_empty_tlv_v(tag_buf, user_data);
+		htt_print_rx_soc_fw_refill_ring_empty_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_RX_SOC_FW_REFILL_RING_NUM_REFILL_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_refill_tlv_v(
-				tag_buf, user_data);
+				tag_buf, len, user_data);
 		break;
 	case HTT_STATS_RX_REFILL_RXDMA_ERR_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v(
-				tag_buf, user_data);
+				tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_RX_REFILL_REO_ERR_TAG:
 		htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv_v(
-				tag_buf, user_data);
+				tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_RX_REO_RESOURCE_STATS_TAG:
@@ -4448,7 +4043,7 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_SCHED_TXQ_CMD_POSTED_TAG:
-		htt_print_sched_txq_cmd_posted_tlv_v(tag_buf, user_data);
+		htt_print_sched_txq_cmd_posted_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_RING_IF_CMN_TAG:
@@ -4456,7 +4051,7 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_SFM_CLIENT_USER_TAG:
-		htt_print_sfm_client_user_tlv_v(tag_buf, user_data);
+		htt_print_sfm_client_user_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_SFM_CLIENT_TAG:
@@ -4468,7 +4063,7 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_SCHED_TXQ_CMD_REAPED_TAG:
-		htt_print_sched_txq_cmd_reaped_tlv_v(tag_buf, user_data);
+		htt_print_sched_txq_cmd_reaped_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_SRING_CMN_TAG:
@@ -4586,11 +4181,11 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 		break;
 
 	case HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG:
-		htt_print_sched_txq_sched_order_su_tlv_v(tag_buf, user_data);
+		htt_print_sched_txq_sched_order_su_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG:
-		htt_print_sched_txq_sched_ineligibility_tlv_v(tag_buf, user_data);
+		htt_print_sched_txq_sched_ineligibility_tlv_v(tag_buf, len, user_data);
 		break;
 
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
@@ -4620,15 +4215,15 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 	if (!stats_req)
 		return;
 
-	pdev_id = stats_req->pdev_id;
+	pdev_id = DP_HW2SW_MACID(stats_req->pdev_id);
 	ar = ab->pdevs[pdev_id].ar;
-	spin_lock_bh(&ar->debug.stats_lock);
+	spin_lock_bh(&ar->debug.htt_stats.lock);
 	if (stats_req->done) {
-		spin_unlock_bh(&ar->debug.stats_lock);
+		spin_unlock_bh(&ar->debug.htt_stats.lock);
 		return;
 	}
 	stats_req->done = true;
-	spin_unlock_bh(&ar->debug.stats_lock);
+	spin_unlock_bh(&ar->debug.htt_stats.lock);
 
 	data = data + 8;
 	len = FIELD_GET(HTT_T2H_EXT_STATS_CONF_TLV_LENGTH_M, *(u32 *)data);
@@ -4643,14 +4238,14 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 }
 
 static ssize_t ath11k_read_htt_stats_type(struct file *file,
-					  char __user *user_buf,
-					  size_t count, loff_t *ppos)
+					 char __user *user_buf,
+					 size_t count, loff_t *ppos)
 {
 	struct ath11k *ar = file->private_data;
 	char buf[32];
 	size_t len;
 
-	len = scnprintf(buf, sizeof(buf), "%u\n", ar->debug.htt_stats_type);
+	len = scnprintf(buf, sizeof(buf), "%u\n", ar->debug.htt_stats.type);
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
 }
@@ -4660,76 +4255,96 @@ static ssize_t ath11k_write_htt_stats_type(struct file *file,
 					   size_t count, loff_t *ppos)
 {
 	struct ath11k *ar = file->private_data;
-	unsigned long type;
+	u8 type;
 	int ret;
 
-	ret = kstrtoul_from_user(user_buf, count, 0, &type);
+	ret = kstrtou8_from_user(user_buf, count, 0, &type);
 	if (ret)
 		return ret;
 
 	if (type >= HTT_DBG_NUM_EXT_STATS)
 		return -E2BIG;
 
-	ar->debug.htt_stats_type = type;
+	if (type == HTT_DBG_EXT_STATS_RESET)
+		return -EPERM;
+
+	ar->debug.htt_stats.type = type;
 
 	ret = count;
 
 	return ret;
 }
 
-static ssize_t ath11k_read_htt_stats(struct file *file,
-				     char __user *user_buf,
-				     size_t count, loff_t *ppos)
+static ssize_t ath11k_open_htt_stats(struct inode *inode, struct file *file)
 {
-	struct ath11k *ar = file->private_data;
-	struct ath11k_base *ab = ar->ab;
+	struct ath11k *ar = inode->i_private;
 	struct debug_htt_stats_req *stats_req;
-	char *buf = NULL;
-	u32 length = 0;
-	int ret;
+	u8 type = ar->debug.htt_stats.type;
 	u64 cookie = 0;
+	int ret, pdev_id = ar->pdev->pdev_id;
+
+	if (type == HTT_DBG_EXT_STATS_RESET)
+		return -EPERM;
 
-	stats_req = vmalloc(sizeof(*stats_req) +
-			    ATH11K_HTT_STATS_BUF_SIZE);
+	stats_req = vmalloc(sizeof(*stats_req) + ATH11K_HTT_STATS_BUF_SIZE);
 	if (!stats_req)
 		return -ENOMEM;
 
 	init_completion(&stats_req->cmpln);
 
 	stats_req->done = false;
-	stats_req->pdev_id = ar->pdev->pdev_id;
+	stats_req->pdev_id = pdev_id;
 
 	cookie |= (u32)stats_req;
+
 	mutex_lock(&ar->conf_mutex);
-	ret = ath11k_dp_htt_h2t_ext_stats_req(ar, ar->debug.htt_stats_type,
-					      cookie);
-	mutex_unlock(&ar->conf_mutex);
+	ret = ath11k_dp_htt_h2t_ext_stats_req(ar, type, cookie);
 	if (ret) {
-		ath11k_warn(ab, "failed to send htt stats request: %d\n", ret);
+		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
+		mutex_unlock(&ar->conf_mutex);
 		goto out;
 	}
+	mutex_unlock(&ar->conf_mutex);
 
 	while (!wait_for_completion_timeout(&stats_req->cmpln, 3 * HZ)) {
-		spin_lock_bh(&ar->debug.stats_lock);
+		spin_lock_bh(&ar->debug.htt_stats.lock);
 		if (!stats_req->done) {
 			stats_req->done = true;
-			spin_unlock_bh(&ar->debug.stats_lock);
+			spin_unlock_bh(&ar->debug.htt_stats.lock);
+			ath11k_warn(ar->ab, "stats request timed out\n");
 			ret = -ETIMEDOUT;
-			ath11k_warn(ab, "suspend timed out - pdev pause event never came\n");
-			break;
+			goto out;
 		}
-		spin_unlock_bh(&ar->debug.stats_lock);
+		spin_unlock_bh(&ar->debug.htt_stats.lock);
 	}
 
-	buf = stats_req->buf;
-	length = min_t(u32, stats_req->buf_len, ATH11K_HTT_STATS_BUF_SIZE);
+	file->private_data = stats_req;
+	return 0;
 out:
-	count = simple_read_from_buffer(user_buf, count, ppos, buf, length);
 	vfree(stats_req);
-	return count;
+	return ret;
+}
+
+static int ath11k_release_htt_stats(struct inode *inode, struct file *file)
+{
+	vfree(file->private_data);
+	return 0;
+}
+
+static ssize_t ath11k_read_htt_stats(struct file *file,
+				     char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	struct debug_htt_stats_req *stats_req = file->private_data;
+	char *buf;
+	u32 length = 0;
+
+	buf = stats_req->buf;
+	length = min_t(u32, stats_req->buf_len, ATH11K_HTT_STATS_BUF_SIZE);
+	return simple_read_from_buffer(user_buf, count, ppos, buf, length);
 }
 
-static const struct file_operations fops_dump_htt_stats_type = {
+static const struct file_operations fops_htt_stats_type = {
 	.read = ath11k_read_htt_stats_type,
 	.write = ath11k_write_htt_stats_type,
 	.open = simple_open,
@@ -4738,17 +4353,18 @@ static ssize_t ath11k_read_htt_stats(struct file *file,
 };
 
 static const struct file_operations fops_dump_htt_stats = {
+	.open = ath11k_open_htt_stats,
+	.release = ath11k_release_htt_stats,
 	.read = ath11k_read_htt_stats,
-	.open = simple_open,
 	.owner = THIS_MODULE,
 	.llseek = default_llseek,
 };
 
 void ath11k_htt_stats_debugfs_init(struct ath11k *ar)
 {
-	spin_lock_init(&ar->debug.stats_lock);
+	spin_lock_init(&ar->debug.htt_stats.lock);
 	debugfs_create_file("htt_stats_type", 0600, ar->debug.debugfs_pdev,
-			    ar, &fops_dump_htt_stats);
+			    ar, &fops_htt_stats_type);
 	debugfs_create_file("htt_stats", 0400, ar->debug.debugfs_pdev,
 			    ar, &fops_dump_htt_stats);
 }
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index 8793ee7..ce1f8fb 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -6,14 +6,7 @@
 #ifndef DEBUG_HTT_STATS_H
 #define DEBUG_HTT_STATS_H
 
-/*
- * htt_dbg_ext_stats_type -
- * The base structure for each of the stats_type is only for reference
- * Host should use this information to know the type of TLVs to expect
- * for a particular stats type.
- *
- *    Max supported stats :- 256.
- */
+/* htt_dbg_ext_stats_type */
 enum htt_dbg_ext_stats_type {
 	HTT_DBG_EXT_STATS_RESET                      =  0,
 	HTT_DBG_EXT_STATS_PDEV_TX                    =  1,
@@ -40,7 +33,7 @@ enum htt_dbg_ext_stats_type {
 	HTT_DBG_EXT_STATS_TX_SOUNDING_INFO           =  22,
 
 	/* keep this last */
-	HTT_DBG_NUM_EXT_STATS                        =  256,
+	HTT_DBG_NUM_EXT_STATS,
 };
 
 enum htt_tlv_tag_t {
@@ -165,13 +158,11 @@ enum htt_tx_pdev_underrun_enum {
 /* Bytes stored in little endian order */
 /* Length should be multiple of DWORD */
 struct htt_stats_string_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 data[0]; /* Can be variable length */
 } __packed;
 
 /* == TX PDEV STATS == */
 struct htt_tx_pdev_stats_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 hw_queued;
 	u32 hw_reaped;
@@ -227,36 +218,30 @@ struct htt_tx_pdev_stats_cmn_tlv {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_urrn_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 urrn_stats[0]; /* HTT_TX_PDEV_MAX_URRN_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_flush_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 flush_errs[0]; /* HTT_TX_PDEV_MAX_FLUSH_REASON_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_sifs_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 sifs_status[0]; /* HTT_TX_PDEV_MAX_SIFS_BURST_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_phy_err_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32  phy_errs[0]; /* HTT_TX_PDEV_MAX_PHY_ERR_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_sifs_hist_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 sifs_hist_status[0]; /* HTT_TX_PDEV_SIFS_BURST_HIST_STATS */
 };
 
 struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 num_data_ppdus_legacy_su;
 	u32 num_data_ppdus_ac_su;
 	u32 num_data_ppdus_ax_su;
@@ -275,10 +260,8 @@ struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v {
  *  following macros
  *  #define WAL_MAX_TRIED_MPDU_CNT_HISTOGRAM 9
  *  #define WAL_TRIED_MPDU_CNT_HISTOGRAM_INTERVAL 30
- *
  */
 struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 hist_bin_size;
 	u32 tried_mpdu_cnt_hist[0]; /* HTT_TX_PDEV_TRIED_MPDU_CNT_HIST */
 };
@@ -288,7 +271,6 @@ struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v {
 /* =============== PDEV ERROR STATS ============== */
 #define HTT_STATS_MAX_HW_INTR_NAME_LEN 8
 struct htt_hw_stats_intr_misc_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Stored as little endian */
 	u8 hw_intr_name[HTT_STATS_MAX_HW_INTR_NAME_LEN];
 	u32 mask;
@@ -297,14 +279,12 @@ struct htt_hw_stats_intr_misc_tlv {
 
 #define HTT_STATS_MAX_HW_MODULE_NAME_LEN 8
 struct htt_hw_stats_wd_timeout_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Stored as little endian */
 	u8 hw_module_name[HTT_STATS_MAX_HW_MODULE_NAME_LEN];
 	u32 count;
 };
 
 struct htt_hw_stats_pdev_errs_tlv {
-	struct htt_tlv tlv_hdr;
 	u32    mac_id__word; /* BIT [ 7 :  0] : mac_id */
 	u32    tx_abort;
 	u32    tx_abort_fail_count;
@@ -319,7 +299,6 @@ struct htt_hw_stats_pdev_errs_tlv {
 };
 
 struct htt_hw_stats_whal_tx_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 last_unpause_ppdu_id;
 	u32 hwsch_unpause_wait_tqm_write;
@@ -336,7 +315,6 @@ struct htt_hw_stats_whal_tx_tlv {
 
 /* ============ PEER STATS ============ */
 struct htt_msdu_flow_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 last_update_timestamp;
 	u32 last_add_timestamp;
 	u32 last_remove_timestamp;
@@ -354,7 +332,6 @@ struct htt_msdu_flow_stats_tlv {
 
 /* Tidq stats */
 struct htt_tx_tid_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Stored as little endian */
 	u8     tid_name[MAX_HTT_TID_NAME];
 	u32 sw_peer_id__tid_num;
@@ -375,7 +352,6 @@ struct htt_tx_tid_stats_tlv {
 
 /* Tidq stats */
 struct htt_tx_tid_stats_v1_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Stored as little endian */
 	u8 tid_name[MAX_HTT_TID_NAME];
 	u32 sw_peer_id__tid_num;
@@ -397,7 +373,6 @@ struct htt_tx_tid_stats_v1_tlv {
 };
 
 struct htt_rx_tid_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 sw_peer_id__tid_num;
 	u8 tid_name[MAX_HTT_TID_NAME];
 	u32 dup_in_reorder;
@@ -409,13 +384,11 @@ struct htt_rx_tid_stats_tlv {
 
 #define HTT_MAX_COUNTER_NAME 8
 struct htt_counter_tlv {
-	struct htt_tlv tlv_hdr;
 	u8 counter_name[HTT_MAX_COUNTER_NAME];
 	u32 count;
 };
 
 struct htt_peer_stats_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 ppdu_cnt;
 	u32 mpdu_cnt;
 	u32 msdu_cnt;
@@ -438,7 +411,6 @@ struct htt_peer_stats_cmn_tlv {
 };
 
 struct htt_peer_details_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 peer_type;
 	u32 sw_peer_id;
 	u32 vdev_pdev_ast_idx;
@@ -467,8 +439,6 @@ enum htt_stats_param_type {
 #define HTT_TX_PEER_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 
 struct htt_tx_peer_rate_stats_tlv {
-	struct htt_tlv tlv_hdr;
-
 	u32 tx_ldpc;
 	u32 rts_cnt;
 	u32 ack_rssi;
@@ -501,7 +471,6 @@ struct htt_tx_peer_rate_stats_tlv {
 #define HTT_RX_PEER_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 
 struct htt_rx_peer_rate_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 nsts;
 
 	/* Number of rx ldpc packets */
@@ -550,14 +519,12 @@ enum htt_peer_stats_tlv_enum {
 /* =========== MUMIMO HWQ stats =========== */
 /* MU MIMO stats per hwQ */
 struct htt_tx_hwq_mu_mimo_sch_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mu_mimo_sch_posted;
 	u32 mu_mimo_sch_failed;
 	u32 mu_mimo_ppdu_posted;
 };
 
 struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mu_mimo_mpdus_queued_usr;
 	u32 mu_mimo_mpdus_tried_usr;
 	u32 mu_mimo_mpdus_failed_usr;
@@ -568,13 +535,11 @@ struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv {
 };
 
 struct htt_tx_hwq_mu_mimo_cmn_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__hwq_id__word;
 };
 
 /* == TX HWQ STATS == */
 struct htt_tx_hwq_stats_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__hwq_id__word;
 
 	/* PPDU level stats */
@@ -607,7 +572,6 @@ struct htt_tx_hwq_stats_cmn_tlv {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_difs_latency_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 hist_intvl;
 	/* histogram of ppdu post to hwsch - > cmd status received */
 	u32 difs_latency_hist[0]; /* HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS */
@@ -615,21 +579,18 @@ struct htt_tx_hwq_difs_latency_stats_tlv_v {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_cmd_result_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Histogram of sched cmd result */
 	u32 cmd_result[0]; /* HTT_TX_HWQ_MAX_CMD_RESULT_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_cmd_stall_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Histogram of various pause conitions */
 	u32 cmd_stall_status[0]; /* HTT_TX_HWQ_MAX_CMD_STALL_STATS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_fes_result_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Histogram of number of user fes result */
 	u32 fes_result[0]; /* HTT_TX_HWQ_MAX_FES_RESULT_STATS */
 };
@@ -647,7 +608,6 @@ struct htt_tx_hwq_fes_result_stats_tlv_v {
  *  #define WAL_TRIED_MPDU_CNT_HISTOGRAM_INTERVAL 30
  */
 struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 hist_bin_size;
 	/* Histogram of number of mpdus on tried mpdu */
 	u32 tried_mpdu_cnt_hist[0]; /* HTT_TX_HWQ_TRIED_MPDU_CNT_HIST */
@@ -664,14 +624,12 @@ struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v {
  * #define WAL_TXOP_USED_HISTOGRAM_INTERVAL 1000 ( 1 ms )
  */
 struct htt_tx_hwq_txop_used_cnt_hist_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Histogram of txop used cnt */
 	u32 txop_used_cnt_hist[0]; /* HTT_TX_HWQ_TXOP_USED_CNT_HIST */
 };
 
 /* == TX SELFGEN STATS == */
 struct htt_tx_selfgen_cmn_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 su_bar;
 	u32 rts;
@@ -687,7 +645,6 @@ struct htt_tx_selfgen_cmn_stats_tlv {
 };
 
 struct htt_tx_selfgen_ac_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* 11AC */
 	u32 ac_su_ndpa;
 	u32 ac_su_ndp;
@@ -699,7 +656,6 @@ struct htt_tx_selfgen_ac_stats_tlv {
 };
 
 struct htt_tx_selfgen_ax_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* 11AX */
 	u32 ax_su_ndpa;
 	u32 ax_su_ndp;
@@ -719,7 +675,6 @@ struct htt_tx_selfgen_ax_stats_tlv {
 };
 
 struct htt_tx_selfgen_ac_err_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* 11AC error stats */
 	u32 ac_su_ndp_err;
 	u32 ac_su_ndpa_err;
@@ -731,7 +686,6 @@ struct htt_tx_selfgen_ac_err_stats_tlv {
 };
 
 struct htt_tx_selfgen_ax_err_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* 11AX error stats */
 	u32 ax_su_ndp_err;
 	u32 ax_su_ndpa_err;
@@ -756,7 +710,6 @@ struct htt_tx_selfgen_ax_err_stats_tlv {
 #define HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS    74
 
 struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* mu-mimo sw sched cmd stats */
 	u32 mu_mimo_sch_posted;
 	u32 mu_mimo_sch_failed;
@@ -774,7 +727,6 @@ struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
 };
 
 struct htt_tx_pdev_mu_mimo_mpdu_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mu_mimo_mpdus_queued_usr;
 	u32 mu_mimo_mpdus_tried_usr;
 	u32 mu_mimo_mpdus_failed_usr;
@@ -805,7 +757,6 @@ struct htt_tx_pdev_mu_mimo_mpdu_stats_tlv {
 #define HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX 3
 
 struct htt_tx_pdev_mpdu_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* mpdu level stats */
 	u32 mpdus_queued_usr;
 	u32 mpdus_tried_usr;
@@ -821,19 +772,16 @@ struct htt_tx_pdev_mpdu_stats_tlv {
 /* == TX SCHED STATS == */
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_cmd_posted_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 sched_cmd_posted[0]; /* HTT_TX_PDEV_SCHED_TX_MODE_MAX */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_cmd_reaped_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 sched_cmd_reaped[0]; /* HTT_TX_PDEV_SCHED_TX_MODE_MAX */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_sched_order_su_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 sched_order_su[0]; /* HTT_TX_PDEV_NUM_SCHED_ORDER_LOG */
 };
 
@@ -861,14 +809,11 @@ enum htt_sched_txq_sched_ineligibility_tlv_enum {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_sched_ineligibility_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* indexed by htt_sched_txq_sched_ineligibility_tlv_enum */
 	u32 sched_ineligibility[0];
 };
 
 struct htt_tx_pdev_stats_sched_per_txq_tlv {
-	struct htt_tlv tlv_hdr;
-
 	u32 mac_id__txq_id__word;
 	u32 sched_policy;
 	u32 last_sched_cmd_posted_timestamp;
@@ -893,7 +838,6 @@ struct htt_tx_pdev_stats_sched_per_txq_tlv {
 };
 
 struct htt_stats_tx_sched_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	/* BIT [ 7 :  0]   :- mac_id
 	 * BIT [31 :  8]   :- reserved
 	 */
@@ -909,25 +853,21 @@ struct htt_stats_tx_sched_cmn_tlv {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_gen_mpdu_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 gen_mpdu_end_reason[0]; /* HTT_TX_TQM_MAX_GEN_MPDU_END_REASON */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_list_mpdu_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 list_mpdu_end_reason[0]; /* HTT_TX_TQM_MAX_LIST_MPDU_END_REASON */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_list_mpdu_cnt_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 list_mpdu_cnt_hist[0];
 			/* HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS */
 };
 
 struct htt_tx_tqm_pdev_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 msdu_count;
 	u32 mpdu_count;
 	u32 remove_msdu;
@@ -974,7 +914,6 @@ struct htt_tx_tqm_pdev_stats_tlv_v {
 };
 
 struct htt_tx_tqm_cmn_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 max_cmdq_id;
 	u32 list_mpdu_cnt_hist_intvl;
@@ -988,7 +927,6 @@ struct htt_tx_tqm_cmn_stats_tlv {
 };
 
 struct htt_tx_tqm_error_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Error stats */
 	u32 q_empty_failure;
 	u32 q_not_empty_failure;
@@ -997,7 +935,6 @@ struct htt_tx_tqm_error_stats_tlv {
 
 /* == TQM CMDQ stats == */
 struct htt_tx_tqm_cmdq_status_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__cmdq_id__word;
 	u32 sync_cmd;
 	u32 write_cmd;
@@ -1015,7 +952,6 @@ struct htt_tx_tqm_cmdq_status_tlv {
 /* == TX-DE STATS == */
 /* Structures for tx de stats */
 struct htt_tx_de_eapol_packets_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 m1_packets;
 	u32 m2_packets;
 	u32 m3_packets;
@@ -1025,7 +961,6 @@ struct htt_tx_de_eapol_packets_stats_tlv {
 };
 
 struct htt_tx_de_classify_failed_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 ap_bss_peer_not_found;
 	u32 ap_bcast_mcast_no_peer;
 	u32 sta_delete_in_progress;
@@ -1042,7 +977,6 @@ struct htt_tx_de_classify_failed_stats_tlv {
 };
 
 struct htt_tx_de_classify_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 arp_packets;
 	u32 igmp_packets;
 	u32 dhcp_packets;
@@ -1084,7 +1018,6 @@ struct htt_tx_de_classify_stats_tlv {
 };
 
 struct htt_tx_de_classify_status_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 eok;
 	u32 classify_done;
 	u32 lookup_failed;
@@ -1096,21 +1029,18 @@ struct htt_tx_de_classify_status_stats_tlv {
 };
 
 struct htt_tx_de_enqueue_packets_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 enqueued_pkts;
 	u32 to_tqm;
 	u32 to_tqm_bypass;
 };
 
 struct htt_tx_de_enqueue_discard_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 discarded_pkts;
 	u32 local_frames;
 	u32 is_ext_msdu;
 };
 
 struct htt_tx_de_compl_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 tcl_dummy_frame;
 	u32 tqm_dummy_frame;
 	u32 tqm_notify_frame;
@@ -1130,12 +1060,10 @@ struct htt_tx_de_compl_stats_tlv {
  *                               ENTRIES_PER_BIN_COUNT)
  */
 struct htt_tx_de_fw2wbm_ring_full_hist_tlv {
-	struct htt_tlv tlv_hdr;
-	u32 fw2wbm_ring_full_hist[1];
+	u32 fw2wbm_ring_full_hist[0];
 };
 
 struct htt_tx_de_cmn_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32   mac_id__word;
 
 	/* Global Stats */
@@ -1168,7 +1096,6 @@ struct htt_ring_if_stats_tlv {
 };
 
 struct htt_ring_if_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 num_records;
 };
@@ -1176,13 +1103,11 @@ struct htt_ring_if_cmn_tlv {
 /* == SFM STATS == */
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sfm_client_user_tlv_v {
-	struct htt_tlv   tlv_hdr;
 	/* Number of DWORDS used per user and per client */
-	u32 dwords_used_by_user_n[1];
+	u32 dwords_used_by_user_n[0];
 };
 
 struct htt_sfm_client_tlv {
-	struct htt_tlv tlv_hdr;
 	/* Client ID */
 	u32 client_id;
 	/* Minimum number of buffers */
@@ -1200,7 +1125,6 @@ struct htt_sfm_client_tlv {
 };
 
 struct htt_sfm_cmn_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	/* Indicates the total number of 128 byte buffers
 	 * in the CMEM that are available for buffer sharing
@@ -1218,8 +1142,6 @@ struct htt_sfm_cmn_tlv {
 
 /* == SRNG STATS == */
 struct htt_sring_stats_tlv {
-	struct htt_tlv   tlv_hdr;
-
 	u32 mac_id__ring_id__arena__ep;
 	u32 base_addr_lsb; /* DWORD aligned base memory address of the ring */
 	u32 base_addr_msb;
@@ -1233,8 +1155,7 @@ struct htt_sring_stats_tlv {
 };
 
 struct htt_sring_cmn_tlv {
-	struct htt_tlv   tlv_hdr;
-	u32        num_records;
+	u32 num_records;
 };
 
 /* == PDEV TX RATE CTRL STATS == */
@@ -1253,7 +1174,6 @@ struct htt_sring_cmn_tlv {
 	 HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS)
 
 struct htt_tx_pdev_rate_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 tx_ldpc;
 	u32 rts_cnt;
@@ -1339,7 +1259,6 @@ struct htt_tx_pdev_rate_stats_tlv {
 #define HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 
 struct htt_rx_pdev_rate_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 nsts;
 
@@ -1380,7 +1299,6 @@ struct htt_rx_pdev_rate_stats_tlv {
 
 /* == RX PDEV/SOC STATS == */
 struct htt_rx_soc_fw_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 fw_reo_ring_data_msdu;
 	u32 fw_to_host_data_msdu_bcmc;
 	u32 fw_to_host_data_msdu_uc;
@@ -1399,13 +1317,11 @@ struct htt_rx_soc_fw_stats_tlv {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_empty_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 refill_ring_empty_cnt[0]; /* HTT_RX_STATS_REFILL_MAX_RING */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 refill_ring_num_refill[0]; /* HTT_RX_STATS_REFILL_MAX_RING */
 };
 
@@ -1438,7 +1354,6 @@ enum htt_rx_rxdma_error_code_enum {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 rxdma_err[0]; /* HTT_RX_RXDMA_MAX_ERR_CODE */
 };
 
@@ -1471,7 +1386,6 @@ enum htt_rx_reo_error_code_enum {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v {
-	struct htt_tlv tlv_hdr;
 	u32 reo_err[0]; /* HTT_RX_REO_MAX_ERR_CODE */
 };
 
@@ -1479,7 +1393,6 @@ struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v {
 #define HTT_STATS_SUBTYPE_MAX     16
 
 struct htt_rx_pdev_fw_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 ppdu_recvd;
 	u32 mpdu_cnt_fcs_ok;
@@ -1534,7 +1447,6 @@ struct htt_rx_pdev_fw_stats_tlv {
 #define HTT_STATS_PHY_ERR_MAX 43
 
 struct htt_rx_pdev_fw_stats_phy_err_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 mac_id__word;
 	u32 total_phy_err_cnt;
 	/* Counts of different types of phy errs
@@ -1590,14 +1502,12 @@ struct htt_rx_pdev_fw_stats_phy_err_tlv {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Num error MPDU for each RxDMA error type  */
 	u32 fw_ring_mpdu_err[0]; /* HTT_RX_STATS_RXDMA_MAX_ERR */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_pdev_fw_mpdu_drop_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Num MPDU dropped  */
 	u32 fw_mpdu_drop[0]; /* HTT_RX_STATS_FW_DROP_REASON_MAX */
 };
@@ -1612,8 +1522,6 @@ struct htt_rx_pdev_fw_mpdu_drop_tlv_v {
 #define HTT_PDEV_CCA_STATS_CCA_OBBS_USEC_INFO_PRESENT         (0x80)
 
 struct htt_pdev_stats_cca_counters_tlv {
-	struct htt_tlv tlv_hdr;
-
 	/* Below values are obtained from the HW Cycles counter registers */
 	u32 tx_frame_usec;
 	u32 rx_frame_usec;
@@ -1626,7 +1534,6 @@ struct htt_pdev_stats_cca_counters_tlv {
 };
 
 struct htt_pdev_cca_stats_hist_v1_tlv {
-	struct htt_tlv tlv_hdr;
 	u32    chan_num;
 	/* num of CCA records (Num of htt_pdev_stats_cca_counters_tlv)*/
 	u32    num_records;
@@ -1643,7 +1550,6 @@ struct htt_pdev_cca_stats_hist_v1_tlv {
 };
 
 struct htt_pdev_stats_twt_session_tlv {
-	struct htt_tlv   tlv_hdr;
 	u32 vdev_id;
 	struct htt_mac_addr peer_mac;
 	u32 flow_id_flags;
@@ -1658,7 +1564,6 @@ struct htt_pdev_stats_twt_session_tlv {
 };
 
 struct htt_pdev_stats_twt_sessions_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 pdev_id;
 	u32 num_sessions;
 	struct htt_pdev_stats_twt_session_tlv twt_session[0];
@@ -1684,7 +1589,6 @@ enum htt_rx_reo_resource_sample_id_enum {
 };
 
 struct htt_rx_reo_resource_stats_tlv_v {
-	struct htt_tlv tlv_hdr;
 	/* Variable based on the Number of records. HTT_RX_REO_RESOURCE_STATS_MAX */
 	u32 sample_id;
 	u32 total_max;
@@ -1715,7 +1619,6 @@ enum htt_stats_sounding_tx_mode {
 };
 
 struct htt_tx_sounding_stats_tlv {
-	struct htt_tlv tlv_hdr;
 	u32 tx_sounding_mode; /* HTT_TX_XX_SOUNDING_MODE */
 	/* Counts number of soundings for all steering modes in each bw */
 	u32 cbf_20[HTT_TXBF_MAX_NUM_OF_MODES];
@@ -1735,7 +1638,6 @@ struct htt_tx_sounding_stats_tlv {
 };
 
 struct htt_pdev_obss_pd_stats_tlv {
-	struct htt_tlv   tlv_hdr;
 
 	u32        num_obss_tx_ppdu_success;
 	u32        num_obss_tx_ppdu_failure;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5674053..fb880df 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1156,6 +1156,7 @@ struct htt_ext_stats_cfg_cmd {
 	u32 cfg_param1;
 	u32 cfg_param2;
 	u32 cfg_param3;
+	u32 reserved;
 	u32 cookie_lsb;
 	u32 cookie_msb;
 } __packed;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5324c5f..c6b0339 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -856,7 +856,7 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	return ret;
 }
 
-int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 mask, u64 cookie)
+int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type, u64 cookie)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -875,9 +875,9 @@ int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 mask, u64 cookie)
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_EXT_STATS_CFG;
 
-	cmd->hdr.pdev_mask = 1 << DP_SW2HW_MACID(ar->pdev->pdev_id);
+	cmd->hdr.pdev_mask = 1 << ar->pdev->pdev_id;
 
-	cmd->hdr.stats_type = mask;
+	cmd->hdr.stats_type = type;
 	cmd->cookie_lsb = lower_32_bits(cookie);
 	cmd->cookie_msb = upper_32_bits(cookie);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index a9d03da..8dd8e2b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -26,5 +26,6 @@ int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 					enum hal_reo_cmd_status));
 
 int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
-int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 mask, u64 cookie);
+int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				    u64 cookie);
 #endif
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
