Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3Wpd-0000pb-E0
 for ath11k@lists.infradead.org; Mon, 17 Feb 2020 03:12:27 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCHv2] ath11k: Supporting RX ring backpressure HTT event and stats
 handling
Date: Mon, 17 Feb 2020 08:42:08 +0530
Message-Id: <1581909128-14861-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Vikas Patel <vikpatel@codeaurora.org>, linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

From: Vikas Patel <vikpatel@codeaurora.org>

The Firmware sends HTT event to host whenever there is a
backpressure on RX rings, Handling such event and dumping
info on the console under the "ATH11K_DBG_DP_HTT"  debug level.

Fetching RX ring backpressure histogram from FW via htt_stats debugfs.

 #echo "24" > /sys/kernel/debug/ath11k/macX/htt_stats_type
 #cat /sys/kernel/debug/ath11k/macX/htt_stats

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
v2: Including linux-wireless

 drivers/net/wireless/ath/ath11k/debug.h       |  2 +
 .../net/wireless/ath/ath11k/debug_htt_stats.c | 44 +++++++++++++++++++
 .../net/wireless/ath/ath11k/debug_htt_stats.h | 28 ++++++++++++
 drivers/net/wireless/ath/ath11k/dp.h          |  8 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 26 +++++++++++
 5 files changed, 108 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index a317a7bdb9a2..012ed37cf704 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -53,6 +53,8 @@ enum ath11k_dbg_htt_ext_stats_type {
 	ATH11K_DBG_HTT_EXT_STATS_TWT_SESSIONS               =  20,
 	ATH11K_DBG_HTT_EXT_STATS_REO_RESOURCE_STATS         =  21,
 	ATH11K_DBG_HTT_EXT_STATS_TX_SOUNDING_INFO           =  22,
+	ATH11K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	    =  23,
+	ATH11K_DBG_HTT_EXT_STATS_RING_BACKPRESSURE_STATS    =  24,
 
 	/* keep this last */
 	ATH11K_DBG_HTT_NUM_EXT_STATS,
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 090fffa5e53c..8accfb973044 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -3715,6 +3715,47 @@ htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 	stats_req->buf_len = len;
 }
 
+static inline void htt_print_backpressure_stats_tlv_v(const u32 *tag_buf,
+						      u8 *data)
+{
+	struct debug_htt_stats_req *stats_req =
+			(struct debug_htt_stats_req *)data;
+	struct htt_ring_backpressure_stats_tlv *htt_stats_buf =
+			(struct htt_ring_backpressure_stats_tlv *)tag_buf;
+	int i;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
+
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "pdev_id = %u",
+			   htt_stats_buf->pdev_id);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "current_head_idx = %u",
+			   htt_stats_buf->current_head_idx);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "current_tail_idx = %u",
+			   htt_stats_buf->current_tail_idx);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "num_htt_msgs_sent = %u",
+			   htt_stats_buf->num_htt_msgs_sent);
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "backpressure_time_ms = %u",
+			   htt_stats_buf->backpressure_time_ms);
+
+	for (i = 0; i < 5; i++)
+		len += HTT_DBG_OUT(buf + len, buf_len - len,
+				   "backpressure_hist_%u = %u",
+				   i + 1, htt_stats_buf->backpressure_hist[i]);
+
+	len += HTT_DBG_OUT(buf + len, buf_len - len,
+			   "============================");
+
+	if (len >= buf_len) {
+		buf[buf_len - 1] = 0;
+		stats_req->buf_len = buf_len - 1;
+	} else {
+		buf[len] = 0;
+		stats_req->buf_len = len;
+	}
+}
+
 static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
 					    struct debug_htt_stats_req *stats_req)
 {
@@ -4107,6 +4148,9 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
 		htt_print_pdev_obss_pd_stats_tlv_v(tag_buf, stats_req);
 		break;
+	case HTT_STATS_RING_BACKPRESSURE_STATS_TAG:
+		htt_print_backpressure_stats_tlv_v(tag_buf, user_data);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index 618f1946bf49..23ac03221ac8 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -100,6 +100,8 @@ enum htt_tlv_tag_t {
 	HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG              = 86,
 	HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG         = 87,
 	HTT_STATS_PDEV_OBSS_PD_TAG                          = 88,
+	HTT_STATS_HW_WAR_TAG				    = 89,
+	HTT_STATS_RING_BACKPRESSURE_STATS_TAG		    = 90,
 
 	HTT_STATS_MAX_TAG,
 };
@@ -1617,4 +1619,30 @@ struct htt_pdev_obss_pd_stats_tlv {
 };
 
 void ath11k_debug_htt_stats_init(struct ath11k *ar);
+
+struct htt_ring_backpressure_stats_tlv {
+	u32 pdev_id;
+	u32 current_head_idx;
+	u32 current_tail_idx;
+	u32 num_htt_msgs_sent;
+	/* Time in milliseconds for which the ring has been in
+	 * its current backpressure condition
+	 */
+	u32 backpressure_time_ms;
+	/* backpressure_hist - histogram showing how many times
+	 * different degrees of backpressure duration occurred:
+	 * Index 0 indicates the number of times ring was
+	 * continuously in backpressure state for 100 - 200ms.
+	 * Index 1 indicates the number of times ring was
+	 * continuously in backpressure state for 200 - 300ms.
+	 * Index 2 indicates the number of times ring was
+	 * continuously in backpressure state for 300 - 400ms.
+	 * Index 3 indicates the number of times ring was
+	 * continuously in backpressure state for 400 - 500ms.
+	 * Index 4 indicates the number of times ring was
+	 * continuously in backpressure state beyond 500ms.
+	 */
+	u32 backpressure_hist[5];
+};
+
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 2f0980f2c762..97dacdd6793a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -916,6 +916,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_PEER_UNMAP	= 0x1f,
 	HTT_T2H_MSG_TYPE_PPDU_STATS_IND = 0x1d,
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
+	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
@@ -964,6 +965,13 @@ struct htt_resp_msg {
 	};
 } __packed;
 
+#define HTT_BACKPRESSURE_EVENT_PDEV_ID_M GENMASK(15, 8)
+#define HTT_BACKPRESSURE_EVENT_RING_TYPE_M GENMASK(23, 16)
+#define HTT_BACKPRESSURE_EVENT_RING_ID_M GENMASK(31, 24)
+
+#define HTT_BACKPRESSURE_EVENT_HP_M GENMASK(15, 0)
+#define HTT_BACKPRESSURE_EVENT_TP_M GENMASK(31, 16)
+
 /* ppdu stats
  *
  * @details
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3a3dc7680622..40c56c3826c7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1330,6 +1330,29 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 	trace_ath11k_htt_pktlog(ar, data->payload, len);
 }
 
+static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
+						  struct sk_buff *skb)
+{
+	u32 *data = (u32 *)skb->data;
+	u8 pdev_id, ring_type, ring_id;
+	u16 hp, tp;
+	u32 backpressure_time;
+
+	pdev_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_PDEV_ID_M, *data);
+	ring_type = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_TYPE_M, *data);
+	ring_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_ID_M, *data);
+	++data;
+
+	hp = FIELD_GET(HTT_BACKPRESSURE_EVENT_HP_M, *data);
+	tp = FIELD_GET(HTT_BACKPRESSURE_EVENT_TP_M, *data);
+	++data;
+
+	backpressure_time = *data;
+
+	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt backpressure event, pdev %d, ring type %d,ring id %d, hp %d tp %d, backpressure time %d\n",
+		   pdev_id, ring_type, ring_id, hp, tp, backpressure_time);
+}
+
 void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 				       struct sk_buff *skb)
 {
@@ -1379,6 +1402,9 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	case HTT_T2H_MSG_TYPE_PKTLOG:
 		ath11k_htt_pktlog(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND:
+		ath11k_htt_backpressure_event_handler(ab, skb);
+		break;
 	default:
 		ath11k_warn(ab, "htt event %d not handled\n", type);
 		break;
-- 
2.23.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
