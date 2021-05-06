Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B526C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:52:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EFB613C0
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97EFB613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KyQmz2/UT4dlDXDrom7VxQ3GIVlOLPhCnJGBwxBzyc=; b=CMAHPOTKrvwY6uyZzVuw7MvgVf
	tclJXjApRz5DOpeqqltt1A2SRxKXS/39yPr/A0kejU/XrRN+5TcRt78+eJt6j2hPtajmZmSsIgNqu
	EgG+AJXLM1kIzciR+ecsb5u5f2EYkcthadCp/Tg3uohKjPyTiojQl3N7UM21aUicdupwnlpGhZakp
	KpbWuDr2pQ6QhVjzYrhXY/bVs1HpIl5KNyvukDmQmsILDisJOif0v61HD0qV9QDvz4lR1RaWXMO2z
	BX2/yPzlT72tv1miUJ4Ts4l9BHmT6Wfg6JX5vKKcCa+YzVLW0VKYpDrI76ny0oy5s6boloT9E3Aa2
	ZxBkyb9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lek2o-005CRi-7S; Thu, 06 May 2021 19:52:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lek2l-005CQX-DT
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ItwsbAsGGeAoPenFRnoVdj2HHxWtIBa7MxEhEsYvNdw=; b=1FrpxCtIqW+6hv+OjbQwjTWYNJ
 TsH35TATk71cvJi6cU6KiTwuso7fv8dwvR91BrienSp2fZ9lgYBdqit4Wdhf8VlUGHpR33Jggcjjv
 giqcVHv4gVjaUhtnecJhM2tHYrgof9VOdfBXmQlrqcLR7mRb3rS+SRrNZJVUXlQvBMDDWf4IDGLqu
 Q9dKGqsTspnRoMOssLYDOvUwX6V32ACFqXP71p7lQ935QXufwXqNf4BfSKPsOCwxKXssL4v8Riuzp
 c2J8bw3/xGsqaks6Yep+am6bPsjk4yFCJ9BPsX2SjiskecXdPkOiXITCTeZwZZIv67/W2dg8jqpXF
 lPZo4wGg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lek2f-006M4V-RM
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:52:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620330736; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ItwsbAsGGeAoPenFRnoVdj2HHxWtIBa7MxEhEsYvNdw=;
 b=tCzOAq1+SBUkLRRI+dRU5c+NjHf/X4SMNXM7An8PPwg4TKaJhLxNjw6pHSMEDqVE93uxxNMy
 BZlAac0IKhGMgoPYGaYhUCg3LbziyYnspMRzryO8zyelBiFsGNKwA2cTlhNx0+YXY71bXhuh
 XMjUIbwzv8OQQNIEyGVVtcCCeAk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 609448dcc06dd10a2d5d216b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:51:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1822CC43145; Thu,  6 May 2021 19:51:56 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 33C07C433D3;
 Thu,  6 May 2021 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33C07C433D3
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
Subject: [PATCH v4 2/6] bus: mhi: core: Set BHI and BHIe pointers to NULL in
 clean-up
Date: Thu,  6 May 2021 12:51:41 -0700
Message-Id: <1620330705-40192-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_125217_072179_AF8205DC 
X-CRM114-Status: GOOD (  11.20  )
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
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
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
