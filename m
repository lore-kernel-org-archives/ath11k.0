Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A94CCA490
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXMAmZymA97+atQA0fvJYHm18oUeUxxR7xGhCvjS8eo=; b=jT4GqwuSe+SuVuf6JOlnvkNpz2
	/g1eAvu91FpNSW1t5eTBEA8SqbxoxMo9f/8FjGIqJprxfC0Bp8O5KCgk/Ecta07hChydjyO9V3E1T
	HyifpbnfJPb3Af/yLDAFCBJh68vPSYqx4KmQ4dy7moZzFN/C9+fIC7NqECQsPO4g813ovHX7GoNhK
	6eyaGUf8B+qL3GIRBFN3eLNaz1z5yE9bypkIxpvVFHtIT7Q4RigEEtJf6Sa0BXZsGLFVwjgF1079F
	x03kY2P0GQGw33kL76M1rWBUpVOhYPK7pRvfHFvrN1pXYbGuEbQdeRYy8XpgRpKvTXXpPQL3LBdv/
	5GQYCT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0f-000000067En-19Dm;
	Sun, 18 Oct 2026 17:49:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0b-0000000679h-3pBp
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c445c95d553so9675266b.1
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345760; x=1792950560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXMAmZymA97+atQA0fvJYHm18oUeUxxR7xGhCvjS8eo=;
        b=m4+JjMG8xvHouRchd8zGwUOGbiL6/u5pGCaNSUIpECJl+mbNb/nut+ewTvztg4T2PI
         l0IcTrocabWQNeK73pak7kvuYC6U5XLXpxaUORZIkKXD+hKt2gxDyzwjioXjM5hooQsh
         E5sqC957upKXmctEWe5IsgWw9JkOIvV5MJZFfx5efW7vaN6Zjq5ymGRYBV8ZaFGUowfa
         Mjt7WUi7VHUqyRybHTrYQVehJxUXKkib/lLdOXg2FHexgrgyr4ohXiiAwyVmS4LPaq0c
         BSsRj6BmxTfLXxwLJvp6sm4EHhunzR1yxFMZiLoUm6qpOHZjtoEqBi9O8kbmz0QNAacq
         CyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345760; x=1792950560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXMAmZymA97+atQA0fvJYHm18oUeUxxR7xGhCvjS8eo=;
        b=hAY83xj8YrQPL7zvOeKRZRH9HN1ZQ18AkBjqawPQ8j81d7ixd3rR+ZHd4NK7ZtB6VA
         Rx4C0V87nphEBzoucZQgF3pLYpB0Dk3EWE3TR5Sz9BXlHKm3GyvSmgpZvDSJnAmWj7Qv
         kw9BgKrZgvpnP2OmWka0e+SOzvP3xduROX2tlHTaiMmN0vsammDOiCHR7aGSMWFtq8KQ
         47VZ7SZ8v3IHcvt59XtePq89WLNgYaiLMOeuMGIEfkoYF00Xc95sqUxZJBheQCXhAqr6
         NyLKs5jz9EE9mXXDZpaGgtTo47hW8R/vUgXjyjn31lbRmbDm8238QOKtYfgRn1fegE+O
         BwLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGOuHeChvAp7sd4jay1YqrinBk5ePc6UBIF2n0fp8cJyLUh95I/Z9KIhxFtBOqTrH76kQhvfk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJjIUli2TyrCssnnqrt1bTPHSCWuvKsGKEaEFbOqNNLhgq9yfJQ
	9woZnGckxqp9Rn/j3fXsU4qgF2g9zAonu5D0+yr5qHc6d/3IaOGOMqGL2frlHt3sFQ==
X-Gm-Gg: AYBFou2IjQokrEz0hM6lu+o233hRkj2JVb/StkjtW9HConKg5SwO95JAAJ5mWLsVmoW
	huilzAyZVIwOaFQ+3Bi+L8cBt2O2t5iPxaYpLM8HEQ/7kN1wNPAtsmkDXT9fiktcdeyV8DuFWi0
	D2/2SNZFszKXqWQkK7hEi9REa9ril4liJ1hCnGC/mRIqrkZskvniasqyRPJivET86ynm15x7Ri3
	1XlttZ3V6/PV3lSVW06QXNLbKRxHlpBF7+HyvpDA4cHCl/XpRm3ifgrIEIanxDanHa4Jx16eFL3
	92g3JPIJUneQL+4ekL4BDzpOfnhKoONfVC+MjQEz6djrgOnILuL5ZD+AatyWMW+44HC7OhkZRbH
	tp450EKetY0p1GIIceQnyhemE9g9/DBmX4UCe+zkZHx6U852VXcK+qNbJnsEZFA+hj/eViLWjKo
	k53IoLUt1XxdBfJNqlAbOnjh3nUf41VDjNEbEI9EmDYc8/OnG0bBxJdBCfn666MpbagK7H8LR80
	16nHKx9A+uJD8TZBvGNL0fKdjmqfFlK11Um9+1htN0F1SqxejwvREmLpwh1uYgMbR4Heg+Y5tIg
	yvTx2kyhxV/tQLzH+cowIxQ2+/ZDXc9gAXSpy6d4IAom/fl8tiZpC3wIeHzM/Y6aP/dtFFqVc0P
	GmLZYHC0nOMc+vW3mqz17mXX3Yy3ZiPVB48QRLxomVoAZvH7H8+3Yhoe3yLzobq44l/WJBkX/Zj
	jaiYgWlaup
X-Received: by 2002:a17:907:6d28:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c419d34faadmr385413766b.9.1792345760009;
        Sun, 18 Oct 2026 10:49:20 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:19 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
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
	toke@toke.dk
Subject: [PATCH ath-next v5 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Sun, 18 Oct 2026 19:49:01 +0200
Message-ID: <20261018174904.1757161-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104922_524968_7EB0D1C6 
X-CRM114-Status: GOOD (  15.71  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

A station at its airtime queue limit gets airtime back only when the
hardware completes its frames, but ath11k starts a round only from
wake_tx_queue, so the backlog waits for the next frame from the stack.
Start a round for each access category, taken from the frame's queue
mapping, that a reaped completion belonged to, whether the hardware or
the firmware released the frame.

TCP download from a wired host to one 1x1 VHT80 station, BE
aql_txq_limit 500/1000 us, 20 s, three interleaved runs per arm, sender
RTT:

                    Mbit/s              RTT mean ms   RTT max ms
  with this patch   94.5, 94.4, 94.6    68, 62, 67    126, 135, 121
  without           74.0, 78.5, 72.4    28, 27, 27     55,  40,  40

Without it the link idles between arrivals, which also lowers its RTT.
At the default limits both arms reach 88 to 95 Mbit/s.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 33 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  7 ++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index f7d3cf0ff0358..5bcdeeb7e65ad 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -286,7 +286,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    unsigned long *push)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -307,6 +308,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ar = ab->pdevs[mac_id].ar;
+	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -316,7 +319,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath11k_dp_htt_wbm_tx_status *ts)
+				 struct ath11k_dp_htt_wbm_tx_status *ts,
+				 unsigned long *push)
 {
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
@@ -339,6 +343,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	__set_bit(ar->pdev_idx * IEEE80211_NUM_ACS +
+		  skb_get_queue_mapping(msdu), push);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -390,7 +396,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 static void
 ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 				     void *desc, u8 mac_id,
-				     u32 msdu_id, struct dp_tx_ring *tx_ring)
+				     u32 msdu_id, struct dp_tx_ring *tx_ring,
+				     unsigned long *push)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {};
@@ -415,12 +422,12 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring, push);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -694,9 +701,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -740,7 +748,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			ath11k_dp_tx_process_htt_tx_complete(ab,
 							     (void *)tx_status,
 							     mac_id, msdu_id,
-							     tx_ring);
+							     tx_ring, &push);
 			continue;
 		}
 
@@ -756,12 +764,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station in that access category is waiting
+	 * on. The arrivals that would otherwise start a round are themselves
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
+		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
+					   i % IEEE80211_NUM_ACS);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 226e1417ffe74..4527ab6977d04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10156,6 +10156,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..b78a357b5472e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0


