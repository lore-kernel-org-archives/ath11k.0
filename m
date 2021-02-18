Return-Path: <SRS0=1e+W=HU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D242C43381
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0D4660202
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0D4660202
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J9YO6dXCQ+d1QjXqa+w5pxQIv5w+F/LY68Z9jCuGl5Y=; b=TJ6o8Sr6Be++z7s2Dqv4mxItGv
	B0o9gHnCLbapGtBSU8z890M0gRd7+Ir0m2rSrmumnCgBHdDXdYVEOx1I1p5iwKtPEDVa1mBEqTm0r
	oSbTth5qPm+BciTr/pTrDKk97SyNtmn0Uk1ARoJts7M7A/Fa2RlrN5NpG5OLXwMJNsS5Tkrk0jdgO
	3UAf3XzD09w6bjdq2r6heXzTHCa5H0lIzkcO6DZr67SDGEKwpRZvG23VXRRyUztLtCX+IhkfhoTuD
	/mn5oPOhjP8+eHFf48JzpDwgwxQdhP/9uPLb0Ud+sS86dGWWTb3/VtFd3Hr+qOyRZ8m/c7CSmpUzy
	8BmxVp9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCd41-0008H1-HH; Thu, 18 Feb 2021 06:45:25 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCd3y-0008GZ-0p
 for ath11k@lists.infradead.org; Thu, 18 Feb 2021 06:45:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613630722; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5DgHmOtgch1c2Sh6U8sVa0mpMOodaVWrZfileUSaFo4=;
 b=lIH8cUI0KpYIKeYTj+P6DhbrnKJWdQXUeK3xEawbOIWAF2P8ic+/c/t2IfMghOHXGvBhirNy
 jhQdRzI07fh1CQjYVB6r71/xO3ZZ8ti2nrkt870LC/If5n5OUkBDecpA2NjJyemh2yWTGaLQ
 O4GZb8HnOU2fNSEm8q9iFL4QMqo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 602e0cfca294c935b75455ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 06:45:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5B817C433C6; Thu, 18 Feb 2021 06:45:15 +0000 (UTC)
Received: from miaoqing-HP-Z220-SFF-Workstation.ap.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: miaoqing)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11587C433ED;
 Thu, 18 Feb 2021 06:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11587C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=miaoqing@codeaurora.org
From: Miaoqing Pan <miaoqing@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: fix potential wmi_mgmt_tx_queue race condition
Date: Thu, 18 Feb 2021 14:45:09 +0800
Message-Id: <1613630709-704-1-git-send-email-miaoqing@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_014522_791631_25D40F01 
X-CRM114-Status: GOOD (  13.57  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Miaoqing Pan <miaoqing@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

There is a potential race condition between skb_queue_len()
and skb_queue_tail(), the former may get old value before
updated by the latter.

So use skb_queue_len_lockless() instead. And also use '>=',
in case we queue a few SKBs simultaneously.

Found while discussing a similar fix for ath10k:
https://patchwork.kernel.org/project/linux-wireless/patch/1608515579-1066-1-git-send-email-miaoqing@codeaurora.org/

No functional changes, compile tested only.

Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 335d49a..3c1f35a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4211,7 +4211,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 		return -ENOSPC;
 	}
 
-	if (skb_queue_len(q) == ATH11K_TX_MGMT_NUM_PENDING_MAX) {
+	if (skb_queue_len_lockless(q) >= ATH11K_TX_MGMT_NUM_PENDING_MAX) {
 		ath11k_warn(ar->ab, "mgmt tx queue is full\n");
 		return -ENOSPC;
 	}
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
