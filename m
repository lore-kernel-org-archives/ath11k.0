Return-Path: <SRS0=uMcA=P6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5190DC433FE
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 06:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161DB6112F
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 06:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 161DB6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1nVQQ7v4T5xt9udiPWmAuj0NOiXsPH9CF4v0w4YMZo=; b=xJkavcQlZw0b0v
	VaBpzZfYtDLaWZKZ8kulMThzESoay2xaJmjUDbJFUHxDNfQY1kJKCmSC4CLg56qDlX1KwNo4PxWrQ
	gOB4sGh1LBPUpBF2vMwVcHmCP0iAhHhYdgjHdAlMGnpf6lkXZ8AifeXco3g+gqPARlofErq8IVGwg
	El6F0TxG2KMv/gPf9PDvIQBJyLFghOaSro14nZnK8P4dMn64i7k3/c12MmvyL9/NTrkl1jROCEdZE
	5S81oQZrbJuN7uIgOiTGM+o5zKFvEIPCCzCMDwd73wtN8MDAInKAusABNbNdm7SO1A4VFHCvYDigy
	uRqP8IGbOT+MykbdbWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml3yF-007Jep-4n; Thu, 11 Nov 2021 06:54:03 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml3yC-007JeW-RN
 for ath11k@lists.infradead.org; Thu, 11 Nov 2021 06:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636613641; x=1668149641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3dZWcq9UD5b52Xq1UuiU6fkON15a4UIjdGgWcvMR+k0=;
 b=xh6hOrVseTVKSpZLZglbAhZwf4r/ILfhEODnTqM9p7I2Jb7R0rEnWjVv
 lsTqNtTtgmdMnp3EhjxA9zXrYV8wgYolmrXIv3u6crAjH9p8wjjBQZ9RC
 +/awYWA30DP+AYm3mJ5ph+gZE2yOgJ5h5RyengMc0v5sfC4l2G2LqT/3B k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Nov 2021 22:53:58 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 22:53:57 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 22:53:57 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 22:53:55 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: add string type to search board data in
 board-2.bin for WCN6855
Date: Thu, 11 Nov 2021 01:53:40 -0500
Message-ID: <20211111065340.20187-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_225400_960975_A1F8FE45 
X-CRM114-Status: GOOD (  14.11  )
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

Currently ath11k only support string type with bus, chip id and board id
such as "bus=ahb,qmi-chip-id=1,qmi-board-id=4" for ahb bus chip and
"bus=pci,qmi-chip-id=0,qmi-board-id=255" for PCIe bus chip in
board-2.bin. For WCN6855, it is not enough to distinguish all different
chips.

This is to add a new string type which include bus, chip id, board id,
vendor, device, subsystem-vendor and subsystem-device for WCN6855.

ath11k will first load board-2.bin and search in it for the board data
with the above parameters, if matched one board data, then download it
to firmware, if not matched any one, then ath11k will download the file
board.bin to firmware.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
---
v2: remove the mask of chip id and board id in ath11k_core_create_board_name()

 drivers/net/wireless/ath/ath11k/core.c | 27 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.h | 13 +++++++++++++
 drivers/net/wireless/ath/ath11k/pci.c  | 10 ++++++++++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2012b0170e3c..3ac0dca997e1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -473,11 +473,26 @@ static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
 		scnprintf(variant, sizeof(variant), ",variant=%s",
 			  ab->qmi.target.bdf_ext);
 
-	scnprintf(name, name_len,
-		  "bus=%s,qmi-chip-id=%d,qmi-board-id=%d%s",
-		  ath11k_bus_str(ab->hif.bus),
-		  ab->qmi.target.chip_id,
-		  ab->qmi.target.board_id, variant);
+	switch (ab->id.bdf_search) {
+	case ATH11K_BDF_SEARCH_BUS_AND_BOARD:
+		scnprintf(name, name_len,
+			  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x,qmi-chip-id=%04x,qmi-board-id=%04x%s",
+			  ath11k_bus_str(ab->hif.bus),
+			  ab->id.vendor, ab->id.device,
+			  ab->id.subsystem_vendor,
+			  ab->id.subsystem_device,
+			  ab->qmi.target.chip_id,
+			  ab->qmi.target.board_id,
+			  variant);
+		break;
+	default:
+		scnprintf(name, name_len,
+			  "bus=%s,qmi-chip-id=%d,qmi-board-id=%d%s",
+			  ath11k_bus_str(ab->hif.bus),
+			  ab->qmi.target.chip_id,
+			  ab->qmi.target.board_id, variant);
+		break;
+	}
 
 	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot using board name '%s'\n", name);
 
@@ -716,7 +731,7 @@ int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 	return 0;
 }
 
-#define BOARD_NAME_SIZE 100
+#define BOARD_NAME_SIZE 200
 int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 {
 	char boardname[BOARD_NAME_SIZE];
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index dcc54d4cc096..81680da96156 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -54,6 +54,11 @@ enum ath11k_supported_bw {
 	ATH11K_BW_160	= 3,
 };
 
+enum ath11k_bdf_search {
+	ATH11K_BDF_SEARCH_DEFAULT,
+	ATH11K_BDF_SEARCH_BUS_AND_BOARD,
+};
+
 enum wme_ac {
 	WME_AC_BE,
 	WME_AC_BK,
@@ -893,6 +898,14 @@ struct ath11k_base {
 
 	struct completion htc_suspend;
 
+	struct {
+		enum ath11k_bdf_search bdf_search;
+		u32 vendor;
+		u32 device;
+		u32 subsystem_vendor;
+		u32 subsystem_device;
+	} id;
+
 	/* must be last */
 	u8 drv_priv[0] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index f262950ee414..a2acda28d35f 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1430,6 +1430,15 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_free_core;
 	}
 
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "pci probe %04x:%04x %04x:%04x\n",
+		   pdev->vendor, pdev->device,
+		   pdev->subsystem_vendor, pdev->subsystem_device);
+
+	ab->id.vendor = pdev->vendor;
+	ab->id.device = pdev->device;
+	ab->id.subsystem_vendor = pdev->subsystem_vendor;
+	ab->id.subsystem_device = pdev->subsystem_device;
+
 	switch (pci_dev->device) {
 	case QCA6390_DEVICE_ID:
 		ath11k_pci_read_hw_version(ab, &soc_hw_version_major,
@@ -1452,6 +1461,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
 	case WCN6855_DEVICE_ID:
+		ab->id.bdf_search = ATH11K_BDF_SEARCH_BUS_AND_BOARD;
 		ath11k_pci_read_hw_version(ab, &soc_hw_version_major,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
