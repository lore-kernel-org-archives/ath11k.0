Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4847C433F5
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 02:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rr8YL/RoRlqPl3ccxQ5QNX1APH1AAGLfXwv+vIo0GE4=; b=J+sfSXNkv1hAq4
	6QRqW2CU/UsNbdD+m70E3BV0h+k1ri5UOTkmJKFjafRYfa71ICEMsUtRFXU64gV2yvmcHWQxl/29/
	6pc7esOUQvnJzOWeahavxwOH5iJRrJ1JBRtWuwS6r+BteoUifIAwM1AlVHYuer2hy+w/6igPoay6v
	uba6a8OqKzL52E01nTGXgupogGDouI/OQCWtNkLwY/9fygMqj31oYDT73gnYD2MFc4kOAoTIaG3I0
	Be6jhjvKD8tondLCpKVdbAktL6pRyVfAQmStquDT6p6U6CRLBW8F/fcEtxk5WAhoYLA5f9Ta2BVY0
	P+js+WJdzyQUxhp7xEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmRQ7-00Deve-D9; Thu, 05 May 2022 02:40:47 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmRQ4-00Deu1-OA
 for ath11k@lists.infradead.org; Thu, 05 May 2022 02:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651718444; x=1683254444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rMs0z5s6eelcvwJiWgRWZZjOtCXiIIzuE7LXVYMjhKY=;
 b=yUkAn2p4h+V1ZpaX+qieTJl6Bw1HZmHTNjDJvK721eWxCe3ZGQuETlwP
 ip43GY0qPBOOhD2I27i4dvynyP+yD1Ruf8f5+qi3F9RHG506k6KBXkPeS
 igfTFwlYuEJ3GLWXYWXXFMt+AWATzfFz/vf2uhV3wq35JRCnjHYWTCgmb Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 19:40:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 19:40:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 19:40:41 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 19:40:39 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] ath11k: Handle keepalive during WoWLAN suspend and resume
Date: Thu, 5 May 2022 10:40:27 +0800
Message-ID: <20220505024027.1551157-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_194044_856951_C1AB8286 
X-CRM114-Status: GOOD (  18.03  )
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

With WoWLAN enabled and after sleeping for a rather long time,
we are seeing that with some APs, it is not able to wake up
the STA though the correct wake up pattern has been configured.
This is because the host doesn't send keepalive command to
firmware, thus firmware will not send any packet to the AP and
after a specific time the AP kicks out the STA.

Fix this issue by enabling keepalive before going to suspend
and disabling it after resume back.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 1. s/wowlan/WoWLAN
 2. s/DUT/STA

 drivers/net/wireless/ath/ath11k/mac.c | 31 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.h |  4 +++
 drivers/net/wireless/ath/ath11k/wmi.c | 40 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 41 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.c | 34 ++++++++++++++++++++++
 5 files changed, 150 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1957e1713548..6e0484708d6b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9026,3 +9026,34 @@ void ath11k_mac_destroy(struct ath11k_base *ab)
 		pdev->ar = NULL;
 	}
 }
+
+int ath11k_mac_vif_set_keepalive(struct ath11k_vif *arvif,
+				 enum wmi_sta_keepalive_method method,
+				 u32 interval)
+{
+	struct ath11k *ar = arvif->ar;
+	struct wmi_sta_keepalive_arg arg = {};
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+		return 0;
+
+	if (!test_bit(WMI_TLV_SERVICE_STA_KEEP_ALIVE, ar->ab->wmi_ab.svc_map))
+		return 0;
+
+	arg.vdev_id = arvif->vdev_id;
+	arg.enabled = 1;
+	arg.method = method;
+	arg.interval = interval;
+
+	ret = ath11k_wmi_sta_keepalive(ar, &arg);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set keepalive on vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 7f93e3a9ca23..57ebfc592b00 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -8,6 +8,7 @@
 
 #include <net/mac80211.h>
 #include <net/cfg80211.h>
+#include "wmi.h"
 
 struct ath11k;
 struct ath11k_base;
@@ -173,4 +174,7 @@ void ath11k_mac_handle_beacon(struct ath11k *ar, struct sk_buff *skb);
 void ath11k_mac_handle_beacon_miss(struct ath11k *ar, u32 vdev_id);
 void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif);
 int ath11k_mac_wait_tx_complete(struct ath11k *ar);
+int ath11k_mac_vif_set_keepalive(struct ath11k_vif *arvif,
+				 enum wmi_sta_keepalive_method method,
+				 u32 interval);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 1410114d1d5c..bd8b2f1d4c1e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8959,3 +8959,43 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 
 	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
 }
+
+int ath11k_wmi_sta_keepalive(struct ath11k *ar,
+			     const struct wmi_sta_keepalive_arg *arg)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_sta_keepalive_cmd *cmd;
+	struct wmi_sta_keepalive_arp_resp *arp;
+	struct sk_buff *skb;
+	size_t len;
+
+	len = sizeof(*cmd) + sizeof(*arp);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_sta_keepalive_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_STA_KEEPALIVE_CMD) |
+				     FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->vdev_id = arg->vdev_id;
+	cmd->enabled = arg->enabled;
+	cmd->interval = arg->interval;
+	cmd->method = arg->method;
+
+	if (arg->method == WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE ||
+	    arg->method == WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST) {
+		arp = (struct wmi_sta_keepalive_arp_resp *)(cmd + 1);
+		arp->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_KEEPALVE_ARP_RESPONSE) |
+				 FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);
+		arp->src_ip4_addr = arg->src_ip4_addr;
+		arp->dest_ip4_addr = arg->dest_ip4_addr;
+		ether_addr_copy(arp->dest_mac_addr.addr, arg->dest_mac_addr);
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi sta keepalive vdev %d enabled %d method %d interval %d\n",
+		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
+
+	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 7600e9a52da8..0b53599a3743 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5907,6 +5907,45 @@ struct wmi_pdev_set_geo_table_cmd {
 	u32 rsvd_len;
 } __packed;
 
+struct wmi_sta_keepalive_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 enabled;
+	u32 method; /* WMI_STA_KEEPALIVE_METHOD_ */
+	u32 interval; /* in seconds */
+	/* NOTE: following this structure is the TLV for ARP Response:
+	 * WMI_STA_KEEPALVE_ARP_RESPONSE arp_resp; <-- ARP response
+	 */
+} __packed;
+
+struct wmi_sta_keepalive_arp_resp {
+	u32 tlv_header;
+	u32 src_ip4_addr;
+	u32 dest_ip4_addr;
+	struct wmi_mac_addr dest_mac_addr;
+} __packed;
+
+struct wmi_sta_keepalive_arg {
+	u32 vdev_id;
+	u32 enabled;
+	u32 method;
+	u32 interval;
+	u32 src_ip4_addr;
+	u32 dest_ip4_addr;
+	const u8 dest_mac_addr[ETH_ALEN];
+};
+
+enum wmi_sta_keepalive_method {
+	WMI_STA_KEEPALIVE_METHOD_NULL_FRAME = 1, /* 802.11 NULL frame */
+	WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE = 2, /* ARP response */
+	WMI_STA_KEEPALIVE_METHOD_ETHERNET_LOOPBACK = 3, /*ETHERNET LOOPBACK*/
+	WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST = 4, /* gratuitous ARP req*/
+	WMI_STA_KEEPALIVE_METHOD_MGMT_VENDOR_ACTION = 5, /* vendor action frame */
+};
+
+#define WMI_STA_KEEPALIVE_INTERVAL_DEFAULT	30
+#define WMI_STA_KEEPALIVE_INTERVAL_DISABLE	0
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len);
@@ -6087,5 +6126,7 @@ int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 				 struct ath11k_vif *arvif);
 int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_val);
 int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar);
+int ath11k_wmi_sta_keepalive(struct ath11k *ar,
+			     const struct wmi_sta_keepalive_arg *arg);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 9d088cebef03..b3e65cd13d83 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -640,6 +640,24 @@ static int ath11k_wow_protocol_offload(struct ath11k *ar, bool enable)
 	return 0;
 }
 
+static int ath11k_wow_set_keepalive(struct ath11k *ar,
+				    enum wmi_sta_keepalive_method method,
+				    u32 interval)
+{
+	struct ath11k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath11k_mac_vif_set_keepalive(arvif, method, interval);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan)
 {
@@ -691,6 +709,14 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ret = ath11k_wow_set_keepalive(ar,
+				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
+				       WMI_STA_KEEPALIVE_INTERVAL_DEFAULT);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to enable wow keepalive: %d\n", ret);
+		goto cleanup;
+	}
+
 	ret = ath11k_wow_enable(ar->ab);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start wow: %d\n", ret);
@@ -786,6 +812,14 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 		goto exit;
 	}
 
+	ret = ath11k_wow_set_keepalive(ar,
+				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
+				       WMI_STA_KEEPALIVE_INTERVAL_DISABLE);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to disable wow keepalive: %d\n", ret);
+		goto exit;
+	}
+
 exit:
 	if (ret) {
 		switch (ar->state) {

base-commit: b04efb72cd9d2d471a14f0a5758873f6c78923c2
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
