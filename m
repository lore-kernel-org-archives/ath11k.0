Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7oR-0008Jj-EB
 for ath11k@lists.infradead.org; Mon, 24 Aug 2020 08:26:46 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap power save
Date: Mon, 24 Aug 2020 13:56:28 +0530
Message-Id: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org

AP power save feature is to save power in AP mode, where AP goes
to power save mode when no stations associate to it and comes out
of power save when any station associate to AP.

This patch is to add vendor command support to enable/disable
ap power save.

An example of usage: iw dev wlanx vendor send 0x1374 0x4a ap-ps <val>

0x1374: vendor id
0x4a: vendor subcmd id
val: 0 - disable power save
     1 - enable power save

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
v2:
 * added use case in the commit log.

 include/uapi/nl80211-vnd-qca.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/uapi/nl80211-vnd-qca.h

diff --git a/include/uapi/nl80211-vnd-qca.h b/include/uapi/nl80211-vnd-qca.h
new file mode 100644
index 0000000..357040a
--- /dev/null
+++ b/include/uapi/nl80211-vnd-qca.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _UAPI_NL80211_VND_QCA_H
+#define _UAPI_NL80211_VND_QCA_H
+
+/* Vendor id to be used in vendor specific command and events to user space
+ * NOTE: The authoritative place for definition of QCA_NL80211_VENDOR_ID,
+ * vendor subcmd definitions prefixed with QCA_NL80211_VENDOR_SUBCMD, and
+ * qca_wlan_vendor_attr is open source file src/common/qca-vendor.h in
+ * git://w1.fi/srv/git/hostap.git; the values here are just a copy of that
+ */
+#define QCA_NL80211_VENDOR_ID 0x001374
+
+/**
+ * enum qca_nl80211_vendor_subcmds - QCA nl80211 vendor command identifiers
+ *
+ * @QCA_NL80211_VENDOR_SUBCMD_SET_WIFI_CONFIGURATION: This vendor subcommand is
+ * used to set wifi configurations by the attributes defined in
+ * enum qca_wlan_vendor_attr_config.
+ */
+enum qca_nl80211_vendor_subcmds {
+	QCA_NL80211_VENDOR_SUBCMD_SET_WIFI_CONFIGURATION = 74,
+};
+
+/**
+ * enum qca_wlan_vendor_attr_config: Attributes for data used by
+ * QCA_NL80211_VENDOR_SUBCMD_SET_WIFI_CONFIGURATION.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_CONFIG_GTX: 8-bit unsigned value to trigger
+ * green Tx power saving 1-Enable, 0-Disable.
+ */
+enum qca_wlan_vendor_attr_config {
+	QCA_WLAN_VENDOR_ATTR_CONFIG_GTX = 57,
+
+	QCA_WLAN_VENDOR_ATTR_CONFIG_AFTER_LAST,
+	QCA_WLAN_VENDOR_ATTR_CONFIG_MAX =
+		QCA_WLAN_VENDOR_ATTR_CONFIG_AFTER_LAST - 1,
+};
+#endif /* _UAPI_NL80211_VND_QCA_H_ */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
