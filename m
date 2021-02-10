Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9DBC433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9578964E32
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9578964E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBklHviKu5e/eKrRgHrt5WXTgMlLSAXvWmCOT/TjmgQ=; b=ZSWIqH2QU3VdzeORKUtWQHK9rR
	EqH/WrVk+8Bs9WPxkM7j//xCcMBFFPpOTdqQ7XYdyl4QYinngM6B1kK/QFtaFb5TWXZUsYOFFV8f/
	cuyNERMnG50dGxJvqz1lDSZVGDkaSg3tfKCobQesRktaxuCv+CSSpgw00GXBBhqFn0uEU3cPYeINb
	KtFqnWYX9ZkezhOKuO3ccTZi1znSY7E4qGpKw6P++tlDWuzDMKs4SjAWAE6V2HR9XlSvBhd4fNNlH
	h7baegF60Kp47T1BfWX5O4a8HWD3tTgggJ8dmm4GZFh8O4ag2W96qbCQmld6xgh9WFfe8KXGPhTR8
	0CxzqBHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l51-0006mk-8V; Wed, 10 Feb 2021 08:42:35 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l4y-0006lH-0Z
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946552; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2TP8qvWrDlpsJ33CkHR3Ln6RM1J+7f5c7dJpOmArdiQ=;
 b=iXA7HB/I8cRB6WzlqbXKRrB731XNHyEfzAj9QbL6lr8PyWHHmFp4apu6o6S5YXV19DZpIaYh
 FMZGifO4aJRlx87hcrYuVMICkKeaP/8vy61Mgcw3hPjk+AWJPIAN3wBpLtnISC1opbxCPnsK
 62RkN/VeWk6jZGrxb1PVfqxihLw=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60239c77f112b7872c63f95c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A070C433ED; Wed, 10 Feb 2021 08:42:31 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 92FECC433CA;
 Wed, 10 Feb 2021 08:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92FECC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 04/11] ath11k: Update memory segment count for qcn9074
Date: Wed, 10 Feb 2021 14:12:03 +0530
Message-Id: <1612946530-28504-5-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034232_955365_A297ACB4 
X-CRM114-Status: GOOD (  15.31  )
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

QCN9074 FW requests three types memory segments during the boot,
	qmi mem seg type 1 of size 15728640
	qmi mem seg type 4 of size 3735552
	qmi mem seg type 3 of size 1048576
Segment type 3 is for M3 coredump memory.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 0db623ff4bb9..104eabd8df02 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1760,7 +1760,7 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 						  &chunk->paddr,
 						  GFP_KERNEL);
 		if (!chunk->vaddr) {
-			if (ab->qmi.mem_seg_count <= 2) {
+			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "qmi dma allocation failed (%d B type %u), will try later with small size\n",
 					    chunk->size,
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 1797c3b59f48..a7d01c295e77 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -26,6 +26,7 @@
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
 #define ATH11K_QMI_CALDB_SIZE			0x480000
 #define ATH11K_QMI_BDF_EXT_STR_LENGTH		0x20
+#define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	3
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
@@ -141,6 +142,7 @@ struct ath11k_qmi {
 #define QMI_IPQ8074_FW_MEM_MODE				0xFF
 #define HOST_DDR_REGION_TYPE				0x1
 #define BDF_MEM_REGION_TYPE				0x2
+#define M3_DUMP_REGION_TYPE				0x3
 #define CALDB_MEM_REGION_TYPE				0x4
 
 struct qmi_wlanfw_host_cap_req_msg_v01 {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
