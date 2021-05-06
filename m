Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA97C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:52:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2DC613C0
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 19:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2DC613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmMSnESHCFzaBdc2t2howbKP0xS1jq45rilYYFHIc4o=; b=cTpzGgNxb3A7U/I49BwRJGZTi8
	5OJLXNqZ/Cpd7RaTtOks1k3uA6Ku0JsvVRYsxgkAvZzI46QPZu1gM6J4eH22Dlz+ezPFJ8HUUjgCH
	zHgnHzf5i+2Uf8BQ8s5pkGxZ7tlpocgbprWyFTAAyTxVWc2zHw+YeiGnZxyc2Nnc17QB9d6g6cfGE
	Q0d0TE/4VUqX5PLcjzrxCg/S2F3uJ4KPdpFH2iivftNFl5r1GCKjWnxwoZOo9/K7V62M0sZmM7jSB
	Ht3IkTobJYcdIrmpTWk6lDOX6hqnrH8RDfKy1PLmexfwMA871SXWN7vN7gf/zTJ+1O8o53lyPAnDj
	46gpWgBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lek2g-005CPJ-2a; Thu, 06 May 2021 19:52:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lek2e-005COs-4l
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 19:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6hsvNiLm6snfgYT1gETxO981lyXB3iHndDKxbMsOxfE=; b=QCjfIYgcJjqDHRu6aXikat6sUE
 EUNicN3qyYiU3qGlLhvg5O38KRkOFch5PF08DEY9Nn2nnL66Y6iik69hfYrxs2TdoV5rT1qllR/Xa
 sa7GLBohNPJ1fl3YghwFTBWirWfdAlxyZ/B6JhDz/hHpaVq3UK/h8FkQ/1IWPeV0ITVprWoz3jDoJ
 C4OukXjBTtyz8qoU1KnR7qeZOVzhSl3Xaq80MBxE+nOqcDpU8tLKdAEd1/A8LNEq5kGTnrfqE79fR
 MrlwsF+bMG2Yw85Eu/gd6pQs8726GKVBVFPDokVnJ5RCT5XoQ1XubGJEcy9FdQu1H92ntYO+XxQ13
 GuN2gWkg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lek2X-006M4V-Gp
 for ath11k@lists.infradead.org; Thu, 06 May 2021 19:52:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620330729; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6hsvNiLm6snfgYT1gETxO981lyXB3iHndDKxbMsOxfE=;
 b=lFm34WbM2eMCy1hGmrFwYInadMh9POH+bwZj7PHW23b3SyhwLoHd3LlXmC0pYfpRzk1/A0Bp
 ALIczOBaXR9adkqQlYdQmTt+WQEp3GnyH/SKYDgG8WnpiN8s/+r54m1zuhuUUvkle1fnrsuG
 cmZeoG3vyP3s2FffeLi4W45gShk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 609448dac06dd10a2d5d1bb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:51:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C04E2C43148; Thu,  6 May 2021 19:51:53 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4F74C433D3;
 Thu,  6 May 2021 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4F74C433D3
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
Subject: [PATCH v4 0/6] BHI/BHIe improvements for MHI power purposes
Date: Thu,  6 May 2021 12:51:39 -0700
Message-Id: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_125209_132436_0052791E 
X-CRM114-Status: GOOD (  13.84  )
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
