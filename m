Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD97C433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 07:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9486860200
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9486860200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8kG+FvK2uH5Rswq797p6Hrm1ZpqUthpLobwjhgG6Pus=; b=YHWg0S6IE/4Id2
	gD4VLXfuS/PhKK+3fjvJwMy3mbzVDIzESd2/D/o56vMBrpvfOb634RPePoCTvFahXGgLZ17CCBJtp
	W35bXPCkvH7pZWVqg43N9U0ceAeAmNvp95HkUzz0+ws2spHO4vt7zOqp6GOdp9onDLk5JOI9djZLY
	47E3avuJUU9gjRhiXKQhP044tyAmX+APzGuSpAhUj1HVM05rY8ILJ0ZXWS1vy4L6Q2NP0HSUoYXjW
	QabpYy/IdVokj6+5SDgt3bpzV75A/ozpTTEK6Ryb0hyoERtyUDDGt3H6awRhxts1aPP63Gl3Vy6jn
	4YniRALvNSx9tH/wPRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlQbD-009aNu-G3; Fri, 12 Nov 2021 07:03:47 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlQbA-009aNV-77
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 07:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636700624; x=1668236624;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6qOXSouFaC7mrf88qXzMzO0O38OmCXbXupu8Dr8wp6w=;
 b=JP+bO/JP+WMSmVkGyFKqrvbMKRO4mqZAa5wH5Svt5kH+PGYcBhPVlYvt
 RfoAhQHda9kpcGhEMzULmIe2I7k6sw0xf3KekhHIl7zMvjjCPjn+a2gpU
 lnITiAraHIyL/wz0D/zimkEbEN7YMuyNZzioY/eRPDDu2cOiZ21bZSIhJ Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Nov 2021 23:03:40 -0800
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 23:03:40 -0800
Received: from seevalam-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 23:03:37 -0800
From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Seevalamuthu Mariappan
 <quic_seevalam@quicinc.com>
Subject: [PATCH] ath11k: Check supported hardware version
Date: Fri, 12 Nov 2021 12:33:17 +0530
Message-ID: <1636700597-11113-1-git-send-email-quic_seevalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_230344_371463_6A5AC89C 
X-CRM114-Status: GOOD (  16.82  )
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

Read register TCSR_SOC_HW_VERSION for hardware version. This register
is present in all hardwares. Check whether the hardware version is
supported. Returns error if the hardware is unsupported.
This handling is already done for QCA6390 and WCN6855.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3
Tested-on: IPQ6018 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3

Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 46 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 13 ++++++++++
 drivers/net/wireless/ath/ath11k/pci.c  | 32 ++++++++++++++++-------
 3 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8c9c781..be56787 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -13,6 +13,10 @@
 #include "hif.h"
 #include <linux/remoteproc.h>
 
+#define CORE_TOP_CSR_OFFSET		0x01900000
+#define CORE_TOP_CSR_SIZE		0x100000
+#define TCSR_SOC_HW_VERSION		0x4D000
+
 static const struct of_device_id ath11k_ahb_of_match[] = {
 	/* TODO: Should we change the compatible string to something similar
 	 * to one that ath10k uses?
@@ -650,6 +654,44 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 	return 0;
 }
 
+static int ath11k_check_hw_version(struct ath11k_base *ab)
+{
+	void __iomem *mem_core;
+	u32 soc_hw_version, soc_hw_version_major, soc_hw_version_minor;
+
+	switch (ab->hw_rev) {
+	case ATH11K_HW_IPQ8074:
+	case ATH11K_HW_IPQ6018_HW10:
+		/* CORE_TOP_CSR register is out of wcss */
+		mem_core = ioremap(CORE_TOP_CSR_OFFSET, CORE_TOP_CSR_SIZE);
+		if (IS_ERR(mem_core)) {
+			ath11k_err(ab, "core_top_csr ioremap error\n");
+			return -ENOMEM;
+		}
+		soc_hw_version = ioread32(mem_core + TCSR_SOC_HW_VERSION);
+		iounmap(mem_core);
+		soc_hw_version_major = FIELD_GET(TCSR_SOC_HW_VERSION_MAJOR_MASK,
+						 soc_hw_version);
+		soc_hw_version_minor = FIELD_GET(TCSR_SOC_HW_VERSION_MINOR_MASK,
+						 soc_hw_version);
+
+		ath11k_dbg(ab, ATH11K_DBG_AHB, "tcsr_soc_hw_version major %u minor %u\n",
+			   soc_hw_version_major,
+			   soc_hw_version_minor);
+
+		if (soc_hw_version_major != ath11k_hw_version[ab->hw_rev]) {
+			ath11k_err(ab, "Unsupported SOC hardware version: %u\n",
+				   soc_hw_version_major);
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		ath11k_err(ab, "Unknown hw_ver: %u\n", ab->hw_rev);
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
 static int ath11k_ahb_probe(struct platform_device *pdev)
 {
 	struct ath11k_base *ab;
@@ -691,6 +733,10 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ab->mem_len = resource_size(mem_res);
 	platform_set_drvdata(pdev, ab);
 
+	ret = ath11k_check_hw_version(ab);
+	if (ret)
+		goto err_core_free;
+
 	ret = ath11k_core_pre_init(ab);
 	if (ret)
 		goto err_core_free;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 2f1e10b..3b93a5d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -916,6 +916,19 @@ struct ath11k_fw_stats_bcn {
 	u32 tx_bcn_outage_cnt;
 };
 
+#define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(15, 8)
+#define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 0)
+#define ATH11K_HW_VERSION_HW10		1
+#define ATH11K_HW_VERSION_HW20		2
+
+static const u32 ath11k_hw_version[] = {
+	[ATH11K_HW_IPQ8074] = ATH11K_HW_VERSION_HW20,
+	[ATH11K_HW_QCA6390_HW20] = ATH11K_HW_VERSION_HW20,
+	[ATH11K_HW_IPQ6018_HW10] = ATH11K_HW_VERSION_HW10,
+	[ATH11K_HW_QCN9074_HW10] = ATH11K_HW_VERSION_HW10,
+	[ATH11K_HW_WCN6855_HW20] = ATH11K_HW_VERSION_HW20,
+};
+
 extern const struct ce_pipe_config ath11k_target_ce_config_wlan_ipq8074[];
 extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_ipq8074[];
 extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_ipq6018[];
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 3d353e7..fb001b7 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -25,8 +25,7 @@
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
 
 #define TCSR_SOC_HW_VERSION		0x0224
-#define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(16, 8)
-#define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 0)
+#define QCN9074_TCSR_SOC_HW_VERSION	0x1B00000
 
 /* BAR0 + 4k is always accessible, and no
  * need to force wakeup.
@@ -1206,11 +1205,12 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.get_ce_msi_idx = ath11k_pci_get_ce_msi_idx,
 };
 
-static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 *major, u32 *minor)
+static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 offset,
+				       u32 *major, u32 *minor)
 {
 	u32 soc_hw_version;
 
-	soc_hw_version = ath11k_pci_read32(ab, TCSR_SOC_HW_VERSION);
+	soc_hw_version = ath11k_pci_read32(ab, offset);
 	*major = FIELD_GET(TCSR_SOC_HW_VERSION_MAJOR_MASK,
 			   soc_hw_version);
 	*minor = FIELD_GET(TCSR_SOC_HW_VERSION_MINOR_MASK,
@@ -1253,10 +1253,11 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCA6390_DEVICE_ID:
-		ath11k_pci_read_hw_version(ab, &soc_hw_version_major,
+		ath11k_pci_read_hw_version(ab, TCSR_SOC_HW_VERSION,
+					   &soc_hw_version_major,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
-		case 2:
+		case ATH11K_HW_VERSION_HW20:
 			ab->hw_rev = ATH11K_HW_QCA6390_HW20;
 			break;
 		default:
@@ -1268,15 +1269,28 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath11k_msi_config[0];
 		break;
 	case QCN9074_DEVICE_ID:
+		ath11k_pci_read_hw_version(ab, QCN9074_TCSR_SOC_HW_VERSION,
+					   &soc_hw_version_major,
+					   &soc_hw_version_minor);
+		switch (soc_hw_version_major) {
+		case ATH11K_HW_VERSION_HW10:
+			ab->hw_rev = ATH11K_HW_QCN9074_HW10;
+			break;
+		default:
+			dev_err(&pdev->dev, "Unsupported QCN9074 SOC hardware version: %d %d\n",
+				soc_hw_version_major, soc_hw_version_minor);
+			ret = -EOPNOTSUPP;
+			goto err_pci_free_region;
+		}
 		ab_pci->msi_config = &ath11k_msi_config[1];
 		ab->bus_params.static_window_map = true;
-		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
 	case WCN6855_DEVICE_ID:
-		ath11k_pci_read_hw_version(ab, &soc_hw_version_major,
+		ath11k_pci_read_hw_version(ab, TCSR_SOC_HW_VERSION,
+					   &soc_hw_version_major,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
-		case 2:
+		case ATH11K_HW_VERSION_HW20:
 			ab->hw_rev = ATH11K_HW_WCN6855_HW20;
 			break;
 		default:
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
