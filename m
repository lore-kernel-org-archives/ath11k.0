Return-Path: <SRS0=YaQx=JN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D45C43460
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EDF06137D
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EDF06137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5I04RSG2bO49kBwm5/uZwPUX4VpCOk6Pg1y3UKD/nY=; b=Y53NhnZKYD3zUAQH9IXDyjqwEX
	LT14W55ZuVoiWpK+WnjzHPvgQ5t83sQ+f8I2kT42kiKa5s+pRf+1ky98euNti+ue5C+b1VXF5b8G5
	6dIMKfuGW1Dofvlo6UUhgwXdzMxerbJIG2lPryyeBGyg2krT6AOGYMqGidbKA/FC4nb93jkMpXF08
	BUniyMaQrpQc34lO6fCj6Zu/IJdk2sejb370qu/CS1hupIOkPIRP/T000R2DiUsUUjz3iG2vggaIc
	B6Lq6uwAvlOa6KoZT7IWRgfrmxhDtagHCD3+Q1iT1uzbIbKzePLfC7+6oMPqmmx+hLtW43sQwkqgj
	dgf4i32g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTV0-0037yf-U4; Fri, 16 Apr 2021 18:47:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTUy-0037xo-Uy
 for ath11k@desiato.infradead.org; Fri, 16 Apr 2021 18:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=N6ub7wtSp5eMgZGQ6htSpcYkY47epXuiTqKIqP/coGY=; b=tJEUipegbATIpMhU5CIU9Q2yJs
 CcWnCpDOOy0M2sgydLqaNtt2d4VFVTKDHT4VCKjKHYwJkaMSMeC8BAKfGaMTMenfSP6RH1pMsEVHe
 4Yftrlp1GnXhnckkQACXXdfDf9rxEsPf5u+ZvElkJcBIM0yMFO89hHbHV8Re1vbf8rNQODsTmw2+P
 UYmo5DirNUHsfKJ4qqYB97UBtGkMEsWc/aRpe8nCJ9uBWliw62FUTOtOBDgN8DqWwDSj3XYAU6nJb
 5lCxVA9QxUexg/1byZNl362TEGaRTBUifYeNHL1mKeRUWY6cgW0Yay0U4etCCxQH3Wks6NoQaUm5Q
 6zu6dzIQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTUw-009dSj-8C
 for ath11k@lists.infradead.org; Fri, 16 Apr 2021 18:47:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618598842; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=N6ub7wtSp5eMgZGQ6htSpcYkY47epXuiTqKIqP/coGY=;
 b=hpE199/9b8LE9UZ0/GhTIGD9aEOQ3JQ43c3/ZcYWXAa6ZIfYOT8MoRO44DL0h3btoB7Ofu5q
 DtMp0t1+/bc/2O2CHQFmnHavpqTiGYRZh2aRJ8u9PgVO2qYPhA/l1naERzFtVSF+cBNmVPUM
 JSkjxZz1xSYkMDjR3rEPxmu31bQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6079dbb6f34440a9d49db497 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:47:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F738C433C6; Fri, 16 Apr 2021 18:47:18 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 181C8C43461;
 Fri, 16 Apr 2021 18:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 181C8C43461
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
Subject: [PATCH v1 2/6] bus: mhi: core: Set BHI and BHIe pointers to NULL in
 clean-up
Date: Fri, 16 Apr 2021 11:47:01 -0700
Message-Id: <1618598825-18629-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114722_351953_201C486A 
X-CRM114-Status: GOOD (  11.49  )
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
