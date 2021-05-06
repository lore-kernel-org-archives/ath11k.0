Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6EAC433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2F86103E
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2F86103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmN/bYbIVTOfsAIawqasyII1+BrfUBgewbrRebZWEXE=; b=APFzZ40liXZDYTrCgVMGkBSQLz
	U68kR+FCpDCiVET/aVkx+KALuSnqUNDfnci59UBiqlK/ggdTA3QpxkzTa+De2z/+0pXZNV4OXw37k
	Ww2vd9WFOADCVgZ9mICY5uzoRG3KNBCYkb59kBXhFJStC2u+OLBDfOSWTB0MkrwICI8wryMtbdBY2
	31kGI+9y2bUbtc2CnpnewGuwjU/6zqnRgNDkREpqB/HGlGbmT/4+QEeaiHCy0CRYE035nqHSpjWyF
	EmAY7pF61lu1M9dqvtQ//2D6xVB6HyNtj+UXUMI5EVISZdqsN7ekTvyY9KOAeWkpBv/qiQn0qAPXz
	FuR7Zwbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejke-005AF5-8p; Thu, 06 May 2021 19:33:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejkX-005ACx-Hx
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WfLNhJhOkG3h0UidyMRRyHaE+tXE9TU0reD21uN9rEw=; b=U9JHyfhT9fWg8IikjSXi1WHt7F
 L0vvye+5Sm2Q8FnPWx1PleuFmHY6Xy5MimQ7eqAZkA6DBPlVSmK0HWjKA2X4B0gMMv23Pl5DkVewD
 mudq6BY68tuxsHAAm3EYfXUfTWknWl/dARt1vWY6YX22UTrNN6DNSDzUUAZsYiND/s+VQJnr2GCPa
 D7r3g6QQqTdUDEV9HHQanS/mXkVzEIwprwzLgafhOtPbo2IiBuirzp8GS9J3shJrnNNuvWsqrgp/6
 rd2y+n6H8dTURtYTyi+ftoEVOmbleXKfp3D8zKtwAetA6V10G+zJxIrYdZi9yr5/eEDCJR6XReysM
 IyoDTEiA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejkR-006LFp-LN
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:33:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620329606; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WfLNhJhOkG3h0UidyMRRyHaE+tXE9TU0reD21uN9rEw=;
 b=Ct7l+ukaPkYTg8d9cDhqqhm9P4nCZM22sx69IVdPk76eE7LBabCvGCkTBMnCl3M6fWdde32P
 4Ii60EUckV/oKv9Y2t5IBhPOzcnU3iR0kD5ZoZl6pv1WgcMUFKk6F7lr6l0l4DojcZfUEwBf
 JRbZuAb5Pi6phmAVjoK0wL2Lv8c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6094447f8166b7eff7e56c2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:33:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31345C00446; Thu,  6 May 2021 19:33:18 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3F46C43143;
 Thu,  6 May 2021 19:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3F46C43143
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
Subject: [PATCH v4 4/6] ath11k: set register access length for MHI driver
Date: Thu,  6 May 2021 12:32:23 -0700
Message-Id: <1620329545-32328-5-git-send-email-bbhatt@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
References: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_123326_985787_EEC88183 
X-CRM114-Status: GOOD (  11.68  )
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
Set it before registering the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 09858e5..c0f013c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -235,6 +235,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->fw_image = ab_pci->amss_path;
 	mhi_ctrl->regs = ab->mem;
+	mhi_ctrl->reg_len = ab->mem_len;
 
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
