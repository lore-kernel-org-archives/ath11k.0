Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2C8C433B4
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6838B6105A
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6838B6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmMSnESHCFzaBdc2t2howbKP0xS1jq45rilYYFHIc4o=; b=lcQkEFdhB/u83Ootj7dKDkjm6I
	PZA+mLuBEJw6jNKa740cgwxzbraZ3w5HpVK+V6OiCpfF7GesOLz6N+cTKhDAb+arodGTWySvbEpuJ
	yVRyErGTqhBJjkwh2zawIS0zTIDKdopiYUMNxIWVWO+gQfYjWnzsEl3ro+PjkTBuP5zVYeqGB3SDy
	GBPGtcZ8vcuwg9uDWsxNhhrXOJYICWNFEq75uvK2mtNDsIFglMwrFmxmoxw5kbfzA3kL3ZpkhUY6X
	Zb4ca9b/TmOn6s3yfXZ+Jmzs4aZU8Tbs7vfkWrQGtGiI2I2gLx8nze1leVkrVe6LRN7gn0TcNo/Oy
	R4zzgAWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejk8-005A8q-6x; Thu, 06 May 2021 19:33:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejk4-005A8A-RR
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6hsvNiLm6snfgYT1gETxO981lyXB3iHndDKxbMsOxfE=; b=aoOs0zg8XQ788aP7EaqEDSSQfw
 BQZh0WcOPSBRlorLIBxRfZ0Y6jGqWox4FTQsoEq6TowmIG5sii3KcQx4LMv67fc2FXlCgK77Nqv08
 wasIKMiT17e7xS623m8WQisB2jD02nobkebjeg8+DItqeRYWTaJ1UUrRdRI0zAT/ugePy4f3ISXyU
 1SIEDCWvkjUs/aG9nJgxY9JEE0+CtL5a3Wkfpt6j/mY70vIrTrYrvZ+OoD4Vodu2jNUNhawQ+YIgC
 kSzPLJkynD70dwtWie2FoO074u04pIf5R0vCJrLyc2yMT4UNjcdR73DnANdTy63sqhSSXm1i4J5fC
 4Ghke6fQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejjw-006LFp-Fp
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:32:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620329573; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6hsvNiLm6snfgYT1gETxO981lyXB3iHndDKxbMsOxfE=;
 b=d0yDiVspt4eJnLHhD3k7c5IfiMp/ufC2P+ErV8qb5R/7nRIYeseT+cNNnH2rgFc96O8UD/+V
 JpDJQq/s7uBjU25KiHk0n3iM3VUeyPMoZZr+Pv2lot0jGL1OeeXngJfV47k6owN2B1JSlPjs
 5zjAL4K8in799WxZWFEg666LnK4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60944461853c0a2c461cc480 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:32:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5838FC43147; Thu,  6 May 2021 19:32:48 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3785C433D3;
 Thu,  6 May 2021 19:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3785C433D3
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
 Bhaumik Bhatt <bbhatt@qti.qualcomm.com>
Subject: [PATCH v4 0/6] BHI/BHIe improvements for MHI power purposes
Date: Thu,  6 May 2021 12:32:19 -0700
Message-Id: <1620329545-32328-1-git-send-email-bbhatt@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_123254_004121_305B4213 
X-CRM114-Status: GOOD (  14.31  )
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

This patch series improves the power up behavior by allowing MHI host driver to
set BHI and/or BHIe offsets early on in the preparation phase and fail pre-power
up if offsets are not found or not within a limited MMIO region. This also
allows MHI host to clean up the offsets in the unprepare after power down phase.

Going forward, controllers will be required to specify a reg_len field which
will be used to check whether the BHI/BHIe offsets are in range or not.

This series has been tested on X86_64 architecture with the PCI generic driver
as controller and an SDX55 device.

v4:
-Added reviewed-by tags
-Updated range check patch to include BHI/e offsets in the error message

v3:
-Added reviewed-by tags
-Updated order of reg_len in mhi_controller structure documentation

v2:
-Added reviewed-by tags
-Moved reg_len entry in mhi_controller structure to allow for a packed struct

Bhaumik Bhatt (6):
  bus: mhi: core: Set BHI/BHIe offsets on power up preparation
  bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
  bus: mhi: Add MMIO region length to controller structure
  ath11k: set register access length for MHI driver
  bus: mhi: pci_generic: Set register access length for MHI driver
  bus: mhi: core: Add range checks for BHI and BHIe

 drivers/bus/mhi/core/init.c           | 61 ++++++++++++++++++++++++-----------
 drivers/bus/mhi/core/pm.c             | 28 +++-------------
 drivers/bus/mhi/pci_generic.c         |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 include/linux/mhi.h                   |  2 ++
 5 files changed, 50 insertions(+), 43 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
