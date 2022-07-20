Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3508C433EF
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AKFEHss0hqaBBT86JQcp+OPbSjeF/MN39O3jg7sio14=; b=403pJs+clqEhRj
	tqWiYomwUGVFtg3XpRGfhnDK0wUyMYhKsUMFokzyXt5glbABl9C0S9xt+GRixHEqmWhYXJbijQ5ZD
	Kh9KPywRJJ/B0OHh2sBHOc8C5Du+UNzSs86w/jH07fdZRkHA+oqKD9Vk86X0JSeGP+vYgjjn8xBaO
	GM5oKKnYjPwyOdTROdtImj1z2XGLlDCmt+8jaQ5rcC8QdVpB4cHzLZ2+1oS5JLjyByfUvxd1TDTOY
	AEAOkSP/PnTssDvl1B/+Vny2RlOVJ5nKMc/Q0SI7FWVhH4tmU7zA0PwxwVdcdxj/W19MSHqzcguiM
	85uJWV2zexmT3bmBPyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA2c-006EW6-7H; Wed, 20 Jul 2022 13:47:06 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA2Z-006EUo-4A
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658324823; x=1689860823;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a8oP1tOcBbp7S4vWaVcr9dfMKTfjLNKZVMmMu+KzqfE=;
  b=R3h4gCl1GKVqhU6ZYkaeqbHffsvExJyTiSg/4rovJ1qJee6HEU6BijjM
   fJN402zJaG3nD7jzTSem+q5wE8aRPX19K9HZaD5rYxuUYqa0TLhUKFiD/
   zFc+6runYrsWHYXS3ag8G+1U23w5id6oimBGgtV0r9to7HBAjfXbxasT0
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 20 Jul 2022 06:47:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:47:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:46:38 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:46:36 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Add support to connect to non-transmit MBSSID profiles
Date: Wed, 20 Jul 2022 19:16:22 +0530
Message-ID: <20220720134622.15293-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064703_224485_2045A485 
X-CRM114-Status: GOOD (  13.40  )
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

Add support to connect to a non-transmit MBSSID AP profile.

Non-transmit MBSSID profile parameters are passed to the firmware
via WMI VDEV UP command and this helps firmware to track MBSSID
profile within the multi-BSS beacon and report beacon loss if
any.

WCN6750, QCA6390 & WCN6855 firmwares have the support and hence
enable the support on these hardwares.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  7 +++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  |  5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c8e0bc935838..fc988db449d1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -111,6 +111,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -187,6 +188,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -262,6 +264,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
+		.supports_multi_bssid = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -337,6 +340,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 2,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -412,6 +416,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
+		.supports_multi_bssid = true,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -486,6 +491,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
+		.supports_multi_bssid = true,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -560,6 +566,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_window_idx = 2,
 		.fixed_fw_mem = true,
 		.support_off_channel_tx = false,
+		.supports_multi_bssid = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 77dc5c851c9b..fb96edbe5820 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -205,6 +205,7 @@ struct ath11k_hw_params {
 	u8 ce_window_idx;
 	bool fixed_fw_mem;
 	bool support_off_channel_tx;
+	bool supports_multi_bssid;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d83d3c944594..c36f9026912e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8835,6 +8835,11 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ab->hw_params.single_pdev_only && ar->supports_6ghz)
 		ieee80211_hw_set(ar->hw, SINGLE_SCAN_ON_ALL_BANDS);
 
+	if (ab->hw_params.supports_multi_bssid) {
+		ieee80211_hw_set(ar->hw, SUPPORTS_MULTI_BSSID);
+		ieee80211_hw_set(ar->hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
+	}
+
 	ieee80211_hw_set(ar->hw, SIGNAL_DBM);
 	ieee80211_hw_set(ar->hw, SUPPORTS_PS);
 	ieee80211_hw_set(ar->hw, SUPPORTS_DYNAMIC_PS);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5d9437ea92cf..2b5721e8e607 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -995,9 +995,13 @@ int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid, const u8 *bssid)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct wmi_vdev_up_cmd *cmd;
+	struct ieee80211_bss_conf *bss_conf;
+	struct ath11k_vif *arvif;
 	struct sk_buff *skb;
 	int ret;
 
+	arvif = ath11k_mac_get_arvif(ar, vdev_id);
+
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
 	if (!skb)
 		return -ENOMEM;
@@ -1011,6 +1015,17 @@ int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid, const u8 *bssid)
 
 	ether_addr_copy(cmd->vdev_bssid.addr, bssid);
 
+	if (arvif && arvif->vif->type == NL80211_IFTYPE_STATION) {
+		bss_conf = &arvif->vif->bss_conf;
+
+		if (bss_conf->nontransmitted) {
+			ether_addr_copy(cmd->trans_bssid.addr,
+					bss_conf->transmitter_bssid);
+			cmd->profile_idx = bss_conf->bssid_index;
+			cmd->profile_num = bss_conf->bssid_indicator;
+		}
+	}
+
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_UP_CMDID);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to submit WMI_VDEV_UP cmd\n");
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
