Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C8C4332F
	for <ath11k@archiver.kernel.org>; Thu, 17 Mar 2022 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5RIkJ8lT+chTE9LfYhgR3XJstDOU4smdcZteIqseHfo=; b=vBuTZkNVCG6xMt
	rDr5oN5Meyzl1jwNP5d9irQF79wxYcYSHpMLBIf0ZmDAzfQHPvYceUJrPVK7vQ8YC8KvAQJNVdH5t
	sGrIp73IkRlKNWfoMxrHqRxSF03gBgtoV2spmr3WEHhUXrYOqp7ad20p5r61whtoY3+TYHc1JqB3t
	fih5ap3wwSuu2RJ+FzmG3gIIfVOwpJxTqYIpXHq16kSQqkZTBpdZu5a1jrcXnf3U/uehDQ06rxDYj
	K1lokCDw4LsUosBQoWv9grv3jBnTwHxzDC0pHChO0SZVqNfBF0sYEs80ilHIvCvry7zEgdMDWaJOg
	stPAfYT87VTI2DE1S0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUevi-00EemS-4X; Thu, 17 Mar 2022 01:27:54 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUeve-00Eekv-9A
 for ath11k@lists.infradead.org; Thu, 17 Mar 2022 01:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647480470; x=1679016470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wZ6b7bHU/ZGr2Zh6zOy6w17Pj2ED/lmoBHfXzsLRHUU=;
 b=eIDU+6BtGWX1MSO6ENcLm/hPHqL5OZiYAYGDZ2vcKmEFsHeGANwxifLX
 6WoMAFPmdo2v1tVJeDXGmKFHhogwsgC6kixDimVTrCaw0biyYbzNno1+7
 TQDgolKhFT1CuFSBoy7ye7S/10HigcbBUijruONw/bh0kKzkdX7TQU2Xw M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 18:27:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 18:27:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 18:27:47 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 18:27:45 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Add support for SAR
Date: Thu, 17 Mar 2022 09:27:28 +0800
Message-ID: <20220317012728.18932-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_182750_401002_A181DD6F 
X-CRM114-Status: GOOD (  17.62  )
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

ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
and this function is called when user space application
calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
type and frequency ranges to wiphy so user space can query
SAR capabilities.

This feature is currently enabled for WCN6855.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  6 +++
 drivers/net/wireless/ath/ath11k/hw.c   | 20 ++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 66 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h  | 27 ++++++++++
 6 files changed, 191 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 71eb7d04c3bf..1da3a7d98c25 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -100,6 +100,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = false,
 		.current_cc_support = false,
 		.dbr_debug_support = true,
+		.bios_sar_capa = NULL,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -166,6 +167,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = false,
 		.current_cc_support = false,
 		.dbr_debug_support = true,
+		.bios_sar_capa = NULL,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -231,6 +233,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = true,
 		.current_cc_support = true,
 		.dbr_debug_support = false,
+		.bios_sar_capa = NULL,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -296,6 +299,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = false,
 		.current_cc_support = false,
 		.dbr_debug_support = true,
+		.bios_sar_capa = NULL,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -361,6 +365,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = true,
 		.current_cc_support = true,
 		.dbr_debug_support = false,
+		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -425,6 +430,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw_wmi_diag_event = true,
 		.current_cc_support = true,
 		.dbr_debug_support = false,
+		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d1b0e76d9ec2..46449a18b5cb 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -2154,3 +2154,23 @@ const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
 };
+
+static const struct cfg80211_sar_freq_ranges ath11k_hw_sar_freq_ranges_wcn6855[] = {
+	{.start_freq = 2402, .end_freq = 2482 },  /* 2G ch1~ch13 */
+	{.start_freq = 5150, .end_freq = 5250 },  /* 5G UNII-1 ch32~ch48 */
+	{.start_freq = 5250, .end_freq = 5725 },  /* 5G UNII-2 ch50~ch144 */
+	{.start_freq = 5725, .end_freq = 5810 },  /* 5G UNII-3 ch149~ch161 */
+	{.start_freq = 5815, .end_freq = 5895 },  /* 5G UNII-4 ch163~ch177 */
+	{.start_freq = 5925, .end_freq = 6165 },  /* 6G UNII-5 Ch1, Ch2 ~ Ch41 */
+	{.start_freq = 6165, .end_freq = 6425 },  /* 6G UNII-5 ch45~ch93 */
+	{.start_freq = 6425, .end_freq = 6525 },  /* 6G UNII-6 ch97~ch113 */
+	{.start_freq = 6525, .end_freq = 6705 },  /* 6G UNII-7 ch117~ch149 */
+	{.start_freq = 6705, .end_freq = 6875 },  /* 6G UNII-7 ch153~ch185 */
+	{.start_freq = 6875, .end_freq = 7125 },  /* 6G UNII-8 ch189~ch233 */
+};
+
+const struct cfg80211_sar_capa ath11k_hw_sar_capa_wcn6855 = {
+	.type = NL80211_SAR_TYPE_POWER,
+	.num_freq_ranges = (ARRAY_SIZE(ath11k_hw_sar_freq_ranges_wcn6855)),
+	.freq_ranges = ath11k_hw_sar_freq_ranges_wcn6855,
+};
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 27ca4a9c20fc..2e6ce5240c46 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -194,6 +194,7 @@ struct ath11k_hw_params {
 	bool fw_wmi_diag_event;
 	bool current_cc_support;
 	bool dbr_debug_support;
+	const struct cfg80211_sar_capa *bios_sar_capa;
 };
 
 struct ath11k_hw_ops {
@@ -361,4 +362,5 @@ extern const struct ath11k_hw_regs qca6390_regs;
 extern const struct ath11k_hw_regs qcn9074_regs;
 extern const struct ath11k_hw_regs wcn6855_regs;
 
+extern const struct cfg80211_sar_capa ath11k_hw_sar_capa_wcn6855;
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d5b83f90d27a..9034a59c4ddd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8069,6 +8069,67 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	}
 }
 
+static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
+					    const struct cfg80211_sar_specs *sar)
+{
+	struct ath11k *ar = hw->priv;
+	const struct cfg80211_sar_sub_specs *sspec = sar->sub_specs;
+	u8 *sar_tbl;
+	u32 i;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (!test_bit(WMI_TLV_SERVICE_BIOS_SAR_SUPPORT, ar->ab->wmi_ab.svc_map) ||
+	    !ar->ab->hw_params.bios_sar_capa) {
+		ret = -EOPNOTSUPP;
+		goto exit;
+	}
+
+	if (!sar || sar->type != NL80211_SAR_TYPE_POWER ||
+	    sar->num_sub_specs == 0) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = ath11k_wmi_pdev_set_bios_geo_table_param(ar);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set geo table: %d\n", ret);
+		goto exit;
+	}
+
+	sar_tbl = kzalloc(BIOS_SAR_TABLE_LEN, GFP_KERNEL);
+	if (!sar_tbl) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	for (i = 0; i < sar->num_sub_specs; i++) {
+		if (sspec->freq_range_index >= (BIOS_SAR_TABLE_LEN >> 1)) {
+			ath11k_warn(ar->ab, "Ignore bad frequency index %u, max allowed %u\n",
+				    sspec->freq_range_index, BIOS_SAR_TABLE_LEN >> 1);
+			continue;
+		}
+
+		/* chain0 and chain1 share same power setting */
+		sar_tbl[sspec->freq_range_index] = sspec->power;
+		sar_tbl[sspec->freq_range_index + (BIOS_SAR_TABLE_LEN >> 1)] = sspec->power;
+		ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "sar tbl[%d] = %d\n",
+			   sspec->freq_range_index, sar_tbl[sspec->freq_range_index]);
+		sspec++;
+	}
+
+	ret = ath11k_wmi_pdev_set_bios_sar_table_param(ar, sar_tbl);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set sar power: %d", ret);
+
+	kfree(sar_tbl);
+exit:
+	mutex_unlock(&ar->conf_mutex);
+
+	return ret;
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.start                          = ath11k_mac_op_start,
@@ -8107,6 +8168,7 @@ static const struct ieee80211_ops ath11k_ops = {
 #ifdef CONFIG_ATH11K_DEBUGFS
 	.sta_add_debugfs		= ath11k_debugfs_sta_op_add,
 #endif
+	.set_sar_specs			= ath11k_mac_op_set_bios_sar_specs,
 };
 
 static void ath11k_mac_update_ch_list(struct ath11k *ar,
@@ -8509,6 +8571,10 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		ieee80211_hw_set(ar->hw, SUPPORT_FAST_XMIT);
 	}
 
+	if (test_bit(WMI_TLV_SERVICE_BIOS_SAR_SUPPORT, ar->ab->wmi_ab.svc_map) &&
+	    ab->hw_params.bios_sar_capa)
+		ar->hw->wiphy->sar_capa = ab->hw_params.bios_sar_capa;
+
 	ret = ieee80211_register_hw(ar->hw);
 	if (ret) {
 		ath11k_err(ar->ab, "ieee80211 registration failed: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index cb550ba7f1d7..6caf79751e80 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8252,3 +8252,73 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 
 	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
 }
+
+int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_val)
+{	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_pdev_set_sar_table_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	u8 *buf_ptr;
+	u32 len, sar_len_aligned, rsvd_len_aligned;
+
+	sar_len_aligned = roundup(BIOS_SAR_TABLE_LEN, sizeof(u32));
+	rsvd_len_aligned = roundup(BIOS_SAR_RSVD1_LEN, sizeof(u32));
+	len = sizeof(*cmd) +
+	      TLV_HDR_SIZE + sar_len_aligned +
+	      TLV_HDR_SIZE + rsvd_len_aligned;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_set_sar_table_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->sar_len = BIOS_SAR_TABLE_LEN;
+	cmd->rsvd_len = BIOS_SAR_RSVD1_LEN;
+
+	buf_ptr = skb->data + sizeof(*cmd);
+	tlv = (struct wmi_tlv *) buf_ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
+		      FIELD_PREP(WMI_TLV_LEN, sar_len_aligned);
+	buf_ptr += TLV_HDR_SIZE;
+	memcpy(buf_ptr, sar_val, BIOS_SAR_TABLE_LEN);
+
+	buf_ptr += sar_len_aligned;
+	tlv = (struct wmi_tlv *) buf_ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
+		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
+
+	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
+}
+
+int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_pdev_set_geo_table_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	u8 *buf_ptr;
+	u32 len, rsvd_len_aligned;
+
+	rsvd_len_aligned = roundup(BIOS_SAR_RSVD2_LEN, sizeof(u32));
+	len = sizeof(*cmd) + TLV_HDR_SIZE + rsvd_len_aligned;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_set_geo_table_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->rsvd_len = BIOS_SAR_RSVD2_LEN;
+
+	buf_ptr = skb->data + sizeof(*cmd);
+	tlv = (struct wmi_tlv *) buf_ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
+		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
+
+	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
+}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 93a1e265dc9b..192009efdf8f 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -284,6 +284,11 @@ enum wmi_tlv_cmd_id {
 	WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
 	WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
 	WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_GET_TPC_STATS_CMDID,
+	WMI_PDEV_ENABLE_DURATION_BASED_TX_MODE_SELECTION_CMDID,
+	WMI_PDEV_GET_DPD_STATUS_CMDID,
+	WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID,
+	WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID,
 	WMI_VDEV_CREATE_CMDID = WMI_TLV_CMD(WMI_GRP_VDEV),
 	WMI_VDEV_DELETE_CMDID,
 	WMI_VDEV_START_REQUEST_CMDID,
@@ -1858,6 +1863,8 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
 	WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
 	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
+	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD,
 	WMI_TAG_MAX
 };
 
@@ -2084,6 +2091,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
 
 	WMI_MAX_EXT_SERVICE = 256,
+	WMI_TLV_SERVICE_BIOS_SAR_SUPPORT = 326,
 
 	WMI_MAX_EXT2_SERVICE
 };
@@ -5555,6 +5563,23 @@ struct wmi_wow_ev_arg {
 	u32 data_len;
 };
 
+#define BIOS_SAR_TABLE_LEN	(22)
+#define BIOS_SAR_RSVD1_LEN	(6)
+#define BIOS_SAR_RSVD2_LEN	(18)
+
+struct wmi_pdev_set_sar_table_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+	u32 sar_len;
+	u32 rsvd_len;
+} __packed;
+
+struct wmi_pdev_set_geo_table_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+	u32 rsvd_len;
+} __packed;
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len);
@@ -5716,4 +5741,6 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 				 const u8 mac_addr[ETH_ALEN]);
 int ath11k_wmi_fw_dbglog_cfg(struct ath11k *ar, u32 *module_id_bitmap,
 			     struct ath11k_fw_dbglog *dbglog);
+int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_val);
+int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar);
 #endif
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
