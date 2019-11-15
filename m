Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXuy-0002TJ-6j
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:29:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 05/49] ath11k: add ahb.h
Date: Fri, 15 Nov 2019 11:28:29 +0200
Message-Id: <1573810153-29623-6-git-send-email-kvalo@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/ahb.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
new file mode 100644
index 000000000000..93f46dfe22df
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+#ifndef ATH11K_AHB_H
+#define ATH11K_AHB_H
+
+#include "core.h"
+
+#define ATH11K_AHB_RECOVERY_TIMEOUT (3 * HZ)
+struct ath11k_base;
+
+static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
+{
+	return ioread32(ab->mem + offset);
+}
+
+static inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
+{
+	iowrite32(value, ab->mem + offset);
+}
+
+void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab);
+void ath11k_ahb_ext_irq_disable(struct ath11k_base *ab);
+int ath11k_ahb_start(struct ath11k_base *ab);
+void ath11k_ahb_stop(struct ath11k_base *ab);
+int ath11k_ahb_power_up(struct ath11k_base *ab);
+void ath11k_ahb_power_down(struct ath11k_base *ab);
+int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,
+				   u8 *ul_pipe, u8 *dl_pipe);
+
+int ath11k_ahb_init(void);
+void ath11k_ahb_exit(void);
+
+#endif


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
