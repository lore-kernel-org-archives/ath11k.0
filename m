Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725CEC6377D
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B64B60FF4
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B64B60FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91aU2f9Z1Bf1YoU5UXWiReuf4RVCgVQ6rhjorOYfJrM=; b=cY+r/10iaBH7xL
	L6ichGkxIgXqZPIZT7ekvPvVZ8SEGxxcD6EB+Wq0HWRpGr/B0oQ+r6nKnf2XPCNrE2jue9ekW1gYS
	QZWxF2TVbkl5jP3Wroubhwa5YA6pHjg7fgIlv0fc1CCF6LEIRF94PqS5dMhUG57jlOU7mWoqc/kaO
	QSNBbRzsViUgHODPm/oDsX4ZcEDpfsfWJnONSpSPanGjylWLO/Op8xv9/w1LAyOal4/gP27hUW/TP
	Sf1rvuBX70j2YNtZDB7VzRn9m34iAWd5oRf95KtXxYRZ7m3xD/wgnTHc2sxmjE/6yaBwERDLIQV+u
	zEjC05wds8cmSe0W2Xsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6IhF-00H6H9-Q8; Wed, 21 Jul 2021 20:20:01 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6IhD-00H6GD-5v
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 20:20:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626898799; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=z1cKAcuGSEBfR+RRQR5r0dH+bgdbU8sWlArrO4IXNuk=;
 b=bP/K1zrxjuBsjE4ww5jQpGtfUJAPS7vtqWCZ/Zm8UCpcOilugB9gfhdcd1r31D7mGFSa0Jyk
 Bab9+vx+WLaD3542wLTigHDqcyBhLiQdiZOdvNn+slz43BGm3aO1jLILKUwneJZ9nGULzo6P
 iD4+UsEV2moE+AuLK9J+E9FwHwc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60f8816d38fa9bfe9c0576a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 20:19:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B1715C4338A; Wed, 21 Jul 2021 20:19:56 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D522AC433D3;
 Wed, 21 Jul 2021 20:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D522AC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/4] ath11k: use hw_params to access board_size and cal_offset
Date: Wed, 21 Jul 2021 23:19:24 +0300
Message-Id: <20210721201927.100369-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721201927.100369-1-jouni@codeaurora.org>
References: <20210721201927.100369-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_131959_329317_23A7BC67 
X-CRM114-Status: GOOD (  16.20  )
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

From: Anilkumar Kolli <akolli@codeaurora.org>

Reuse board_size from hw_params, add cal_offset to hw params.
This patch is clean up only, there is no change in functionality.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
 drivers/net/wireless/ath/ath11k/hw.h   |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++--
 drivers/net/wireless/ath/ath11k/qmi.h  |  2 --
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c97830633f1f..d2ab3b134632 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -37,7 +37,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw = {
 			.dir = "IPQ8074/hw2.0",
 			.board_size = 256 * 1024,
-			.cal_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
 		},
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
@@ -87,7 +87,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw = {
 			.dir = "IPQ6018/hw1.0",
 			.board_size = 256 * 1024,
-			.cal_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
 		},
 		.max_radios = 2,
 		.bdf_addr = 0x4ABC0000,
@@ -134,7 +134,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw = {
 			.dir = "QCA6390/hw2.0",
 			.board_size = 256 * 1024,
-			.cal_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
 		},
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
@@ -180,7 +180,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw = {
 			.dir = "QCN9074/hw1.0",
 			.board_size = 256 * 1024,
-			.cal_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -226,7 +226,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fw = {
 			.dir = "WCN6855/hw2.0",
 			.board_size = 256 * 1024,
-			.cal_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
 		},
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 5d150cd793b2..3a03e09563e7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -128,7 +128,7 @@ struct ath11k_hw_params {
 	struct {
 		const char *dir;
 		size_t board_size;
-		size_t cal_size;
+		size_t cal_offset;
 	} fw;
 
 	const struct ath11k_hw_ops *hw_ops;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b5e34d670715..cc82a431c8b7 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1953,7 +1953,7 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		fw_size = min_t(u32, ab->hw_params.fw.board_size,
 				fw_entry->size);
 
-		memcpy_toio(bdf_addr + ATH11K_QMI_CALDATA_OFFSET,
+		memcpy_toio(bdf_addr + ab->hw_params.fw.cal_offset,
 			    fw_entry->data, fw_size);
 
 		release_firmware(fw_entry);
@@ -1979,7 +1979,7 @@ static int ath11k_qmi_load_bdf_fixed_addr(struct ath11k_base *ab)
 		return -ENOMEM;
 	memset(&resp, 0, sizeof(resp));
 
-	bdf_addr = ioremap(ab->hw_params.bdf_addr, ATH11K_QMI_BDF_MAX_SIZE);
+	bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
 	if (!bdf_addr) {
 		ath11k_warn(ab, "failed ioremap for board file\n");
 		ret = -EIO;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3d5930330703..30236c5d26e2 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -13,8 +13,6 @@
 #define ATH11K_QMI_WLANFW_TIMEOUT_MS		5000
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_CALDB_ADDRESS		0x4BA00000
-#define ATH11K_QMI_BDF_MAX_SIZE			(256 * 1024)
-#define ATH11K_QMI_CALDATA_OFFSET		(128 * 1024)
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
 #define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
