Return-Path: <SRS0=F7Ac=LR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275FC48BC2
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 21:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1025961220
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 21:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1025961220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2QgiUQ87hTyL17KY3Wuhf49cGfoCuYpbvylYxpimvhY=; b=r1Cc8OY9sKtqbz
	bs28/w1UXQsyYO9K/XyvS7p00UHBka/5KUWTyg9CxPMxAsLmjp0ZGNkaeRJmcTiOyH7t8OXRLMrxY
	micMc9Gwx3W5mi0H0JlHcqvQYjtD2emsdjNlvlI5BCczWv/1mgpvJtRk1YLh6IJ+qiu/LQzFT5+1d
	PA4MbGjZbsoMiYGycaMVCLqV/Tzdu56uJT5CilJ2hkuQrIFu5ZQaF7MS/vmYL9hgQpdZatSt2q2Yo
	lp+Q4AP791BiBQ1ibvbQ/uTq/3tL9EiOC/ff/TY8nHevYo0gOLzkWZO/U6AM3fQJThlnA3ko3O20V
	QlpGeRSaEyKOoEWCU4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwAUx-00C0nm-SL; Wed, 23 Jun 2021 21:33:27 +0000
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwAUu-00C0mb-Ro
 for ath11k@lists.infradead.org; Wed, 23 Jun 2021 21:33:26 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d90 with ME
 id LlRm2500721Fzsu03lRmLM; Wed, 23 Jun 2021 23:25:49 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 23 Jun 2021 23:25:49 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ath11k: Remove some duplicate code
Date: Wed, 23 Jun 2021 23:25:44 +0200
Message-Id: <a65952db7f4eb8aaaa654b77dcd4930482f5c49b.1624483438.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_143325_117020_24917B89 
X-CRM114-Status: UNSURE (   7.91  )
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

'ATH11K_HE_MCS_MAX' is 11, so these 2 blocks of code are exactly the same.
Remove the one that uses a hard-coded constant.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 603d2f93ac18..9a224817630a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1406,11 +1406,6 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	 * Firmware rate's control to be skipped for this?
 	 */
 
-	if (flags == WMI_RATE_PREAMBLE_HE && mcs > 11) {
-		ath11k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
-		return;
-	}
-
 	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH11K_HE_MCS_MAX) {
 		ath11k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
 		return;
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
