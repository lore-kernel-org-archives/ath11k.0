Return-Path: <SRS0=2R2I=GB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D19C433DB
	for <ath11k@archiver.kernel.org>; Tue, 29 Dec 2020 07:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F000E208BA
	for <ath11k@archiver.kernel.org>; Tue, 29 Dec 2020 07:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F000E208BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkCVWHdo6au3DZ94KF37x4wPe5q3aUpz4gC128n/K9A=; b=VdhzKbYoyuq45N9q00VXCCKHwT
	nYxMyclIuSF6ZchgtlsgsZR8LYPwZA3RyOKfWKC2trKXRdQrlxtbjW3gMrsjypXOEFUaSh9dhsPyb
	CHFOmg9OzG9RZnTg4fzuBt7jt6NTzF48hBdDlro46DHhQPjDfw4BCutfEfWi7xbyovNGWzBYys+HT
	j30WFXmOkCy4hH7ThAxo+oaumjP094dCL2vLEYNF80ZtoVa525AsOxTpMYclCK0Wexzq6BxH2fkwS
	Z58BUHI0cem8vH0VPP9Azb3+a8n7EAiUO2i0z63vaSdxjKYzwAWDCcuAQJ7zrE/sCPEg4D4eC2Qqm
	MegR5l4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku95A-0004mn-GI; Tue, 29 Dec 2020 07:06:12 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku957-0004mO-BM
 for ath11k@lists.infradead.org; Tue, 29 Dec 2020 07:06:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609225568; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7zGtIOyD/hhxxV+ykkqwv0Q59u5xzFt43Oi7tidUFG4=;
 b=r14tkQePDNoeZr/D2hsiv9RLjaMqsUCODs5hZVYXoC1B1TN7gOwYzTxXvmHwQfWsiK2+HENz
 ULxjLuD+2vgzH43PxsLd7oWAjltjGFFjwg+/5LahB74CakQZPzMI18XtGkcBFUq+s503BPq+
 x0UjzR//681DAYRXbwSoxTw6XFs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fead55e3ac69bd6b891545f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 07:06:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D661CC433CA; Tue, 29 Dec 2020 07:06:05 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A87E2C433C6;
 Tue, 29 Dec 2020 07:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A87E2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v2] mhi: use irq_flags if client driver configures it
Date: Tue, 29 Dec 2020 02:05:51 -0500
Message-Id: <20201229070551.3129-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_020609_513947_732FAFAE 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: hemantk@codeaurora.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

If client driver has specified the irq_flags, mhi uses this specified
irq_flags. Otherwise, mhi uses default irq_flags.

The purpose of this change is to support one MSI vector for QCA6390.
MHI will use one same MSI vector too in this scenario.

In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
is requested. The reason is if irq migration happens, the msi_data may
change too. However, the msi_data is already programmed to QCA6390
hardware during initialization phase. This msi_data inconsistence will
result in crash in kernel.

Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
WARNINGS because QCA6390 wants to disable the IRQ during the suspend.

To avoid above two issues, QCA6390 driver specifies the irq_flags in case
of one MSI vector when mhi_register_controller is called.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
v2:
- document irq_flags added to mhi_controller

 drivers/bus/mhi/core/init.c | 9 +++++++--
 include/linux/mhi.h         | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0ffdebd..5f74e1e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
+	/* if client driver has set irq_flags, use it */
+	if (mhi_cntrl->irq_flags)
+		irq_flags = mhi_cntrl->irq_flags;
+
 	/* Setup BHI_INTVEC IRQ */
 	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
 				   mhi_intvec_threaded_handler,
-				   IRQF_SHARED | IRQF_NO_SUSPEND,
+				   irq_flags,
 				   "bhi", mhi_cntrl);
 	if (ret)
 		return ret;
@@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 
 		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
 				  mhi_irq_handler,
-				  IRQF_SHARED | IRQF_NO_SUSPEND,
+				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
 			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d4841e5..918cf6a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -353,6 +353,7 @@ struct mhi_controller_config {
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
  * @wake_set: Device wakeup set flag
+ * @irq_flags: irq flags passed to request_irq (optional)
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -442,6 +443,7 @@ struct mhi_controller {
 	bool fbc_download;
 	bool pre_init;
 	bool wake_set;
+	unsigned long irq_flags;
 };
 
 /**
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
