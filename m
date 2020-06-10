Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jitgZ-000559-AD
 for ath11k@lists.infradead.org; Wed, 10 Jun 2020 05:54:05 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 2/2] ath11k: Add support for ring backpressure stats
Date: Wed, 10 Jun 2020 11:21:48 +0530
Message-Id: <1591768308-32005-3-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1591768308-32005-1-git-send-email-srirrama@codeaurora.org>
References: <1591768308-32005-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

Add support for collecting and dumping the ring backpressure
stats via debugfs. Stats are dumped only if events are
received for the specific ring.

Below command can be used to obtain these stats as part of soc dp stats.
cat /sys/kernel/debug/ath11k/ipq8074/soc_dp_stats

 Sample Output - When No stats available:

 Backpressure Stats
 ==================
 No Ring Backpressure stats received

 Sample Output -  When ring bp stats available for specific ring

 Backpressure Stats
 ==================
 Ring: REO2SW1_RING
 count: 1
 hp: 2
 tp: 2
 seen before: 4ms

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01213-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  20 ++++++
 drivers/net/wireless/ath/ath11k/debug.c | 105 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp.h    |  42 +++++++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  28 ++++++++-
 4 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c50c832..4e364ee 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -582,6 +582,25 @@ struct ath11k_board_data {
 /* IPQ8074 HW channel counters frequency value in hertz */
 #define IPQ8074_CC_FREQ_HERTZ 320000
 
+struct ath11k_bp_stats {
+	/* Head Pointer reported by the last HTT Backpressure event for the ring */
+	u16 hp;
+
+	/* Tail Pointer reported by the last HTT Backpressure event for the ring */
+	u16 tp;
+
+	/* Number of Backpressure events received for the ring */
+	u32 count;
+
+	/* Last recorded event timestamp */
+	unsigned long jiffies;
+};
+
+struct ath11k_dp_ring_bp_stats {
+	struct ath11k_bp_stats umac_ring_bp_stats[HTT_SW_UMAC_RING_IDX_MAX];
+	struct ath11k_bp_stats lmac_ring_bp_stats[HTT_SW_LMAC_RING_IDX_MAX][MAX_RADIOS];
+};
+
 struct ath11k_soc_dp_tx_err_stats {
 	/* TCL Ring Descriptor unavailable */
 	u32 desc_na[DP_TCL_NUM_RING_MAX];
@@ -598,6 +617,7 @@ struct ath11k_soc_dp_stats {
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
 	struct ath11k_soc_dp_tx_err_stats tx_err;
+	struct ath11k_dp_ring_bp_stats bp_stats;
 };
 
 /* Master structure to hold the hw data which may be used in core module */
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 647d5a5..62a1aa0 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -12,6 +12,43 @@
 #include "debug_htt_stats.h"
 #include "peer.h"
 
+static const char *htt_bp_umac_ring[HTT_SW_UMAC_RING_IDX_MAX] = {
+	"REO2SW1_RING",
+	"REO2SW2_RING",
+	"REO2SW3_RING",
+	"REO2SW4_RING",
+	"WBM2REO_LINK_RING",
+	"REO2TCL_RING",
+	"REO2FW_RING",
+	"RELEASE_RING",
+	"PPE_RELEASE_RING",
+	"TCL2TQM_RING",
+	"TQM_RELEASE_RING",
+	"REO_RELEASE_RING",
+	"WBM2SW0_RELEASE_RING",
+	"WBM2SW1_RELEASE_RING",
+	"WBM2SW2_RELEASE_RING",
+	"WBM2SW3_RELEASE_RING",
+	"REO_CMD_RING",
+	"REO_STATUS_RING",
+};
+
+static const char *htt_bp_lmac_ring[HTT_SW_LMAC_RING_IDX_MAX] = {
+	"FW2RXDMA_BUF_RING",
+	"FW2RXDMA_STATUS_RING",
+	"FW2RXDMA_LINK_RING",
+	"SW2RXDMA_BUF_RING",
+	"WBM2RXDMA_LINK_RING",
+	"RXDMA2FW_RING",
+	"RXDMA2SW_RING",
+	"RXDMA2RELEASE_RING",
+	"RXDMA2REO_RING",
+	"MONITOR_STATUS_RING",
+	"MONITOR_BUF_RING",
+	"MONITOR_DESC_RING",
+	"MONITOR_DEST_RING",
+};
+
 void ath11k_info(struct ath11k_base *ab, const char *fmt, ...)
 {
 	struct va_format vaf = {
@@ -739,6 +776,72 @@ static const struct file_operations fops_extd_rx_stats = {
 	.open = simple_open,
 };
 
+static int ath11k_fill_bp_stats(struct ath11k_base *ab,
+				struct ath11k_bp_stats *bp_stats,
+				char *buf, int len, int size)
+{
+	lockdep_assert_held(&ab->base_lock);
+
+	len += scnprintf(buf + len, size - len, "count: %u\n",
+			 bp_stats->count);
+	len += scnprintf(buf + len, size - len, "hp: %u\n",
+			 bp_stats->hp);
+	len += scnprintf(buf + len, size - len, "tp: %u\n",
+			 bp_stats->tp);
+	len += scnprintf(buf + len, size - len, "seen before: %ums\n\n",
+			 jiffies_to_msecs(jiffies - bp_stats->jiffies));
+	return len;
+}
+
+static ssize_t ath11k_debug_dump_soc_ring_bp_stats(struct ath11k_base *ab,
+						   char *buf, int size)
+{
+	struct ath11k_bp_stats *bp_stats;
+	bool stats_rxd = false;
+	u8 i, pdev_idx;
+	int len = 0;
+
+	len += scnprintf(buf + len, size - len, "\nBackpressure Stats\n");
+	len += scnprintf(buf + len, size - len, "==================\n");
+
+	spin_lock_bh(&ab->base_lock);
+	for (i = 0; i < HTT_SW_UMAC_RING_IDX_MAX; i++) {
+		bp_stats = &ab->soc_stats.bp_stats.umac_ring_bp_stats[i];
+
+		if (!bp_stats->count)
+			continue;
+
+		len += scnprintf(buf + len, size - len, "Ring: %s\n",
+				 htt_bp_umac_ring[i]);
+		len = ath11k_fill_bp_stats(ab, bp_stats, buf, len, size);
+		stats_rxd = true;
+	}
+
+	for (i = 0; i < HTT_SW_LMAC_RING_IDX_MAX; i++) {
+		for (pdev_idx = 0; pdev_idx < MAX_RADIOS; pdev_idx++) {
+			bp_stats =
+				&ab->soc_stats.bp_stats.lmac_ring_bp_stats[i][pdev_idx];
+
+			if (!bp_stats->count)
+				continue;
+
+			len += scnprintf(buf + len, size - len, "Ring: %s\n",
+					 htt_bp_lmac_ring[i]);
+			len += scnprintf(buf + len, size - len, "pdev: %d\n",
+					 pdev_idx);
+			len = ath11k_fill_bp_stats(ab, bp_stats, buf, len, size);
+			stats_rxd = true;
+		}
+	}
+	spin_unlock_bh(&ab->base_lock);
+
+	if (!stats_rxd)
+		len += scnprintf(buf + len, size - len,
+				 "No Ring Backpressure stats received\n\n");
+
+	return len;
+}
+
 static ssize_t ath11k_debug_dump_soc_dp_stats(struct file *file,
 					      char __user *user_buf,
 					      size_t count, loff_t *ppos)
@@ -799,6 +902,8 @@ static ssize_t ath11k_debug_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	len += ath11k_debug_dump_soc_ring_bp_stats(ab, buf + len, size - len);
+
 	if (len > size)
 		len = size;
 	retval = simple_read_from_buffer(user_buf, count, ppos, buf, len);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 058a5c1..7587862 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -999,6 +999,48 @@ struct htt_resp_msg {
 #define HTT_BACKPRESSURE_EVENT_HP_M GENMASK(15, 0)
 #define HTT_BACKPRESSURE_EVENT_TP_M GENMASK(31, 16)
 
+#define HTT_BACKPRESSURE_UMAC_RING_TYPE	0
+#define HTT_BACKPRESSURE_LMAC_RING_TYPE	1
+
+enum htt_backpressure_umac_ringid {
+	HTT_SW_RING_IDX_REO_REO2SW1_RING,
+	HTT_SW_RING_IDX_REO_REO2SW2_RING,
+	HTT_SW_RING_IDX_REO_REO2SW3_RING,
+	HTT_SW_RING_IDX_REO_REO2SW4_RING,
+	HTT_SW_RING_IDX_REO_WBM2REO_LINK_RING,
+	HTT_SW_RING_IDX_REO_REO2TCL_RING,
+	HTT_SW_RING_IDX_REO_REO2FW_RING,
+	HTT_SW_RING_IDX_REO_REO_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_PPE_RELEASE_RING,
+	HTT_SW_RING_IDX_TCL_TCL2TQM_RING,
+	HTT_SW_RING_IDX_WBM_TQM_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_REO_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_WBM2SW0_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_WBM2SW1_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_WBM2SW2_RELEASE_RING,
+	HTT_SW_RING_IDX_WBM_WBM2SW3_RELEASE_RING,
+	HTT_SW_RING_IDX_REO_REO_CMD_RING,
+	HTT_SW_RING_IDX_REO_REO_STATUS_RING,
+	HTT_SW_UMAC_RING_IDX_MAX,
+};
+
+enum htt_backpressure_lmac_ringid {
+	HTT_SW_RING_IDX_FW2RXDMA_BUF_RING,
+	HTT_SW_RING_IDX_FW2RXDMA_STATUS_RING,
+	HTT_SW_RING_IDX_FW2RXDMA_LINK_RING,
+	HTT_SW_RING_IDX_SW2RXDMA_BUF_RING,
+	HTT_SW_RING_IDX_WBM2RXDMA_LINK_RING,
+	HTT_SW_RING_IDX_RXDMA2FW_RING,
+	HTT_SW_RING_IDX_RXDMA2SW_RING,
+	HTT_SW_RING_IDX_RXDMA2RELEASE_RING,
+	HTT_SW_RING_IDX_RXDMA2REO_RING,
+	HTT_SW_RING_IDX_MONITOR_STATUS_RING,
+	HTT_SW_RING_IDX_MONITOR_BUF_RING,
+	HTT_SW_RING_IDX_MONITOR_DESC_RING,
+	HTT_SW_RING_IDX_MONITOR_DEST_RING,
+	HTT_SW_LMAC_RING_IDX_MAX,
+};
+
 /* ppdu stats
  *
  * @details
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index d5cf15c..5eb76e7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1510,9 +1510,10 @@ static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
 						  struct sk_buff *skb)
 {
 	u32 *data = (u32 *)skb->data;
-	u8 pdev_id, ring_type, ring_id;
+	u8 pdev_id, ring_type, ring_id, pdev_idx;
 	u16 hp, tp;
 	u32 backpressure_time;
+	struct ath11k_bp_stats *bp_stats;
 
 	pdev_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_PDEV_ID_M, *data);
 	ring_type = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_TYPE_M, *data);
@@ -1527,6 +1528,31 @@ static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt backpressure event, pdev %d, ring type %d,ring id %d, hp %d tp %d, backpressure time %d\n",
 		   pdev_id, ring_type, ring_id, hp, tp, backpressure_time);
+
+	if (ring_type == HTT_BACKPRESSURE_UMAC_RING_TYPE) {
+		if (ring_id >= HTT_SW_UMAC_RING_IDX_MAX)
+			return;
+
+		bp_stats = &ab->soc_stats.bp_stats.umac_ring_bp_stats[ring_id];
+	} else if (ring_type == HTT_BACKPRESSURE_LMAC_RING_TYPE) {
+		pdev_idx = DP_HW2SW_MACID(pdev_id);
+
+		if (ring_id >= HTT_SW_LMAC_RING_IDX_MAX || pdev_idx >= MAX_RADIOS)
+			return;
+
+		bp_stats = &ab->soc_stats.bp_stats.lmac_ring_bp_stats[ring_id][pdev_idx];
+	} else {
+		ath11k_warn(ab, "unknown ring type received in htt bp event %d\n",
+			    ring_type);
+		return;
+	}
+
+	spin_lock_bh(&ab->base_lock);
+	bp_stats->hp = hp;
+	bp_stats->tp = tp;
+	bp_stats->count++;
+	bp_stats->jiffies = jiffies;
+	spin_unlock_bh(&ab->base_lock);
 }
 
 void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
