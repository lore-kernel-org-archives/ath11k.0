Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF247C48BC2
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B940B61883
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B940B61883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7YOu0qXes6Kh+xM14+WaJVcNoiaVs/aB8ypksHF2yw=; b=BB342GWm3gHldW
	oYyfqflXnqfPQjdp33aZIg/4R9vkhIjCTGqdTPrmAJNurJLkT8dZkt1OH+0cdGIxoi0dxlAdHeYGt
	gdy1AUd9csUWM8da8aFgsahpoTGC0cgyqwWS2/44P0hxTiR/sHYGKpZq+KMuAvHj3Ue0MGkNR+00X
	CUpHxrizWN8BGp22eH4Lr9q05bY6Lz7Tm+G1iOOLsZufrAY0T5xIdDcH1fvMqwWAUhDZ/Tr71SSKx
	kWbXMSP0xAztY+VYkL9nYBTu/eqRfOA92CoxgpjgQAS2NqukxiTkx3VAh07IOzWuEkLCeeRU1opcl
	a1vtJq81DNT3mgx9rABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl3A-001Taa-Jd; Fri, 25 Jun 2021 12:35:12 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl36-001TX5-M5
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:35:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id g192so7927756pfb.6
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONtT1ELTSrw1mSRZB+8b9XFyoudbRa+VTUtUIpf2uNg=;
 b=Hy65QO2GBVFDg5pZZhWRdmeGYjaXwBpDs00P4nEHc/QWsnaZFmT/6oo6rMhXd//RgT
 mi0hhr2nR6Z0tcXQnTQI5r0vcuHzO2qU9Sx4hZuLEyf7LoJDBrS5hr4L6Y8fjrbTJBjf
 WsN6I0sPuDvJVbUTh+jBWjA7srlHs1pKMtdaD8wOX/hYvgenA5+QEy5VpBKTfEjEumMD
 mpfmz9iYsDRqfY6214B7h96j/m0jAeec1y/6ZKojaWJSOYnx0SocAGEUq5ipbjbjNSKI
 D2eRyGC0ED2QWTfKfeMtw5edBPs/y/7x3L0uWgnOjEPiEGHFKYgemhOFGEDqqD3eMWlJ
 86nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONtT1ELTSrw1mSRZB+8b9XFyoudbRa+VTUtUIpf2uNg=;
 b=DjJjG6xCua+X2JVxycBS4IIWLqnT4xN2dWa6HKvxdKHGymaKcmm4iMto5MgkkqYFVb
 OBr1SfelluCKPjQy5rimt2A9RMYcYyImpITtlMiyU4kADEXIwQQuCi9kGEJJw/RiFYXQ
 D4TmvIW4s+MqHr/8fVqBsMb7olByxaDVfJ19tFdCe1XXFcJ5k9NTtpef32Veqlupdcxv
 qVcsa5fHK0s1Bp13cxn413Td3B3U8B+K35bKQI44ElMHoD/NvsXZoVYT3tIbtPgovcIm
 ZIzCrm4ZykWaxnZJnTQRifWi8WvUFEs0tBCbKrtqMwQ5VmbIS/Xuv14Kq7JKCNKY9adE
 crqQ==
X-Gm-Message-State: AOAM531mqrHfqL4HAOQeAIQKILAk4H9M+J5c+oWtOPiCuu2PVqDmr0XP
 C5GdcpbZxqAXhhDNs/um0XOL
X-Google-Smtp-Source: ABdhPJy6ctpRRTDQ9vIWKKGxmHWh8dOdLV2oV4farViio3Ya7w6oLgZ60+8rft7a6qwc49Q41ckWDA==
X-Received: by 2002:a05:6a00:1356:b029:301:a406:636d with SMTP id
 k22-20020a056a001356b0290301a406636dmr10252742pfu.39.1624624507776; 
 Fri, 25 Jun 2021 05:35:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:35:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/10] bus: mhi: core: Add range checks for BHI and BHIe
Date: Fri, 25 Jun 2021 18:03:55 +0530
Message-Id: <20210625123355.11578-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053508_767740_F8568D2D 
X-CRM114-Status: GOOD (  10.63  )
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

When obtaining the BHI or BHIe offsets during the power up
preparation phase, range checks are missing. These can help
controller drivers avoid accessing any address outside of the
MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
registration as it is a required field and range checks will
fail without it.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-7-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 1cc2f225d3d1..aeb1e3c2cdc4 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -885,7 +885,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
 	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
-	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs || !mhi_cntrl->irq)
+	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
+	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
@@ -1077,6 +1078,13 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "Error getting BHI offset\n");
 		goto error_reg_offset;
 	}
+
+	if (bhi_off >= mhi_cntrl->reg_len) {
+		dev_err(dev, "BHI offset: 0x%x is out of range: 0x%zx\n",
+			bhi_off, mhi_cntrl->reg_len);
+		ret = -EINVAL;
+		goto error_reg_offset;
+	}
 	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
 	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
@@ -1086,6 +1094,14 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 			dev_err(dev, "Error getting BHIE offset\n");
 			goto error_reg_offset;
 		}
+
+		if (bhie_off >= mhi_cntrl->reg_len) {
+			dev_err(dev,
+				"BHIe offset: 0x%x is out of range: 0x%zx\n",
+				bhie_off, mhi_cntrl->reg_len);
+			ret = -EINVAL;
+			goto error_reg_offset;
+		}
 		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
 	}
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
