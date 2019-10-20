Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iM85s-0002ES-Or
 for ath11k@lists.infradead.org; Sun, 20 Oct 2019 10:05:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 38/49] ath11k: add reg.h
Date: Sun, 20 Oct 2019 13:03:56 +0300
Message-Id: <1571565847-10338-39-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/reg.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
new file mode 100644
index 000000000000..39b7fc943541
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef ATH11K_REG_H
+#define ATH11K_REG_H
+
+#include <linux/kernel.h>
+#include <net/regulatory.h>
+
+struct ath11k_base;
+struct ath11k;
+
+/* DFS regdomains supported by Firmware */
+enum ath11k_dfs_region {
+	ATH11K_DFS_REG_UNSET,
+	ATH11K_DFS_REG_FCC,
+	ATH11K_DFS_REG_ETSI,
+	ATH11K_DFS_REG_MKK,
+	ATH11K_DFS_REG_CN,
+	ATH11K_DFS_REG_KR,
+	ATH11K_DFS_REG_UNDEF,
+};
+
+/* ATH11K Regulatory API's */
+void ath11k_reg_init(struct ath11k *ar);
+void ath11k_reg_free(struct ath11k_base *ab);
+void ath11k_regd_update_work(struct work_struct *work);
+struct ieee80211_regdomain *
+ath11k_reg_build_regd(struct ath11k_base *ab,
+		      struct cur_regulatory_info *reg_info, bool intersect);
+int ath11k_regd_update(struct ath11k *ar, bool init);
+int ath11k_reg_update_chan_list(struct ath11k *ar);
+#endif


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
