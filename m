Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNf4N-0003Nt-Tl
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:58:23 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: add tracing support for pktlog
Date: Mon,  6 May 2019 20:28:05 +0530
Message-Id: <1557154685-15867-1-git-send-email-akolli@codeaurora.org>
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

Add trace events on htt_pktlog and htt_ppdu_stats
and rx statistics.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig  |   6 ++
 drivers/net/wireless/ath/ath11k/Makefile |   4 ++
 drivers/net/wireless/ath/ath11k/debug.h  |   1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c  |  11 ++--
 drivers/net/wireless/ath/ath11k/trace.c  |   9 +++
 drivers/net/wireless/ath/ath11k/trace.h  | 110 +++++++++++++++++++++++++++++++
 6 files changed, 135 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/trace.c
 create mode 100644 drivers/net/wireless/ath/ath11k/trace.h

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 8a409ff2c8f5..26bf98fa648e 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -26,3 +26,9 @@ config ATH11K_DEBUGFS
 	  Enable ath11k debugfs support
 
 	  If unsure, say Y to make it easier to debug problems.
+
+config ATH11K_TRACING
+	bool "ath11k tracing support"
+	depends on ATH11K && EVENT_TRACING
+	---help---
+	  Select this to ath11k use tracing infrastructure.
diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
index 4f1343f253a1..4f86b1841e55 100644
--- a/drivers/net/wireless/ath/ath11k/Makefile
+++ b/drivers/net/wireless/ath/ath11k/Makefile
@@ -19,3 +19,7 @@ ath11k-y += core.o \
 ath11k-$(CONFIG_ATH11K_DEBUGFS) += debug_htt_stats.o
 ath11k-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
 ath11k-$(CONFIG_NL80211_TESTMODE) += testmode.o
+ath11k-$(CONFIG_ATH11K_TRACING) += trace.o
+
+# for tracing framework to find trace.h
+CFLAGS_trace.o := -I$(src)
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 7f62da8d8b8b..e51235f62536 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -7,6 +7,7 @@
 #define _ATH11K_DEBUG_H_
 
 #include "hal_tx.h"
+#include "trace.h"
 
 enum ath11k_debug_mask {
 	ATH11K_DBG_AHB		= 0x00000001,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 257dd97275d8..0851b2a0076f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -989,7 +989,7 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	ar = ab->pdevs[pdev_id].ar;
 
 	if (ath11k_debug_is_pktlog_lite_mode_enabled(ar)) {
-		/* TODO update the pktlog tracing */
+		trace_ath11k_htt_ppdu_stats(ar, skb->data, len);
 	}
 
 	/* TLV info starts after 16bytes of header */
@@ -1014,10 +1014,9 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 static void ath11k_htt_pktlog(struct ath11k_base *ab,
 				     struct sk_buff *skb)
 {
-	u32 *data = (u32 *)skb->data;
+	u32 *data = (u32 *)skb->data, len;
 	struct ath11k *ar;
 	u8 pdev_id;
-	u32 len;
 
 	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, *data);
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *data);
@@ -1025,7 +1024,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab,
 	ar = ab->pdevs[pdev_id].ar;
 	++data;
 
-	/* TODO add pktlog tracing */
+	trace_ath11k_htt_pktlog(ar, data, len);
 }
 
 void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
@@ -2301,7 +2300,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		ppdu_info.peer_id = HAL_INVALID_PEERID;
 
 		if (ath11k_debug_is_pktlog_rx_stats_enabled(ar)) {
-			/* TODO update the pktlog tracing */
+			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 		}
 
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info,
@@ -2330,7 +2329,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
 
 		if (ath11k_debug_is_pktlog_peer_vaild(ar, peer->addr)) {
-			/* TODO update the pktlog tracing for one peer*/
+			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
 		}
 		spin_unlock_bh(&ab->data_lock);
 		rcu_read_unlock();
diff --git a/drivers/net/wireless/ath/ath11k/trace.c b/drivers/net/wireless/ath/ath11k/trace.c
new file mode 100644
index 000000000000..df56457b7cbf
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/trace.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
new file mode 100644
index 000000000000..f369db153282
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#if !defined(_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+
+#include <linux/tracepoint.h>
+#include "core.h"
+
+#define _TRACE_H_
+
+/* create empty functions when tracing is disabled */
+#if !defined(CONFIG_ATH11K_TRACING)
+#undef TRACE_EVENT
+#define TRACE_EVENT(name, proto, ...) \
+static inline void trace_ ## name(proto) {}
+#endif /* !CONFIG_ATH11K_TRACING || __CHECKER__ */
+
+TRACE_EVENT(ath11k_htt_pktlog,
+	    TP_PROTO(struct ath11k *ar, const void *buf, u16 buf_len),
+
+	TP_ARGS(ar, buf, buf_len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, buf_len)
+		__dynamic_array(u8, pktlog, buf_len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->buf_len = buf_len;
+		memcpy(__get_dynamic_array(pktlog), buf, buf_len);
+	),
+
+	TP_printk(
+		"%s %s size %hu",
+		__get_str(driver),
+		__get_str(device),
+		__entry->buf_len
+	 )
+);
+
+TRACE_EVENT(ath11k_htt_ppdu_stats,
+	    TP_PROTO(struct ath11k *ar, const void *data, size_t len),
+
+	TP_ARGS(ar, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, len)
+		__dynamic_array(u8, ppdu, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->len = len;
+		memcpy(__get_dynamic_array(ppdu), data, len);
+	),
+
+	TP_printk(
+		"%s %s ppdu len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	 )
+);
+
+TRACE_EVENT(ath11k_htt_rxdesc,
+	    TP_PROTO(struct ath11k *ar, const void *data, size_t len),
+
+	TP_ARGS(ar, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, len)
+		__dynamic_array(u8, rxdesc, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->len = len;
+		memcpy(__get_dynamic_array(rxdesc), data, len);
+	),
+
+	TP_printk(
+		"%s %s rxdesc len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	 )
+);
+
+#endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
+
+/* we don't want to use include/trace/events */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
