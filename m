Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E935CCCF9F0
	for <ath11k@archiver.kernel.org>; Wed, 29 Oct 2025 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3os6B3cFYn7TCOXTchceADyd1LcjT4Ih7wSawNQ0gU=; b=dj0pKs3hVVmlpk6lZez1kKScjZ
	qrMYfsX7WtmjFRerYxWx9azsA63cmw2LscLa9rPVg3nU5uFytkX3Ck7HRtxwUtXqlvoKwnaHOVNFc
	UJ+ghCsttGBW5kzJYAJwwUZd3n8o3WOI1N5eKsHW/E6uSTTwqPdX0UnZmMVgkw9mECGhouiPdZcib
	gzzzAECxPD9KONGNrpBHrhxUSNW66FCzYCUbZtf6tAENlofKY8KTMzlhSvir+B1HuHa6962VR08kY
	GCC5RGpzDK8KoSFacWhMlDcObHlkyO+Xw8uEoupr4A2nlzAYkaEKRtCwoP3GbX9pelBw0z8gUNFEf
	fC5BVV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78O-00000001Zdn-3Fcy;
	Wed, 29 Oct 2025 14:26:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78M-00000001Za4-1W29
	for ath11k@lists.infradead.org;
	Wed, 29 Oct 2025 14:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F96D49C26;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71245C116D0;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748000;
	bh=mItrEmeR9FU3VM2ptXFfKvshAvAcV9+BLLTvG3OGXks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SJyg0WvWtx67Cjh+ZefA1l69/7T9iwBn9QnmnLTQCZIAyWhsDACzhLsr4I1UIXWEs
	 sxoMEPuvLhY/2tg5QgkBqlNotG9DM9z9YXBu+ccELW/2dNOeGpJMKwcsnHKEZRu2H8
	 bryuYAfrQv4Hnf+vy6AsPNHehtMuQKO7XjkKIRfAJFQzP9QL7tp9FHRqShtoR+0TzQ
	 f65Rbh2UFhuRKkiJ/57gZwuOJBYSNRD01aLhrv7SVti4MBMpAgMitv9FLq92iu+g0i
	 iIeQKVoA4NaQ8xz1RuxrYUTH4OYcOPBqtSGDZC8gPvNFWqlp6kP74I+EZO8EiQU7X9
	 CcuBa7zZXyYEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2DDCCF9F6;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 29 Oct 2025 18:26:23 +0400
Subject: [PATCH 2/6] wifi: ath11k: add hw params for QCN6122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-ath11k-qcn6122-v1-2-58ed68eba333@outlook.com>
References: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
In-Reply-To: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761747997; l=4833;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=336+JRp6PC1s0koOSi14k/NRUhAY+mOyBfj5s8eLX8o=;
 b=Y08LUfTlUvGw10fN0S/pS3+157GXIWOr8HGsSX5NmErFynLJxOd4MCO0DqxDIRAMUox5IVfTn
 +C2CxiOa616CGcViwJTkqWJ69Ikj1KMOdjb7nS90S5gaLrByptYjRKO
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072642_508723_51CF3151 
X-CRM114-Status: GOOD (  14.58  )
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

Though it is a PCIe device, since it is not attached to APSS processor
(Application Processor SubSystem), APSS will be unaware of such a decice
so it is registered to the APSS processor as a platform device (AHB).
Because of this hybrid nature, it is called as a hybrid bus device.

QCN6122 is similar to WCN6750 and follows the same codepath as for
WCN6750 though it does not support shadow regs.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 67 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/qmi.h  |  3 +-
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2810752260f2f7eee226f88d5aea7cdabe7e9ed4..401b843402c6cca0e7fdd61e68b57fa6d5a6ae7e 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -907,6 +907,73 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_dual_stations = true,
 		.pdev_suspend = false,
 	},
+	{
+		.hw_rev = ATH11K_HW_QCN6122_HW10,
+		.name = "qcn6122 hw1.0",
+		.fw = {
+			.dir = "QCN6122/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.hal_params = &ath11k_hw_hal_params_ipq8074,
+		.max_radios = MAX_RADIOS_5018,
+		.bdf_addr = 0x4D200000,
+		.hw_ops = &ipq5018_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6122,
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.spectral = {
+			.fft_sz = 2,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 16,
+			.fft_hdr_len = 24,
+			.max_fft_bins = 1024,
+		},
+		.internal_sleep_clock = false,
+		.regs = &wcn6750_regs,
+		.credit_flow = false,
+		.max_tx_ring = 1,
+		.supports_monitor = true,
+		.supports_shadow_regs = false,
+		.idle_ps = false,
+		.supports_suspend = false,
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
+		.coldboot_cal_mm = false,
+		.coldboot_cal_ftm = false,
+		.cbcal_restart_fw = true,
+		.fix_l1ss = true,
+		.alloc_cacheable_memory = true,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = true,
+		.hybrid_bus_type = true,
+		.fw_mem_mode = 1,
+		.supports_sta_ps = false,
+		.dbr_debug_support = true,
+		.bios_sar_capa = NULL,
+		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
+		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
+		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = false,
+		.support_dual_stations = false,
+		.pdev_suspend = false,
+	},
 };
 
 static const struct dmi_system_id ath11k_pm_quirk_table[] = {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e8780b05ce11e39bdd93dd02d39812be90689b40..afc591f9608f48506bf19851169828c519661d72 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -152,6 +152,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_IPQ5018_HW10,
 	ATH11K_HW_QCA2066_HW21,
 	ATH11K_HW_QCA6698AQ_HW21,
+	ATH11K_HW_QCN6122_HW10,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7968ab122b65dc28a44eca7b34904f55f717f586..f6014b9662dbe5f4cfc6a2af7010938cad454267 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -22,10 +22,11 @@
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
2.51.1



