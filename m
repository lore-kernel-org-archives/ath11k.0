Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C67C43214
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50AF60FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D50AF60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDBe7zU6gQbX9KL3OhX56h6eNt9IexNvlGUB2q7Kq3c=; b=rmTwLeupWG8ZYJ
	6XE99/kvfE85J6AqhBs6Lq3TaXU9nfp5GfDr0Ez1IRDc3kGCLIKU5kMXPqC6ZqeTgP6wD9SIQFwV3
	i13aq1Ttnu1/ZvZ4XwTLlFvDV0wUeweMqde40GluBo/Z4epDEXvWU+7nMQ2XXCCXHUNTFuvdcH9L9
	+/Ohl7tBpoXdnTAN2FapHpcBdvuI6wLWLOUFlxRcTUmMiHB9EjVzJfqA8qUZo455d9gdQw0zldUYK
	tmZouZIu0TXILSUIdWBB+eLTFAmPDxMgOh7m6g5Z9RbklkIPb71JTuX1fsq5Ch2XJsK7DVbfWJcFE
	2qBRix2BfMk8/EFMLqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNZ-008Z7A-Vc; Thu, 02 Sep 2021 05:35:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfNS-008Ytm-Tz
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:35:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560908; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9gSGz8zPNFyGR2n0P44qKCJtAumjLBinCPzX+XYq2GQ=;
 b=etp+Y9RBDG+ZJi15dIaGqH2TYfNyp8vO4mcRA/ottKHkwLD5ZX7Pbu3yt8cO7s/3McuYfm4V
 TIsAUSSQ7AKfrmpv/JOaopxvlWHwUOeEtLd2K9YCA3HITjQrRZ9ibJqANDWJ9Y855zC7K+bR
 vo98j4O2YtWE0gs+r0tDBJY4UvU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6130628897222b4b5b13b8bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:35:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8EE14C43616; Thu,  2 Sep 2021 05:35:04 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF9E7C4361A;
 Thu,  2 Sep 2021 05:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CF9E7C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v3 09/12] ath11k: remove mod operator in dst ring processing
Date: Thu,  2 Sep 2021 11:03:37 +0530
Message-Id: <1630560820-21905-10-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223508_458601_2BD62D21 
X-CRM114-Status: GOOD (  12.30  )
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

Replace use of mod operator with a manual wrap around
to avoid additional cost of using mod operation.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index f04edaf..7cf9e23 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -654,8 +654,11 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 
 	desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
 
-	srng->u.dst_ring.tp = (srng->u.dst_ring.tp + srng->entry_size) %
-			      srng->ring_size;
+	srng->u.dst_ring.tp += srng->entry_size;
+
+	/* wrap around to start of ring*/
+	if (srng->u.dst_ring.tp == srng->ring_size)
+		srng->u.dst_ring.tp = 0;
 
 	/* Try to prefetch the next descriptor in the ring */
 	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
