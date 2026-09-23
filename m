Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18520C98310
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srbic23SQot9/K2nkjn9ZeOv+TVPvCZvBTgXjOrQIQI=; b=piElMjnw4NI3MJZBQXtYNQJmpp
	VUSdMJLQahOK+Z3nlIfopxXO/nMVf1764lZ87O3n1xc9FNjNU01VV4wVkr/gmg2rdUdDU9CMzCDdA
	ANl/Powc4yJv56N/fmR6qj+X+pOAtkWWQjWa0EHGYOMZ5nUIYb5EOHAH/Wj52oE9NqzX9ZBj44oef
	Wq5jAP77tlu4LhGn9XQlMCXt8uZvz2GxHh4IDcXknG5h3V4jsPSTUzgFf1dUNC3gWWjn7O9NL0HhF
	VyhRZq9kBdcXNHBpqtySA1vVjtZts1p85Ajnvxi0wj2y/q/KA7nMyKrNa9x15uosxr7UnJdzUhIdz
	AmtvH4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj2-00000008BBE-0Yg7;
	Wed, 23 Sep 2026 12:05:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8f-3bwY
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CD8744892;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EC0DC4AF0F;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165121;
	bh=T4Gp+UnQfJggXdZjPcApWFXsQ85bp+hX6k7kInFCoe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RbSRr33o/COFBlGgvu6POYg4CNuqDD09YfSKBPkbEADJabXfMJY1xVm0/mRMEgzBf
	 dNHH2KDgFUjo93I2kDib7/5NZBAQ6cAwxdcoNndypw/fHP1omjEsA+XPAalVyGhUNl
	 1leRHWQHSnLoQ8SN5xIVfoqMVlW9vTjiisHl+rbQCeN35hUfVMp8J4mXOO+f09zkdz
	 tZ0ryLaGI3v9EPoVw3PRZBdQSUXnajZbC09SamJoVxbepy8gySoMVGEqQl+P4Qja8L
	 jJmNUs9M3EFYVOcDyuuQVlyHZLzFM2i+e9rGLuegagzS1QNO7NDQlrTJSYePOrCt6V
	 go4QgRPE4AJpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD79C9830B;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:17 +0400
Subject: [PATCH ath-next 11/16] wifi: ath11k: add hw params for QCN6122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-11-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=5214;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=5ALmRWICK/brup6W9KBxCblyg88vPuQc4jQzYS+ockc=;
 b=IBzg1u3iKo1e45bVN9ORNakmMv0xLJe8QmrypwwVwuhFdN93+tomR3RI3AkfSn/JbhgI4LHwL
 Unx2FNE4r4fB9kQmUBctK/oD+TYh2DIxObBXv+FSGpmbdnlkgmU/ws+
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Add QCN6122 platform support.

QCN6122 is a PCIe based solution that is attached to and enumerated
by the WPSS (Wireless Processor SubSystem) Q6 processor.

Though it is a PCIe device, since it is not attached to APSS processor,
APSS will be unaware of such a decice and hence it is registered to the
APSS processor as a platform AHB device.

As such, QCN6122 is a hybrid bus type device and follows the same
codepath as for WCN6750.

This is a heavily simplified version of below downstream patch:
Link: https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/NHSS.QSDK.12.4.5.r2/mac80211/patches/232-ath11k-qcn6122-support.patch

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 85 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/qmi.h  |  3 +-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 428f382e74a9..0a38db1ee175 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -936,6 +936,91 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cfr_num_stream_bufs = 255,
 		.cfr_stream_buf_size = 8200,
 	},
+	{
+		.hw_rev = ATH11K_HW_QCN6122_HW10,
+		.name = "qcn6122 hw1.0",
+		.fw = {
+			.dir = "QCN6122/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath11k_m3_fw_loader_ahb,
+		},
+		.max_radios = MAX_RADIOS_5018,
+		.bdf_addr = 0x4D200000,
+		.hw_ops = &ipq5018_ops,
+		.internal_sleep_clock = false,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6122,
+		.host_ce_config = ath11k_host_ce_config_qcn9074,
+		.ce_count = CE_CNT_5018,
+		.target_ce_config = ath11k_target_ce_config_wlan_ipq5018,
+		.target_ce_count = TARGET_CE_CNT_5018,
+		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_ipq5018,
+		.svc_to_ce_map_len = SVC_CE_MAP_LEN_5018,
+		.single_pdev_only = false,
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = RXDMA_PER_PDEV_5018,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+		.htt_peer_map_v2 = true,
+
+		.spectral = {
+			.fft_sz = 2,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 16,
+			.fft_hdr_len = 24,
+			.max_fft_bins = 1024,
+			.fragment_160mhz = false,
+		},
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
+		.full_monitor_mode = false,
+		.supports_shadow_regs = false,
+		.idle_ps = false,
+		.supports_sta_ps = false,
+		.coldboot_cal_mm = false,
+		.coldboot_cal_ftm = false,
+		.cbcal_restart_fw = true,
+		.fw_mem_mode = 1,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
+		.supports_suspend = false,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
+		.supports_regdb = false,
+		.fix_l1ss = true,
+		.credit_flow = false,
+		.hal_params = &ath11k_hw_hal_params_ipq5018,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = false,
+		.supports_rssi_stats = false,
+		.fw_wmi_diag_event = false,
+		.current_cc_support = false,
+		.dbr_debug_support = true,
+		.global_reset = false,
+		.bios_sar_capa = NULL,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = true,
+		.hybrid_bus_type = true,
+		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
+
+		.sram_dump = {},
+
+		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
+		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = false,
+		.support_dual_stations = false,
+		.pdev_suspend = false,
+		.cfr_support = false,
+		.cfr_num_stream_bufs = 0,
+		.cfr_stream_buf_size = 0,
+	},
 };
 
 static const struct dmi_system_id ath11k_pm_quirk_table[] = {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..e92ec95dd384 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -153,6 +153,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_IPQ5018_HW10,
 	ATH11K_HW_QCA2066_HW21,
 	ATH11K_HW_QCA6698AQ_HW21,
+	ATH11K_HW_QCN6122_HW10,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 350816c81ee5..f5442a04f079 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -21,10 +21,11 @@
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9074	0x07
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_WCN6750	0x03
+#define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6122	0x40
 #define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
-#define ATH11K_QMI_CALDB_SIZE			0x480000
+#define ATH11K_QMI_CALDB_SIZE			0x500000
 #define ATH11K_QMI_BDF_EXT_STR_LENGTH		0x20
 #define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	5
 

-- 
2.53.0



