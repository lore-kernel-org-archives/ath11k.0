Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4611C432BE
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942F560FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 942F560FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CuUbHWe8AYNzYkk4nRlPsuIdyOEnkywJbl5Bq1LoWWw=; b=28RtB9rc0J0ek9
	0LOU6WQVIsFHqchUQk4gRItQdS2jlIi/TnOHopgrtQs18mWhAD+RC40AxsLxvQNa4CwvIdidVpPoh
	PU3GkEcwRvSAAptcYrzHzzd0l/60m9rmxWMW4+Y4xbbwUsdliaQxp6DGayLxi9k04phl0I/dVIzbb
	fnfApSMJqo7aDAFq1upjKmqMMx/aVkEE5n1TBhbsD3+q/Eit8unDzDmgTwUcdAlYQGuswrCTXpqRZ
	/7ADo13P1fhMcw0Me0sLfbWnQY5DRDOv5LQ0oFeziQXJ0pQJ/pmIgTF+DxgwSpp0mHBy9TkMp8b1T
	e48aFYFedFh8J7s4raFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfN4-008Yr7-EW; Thu, 02 Sep 2021 05:34:42 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfN0-008Ypz-A8
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:34:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560875; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZYlAM6qs8ju6qwANgzbN+HuD8bJBqDlc+WKuouCbLTk=;
 b=N6IRRtRr6Rcv6ae7FrcHzqyVykZXArb1LOpLJFXAdzOV1usAk5FEDHud5Azz6M8ZU8YFJkIF
 RIaMPpnHag70+PlUr1wwTYdMsjRheDMZwSp2IimL6fRNKMhRlCVzmodwP1kU4O/M3t4OA0kO
 tAYD0RLccY5d0iuyxkRQpPjTL78=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 613062681567234b8c113664 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:34:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0CF93C4360D; Thu,  2 Sep 2021 05:34:30 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC152C4338F;
 Thu,  2 Sep 2021 05:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CC152C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>
Subject: [PATCH v3 00/12] ath11k: optimizations in data path
Date: Thu,  2 Sep 2021 11:03:28 +0530
Message-Id: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223438_467067_3D59A234 
X-CRM114-Status: UNSURE (   9.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patchset covers optimizations in rx (first 7 patches)
and tx (remaining 5 patches) data path.

Running UDP DL/UL traffic on IPQ8074 5G radio showed an average 5-10%
improvement on a 4 core platform
---
v3:
	- Changed rcu_dereference to rcu_access_pointer in
	  [PATCH 07/12] ath11k: add branch predictors in process_rx
	  [PATCH 11/12] ath11k: add branch predictors in dp_tx path.
	  removed redundant check in
	  [PATCH 02/12] ath11k: allocate dst ring descriptors from
	  cacheable memory.
v2:
        - Addressed internal developer reported segfault and avoid lookup twice
          by utilizing idr_remove (patch 12/12 and patch 2/12).
---
P Praneesh (12):
  ath11k: disable unused CE8 interrupts for ipq8074
  ath11k: allocate dst ring descriptors from cacheable memory
  ath11k: modify dp_rx desc access wrapper calls inline
  ath11k: avoid additional access to ath11k_hal_srng_dst_num_free
  ath11k: avoid active pdev check for each msdu
  ath11k: remove usage quota while processing rx packets
  ath11k: add branch predictors in process_rx
  ath11k: allocate HAL_WBM2SW_RELEASE ring from cacheable  memory
  ath11k: remove mod operator in dst ring processing
  ath11k: avoid while loop in ring selection of tx completion interrupt
  ath11k: add branch predictors in dp_tx path
  ath11k: avoid unnecessary lock contention in tx_completion path

 drivers/net/wireless/ath/ath11k/ce.c    |   2 +-
 drivers/net/wireless/ath/ath11k/core.c  |   5 +
 drivers/net/wireless/ath/ath11k/dp.c    |  48 ++++++--
 drivers/net/wireless/ath/ath11k/dp.h    |   1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 207 ++++++++++++++++----------------
 drivers/net/wireless/ath/ath11k/dp_tx.c |  86 ++++++-------
 drivers/net/wireless/ath/ath11k/hal.c   |  35 +++++-
 drivers/net/wireless/ath/ath11k/hal.h   |   1 +
 drivers/net/wireless/ath/ath11k/hw.h    |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   |   2 +-
 10 files changed, 220 insertions(+), 168 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
