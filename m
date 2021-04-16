Return-Path: <SRS0=YaQx=JN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB66C43461
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFCC7613D9
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFCC7613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2e2XBhKBAmonFI9LJ7m71H7wk8RAOXKW4i//asMp/M=; b=ieLyyGKUe1mPJc4cTlWr0iVNbG
	QC8WkC1/92q7qomv3dZ1LodqvjZtcPDeUeI3f13L2cfoXii0PCXFi3/PeuiEYTBcbp8gka8uiN1FF
	vU+z86CTqzre+1KccT2uI8KoNXCEPUz3l0M17BORiBhuxbusH51EqVFVcfUpolZqVBdZvUMEA+AdC
	w46y3oeTHQGvb3+NM4hAMYtCrANn2H2sHYMTsif/RKxXWRiiAkv/yCfbZRFclyOKyCrYJHbEUf4zF
	XaDM8Ya/h8sEhCX5b2NOmcip0MGZ40R3XgurWGV/GAjyIMmDi76Kg2MFzVdSoDxOqO6OVIXLiKxPg
	34zSSsqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTV9-00381h-Rq; Fri, 16 Apr 2021 18:47:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTV6-0037zi-57
 for ath11k@desiato.infradead.org; Fri, 16 Apr 2021 18:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tnS0tbzynertHhT6L+tHzRoeMC4W+zpjr81Jq14lIA4=; b=j+Jg3KmpI7yvdkKtnh2zNRm5cc
 PVaOk5OsppKSaHhaWEYLPh/KQ/DQSdlUm8PjFaaeHshDNXdwA6LNYYt6csirex1h3f8V6rMGFWtnq
 KAWBTYp8HFknw23W8LxxcO0wZCu0cH4fb3iEp46Sye+Hs8wvHDjfF+AdbrM4cH5FPtJvDunlZsYP7
 YWK9f8iQKiY8TLVhFg52T+DVBFmNoU5p6vYqq80+mcpVPRir6Qh70UjS6dB4ewDLLg9zEWM1p8Tf5
 3vQOfs/YWyqWsHbTpKehdoVaDwOa4uzc4dzLZr9apwm7dQsnOPbRmibcAi4flKdEtqz+SpIKE94ws
 fWPvpt9w==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTV0-009dTx-Jh
 for ath11k@lists.infradead.org; Fri, 16 Apr 2021 18:47:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618598847; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tnS0tbzynertHhT6L+tHzRoeMC4W+zpjr81Jq14lIA4=;
 b=WUbpmJYQYvO2iqpxcmIqdKrm+6PD3sj/1WzfYENmhvEezTNM/s7Y4ZrkQ8vkCG19OK/2IJlb
 EL8PJHH0IHA5/pXjLAQjWxwTFfoDo9KNl3YIcWVOFz3QeN4CE9wZyR/kAo/JEeXHgVFQIOXh
 INJMn7ASPsBtsWhrWqdA8pkRhck=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6079dbb9a817abd39a24de10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:47:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4B662C433C6; Fri, 16 Apr 2021 18:47:20 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34F73C43462;
 Fri, 16 Apr 2021 18:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34F73C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 5/6] bus: mhi: pci_generic: Set register access length for
 MHI driver
Date: Fri, 16 Apr 2021 11:47:04 -0700
Message-Id: <1618598825-18629-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114727_250209_86359D6C 
X-CRM114-Status: GOOD (  11.81  )
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

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it from the PCI generic controller driver before registering
the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
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
