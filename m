Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E0AC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ezccPC+lMzQvWpG8cxptlBr7G+o2C53B2QI+gZ/x7k=; b=sp+6Za4oByRw4A
	ieYNlnHTgGmCGqjNVmniDy9zAAJSacKWSiptEF9AcWKiMv1m8+3JE2c5OKLqGTU1iE+fPpaQwZfTK
	88IaUNw2ZfnM9c/WbBx+iBuFcDqUVJsASQKGaoZ/6RqL6ULHEvsv93zzpjnG4NZqFYZfS9ie1kKwh
	KFeSgiVVC5RdZYAQ7wdzGIqgLM+0EnLS1n2enHPGha5qPEESyPAWGC+cKcHD3lvFNyyuF875hk2th
	0NsBDUdpDQ7UgiyClYLjNstUrmAmC3jN+yn/Q49sYW28DAXQHxUhneMl6s7t0c6OzIQOBX61ZHhyX
	ttfVxtCyZzFy6jAR6wDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGuC-00FeY0-D4; Thu, 09 Dec 2021 10:44:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGu9-00FeWF-Jt
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 10:44:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E2287CE257C
 for <ath11k@lists.infradead.org>; Thu,  9 Dec 2021 10:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87029C004DD;
 Thu,  9 Dec 2021 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639046638;
 bh=woAc6P4VY/JRgzqWvIZemMYtIRL+7SDgoJJzGeDtVtE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EludV9otIzWAaxAvAMNiKnoUG7f0BmLtIlQDNdSXFN5x+NgL9NQ6hXSg7k9WMhB1x
 eBW+b9reNUMfovS5rRd386BZb7GcGvcEqkpEU2sXxBN7nDqLfeVGiN8GldM/p+7Kul
 XNI/f40sLacX8YJgjQdKYSBRD0uS/uG3mUQ2u5F9sTIWBO79HkxiOe9fFoo8MEIvQj
 ejvvaxuYnK2NpoyGRXttpt6BAycDT70Y+JTt1WQaa+aHBm+ZnZh01UBrE1ljys6r9q
 fueqfjG0cbjTotfUeWsrO7Ny8Gaq2tkI7vGe4t9tBX2Ajc8ANjzkrfsJiB3YYPCEPf
 x4oowdzrUPh/A==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3 2/2] ath11k: Change qcn9074 fw to operate in mode-2
Date: Thu,  9 Dec 2021 12:43:51 +0200
Message-Id: <20211209104351.9811-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209104351.9811-1-kvalo@kernel.org>
References: <20211209104351.9811-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_024402_080619_6B7035A8 
X-CRM114-Status: GOOD (  14.94  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

In mode-2 QCN9074 firmware uses 15MB of host memory and firmware
request 1MB size segements in QMI, whereas in mode-0 firmware
uses 45MB of host memory and each segment is of 2MB size.
In mode-2 firmware operates with reduced number of vdevs and peers.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Patchwork-Id: 12664445
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  9 ++++++---
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h  |  1 -
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c08e96522332..606e867c36ec 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -79,6 +79,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
@@ -134,6 +137,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
@@ -188,6 +194,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
@@ -242,6 +251,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = false,
+		.fw_mem_mode = 2,
+		.num_vdevs = 8,
+		.num_peers = 128,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.fix_l1ss = true,
@@ -296,6 +308,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
@@ -349,6 +364,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 7ea3207692dc..23f3ce741636 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -12,9 +12,9 @@
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
-#define TARGET_NUM_VDEVS(ab)	(16 + 1)
+#define TARGET_NUM_VDEVS(ab)	(ab->hw_params.num_vdevs)
 
-#define TARGET_NUM_PEERS_PDEV(ab) (512 + TARGET_NUM_VDEVS(ab))
+#define TARGET_NUM_PEERS_PDEV(ab) (ab->hw_params.num_peers + TARGET_NUM_VDEVS(ab))
 
 /* Num of peers for Single Radio mode */
 #define TARGET_NUM_PEERS_SINGLE(ab) (TARGET_NUM_PEERS_PDEV(ab))
@@ -26,7 +26,7 @@
 #define TARGET_NUM_PEERS_DBS_SBS(ab)	(3 * TARGET_NUM_PEERS_PDEV(ab))
 
 /* Max num of stations (per radio) */
-#define TARGET_NUM_STATIONS(ab)	512
+#define TARGET_NUM_STATIONS(ab)	(ab->hw_params.num_peers)
 
 #define TARGET_NUM_PEERS(ab, x)	TARGET_NUM_PEERS_##x(ab)
 #define TARGET_NUM_PEER_KEYS	2
@@ -173,6 +173,9 @@ struct ath11k_hw_params {
 	bool idle_ps;
 	bool supports_sta_ps;
 	bool cold_boot_calib;
+	int fw_mem_mode;
+	u32 num_vdevs;
+	u32 num_peers;
 	bool supports_suspend;
 	u32 hal_desc_sz;
 	bool fix_l1ss;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 25eb22cbeaeb..b71781398fc4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2830,7 +2830,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
 	ab->qmi.ab = ab;
 
-	ab->qmi.target_mem_mode = ATH11K_QMI_TARGET_MEM_MODE_DEFAULT;
+	ab->qmi.target_mem_mode = ab->hw_params.fw_mem_mode;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
 			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index d9e95b700765..49db39bf638c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -34,7 +34,6 @@
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
 #define ATH11K_FIRMWARE_MODE_OFF		4
-#define ATH11K_QMI_TARGET_MEM_MODE_DEFAULT	0
 #define ATH11K_COLD_BOOT_FW_RESET_DELAY		(40 * HZ)
 
 struct ath11k_base;
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
