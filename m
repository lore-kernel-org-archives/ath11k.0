Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3A1C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCE96124B
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCE96124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsdhWLGYSY7wpt5gJAsLrZDbFq/CUOcRxwW+Tv0utcg=; b=oDiUCYYEfZ/sgs
	wvIgLsOX6eXeSLeisIJmjNTlIacsye5pPz0svCPW0gJ+kj0AxuseLuiADMB9sr60r4Em47xoCQsFu
	stlsTfVHZB+oCJLpAvxgQ2qo2oIMF7tzhC9DC4MNuTjMcvq/MAtQpFHG6NQ2Ecz2YuROBv4X/iMy2
	Hg8qU8FVdcsvOVVdM271NqhBAp1BFemv+FWmrA06X8PucO6Q4QuUqrnCJma/shYVwtAZOcbDqLYBZ
	0nY0J+X4tCxEIFA5BnwLdWMlZVSZSW0IC9mJ9HaU8+cHGmDtDvTO3Rv7ap1LOr6EW7m9H4Brsc90c
	PtWXlcdphosDB0H3rJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6IhX-00H6PG-33; Wed, 21 Jul 2021 20:20:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6IhQ-00H6Fp-6M
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 20:20:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626898816; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zUf+qNoI5wXRIPUqFqapB0CxcB8l5/hPYDWvyfn9EB0=;
 b=jD2pfryMvAc6jJt4KlGL1tkRC2S4oSNS4EaqqS3PFk/8AlKgI5VPRI3pYXkvZvPJswWKHO1M
 FNQlxHr4i2BN9BYQSq/PGyCyV+sNhxxXByFOlz1PpQqaOUhd+VJk1XpW4VPbMIa1LVmQZG1t
 rWZqqE2oLDYpuCoivnuSy7X2Dpk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60f8817196a66e66b2976819 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 20:20:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 947D4C433F1; Wed, 21 Jul 2021 20:20:01 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9790C43217;
 Wed, 21 Jul 2021 20:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9790C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/4] ath11k: add caldata file for multiple radios
Date: Wed, 21 Jul 2021 23:19:26 +0300
Message-Id: <20210721201927.100369-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721201927.100369-1-jouni@codeaurora.org>
References: <20210721201927.100369-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_132016_980088_58681972 
X-CRM114-Status: GOOD (  15.49  )
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

If multiple PCI cards are attached, each needs its own caldata file.

Added new Caldata file name,
PCI Bus:
        cal-pci-0001:01:00.0.bin
        cal-pci-0000:01:00.0.bin
AHB Bus:
	cal-ahb-c000000.wifi1.bin

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index a24a6647ba52..381ae70e45ff 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2027,6 +2027,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 
 static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 {
+	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
 	const struct firmware *fw_entry;
 	struct ath11k_board_data bd;
@@ -2061,6 +2062,14 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		goto out;
 
 	file_type = ATH11K_QMI_FILE_TYPE_CALDATA;
+
+	/* cal-<bus>-<id>.bin */
+	snprintf(filename, sizeof(filename), "cal-%s-%s.bin",
+		 ath11k_bus_str(ab->hif.bus), dev_name(dev));
+	fw_entry = ath11k_core_firmware_request(ab, filename);
+	if (!IS_ERR(fw_entry))
+		goto success;
+
 	fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
 	if (IS_ERR(fw_entry)) {
 		ret = PTR_ERR(fw_entry);
@@ -2070,6 +2079,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		goto out;
 	}
 
+success:
 	fw_size = min_t(u32, ab->hw_params.fw.board_size, fw_entry->size);
 	ret = ath11k_qmi_load_file_target_mem(ab, fw_entry->data, fw_size, file_type);
 	if (ret < 0) {
@@ -2077,8 +2087,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		goto out_qmi_cal;
 	}
 
-	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi caldata downloaded: type: %u\n",
-		   file_type);
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi caldata type: %u\n", file_type);
 
 out_qmi_cal:
 	release_firmware(fw_entry);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
