Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C602DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IN25Y9cKRu0H3OkQ9ZqIjHJLiuUkY8yDjwAngUyM98Y=; b=FgTpeMCl/26Veb
	Z/bKAXJiEQPH7q3OgwDcBz9TrUrpuxQFobE9ELt6t9ZxuGD9FPerVT4rsP96vNBwB/yBdJ3K8rIP7
	eBOmJmQYF3Bl1BGrUM5VCRMJHBfOhg8ATeQQVVxP1v/tlgPgTOQ39JuKAzDtDV7OUvgDVqf7zobsX
	6VIb7AShKgB2V+naFQjRjBvLj5psDmNBaNB5PAD4GS1ilqOB/QSgKqC+UdcM2X2iM076NcdtwE/mL
	UkFajJ0DBegsWHu8/vN6KzWkX41/M60ayLLuuCz/+VUbpeWdJNOBgUSm6O4/e29BPwj1UGhtZaVMV
	sth/C9q+bLkacAZRYPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrWw8-00HAEd-Hl; Mon, 29 Nov 2021 03:02:36 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrWw5-00HAE8-Nv
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 03:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638154953; x=1669690953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lfFh2HdaEX3b8LxDEEOvBRtH25acbpNHiPOC24X6Las=;
 b=emdv7Nqrj2gV2JTCdQIcFjkrQCIMVYhzPj7FlLuet5II0MzNEvALWBJX
 OniZ1TyLdoJoju8StWQ3NWSQF/KQn++NjTgwXkcN27naGEkkt+GEWNgEM
 y1bN5l8AFYHJ7YW1s/JQ8HnA8TBijl1m6MXFt5uZa34IHWnibNR8/51pZ 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Nov 2021 19:02:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2021 19:02:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 28 Nov 2021 19:02:01 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 28 Nov 2021 19:02:00 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: add support for WCN6855 hw2.1
Date: Mon, 29 Nov 2021 10:56:12 +0800
Message-ID: <20211129025613.21594-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_190233_854699_C828452D 
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

Ath11k fails to probe WCN6855 hw2.1 chip:

[ 6.983821] ath11k_pci 0000:06:00.0: enabling device (0000 -> 0002)
[ 6.983841] ath11k_pci 0000:06:00.0: Unsupported WCN6855 SOC hardware version: 18 17

This is caused by the wrong bit mask setting of hardware major version:
for QCA6390/QCN6855, it should be BIT8-11, not BIT8-16, so change the
definition to GENMASK(11, 8).

Also, add a separate entry for WCN6855 hw2.1 in ath11k_hw_params.

Please note that currently WCN6855 hw2.1 shares the same firmwares
as hw2.0, so users of this chip need to create a symlink as below:

	ln -s hw2.0 hw2.1

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: 18ac1665e785 ("ath11k: pci: check TCSR_SOC_HW_VERSION")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 53 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 16 +++++++-
 4 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dd1a1bb078c3..5f6bdee26f31 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -284,6 +284,59 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.max_fft_bins = 0,
 		},
 
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP),
+		.supports_monitor = false,
+		.supports_shadow_regs = true,
+		.idle_ps = true,
+		.supports_sta_ps = true,
+		.cold_boot_calib = false,
+		.supports_suspend = true,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+		.fix_l1ss = false,
+		.credit_flow = true,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
+		.hal_params = &ath11k_hw_hal_params_qca6390,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = false,
+		.wakeup_mhi = true,
+	},
+	{
+		.name = "wcn6855 hw2.1",
+		.hw_rev = ATH11K_HW_WCN6855_HW21,
+		.fw = {
+			.dir = "WCN6855/hw2.1",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.max_radios = 3,
+		.bdf_addr = 0x4B0C0000,
+		.hw_ops = &wcn6855_ops,
+		.ring_mask = &ath11k_hw_ring_mask_qca6390,
+		.internal_sleep_clock = true,
+		.regs = &wcn6855_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390,
+		.host_ce_config = ath11k_host_ce_config_qca6390,
+		.ce_count = 9,
+		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
+		.target_ce_count = 9,
+		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_qca6390,
+		.svc_to_ce_map_len = 14,
+		.single_pdev_only = true,
+		.rxdma1_enable = false,
+		.num_rxmda_per_pdev = 2,
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
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index bbfc10fd5c6d..b25f18589e29 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -117,6 +117,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_IPQ6018_HW10,
 	ATH11K_HW_QCN9074_HW10,
 	ATH11K_HW_WCN6855_HW20,
+	ATH11K_HW_WCN6855_HW21,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 26c7ae242db6..03e432f415d3 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -356,6 +356,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		break;
 	case ATH11K_HW_QCA6390_HW20:
 	case ATH11K_HW_WCN6855_HW20:
+	case ATH11K_HW_WCN6855_HW21:
 		ath11k_mhi_config = &ath11k_mhi_config_qca6390;
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index c2af8184e4a2..c17a6c56b145 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -25,7 +25,7 @@
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
 
 #define TCSR_SOC_HW_VERSION		0x0224
-#define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(16, 8)
+#define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(11, 8)
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 0)
 
 /* BAR0 + 4k is always accessible, and no
@@ -1291,9 +1291,21 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
 		case 2:
-			ab->hw_rev = ATH11K_HW_WCN6855_HW20;
+			switch (soc_hw_version_minor) {
+			case 0x00:
+			case 0x01:
+				ab->hw_rev = ATH11K_HW_WCN6855_HW20;
+				break;
+			case 0x10:
+			case 0x11:
+				ab->hw_rev = ATH11K_HW_WCN6855_HW21;
+				break;
+			default:
+				goto unsupported_wcn6855_soc;
+			}
 			break;
 		default:
+unsupported_wcn6855_soc:
 			dev_err(&pdev->dev, "Unsupported WCN6855 SOC hardware version: %d %d\n",
 				soc_hw_version_major, soc_hw_version_minor);
 			ret = -EOPNOTSUPP;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
