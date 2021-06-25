Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4717BC2B9F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5BB6191A
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5BB6191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xsn/v+lfeslxDr/gGJByfVVtPqENQefFXce0l9FI3r4=; b=ueiCbaggERwuVu
	rAHs7gERFClv0ZwzZc2x50wvX4qP98f6yYF7KeAj5OGrW2Lh4Tt3v7mCIZy2q0ZuSYl5LME3+2u47
	h5CPxfI/lZD5YzNjZ+D2L2GVURBf3zYX2hVNxfeMOxCb+LbyPQQ/npl6s+Uw637Ib+gIOv9iGNnm3
	oyjxjHQRPdrldzhsq8NWLfZ95/q/gpyk/u01uRiBv6eZb8sG5EOO2oR8ILdqJZGD6bDQMzksdxtP8
	08JprHAszu9Z86jicJs+zCHylgtMeqZyZ8bzqNFfaVWs20NelvwXstqXCMnul8LdBaUIKirlY9Xru
	I8DIdqjVTT21czWaBhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl2f-001TCE-QH; Fri, 25 Jun 2021 12:34:41 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2M-001T3s-Qo
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:34:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id e20so7502889pgg.0
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZYNDb4xzGmZSM7Z9Ig9ZvRwbBZW3WBf8mohzvqiLTM=;
 b=QQoylyQ6iGE2SvHaMCWeJfomUftn2k0LasW46c6SKrq/J9S7wGJJlSB8rHITNMMEmF
 snljNt7VBX/5Il4gh2S5BAWvEs5U1LR+SLyGbVUjmAMQKuo9o5cPtjmOVdQKxfAD9xYf
 8oIOdHdMbc7tSsANE9eDoruleL+l17eRTuMnm0Vcgp2Msq6nZ52gpSE5Aqsd14sNnOcT
 wCbO8o/Q4Qlge7N0nmqpHXUB5pWLv4yXaGf7lL8jZRR8+yNFoS5+4t6aNzP46F+HZDso
 GAxl7L+fzMLJu3xhEtguQDB/jcwhDG5SuwfSV1s2T2tKo1USAnDThgGevKy/ljU6nhIC
 +Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZYNDb4xzGmZSM7Z9Ig9ZvRwbBZW3WBf8mohzvqiLTM=;
 b=h7kExMcfw8fQIpldaGRrxAaYbW28tI9qauUN4ftoLFK7GOaOojuoBs7YGGRj7P9rgt
 w27B81HEvlw0NG5i8dZqKpYxAwqOsg/pdp5E5d4SpEIzDXbUUre8UVCLF4d1d/FtOxgh
 MnRqRPm9qrm7L0+USugcfhxJKoyMxf0lyzBj76xh9J3KGjpsXLFkNUyv+LyXW/EC7LCU
 Dxky2ordB4dQMvbuX9djo4KHzJVj6ilBn3fKECnC4UcH04QVNA4fMgdDYIIqrFtaZ4v0
 c4M9v/k235Z1fl35k0vl4uwve3Efe9KZ4MSv+qF1GZZl7538UKaicF1StBBpU5B27WK2
 6axA==
X-Gm-Message-State: AOAM5314XiNteMoX//YkQ6ZKaYtXrP7oC89ij646Pj3uj4is1S8nxO6/
 GJlSoAxINHVdvyMES1AAIMjT
X-Google-Smtp-Source: ABdhPJwikdDmUjUTMGNdR7IoTEhspPdwbMZ81uSgM+SBleVnKdbOnrOrC6KQq+kD+x7PZfyLqcG8XQ==
X-Received: by 2002:a65:4ccb:: with SMTP id n11mr2064153pgt.231.1624624462039; 
 Fri, 25 Jun 2021 05:34:22 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/10] bus: mhi: pci_generic: Apply no-op for wake using
 sideband wake boolean
Date: Fri, 25 Jun 2021 18:03:47 +0530
Message-Id: <20210625123355.11578-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053422_930417_310FB98F 
X-CRM114-Status: GOOD (  13.79  )
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

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Devices such as SDX24 do not have the provision for inband wake
doorbell in the form of channel 127 and instead have a sideband
GPIO for it. Newer devices such as SDX55 or SDX65 support inband
wake method by default. Ensure the functionality is used based on
this such that device wake stays held when a client driver uses
mhi_device_get() API or the equivalent debugfs entry.

Cc: stable@vger.kernel.org
Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1624560809-30610-1-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index d84b74396c6a..eac4d10f99c9 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -32,6 +32,8 @@
  * @edl: emergency download mode firmware path (if any)
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
+ * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
+ *		   of inband wake support (such as sdx24)
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -40,6 +42,7 @@ struct mhi_pci_dev_info {
 	const char *edl;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
+	bool sideband_wake;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -242,7 +245,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
 	.edl = "qcom/sdx65m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
@@ -251,7 +255,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
@@ -259,7 +264,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
@@ -301,7 +307,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_quectel_em1xx_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
@@ -339,7 +346,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct pci_device_id mhi_pci_id_table[] = {
@@ -640,9 +648,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
-	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
-	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
-	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+
+	if (info->sideband_wake) {
+		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
+		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
+		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+	}
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
