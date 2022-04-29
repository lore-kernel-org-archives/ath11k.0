Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E947C433EF
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rbr+DLEY5Idj6TnJkS7hi2W+mfDFnULbnywqx0sksYw=; b=pX8XQyuNQY9Doa
	/dpTaO+qBGIs+n2drydrngcpefNQgUOckzRS33tTme9oKuwyJZmR9bG/DurbFtRPPgLIn/6U9ec4G
	i7FfXA0TMmFhtCb479MnqVjWJjOhUtfixDovq5UKvKJnXFjOLJJDlAfKSXHEuT/6twI6ZphjxG50k
	HPMOvSg3Ph3zAIiaBEDMP4ZGy1Z2GpU9efbGWh48LzOJQioIAKjk7kn4usTrOvoetkV4XUKdG7TxC
	1enGph/XHZiP8xe2y1SiEMVnonmELSfwnsPeYS96UnA0JKxVxcxFPIamxna7090zD9CXGLza3Ut5p
	FfYYr/3/d0mPm4PT5DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkU4P-00C2J2-Fb; Fri, 29 Apr 2022 17:06:17 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkU4K-00C2Da-DW
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 17:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651251972; x=1682787972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4n02wHYUxGcANRVztd0neByrD+Q+U0/OQWwLncp/6t4=;
 b=LDE48bm4zRiLfVzyUXlSxgMYo8qmzaANLWgyI7ORh75V/HbDwaCPEQU9
 lt/AITVGwEVL0/kHleP3juotmwStGP79ewPsvXGgd8ZXkbyqZ8OZ3ZQEk
 ShRnaaofR32Sds2xe5bqh5k8B/6fqzyrUZ/AqWbhCSoNOkackzqN+XtJw w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 10:06:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:06:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:33 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:30 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v7 2/9] ath11k: Move parameters in bus_params to hw_params
Date: Fri, 29 Apr 2022 22:34:55 +0530
Message-ID: <20220429170502.20080-3-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_100612_495848_750C8201 
X-CRM114-Status: GOOD (  22.00  )
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

In ath11k, bus_params were added with an intention to hold
parameters related to bus (AHB/PCI), but this is not true
as some bus parameters being different between chipsets of
the same bus.

With the addition of WCN6750 to ath11k, bus parameters are
going to be entirely different among AHB devices. Therefore,
it is wise to move bus_params to hw_params and get rid of
bus_params entirely.

Also, mhi_support parameter is not used anywhere in the driver,
remove it from bus_params.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 11 ++--------
 drivers/net/wireless/ath/ath11k/core.c | 28 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/core.h | 12 +----------
 drivers/net/wireless/ath/ath11k/hw.h   |  4 ++++
 drivers/net/wireless/ath/ath11k/pci.c  | 14 +++----------
 drivers/net/wireless/ath/ath11k/pcic.c |  4 ++--
 drivers/net/wireless/ath/ath11k/qmi.c  | 23 +++++++++++----------
 7 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f407d4af2074..49d79cfbf21c 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -28,13 +29,6 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath11k_ahb_of_match);
 
-static const struct ath11k_bus_params ath11k_ahb_bus_params = {
-	.mhi_support = false,
-	.m3_fw_support = false,
-	.fixed_bdf_addr = true,
-	.fixed_mem_region = true,
-};
-
 #define ATH11K_IRQ_CE0_OFFSET 4
 
 static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
@@ -685,8 +679,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	}
 
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(struct ath11k_ahb),
-			       ATH11K_BUS_AHB,
-			       &ath11k_ahb_bus_params);
+			       ATH11K_BUS_AHB);
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7e074b7716e7..19b5bb06c7e8 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -102,6 +102,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -169,6 +173,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -235,6 +243,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = NULL,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.static_window_map = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -301,6 +313,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.static_window_map = true,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -367,6 +383,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.static_window_map = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -432,6 +452,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.static_window_map = false,
 	},
 };
 
@@ -1730,8 +1754,7 @@ void ath11k_core_free(struct ath11k_base *ab)
 EXPORT_SYMBOL(ath11k_core_free);
 
 struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
-				      enum ath11k_bus bus,
-				      const struct ath11k_bus_params *bus_params)
+				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
 
@@ -1770,7 +1793,6 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	init_completion(&ab->wow.wakeup_completed);
 
 	ab->dev = dev;
-	ab->bus_params = *bus_params;
 	ab->hif.bus = bus;
 
 	return ab;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7a505531acf9..d8ab28413d95 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -748,14 +748,6 @@ struct ath11k_board_data {
 	size_t len;
 };
 
-struct ath11k_bus_params {
-	bool mhi_support;
-	bool m3_fw_support;
-	bool fixed_bdf_addr;
-	bool fixed_mem_region;
-	bool static_window_map;
-};
-
 struct ath11k_pci_ops {
 	int (*wakeup)(struct ath11k_base *ab);
 	void (*release)(struct ath11k_base *ab);
@@ -887,7 +879,6 @@ struct ath11k_base {
 	int bd_api;
 
 	struct ath11k_hw_params hw_params;
-	struct ath11k_bus_params bus_params;
 
 	const struct firmware *cal_file;
 
@@ -1135,8 +1126,7 @@ int ath11k_core_pre_init(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
 struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
-				      enum ath11k_bus bus,
-				      const struct ath11k_bus_params *bus_params);
+				      enum ath11k_bus bus);
 void ath11k_core_free(struct ath11k_base *ath11k);
 int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index b7ece3d5678c..09fa020bfee4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -196,6 +196,10 @@ struct ath11k_hw_params {
 	bool dbr_debug_support;
 	bool global_reset;
 	const struct cfg80211_sar_capa *bios_sar_capa;
+	bool m3_fw_support;
+	bool fixed_bdf_addr;
+	bool fixed_mem_region;
+	bool static_window_map;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 024661a17008..dedf1b88ddf6 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -115,13 +115,6 @@ static const struct ath11k_pci_ops ath11k_pci_ops_qcn9074 = {
 	.window_read32 = ath11k_pci_window_read32,
 };
 
-static const struct ath11k_bus_params ath11k_pci_bus_params = {
-	.mhi_support = true,
-	.m3_fw_support = true,
-	.fixed_bdf_addr = false,
-	.fixed_mem_region = false,
-};
-
 static const struct ath11k_msi_config msi_config_one_msi = {
 	.total_vectors = 1,
 	.total_users = 4,
@@ -593,7 +586,7 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 		return ret;
 	}
 
-	if (ab->bus_params.static_window_map)
+	if (ab->hw_params.static_window_map)
 		ath11k_pci_select_static_window(ab_pci);
 
 	return 0;
@@ -706,8 +699,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	u32 soc_hw_version_major, soc_hw_version_minor, addr;
 	int ret;
 
-	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
-			       &ath11k_pci_bus_params);
+	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI);
+
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
@@ -764,7 +757,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->pci.ops = &ath11k_pci_ops_qca6390;
 		break;
 	case QCN9074_DEVICE_ID:
-		ab->bus_params.static_window_map = true;
 		ab->pci.ops = &ath11k_pci_ops_qcn9074;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 63c678aea29e..7a920d65023f 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -163,7 +163,7 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
 	} else {
-		if (ab->bus_params.static_window_map)
+		if (ab->hw_params.static_window_map)
 			window_start = ath11k_pcic_get_window_start(ab, offset);
 		else
 			window_start = ATH11K_PCI_WINDOW_START;
@@ -198,7 +198,7 @@ u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 	if (offset < ATH11K_PCI_WINDOW_START) {
 		val = ioread32(ab->mem + offset);
 	} else {
-		if (ab->bus_params.static_window_map)
+		if (ab->hw_params.static_window_map)
 			window_start = ath11k_pcic_get_window_start(ab, offset);
 		else
 			window_start = ATH11K_PCI_WINDOW_START;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 0442faa3b7af..c89e76108237 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/elf.h>
@@ -1648,7 +1649,7 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	req.bdf_support_valid = 1;
 	req.bdf_support = 1;
 
-	if (ab->bus_params.m3_fw_support) {
+	if (ab->hw_params.m3_fw_support) {
 		req.m3_support_valid = 1;
 		req.m3_support = 1;
 		req.m3_cache_support_valid = 1;
@@ -1803,7 +1804,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	 * failure to FW and FW will then request mulitple blocks of small
 	 * chunk size memory.
 	 */
-	if (!(ab->bus_params.fixed_mem_region ||
+	if (!(ab->hw_params.fixed_mem_region ||
 	      test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
 	      ab->qmi.target_mem_delayed) {
 		delayed = true;
@@ -1873,7 +1874,7 @@ static void ath11k_qmi_free_target_mem_chunk(struct ath11k_base *ab)
 	int i;
 
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
-		if ((ab->bus_params.fixed_mem_region ||
+		if ((ab->hw_params.fixed_mem_region ||
 		     test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
 		     ab->qmi.target_mem[i].iaddr)
 			iounmap(ab->qmi.target_mem[i].iaddr);
@@ -2124,7 +2125,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 
 	memset(&resp, 0, sizeof(resp));
 
-	if (ab->bus_params.fixed_bdf_addr) {
+	if (ab->hw_params.fixed_bdf_addr) {
 		bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
 		if (!bdf_addr) {
 			ath11k_warn(ab, "qmi ioremap error for bdf_addr\n");
@@ -2153,7 +2154,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 			req->end = 1;
 		}
 
-		if (ab->bus_params.fixed_bdf_addr ||
+		if (ab->hw_params.fixed_bdf_addr ||
 		    type == ATH11K_QMI_FILE_TYPE_EEPROM) {
 			req->data_valid = 0;
 			req->end = 1;
@@ -2162,7 +2163,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 			memcpy(req->data, temp, req->data_len);
 		}
 
-		if (ab->bus_params.fixed_bdf_addr) {
+		if (ab->hw_params.fixed_bdf_addr) {
 			if (type == ATH11K_QMI_FILE_TYPE_CALDATA)
 				bdf_addr += ab->hw_params.fw.cal_offset;
 
@@ -2201,7 +2202,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 			goto err_iounmap;
 		}
 
-		if (ab->bus_params.fixed_bdf_addr ||
+		if (ab->hw_params.fixed_bdf_addr ||
 		    type == ATH11K_QMI_FILE_TYPE_EEPROM) {
 			remaining = 0;
 		} else {
@@ -2214,7 +2215,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	}
 
 err_iounmap:
-	if (ab->bus_params.fixed_bdf_addr)
+	if (ab->hw_params.fixed_bdf_addr)
 		iounmap(bdf_addr);
 
 err_free_req:
@@ -2353,7 +2354,7 @@ static void ath11k_qmi_m3_free(struct ath11k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 
-	if (!ab->bus_params.m3_fw_support || !m3_mem->vaddr)
+	if (!ab->hw_params.m3_fw_support || !m3_mem->vaddr)
 		return;
 
 	dma_free_coherent(ab->dev, m3_mem->size,
@@ -2373,7 +2374,7 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 	memset(&req, 0, sizeof(req));
 	memset(&resp, 0, sizeof(resp));
 
-	if (ab->bus_params.m3_fw_support) {
+	if (ab->hw_params.m3_fw_support) {
 		ret = ath11k_qmi_m3_load(ab);
 		if (ret) {
 			ath11k_err(ab, "failed to load m3 firmware: %d", ret);
@@ -2792,7 +2793,7 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 			   msg->mem_seg[i].type, msg->mem_seg[i].size);
 	}
 
-	if (ab->bus_params.fixed_mem_region ||
+	if (ab->hw_params.fixed_mem_region ||
 	    test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
 		ret = ath11k_qmi_assign_target_mem_chunk(ab);
 		if (ret) {
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
