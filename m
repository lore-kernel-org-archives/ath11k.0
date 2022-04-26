Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81493C433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qytCdVipUTZL7E+HTuSK0dR47bMTb64YoiHofc5C/lA=; b=CDgEr6Zj/YATqs
	JC0fOlNvYIf+nFfz631hfWhNYMLSSQGDruPZK9MruJCSkQrfUa/IlJuBZis8fPjSFK6/U0SPliN/d
	AmoJh9/qgPmqDRlkWj5+2uC3zEkByGcAFFkgPP1bK7eOTZdf855byYOXRx3sFROBgLvowDoEWFlmq
	nesmte2vxONcYG39HxBdAkL1GyCzVr3E5jJ1yI5nYN4yK7S5kewhkdd5UL9nHb8OvaaJXYw+a0x+H
	L9NxGIrRGnJBiAYBZhQJ02hr1R2cn41NHp5yk7I+tVrdz7V0bVqmTvmScMD6X7zhkhEeI8iWUx64j
	o3tD1ZLs4kEmnN9WbvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMbK-00F3HY-W4; Tue, 26 Apr 2022 14:55:38 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njMbI-00F3FZ-P3
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 14:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984936; x=1682520936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yTLLWE0SXXWGRUqV4sqM3D7u7blAViwEGOfbdiAv4UU=;
 b=UZSx82I3FDBYn7JDFSPMn9nmva9lsDBBtR39QvDNl4Zw3DAzUxuXg/GF
 rFc9RzXkBqwbK/ktOEJe4fvW4uZZoJ89+LkHQCtlY7zm1oSuIfjtyFJ7i
 jn+mmrEOCtOa0BQERqw1atGy7Ul1KR5/O3fuuDUEL0g5wHn8I3HCY1Qz7 k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 07:55:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:55:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:34 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:31 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v5 04/12] ath11k: Add register access logic for WCN6750
Date: Tue, 26 Apr 2022 20:24:48 +0530
Message-ID: <20220426145456.8055-5-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
References: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_075536_910504_AD26237F 
X-CRM114-Status: GOOD (  15.07  )
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
 drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++
 drivers/net/wireless/ath/ath11k/core.h |  2 +
 drivers/net/wireless/ath/ath11k/pci.c  |  4 ++
 drivers/net/wireless/ath/ath11k/pcic.c | 53 +++++++++-----------------
 4 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d73643e3e8dd..d27fc7276977 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -42,6 +42,9 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
 	.fixed_bdf_addr = false,
 	.fixed_mem_region = false,
 	.hybrid_bus_type = true,
+	.static_window_map = true,
+	.dp_window_idx = 1,
+	.ce_window_idx = 2,
 };
 
 #define ATH11K_IRQ_CE0_OFFSET 4
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b0bb01cc9d04..d3bfaafcd571 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -730,6 +730,8 @@ struct ath11k_bus_params {
 	bool fixed_mem_region;
 	bool static_window_map;
 	bool hybrid_bus_type;
+	u8 dp_window_idx;
+	u8 ce_window_idx;
 };
 
 struct ath11k_pci_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 024661a17008..e5b68aad8be9 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -767,6 +767,10 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->bus_params.static_window_map = true;
 		ab->pci.ops = &ath11k_pci_ops_qcn9074;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
+
+		/* For QCN9074, CE: 2nd window, UMAC: 3rd window */
+		ab->bus_params.ce_window_idx = 2;
+		ab->bus_params.dp_window_idx = 3;
 		break;
 	case WCN6855_DEVICE_ID:
 		ab->id.bdf_search = ATH11K_BDF_SEARCH_BUS_AND_BOARD;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 63c678aea29e..6d0b5307d5c7 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -134,16 +134,14 @@ EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
 static inline u32 ath11k_pcic_get_window_start(struct ath11k_base *ab,
 					       u32 offset)
 {
-	u32 window_start;
+	u32 window_start = 0;
 
 	/* If offset lies within DP register range, use 3rd window */
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
@@ -162,19 +160,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
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
@@ -185,7 +176,8 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
 u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 {
-	u32 val, window_start;
+	u32 val = 0;
+	u32 window_start;
 	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
@@ -197,19 +189,12 @@ u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 
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
