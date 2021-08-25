Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD42C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF266113C
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CF266113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwNdrLLvHEH9cyG89viB98SdFnrDhdjWsifK2TtRx9Y=; b=NqKvhHROG6Af83
	5wa+UhkYR+V7Yp93hwFsC/bfUf0Kw5zBJObFIvTIZl5I6JCbbx7WqwRrAfXeFpeQ+VhjsCD/7WWJF
	xo1XnRH6M1yPtRUIxrtFTRGtEsjLGX6XPD7n761O/mR819Sy4iy6wXLAYgh8X/PXATyOcWKsknuwG
	XDBqLIsWNDt92tYp6B+ZF52SzTIiwrdY4GzGGZjIYs22mYizxaSwEE588WDBUAn8zw59iBEl7GQUQ
	pHObxgx6BYy7fHL/lLxmW3sonxFabKdHT/d31oxRm+NZjun9qlnhMJRDOGY3Opr/khhVOgPWFX6bL
	QqiclwVsM9wvxO4Lze/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpNW-006Azu-2k; Wed, 25 Aug 2021 09:39:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpNL-006Ahr-Hj
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:39:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884358; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6ul3VQjvvemrwPdajwEv/+bu8+uIacb+aiWqUebIvAY=;
 b=ZJ0Xv6K2jdBwdc1iYMcORnab5P7rmY1T2ormZWUiQ0YPW64QJk/ie+HFdCAFIsR16IXAeVBX
 L1/6RejGFLld+LJAU1MVvpJ6cWlva10VRtDB8hqyHwNCF4b4TjZN3hbA/CZaukMOlwgbQZIU
 fuxbsBMCcoGjBb/LmeCqLNjSTBM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61260fbb4f8fcf7054e39c4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:39:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C95E2C4338F; Wed, 25 Aug 2021 09:39:06 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A9B8C4360C;
 Wed, 25 Aug 2021 09:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4A9B8C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v2 08/12] ath11k: allocate HAL_WBM2SW_RELEASE ring from
 cacheable memory
Date: Wed, 25 Aug 2021 15:07:53 +0530
Message-Id: <1629884277-18759-9-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023919_097024_006FC197 
X-CRM114-Status: UNSURE (   9.70  )
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

Similar to REO destination ring, also allocate HAL_WBM2SW_RELEASE
from cacheable memory so that descriptors could be prefetched during
tx completion handling.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 57059c6..e4fc2ba 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -239,6 +239,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		/* Allocate the reo dst and tx completion rings from cacheable memory */
 		switch (type) {
 		case HAL_REO_DST:
+		case HAL_WBM2SW_RELEASE:
 			cached = true;
 			break;
 		default:
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
