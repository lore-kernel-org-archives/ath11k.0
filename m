Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXx6-0006Kw-Tc
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:31:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 44/49] ath11k: add trace.h
Date: Fri, 15 Nov 2019 11:29:08 +0200
Message-Id: <1573810153-29623-45-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
References: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

(patches split for easier review, see the cover letter for more)

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/trace.h | 110 ++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
new file mode 100644
index 000000000000..400f759568e1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
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


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
