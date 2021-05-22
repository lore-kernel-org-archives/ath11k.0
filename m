Return-Path: <SRS0=CS+C=KR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05156C2B9F2
	for <ath11k@archiver.kernel.org>; Sat, 22 May 2021 09:58:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941BF6105A
	for <ath11k@archiver.kernel.org>; Sat, 22 May 2021 09:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941BF6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8tW2ddwUjFwazGYnk2/kv2/dKp+D7Y3Pv69PyuY15OQ=; b=UppJE7L/oA4QsbuIVR7cGh5FJn
	rQ6n2PxRlwb40fVQ8sQE+Jqk/nS08++1dQxeFFhGE+kYCAZLDKeJDHBEfRaEqDbDfMzIeKd+kOkji
	NTQGAE3DHLKz1PvwrmwGe4FPuii1dCcGqTJP92FQ/fAC2uctJQfAx/iDML2tyKiXqzPGzkahH2rO8
	ZDQAdyNmuC+poIWx8kMK2mLkl/P1TIG9O/tLQJysKZrpVujhc+Y9JLuNlDzBEDOqfNCIWufOpFjdE
	29oKpwxsg2492nqug2p1ulAs9sbuLpSVI4Zj5co7wz48/Bbzom56qZDnRi1wQe+JEsWmb4EADaTL1
	Dq3Z6eZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkOP1-002Fxj-4k; Sat, 22 May 2021 09:58:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkOOz-002FxK-Ae
 for ath11k@desiato.infradead.org; Sat, 22 May 2021 09:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6ymeZkKOXsAgSgZMe7yXMaLic9U0Ma+obPKDFUgBF/Y=; b=ZSQnBKQOAyuD/95JsaoQ+hjVs3
 BgPxN6cr+IxgPCE+TQlrkTVz5ZRGmKL03/i0fr3SGqqtAd+yteQjR8FUxOiakcwLCNr8AfMp/oY/p
 BypMwXPa+/2gZ675/HaFB/fc22J7ros6TdISSzFnIUu8By74NO9C4evxtkVFpHLVtW89R0Pe4cNyf
 QgteTJ29KAm6/NwltSECCA2JD88ElsdDFbYKut3uGhKUoiF94rlnC2UabnuTtV/TE44fMeoHMqVH3
 iq7DG2ETgvBQuzhUtm8CPRQqWZvvqJsrY5yYR2GE1OtBth5XNjGL6RNeT6d+umnuvSNrF7xd0g8fL
 0E+M9Kpg==;
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lkOOw-0004Ry-IC
 for ath11k@lists.infradead.org; Sat, 22 May 2021 09:58:36 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d40 with ME
 id 7lqu2500J21Fzsu03lqumV; Sat, 22 May 2021 11:51:00 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 May 2021 11:51:00 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 bperumal@codeaurora.org, akolli@codeaurora.org, milehu@codeaurora.org,
 lkp@intel.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ath11k: Fix an error handling path in
 'ath11k_core_fetch_board_data_api_n()'
Date: Sat, 22 May 2021 11:50:54 +0200
Message-Id: <e959eb544f3cb04258507d8e25a6f12eab126bde.1621676864.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_025834_755884_63D188E0 
X-CRM114-Status: UNSURE (   8.69  )
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

All error paths but this one 'goto err' in order to release some
resources.
Fix this.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath11k/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 77ce3347ab86..595e83fe0990 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -488,7 +488,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 		if (len < ALIGN(ie_len, 4)) {
 			ath11k_err(ab, "invalid length for board ie_id %d ie_len %zu len %zu\n",
 				   ie_id, ie_len, len);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err;
 		}
 
 		switch (ie_id) {
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
