Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898EBC35263
	for <ath11k@archiver.kernel.org>; Sun, 16 Jan 2022 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoTr4n009F/dsrUdJcmQqVXEFijHykVnDJ5qoDiqSAM=; b=0frbTcdK6HmsKP
	TEzE+MXmUIGW0RU57VbZihSEx4c1GPtpE8bp66BCO5o/CkrP9bMY3MWcoGLyolCBeRbeiqE9bbQmF
	Q6byoMRp0LqObBjdXoqQRMMutMINKwbgEZ6pKMEl7LoYTrhou1tsbUipB3tCg2DEWQIRuwRiFRFJj
	mCjp+h/YIg4IX+a68++4BvbekG1Jrl8fq8ieGHOgDmSMm3bHoeBxzSeiXILLwcfvdDB8Yyu5ftPQK
	5TbebT+EgptRdmobubf/xDTe2SjGznyyfmMsaoOgEBZtJxfZXXbU7H0aLEjCmv4YyKRAqG1+uP9G9
	WdMkgeZjKL67Yt7zb5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n94wu-00CPoG-Je; Sun, 16 Jan 2022 12:47:56 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n94wq-00CPlO-PE
 for ath11k@lists.infradead.org; Sun, 16 Jan 2022 12:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642337272; x=1673873272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rUfILe3vUM45RhuRlnYcd+1tvAi7Ntujv+KTzBJw1zo=;
 b=kt4jCxTvFZWnVeO7kdO750JI/FSw4fUtg49tzc0bS89AGUV8i4DrzjkB
 Qtm/kOXXR+F6TzokFF/Tb5uiEyfLVnBJ/k0ZAfEloFAjYsspwae1DjK9P
 ReINJBbSYsOzcwVu2blXGzM9DDNfyEjQ5NTFOr6+/PYFQCit+nIH2coDE M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jan 2022 04:47:51 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 04:47:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:47:51 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:47:48 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH v2 08/19] ath11k: Add register access logic for WCN6750
Date: Sun, 16 Jan 2022 18:17:04 +0530
Message-ID: <1642337235-8618-9-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_044752_873566_97E8A764 
X-CRM114-Status: GOOD (  15.68  )
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

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c     |  3 +++
 drivers/net/wireless/ath/ath11k/core.h    |  2 ++
 drivers/net/wireless/ath/ath11k/pci.c     |  4 ++++
 drivers/net/wireless/ath/ath11k/pci_cmn.c | 35 ++++++++++---------------------
 4 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 6167d4f..ed3a439 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -42,6 +42,9 @@ const struct ath11k_bus_params ath11k_hybrid_bus_params = {
 	.fixed_bdf_addr = false,
 	.fixed_mem_region = false,
 	.hybrid_bus_type = true,
+	.static_window_map = true,
+	.dp_window_idx = 1,
+	.ce_window_idx = 2,
 };
 
 #define ATH11K_IRQ_CE0_OFFSET 4
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c6cd2de..92c1ea1 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -655,6 +655,8 @@ struct ath11k_bus_params {
 	bool fixed_mem_region;
 	bool static_window_map;
 	bool hybrid_bus_type;
+	u8 dp_window_idx;
+	u8 ce_window_idx;
 	struct {
 		void (*wakeup)(struct ath11k_base *ab);
 		void (*release)(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 4f2fe72..07bfb86 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -765,6 +765,10 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->bus_params.ops.wakeup = NULL;
 		ab->bus_params.ops.release = NULL;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
+
+		/* For QCN9074, CE: 2nd window, UMAC: 3rd window */
+		ab->bus_params.ce_window_idx = 2;
+		ab->bus_params.dp_window_idx = 3;
 		break;
 	case WCN6855_DEVICE_ID:
 		ab->id.bdf_search = ATH11K_BDF_SEARCH_BUS_AND_BOARD;
diff --git a/drivers/net/wireless/ath/ath11k/pci_cmn.c b/drivers/net/wireless/ath/ath11k/pci_cmn.c
index a5b84b5..fede1d06d 100644
--- a/drivers/net/wireless/ath/ath11k/pci_cmn.c
+++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
@@ -122,16 +122,13 @@ int ath11k_pci_get_msi_config(struct ath11k_base *ab)
 static inline u32 ath11k_pci_get_window_start(struct ath11k_base *ab,
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
@@ -151,17 +148,12 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
 	} else {
-		if (ab->bus_params.static_window_map)
+		if (ab->bus_params.static_window_map) {
 			window_start = ath11k_pci_get_window_start(ab, offset);
-		else
-			window_start = ATH11K_PCI_WINDOW_START;
-
-		if (window_start == ATH11K_PCI_WINDOW_START &&
-		    ab->bus_params.ops.window_write32) {
-			ab->bus_params.ops.window_write32(ab, offset, value);
-		} else {
 			iowrite32(value, ab->mem + window_start +
 				  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+		} else if (ab->bus_params.ops.window_write32) {
+			ab->bus_params.ops.window_write32(ab, offset, value);
 		}
 	}
 
@@ -186,17 +178,12 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		val = ioread32(ab->mem + offset);
 	} else {
-		if (ab->bus_params.static_window_map)
+		if (ab->bus_params.static_window_map) {
 			window_start = ath11k_pci_get_window_start(ab, offset);
-		else
-			window_start = ATH11K_PCI_WINDOW_START;
-
-		if (window_start == ATH11K_PCI_WINDOW_START &&
-		    ab->bus_params.ops.window_read32) {
-			val = ab->bus_params.ops.window_read32(ab, offset);
-		} else {
 			val = ioread32(ab->mem + window_start +
 				       (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+		} else if (ab->bus_params.ops.window_read32) {
+			val = ab->bus_params.ops.window_read32(ab, offset);
 		}
 	}
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
