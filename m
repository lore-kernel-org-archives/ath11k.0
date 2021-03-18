Return-Path: <SRS0=hMZx=IQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0A1C433DB
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 22:10:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE74E64F4D
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE74E64F4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X3QGctoJa4xC5tFROaasdjdBY/1ry0GbtWvmxc4s54=; b=apdaAYBxu0qs4qcfOj2yjyV7Bg
	ZCZyefokGjDA/7j7F30Bk17XZitNCywRligCj7qVTn0anl0Z89RVVwpDOYOc9K+fdeqjR2tY+o6C7
	/A1UTQ7rMcVLoeuP9DXUeKynyldI4GQx58vifpW9srksVAct8PGolpKBF/VALKNbiQcwnaSHjnOW+
	xYWWsf78DQNwsLhGyYm/zl3lz8jyZUVd3jDL61Eqd44s17+QoRwJkmukDUH+788L/9DT+s4Ceux8D
	aO+URm05wKD03ZSeSGbSeUZ9agR/ElhOeCtnZy/+sDyEc69AHpdaDoyZcLZ/nI7pbL7ErNg9+K9fR
	+CE6Rjbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN0qa-0066at-Bb; Thu, 18 Mar 2021 22:10:28 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN0qU-0066Z1-LV
 for ath11k@lists.infradead.org; Thu, 18 Mar 2021 22:10:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616105424; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YsoJ4yAAbS2CMjSA6qjntVx9JJnbMWjZKmuNW8/Fl5s=;
 b=SDBvE7hns8Rsx0OHPcLk1Pl1Ky5swL4AKr6002HsCaeUNNRS76Zszacgz+GnTtpZJ3VUIN/Y
 2iV4VXiqRc/+F+DXacDdJnLAITli63g/j4nv7ARPC+LGJGd/xf1bieOXtTVlnQjYGJGy7vxI
 IG2WLbcxJb780F19zjsDbnf98vY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6053cfbfe2200c0a0d67802d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 22:10:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C59A3C43463; Thu, 18 Mar 2021 22:10:06 +0000 (UTC)
Received: from pradeepc-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03D6EC433ED;
 Thu, 18 Mar 2021 22:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03D6EC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pradeepc@codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
Subject: [PATCH V8 1/3] ath11k: switch to using ieee80211_tx_status_ext()
Date: Thu, 18 Mar 2021 15:09:55 -0700
Message-Id: <1616105397-1482-2-git-send-email-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616105397-1482-1-git-send-email-pradeepc@codeaurora.org>
References: <1616105397-1482-1-git-send-email-pradeepc@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_221025_012709_1364F015 
X-CRM114-Status: GOOD (  13.66  )
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

This allows us to pass HE rates down into the stack.

Co-developed-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8bba5234f81f..99fc54ee6a78 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -417,9 +417,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 				       struct sk_buff *msdu,
 				       struct hal_tx_status *ts)
 {
+	struct ieee80211_tx_status status = { 0 };
 	struct ath11k_base *ab = ar->ab;
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
+	struct ath11k_peer *peer;
+	struct ath11k_sta *arsta;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -483,13 +486,23 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
-	/* NOTE: Tx rate status reporting. Tx completion status does not have
-	 * necessary information (for example nss) to build the tx rate.
-	 * Might end up reporting it out-of-band from HTT stats.
-	 */
-
-	ieee80211_tx_status(ar->hw, msdu);
+	spin_lock_bh(&ab->base_lock);
+	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
+	if (peer) {
+		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
+		status.sta = peer->sta;
+		status.skb = msdu;
+		status.info = info;
+		status.rate = &arsta->last_txrate;
+	}
+	spin_unlock_bh(&ab->base_lock);
+	rcu_read_unlock();
 
+	if (peer)
+		ieee80211_tx_status_ext(ar->hw, &status);
+	else
+		dev_kfree_skb_any(msdu);
+	return;
 exit:
 	rcu_read_unlock();
 }
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
