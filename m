Return-Path: <SRS0=fjpk=KA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7D2C433ED
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 17:10:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E966C610FB
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 17:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E966C610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2IXPsOWAXgIeUAhMcGd5+rjdPzT7k1x7HwsUA8l1Vs=; b=XkEOtyF0hXu6Rwkya3r/rBj7Os
	kt4MgmXeEClWJq3z4XqwYuYGG742nxMtFbF7YKjBrEGwLu4jLGququjppNjByJ6NnpS2orRSaRhyP
	MyGm4cLD0DJJ6TBrG5L1/0Uqzidjqs9YGiPwPkEofGF0/FMfbyfoG830aWsXvWV59mJPonu6/sV/w
	u4cp5ewRsg1ZMDKFC/QDFNXkate0ZMxto3rE4tJMdDwidBBISyJ/QPyiMzyBT79MI5AbcBXqOzUyA
	/bHwYk+ZvKNRya08Zh8HJZYNbWJ3Z1A7PRxY5PoosZAgoOysEj95kIECX6BPpwo22tLPiRhEeUw99
	KEdf593A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leL25-001s0d-2R; Wed, 05 May 2021 17:09:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL22-001s02-KS
 for ath11k@desiato.infradead.org; Wed, 05 May 2021 17:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2NJ2FCJ5eygsO7NmVQKBkrCnohRdJRzGE0EKHDhDgYA=; b=Q2Qo68xx6QWWE1TlfGGBl6r43t
 81G9z4gXBgBZI1/HgkT8zMZ01gT0/lYEJS4pG4mTJuJ4dW8xxFNzpW/BTuSu4qCQwNhitOUTl2Se2
 RN7pqafYkfdySY4ecxIsuGlP8cMTNenmu9EXXQ14Rh/Bt2Aq8ib5R946z7CGQX0AEYWz3jsDGNrZ9
 Rfpz3hM8XcJL0QmROwLNZ2gYi5IEoT0LnUXGVjdZBcmFA0R+Yfsr/iZJ3c161Dm72IRma5J4REYKA
 dFkytw8Jcm2HuLZcgxLnZ/x6TRc46zdVdQZMq/mEXtd5EsMjUdI6/BWBbXOGBbe12TBWWZ133+N6T
 O6JodNzg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL1x-0052iT-FR
 for ath11k@lists.infradead.org; Wed, 05 May 2021 17:09:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620234591; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2NJ2FCJ5eygsO7NmVQKBkrCnohRdJRzGE0EKHDhDgYA=;
 b=tS32++irSHFZ5xoNLPkvgDdAECSKCwPudgVwOifE2A+urdBXyLT19T+wOcsV2/lNNf7TV/Tq
 C7sMP/HkXItE4Q5uUjLp4eHYdRNdM18E33771KEXVHveW6uLH1HbFwUOHpkdPtuDR9Kb+bvv
 JUSdOmPnP2TmrtYohvBHgCMG6WU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6092d14bc39407c327c411e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 May 2021 17:09:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A0268C0091F; Wed,  5 May 2021 17:09:30 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A7CD9C43143;
 Wed,  5 May 2021 17:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7CD9C43143
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
Subject: [PATCH v3 6/6] bus: mhi: core: Add range checks for BHI and BHIe
Date: Wed,  5 May 2021 10:08:21 -0700
Message-Id: <1620234501-30461-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_100952_098696_D28F1B39 
X-CRM114-Status: GOOD (  13.24  )
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

When obtaining the BHI or BHIe offsets during the power up
preparation phase, range checks are missing. These can help
controller drivers avoid accessing any address outside of the
MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
registration as it is a required field and range checks will
fail without it.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/core/init.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 1cc2f22..86ad06e 100644
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
@@ -1077,6 +1078,12 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "Error getting BHI offset\n");
 		goto error_reg_offset;
 	}
+
+	if (bhi_off >= mhi_cntrl->reg_len) {
+		dev_err(dev, "BHI offset is out of range\n");
+		ret = -EINVAL;
+		goto error_reg_offset;
+	}
 	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
 	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
@@ -1086,6 +1093,12 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 			dev_err(dev, "Error getting BHIE offset\n");
 			goto error_reg_offset;
 		}
+
+		if (bhie_off >= mhi_cntrl->reg_len) {
+			dev_err(dev, "BHIe offset is out of range\n");
+			ret = -EINVAL;
+			goto error_reg_offset;
+		}
 		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
