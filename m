Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDF0C48BC2
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5141361883
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5141361883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqDOw9A3wf4g//ue67fLMkLCuFU77Qx821FBDtdoozc=; b=WuEWOxVmManp3D
	eVP51O0Kk/bWnRz4+BNQODLZaTufEZMmS/xi/wvqdhYsfAFsDwthvb4zF73OciWPGvcIXfAx/jxr6
	CcYqOFGFDME/CnT/Z9ReJVM29mHbMY0cu4SqVt6rPqX2D+L32vt0p0eZMkK9EHXz3nnFQyu6MRJgU
	+bKGvndPq0lb73XnNYJywUovUangkow31rkrYWeTWn08jQBxaVGIgd+Q8sGG1bgJwEWDqgCiWINcr
	eWgv1HMgoTeNdwxXUpXvBFCCzKZ+MJi+hVpmUXgUBPqDHgaGL0LHC/qr201LmXyx/0Fb8RzchzcJ0
	gaq7XTwIYu6tXx0MNEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl33-001TUS-5g; Fri, 25 Jun 2021 12:35:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl30-001TSa-Ol
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:35:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id g192so7927540pfb.6
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DgnnTTSnmT/peV2biYKlFU/kMTbnc/Zi2T2QGThm6g=;
 b=Z6mW3ccQN2YBGjwffpJ73Duxw2kzlNc3b4cHutlQBqVWyoJmNhswvJXGEFOk2WB5qU
 kkptZQqQ1o481oe2WiehWE3FNtq02Zue2ZCHyjqalzIbhNv1tv4hC6nNIgCErdBHfQ/3
 kiD/2TB8H6xe2KvJFKhX72fI9SB2dWoCQvSKi6QFLbdKivWUTD4h706ganAsEcxqYaDM
 D0OBejyeEFuIUE1WqugERo3plTuoYotGPM3hdP3UYJT2oT7VFSriD8mTV5eXqWyo6uX7
 lji/5RU/ZK/yqAuRBPWtPr3giwKCHRX57uZ8iHyG/P6X5pp0s7hjjTqXy/pSEoSTzWz2
 0iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3DgnnTTSnmT/peV2biYKlFU/kMTbnc/Zi2T2QGThm6g=;
 b=fC8jzh8zuXbPs5WckpEoVmFRbCx73v4IQbG1RkEDogLkixJTv5t48GSh7ONINeJuC7
 PlOfwQngB6/zaFG9vVdBcYRHk/kpU1N0eiGD1rwgmv1mpQR1CqgiEMIH39p23WrZ6fTP
 KvOWvyZleCMdIy28wRuQ/fIZNI7QbOd6sjTHZ/2j8hu5+mBimeKDh7vZO4768CdF8bQe
 WndERdXi7njQgUu9v5X2sV0u9GdQkJGytBwudDAw6xEprCxNazKlRmKBNH/dg6JwH276
 7I2neljqwuXIz26z/BiSgxi2BzYFMtcQHj4K3HWlSice5cRn5EmYpbbQYGLI4FQuTSX/
 DpYA==
X-Gm-Message-State: AOAM5323vwj9ixz8GXDiIWa0iwSCeIc6Y2qhXzKutyO0hxg/CJ0983LY
 HWuukMrs3+CCt6dDLDJTrQyH
X-Google-Smtp-Source: ABdhPJz+AKbIE1lpJhRVdxL7q3a/gDPAo2H+3JGDAdVYZy679F3z1BEtakar0D/fUWHx/cJwU8BXKw==
X-Received: by 2002:a05:6a00:2491:b029:308:d524:1a26 with SMTP id
 c17-20020a056a002491b0290308d5241a26mr5630575pfv.45.1624624502242; 
 Fri, 25 Jun 2021 05:35:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:35:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/10] bus: mhi: pci_generic: Set register access length for
 MHI driver
Date: Fri, 25 Jun 2021 18:03:54 +0530
Message-Id: <20210625123355.11578-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053502_876001_2E5F5AF1 
X-CRM114-Status: UNSURE (   9.23  )
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
Set it from the PCI generic controller driver before registering
the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-6-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 89f71e6db23f..8bc6149249e3 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -508,6 +508,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
+	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = pci_set_dma_mask(pdev, dma_mask);
 	if (err) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
