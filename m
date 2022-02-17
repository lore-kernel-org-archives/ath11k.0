Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF5FC433F5
	for <ath11k@archiver.kernel.org>; Thu, 17 Feb 2022 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWyXywEp5iW/lT1To6EO/Y8n22R1IhOqB+2pnbI9Rmo=; b=ex62K7co79ezFH
	/gkv8jGKSertyDALWTdCqEwwUl0QWrzHmy3xED78srlzZDB24JcV9URJV65bLUYo79NPPI1l2ERrF
	QwnQ9c2qKo1lI8naBvzWWx7apCXpHF2YHCimyiNrr7rGLt4xkuY7mzjQVvakoHejGR/9NUVE8jEHM
	FgTZm3kkKdZXQinI0F5ABHyd53DeNOeDRPfCPNTLI0bGGLHXIZ2kclfp0TaXS2q5NpKQi6G0I9oXf
	hbTP653Z4UdJdfhLYVBWUJWqxC3hp+QSHaiGHS4WZljGVNBTmcaA8Ex6bVJTH20MtTRhxCCeSs5Zy
	OP2Lh9WFwBw9LQBBPHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKVU6-008ele-K8; Thu, 17 Feb 2022 01:21:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKVU3-008ek8-QL
 for ath11k@lists.infradead.org; Thu, 17 Feb 2022 01:21:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645060883; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=HpRE/Smcxl8NGQvUYyDEXcz+rmnjQcxULXnXoKQ73H4=;
 b=r+ioYUA78sTltEQKN0DqmHE4aRPVKinJ9S5pVv5FYOdEnolEBRNduW0YJehhWgcD9pkLiksY
 zV7MyBvaIe2sFGs5Ue1yxUdy5irVDj7CyoWGdzJQ+8GaNj+aiiRY+0Iz38zuqV1ZqyIMH90U
 R+Vl13snUbIULtwWwlNvl4j6xuQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 620da3123047cf1c0a5f14b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Feb 2022 01:21:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9D389C4360C; Thu, 17 Feb 2022 01:21:21 +0000 (UTC)
Received: from pradeepc2-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D864C4360C;
 Thu, 17 Feb 2022 01:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5D864C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
Subject: [PATCH v10 1/3] ath11k: switch to using ieee80211_tx_status_ext()
Date: Wed, 16 Feb 2022 17:21:10 -0800
Message-Id: <20220217012112.31211-2-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217012112.31211-1-pradeepc@codeaurora.org>
References: <20220217012112.31211-1-pradeepc@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_172123_926143_9A03AC9E 
X-CRM114-Status: GOOD (  13.41  )
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
 drivers/net/wireless/ath/ath11k/dp_tx.c | 32 +++++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index c7d7631efa5a..6f553a870e70 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -519,9 +519,13 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 				       struct sk_buff *msdu,
 				       struct hal_tx_status *ts)
 {
+	struct ieee80211_tx_status status = { 0 };
 	struct ath11k_base *ab = ar->ab;
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
+	struct ath11k_peer *peer;
+	struct ath11k_sta *arsta;
+	struct rate_info rate;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -584,12 +588,30 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
-	/* NOTE: Tx rate status reporting. Tx completion status does not have
-	 * necessary information (for example nss) to build the tx rate.
-	 * Might end up reporting it out-of-band from HTT stats.
-	 */
+	spin_lock_bh(&ab->base_lock);
+	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
+	if (!peer || !peer->sta) {
+		ath11k_dbg(ab, ATH11K_DBG_DATA,
+			   "dp_tx: failed to find the peer with peer_id %d\n",
+			    ts->peer_id);
+		spin_unlock_bh(&ab->base_lock);
+		dev_kfree_skb_any(msdu);
+		goto exit;
+	}
+	arsta = (struct ath11k_sta *)peer->sta->drv_priv;
+	status.sta = peer->sta;
+	status.skb = msdu;
+	status.info = info;
+	rate = arsta->last_txrate;
+	status.rate = &rate;
 
-	ieee80211_tx_status(ar->hw, msdu);
+	spin_unlock_bh(&ab->base_lock);
+	rcu_read_unlock();
+
+	ieee80211_tx_status_ext(ar->hw, &status);
+	return;
+exit:
+	rcu_read_unlock();
 }
 
 static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
