Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322A606A332
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tYwF+GVb;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=C09cE24p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=; b=tYwF+GVbhzgHB+
	bVzMv15zeICPhDXJFalYIXkzsg6tElKy8PB1q4zvX43EI+YZqsBvzuE4YlFX99FzSs5+2wvGzacQG
	wKj2IBxn0BCBAk7LZ1DFPqXN6lm7WqvVCRqlg0VfzWTINi57W/uu/p7B0ZWgCaNUSgt3Z76efYVYD
	aeauWSAJRtyxOujGt2efZrAw7wxNcKGa80SYs51qNCiP+EvDyJ7tORkY/cqQv78QDF2IInc5GnOOV
	xkFW9U6F8cT1pJOpctL5YXC+17t3xyh6yIyEmvFKvFerQhWOv+AFUFb0XApVXYyJFkCqn6hmaumju
	R/umzh9WWKODbCGBFKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2c-00000001UJD-1RTq;
	Sun, 22 Nov 2026 18:11:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2X-00000001UDK-2xrm
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c5126505cb3so327536966b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371108; x=1795975908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=C09cE24p+X3Buax+Rj6g8SyS7z+49VjS7u60bqKJH7n6mZOYfHK0FjMhkvJO7wIhrl
         lq41Az5b3ocJeKGBK1+Ct9TMQgj+DcHzK6S0R7JGuCSZ3edjOlBwmmdlknd8rZ2ygkZa
         lPLxook4CVk1dveZEqfclCD4bvgw+wSCNFQ2jh1NhlMHP1KkT6cTnaur3whJXRouRsYs
         V4ltu3GLItRST/eZa9HFVsfzG6Y5dRJbq3vyHqRC4FovIemga3bRg9g0vIcw5ExGy5eY
         +N8z45sZIjPvSoluKp+uOhMudlT5Qwcb0g1GkAkeYLgS9nHjarUiNgAWEAjmEtt13OTP
         cdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371108; x=1795975908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=i5YHj7cTkvUf0y6vZRpHJ3VeOeL0d7CwpXY02/ubZ5apOan4XspEVmwETGw3RpDESN
         87/HVO6szHO0kt81UCKLTzAZeYNd6kQCXdpp8pNXNga/AKOCogIwW4KPZE4zXmtIK39G
         iA00q/t6yh+OEF6oOf3hxDipTeiCkXWkkIzBHVEFRg0/jfZQmBB6CVDjZDzBi6eav28h
         ceDVfpv+bNi6mWQ/x7WxPexFmGoFows3wGAiWqVPpyRdY0u2gnxCahIMGEp0R+R0gvdo
         gKM/AtElpInivNlB1axKatIMctA2SI930idjBHwBPnhYrxvrSPTXSJAWBGAJnhQNL3le
         X6JA==
X-Forwarded-Encrypted: i=1; AL+hErGlcIwCyYhfJ9QXhvNH/LqK2fD2Ym8344CbSAFh96RHr6iGTX8rWAGyf/B02UxWNEQWoreBcpE=@lists.infradead.org
X-Gm-Message-State: APuU4Z82F0xvn1NahIHIcfSRw1AWdnMRpQY4w6ud3GPNbWT89JH0ohHz
	xeSMC/gZvdYQX+xozA9iznB4cKPwpJVRqMHGBap0yBpAOS/mR+PjpCDFn+7LYDGBsLTJ3kfWLty
	Oj9LlGYAP
X-Gm-Gg: AZFdTZdxEv+ucGbQQaBsv52K2Nc1zYeIZho+jAbu4JVuzLB7zdPnYyW/SVAwA2uDk2G
	kXrOUz2a5yW2JvBVX1djQ+N0JTTOgeXQYKi/4CiH+w3W/eXDa0dKzNr9lY3jO4OojtQrsng9kLo
	91klNay0b91nFAinNkREXVcBZ5fju/o8XMc+hyAiIv2Yn3mRIU5tHpvOfBTMl73ccOXFaT21fkj
	gG4f6P9gFZOURLr1j69jEYYRSQ1DSvDhrFefWUhmvLIQaF0vXkQPF2nd2aZdxIwcYQ7x2nq1eVO
	mhBFFGebKEtf2kkk4BTk8cH275jJXVEN/ry5IdAaD2NqRjNUIbjuexQsgVW35p3FY9pk4jWZfgr
	snAV1xywr65L3iynYIW2JuyfVGlHsPD4pjxb5mTR75Qpqt4FHPy8KjtmRbYPceBudH8HXJWPJQg
	+Igb/OehPqTY7rFGMUQqINs69ImUqJZ8lZR8GZCe1Qag2aqxKPVVXTz3JCgY8rE7NlB0h1Z6PE9
	q0zRtHnCqItFpe9Y+T/rM2IpgiX+JWT4rij6yIP4/YbtEnlHEuaNGDQGDcs2nmQbCPQuJb+huio
	gpRV2HL55jlbCIIqqt1h4Ua+PRpGyp+GzikAGThtzm9Vt99+dy91KZQ1x7o9MOkjzHSkxYT9Vu5
	SrBMbmh0IVcfse+GzouLciZC4Gl+yGXY1oV3nNFXN1snmxp7H2TZabfzBvmtvP4jl/hKd8cH1cM
	gjthc9e43LNvm+Swnyu5NUlyw9N2DlS7HSbQFz0Um17u5a89OsVuWsBcOAPi6siCVAtF/XU59Ze
	bc0sD2LjaNtkAoqVH37cJAe3M2Jn8fi6wXDvW5C2l1yFe91PK+cOL9gKMhRF+2oGIcj6SjEiHgI
	l3fCEOj1UBUoaO6eeylhC9GqS2odJ9FWela36QwuERCIdWjwliJ/a3XPZLpHHuKBb34nabyQ
X-Received: by 2002:a17:907:ea8e:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c513aadb22dmr721786766b.22.1795371107843;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
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
Subject: [PATCH ath-next v6 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Sun, 22 Nov 2026 19:11:41 +0100
Message-ID: <20261122181145.1015729-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101149_775307_8B335322 
X-CRM114-Status: GOOD (  17.28  )
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

The wake_tx_queue handler serves only the txq mac80211 passes it, so
there is no deficit round robin between stations. Run the round in the
driver: walk the access category's active txqs with
ieee80211_next_txq() and drain each through the TCL ring check until the
airtime queue limit binds or the queue empties. A full ring ends the
round, since all txqs of a round share it. Each round holds a
per-category lock, as in ath10k, because mac80211 forbids concurrent
rounds on one category and the next patch also starts rounds from tx
completion. The design was proposed for ath11k in [1].

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..40895d276de5f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -709,6 +709,11 @@ struct ath11k {
 	 */
 	spinlock_t data_lock;
 
+	/* serialises one scheduling round per access category against the
+	 * other contexts that drive it
+	 */
+	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index eca16a151d068..226e1417ffe74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10078,13 +10078,12 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
-					struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
 		.sta = txq->sta,
 	};
-	struct ath11k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
@@ -10097,6 +10096,10 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
 	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
+	 * selection ends where that limit binds or the queue empties. A full
+	 * TCL ring ends the whole round.
+	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
@@ -10110,7 +10113,7 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		if (num_free == 0) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			break;
+			return -ENOSPC;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,6 +10126,34 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
 	}
+
+	return 0;
+}
+
+static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
+{
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_txq *txq;
+
+	spin_lock_bh(&ar->txq_lock[ac]);
+
+	ieee80211_txq_schedule_start(hw, ac);
+	while ((txq = ieee80211_next_txq(hw, ac))) {
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
+		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
+	}
+	ieee80211_txq_schedule_end(hw, ac);
+
+	spin_unlock_bh(&ar->txq_lock[ac]);
+}
+
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
 static const struct ieee80211_ops ath11k_ops = {
@@ -10817,7 +10848,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10851,6 +10882,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
+
+		for (j = 0; j < IEEE80211_NUM_ACS; j++)
+			spin_lock_init(&ar->txq_lock[j]);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0


