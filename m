Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C86C433FE
	for <ath11k@archiver.kernel.org>; Fri, 11 Feb 2022 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiP/ltnkfPyT59rvVA4eOKnZFznUrOnuAHyxNQRxqAU=; b=mZi3CT9yR0gLSn
	jUe9x2vOdoMxerCZjg0kMAGvarrVBizkZyRKPunwKqJfVcDffDhYgQqqekODP1qZbrY6Chlug7SvW
	OI+FhVURe0cf1jQjsGlwr8z57RE0mpJKYDR+B3WsGhk+4OcUp4YJb9C6A8xknyiRurj6GmG5diWm7
	b22Ac30udROCQDn/4yIeeb9UghDUyd+zRwlrceBwO6ZFRWoKq+pRgyamYhRpYhaDExVusVozfi9mE
	YsFIOvAGCqPhm0uF0oZEmbn87aHDQePFfsqyS8focg5Y10QfBQChJAJiIuxuWE2iQVSJ22194iU1Z
	pcH08Zr+9fvpAxlVtXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXX1-007iOn-1q; Fri, 11 Feb 2022 15:08:19 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXWv-007iLv-G9
 for ath11k@lists.infradead.org; Fri, 11 Feb 2022 15:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644592094; x=1676128094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=mti1vG6w+K4lCasilkLEwqCBOg+fp+dKorwiFQkDPeE=;
 b=AS7sTAjCCr0Q21CmALB8+WDsDtvu6DAVsYhqVUf35woGtNU7lrUjpmRv
 1tcAnc27q/k/tjNQkgmac0UXTNO2L0BkZIdLs0UTzjvGVN/RWC5bpNN9D
 tythlEaMrEo9UuRs78ZEtOe/VKmLkYx4bYIvQ5nKVrU1Y7xHZyGMd9470 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 07:08:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:08:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 07:08:09 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 11 Feb 2022 07:08:07 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH 1/6] nl80211: vendor-cmd: qca: add command for CFR
 configuration
Date: Fri, 11 Feb 2022 20:37:50 +0530
Message-ID: <1644592075-27082-2-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644592075-27082-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1644592075-27082-1-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_070813_608665_FDC2513D 
X-CRM114-Status: GOOD (  21.57  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patch is to add vendor command support to configure per
peer CFR parameters.

An example of usage:
iw dev wlanx vendor send 0x1374 0xad cfr-en <val> bw <bw> method <method>
periodicity <period> addr <mac_addr>

0x1374: vendor id
0xad: : vendor subcmd id
val: 0 to disable CFR capture
     1 to enable CFR capture

bw: CFR capture bandwidth(use the values in enum nl80211_chan_width)
	1 - 20MHZ
	2 - 40MHZ
	3 - 80MHZ

method: Method used by hardware to collect the CFR dump
	0 - from the ACKs of QOS NULL packets
	1 - from the ACKs of QOS NULL packets with phase
	2 - from the ACK of probe response packet

periodicity: Periodicity in ms at which CFR dump need to be collect
	0 - single shot capture
	non zero - for Periodic captures

mac_addr: mac address of the peer for which CFR capture is requested.

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 include/uapi/linux/nl80211-vnd-qca.h | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 include/uapi/linux/nl80211-vnd-qca.h

diff --git a/include/uapi/linux/nl80211-vnd-qca.h b/include/uapi/linux/nl80211-vnd-qca.h
new file mode 100644
index 0000000..3c1158d
--- /dev/null
+++ b/include/uapi/linux/nl80211-vnd-qca.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Qualcomm Atheros OUI and vendor specific assignments
+ * Copyright (c) 2014-2017, Qualcomm Atheros, Inc.
+ * Copyright (c) 2018-2020, The Linux Foundation
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights
+ */
+
+#ifndef _UAPI_NL80211_VND_QCA_H
+#define _UAPI_NL80211_VND_QCA_H
+
+
+/* Vendor id to be used in vendor specific command and events to user space
+ * NOTE: The authoritative place for definition of QCA_NL80211_VENDOR_ID,
+ * vendor subcmd definitions prefixed with QCA_NL80211_VENDOR_SUBCMD, and
+ * qca_wlan_vendor_attr is open source file src/common/qca-vendor.h in
+ * git://w1.fi/srv/git/hostap.git; the values here are just a copy of that
+ */
+#define OUI_QCA 0x001374
+
+/**
+ * enum qca_nl80211_vendor_subcmds - QCA nl80211 vendor command identifiers
+ * @QCA_NL80211_VENDOR_SUBCMD_PEER_CFR_CAPTURE_CFG: This command is used to
+ * configure parameters per peer to capture Channel Frequency Response
+ * (CFR) and enable Periodic CFR capture. The attributes for this command
+ * are defined in enum qca_wlan_vendor_peer_cfr_capture_attr. This command
+ * can also be used to send CFR data from the driver to userspace when
+ * netlink events are used to send CFR data.
+ *
+ */
+enum qca_nl80211_vendor_subcmds {
+	QCA_NL80211_VENDOR_SUBCMD_PEER_CFR_CAPTURE_CFG = 173,
+};
+
+/**
+ * enum qca_wlan_vendor_cfr_method - QCA vendor CFR methods used by
+ * attribute QCA_WLAN_VENDOR_ATTR_PEER_CFR_METHOD as part of vendor
+ * command QCA_NL80211_VENDOR_SUBCMD_PEER_CFR_CAPTURE_CFG.
+ * @QCA_WLAN_VENDOR_CFR_METHOD_QOS_NULL: CFR method using QoS Null frame
+ * @QCA_WLAN_VENDOR_CFR_QOS_NULL_WITH_PHASE: CFR method using QoS Null frame
+ * with phase
+ * @QCA_WLAN_VENDOR_CFR_PROBE_RESPONSE: CFR method using Probe Response frame
+ */
+enum qca_wlan_vendor_cfr_method {
+	QCA_WLAN_VENDOR_CFR_METHOD_QOS_NULL = 0,
+	QCA_WLAN_VENDOR_CFR_QOS_NULL_WITH_PHASE = 1,
+	QCA_WLAN_VENDOR_CFR_PROBE_RESPONSE = 2,
+};
+
+/**
+ * enum qca_wlan_vendor_peer_cfr_capture_attr - Used by the vendor command
+ * QCA_NL80211_VENDOR_SUBCMD_PEER_CFR_CAPTURE_CFG to configure peer
+ * Channel Frequency Response capture parameters and enable periodic CFR
+ * capture.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_CFR_PEER_MAC_ADDR: Optional (6-byte MAC address)
+ * MAC address of peer. This is for CFR version 1 only.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_PEER_CFR_ENABLE: Required (flag)
+ * Enable peer CFR capture. This attribute is mandatory to enable peer CFR
+ * capture. If this attribute is not present, peer CFR capture is disabled.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_PEER_CFR_BANDWIDTH: Optional (u8)
+ * BW of measurement, attribute uses the values in enum nl80211_chan_width
+ * Supported values: 20, 40, 80, 80+80, 160.
+ * Note that all targets may not support all bandwidths.
+ * This attribute is mandatory for version 1 if attribute
+ * QCA_WLAN_VENDOR_ATTR_PEER_CFR_ENABLE is used.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_PEER_CFR_PERIODICITY: Optional (u32)
+ * Periodicity of CFR measurement in milliseconds.
+ * Periodicity should be a multiple of Base timer.
+ * Current Base timer value supported is 10 milliseconds (default).
+ * 0 for one shot capture.
+ * This attribute is mandatory for version 1 if attribute
+ * QCA_WLAN_VENDOR_ATTR_PEER_CFR_ENABLE is used.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_PEER_CFR_METHOD: Optional (u8)
+ * Method used to capture Channel Frequency Response.
+ * Attribute uses the values defined in enum qca_wlan_vendor_cfr_method.
+ * This attribute is mandatory for version 1 if attribute
+ * QCA_WLAN_VENDOR_ATTR_PEER_CFR_ENABLE is used.
+ *
+ * @QCA_WLAN_VENDOR_ATTR_PERIODIC_CFR_CAPTURE_ENABLE: Optional (flag)
+ * Enable periodic CFR capture.
+ * This attribute is mandatory for version 1 to enable Periodic CFR capture.
+ * If this attribute is not present, periodic CFR capture is disabled.
+ */
+enum qca_wlan_vendor_peer_cfr_capture_attr {
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_CAPTURE_INVALID = 0,
+	QCA_WLAN_VENDOR_ATTR_CFR_PEER_MAC_ADDR = 1,
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_ENABLE = 2,
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_BANDWIDTH = 3,
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_PERIODICITY = 4,
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_METHOD = 5,
+	QCA_WLAN_VENDOR_ATTR_PERIODIC_CFR_CAPTURE_ENABLE = 6,
+
+	/* Keep last */
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_AFTER_LAST,
+	QCA_WLAN_VENDOR_ATTR_PEER_CFR_MAX =
+		QCA_WLAN_VENDOR_ATTR_PEER_CFR_AFTER_LAST - 1,
+};
+
+#endif /* QCA_VENDOR_H */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
