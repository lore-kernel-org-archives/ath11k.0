Return-Path: <SRS0=USyd=PA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345A6C4332F
	for <ath11k@archiver.kernel.org>; Tue, 12 Oct 2021 11:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3DB60524
	for <ath11k@archiver.kernel.org>; Tue, 12 Oct 2021 11:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED3DB60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=blyzSy0S28h5zu97Q4i77/blfiIEuU3UIeNo1o5+o3g=; b=oO88xxHKEKUMy8
	LXZYzbHt0BLGy89zjYFPRv8horFzGuLQd/KWjdJOuaWzrJUrxStkl5E90Rsv2cm9Qlf18M/JrSuwn
	7EjeIASVwJ7QNh+75THUCJyoMRb/oUusb0ECLTzoSivYG14qL/6Mfqv3MVfldBigtszIv4sD44n8K
	hxSw6rQr+8e8eFvj8jktd1/SehWCMu5oIgMvX7n6Gdx/cz8jmEol0zO5YDHGUVFMkFi8M5aLirrH9
	m1yI2X+lHyztEq7S3McBP6Ht14LRKnm/sdA0MP/mDd0Nt3xE0fMycPXG2PzeM4BH7a31I4OTyoStW
	k8P9uJGJ/4FXxvFgz0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maFlU-00CX89-SZ; Tue, 12 Oct 2021 11:16:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maFlR-00CX6l-Dm
 for ath11k@lists.infradead.org; Tue, 12 Oct 2021 11:16:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634037368; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=RLwtSyczHXrmwI41URsgeQHDCH2qk5zy2DPYlSlzIDI=;
 b=pEixJMwzUJJqKfqwt2qUo+EAx4oj8lwIEcq1g5iNgnqHwREQZakVi2xyfbwWbuZlIQAZSnKj
 m10BtB6u9VTB5XGUTRw52vhZhWzQrqGi9lRfMAYjyaxKGBYVVDJz6Wdn2llFMR7Q88h2mesd
 fFjnUGfxzHcJB08lXgiL0NHqEsA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61656e77ff0285fb0af363fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 11:16:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 80394C43460; Tue, 12 Oct 2021 11:16:07 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 42DA3C4338F;
 Tue, 12 Oct 2021 11:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 42DA3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] ath11k: support MAC address randomization in scan
Date: Tue, 12 Oct 2021 15:16:38 -0400
Message-Id: <20211012191638.8749-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_041609_560077_217BA2C0 
X-CRM114-Status: GOOD (  14.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The driver reports NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR capability
to upper layer based on the service bit firmware reported. Driver
sets the spoofed flag in scan_ctrl_flag to firmware if upper layer
has enabled this feature in scan request.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  9 +++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 797e45e..bb5d12f40 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3048,6 +3048,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		arg.scan_flags |= WMI_SCAN_FLAG_PASSIVE;
 	}
 
+	if (req->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
+		arg.scan_f_add_spoofed_mac_in_probe = 1;
+		ether_addr_copy(arg.mac_addr.addr, req->mac_addr);
+		ether_addr_copy(arg.mac_mask.addr, req->mac_addr_mask);
+	}
+
 	if (req->n_channels) {
 		arg.num_chan = req->n_channels;
 		for (i = 0; i < arg.num_chan; i++)
@@ -4992,6 +4998,14 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	if (test_bit(WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi->wmi_ab->svc_map)) {
+		ret = ath11k_wmi_scan_prob_req_oui(ar, ar->mac_addr);
+		if (ret) {
+			ath11k_err(ab, "failed to set prob req oui: %i\n", ret);
+			goto err;
+		}
+	}
+
 	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_ARP_AC_OVERRIDE,
 					0, pdev->pdev_id);
 	if (ret) {
@@ -7888,6 +7902,11 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	ar->hw->wiphy->max_ap_assoc_sta = ar->max_num_stations;
 
+	if (test_bit(WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi->wmi_ab->svc_map)) {
+		ar->hw->wiphy->features |=
+			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
+	}
+
 	if (test_bit(WMI_TLV_SERVICE_NLO, ar->wmi->wmi_ab->svc_map)) {
 		ar->hw->wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
 		ar->hw->wiphy->max_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5b02e95..888c587 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2181,6 +2181,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	cmd->num_ssids = params->num_ssids;
 	cmd->ie_len = params->extraie.len;
 	cmd->n_probes = params->n_probes;
+	ether_addr_copy(cmd->mac_addr.addr, params->mac_addr.addr);
+	ether_addr_copy(cmd->mac_mask.addr, params->mac_mask.addr);
 
 	ptr += sizeof(*cmd);
 
@@ -8983,3 +8985,31 @@ int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 		   arvif->vdev_id);
 	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
 }
+
+int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
+				 const u8 mac_addr[ETH_ALEN])
+{
+	struct sk_buff *skb;
+	struct wmi_scan_prob_req_oui_cmd *cmd;
+	u32 prob_req_oui;
+	int len;
+
+	prob_req_oui = (((u32)mac_addr[0]) << 16) |
+		       (((u32)mac_addr[1]) << 8) | mac_addr[2];
+
+	len = sizeof(*cmd);
+	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_scan_prob_req_oui_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_SCAN_PROB_REQ_OUI_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->prob_req_oui = prob_req_oui;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "wmi scan prob req oui %d\n",
+		   prob_req_oui);
+
+	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
+}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 61dc5ea..6848089 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3369,6 +3369,8 @@ struct scan_req_params {
 	u32 num_hint_bssid;
 	struct hint_short_ssid hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
 	struct hint_bssid hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
+	struct wmi_mac_addr mac_addr;
+	struct wmi_mac_addr mac_mask;
 };
 
 struct wmi_ssid_arg {
@@ -3749,6 +3751,11 @@ struct wmi_scan_chan_list_cmd {
 	u32 pdev_id;
 } __packed;
 
+struct wmi_scan_prob_req_oui_cmd {
+	u32 tlv_header;
+	u32 prob_req_oui;
+}  __packed;
+
 #define WMI_MGMT_SEND_DOWNLD_LEN	64
 
 #define WMI_TX_PARAMS_DWORD0_POWER		GENMASK(7, 0)
@@ -6056,4 +6063,6 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 				 struct ath11k_vif *arvif, bool enable);
 int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 				 struct ath11k_vif *arvif);
+int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
+				 const u8 mac_addr[ETH_ALEN]);
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
