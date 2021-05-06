Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5858DC433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D33876103E
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D33876103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNfU2DmGQNJRYVcVfh1vSF8NDu/i/4fLnrV6gS8ULNM=; b=ogU0fFFjlX+MOK1VwI7cg9OMMv
	ZZ4ppkbAwtj7BVFgM8Ib+SCfVJJq0B5OQWMOjNcbduh0Y52ykVZNaYUpN2Mrqx/5lr8XZqUKpl9Rv
	ekF6VR0RfTcsHYJMNts/G++KuvHK2ujecT5pK3OCsUzcRWrRLMwBLjNo7Grp0ZFtCr5ZASbpdHNqT
	X2WftH9tcVtHvtk+RR1vvMIfu6HpzaYhV4+uihO6fblPgazIlFOi1sqJQ/21yaazBmUc82Yih6t5e
	2y5kRnQpE2W3WLVfmk4/KY/LcFC+JyKV4903I6wv+vb0e3MfAx00y9VItIHYjuB30S3EH7ds7rTFl
	Kzs8PwAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejka-005ADx-KN; Thu, 06 May 2021 19:33:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejkV-005ACd-89
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZHIqZvWXp53fObQCxuPUFJVKewAlJDrBY9iv+kFpWEE=; b=rF6tZh1+MD63eEs8xc1MyX4RwY
 FPS0KbdRKheAM6/IAb4OBmHOfNobG6mMGMHUqWtXZYblm20R5oCo/cWJbwU0g3hcuoV4HvgVu184g
 IB+HLGFoHFQFwqPM2tHVy9BjYY0aPbf4v218AcPbrU1tQNCxIh2dJvykQyvjdWA70+J/AeeAG3p7D
 ps6CDhQ34uu5xGgmPO8R4myH/ReGAZS710pfcPJb5LPjb2MAV3kof1fbkZJmCOXJvGBVd4TD7YOSB
 7csRgT43FlYZDP5iBHFaA8vwdR0XVGW+DOtjCiqg50L1u4cYaTa1/wa0Bzz0/UwwroK5Yud1Hh4gm
 Xk+Bi72A==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejkS-006LIE-Hm
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:33:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620329604; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZHIqZvWXp53fObQCxuPUFJVKewAlJDrBY9iv+kFpWEE=;
 b=Gg+XgHwx0Y6GWsyiAkrA5lsNpM6M0Fee6o5TkQe2oZ4kaqlHF4IjXAakk9rKGvyyhw36Yl87
 681OnNRuBU5laZDNxs3PO6NEc76jpxIsWmJ/LH0yIVDow3JMPrZX5iihnjFlw9ShkVFO4AlN
 30bg2znWDQepRTJMtC4anRjvfz8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60944483f34440a9d4275d80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:33:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1C845C75618; Thu,  6 May 2021 19:33:23 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 729C7C43152;
 Thu,  6 May 2021 19:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 729C7C43152
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
Subject: [PATCH v4 5/6] bus: mhi: pci_generic: Set register access length for
 MHI driver
Date: Thu,  6 May 2021 12:32:24 -0700
Message-Id: <1620329545-32328-6-git-send-email-bbhatt@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
References: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_123324_699697_D98A43E1 
X-CRM114-Status: GOOD (  12.24  )
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

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it from the PCI generic controller driver before registering
the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f0..fb7889f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -463,6 +463,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
+	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = pci_set_dma_mask(pdev, dma_mask);
 	if (err) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
