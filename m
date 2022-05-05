Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF64C4332F
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXqRRTRXBSI2VGQS9Mpg6UgPCd2WAXO8YlYeQ3jiw0c=; b=xyfbU5OKzirmwA
	vXgimiSQ3wf92n9z0ZNgT337QOHn9op855c+NrFG7bBXHUWAitKvgJbtPnmopezCg5eLqZ4VFRPip
	Qn30uQcsHaESwztt0FgiIgl0mOH9symZyItJXHOve5RJ3tLXSxaLN/FZ4lEMh3VHBVQRiKXj1Zxij
	L0eXsPntf2u8unIq65Cn4R6J8zUAiVZ5jt32AP9UTIVcYhSs7EMbMXv7fSzceHAm1lNDwNmV+M6G7
	pVmUmPaFB51/CK2Nick60yZybERhnKlML19XLkl65OPrNLkVE1FFKii09h5UXM0VB5WWLfe2zsf4y
	qrlcihiW5Nj8OCD1aNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmQSb-00DWKG-FM; Thu, 05 May 2022 01:39:17 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmQSU-00DWI7-Jo
 for ath11k@lists.infradead.org; Thu, 05 May 2022 01:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651714750; x=1683250750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYm+a/NMtxgRHzJbuYsUcGBUNBXQGa2R2eLPTOGOGWM=;
 b=IAwmcv/lBMzomsubSGfgkfrJbxVG4uKACqHHqKj11WBpsodzKQbgqN2/
 N80EumMz2IHvyIbRTfEKZ3bkdM2ptgqJMfGQqwAtiV863Bv8x5oANyeed
 f3wU5SfC+62TpWDym8cCvBphBPWH32Tzybe7Ve7D1T5qbed0+PSda2f8x 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 18:39:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 18:39:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:39:10 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:39:09 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 3/3] ath11k: Designating channel frequency when sending
 management frames
Date: Thu, 5 May 2022 09:38:51 +0800
Message-ID: <20220505013851.1548789-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505013851.1548789-1-quic_bqiang@quicinc.com>
References: <20220505013851.1548789-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_183910_727395_4050D7AE 
X-CRM114-Status: GOOD (  15.05  )
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

In case of Passpoint, the WLAN interface may be requested to
remain on a specific channel and then to send some management
frames on that channel. Now chanfreq of wmi_mgmt_send_cmd is set
as 0, as a result firmware may choose a default but wrong channel.
Fix it by assigning chanfreq field with the designated channel.

This change only applies to WCN6855 and QCA6390, other chips are
not affected.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  7 +++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 17 ++++++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 412bec8f1daf..f4a184ffbb02 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -110,6 +110,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -185,6 +186,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -259,6 +261,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -333,6 +336,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 3,
 		.ce_window_idx = 2,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -407,6 +411,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = true,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -480,6 +485,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
 		.fixed_fw_mem = false,
+		.support_off_channel_tx = true,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -553,6 +559,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 1,
 		.ce_window_idx = 2,
 		.fixed_fw_mem = true,
+		.support_off_channel_tx = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 6d588cd80093..a0552ebcc9cb 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -204,6 +204,7 @@ struct ath11k_hw_params {
 	u8 dp_window_idx;
 	u8 ce_window_idx;
 	bool fixed_fw_mem;
+	bool support_off_channel_tx;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e99dede0ab55..6fc5e5b2bb1b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -625,10 +625,25 @@ struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len)
 	return skb;
 }
 
+static u32 ath11k_wmi_mgmt_get_freq(struct ath11k *ar,
+				    struct ieee80211_tx_info *info)
+{
+	struct ath11k_base *ab = ar->ab;
+	u32 freq = 0;
+
+	if (ab->hw_params.support_off_channel_tx &&
+	    ar->scan.is_roc &&
+	    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN))
+		freq = ar->scan.roc_freq;
+
+	return freq;
+}
+
 int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 			 struct sk_buff *frame)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(frame);
 	struct wmi_mgmt_send_cmd *cmd;
 	struct wmi_tlv *frame_tlv;
 	struct sk_buff *skb;
@@ -649,7 +664,7 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 	cmd->vdev_id = vdev_id;
 	cmd->desc_id = buf_id;
-	cmd->chanfreq = 0;
+	cmd->chanfreq = ath11k_wmi_mgmt_get_freq(ar, info);
 	cmd->paddr_lo = lower_32_bits(ATH11K_SKB_CB(frame)->paddr);
 	cmd->paddr_hi = upper_32_bits(ATH11K_SKB_CB(frame)->paddr);
 	cmd->frame_len = frame->len;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
