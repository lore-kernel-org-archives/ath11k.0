Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DA2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:18:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1730E60EBD
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1730E60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y0V84CZsKubRWl1LcGaNlgMsZ+Y74dUjEoj0ARw1J0Q=; b=RQ5F4L18BHP14Q
	2BNNYJmWg20RMtsUcOesvBDzLCIEWMSRpBatCPX3NAu9TNHW6dmnzU2HjmjZswAvZ7kj/fRoAZeO7
	hmCKpJi7UGIjn/i4TD44c4b10s9S3uInd/BPtZ+ELgw3Zx7PDamQDe82YxVatzAqAiPx77GlnX07F
	VtvjkZSqn6rZeU5bwtq/O1ho0gdIi6XnuIdRR2vKfDHIKhIdibG+xT2nC6GmWirWRAX/YwtCiK4kj
	Z1tLwJE/wkfM8Tv5DpyI8cncG4z+MGUCE3rb5jMkNTvZ3Ng2HuB4CVQav6ZWEvshRwwk9fzS0U98t
	b//l+mzNDI5WtoLLt8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoe6-007v5V-3I; Mon, 11 Oct 2021 06:18:46 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoe1-007v4L-AJ
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 06:18:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633933123; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=EamqBaRBazvCb9XIvwzVIEFksV1A2LDT0Z8P1y+560w=;
 b=cNFU/ePBLHKP62t1HvuT5wRz7eBb+g2xPQog3MX2fTV6ynlTB4l5EqKSY4Cf9MmjVkcNk7Yy
 q3JCd8NAGHFgC5USKOQrLkaioBAcf6NmOZuXyxzFvyt/A6C1/oeitmXTb4WnyZlxfq+DuSoR
 ifAQ5o646BBy2IDsDktXJs35yNo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6163d733f3e5b80f1f0bb875 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 06:18:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DD559C43616; Mon, 11 Oct 2021 06:18:27 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A3DDC4360D;
 Mon, 11 Oct 2021 06:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1A3DDC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] ath11k: Advertise PLATFORM_CAP_PCIE_GLOBAL_RESET in qmi msg
Date: Mon, 11 Oct 2021 13:56:02 +0800
Message-Id: <20211011055602.77342-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_231843_547620_40974977 
X-CRM114-Status: GOOD (  12.43  )
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

Inform firmware that host is capable of triggering a global reset.
This is requested by firmware team.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 969bf1a590d9..5601f758a0a6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -71,6 +71,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.global_reset = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -112,6 +113,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.global_reset = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -152,6 +154,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.global_reset = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -190,6 +193,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.fix_l1ss = true,
+		.global_reset = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -230,6 +234,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
+		.global_reset = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 62f5978b3005..82952ef9abec 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -163,6 +163,7 @@ struct ath11k_hw_params {
 	bool supports_suspend;
 	u32 hal_desc_sz;
 	bool fix_l1ss;
+	bool global_reset;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b5e34d670715..16f2adb54d03 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -13,6 +13,7 @@
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
+#define PLATFORM_CAP_PCIE_GLOBAL_RESET	0x08
 
 bool ath11k_cold_boot_cal = 1;
 EXPORT_SYMBOL(ath11k_cold_boot_cal);
@@ -1556,6 +1557,9 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 		req.nm_modem |= SLEEP_CLOCK_SELECT_INTERNAL_BIT;
 	}
 
+	if (ab->hw_params.global_reset)
+		req.nm_modem |= PLATFORM_CAP_PCIE_GLOBAL_RESET;
+
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi host cap request\n");
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
