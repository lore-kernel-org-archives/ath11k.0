Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5959C12002
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 16:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A01660FF3
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 16:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A01660FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0McR1hnZVVuwFXZTuXSBBTGHmS3Sn/RIpKi91aJguxk=; b=AygK/sVOIZPON4
	PChyTNKgWC+1NJLSLtkij2fd8Og/ee4YbYPiHcVHKaNU95/uSx7x+AuALPcyUhZXjRmpgoDxscz1X
	pFNBsHItinSes7X4qzClxgrBsoJ/zrkKYxlspZiqcaJ/9LCn8a+4QOjZ1HF70fCSWTl3EN+8INL8L
	YBf7P8N1hLCIayUGUQHiQxY4U6S6KRe8YgvtWtSch+jLF7NgSrzVxM+fVUuMmbHjyHZgYqb6GVqIW
	oGyHHuKOFIvXyXDQbPCV3LKvhdRHFMBMnjZ5Y/rC8l1y2cGUq1nZCV/1olEGxIH9Y/l81DsCZJP2C
	asSGIe4DIVVA39GcxKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6EzC-00GXGI-Eg; Wed, 21 Jul 2021 16:22:18 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EyZ-00GWte-GZ
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 16:21:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626884505; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=uutbG6TrmR5gLYGXKim4L9LyhA7a2zQk6rMTtoe8Q1s=;
 b=idZnT8w3bd4fVITEq07heP5mXbrCumIpR3ZbUO2LqCSQsirrIXCSBby923XmzJq67WRveePs
 ZgE1sak6Ge+GxzQgQmSmrGzMEecIvsA1LjlWTcFuEJm8dv4FAZPBnsI1xrPHyKmBpQHNjtu/
 aEbdpYY81vJ2dE53wDHAsFj1t24=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f8497a290ea35ee605b32c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 16:21:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 511D9C433D3; Wed, 21 Jul 2021 16:21:13 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95ACEC43460;
 Wed, 21 Jul 2021 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95ACEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>
Subject: [PATCH 0/3] ath11k: Fix no data captured in monitor co-exist mode
Date: Wed, 21 Jul 2021 19:20:50 +0300
Message-Id: <20210721162053.46290-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_092146_095903_C8710289 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

In AP+monitor coexistance, monitor interface is capturing only
local traffic. This patchset changes monitor mode approach to
address monitor mode issues.

Seevalamuthu Mariappan (3):
  ath11k: move static function ath11k_mac_vdev_setup_sync to top
  ath11k: add separate APIs for monitor mode
  ath11k: monitor mode clean up to use separate APIs

 drivers/net/wireless/ath/ath11k/core.h  |  10 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |   2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c |   9 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 429 ++++++++++++++++++++++++++++----
 4 files changed, 387 insertions(+), 63 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
