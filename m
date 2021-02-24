Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F40AC433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 09:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D378364D74
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 09:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D378364D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eifCzEzn2cyuAWHRgPEN6fm8kds4jBjuy52nazgWuGE=; b=LgTEKfyRj5CM/TD63RTqiGtmCg
	ex4YZekDNtHhYjXoH4AOUH0T7PUAdyoBrwlZBrddOR9kNSvfmYNMVgtain6uWKufENjnw5wF24MJA
	ao2dWNM1Yu7Q2+kZtdzKwdS9xTwxGYD6nVwG3mLDWginoIxHfdatUqWUba6EqyS171jWSaawmgFZV
	9emT3SAPhHspozrF6P+oX7RN9yfG9Vtx+XeAu+d2NVscgrgm2jI+5OZi7groQpwnJaKK/g4O5d4tn
	C4S6CJST4+BXHhMws1YkmlAAW4SgOvdMcUiPy9vsEI2Ufy2sxNC0gVJfBfItjPk3OHj4qikeIJC9J
	sc8WdxXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEq4h-0008Kq-KF; Wed, 24 Feb 2021 09:03:15 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEq4a-0008KH-JB
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 09:03:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614157389; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=YRxvTR20LHpJd1ZWsBssRKEezPu9/gSPDA1gGcTYECU=;
 b=IyIUQcnLd2VB+DTu/ONEQ2beCKDMAaJi0RBpyeIaFI/ZcFnZJqekjfkepPy4EFNnaO+z2/1K
 ubnla39ojK+jxTuH3DcMtd4edJ/ljkyqj4Z7wPmwo9bhKTYGazpJS0mSalgau7HTfdcaQFYq
 Y2vHdWhEikFxIzUo6JcFTM/eybk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60361647e9080d5ff79daf07 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 09:03:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AB782C433ED; Wed, 24 Feb 2021 09:03:02 +0000 (UTC)
Received: from checstp253621-lin.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srirrama)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BD7A8C433CA;
 Wed, 24 Feb 2021 09:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD7A8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srirrama@codeaurora.org
From: Sriram R <srirrama@codeaurora.org>
To: kvalo@codeaurora.org
Subject: [PATCH] ath11k: Update signal filled flag during sta_statistics drv op
Date: Wed, 24 Feb 2021 14:32:41 +0530
Message-Id: <20210224090241.3098-1-srirrama@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_040309_746218_7514FEFC 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Sriram R <srirrama@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently, though the peer rssi information is updated to station dump
from driver sta_statistics mac op, the info doesn't get updated
since the NL80211_STA_INFO_SIGNAL filled flag is not set in station
info. Hence update this flag while filling the rssi info.

Tested on: IPQ8074 WLAN.HK.2.1.0.1-01213-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index de6c132..6c4049d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5610,6 +5610,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 
 	/* TODO: Use real NF instead of default one. */
 	sinfo->signal = arsta->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 }
 
 static const struct ieee80211_ops ath11k_ops = {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
