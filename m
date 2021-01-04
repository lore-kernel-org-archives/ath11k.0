Return-Path: <SRS0=Snh0=GH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE4DC433DB
	for <ath11k@archiver.kernel.org>; Mon,  4 Jan 2021 10:11:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F4F221F9
	for <ath11k@archiver.kernel.org>; Mon,  4 Jan 2021 10:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F4F221F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y2aaM9z3u3nGC8d4FYZYytjl7CujPDZCcP/DpiYMGUk=; b=PiunE2VbDgVyZRFhX2ZIg7wwTT
	omuaWHNjB0UGcNmDktCb4KB3VFjKtYHMkmviimLaxWXmaCLJKpfIK8MW6F84/654mp95DncAAysAr
	/72FIHhATDSUS89U3vlYBp96GICy1AzzfFZ251NLLs1FRpnaKEnfg7SnC052gBONvftl/lf58g8QW
	VVEysWF1jAVnbFcL456A24dwvPWR63KlP5BiFn5+U2UJxJMTI5a6DNvQHPNlekDegMGeLnXUEugSy
	rmxH54aclviQXZHyzCDU/o180lNxxLWDQ3TEo0cvlEUYpwsz/y/yGruH94cytK9vlWNDv1+TWeNAI
	AR+7VC6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwMq2-0008R1-Tz; Mon, 04 Jan 2021 10:11:46 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwMpz-0008Ps-Ml
 for ath11k@lists.infradead.org; Mon, 04 Jan 2021 10:11:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609755103; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=b1YdbSOxLE1TmKfcFnR94xmBHprCl+Qqt/okT9c2OCE=;
 b=m2y47OwacK9Y9bHodi+RzlD17CJtnF2Oc/6LavW52Xtyp5OR1Ao/LolMMArDJtPoSJl8KN1S
 AaelavmvYEVMeDV2pfWumIGBCaFip3rX8xZdcYab5QxOemG8bnDzgnoGmas35OW3OU4nRFzj
 7uNStPgrFdjn1qXeYz7gZaPknD8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff2e9d9584481b01b41349c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 10:11:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B68B8C433ED; Mon,  4 Jan 2021 10:11:36 +0000 (UTC)
Received: from cjhuang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 663C1C433CA;
 Mon,  4 Jan 2021 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 663C1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v3] mhi: use irq_flags if controller driver configures it
Date: Mon,  4 Jan 2021 18:11:28 +0800
Message-Id: <20210104101128.8217-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_051143_885121_4B8024A7 
X-CRM114-Status: GOOD (  18.96  )
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

If controller driver has specified the irq_flags, mhi uses this specified
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
v3:
- replace "client driver" with "controller driver"
- add Reviewed-by: Manivannan Sadhasivam 

v2:
- document irq_flags added to mhi_controller

 drivers/bus/mhi/core/init.c | 9 +++++++--
 include/linux/mhi.h         | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 381fdea..37903a8 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
+	/* if controller driver has set irq_flags, use it */
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
index cb7cd54..77f1e3f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -351,6 +351,7 @@ struct mhi_controller_config {
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
  * @wake_set: Device wakeup set flag
+ * @irq_flags: irq flags passed to request_irq (optional)
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -440,6 +441,7 @@ struct mhi_controller {
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
