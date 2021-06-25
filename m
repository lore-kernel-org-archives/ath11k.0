Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256C0C2B9F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0436191B
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0436191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPs6B2PCPcCLiu32gN/11y59YBnaiFVpC6iSetcBHuw=; b=Yicn9+MPpa4lo/
	kChgH9WcQh2Z/zC0W7Zm7cAQ5mRiHM7SK0llDFZIwWdRQWO4hIVpea3A791AvyI2y49yq/8cFXojK
	CwLNhCX8CbLjCPhLsor4laYgyRGMxT4kDJQl73M6zMG4FDT1YSCu2NyfcKRbIYsCJWkXyNi9RGlk7
	52LeRQbupU720kLF8qKe4eDZZXJdNMdK3urhzXagKJnYz7RkDkdkyjIA91/jzdPXW1x3jKfr0gzJY
	es1BfQPJtWh7AxVnj0j3qCV1BhzUq0p5V4dJ1B8VFJV+qVHTmPfWEbzOnVskNscIHsG/mMLmqHhyg
	T6n+/aBlZb/921JK9twQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl2o-001TJS-MI; Fri, 25 Jun 2021 12:34:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2k-001TFz-IW
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:34:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id q192so7926526pfc.7
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNO7OvoezOyKwRQqQPCTAGHXfd3P08Ex5P2XMikHwWs=;
 b=e9MtdpfGHP20g++UmMZA7v/PwkSWPmVAUxQ1kUZC76KT2yBOov0+XQs6prxQxXR2JU
 J0RlewuEWXnVf2dy2yeBZdZvVDfV1jC9PF/xziGneT/XMx/iRdxdAEc1r96xrIy9l816
 0FUtsFEgPVbP2Xzfvlg3QF9t/1vkQYKDmQATgckKnyMnzIATgGlSYnDkUEwedWOUS8QP
 H/5EMgjlapCD/mrgLvIj1zFWhWCdZo4jYMFjww3c4QC8gjDF54bKWDxx9HVEicB4mjjK
 l/AVlaKHWQaTME7XvE/XUSA8Lu219Qp/aiGadiyAhw1kKyHSIgoqN+r9Cl7BBUEHpIWf
 QHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNO7OvoezOyKwRQqQPCTAGHXfd3P08Ex5P2XMikHwWs=;
 b=aNCjuEsnkBy6hnDAyPakQf9eV6th86arR+xFvXCRHdJyyKX3IWlpX+AvPL7JULzzDj
 9dYRkIE+4tGEjdLKjgJgQ455WWGCWmfoqqM6An3uLswop7pObCHMlFziNKipxVG/Qyj3
 w4ZNRD+5v5sEWM8y7nzJsIZDN8YZpyCQMumhu2cOPaPSbYcgOcxufSiQZBZGs9x45Ipq
 71ZPlsMNU0OJI/hUotjYT7p/G+Ro9Z6yUo7XMxfPQTrLoPWQiL7Mmpi1+PlvPVUSKzmK
 Y4rUaiqOfv/GeGSlhHVqJJ9KixUlc/akv8tBEsSvevP16XyCPdc2K0j8cTv6YdHhN8/I
 livA==
X-Gm-Message-State: AOAM532nGepeemWPLWmJy1GH0/rlNYevYvuIvo4AgB4JX4hkaaWyEx6f
 6O1IX2Y/7s6smGvFZ+L0gw+7
X-Google-Smtp-Source: ABdhPJxG2i6xZEvuWCUBDKfc9EaIHgiHlAUIJ5/atMQPCixk52P1mNDwspVOrh28gdRWtiQ4AGZbpw==
X-Received: by 2002:a63:7404:: with SMTP id p4mr9338107pgc.405.1624624485806; 
 Fri, 25 Jun 2021 05:34:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org, stable@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/10] bus: mhi: core: Set BHI and BHIe pointers to NULL in
 clean-up
Date: Fri, 25 Jun 2021 18:03:51 +0530
Message-Id: <20210625123355.11578-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053446_655172_82837C1C 
X-CRM114-Status: UNSURE (   8.44  )
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

Set the BHI and BHIe pointers to NULL as part of clean-up. This
makes sure that stale pointers are not accessed after powering
MHI down.

Cc: stable@vger.kernel.org
Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-3-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 11c7a3d3c9bf..1cc2f225d3d1 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1132,6 +1132,9 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->rddm_image = NULL;
 	}
 
+	mhi_cntrl->bhi = NULL;
+	mhi_cntrl->bhie = NULL;
+
 	mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
