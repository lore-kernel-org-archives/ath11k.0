Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA04C43461
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DFD6191A
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DFD6191A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZkCa6Qz6kKaI0VmLwM6qGHySRWnsy5BYVVNSWMTAtk=; b=PW0+i0h2U8rC5w8q0QHD/G7B9
	P2Yrlm59XJAOi63/DMyKz6bap4QQbxgcW5p5ppGK7QbRMCKW9QNsi/rIPtHKZGSEHj0n6DxXmGpKQ
	lIKcbLgsqDwt1hkwrv/phOqg+Uw5rnMz9QiL5IuIZ9B4ELxFFbEfNK6uF/e2wVslVXbMUWQdqml1J
	KOxb+ul//u6jrGVaDSehHCS3d2H0fObCzwj+uFsM5upys6Z3SBm2CmfXwwHJXbp+pmffYh20J4M8p
	MlTgG5JmC4tiTurOeNvIjtYR5dmQ2MZKfJ46g0JR6diS/2wqTX+fB9NglTvf73ZW15jl2UOKazJMR
	ETMkfqupw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQP-000mOP-4N; Tue, 11 May 2021 16:40:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVA6-000ipX-Rw
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Wg4GCO9yFePPA2nMfSeaT77mhhofzZGJqmjUaaqNO4k=; b=Zq/cgNn9rO1ZHA3AlDXotpbqR+
 UQIFzaculNSlVaxNFlWEcnixvjtMYlvh2neiNBNnb0qNwqxiPbtkV6u7o0V9GKr4hWMhCyJpuHaSl
 Fk3q+Vxn/Akhkg8AYnSqZIm7lfJqBTJvhWyr+1OAd8envS5YsKm4GYO5YY2QAADdRpt9bTmtHiKje
 jlyMiZ3NHqqHGjsMX7JG17ZdPZmonRuR5W4+rh4Gian08Nw7K+Q7w+9NUTslZmPbuld3rej3vwX7+
 Ifhf/1bAljmimu44eP2uERMeKd9JmnBK/AAUWk4mwp2gnxX8slOY866uXNmg1nffN7UuQ1fVS5NEc
 fxx5zE2Q==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVA3-009l6R-Si
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:23:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750187; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Wg4GCO9yFePPA2nMfSeaT77mhhofzZGJqmjUaaqNO4k=;
 b=eZh6oB6mijbQT5M/PVCBUFuCttV4ubqiZrvwRl7RbwlWjKnyYl8WRrD2U+45r/aULCeVOyrq
 jWN5TN1HPsavYMVc37zuLsMmUmuECDN9gVSMuZFrswwxq6J7qVNS68+m/pdg6xem9Knrw2DU
 4ghLbHkDKmGgvgn8Ao7jdvGJEn0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 609aaf6be0211609c47db264 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:23:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F0D7C43143; Tue, 11 May 2021 16:23:07 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70FD5C43145;
 Tue, 11 May 2021 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70FD5C43145
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 6/7] ath11k: add support for WCN6855
Date: Tue, 11 May 2021 19:22:13 +0300
Message-Id: <20210511162214.29475-7-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092308_019833_44844685 
X-CRM114-Status: GOOD (  17.20  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

This patch is to add support for WCN6855. For station mode,
WCN6855 is able to connect to an AP, and ping works well.
For AP mode, hostapd is able to bringup an SAP interface with
WCN6855, a normal station can connect to this AP and
ping works well.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 39 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 42 ++++++++++++++++++++------
 4 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 77ce3347ab86..fd8941905fdb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -187,6 +187,45 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 	},
+	{
+		.name = "wcn6855 hw2.0",
+		.hw_rev = ATH11K_HW_WCN6855_HW20,
+		.fw = {
+			.dir = "WCN6855/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_size = 256 * 1024,
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
+		.tcl_0_only = true,
+		.spectral_fft_sz = 0,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP),
+		.supports_monitor = false,
+		.supports_shadow_regs = true,
+		.idle_ps = true,
+		.cold_boot_calib = false,
+		.supports_suspend = true,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+	},
 };
 
 int ath11k_core_suspend(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 55af982deca7..6bd3bc5cee2f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -107,6 +107,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_QCA6390_HW20,
 	ATH11K_HW_IPQ6018_HW10,
 	ATH11K_HW_QCN9074_HW10,
+	ATH11K_HW_WCN6855_HW20,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 27b394d115e2..75cc2d80fde8 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -354,6 +354,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		ath11k_mhi_config = &ath11k_mhi_config_qcn9074;
 		break;
 	case ATH11K_HW_QCA6390_HW20:
+	case ATH11K_HW_WCN6855_HW20:
 		ath11k_mhi_config = &ath11k_mhi_config_qca6390;
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 0f31eb566fb6..d33b5d66b494 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -36,9 +36,11 @@
 
 #define QCA6390_DEVICE_ID		0x1101
 #define QCN9074_DEVICE_ID		0x1104
+#define WCN6855_DEVICE_ID		0x1103
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
+	{ PCI_VDEVICE(QCOM, WCN6855_DEVICE_ID) },
 	/* TODO: add QCN9074_DEVICE_ID) once firmware issues are resolved */
 	{0}
 };
@@ -1176,12 +1178,26 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.get_ce_msi_idx = ath11k_pci_get_ce_msi_idx,
 };
 
+static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 *major, u32 *minor)
+{
+	u32 soc_hw_version;
+
+	soc_hw_version = ath11k_pci_read32(ab, TCSR_SOC_HW_VERSION);
+	*major = FIELD_GET(TCSR_SOC_HW_VERSION_MAJOR_MASK,
+			   soc_hw_version);
+	*minor = FIELD_GET(TCSR_SOC_HW_VERSION_MINOR_MASK,
+			   soc_hw_version);
+
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "pci tcsr_soc_hw_version major %d minor %d\n",
+		   *major, *minor);
+}
+
 static int ath11k_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *pci_dev)
 {
 	struct ath11k_base *ab;
 	struct ath11k_pci *ab_pci;
-	u32 soc_hw_version, soc_hw_version_major, soc_hw_version_minor;
+	u32 soc_hw_version_major, soc_hw_version_minor;
 	int ret;
 
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
@@ -1209,15 +1225,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCA6390_DEVICE_ID:
-		soc_hw_version = ath11k_pci_read32(ab, TCSR_SOC_HW_VERSION);
-		soc_hw_version_major = FIELD_GET(TCSR_SOC_HW_VERSION_MAJOR_MASK,
-						 soc_hw_version);
-		soc_hw_version_minor = FIELD_GET(TCSR_SOC_HW_VERSION_MINOR_MASK,
-						 soc_hw_version);
-
-		ath11k_dbg(ab, ATH11K_DBG_PCI, "pci tcsr_soc_hw_version major %d minor %d\n",
-			   soc_hw_version_major, soc_hw_version_minor);
-
+		ath11k_pci_read_hw_version(ab, &soc_hw_version_major, &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
 		case 2:
 			ab->hw_rev = ATH11K_HW_QCA6390_HW20;
@@ -1235,6 +1243,20 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->bus_params.static_window_map = true;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
+	case WCN6855_DEVICE_ID:
+		ath11k_pci_read_hw_version(ab, &soc_hw_version_major, &soc_hw_version_minor);
+		switch (soc_hw_version_major) {
+		case 2:
+			ab->hw_rev = ATH11K_HW_WCN6855_HW20;
+			break;
+		default:
+			dev_err(&pdev->dev, "Unsupported WCN6855 SOC hardware version: %d %d\n",
+				soc_hw_version_major, soc_hw_version_minor);
+			ret = -EOPNOTSUPP;
+			goto err_pci_free_region;
+		}
+		ab_pci->msi_config = &ath11k_msi_config[0];
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
 			pci_dev->device);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
