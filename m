Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B9EC432BE
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49CAC60FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49CAC60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AF7q4m3tUJ+ohuiRUE4WXw2CtfDi5DEoFfbcsjkJbyw=; b=ZbH13L0oMK0VLR
	vfQroq7bW8bh/UEWuusrv1ubJlDvratYn386V4OvIR2NLZCly5Xi6+92/tjLip+sOjFeq7ADKos9p
	E+ae+Io5VGQ8NGSqCBwj1SPjdZHF5bxoe8k/Lyy109YJZ+oLLH/2VkY5tEOe47dBehc2r29ysik/j
	9hyKCcNFE5gsfTVteWNq4LCKX2McD3bDx7NWjjEh9NcMiD/NlUMJHr1LaUGISR+6GpdBlSvViQMzL
	4B4SpDSD5EYFfNex+4Mgc1/5mOA5WRakt5U+3iYhzxhuXUQwbi1tfLiuP9VghU1V8uFiYvQzy4D/y
	aX8gkbiiD/G/atF6EPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNf-008ZBf-H9; Thu, 02 Sep 2021 05:35:19 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfNa-008Ytm-AK
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:35:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560915; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=T1FfOP3ic/z5mywSoym5oIFae8vGz94xWFL8jTo5154=;
 b=lEi4TkhGqFrol9/eztZbMvYWt1s7Sx83yfPJ+RhP70udUFNVUE/+p0TbEQOrxmszKg8ORdY2
 zjh1dUjZOSSnCOUWZTa5Qc3GOGGZ2YTbd2jfiO43PfkM28WfWd/wj1q4sauOYz7AchjMkN3B
 +QtE7pP0+mWc1iktVs98uG4YaQc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6130628b89cdb620613e6287 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:35:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2BF9CC4360C; Thu,  2 Sep 2021 05:35:07 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A0901C4361A;
 Thu,  2 Sep 2021 05:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A0901C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v3 10/12] ath11k: avoid while loop in ring selection of tx
 completion interrupt
Date: Thu,  2 Sep 2021 11:03:38 +0530
Message-Id: <1630560820-21905-11-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223515_966572_11D1B372 
X-CRM114-Status: GOOD (  12.85  )
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

Currently while loop is used to find the tx completion ring number and
it is not required since the tx ring mask and the group id can be combined
to directly fetch the ring number. Hence remove the while loop
and directly get the ring number from tx mask and group id.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 0278ff6..d553692 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -770,13 +770,12 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	struct napi_struct *napi = &irq_grp->napi;
 	int grp_id = irq_grp->grp_id;
 	int work_done = 0;
-	int i = 0, j;
+	int i, j;
 	int tot_work_done = 0;
 
-	while (ab->hw_params.ring_mask->tx[grp_id] >> i) {
-		if (ab->hw_params.ring_mask->tx[grp_id] & BIT(i))
-			ath11k_dp_tx_completion_handler(ab, i);
-		i++;
+	if (ab->hw_params.ring_mask->tx[grp_id]) {
+		i = __fls(ab->hw_params.ring_mask->tx[grp_id]);
+		ath11k_dp_tx_completion_handler(ab, i);
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
