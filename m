Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbDbp-00069q-FY
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 00:28:54 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: create new header file for regulatory
Date: Thu, 13 Jun 2019 05:58:37 +0530
Message-Id: <1560385717-18789-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Move regulatory related definitions from 'core.h'
to a new file 'reg.h'

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 20 +------------------
 drivers/net/wireless/ath/ath11k/reg.h  | 35 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 19 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/reg.h

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 038f905..4d42ab40 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -19,6 +19,7 @@
 #include "mac.h"
 #include "hw.h"
 #include "hal_rx.h"
+#include "reg.h"
 
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
 
@@ -302,16 +303,6 @@ enum ath11k_stats_type {
 	ATH11K_STATS_TYPE_MAX,
 };
 
-enum ath11k_dfs_region {
-	ATH11K_DFS_REG_UNSET,
-	ATH11K_DFS_REG_FCC,
-	ATH11K_DFS_REG_ETSI,
-	ATH11K_DFS_REG_MKK,
-	ATH11K_DFS_REG_CN,
-	ATH11K_DFS_REG_KR,
-	ATH11K_DFS_REG_UNDEF,
-};
-
 struct ath11k_htt_data_stats {
 	u64 legacy[ATH11K_COUNTER_TYPE_MAX][ATH11K_LEGACY_NUM];
 	u64 ht[ATH11K_COUNTER_TYPE_MAX][ATH11K_HT_MCS_NUM];
@@ -817,15 +808,6 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
 void ath11k_core_free_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd);
 
-/* ATH11K Regulatory API's */
-void ath11k_reg_init(struct ath11k *ar);
-void ath11k_reg_free(struct ath11k_base *ab);
-void ath11k_regd_update_work(struct work_struct *work);
-struct ieee80211_regdomain *
-ath11k_reg_build_regd(struct ath11k_base *ab,
-		      struct cur_regulatory_info *reg_info, bool intersect);
-int ath11k_regd_update(struct ath11k *ar, bool init);
-int ath11k_reg_update_chan_list(struct ath11k *ar);
 void ath11k_core_halt(struct ath11k *ar);
 u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx);
 
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
new file mode 100644
index 0000000..d0fc246
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: ISC */
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
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
