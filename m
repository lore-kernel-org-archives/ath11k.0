Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35C9C43217
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=me4A3YD0Lzpc8mfOd514Dg1c6vxXYi68WXWDBH0y/y0=; b=ArNp+zMEu5cgVL
	x96f1KiBWfCqvyRlO1sux8Vlb6q7c+undxWTdCSCj8qjKUWFVNOvxTw9u+ry1hP1REspx0WiQQtPv
	Ak2HT2WLV4S05RA7kp8IEuS3GXkUYynGikS6hFsUmDNLuHL1CE/rUHdYgwn/SeL04CWjhLujyhu2a
	SRU9xkjK74vryeHzZNy3eHW4CZcBU8YQGlt20LVWrqkmbFcZGquWOmaEionc51DbKcG3sVtVwLH35
	ZY5ozYAr1QP5HnVsZHWD/SD6tWMXUtZt0nMNGcniJP5sAxA7WvDm0g6vkvzaM9SdUfb1p/e3cgdNI
	Rz9OJXblNBdsMDhEf/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkU4Q-00C2JD-0I; Fri, 29 Apr 2022 17:06:18 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkU4K-00C2FE-Hf
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 17:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651251972; x=1682787972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X33UvMgtA91FrDurCKR369yiB1iHL7FB/FI97bYrveA=;
 b=djFsnXSF/Ec8M8TGiY0ZEqbimfBtrFc/TvnxHw9lnto9AcyEzeRr6vqO
 bx91hYbL+0y65EGPYfPNQhrPRrTT7TvTzCutl68BK+gleCTAbRK4UDZqr
 KBryg5vClM8cmZhQ917YO7uk1Pl/PIWBQ6j6C1jMITBzx8+l20dTfDH71 c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 10:06:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:06:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:35 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:33 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v7 3/9] ath11k: Add HW params for WCN6750
Date: Fri, 29 Apr 2022 22:34:56 +0530
Message-ID: <20220429170502.20080-4-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_100612_643415_FF21DA15 
X-CRM114-Status: GOOD (  14.84  )
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

WCN6750 is a PCIe based solution that is attached to and enumerated
by the WPSS (Wireless Processor SubSystem) Q6 processor.

Though it is a PCIe device, since it is not attached to APSS processor
(Application Processor SubSystem), APSS will be unaware of such a decice
and hence it is registered to the APSS processor as a platform device(AHB).
Because of this hybrid nature, it is called as a hybrid bus device.

A new variable hybrid_bus_type is defined in hw_params to indicate the
hybrid nature of the device.

Add HW params for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 72 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/qmi.h  |  2 +
 4 files changed, 76 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 19b5bb06c7e8..dc1084532cef 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -106,6 +106,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = true,
 		.fixed_mem_region = true,
 		.static_window_map = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -177,6 +178,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = true,
 		.fixed_mem_region = true,
 		.static_window_map = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -247,6 +249,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
 		.static_window_map = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -317,6 +320,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
 		.static_window_map = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -387,6 +391,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
 		.static_window_map = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -456,6 +461,73 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
 		.static_window_map = false,
+		.hybrid_bus_type = false,
+	},
+	{
+		.name = "wcn6750 hw1.0",
+		.hw_rev = ATH11K_HW_WCN6750_HW10,
+		.fw = {
+			.dir = "WCN6750/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.max_radios = 1,
+		.bdf_addr = 0x4B0C0000,
+		.ring_mask = &ath11k_hw_ring_mask_qca6390,
+		.internal_sleep_clock = false,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_WCN6750,
+		.host_ce_config = ath11k_host_ce_config_qca6390,
+		.ce_count = 9,
+		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
+		.target_ce_count = 9,
+		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_qca6390,
+		.svc_to_ce_map_len = 14,
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+		.single_pdev_only = true,
+		.rxdma1_enable = false,
+		.num_rxmda_per_pdev = 1,
+		.rx_mac_buf_ring = true,
+		.vdev_start_delay = true,
+		.htt_peer_map_v2 = false,
+
+		.spectral = {
+			.fft_sz = 0,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 0,
+			.max_fft_bins = 0,
+		},
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP),
+		.supports_monitor = false,
+		.supports_shadow_regs = true,
+		.idle_ps = true,
+		.supports_sta_ps = true,
+		.cold_boot_calib = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
+		.supports_suspend = false,
+		.supports_regdb = true,
+		.fix_l1ss = false,
+		.credit_flow = true,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
+		.hal_params = &ath11k_hw_hal_params_qca6390,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = false,
+		.supports_rssi_stats = true,
+		.fw_wmi_diag_event = false,
+		.current_cc_support = true,
+		.dbr_debug_support = false,
+		.global_reset = false,
+		.bios_sar_capa = NULL,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.hybrid_bus_type = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index d8ab28413d95..fdea44627125 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -140,6 +140,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_QCN9074_HW10,
 	ATH11K_HW_WCN6855_HW20,
 	ATH11K_HW_WCN6855_HW21,
+	ATH11K_HW_WCN6750_HW10,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 09fa020bfee4..03eb5dfd4a5e 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -200,6 +200,7 @@ struct ath11k_hw_params {
 	bool fixed_bdf_addr;
 	bool fixed_mem_region;
 	bool static_window_map;
+	bool hybrid_bus_type;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 61678de56ac7..e0201e184733 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_QMI_H
@@ -20,6 +21,7 @@
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9074	0x07
+#define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_WCN6750	0x03
 #define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
