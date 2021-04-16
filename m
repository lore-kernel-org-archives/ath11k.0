Return-Path: <SRS0=YaQx=JN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA41C4360C
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5851D613B7
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5851D613B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRVuVyG0H0+SKRMGbpWQrEcX1nOnOdQn02iP1wO/c34=; b=BM3ZUPy1J8Ebo9tAvyzCjGR3a7
	fko5Hp/KJig3zpX3oJplI/kcwnS4rA+GY36FeVoNtOmFGWNMnse6fmOuRzkHi2+xjwMGBkgV9zrRe
	DiIE3rQDtSHv+2roe0RRM56vkcw1CLj62RSkqP/1XqmTARMW/XCvRI5kPcMOIXgAD7CWXiy7031Hx
	xbUiwv0Cttxn0A3l37qOb+ZWI4ci42G6ug399itcrtEFb0wxe7yjCGl8W9YS2GZUanxuzppt0nfAj
	W0J8qbDraW8VU9Y3W2LW5AwyiA3XubdPW+nzvVO5VgMFdPR/yiVKgcfZ3JpvChpqMilUgHxz/YYEf
	dpetoYGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTV8-00380k-1l; Fri, 16 Apr 2021 18:47:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTV5-0037zf-Q5
 for ath11k@desiato.infradead.org; Fri, 16 Apr 2021 18:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WQvVexLWxw1M6NAH+Y9/0k5Les7MF2MKFVbtaZACYgw=; b=2d11A9ZxOxK1Tq8EcbuwzMPGRK
 AdjxVU1qpePHrgTdBcp9rg6nuFjYNxjqTC+E8uLo7Obfc77+nykOuGHr7EZ5kx2Ql8d8uhGXIlUVq
 pAEkYnep4jEW2lO07O8BxA/4xQ8p3VyhK4OarO2ap4Yi/G8A0k4ke4gGnk5GJWud40B75+yDPetCF
 1WrlCy0K+7rmKXVDUWtzrtFT8FFOshBJggGurywiP2ZuBnpQabR45ukY8qLfXACcAwmyok9owN/jE
 vwJPY5IvdXGnMluOnsECA/crbkiCCsWl3GihzSJROfWu2e6X0BphHkIwjqOgnGZyAyC4s84V6SgVz
 AuZUobIg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTUy-009dSj-0R
 for ath11k@lists.infradead.org; Fri, 16 Apr 2021 18:47:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618598849; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WQvVexLWxw1M6NAH+Y9/0k5Les7MF2MKFVbtaZACYgw=;
 b=WyVIuynEoHqD0Sy2Q1LAUvuAaQwx0vku5dLY6qxDGJkR8OvwdPLleYZJmW8H7y9qrJMFsjvA
 Rljk2QGMbJ4o8r3Rofjn7FEsCjHIR2aQRtrPKrVshoATYTzgoCHCKq5LwPXZjZGBlmjqkpF8
 v+g+qWkwB9CP9emh5/8uLm1sEW4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6079dbb5a817abd39a24cfd4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:47:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6CE23C43462; Fri, 16 Apr 2021 18:47:16 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D772C43461;
 Fri, 16 Apr 2021 18:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D772C43461
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
Subject: [PATCH v1 0/6] BHI/BHIe improvements for MHI power purposes
Date: Fri, 16 Apr 2021 11:46:59 -0700
Message-Id: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114729_423015_AA7A95FA 
X-CRM114-Status: GOOD (  13.00  )
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
