Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF0C433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ykm1a27fobXeMjkb4oMjPX5AK2Bf0aKNEE2GMQM4oNM=; b=vGT1zJvTKVrO4g
	zRnoNYdQjY5OOO9OGXWnnOupac7J8YDMzl4hRqaZntT9CvAOcw9NLPqUjCPFsjKTXSPLKlHyJwZqm
	yM3/J5I/zuvtSJo2coUo+0z7L4zPoi81/L9l/l3Mt+KZpxJedXQ6U7MOkOqWhKoJmzMS368cnhXyk
	Llw5eAj2eAhsXM3ZBc06ul7zKW55BFz9dCdjWOrKr8Qracm5VXmHH5fdcy1kxvbGYAn7Kwe+4hMFV
	QFCQMTst6XFUOftueq3y+hfHsImu7rUHZ5j9TFTt2gjogFYLF3gRHsaMq6xYxfuux4apzfwgY2KKu
	OtpleC0GICmdyiZpEYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njfha-0013RW-Gi; Wed, 27 Apr 2022 11:19:22 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njfhX-0013MM-EJ
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 11:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651058359; x=1682594359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJ0NNaQXSE+E91PQwsCcFnAiv2y9/HGUuqGhd91HhtQ=;
 b=d9QR6YYHH4zUFaZ4qx+gETHvbkJLAXxubPbLPnVgBKF6OCiQL1GjSwDG
 p2A8AS+jdSIi0LaVdbmNDSQV7daDDv3zqKJNiNqQZ/itZg2QKKKZHBQid
 F682fiHEWpme7CsXRlmFahxi2QAT8DkJtRVcGLsGSH5+6d87KlOUnKuo5 s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Apr 2022 04:19:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:19:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:17 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:15 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v6 4/9] ath11k: Add register access logic for WCN6750
Date: Wed, 27 Apr 2022 16:48:43 +0530
Message-ID: <20220427111848.9257-5-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_041919_551243_DA5A074B 
X-CRM114-Status: GOOD (  16.75  )
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

WCN6750 uses static window mapping to access the HW registers.
Unlike QCN9074 which uses 2nd window for CE and 3rd window
for UMAC register accesses, WCN6750 uses 1st window for UMAC
and 2nd window for CE registers.

Code is refactored so that WCN6750 can use the existing
ath11k_pci_read/write() APIs for accessing the registers.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  6 +++
 drivers/net/wireless/ath/ath11k/core.h |  2 +
 drivers/net/wireless/ath/ath11k/pci.c  | 34 ++++++++++++++--
 drivers/net/wireless/ath/ath11k/pcic.c | 54 +++++++++-----------------
 4 files changed, 58 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index cfdd415f0203..fa12e50f32f4 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -34,7 +34,10 @@ static const struct ath11k_bus_params ath11k_ahb_bus_params = {
 	.m3_fw_support = false,
 	.fixed_bdf_addr = true,
 	.fixed_mem_region = true,
+	.static_window_map = false,
 	.hybrid_bus_type = false,
+	.dp_window_idx = 0,
+	.ce_window_idx = 0,
 };
 
 const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
@@ -42,7 +45,10 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
 	.m3_fw_support = false,
 	.fixed_bdf_addr = false,
 	.fixed_mem_region = false,
+	.static_window_map = true,
 	.hybrid_bus_type = true,
+	.dp_window_idx = 1,
+	.ce_window_idx = 2,
 };
 
 #define ATH11K_IRQ_CE0_OFFSET 4
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 51f313dd7f26..ee0ad93d5843 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -756,6 +756,8 @@ struct ath11k_bus_params {
 	bool fixed_mem_region;
 	bool static_window_map;
 	bool hybrid_bus_type;
+	u8 dp_window_idx;
+	u8 ce_window_idx;
 };
 
 struct ath11k_pci_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index ddd1e2de6a2e..9184cb893bd4 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -115,12 +115,26 @@ static const struct ath11k_pci_ops ath11k_pci_ops_qcn9074 = {
 	.window_read32 = ath11k_pci_window_read32,
 };
 
-static const struct ath11k_bus_params ath11k_pci_bus_params = {
+static const struct ath11k_bus_params ath11k_pci_bus_params_qca6390 = {
 	.mhi_support = true,
 	.m3_fw_support = true,
 	.fixed_bdf_addr = false,
 	.fixed_mem_region = false,
+	.static_window_map = false,
 	.hybrid_bus_type = false,
+	.dp_window_idx = 0,
+	.ce_window_idx = 0,
+};
+
+static const struct ath11k_bus_params ath11k_pci_bus_params_qcn9074 = {
+	.mhi_support = true,
+	.m3_fw_support = true,
+	.fixed_bdf_addr = false,
+	.fixed_mem_region = false,
+	.static_window_map = true,
+	.hybrid_bus_type = false,
+	.dp_window_idx = 3,
+	.ce_window_idx = 2,
 };
 
 static const struct ath11k_msi_config msi_config_one_msi = {
@@ -704,11 +718,26 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 {
 	struct ath11k_base *ab;
 	struct ath11k_pci *ab_pci;
+	const struct ath11k_bus_params *bus_params;
 	u32 soc_hw_version_major, soc_hw_version_minor, addr;
 	int ret;
 
+	switch (pci_dev->device) {
+	case QCA6390_DEVICE_ID:
+	case WCN6855_DEVICE_ID:
+		bus_params = &ath11k_pci_bus_params_qca6390;
+		break;
+	case QCN9074_DEVICE_ID:
+		bus_params = &ath11k_pci_bus_params_qcn9074;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
-			       &ath11k_pci_bus_params);
+			       bus_params);
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
@@ -765,7 +794,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->pci.ops = &ath11k_pci_ops_qca6390;
 		break;
 	case QCN9074_DEVICE_ID:
-		ab->bus_params.static_window_map = true;
 		ab->pci.ops = &ath11k_pci_ops_qcn9074;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 63c678aea29e..d79433e20181 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -134,16 +134,13 @@ EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
 static inline u32 ath11k_pcic_get_window_start(struct ath11k_base *ab,
 					       u32 offset)
 {
-	u32 window_start;
+	u32 window_start = 0;
 
-	/* If offset lies within DP register range, use 3rd window */
 	if ((offset ^ HAL_SEQ_WCSS_UMAC_OFFSET) < ATH11K_PCI_WINDOW_RANGE_MASK)
-		window_start = 3 * ATH11K_PCI_WINDOW_START;
-	/* If offset lies within CE register range, use 2nd window */
-	else if ((offset ^ HAL_CE_WFSS_CE_REG_BASE) < ATH11K_PCI_WINDOW_RANGE_MASK)
-		window_start = 2 * ATH11K_PCI_WINDOW_START;
-	else
-		window_start = ATH11K_PCI_WINDOW_START;
+		window_start = ab->bus_params.dp_window_idx * ATH11K_PCI_WINDOW_START;
+	else if ((offset ^ HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab)) <
+		 ATH11K_PCI_WINDOW_RANGE_MASK)
+		window_start = ab->bus_params.ce_window_idx * ATH11K_PCI_WINDOW_START;
 
 	return window_start;
 }
@@ -162,19 +159,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
-	} else {
-		if (ab->bus_params.static_window_map)
-			window_start = ath11k_pcic_get_window_start(ab, offset);
-		else
-			window_start = ATH11K_PCI_WINDOW_START;
-
-		if (window_start == ATH11K_PCI_WINDOW_START &&
-		    ab->pci.ops->window_write32) {
-			ab->pci.ops->window_write32(ab, offset, value);
-		} else {
-			iowrite32(value, ab->mem + window_start +
-				  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
-		}
+	} else if (ab->bus_params.static_window_map) {
+		window_start = ath11k_pcic_get_window_start(ab, offset);
+		iowrite32(value, ab->mem + window_start +
+			  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+	} else if (ab->pci.ops->window_write32) {
+		ab->pci.ops->window_write32(ab, offset, value);
 	}
 
 	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
@@ -185,7 +175,8 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
 u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 {
-	u32 val, window_start;
+	u32 val = 0;
+	u32 window_start;
 	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
@@ -197,19 +188,12 @@ u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		val = ioread32(ab->mem + offset);
-	} else {
-		if (ab->bus_params.static_window_map)
-			window_start = ath11k_pcic_get_window_start(ab, offset);
-		else
-			window_start = ATH11K_PCI_WINDOW_START;
-
-		if (window_start == ATH11K_PCI_WINDOW_START &&
-		    ab->pci.ops->window_read32) {
-			val = ab->pci.ops->window_read32(ab, offset);
-		} else {
-			val = ioread32(ab->mem + window_start +
-				       (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
-		}
+	} else if (ab->bus_params.static_window_map) {
+		window_start = ath11k_pcic_get_window_start(ab, offset);
+		val = ioread32(ab->mem + window_start +
+			       (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+	} else if (ab->pci.ops->window_read32) {
+		val = ab->pci.ops->window_read32(ab, offset);
 	}
 
 	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
