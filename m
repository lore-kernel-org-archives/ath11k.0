Return-Path: <SRS0=fjpk=KA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCB6C433B4
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 17:09:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D049A6102A
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 17:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D049A6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+yssbd0pEODdNbHnJJt08sNyL1yAbDTy5XD0SxVxQw=; b=bX2tNrf/HX0sW31r2T8C63/X1f
	V658qqrzCKeunmTxlzCBWeGH2GSedYMFuziK3PmWyRBpD37CXSLY+6S7cXPm4bCopojngxaFH69FD
	0qLvsb+uD7UzozrsjHnyaCQ4pp78SEKynpJBiNJw/tT7jJbEHwQlfPcr/Nw8vlbM3PxchB8y8NbAv
	hhEyHBhN77ljjXr7tqpdaTxlbrsJKkb/PNUwyD22iXTL1v62fev48SGzz9/kGBmtsQnMHCx7oIKmW
	ZlzfQfZwiEymx0QVylnRhO8bXOezSNSha7Zqf2jUS41PpU8pn+YAtsFT7vIfiKLVjyYt6x3xvyWBK
	kq7WNnpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leL13-001rkI-Em; Wed, 05 May 2021 17:08:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL0y-001rj4-T3
 for ath11k@desiato.infradead.org; Wed, 05 May 2021 17:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zJ3n4e38JIW/W6C47Rp2eE60Ip/I/8mMnIajfX9QwqY=; b=VVMMYQOJd4Cz2mFOoNmriWEDNN
 eka5POigUZ+gs/3FZ/U1DJjQOyEGYDBsk0cohHZ6YABckrmn7wNZHyUGnTmiCgzl19m/eAy0dMPyt
 QFU4VZFjrJRs2rFuKAqHGOxSNLt6PEK0n7Mo1v8X0vtkMVO9DQ8VbRETGDcrI+VbYO3E9uuO94LVI
 D/mnIWCgXr01EnV7GgsS7YtqGaeSPWZrS1AfmJNueMUrJKW2hYbz4Zt3NuXiDWZOW1YdmYytdAE5i
 K8VR+zbQchHPO+3rwlP23ePdc+WnU24cmUvb4HwZ/l4gQhVCZpt9guPol7n3NVMYGht2c3bTtwQuU
 djuQ9P9A==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL0v-0052iT-Dd
 for ath11k@lists.infradead.org; Wed, 05 May 2021 17:08:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620234525; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zJ3n4e38JIW/W6C47Rp2eE60Ip/I/8mMnIajfX9QwqY=;
 b=BFMAGsEBYFlAPqz1XiPTPx3q4aNY2osBe18ocnt54g88eB2qUb4pyvucPkQBSw+YCqH1aDuM
 WmKwwatxYiem9FvTrAC7cR9k5Sug0ArdlRDsB/I7RZXPAnW/5y2i+9wJ7iWFDfPoGUCnawgY
 Qfhb61BiHMsZJjHziHKvr/tMbbU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6092d11a8807bcde1d12a600 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 May 2021 17:08:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CC293C00919; Wed,  5 May 2021 17:08:41 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 840C2C433D3;
 Wed,  5 May 2021 17:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 840C2C433D3
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
Subject: [PATCH v3 0/6] BHI/BHIe improvements for MHI power purposes
Date: Wed,  5 May 2021 10:08:15 -0700
Message-Id: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_100845_521055_AE6B9C5F 
X-CRM114-Status: GOOD (  13.97  )
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

 drivers/bus/mhi/core/init.c           | 58 +++++++++++++++++++++++------------
 drivers/bus/mhi/core/pm.c             | 28 +++--------------
 drivers/bus/mhi/pci_generic.c         |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 include/linux/mhi.h                   |  2 ++
 5 files changed, 47 insertions(+), 43 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
