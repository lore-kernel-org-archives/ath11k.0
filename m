Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76148C4321E
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Xaraw2ffRLZcmOKioi0MNrpD4mPzt25JQShRJWisk0=; b=QYysHHQTIKrM5B
	XS0VTqxJPlgAwV2tjv8y57fSYKMAUyVUGS8KSBCUEldaK9lfOOlWieQWTmdykKZiiCaB06WfayzEq
	Ducm+XZuYstUj50ECHvBGcIKmQDbBDnla8z0SezRhC0ixAR2Q6jRx8+K1dT+eLfrIrWGnaB3dHd+p
	Paod/D/ImNQZaQzN6GznxDCQ12yjMQvJ/p+XKO5qlf++jWigYwwnssSRm1GIQ/jnO6GrzdrejOFAm
	XvaTdCuKRfeoSPyUXx1bYSqHxVttc5f/jEPyGXg8Ub56ai5uPgSzy1My1UVP4n2s7qqZroDXPdKz6
	sgmDaf5VFQZN/FjXE/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkU4Q-00C2Jq-PJ; Fri, 29 Apr 2022 17:06:18 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkU4M-00C2Da-Jh
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 17:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651251974; x=1682787974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/ROsx4+MeSBltXz89s2h6jVomlQ7IJET5yIUcpUNBQ=;
 b=nT3WJEc6eE34xQ0p0ik2LtDwW36d5ZKlp/h4JFOFXIKBrlM0cpgUxdrJ
 bHGF8HwEBQ/RZPfNUgnAF3lhyvFU+0GQchyqGV2EEF60H4D4vgRAIDrus
 qxY/wxUm3pnDf1WHHxRIo14Y/SXjjmulz/2eMlkqDd3qPxUCLLw17Cfy2 g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 10:06:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:06:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:38 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:35 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
Date: Fri, 29 Apr 2022 22:34:57 +0530
Message-ID: <20220429170502.20080-5-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_100614_723023_A35D49EE 
X-CRM114-Status: GOOD (  14.61  )
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
Unlike QCN9074 which uses 3rd window for UMAC and 2nd window
for CE register access, WCN6750 uses 1st window for UMAC
and 2nd window for CE registers.

Also, refactor the code so that WCN6750 can use the existing
ath11k_pci_read32/write32() APIs for accessing the registers.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 15 +++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  2 +
 drivers/net/wireless/ath/ath11k/pcic.c | 54 +++++++++-----------------
 3 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dc1084532cef..3be4327b4d9c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -107,6 +107,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = true,
 		.static_window_map = false,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 0,
+		.ce_window_idx = 0,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -179,6 +181,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = true,
 		.static_window_map = false,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 0,
+		.ce_window_idx = 0,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -250,6 +254,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = false,
 		.static_window_map = false,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 0,
+		.ce_window_idx = 0,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -321,6 +327,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = false,
 		.static_window_map = true,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 3,
+		.ce_window_idx = 2,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -392,6 +400,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = false,
 		.static_window_map = false,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 0,
+		.ce_window_idx = 0,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -462,6 +472,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_mem_region = false,
 		.static_window_map = false,
 		.hybrid_bus_type = false,
+		.dp_window_idx = 0,
+		.ce_window_idx = 0,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -527,7 +539,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.m3_fw_support = false,
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
+		.static_window_map = true,
 		.hybrid_bus_type = true,
+		.dp_window_idx = 1,
+		.ce_window_idx = 2,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 03eb5dfd4a5e..b63538084215 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -201,6 +201,8 @@ struct ath11k_hw_params {
 	bool fixed_mem_region;
 	bool static_window_map;
 	bool hybrid_bus_type;
+	u8 dp_window_idx;
+	u8 ce_window_idx;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 7a920d65023f..46cf96d3e1d2 100644
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
+		window_start = ab->hw_params.dp_window_idx * ATH11K_PCI_WINDOW_START;
+	else if ((offset ^ HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab)) <
+		 ATH11K_PCI_WINDOW_RANGE_MASK)
+		window_start = ab->hw_params.ce_window_idx * ATH11K_PCI_WINDOW_START;
 
 	return window_start;
 }
@@ -162,19 +159,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
-	} else {
-		if (ab->hw_params.static_window_map)
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
+	} else if (ab->hw_params.static_window_map) {
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
-		if (ab->hw_params.static_window_map)
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
+	} else if (ab->hw_params.static_window_map) {
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
