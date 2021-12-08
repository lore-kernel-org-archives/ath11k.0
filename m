Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EDC433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rC4+AWx6zGWVQ8ht5HLFPUL3SpwpFfjhiPWT7lB094I=; b=UNXVdo6hCWF2At
	LlD8i06usqadi2mguBD2pqqr4vvtJYYqsJz+ZEHPG0011DHrXcS3+fiqs8E87oJN+eQRbKSzHwTit
	z9TZuGzVGMfyjosqNRooJsyKY/idM9FbUbHg2q8nShlsqT9mAEtNaAO0N4XogcAUg9cp954YzKVvC
	aBUn+Ix1HOCtHtZ+gQ3Wjzn4X51lL6hkhTtKw8IX+QOKKJv1wPSUAq8cgnp0wCHcb3x5CGOBsroVR
	Uii+qfpwP5QUgPVBjlWJ3cLuzUW7xndFi6SVIAj0EAoGRZGDYfsMaTBMc1m8zhRZYWQNr3rSuIIHk
	0TWu+nLc+eoZlnGXWcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1murFa-00BYK7-Nn; Wed, 08 Dec 2021 07:20:26 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1murFX-00BYIu-L1
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 07:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638948023; x=1670484023;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=S+Ax5UX1LWmc9Q+xIn45cqM/di1Yhb3Foq4J5nndr9k=;
 b=tSL/6TXbgatEX1KYiqRVJ8f2X1wrxYDAGBF4qDc1hKuY1TGShpRWwPO6
 L7B33VP1XKQpff5gMEc00CnpYghEJJiqTtDzZKEQCgkk/OvF5uz2TtYp/
 h2Z0bZxLQsy5By1E/LSd+EWyDDr6VAtg8bz/UKTOiNm5ZKgy9kZRvfLRl 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Dec 2021 23:20:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 23:20:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:20:18 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:20:17 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] ath11k: support MAC address randomization in scan
Date: Wed, 8 Dec 2021 15:20:07 +0800
Message-ID: <1638948007-9609-1-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_232023_764264_17E9F02E 
X-CRM114-Status: GOOD (  13.43  )
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

The driver reports NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR capability
to upper layer based on the service bit firmware reported. Driver
sets the spoofed flag in scan_ctrl_flag to firmware if upper layer
has enabled this feature in scan request.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
v2:
  - rebased on top of 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0

 drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c | 30 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 10 ++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ffedd22dd1c0..eb41754d6b5b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3513,6 +3513,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 			arg.chan_list[i] = req->channels[i]->center_freq;
 	}
 
+	if (req->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
+		arg.scan_f_add_spoofed_mac_in_probe = 1;
+		ether_addr_copy(arg.mac_addr.addr, req->mac_addr);
+		ether_addr_copy(arg.mac_mask.addr, req->mac_addr_mask);
+	}
+
 	ret = ath11k_start_scan(ar, &arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
@@ -5537,6 +5543,14 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
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
@@ -7991,6 +8005,11 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	ar->hw->wiphy->max_ap_assoc_sta = ar->max_num_stations;
 
+	if (test_bit(WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi->wmi_ab->svc_map)) {
+		ar->hw->wiphy->features |=
+			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
+	}
+
 	ar->hw->queues = ATH11K_HW_MAX_QUEUES;
 	ar->hw->wiphy->tx_queue_len = ATH11K_QUEUE_LEN;
 	ar->hw->offchannel_tx_hw_queue = ATH11K_HW_MAX_QUEUES - 1;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5b8c506633d1..28b421bc8861 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2179,6 +2179,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	cmd->num_ssids = params->num_ssids;
 	cmd->ie_len = params->extraie.len;
 	cmd->n_probes = params->n_probes;
+	ether_addr_copy(cmd->mac_addr.addr, params->mac_addr.addr);
+	ether_addr_copy(cmd->mac_mask.addr, params->mac_mask.addr);
 
 	ptr += sizeof(*cmd);
 
@@ -7555,3 +7557,31 @@ int ath11k_wmi_wow_enable(struct ath11k *ar)
 
 	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
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
index 35f5432357f5..f9eab99beca2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3313,6 +3313,8 @@ struct scan_req_params {
 	u32 num_hint_bssid;
 	struct hint_short_ssid hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
 	struct hint_bssid hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
+	struct wmi_mac_addr mac_addr;
+	struct wmi_mac_addr mac_mask;
 };
 
 struct wmi_ssid_arg {
@@ -3676,6 +3678,11 @@ struct wmi_scan_chan_list_cmd {
 	u32 pdev_id;
 } __packed;
 
+struct wmi_scan_prob_req_oui_cmd {
+	u32 tlv_header;
+	u32 prob_req_oui;
+}  __packed;
+
 #define WMI_MGMT_SEND_DOWNLD_LEN	64
 
 #define WMI_TX_PARAMS_DWORD0_POWER		GENMASK(7, 0)
@@ -5491,5 +5498,6 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 			   enum wmi_host_hw_mode_config_type mode);
 int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar);
 int ath11k_wmi_wow_enable(struct ath11k *ar);
-
+int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
+				 const u8 mac_addr[ETH_ALEN]);
 #endif

base-commit: 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
