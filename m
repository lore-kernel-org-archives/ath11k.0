Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2913C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC3FF610CE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC3FF610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0U09RdL3Gj/bnwdfNV+pniG8/s7EqUqp47jsNKJCXf4=; b=iqpqWiG+azTgmU
	TztcdL0EybvoKaQtHPbkG9mcd2QM1PZT67Dt1N+ULvfSsBw+/oa0Q0g9D5et9PJ1p5K5nvLIE+2Hu
	bXt2a/o8koSukmywibl6W2p5llqzrdMhpmpJtbR3z+Q51D1daV0bPl0QJsKtTHg4RLTE03izdYiAP
	wzZHz/vMHkM/z//c6mUGvYvYWb1ubksJ54ir6bkt6dfX1nW5mpvnAEXDDGYqRW1GmXLjQivfl1+bw
	3gWlnbc6Bhw09Cw/IkDA3Lg5L1XueW1qg5ajbVhdABjSM2s8TrAnY8qk/rE7507CO+7kOnwvRy/Lm
	NUXgWXWSESKHtpvqmbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpN5-006Aj9-7F; Wed, 25 Aug 2021 09:38:59 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpN0-006Ahr-V5
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:38:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884332; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hfIggJzWOJSfgAa8fE1YMGiYCif8u9049esE/unfi9c=;
 b=T4lvbhLs1mis1PfO5WpWOathx352n4knRLeLR+N5KAdlwbAVUzRIDpIbGVp3n6HpasgrCw5W
 8skTJ4n5TAwGiDSA7os3t2MTssntoLstKIdZ0dRQb4FRgN6/nbE3sSC9Q+bjqS8POO5kO85f
 2dWBV8ReZszRZeoIP9tRoCOFVEw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61260f9bcd680e8969973bdf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:38:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 38BC8C4360D; Wed, 25 Aug 2021 09:38:34 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 30A09C4338F;
 Wed, 25 Aug 2021 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 30A09C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>
Subject: [PATCH v2 00/12] ath11k: optimizations in data path
Date: Wed, 25 Aug 2021 15:07:45 +0530
Message-Id: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023855_088149_1E3D6F7F 
X-CRM114-Status: UNSURE (   8.05  )
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
  ath11k: allocate HAL_WBM2SW_RELEASE ring from cacheable memory
  ath11k: remove mod operator in dst ring processing
  ath11k: avoid while loop in ring selection of tx completion interrupt
  ath11k: add branch predictors in dp_tx path
  ath11k: avoid unnecessary lock contention in tx_completion path

 drivers/net/wireless/ath/ath11k/ce.c    |   2 +-
 drivers/net/wireless/ath/ath11k/core.c  |   5 +
 drivers/net/wireless/ath/ath11k/dp.c    |  48 ++++++--
 drivers/net/wireless/ath/ath11k/dp.h    |   1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 205 ++++++++++++++++----------------
 drivers/net/wireless/ath/ath11k/dp_tx.c |  76 ++++++------
 drivers/net/wireless/ath/ath11k/hal.c   |  35 +++++-
 drivers/net/wireless/ath/ath11k/hal.h   |   1 +
 drivers/net/wireless/ath/ath11k/hw.h    |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   |   2 +-
 10 files changed, 219 insertions(+), 157 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
