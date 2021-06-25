Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268E8C48BC2
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D206191B
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D206191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwwe+E7z/vX1dVwAuRKWIjFJr3gIpxGd9nUbM8qj4kw=; b=iVfnMDeROPCegt
	hUQDNkXLb/6m5XhL05RCfBEc+E7HyXXGvBUmYUQ3AQNf1TkfT2ctrh7P/UEvnS00vrfk9Ay/u2Hlo
	YoHrzPmcJ3Rc8Apk7ycMOtHMjXfLGaMhXqYqRuckfqWku2s36Nqqge58+AIYDRFuy0vk4CXaB6nVm
	0Lcz8pWMPZ6oda4oi17Ajhm2G2+ByL76wuBiU9J4thx4No0HhNsRAKsn/+OLlfI4KkmzALStp4O6T
	cfdzyMi4FqB8K2j/JC214/9Rr2eFEv9zjFqJQZ8ap/UcCMzD0SZsILDkAtrgKV6zxjPtJ95GM+g/Z
	BB0nwTpdMsCWlNi2niXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl2g-001TCs-M9; Fri, 25 Jun 2021 12:34:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2Y-001T8n-AI
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:34:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id y13so4642573plc.8
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+lLagFeszou/6sKi0JtQNyDv5OxzHHtHPuB74dMzb0=;
 b=S83L6xztJyvMDdrDFudWRKLH2YgerUT+jvHanW2eS+hr0VefoDlCCLQxtDG9RwEV9B
 WocxhY2bygwxU1a+h4YRatVNm8Pu+p4kQpIR8AV9HJrzPaZs+wbPsujVvyhJKbHhIvnl
 3fZcwkDXnx1o4sS6fWNHoN4vjTJAgsJ2wD1ObNa1zhzvz8iFz0QlLAHr5uk/rBNJV2kR
 SOgH278CQrhzmGgm1dmbaVUnnZpckIYDupAzYRTE2bV7GLro+DD9xhXf66jyWaS4p8zf
 ezLhNM1qCEhYlr9VM+CsGs1HiVKqFI0gzDpDylrcMlWu5BXXUazz665O5/OV5520le5H
 +YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+lLagFeszou/6sKi0JtQNyDv5OxzHHtHPuB74dMzb0=;
 b=CEQtmgsPrApr90tGtX7aiT1X9bOUg/crOUISCGO5gKjk1WS68VsDj/jklB5DqSHz3r
 aeawG2wfzn5kxlyIja2aeGEfsbV9Sy+PaWDHv81B95WhpEgFBPncQrMy99HnVdeV3i4p
 NTn+MGR6dPa//BWxXwjtd2gLdAzi3pqMYFEFgBUfWQWU5ZoLHZKkKw+cLy4TLEdoxWO+
 +sP5ohmc2K2wkxKbp+ZhCKBA3XeooNYkKdFSYw70qDntwgrfe/N9aGFi+nhZqdC/lBgI
 v8TPN6aqheNpQ6JdHX8nbu1Vb0JWVaRgeJ0ZoBmikWpqt9ahRbjkA4WJJ+y6DiXiPWFV
 Jc5Q==
X-Gm-Message-State: AOAM531Cc24/q1EUE//dDz6pFCKj2O7mtIFU2cJrY1NYBBbEA5C5YdzO
 okZC9yEt3eGxB4b9vdNqe8Vv
X-Google-Smtp-Source: ABdhPJzMZ0sOSaatnSTaZkqhHA4ywNY1d3PNVi04GVU9+0MP7fahzw4gCxdrSqgZJUQYYbQaEALb1g==
X-Received: by 2002:a17:90b:603:: with SMTP id
 gb3mr11364268pjb.230.1624624473578; 
 Fri, 25 Jun 2021 05:34:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:32 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 04/10] bus: mhi: core: Validate channel ID when processing
 command completions
Date: Fri, 25 Jun 2021 18:03:49 +0530
Message-Id: <20210625123355.11578-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053434_404701_94EDE85B 
X-CRM114-Status: GOOD (  12.98  )
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

MHI reads the channel ID from the event ring element sent by the
device which can be any value between 0 and 255. In order to
prevent any out of bound accesses, add a check against the maximum
number of channels supported by the controller and those channels
not configured yet so as to skip processing of that event ring
element.

Cc: stable@vger.kernel.org
Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://lore.kernel.org/r/1624558141-11045-1-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 69cd9dcde6d8..26bbc812121d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -773,11 +773,18 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
 
 	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
-	mhi_chan = &mhi_cntrl->mhi_chan[chan];
-	write_lock_bh(&mhi_chan->lock);
-	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
-	complete(&mhi_chan->completion);
-	write_unlock_bh(&mhi_chan->lock);
+
+	if (chan < mhi_cntrl->max_chan &&
+	    mhi_cntrl->mhi_chan[chan].configured) {
+		mhi_chan = &mhi_cntrl->mhi_chan[chan];
+		write_lock_bh(&mhi_chan->lock);
+		mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
+		complete(&mhi_chan->completion);
+		write_unlock_bh(&mhi_chan->lock);
+	} else {
+		dev_err(&mhi_cntrl->mhi_dev->dev,
+			"Completion packet for invalid channel ID: %d\n", chan);
+	}
 
 	mhi_del_ring_element(mhi_cntrl, mhi_ring);
 }
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
