Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1CEC433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 22:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDE8610A6
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 22:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DDE8610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Px9WghsESxonM9CaCpWOetR5Ajd4W07lFydMIhpmaGQ=; b=RVUU6GxRdrV3fd
	wGXnZYH/ah8Jpj6YNsjq7GokQP8DWnOcU/dgzrS+Q0Hj+28DBNk818Pqr+Cvfe0c1/fhViYykEsup
	T5vVwOcMyTv1/6/N09PeJt5xbMHZjY0KbAmA5GUDs6C8Q7AXPL5rV09DAU8SVTdl+nnUoYw9BJJfG
	evD3Bo+lL21DAWnsqK7d+Q8GO4jVMqbP9YteAoo8kD23W9xk3syOOMdg6354Y0cXu8uoEsHPg+xms
	ICwAu+Y63AK1f4cwgWUK1uqreDu5AZCAVa0hRlVwUBCwcjWqjdijOSy7lDr1otMBe4K4tQrDMpaia
	/4FMr8lhnUD5Chl7DIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPuUz-003Q0j-RM; Mon, 13 Sep 2021 22:32:25 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPuUx-003Q05-5m
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 22:32:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631572343; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=+IIrtwkfgZjcd2GkgtaMi+ekH0Vm4CAKO94p+w0YbFk=;
 b=SzZUCSNbKTcFheHyEB992upF5lesdpz4WZKGvrtEpzPPNFcxscZVIzrWLTpJJPZGqjpbDoY6
 IWyo33/dGJItW7tIpykgVVXR6d/Euqlmi/VRFFWlMP3Ozz8bfrgz7U/K41Jwp5GCRqMmF11p
 ysfYvXJ4nhNZ+LqwXFlMc49QgO8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613fd166648642cc1c624dc2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 22:32:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48940C43616; Mon, 13 Sep 2021 22:32:06 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A4BFC4338F;
 Mon, 13 Sep 2021 22:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2A4BFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>
Subject: [PATCH 0/5] ath11k: Change htt stats display logic
Date: Tue, 14 Sep 2021 01:31:43 +0300
Message-Id: <20210913223148.208026-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_153224_012217_B45717D9 
X-CRM114-Status: UNSURE (   9.13  )
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

This patchsets modified htt stats display logic by removing
all temporary array usage to avoid stats truncation.

Seevalamuthu Mariappan (4):
  ath11k: Rename macro ARRAY_TO_STRING to PRINT_ARRAY_TO_BUF
  ath11k: Replace HTT_DBG_OUT with scnprintf
  ath11k: Remove htt stats fixed size array usage
  ath11k: Change masking and shifting in htt stats

Venkateswara Naralasetty (1):
  ath11k: add HTT stats support for new stats

 drivers/net/wireless/ath/ath11k/debugfs.h     |    4 +
 .../wireless/ath/ath11k/debugfs_htt_stats.c   | 4344 +++++++++--------
 .../wireless/ath/ath11k/debugfs_htt_stats.h   |  226 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |    8 +-
 drivers/net/wireless/ath/ath11k/dp.h          |    7 +
 5 files changed, 2463 insertions(+), 2126 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
