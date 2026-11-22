Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD860A382E
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYyNjhy1;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=x67PYQxm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=; b=VYyNjhy1ZnMcwS
	QyKDKmUImMnJSofvBmWWajeHRPmJTwdorWTQrKoE5hi+X3Q1FeQ32TskQfhKEzuiddZR+1LiREUY5
	S6BCoRkXcqmKxZInHfAGeO0XOXXBBdGZSjLHTls1robZy1Wg9WtWA0yWi5kiBkZN0rmkSPVnsmSKm
	hEEqcMG6WGq/h4MzD/nKehbLVvFdo/5uqawZSWgGaBqrCLq6pvlPce7ojlMyerZAEdU/1UpSzCn9O
	17SVyhBcDRfJkgrJC0d4NFF9LcvawgxlmfB6nCmdiBxGWIZ3SxPtX02uEqnGMrVd/QdbfHKzkujqL
	QYXVHxPnEHbZFXvsb86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2c-00000001UKT-39Ed;
	Sun, 22 Nov 2026 18:11:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Z-00000001UEc-447j
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c506a231b88so360673266b.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371110; x=1795975910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=;
        b=x67PYQxmaYxUABHepFuKyWEL2SrkdAm+XUIIpTv2Ww2k6QpkPu/4jyRy9PgOHiffMY
         EJvQBd1IA1MvQMbeGPHWOAvGX3QV/07G+zvj8zhy946XA2f4BqpFKy4X75FOIJm+Cbzl
         au2E0OqbZQYFwiOlrfsEDa8sFeoQWrUpUlq5d94LAcOVZdNtQSM0oawa55EBnE5MUExn
         h3S1mcHvqVmw/ntnxni1He7TzuyKS1/KlOuwoSytNfieVgUlClQ+Z6jafwSDWwQXurlR
         axgSDAmhsCYcIwFpoDzF3XJBYXJ3zNlDmQ0cE4Thta5T5JsLf5W3E1e3s7ZxasLykEFB
         E8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371110; x=1795975910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u1Tw1aT0cYq0nfbsxqxhp0yxACH3DD8+q+sLIF8m4To=;
        b=BmrIbXC9zdDFgpzDIeNS22QByXpj6hCd08KGJiH82Q/VbgQj2b2yAvb8/B9TWMi1+1
         8NYlrZloCRB7rXGvCNg7Dsc/rNCCRytvgespdtkpEq4TgNKe8yJsrqYLzeCLUlFHwR/F
         RKpusxQpY0TOyPWTHL0YyC4ZHBLxDzl9szze1Aq2szAOS6ogq55LCWfAZ/IYKDUkrPpy
         GMs5SmE1miCUz654wAJkh2zdjJep4D5Fb2DdxvtIpMrjXAW77ZpB9q21ojwfk1qSYIt/
         HWfpzyBX/QQ8Dp7J2mI49cuhmwv+5jy60SaoWf+IJ1wQ5uobO4aNextufloYogxYUCf5
         IXgQ==
X-Forwarded-Encrypted: i=1; AL+hErHqXjp4FAJxb1YoUxeZTbIYqw15WEurb/NXhpABVVtuscb7cXZto+an6PDXFscOwRSCXvRN7cE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+vCTR9PWxxGJOMwSRchVb94crf4fzO2295XGW6Avznym2gkL+A
	eWP20fa0mnsu8GlEHPKRqkXlJ3bycgDZyzUmhO1IueREbkiJVV5OK5R2cM2yXadDjA==
X-Gm-Gg: AZFdTZfJy5fGS7CUkkQ9kEh2U0Ap52ZZE9vwKxHkFh4p0L4Nt4pbGeuUx7ThPqLP1xH
	a80nP/uj0Juy09uHsbIaZWNiJtXT3ENM69PrGGeL7/l8es0TKygE3wTwDQ9Go8oBTny/AGvgvbm
	RBdAoS4OdvOc5NoxwQZ0grIWj1tLjBEeOiqjKFaZUZ0g/QJ7atK9AHFdQsgJUyd05wPzU2LdRSx
	9M9oQYh/iVNhwG2nplIEFmhUQ4Rn0DTKpS7egHHDT9BaBgYDMn98TjaTvKq9l95EXIiuCKaBbvc
	Ce86K85rwTSnT1UKTNaolkRZ0bXWVwWTRfvgbt+wbgCCf5RB86MFQ26Ts5JK2NV0+FAH7hhKk0p
	ieVa4a0iuCpCPdshFOeQ/SOMtkQSy4XvsAe1hf4t5DKueTS/xs2Szvud9JshdaoPumRp/BjsLFp
	mtKkpwfKs2qP/RCOiBz8fssRfhrQxZ7hW4+Wn3gqu/QUKbBRVOGFzgySEjc7alQ4cDpZsLge4jX
	VhS5+lJ7w+Y+gGJVT2N2tjQXQW+15FgGVzD2m5mCnChJ4dqRMkMNjqwY10sOFdh43J4GQMa/9Mb
	7i4vDT7E+Hp9pV5qfR6Ki8quSyNvL84aVNOeOWvGWNxJCJKSiUzFgDy4Za7/i7tU2Y4AbGzwjqm
	gSLJEgNxoBYkIVLvAumjeP5zaMyhTF2D4GNy9BrUlZZH1Zi3bDtisP683aWKyw5IGDafhE7UYMX
	9no7aOffgQtxRUZxW+pDvWlB017CGKScyFHUnH5wW1AWY6D15n7dCEzFxgwBf42ymZBwouqdbLT
	6sBhQ/2Cjh8FOvRWpWldpxyqH31CQyQAskURJiDNpqYbnHKunFE4L29TmeLe/kn4ZJMEHH2enCI
	YGlrsW0z8hnlL+TE7q99PCG0FB9fMzKfi9S9VVFXgnVzNe7ViFXOnmLEOE14BkZumoVCAz0c
X-Received: by 2002:a17:907:73cd:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c513a614467mr750479466b.22.1795371110347;
        Sun, 22 Nov 2026 10:11:50 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 8/9] wifi: ath11k: stop a scheduling round when the hardware is full
Date: Sun, 22 Nov 2026 19:11:44 +0100
Message-ID: <20261122181145.1015729-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101152_096749_C9B1253B 
X-CRM114-Status: GOOD (  25.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A round dequeues a frame from mac80211 before ath11k_dp_tx() can refuse
it, and ath11k_mac_tx() then frees it. ath11k_dp_tx() returns -ENOSPC
when the ring's MSDU idr, DP_TX_IDR_SIZE - 1 ids, is full and -ENOMEM
when no TCL descriptor is free or a DMA mapping fails. Without airtime
queue limits, as with aql_enable off, nothing keeps the frames in flight
below that.

Count the ids in use per ring and end the round before a dequeue when
the idr or the TCL ring has no room, so a frame leaves the queue only
when it can be sent. A frame refused anyway, because one sent outside a
round took the last slot, still ends the round and leaves the frames
behind it queued; other errors concern only the frame. A category whose
round ended this way may have nothing of its own in flight, so mark it
and start its round from the next tx completion on the device.

Such a completion is due only while a frame is pending, so the round
ends only then. It marks the category before it reads the pending
counts, and tx completion reads the marks after the fully ordered
decrement of its frame's count, so either the round sees no frame
pending and goes on, or a completion sees the mark. With no frame
pending, a refused frame is dropped and the round goes on, as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 +
 drivers/net/wireless/ath/ath11k/dp.c    |  1 +
 drivers/net/wireless/ath/ath11k/dp.h    |  6 ++-
 drivers/net/wireless/ath/ath11k/dp_tx.c | 55 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 54 ++++++++++++++++++++----
 6 files changed, 103 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 40895d276de5f..8b7bfb0cefcf2 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -713,6 +713,8 @@ struct ath11k {
 	 * other contexts that drive it
 	 */
 	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+	/* access categories whose round ended for lack of room */
+	unsigned long txq_starved;
 
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3e0a6bdfa0505..615384a4bb75e 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1088,6 +1088,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
+		atomic_set(&dp->tx_ring[i].num_txbuf, 0);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 6d99501aa269c..bf7439e8b37d0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -85,8 +85,12 @@ struct dp_tx_ring {
 	struct dp_srng tcl_data_ring;
 	struct dp_srng tcl_comp_ring;
 	struct idr txbuf_idr;
-	/* Protects txbuf_idr and num_pending */
+	/* Protects txbuf_idr; num_txbuf changes with it and is read without */
 	spinlock_t tx_idr_lock;
+	/* MSDU ids in use, one per frame between ath11k_dp_tx() and its
+	 * completion
+	 */
+	atomic_t num_txbuf;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
 	struct hal_wbm_release_ring *tx_status;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 0cdc0493f10d2..1c4cb98f89292 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -79,6 +79,35 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 	}
 }
 
+/* The caller holds tx_ring->tx_idr_lock. */
+static struct sk_buff *ath11k_dp_tx_idr_remove(struct dp_tx_ring *tx_ring,
+					       int msdu_id)
+{
+	struct sk_buff *msdu;
+
+	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+	if (msdu)
+		atomic_dec(&tx_ring->num_txbuf);
+
+	return msdu;
+}
+
+/**
+ * ath11k_dp_tx_idr_has_room() - tell whether ath11k_dp_tx() can take a frame
+ * @tx_ring: the ring the frame would go to first
+ *
+ * ath11k_dp_tx() allocates the frame's MSDU id from the ring's idr, which
+ * holds DP_TX_IDR_SIZE - 1 ids and frees one when the frame completes. A
+ * caller that takes a frame from mac80211 only to have it refused for a full
+ * idr loses the frame, so it checks first.
+ *
+ * Return: true if the idr has an id free.
+ */
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
+{
+	return atomic_read(&tx_ring->num_txbuf) < DP_TX_IDR_SIZE - 1;
+}
+
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb)
 {
@@ -123,6 +152,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	ret = idr_alloc(&tx_ring->txbuf_idr, skb, 0,
 			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
+	if (likely(ret >= 0))
+		atomic_inc(&tx_ring->num_txbuf);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
@@ -274,8 +305,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_remove_idr:
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	idr_remove(&tx_ring->txbuf_idr,
-		   FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
+	ath11k_dp_tx_idr_remove(tx_ring,
+				FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (tcl_ring_retry)
@@ -294,7 +325,7 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	struct ath11k_skb_cb *skb_cb;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+	msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -338,7 +369,7 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 
 		spin_lock_bh(&tx_ring->tx_idr_lock);
 		idr_for_each_entry(&tx_ring->txbuf_idr, msdu, msdu_id) {
-			idr_remove(&tx_ring->txbuf_idr, msdu_id);
+			ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 			__skb_queue_tail(&pending, msdu);
 		}
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
@@ -366,7 +397,7 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ath11k_peer *peer;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
+	msdu = ath11k_dp_tx_idr_remove(tx_ring, ts->msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -795,7 +826,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		}
 
 		spin_lock(&tx_ring->tx_idr_lock);
-		msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+		msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
@@ -818,8 +849,18 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	/* A completion returns the airtime the frame was charged, which is
 	 * what an airtime-limited station in that access category is waiting
 	 * on. The arrivals that would otherwise start a round are themselves
-	 * queued behind that limit.
+	 * queued behind that limit. It also frees the ring space and MSDU ids
+	 * that a round ended early on any radio is waiting on. The fully
+	 * ordered decrement of num_tx_pending orders the read of the mark
+	 * after the frame is counted done.
 	 */
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		if (unlikely(READ_ONCE(ar->txq_starved)))
+			push |= xchg(&ar->txq_starved, 0) <<
+				(i * IEEE80211_NUM_ACS);
+	}
+
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9a26de411e83a..f82df5d2f6033 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,6 +21,7 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
 void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d17f80cbcdb5d..a0f1451a8fafe 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6519,9 +6519,9 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 	return 0;
 }
 
-static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
-			     struct ieee80211_tx_control *control,
-			     struct sk_buff *skb)
+static int ath11k_mac_tx(struct ieee80211_hw *hw,
+			 struct ieee80211_tx_control *control,
+			 struct sk_buff *skb)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6553,7 +6553,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 				    ret);
 			ieee80211_free_txskb(ar->hw, skb);
 		}
-		return;
+		return ret;
 	}
 
 	if (control->sta)
@@ -6564,6 +6564,15 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
+
+	return ret;
+}
+
+static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
+			     struct ieee80211_tx_control *control,
+			     struct sk_buff *skb)
+{
+	ath11k_mac_tx(hw, control, skb);
 }
 
 void ath11k_mac_drain_tx(struct ath11k *ar)
@@ -10079,6 +10088,26 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
+/* A round that stops for lack of room is restarted by the next tx completion
+ * on the device, which reads the mark after counting its frame done. Mark
+ * first, then check that a frame is still pending, or no completion is due.
+ */
+static bool ath11k_mac_mark_txq_starved(struct ath11k *ar, u8 ac)
+{
+	struct ath11k_base *ab = ar->ab;
+	int i;
+
+	set_bit(ac, &ar->txq_starved);
+	/* pairs with the decrement of num_tx_pending in tx completion */
+	smp_mb__after_atomic();
+
+	for (i = 0; i < ab->num_radios; i++)
+		if (atomic_read(&ab->pdevs[i].ar->dp.num_tx_pending))
+			return true;
+
+	return false;
+}
+
 static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
@@ -10090,6 +10119,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct sk_buff *skb;
 	u32 ring_selector;
 	int num_free;
+	int ret;
 	u8 ring_id;
 
 	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
@@ -10099,7 +10129,9 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
 	 * selection ends where that limit binds or the queue empties. A full
-	 * TCL ring ends the whole round.
+	 * TCL ring or MSDU idr ends the whole round before a frame is taken
+	 * from the queue, and so does a frame the hardware refuses anyway,
+	 * as long as a frame in flight will restart it.
 	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
@@ -10112,9 +10144,11 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
 		spin_unlock_bh(&tcl_ring->lock);
 
-		if (num_free == 0) {
+		if (num_free == 0 || !ath11k_dp_tx_idr_has_room(tx_ring)) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			return -ENOSPC;
+			if (ath11k_mac_mark_txq_starved(ar, txq->ac))
+				return -ENOSPC;
+			continue;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,9 +10157,13 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 			break;
 		}
 
-		ath11k_mac_op_tx(hw, &control, skb);
+		ret = ath11k_mac_tx(hw, &control, skb);
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
+
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM) &&
+		    ath11k_mac_mark_txq_starved(ar, txq->ac))
+			return ret;
 	}
 
 	return 0;
-- 
2.53.0


