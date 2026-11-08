Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BF606A33B
	for <ath11k@archiver.kernel.org>; Sun,  8 Nov 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d1RCV2tX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PImsTz+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=; b=d1RCV2tX88V8O4znu9V0QG9swN
	Ia3+JOygwoJThYHRuGEDQf2Da/uhF0iUcspGUuug2a09CKmvkSlRBse6cPBJ+KEWfUcBMZJrW9cux
	EgDsSIgx/pUGjdHmEA+7UdrhEkCfwPBsPzrGff22DzSyZDTW2jz27+XpAQBubwRQ5p39EVz2y554Z
	z70iz+ci2+jU9POrxjemnPOFUxzTpIJpLe7laIUZu5qBHy0G3u8XP1goPSZ2DneUfGi4bS+6xOHIx
	dZ0+kvFQDLUNjukCVl5noHj01MxNaSRSc6JSdRnizAYnx2IZIcxrIoFw/1tXCPVHLc2ssYJF7Rw0N
	0NN7OyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdn-0000000GrOK-2jd9;
	Sun, 08 Nov 2026 22:45:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdj-0000000GrNt-2s3q
	for ath11k@lists.infradead.org;
	Sun, 08 Nov 2026 22:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFA896190E;
	Sun,  8 Nov 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794177930;
	b=ysOBs+CfakkD2RB/fcoss23Md4g+45fv6Yc9+wpsj/I5BCx+6zi1GGo/xyCF5QK2IFK0
	 3rL9walbz1wp1pfGH3uZOtjliCBAoPfzDD7ISofN4hvMXmw2FwkvtaJ74cB1Zzp/fGhbT
	 Yj8+GZxSnYlZZEJzJvpCNWcJksBqXd86Wzdl9gggzeuoVC2dkKYyg6LY0FVlDBE5zExq1
	 A/WLwTieEiFL/NdtCYyTtAJG5DqFKSneWxQl+sqmei5cb1kqmpQeKY1qco7XXrSCeKo7+
	 1oOLPYdnSF4owxJU3SoSwagA5JnwPmWjlGn1AskTMeyN8M8iSOQnteTyRB2TdIRUMtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794177930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=;
	b=qNmjMjlS9zH4YfGEXtu5ETDNmVAt89A9FQbDM3a212dhRZs2StXu0thFJJkzgKTBzOVi
	 jmEEQ+ag0/4uh5R70RMG99Sl6BA+t5DL7G24X3dqkDJI9qT0d0i9XDMzFoNjh8SfvBZvF
	 p9tfj9pWQg+WK9EspJj6ncvH+UMn/tWlm8fbcPB1vpAkvHfabMUei8Ts5mO/wJm0PbDhn
	 KYtE55MWhDOOyDdZrM2wdsGCo/pO64q8DzbAegxZHEX0WGWGBPGfaipiysF6F3tQlRxGF
	 jbYOT0+GrNbZI/qLRuyELubMVaeDlury0ywBBWS3h1+YGhfdKQfp0Hy/HkLNYyE2nug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8F0D1F008A2;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177930;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PImsTz+UKUiErx8Oynny1eLXteyzqZSoBHpQBa0LPdggogiY2ZHBnWwIA74EUw6XT
	 SrrM++7M7IvRVZQhsQ/xaj95bkIeETSel7/peBWWDXV50AeYC+kUlhmst6V4bXsjl7
	 L86v/FcH+eE8D39/fyNAKOoBE8Kl0HjHvobBrlNugtJ83SEz/ecuZ74RY3t2xKeOhH
	 JxqQlUm7muYMkH/Bel9WNjVIvX6qcVJsHMR7PqdhSZ4zMmQJUPxF4l/xtq2rvOhCu/
	 TQskN332uEjOvVs7epcLIzfemeAWFFdYdROAqmvsaLVtupOCmQ35AFuMIlN3U6DLHa
	 7ZyhkThi7TcGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5D05D48149;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 16:45:30 -0600
Subject: [PATCH 2/2] wifi: ath11k: hand freed TX frames back to mac80211
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-ath11k-tx-airtime-v1-2-f1a02b2372d4@gmail.com>
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794177928; l=2978;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=LxmAWWQQMXKfa9BFouDf1RFN1i86hWWxom/cJtre5Wc=;
 b=cNphVJyht4nkuTRgBAVpaPIEhB8Jxt69T6T6drzPgx4QO49b0n7bTI32gsZAJSQOLCoTMwTIo
 Izs1MLT8TqsC3FwonV6wpLsVF/puiiY/yt1NrD/6yXp4McP3rOLXgrW
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

Two paths free frames that mac80211 handed to ath11k with
dev_kfree_skb_any(): ath11k_dp_tx_free_txbuf(), for TX completions the
firmware releases with REINJ or INSPECT status, and
ath11k_dp_tx_pending_cleanup(), which frees every frame still in flight
when the datapath is torn down, also during firmware crash recovery,
when mac80211 keeps its stations. mac80211 never learns what became of
those frames: one that asked for a TX status (a control port or
management frame with an ACK cookie) gets no report, and accounting
mac80211 keeps per frame, such as the pending airtime of AQL, is never
returned.

Free them with ieee80211_free_txskb(), which reports each as dropped.
In the pending cleanup do so only while ATH11K_FLAG_CRASH_FLUSH is set;
outside a recovery the hw may already be unregistered, so those frames
are freed as before.

The change, this message and the test were written with Claude, an AI
coding assistant.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b6..6c2be57f3ae72 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1013,11 +1013,17 @@ static int ath11k_dp_tx_pending_cleanup(int buf_id, void *skb, void *ctx)
 {
 	struct ath11k_base *ab = ctx;
 	struct sk_buff *msdu = skb;
+	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(msdu);
 
-	dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
-			 DMA_TO_DEVICE);
+	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
-	dev_kfree_skb_any(msdu);
+	/* In a crash recovery mac80211 keeps its stations: hand the frames
+	 * back, so that their TX status and pending airtime are reported.
+	 */
+	if (skb_cb->ar && test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		ieee80211_free_txskb(skb_cb->ar->hw, msdu);
+	else
+		dev_kfree_skb_any(msdu);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806a..56f474d67f72d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -303,11 +303,11 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	}
 
 	skb_cb = ATH11K_SKB_CB(msdu);
+	ar = ab->pdevs[mac_id].ar;
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
+	ieee80211_free_txskb(ar->hw, msdu);
 
-	ar = ab->pdevs[mac_id].ar;
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }

-- 
2.43.0



