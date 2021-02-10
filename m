Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84EFC433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849BF64E2A
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849BF64E2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHi7Pgo9KLnDeS7uNr+cev7Vy90s+jFcbXkIryp2i6A=; b=YGvHdekUBlsXMZs48AqHwplJ6y
	c+bM1hYsfPPjrLB++0ZXHLpta9wL+LHGOpn+O3YDl4gb3b6cnJtk033VKnI8X0yinsTQRv91yRlwn
	22Clw2sktCk+2ty3ExEdSTv7yRxyo+Pft08nDqa6KXuLBmg/5O42998VeCL6E3mgU/A5hLIO3mxUe
	ezOFRb93OntX4BWjf8jFNe4OIZVDydQcqLVq+EyYuGt1bqU3HOF8LFZGyLqLzme91s+FDcSDhFImm
	S2tRwRXx7GGshSToSmxyVM1lGE4HiueFgPyH594ssrOO6wNYinxjWcNK419S5ZFYaEwIY5Xx9VBY+
	vO1WSwKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l54-0006oB-OB; Wed, 10 Feb 2021 08:42:38 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l50-0006m8-2C
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946554; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+RD+gABO8boETdOgGmC4BfysfBIgpogreoFPG8mXf4M=;
 b=jrhgJG2v0K7yyJWYBSmsj7D+h2Ui2opE/X7OpNHK0kmkrKCTvQ7tljXvHvKBxLtHLzrwC09g
 ttTrAUzZV0RLjucqX9ZBHiLsNdVN3cNCtWWrA+RJTm0wYW/B6ur1aAmI54EQG6tpZ/dIxlxJ
 tbR+jEPRTp7rN0sJoveXj29CV7A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60239c79f112b7872c63fe08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E147C433ED; Wed, 10 Feb 2021 08:42:33 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9790FC433C6;
 Wed, 10 Feb 2021 08:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9790FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 05/11] ath11k: Add qcn9074 mhi controller config
Date: Wed, 10 Feb 2021 14:12:04 +0530
Message-Id: <1612946530-28504-6-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034235_014313_40F92432 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add MHI config for QCN9074 also populate ath11k_hw_params for QCN9074.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  12 ++++
 drivers/net/wireless/ath/ath11k/core.h |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c  | 116 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/qmi.h  |   1 +
 4 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 9ccc7231afa0..fa452de49457 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -147,6 +147,18 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = false,
 		.supports_suspend = true,
 	},
+	{
+		.name = "qcn9074 hw1.0",
+		.hw_rev = ATH11K_HW_QCN9074_HW10,
+		.fw = {
+			.dir = "QCN9074/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_size = 256 * 1024,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9074,
+	},
 };
 
 int ath11k_core_suspend(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 8d29845774df..9a8fb23577b0 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -105,6 +105,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_IPQ8074,
 	ATH11K_HW_QCA6390_HW20,
 	ATH11K_HW_IPQ6018_HW10,
+	ATH11K_HW_QCN9074_HW10,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 09858e516903..626764da4d6f 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -7,10 +7,11 @@
 #include "core.h"
 #include "debug.h"
 #include "mhi.h"
+#include "pci.h"
 
 #define MHI_TIMEOUT_DEFAULT_MS	90000
 
-static struct mhi_channel_config ath11k_mhi_channels[] = {
+static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
 		.num = 0,
 		.name = "LOOPBACK",
@@ -69,7 +70,7 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
 	},
 };
 
-static struct mhi_event_config ath11k_mhi_events[] = {
+static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
 	{
 		.num_elements = 32,
 		.irq_moderation_ms = 0,
@@ -92,15 +93,108 @@ static struct mhi_event_config ath11k_mhi_events[] = {
 	},
 };
 
-static struct mhi_controller_config ath11k_mhi_config = {
+static struct mhi_controller_config ath11k_mhi_config_qca6390 = {
 	.max_channels = 128,
 	.timeout_ms = 2000,
 	.use_bounce_buf = false,
 	.buf_len = 0,
-	.num_channels = ARRAY_SIZE(ath11k_mhi_channels),
-	.ch_cfg = ath11k_mhi_channels,
-	.num_events = ARRAY_SIZE(ath11k_mhi_events),
-	.event_cfg = ath11k_mhi_events,
+	.num_channels = ARRAY_SIZE(ath11k_mhi_channels_qca6390),
+	.ch_cfg = ath11k_mhi_channels_qca6390,
+	.num_events = ARRAY_SIZE(ath11k_mhi_events_qca6390),
+	.event_cfg = ath11k_mhi_events_qca6390,
+};
+
+static struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
+	{
+		.num = 0,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x14,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 1,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x14,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x14,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x14,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+	},
+};
+
+static struct mhi_event_config ath11k_mhi_events_qcn9074[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+static struct mhi_controller_config ath11k_mhi_config_qcn9074 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath11k_mhi_channels_qcn9074),
+	.ch_cfg = ath11k_mhi_channels_qcn9074,
+	.num_events = ARRAY_SIZE(ath11k_mhi_events_qcn9074),
+	.event_cfg = ath11k_mhi_events_qcn9074,
 };
 
 void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
@@ -221,6 +315,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
 	struct mhi_controller *mhi_ctrl;
+	struct mhi_controller_config *ath11k_mhi_config;
 	int ret;
 
 	mhi_ctrl = mhi_alloc_controller();
@@ -254,7 +349,12 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
 
-	ret = mhi_register_controller(mhi_ctrl, &ath11k_mhi_config);
+	if (ab->hw_rev == ATH11K_HW_QCA6390_HW20)
+		ath11k_mhi_config = &ath11k_mhi_config_qca6390;
+	else if (ab->hw_rev == ATH11K_HW_QCN9074_HW10)
+		ath11k_mhi_config = &ath11k_mhi_config_qcn9074;
+
+	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
 	if (ret) {
 		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
 		mhi_free_controller(mhi_ctrl);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index a7d01c295e77..3d5930330703 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -21,6 +21,7 @@
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074	0x02
+#define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9074	0x07
 #define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
