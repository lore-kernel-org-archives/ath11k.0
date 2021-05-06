Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12F8C43462
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD566103E
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD566103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdXicmH7tfapwLIq973R613146y/dUJ47X9Nlj+vf+g=; b=R5KdQjupp01mo4dk3JQfUFXxMB
	MC43aLeu+bxo6cZpX6W65KeD12R0u1ri6y3UgP9FSSVCnbOC5E1vGKhclwsvbbB9yFr5RsHpGwuhd
	doSzaJFzyGmoDUJO95JF3CA+og/3CqRFjV79Hc17BOF+RL99VMmrlWTm8A/8crY6maqc4M4K5ce/d
	WX0ogBcoJH1EL08vJg4DK/0ZejeXmyAJy8v21BJW8drq8CM2OfBt6HsUGAv0gXjkf7uoAi7DiTR3n
	hJZU6pQlXY89vWgDt74ID3TWVkP4y+eeS8UtErHGGkRjaVbkMmHL4oc7K0PAkLKMhCxN86qm+aHTZ
	QBxc1hfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejkC-005A9T-PT; Thu, 06 May 2021 19:33:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejk4-005A8D-Uj
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xTj3YRV2qW4D/g5xhqCa4nq8hzFRUSpBjkhBTujrJ+A=; b=N4aIGGPQXXq0GKN7p6vfgdE6Hl
 I710C5Xv/2Ct4qN1pxup/dBAtI4vGAXMtxLFzoLuCv/C7xaeN162p/E3jB0NLKW2UqZefrvoTUoGG
 /E4xbBvNdzSXqDej+atkUFwwEOPGt/gtmGxg3w8H1eu646egOVj2Rm7rVkVmLCRogGxda+UrFl7nW
 kdAxob8JtBRMVrbj/1UDVs9UmDkZlf8lHlgfubSMMQHWR8oLsV5rInHZ4+vqxBGESsDAlc0SyGJA9
 mnibNnUXIHnplce4gcwUiZNY62UHXEAflje0AaRfyTFCOyVXzJ1eGIBe5+aBQwS4+eEw7QnW9EJzy
 rotA9cgg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejjy-006LFt-Km
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:32:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620329575; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xTj3YRV2qW4D/g5xhqCa4nq8hzFRUSpBjkhBTujrJ+A=;
 b=IqPtcjM+tpdHbmvsLvct2+lB0Qrz4bm81lnZnv7RqfR0XFnyK4RxJ20/mEH4zz8MDhFsfjml
 y5p1uNcXgr6cqG8l50xTvfTFMQMRK8GtduwxDb1gTjdP7dqReYzKxWIaHNpj0xyruSsy1nu2
 eabq7Q3DwJ5qaSZ3vTgBan/v91o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60944464853c0a2c461cd2d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:32:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64E44C4338A; Thu,  6 May 2021 19:32:51 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F032C4338A;
 Thu,  6 May 2021 19:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F032C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=pass (p=none dis=none)
 header.from=qti.qualcomm.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=pass smtp.mailfrom=bbhatt@qti.qualcomm.com
From: Bhaumik Bhatt <bbhatt@qti.qualcomm.com>
To: manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 1/6] bus: mhi: core: Set BHI/BHIe offsets on power up
 preparation
Date: Thu,  6 May 2021 12:32:20 -0700
Message-Id: <1620329545-32328-2-git-send-email-bbhatt@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
References: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_123255_217796_9A9BFEFA 
X-CRM114-Status: GOOD (  18.69  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
rearrange the function, and remove the equivalent from
mhi_async_power_up(). This helps consolidate multiple checks
in different parts of the driver and can help MHI fail early on
before power up begins if the offsets are not read correctly.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 42 +++++++++++++++++++++++-------------------
 drivers/bus/mhi/core/pm.c   | 28 ++++------------------------
 2 files changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377..11c7a3d 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1063,7 +1063,7 @@ EXPORT_SYMBOL_GPL(mhi_free_controller);
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 bhie_off;
+	u32 bhi_off, bhie_off;
 	int ret;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
@@ -1072,29 +1072,36 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		goto error_dev_ctxt;
 
-	/*
-	 * Allocate RDDM table if specified, this table is for debugging purpose
-	 */
-	if (mhi_cntrl->rddm_size) {
-		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
-				     mhi_cntrl->rddm_size);
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
+	if (ret) {
+		dev_err(dev, "Error getting BHI offset\n");
+		goto error_reg_offset;
+	}
+	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
-		/*
-		 * This controller supports RDDM, so we need to manually clear
-		 * BHIE RX registers since POR values are undefined.
-		 */
+	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
 		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
 				   &bhie_off);
 		if (ret) {
 			dev_err(dev, "Error getting BHIE offset\n");
-			goto bhie_error;
+			goto error_reg_offset;
 		}
-
 		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
+	}
+
+	if (mhi_cntrl->rddm_size) {
+		/*
+		 * This controller supports RDDM, so we need to manually clear
+		 * BHIE RX registers since POR values are undefined.
+		 */
 		memset_io(mhi_cntrl->bhie + BHIE_RXVECADDR_LOW_OFFS,
 			  0, BHIE_RXVECSTATUS_OFFS - BHIE_RXVECADDR_LOW_OFFS +
 			  4);
-
+		/*
+		 * Allocate RDDM table for debugging purpose if specified
+		 */
+		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
+				     mhi_cntrl->rddm_size);
 		if (mhi_cntrl->rddm_image)
 			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
 	}
@@ -1103,11 +1110,8 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-bhie_error:
-	if (mhi_cntrl->rddm_image) {
-		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
-		mhi_cntrl->rddm_image = NULL;
-	}
+error_reg_offset:
+	mhi_deinit_dev_ctxt(mhi_cntrl);
 
 error_dev_ctxt:
 	mutex_unlock(&mhi_cntrl->pm_mutex);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e2e59a3..adf426c 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1066,28 +1066,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		goto error_setup_irq;
 
-	/* Setup BHI offset & INTVEC */
+	/* Setup BHI INTVEC */
 	write_lock_irq(&mhi_cntrl->pm_lock);
-	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &val);
-	if (ret) {
-		write_unlock_irq(&mhi_cntrl->pm_lock);
-		goto error_bhi_offset;
-	}
-
-	mhi_cntrl->bhi = mhi_cntrl->regs + val;
-
-	/* Setup BHIE offset */
-	if (mhi_cntrl->fbc_download) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF, &val);
-		if (ret) {
-			write_unlock_irq(&mhi_cntrl->pm_lock);
-			dev_err(dev, "Error reading BHIE offset\n");
-			goto error_bhi_offset;
-		}
-
-		mhi_cntrl->bhie = mhi_cntrl->regs + val;
-	}
-
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	mhi_cntrl->pm_state = MHI_PM_POR;
 	mhi_cntrl->ee = MHI_EE_MAX;
@@ -1098,7 +1078,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
 		dev_err(dev, "Not a valid EE for power on\n");
 		ret = -EIO;
-		goto error_bhi_offset;
+		goto error_async_power_up;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1117,7 +1097,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		if (!ret) {
 			ret = -EIO;
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_bhi_offset;
+			goto error_async_power_up;
 		}
 
 		/*
@@ -1139,7 +1119,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_bhi_offset:
+error_async_power_up:
 	mhi_deinit_free_irq(mhi_cntrl);
 
 error_setup_irq:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
