Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2Iy-0005Ci-DG
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:01:06 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Avoid space related warning
Date: Fri, 21 Jun 2019 00:30:44 +0530
Message-Id: <1561057244-32766-1-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/ce.c:375: space required before the open parenthesis '('
drivers/net/wireless/ath/ath11k/core.c:251: space required before the open parenthesis '('
drivers/net/wireless/ath/ath11k/debug.h:78: please, no space before tabs
drivers/net/wireless/ath/ath11k/dp.h:227: please, no space before tabs
drivers/net/wireless/ath/ath11k/dp.h:1029: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1030: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1032: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1052: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1053: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1056: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1058: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1061: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1062: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1063: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1064: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1065: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1066: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1081: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1084: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1085: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1086: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1087: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1088: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1089: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1108: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1110: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1111: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1113: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1116: space prohibited before that ',' (ctx:WxV)
drivers/net/wireless/ath/ath11k/dp.h:1116: space required after that ',' (ctx:WxV)
drivers/net/wireless/ath/ath11k/dp.h:1144: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1145: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1147: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1167: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1168: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1169: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp_rx.c:1016: space required before the open parenthesis '('
drivers/net/wireless/ath/ath11k/mac.c:176: space required before the open parenthesis '('
drivers/net/wireless/ath/ath11k/wmi.c:5298: space required after that ',' (ctx:VxV)
drivers/net/wireless/ath/ath11k/wmi.c:5539: No space is necessary after a cast
drivers/net/wireless/ath/ath11k/debug.c:1074: spaces required around that '?' (ctx:VxV)
drivers/net/wireless/ath/ath11k/debug.c:1074: spaces required around that ':' (ctx:VxV)
drivers/net/wireless/ath/ath11k/dp.h:1182: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/dp.h:1183: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/dp.h:1190: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/hal.h:441: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/hal.h:441: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/hal.h:442: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/hal.h:442: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/hal.h:443: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/hal.h:443: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/htc.c:77: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/htc.c:77: please, no spaces at the start of a line
drivers/net/wireless/ath/ath11k/htc.c:78: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/htc.c:78: please, no spaces at the start of a line

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c    |  2 +-
 drivers/net/wireless/ath/ath11k/core.c  |  2 +-
 drivers/net/wireless/ath/ath11k/debug.c |  2 +-
 drivers/net/wireless/ath/ath11k/debug.h |  2 +-
 drivers/net/wireless/ath/ath11k/dp.h    | 81 ++++++++++++++++-----------------
 drivers/net/wireless/ath/ath11k/dp_rx.c |  2 +-
 drivers/net/wireless/ath/ath11k/hal.h   |  6 +--
 drivers/net/wireless/ath/ath11k/htc.c   |  4 +-
 drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c   |  4 +-
 10 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 33306b9..685b851 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -371,7 +371,7 @@ static int ath11k_ce_init_ring(struct ath11k_base *sc,
 
 	switch (type) {
 	case HAL_CE_SRC:
-		if(!(CE_ATTR_DIS_INTR & host_ce_config_wlan[ce_id].flags))
+		if (!(CE_ATTR_DIS_INTR & host_ce_config_wlan[ce_id].flags))
 			params.intr_batch_cntr_thres_entries = 1;
 		break;
 	case HAL_CE_DST:
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8be6a62..02e16e9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -248,7 +248,7 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 			if (ret == -ENOENT)
 				/* no match found, continue */
 				break;
-			else if(ret)
+			else if (ret)
 				/* there was an error, bail out */
 				goto err;
 			/* either found or error, so stop searching */
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 4b124d7..3eb8814 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1073,7 +1073,7 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "pktlog filter %d mode %s\n",
-		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL)?"full":"lite"));
+		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL) ? "full" : "lite"));
 
 	ar->debug.pktlog_filter = filter;
 	ar->debug.pktlog_mode = mode;
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index d6a8135..cfa14ee 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -75,7 +75,7 @@ enum ath11k_pktlog_filter {
 	ATH11K_PKTLOG_TX		= 0x000000002,
 	ATH11K_PKTLOG_RCFIND		= 0x000000004,
 	ATH11K_PKTLOG_RCUPDATE		= 0x000000008,
-	ATH11K_PKTLOG_EVENT_SMART_ANT 	= 0x000000020,
+	ATH11K_PKTLOG_EVENT_SMART_ANT	= 0x000000020,
 	ATH11K_PKTLOG_EVENT_SW		= 0x000000040,
 	ATH11K_PKTLOG_ANY		= 0x00000006f,
 };
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 8e32ef6..5a43f0a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -224,7 +224,7 @@ struct ath11k_dp {
 /* vdev meta data */
 #define HTT_TCL_META_DATA_VDEV_ID		GENMASK(9, 2)
 #define HTT_TCL_META_DATA_PDEV_ID		GENMASK(11, 10)
-#define HTT_TCL_META_DATA_HOST_INSPECTED 	BIT(12)
+#define HTT_TCL_META_DATA_HOST_INSPECTED	BIT(12)
 
 /* peer meta data */
 #define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 2)
@@ -1034,10 +1034,10 @@ enum HTT_PPDU_STATS_BW {
 	HTT_PPDU_STATS_BANDWIDTH_DYN    = 6,
 };
 
-#define HTT_PPDU_STATS_CMN_FLAGS_FRAME_TYPE_M	GENMASK(7,0)
-#define HTT_PPDU_STATS_CMN_FLAGS_QUEUE_TYPE_M	GENMASK(15,8)
+#define HTT_PPDU_STATS_CMN_FLAGS_FRAME_TYPE_M	GENMASK(7, 0)
+#define HTT_PPDU_STATS_CMN_FLAGS_QUEUE_TYPE_M	GENMASK(15, 8)
 /* bw - HTT_PPDU_STATS_BW */
-#define HTT_PPDU_STATS_CMN_FLAGS_BW_M		GENMASK(19,16)
+#define HTT_PPDU_STATS_CMN_FLAGS_BW_M		GENMASK(19, 16)
 
 struct htt_ppdu_stats_common {
 	u32 ppdu_id;
@@ -1057,21 +1057,21 @@ struct htt_ppdu_stats_common {
 	u16 bw_mhz;
 } __packed;
 
-#define HTT_PPDU_STATS_USER_RATE_INFO0_USER_POS_M	GENMASK(3,0)
-#define HTT_PPDU_STATS_USER_RATE_INFO0_MU_GROUP_ID_M	GENMASK(11,4)
+#define HTT_PPDU_STATS_USER_RATE_INFO0_USER_POS_M	GENMASK(3, 0)
+#define HTT_PPDU_STATS_USER_RATE_INFO0_MU_GROUP_ID_M	GENMASK(11, 4)
 
 #define HTT_PPDU_STATS_USER_RATE_INFO1_RESP_TYPE_VALD_M	BIT(0)
-#define HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M	GENMASK(5,1)
+#define HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M	GENMASK(5, 1)
 
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_LTF_SIZE_M	GENMASK(1,0)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_LTF_SIZE_M	GENMASK(1, 0)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_STBC_M		BIT(2)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_HE_RE_M		BIT(3)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_TXBF_M		GENMASK(7,4)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_BW_M		GENMASK(11,8)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_NSS_M		GENMASK(15,12)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_MCS_M		GENMASK(19,16)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M	GENMASK(23,20)
-#define HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M		GENMASK(27,24)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_TXBF_M		GENMASK(7, 4)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_BW_M		GENMASK(11, 8)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_NSS_M		GENMASK(15, 12)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_MCS_M		GENMASK(19, 16)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M	GENMASK(23, 20)
+#define HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M		GENMASK(27, 24)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M		BIT(28)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M		BIT(29)
 
@@ -1086,15 +1086,15 @@ struct htt_ppdu_stats_common {
 #define HTT_USR_RATE_GI(_val) \
 		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M, _val)
 
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_LTF_SIZE_M		GENMASK(1,0)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_LTF_SIZE_M		GENMASK(1, 0)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_STBC_M		BIT(2)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_HE_RE_M		BIT(3)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_TXBF_M		GENMASK(7,4)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_BW_M		GENMASK(11,8)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_NSS_M		GENMASK(15,12)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_MCS_M		GENMASK(19,16)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_PREAMBLE_M		GENMASK(23,20)
-#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_GI_M		GENMASK(27,24)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_TXBF_M		GENMASK(7, 4)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_BW_M		GENMASK(11, 8)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_NSS_M		GENMASK(15, 12)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_MCS_M		GENMASK(19, 16)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_PREAMBLE_M		GENMASK(23, 20)
+#define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_GI_M		GENMASK(27, 24)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_DCM_M		BIT(28)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_LDPC_M		BIT(29)
 
@@ -1113,15 +1113,15 @@ struct htt_ppdu_stats_user_rate {
 	u32 resp_rate_flags; /* %HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_ */
 } __packed;
 
-#define HTT_PPDU_STATS_TX_INFO_FLAGS_RATECODE_M		GENMASK(7,0)
+#define HTT_PPDU_STATS_TX_INFO_FLAGS_RATECODE_M		GENMASK(7, 0)
 #define HTT_PPDU_STATS_TX_INFO_FLAGS_IS_AMPDU_M		BIT(8)
-#define HTT_PPDU_STATS_TX_INFO_FLAGS_BA_ACK_FAILED_M	GENMASK(10,9)
-#define HTT_PPDU_STATS_TX_INFO_FLAGS_BW_M		GENMASK(13,11)
+#define HTT_PPDU_STATS_TX_INFO_FLAGS_BA_ACK_FAILED_M	GENMASK(10, 9)
+#define HTT_PPDU_STATS_TX_INFO_FLAGS_BW_M		GENMASK(13, 11)
 #define HTT_PPDU_STATS_TX_INFO_FLAGS_SGI_M		BIT(14)
-#define HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M		GENMASK(31,16)
+#define HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M		GENMASK(31, 16)
 
 #define HTT_TX_INFO_IS_AMSDU(_flags) \
-			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_IS_AMPDU_M ,_flags)
+			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_IS_AMPDU_M, _flags)
 #define HTT_TX_INFO_BA_ACK_FAILED(_flags) \
 			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_BA_ACK_FAILED_M, _flags)
 #define HTT_TX_INFO_RATECODE(_flags) \
@@ -1149,10 +1149,10 @@ enum  htt_ppdu_stats_usr_compln_status {
 	HTT_PPDU_STATS_USER_STATUS_ABORT,
 };
 
-#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRY_M	GENMASK(3,0)
-#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_SHORT_RETRY_M	GENMASK(7,4)
+#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRY_M	GENMASK(3, 0)
+#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_SHORT_RETRY_M	GENMASK(7, 4)
 #define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_IS_AMPDU_M		BIT(8)
-#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_RESP_TYPE_M		GENMASK(12,9)
+#define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_RESP_TYPE_M		GENMASK(12, 9)
 
 #define HTT_USR_CMPLTN_IS_AMPDU(_val) \
 	    FIELD_GET(HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_IS_AMPDU_M, _val)
@@ -1172,9 +1172,9 @@ struct htt_ppdu_stats_usr_cmpltn_cmn {
 	u32 flags; /* %HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRIES*/
 } __packed;
 
-#define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MPDU_M	GENMASK(8,0)
-#define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M	GENMASK(24,9)
-#define HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM	GENMASK(3,0)
+#define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MPDU_M	GENMASK(8, 0)
+#define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M	GENMASK(24, 9)
+#define HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM	GENMASK(3, 0)
 
 struct htt_ppdu_stats_usr_cmpltn_ack_ba_status {
 	u32 ppdu_id;
@@ -1187,15 +1187,14 @@ struct htt_ppdu_stats_usr_cmpltn_ack_ba_status {
 } __packed;
 
 struct htt_ppdu_stats_usr_cmn_array {
-    struct htt_tlv tlv_hdr;
-    u32 num_ppdu_stats;
-    /*
-     * tx_ppdu_stats_info is filled by multiple struct htt_tx_ppdu_stats_info
-     * elements.
-     * tx_ppdu_stats_info is variable length, with length =
-     *     number_of_ppdu_stats * sizeof (struct htt_tx_ppdu_stats_info)
-     */
-    struct htt_tx_ppdu_stats_info tx_ppdu_info[0];
+	struct htt_tlv tlv_hdr;
+	u32 num_ppdu_stats;
+	/* tx_ppdu_stats_info is filled by multiple struct htt_tx_ppdu_stats_info
+	 * elements.
+	 * tx_ppdu_stats_info is variable length, with length =
+	 *     number_of_ppdu_stats * sizeof (struct htt_tx_ppdu_stats_info)
+	 */
+	struct htt_tx_ppdu_stats_info tx_ppdu_info[0];
 } __packed;
 
 struct htt_ppdu_user_stats {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 854d8ca..3db3d54 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -962,7 +962,7 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 	u16 tlv_tag, tlv_len;
 	int ret = -EINVAL;
 
-	while(len > 0) {
+	while (len > 0) {
 		if (len < sizeof(*tlv)) {
 			ath11k_err(ab, "htt tlv parse failure at byte %zd (%zu bytes left, %zu expected)\n",
 				   ptr - begin, len, sizeof(*tlv));
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 8ee4446..38b4197 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -437,9 +437,9 @@ enum hal_reo_cmd_type {
 enum hal_reo_cmd_status {
 	HAL_REO_CMD_SUCCESS		= 0,
 	HAL_REO_CMD_BLOCKED		= 1,
-        HAL_REO_CMD_FAILED		= 2,
-        HAL_REO_CMD_RESOURCE_BLOCKED	= 3,
-        HAL_REO_CMD_DRAIN		= 0xff,
+	HAL_REO_CMD_FAILED		= 2,
+	HAL_REO_CMD_RESOURCE_BLOCKED	= 3,
+	HAL_REO_CMD_DRAIN		= 0xff,
 };
 
 struct hal_wbm_idle_scatter_list {
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 6bf2446..8becedd 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -74,8 +74,8 @@ static void ath11k_htc_prepare_tx_skb(struct ath11k_htc_ep *ep,
 	hdr->htc_info = FIELD_PREP(HTC_HDR_ENDPOINTID, ep->eid) |
 			FIELD_PREP(HTC_HDR_PAYLOADLEN,
 				   (skb->len - sizeof(*hdr))) |
-                        FIELD_PREP(HTC_HDR_FLAGS,
-                                   ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE);
+			FIELD_PREP(HTC_HDR_FLAGS,
+				   ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE);
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->ctrl_info = FIELD_PREP(HTC_HDR_CONTROLBYTES1, ep->seq_no++);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 42ebc40..13fd431 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -183,7 +183,7 @@ int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc,
 	}
 
 	while (i < max_rates_idx) {
-		if(hw_rc == ath11k_legacy_rates[i].hw_value) {
+		if (hw_rc == ath11k_legacy_rates[i].hw_value) {
 			*rateidx = i;
 			*rate = ath11k_legacy_rates[i].bitrate;
 			return 0;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e563867..c055b15 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5294,7 +5294,7 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_
 	if (install_key_compl.status !=
 		WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS) {
 		ath11k_warn(ab, "install key failed for %pM status %d\n",
-			    install_key_compl.macaddr,install_key_compl.status);
+			    install_key_compl.macaddr, install_key_compl.status);
 		ar->install_key_status = install_key_compl.status;
 	}
 
@@ -5535,7 +5535,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
 		goto out;
 
-	data = (u8 *) skb->data;
+	data = (u8 *)skb->data;
 	len = skb->len;
 
 	switch (id) {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
