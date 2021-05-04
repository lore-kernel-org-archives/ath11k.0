Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0D8C433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:38:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F789613D8
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F789613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnT7rdisrwCGVStJ7upNa91fns2d71DHrsvqPkxEsg8=; b=cbFrMnVuM+4TIMDqs840xewIbB
	eZOAbr1NUhtNN+3HjvKQ9oXEdwiZ2tkbe3cnXCkNkIxEqzDj2t77FP1qVKd/lya0iDKhcnwQtYmc8
	2/LIUqU/kpboJtiXVquLPmDSRyzi2BQC4DosJqae85duZhoqsgfap5b1aT4DbW9xKrh1MT4qpF/Lj
	xBQsVaEqXQf/DPW4rU0HujmDgu27/ctL3Q28gw094nO8O4srOpwqAlbWJlPt3cDh2mlJ2sQtiZyO+
	0C3Jaazs5FUFpfHcnEYX619G4B/Oo4B3s72ufjlTFbtX3uG89qwWkYtlGzUw0yDxHcjk5/S5g7Asw
	orFqUbEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le4cU-00HNGJ-QJ; Tue, 04 May 2021 23:38:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le4cI-00HNCl-1Y
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 23:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C0sQCjaoPR40g0+mP3PUInbcfTXbeVX/WRbKeIYAWoU=; b=zYwWOgq/R60tyZoX2OokgnbNHj
 +MwgsmtiMUVjEJ7CppTSV2ssYKc6MuiYXqqGDipjs27kTTcvnectz5PJJUoBT04K+g/Xo4zB/QNXD
 1Ognmduzv++fxO30o1AjhTpnEAJK0MyQDHy/8m4m+iPt0RsLYe06dNkY3A6yhfCVkC0Z1ym43tNa2
 xrSwRQtsADB+lR18e5yY879kD4HJ3w+u+0fYZpPyDOhSVL6ZfUhLlaw8uSvVMARNCdV9qeiNnN8mj
 dxe3MQAMNLrwArWfs7nGcAdL8ZO0mnfq+/zOB8K2GJtvo1rE3DLcsD6n0muOBaLC+6aFncXdche9l
 cLqnWsTw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le4cF-004Knx-36
 for ath11k@lists.infradead.org; Tue, 04 May 2021 23:38:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620171491; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=C0sQCjaoPR40g0+mP3PUInbcfTXbeVX/WRbKeIYAWoU=;
 b=uy7bkAE5Tqav6ZQFgInwOXIEsIRbzoycJgTfNF3uu66IWZteMmK3xMU2AL8sax8Az8RVGPQb
 MfCKkYBT3fvbO/KL02Jkoqr3IuupqMaSNbtJyydBKG9X/pm2hbLQNUjHa8zfYppXViFhVqSq
 fHvFXL6Z3d1yFgkSjeYFhU/4p20=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6091dae19a9ff96d952ac366 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 May 2021 23:38:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4E43AC43143; Tue,  4 May 2021 23:38:09 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 24157C433F1;
 Tue,  4 May 2021 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24157C433F1
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
Subject: [PATCH v2 4/6] ath11k: set register access length for MHI driver
Date: Tue,  4 May 2021 16:37:56 -0700
Message-Id: <1620171478-35679-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620171478-35679-1-git-send-email-bbhatt@codeaurora.org>
References: <1620171478-35679-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_163811_594319_A290CF12 
X-CRM114-Status: GOOD (  11.80  )
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
Set it before registering the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
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
