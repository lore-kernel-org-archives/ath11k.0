Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340DBC48BC2
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0283C61922
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0283C61922
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KL9nR0+1JT54EN8u8N3erPiCMfuGC17wfRR7ez1EZLg=; b=nCHL8ORk/FBtlb
	uvBF6T9K7GmPUM0RhdTc7CVOzPDa+N8syFcfa/bjoFknl7gkUlF8X7jy1n2grxBgS/4HZzvBrR+zR
	+Uko2nPdXnO63gGYC51fVq+ryBUDgnj68wj7S7cyOJKVllSwD5seLbUHVr8pss4BycU/mokFpqfeQ
	vQBviNH6/cKp9aE83mQ9bdhST2vUJ8OEjfVTrz8S717i27AjiIEo/b86KnbFCzITEV5sa1PqTF7Qp
	T8b00c4k8jgjblF9YfLsH/V5MKWXoDyDOPO84jPU35dwr/TdAd/v7SJPKaGCAspSjRAQV3qpLMtLR
	xeYigJh3Z8SW1RdZ+jqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl30-001TSY-Kh; Fri, 25 Jun 2021 12:35:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2v-001TOj-Kn
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:35:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id b3so4657097plg.2
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0yKlt0Q933fIPy75KLLXBy+WqH1A4lfhq0nnaDRBRU=;
 b=KQDZCGGrHOpBRTIYyrFjiZEwN6JsbSca425T2JQftRpS8XvxZQRM/pIRawG6i9Kbnv
 /hVmNOTe9nQ2Dyr86ikFax0IHHMTFCFoajwDaMlWNgonsj+FnOujuBLQeLmj6m06BSYF
 o5t5On6kSxv50RAMmvSsfU9/RDC/MnkBESVmgvTvwCaQ66QTcsk8yvQi0kLBp0gsq3G2
 yxmGmjhjRl74s/1OeiIrdA+LhVgClHUk9qgbMzkTj3aPB3UsPo7ZHw/usmQmZKP1747w
 IS4wyWv+GxT/j278wdUo45tR61PYIdRrglNAcTbCrWMQuaJ2NczAE/iwygGu/qLKMCsi
 jERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0yKlt0Q933fIPy75KLLXBy+WqH1A4lfhq0nnaDRBRU=;
 b=tQjJ2Tmg4TA+ZgjX4gvMFJDdKRO/+GbevmaBxrTc39khnnETz0yZzjQCPUKSAzXnuC
 tG1p5Sxi+hvogYAhpPaTYvYpwiIPX8XXhRLtVwaC1IA+oJLUYcvsDEljsiGBB+c5e2cO
 R9VTFsdOR+m5B8iSXgZ+phDA6hXFXO9ByCQP5/0JbUAOI+3wIE8agCxdM7kyBSI8daZV
 RJXaWh7l1Q/F2acP4i93xcSlZC6jr12crheN1hGtLdbJ/Foi6w8wHievTRauJBzPd8f8
 KbYaY85yjCaDT2PvRQR4s9xThh1EjfcRccfz0EQdqEQR26N4zx7QUuoyO/+aGDRRGrwF
 6eIw==
X-Gm-Message-State: AOAM531KHxTctblj5R4giLC4vQmhFf5z5rOoBucFD0zW8QX7CqOZBcFm
 ceKjQaUcRdizbsz4YD2uklRl
X-Google-Smtp-Source: ABdhPJyM4IeXphBP8q2KP4gPQvEMc7MqleS9KFuFXPJtcvk9PVUlpoYSrvvcVLMZTwBBaFZ+PPnCaA==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id
 p9-20020a170902bd09b02900ec7e58a54amr9136372pls.62.1624624497069; 
 Fri, 25 Jun 2021 05:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/10] ath11k: set register access length for MHI driver
Date: Fri, 25 Jun 2021 18:03:53 +0530
Message-Id: <20210625123355.11578-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053457_741503_511F9101 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it before registering the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1620330705-40192-5-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 27b394d115e2..e097ae52e257 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -330,6 +330,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->fw_image = ab_pci->amss_path;
 	mhi_ctrl->regs = ab->mem;
+	mhi_ctrl->reg_len = ab->mem_len;
 
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
