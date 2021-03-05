Return-Path: <SRS0=UBD8=ID=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC50C433E0
	for <ath11k@archiver.kernel.org>; Fri,  5 Mar 2021 23:04:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D1D6504F
	for <ath11k@archiver.kernel.org>; Fri,  5 Mar 2021 23:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D1D6504F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2XjsxadDO498XjFfv9uZA6Q8np8YKfDYvP+Ph+hHgA=; b=VMs0IoejpiuaBJml93L/81DJcJ
	/QNcHM/tFdf3iZI0jV1SPR1fiTRgQ54NY9ykj3J92azzZB49+t1KK4iOy1DAScdlkiy1+63kFqstW
	reViItjkqRBTMxITElyz31sL0iS9C5EhWliIN9BFiU6t+JhqDFej+Wce7CDwn6HPUd00Cf1z8GOqC
	0fumtmoNSVQW0bVip+VCDsYdJ+XpVwchY2CwTPN4IjLXiNiWeHHNeZCPZlXl6XvL9Yo7vSqgvWOSy
	e759pd8femKbuZvsGWmmCROgRClCnD6nNASqQi50qmZIZyVcazYG/5z9i861mFzVa97RrSLEN86vB
	t5fGSejw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIJUL-00H0FU-GP; Fri, 05 Mar 2021 23:04:05 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIJUE-00H0DD-2L
 for ath11k@lists.infradead.org; Fri, 05 Mar 2021 23:04:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614985438; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JMSkQDbDLCxhtRQlVe8R4q0GM/5dq6kNMpa2Xg/8lPA=;
 b=a/hjoPCGKchUkHFHbBGnNivZsbu24bKfFawOtLSKenWFJY46X6pUAglO9pvXIAbOesKhShoZ
 VB4W1uEDX9vKzYlfFhs7+jZmyflQVzsEozFmE398ZaSKYlJQ5poJh5bnYG+c8S+33LR9cphp
 4k8LLoSR33EHez/b3IGxJNpTRiY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6042b8d37b648e2436e17a5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 23:03:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5BFA7C43461; Fri,  5 Mar 2021 23:03:46 +0000 (UTC)
Received: from pradeepc2-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6099AC433ED;
 Fri,  5 Mar 2021 23:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6099AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pradeepc@codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
Subject: [PATCH v7 1/3] ath11k: switch to using ieee80211_tx_status_ext()
Date: Fri,  5 Mar 2021 15:03:35 -0800
Message-Id: <20210305230337.23047-2-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305230337.23047-1-pradeepc@codeaurora.org>
References: <20210305230337.23047-1-pradeepc@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_230401_868599_02C6E144 
X-CRM114-Status: GOOD (  13.72  )
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
 drivers/net/wireless/ath/ath11k/dp_tx.c | 26 ++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8bba5234f81f..9b636b4e8521 100644
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
@@ -483,13 +486,22 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
-	/* NOTE: Tx rate status reporting. Tx completion status does not have
-	 * necessary information (for example nss) to build the tx rate.
-	 * Might end up reporting it out-of-band from HTT stats.
-	 */
-
-	ieee80211_tx_status(ar->hw, msdu);
-
+	spin_lock_bh(&ab->base_lock);
+	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
+	if (peer) {
+		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
+		status.sta = peer->sta;
+		status.skb = msdu;
+		status.info = info;
+		status.rate = &arsta->last_txrate;
+	}
+	rcu_read_unlock();
+	if (peer)
+		ieee80211_tx_status_ext(ar->hw, &status);
+	else
+		dev_kfree_skb_any(msdu);
+	spin_unlock_bh(&ab->base_lock);
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
