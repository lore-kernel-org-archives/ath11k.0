Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00BDC4332F
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Da6qAL8er7ZpwFoIlkbVwIJeZ+j1WN861udBgCJ/vas=; b=aIDcbn7g1O4Gbs
	8UTAkFj9tO/kBoy636uc690tWWRxStE1iKSXdPNp7a9Y83Gaqsld3lrIHGEVB++N4as7OIe8xYkeX
	fMkWhzWM/fp7OqdR7rYMcUHKsuDc9W5SN4zfBP18qcrcQljBTDvIcQfsJXLLDIMlUZ5O02zgAQDk2
	xle4WeO+uiwv6fspyMgiovSVnXFr/jNoQ8AbwjGTN9Wx0TMKIv8YaJOQErT/16Te2K/5jkR0UEIlP
	g7fEANmJK/bw7cYjqf3leHCNWQIfdKm78JVDFY/r3eaiZW7/tJy8GrXBapB9Gr78dWQcdwJGzBppC
	bZx6Z3iNh+c4L7y1Okrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMbG-00F3EC-GL; Tue, 26 Apr 2022 14:55:34 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njMbD-00F3Bk-1a
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984931; x=1682520931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgNQmKJBaIlrW7E2gnGVDMXj0ZLfx915+6DZA2GFN2o=;
 b=oHWNKvVboudnHQTNAJ6Lsmji2g0enl1pzFylEH54CSYNngv/IGXsOudH
 /BSzGFNsbt+shFVGGtIPBekGLrdn75sr9kJB0eoSYJZmmxlYUQxCnY3I4
 WGj7ZuSge8cpRvWAgNtt/9eJaNqP7DRL0+3wTi2+R4sQx6ekbEy8OLx4U k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 26 Apr 2022 07:55:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:55:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:29 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:26 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v5 02/12] ath11k: Add HW params for WCN6750
Date: Tue, 26 Apr 2022 20:24:46 +0530
Message-ID: <20220426145456.8055-3-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
References: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_075531_162064_9E035ED7 
X-CRM114-Status: GOOD (  11.90  )
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

Add HW params for WCN6750. It is similar to the HW params
of QCA6390 with few differences wrt DP APIs and register
offsets.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 62 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/qmi.h  |  2 +
 3 files changed, 65 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index f011db4bcd2b..78419a021075 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -433,6 +433,68 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.global_reset = true,
 		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
 	},
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
+	},
 };
 
 static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index fa299bfb4efc..e63b01ba68c8 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -140,6 +140,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_QCN9074_HW10,
 	ATH11K_HW_WCN6855_HW20,
 	ATH11K_HW_WCN6855_HW21,
+	ATH11K_HW_WCN6750_HW10,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 61678de56ac7..872646c3b3ed 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
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
