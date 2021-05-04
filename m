Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4460C433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:38:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D919613DD
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D919613DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETo377cowcVhXVPKxewRwciqfLO31kTafkStoEIFYZg=; b=Ei9sC3fyO6+vksVXO/WmZhImRb
	LcO8TyjUCD+KKT+/IB+LDhEnfHh4KwIA1VgzLm9a5bSedlh0RCN4zn6Yo+bhYv9DjJCyEDHEnBZmt
	liaXfUrC+teHt631lpGgF0cMvInhVigpittgWLpG/QXOyQ7FRJge6xsm/0q2J+fndSQjb7e7Cc0xU
	0am/wtWz6Oluw49Y1EMRq9XW+IdpaqReKSNZIxPJYkyXQqJW2Z987lQBVmZGTJjiZafCdyCz87VBN
	xIhNtrBF2IqOa0UY+FQTM6MCBd1Yazw+oBTh+rDFYMm6LmOwPxg7oNRcVON6WVgS9I3vav9N/Uv7v
	QUqeBUtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le4cY-00HNHE-DA; Tue, 04 May 2021 23:38:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le4cK-00HND3-W4
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 23:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AIgbbr+JH32/l8eSPcxi2yZ//+qpxf14riHFPLDdtgw=; b=ejsS/rAHh+rmq7NAL4PBnm7gLm
 KT/25gOW4LfOPnYOVFH0ZKCtFUht/2ne6k91QyDUaynClPJsiWpgtRU5eW99AGiaxoqQHpNNvJlzz
 CAysqdAYw921Dz57iGWoZxrqjEDxguOvYVzwxbKNtt9tPqDCMOssDNa4mUJ0n9Nz2AjxJ3oLJVtfi
 tYrVva5hbT+cyCgOoXuX3ifksS1dKWK6eEY3cP/x3iOfgiA1UWnPfFaWP1TuiTctVxplJTIP3KdZB
 9MSdMcS2gEw/QrEssOCg/hjQ4+BfzFBLxqCUo5pg5/vUsHCL4NdzhE1mvb9FW0b2/qRMAmTyeNiv4
 HnDeEUAw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le4cF-004Kn2-Gh
 for ath11k@lists.infradead.org; Tue, 04 May 2021 23:38:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620171494; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AIgbbr+JH32/l8eSPcxi2yZ//+qpxf14riHFPLDdtgw=;
 b=DNcT4z9CPzKkvwEiwiiuxHYDzmbenltL7kfVx8J+6U7ShRs3bk0zZ45vx8gfgMGze38cUmjo
 cvSZq9rBS8iuez3qmxK6uoG1FFlaTCi1aySGvDErCEuJ+N9Qm73XOj6himjfxojAgJpBil7k
 zg48ce9PSO9qDJIIAKWQuLjrt54=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6091dae08166b7eff7abf925 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 May 2021 23:38:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2F96C4338A; Tue,  4 May 2021 23:38:07 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AB8B2C433F1;
 Tue,  4 May 2021 23:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB8B2C433F1
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
Subject: [PATCH v2 2/6] bus: mhi: core: Set BHI and BHIe pointers to NULL in
 clean-up
Date: Tue,  4 May 2021 16:37:54 -0700
Message-Id: <1620171478-35679-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620171478-35679-1-git-send-email-bbhatt@codeaurora.org>
References: <1620171478-35679-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_163814_690861_9BA1243A 
X-CRM114-Status: GOOD (  11.55  )
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

Set the BHI and BHIe pointers to NULL as part of clean-up. This
makes sure that stale pointers are not accessed after powering
MHI down.

Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 11c7a3d..1cc2f22 100644
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
