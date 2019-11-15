Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXx1-0006Gx-22
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:31:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 41/49] ath11k: add testmode.h
Date: Fri, 15 Nov 2019 11:29:05 +0200
Message-Id: <1573810153-29623-42-git-send-email-kvalo@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/testmode.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
new file mode 100644
index 000000000000..aaa122ed9069
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/testmode.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#include "core.h"
+
+#ifdef CONFIG_NL80211_TESTMODE
+
+bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb);
+int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  void *data, int len);
+
+#else
+
+static inline bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id,
+				       struct sk_buff *skb)
+{
+	return false;
+}
+
+static inline int ath11k_tm_cmd(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				void *data, int len)
+{
+	return 0;
+}
+
+#endif


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
