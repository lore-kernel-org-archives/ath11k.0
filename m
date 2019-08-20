Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06P9-0003nB-Oe
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 15:50:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 40/49] ath11k: add testmode.c
Date: Tue, 20 Aug 2019 18:48:06 +0300
Message-Id: <1566316095-27507-41-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
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

---
 drivers/net/wireless/ath/ath11k/testmode.c | 199 +++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
new file mode 100644
index 000000000000..9274b6cc3921
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#include "testmode.h"
+#include <net/netlink.h>
+#include "debug.h"
+#include "wmi.h"
+#include "hw.h"
+#include "core.h"
+#include "testmode_i.h"
+
+static const struct nla_policy ath11k_tm_policy[ATH11K_TM_ATTR_MAX + 1] = {
+	[ATH11K_TM_ATTR_CMD]		= { .type = NLA_U32 },
+	[ATH11K_TM_ATTR_DATA]		= { .type = NLA_BINARY,
+					    .len = ATH11K_TM_DATA_MAX_LEN },
+	[ATH11K_TM_ATTR_WMI_CMDID]	= { .type = NLA_U32 },
+	[ATH11K_TM_ATTR_VERSION_MAJOR]	= { .type = NLA_U32 },
+	[ATH11K_TM_ATTR_VERSION_MINOR]	= { .type = NLA_U32 },
+};
+
+/* Returns true if callee consumes the skb and the skb should be discarded.
+ * Returns false if skb is not used. Does not sleep.
+ */
+bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb)
+{
+	struct sk_buff *nl_skb;
+	bool consumed;
+	int ret;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
+		   "testmode event wmi cmd_id %d skb %pK skb->len %d\n",
+		   cmd_id, skb, skb->len);
+
+	ath11k_dbg_dump(ar->ab, ATH11K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
+
+	spin_lock_bh(&ar->data_lock);
+
+	consumed = true;
+
+	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
+						   2 * sizeof(u32) + skb->len,
+						   GFP_ATOMIC);
+	if (!nl_skb) {
+		ath11k_warn(ar->ab,
+			    "failed to allocate skb for testmode wmi event\n");
+		goto out;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH11K_TM_ATTR_CMD, ATH11K_TM_CMD_WMI);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to to put testmode wmi event cmd attribute: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		goto out;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH11K_TM_ATTR_WMI_CMDID, cmd_id);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to to put testmode wmi even cmd_id: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		goto out;
+	}
+
+	ret = nla_put(nl_skb, ATH11K_TM_ATTR_DATA, skb->len, skb->data);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to copy skb to testmode wmi event: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		goto out;
+	}
+
+	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
+
+out:
+	spin_unlock_bh(&ar->data_lock);
+
+	return consumed;
+}
+
+static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
+{
+	struct sk_buff *skb;
+	int ret;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
+		   "testmode cmd get version_major %d version_minor %d\n",
+		   ATH11K_TESTMODE_VERSION_MAJOR,
+		   ATH11K_TESTMODE_VERSION_MINOR);
+
+	skb = cfg80211_testmode_alloc_reply_skb(ar->hw->wiphy,
+						nla_total_size(sizeof(u32)));
+	if (!skb)
+		return -ENOMEM;
+
+	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
+			  ATH11K_TESTMODE_VERSION_MAJOR);
+	if (ret) {
+		kfree_skb(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
+			  ATH11K_TESTMODE_VERSION_MINOR);
+	if (ret) {
+		kfree_skb(skb);
+		return ret;
+	}
+
+	return cfg80211_testmode_reply(skb);
+}
+
+static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[])
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct sk_buff *skb;
+	u32 cmd_id, buf_len;
+	int ret;
+	void *buf;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON) {
+		ret = -ENETDOWN;
+		goto out;
+	}
+
+	if (!tb[ATH11K_TM_ATTR_DATA]) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!tb[ATH11K_TM_ATTR_WMI_CMDID]) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	buf = nla_data(tb[ATH11K_TM_ATTR_DATA]);
+	buf_len = nla_len(tb[ATH11K_TM_ATTR_DATA]);
+	cmd_id = nla_get_u32(tb[ATH11K_TM_ATTR_WMI_CMDID]);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
+		   "testmode cmd wmi cmd_id %d buf %pK buf_len %d\n",
+		   cmd_id, buf, buf_len);
+
+	ath11k_dbg_dump(ar->ab, ATH11K_DBG_TESTMODE, NULL, "", buf, buf_len);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, buf_len);
+	if (!skb) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	memcpy(skb->data, buf, buf_len);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb, cmd_id);
+	if (ret) {
+		dev_kfree_skb(skb);
+		ath11k_warn(ar->ab, "failed to transmit wmi command (testmode): %d\n",
+			    ret);
+		goto out;
+	}
+
+	ret = 0;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  void *data, int len)
+{
+	struct ath11k *ar = hw->priv;
+	struct nlattr *tb[ATH11K_TM_ATTR_MAX + 1];
+	int ret;
+
+	ret = nla_parse(tb, ATH11K_TM_ATTR_MAX, data, len, ath11k_tm_policy,
+			NULL);
+	if (ret)
+		return ret;
+
+	if (!tb[ATH11K_TM_ATTR_CMD])
+		return -EINVAL;
+
+	switch (nla_get_u32(tb[ATH11K_TM_ATTR_CMD])) {
+	case ATH11K_TM_CMD_GET_VERSION:
+		return ath11k_tm_cmd_get_version(ar, tb);
+	case ATH11K_TM_CMD_WMI:
+		return ath11k_tm_cmd_wmi(ar, tb);
+	default:
+		return -EOPNOTSUPP;
+	}
+}


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
