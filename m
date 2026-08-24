Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70997C61CE2
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aeu9v09Dg3phc4FovHKp090dH8CPgvA80R9sY0ggepc=; b=BbyXdmWVbZkLJ1uRhwMmtkORrf
	6hJuml8uWLxyKtJI34Hd03KlqqhmEX3lb7hx8JzH3aAiDYlYO2pDQkcQ4sDnBXRthcszfzNZsrhEj
	yvtWiXeY8jnMrPgo/sOWVNJQdNXx8cQJ7ARfr/fKFXmwjvmikKlvuSSHXqzC5/ht1I5Tny2e4gbML
	+2TS6XXGTLuFcKQLPSHlOvL1U1HEvrW/nVQLzOPP+5G2YqOilrQSQBmqmabBU2UQCKLBWnMRG1FdY
	9bkL1gL6eoKFyK76qSFHr4Zr8VoqVGzZiEPJZa3VVcS/TLbmqVkZ8mwYLjnVM9wxGK1UbtasamX3B
	R26mfQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKh-0000000G7I8-0QGF;
	Mon, 24 Aug 2026 07:43:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKd-0000000G7Aw-2NPk
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c1c26d7e951so460501566b.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557378; x=1788162178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aeu9v09Dg3phc4FovHKp090dH8CPgvA80R9sY0ggepc=;
        b=QtcAoqmSdhW6UInfBp8v/1h4+ag/NxoJQrGo0oshAE5M8SvxLiTk2HXh6X3ztV1kvl
         GdZGkZReqg2p7bvSQMD0fPwxwmTkXRtKIB3Ha1RR/Yv2Cex9Q41MPriEgVhMt8Kgh4w0
         pvuzl17ERF4rHdHTGp3qRvHnkyXyzFGLd0w4u1vhycI4vFrg9C7iGePkq6OzziyGFgRg
         oRfNawubIVR2rAWl2VjsZFxSiEnJlQ/60MkUiiwmgOhW4VOp9T8FY8IN+z3G5nCewdpn
         OTwY6uDG0NNv37uiyY0l6kSi+aWqwngjNaT9DhRU8LExeb8tRH89z3XMa73KlBr+fD6h
         BsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557378; x=1788162178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aeu9v09Dg3phc4FovHKp090dH8CPgvA80R9sY0ggepc=;
        b=Z7n3KfHn/ZvWiVmWaB0GPYdYoUF3VLwuEELJh6Z5Ksm+42026ISeudsox6WbP4malK
         KXM0S2w40AeVIyD7ZW9iNhqfnqM3hMPCGuamlmMo/hrkMnQ3t7cRMweFWB5uwpdfz1rw
         Q6qLNjLDZU0Q1fqcS3R+mTw9SioIrIsTT+lDdBdOnvQdr5fWr6ObPLlLfZr+KcBgzr0T
         t9raAzbR8lUjk18/rIlKx7YeJzKQxWlv1JL0pAdEhY4bH9Rng0R30nQ6cC6ik4iP5Unt
         a4WBNb5R/YGX01OIBW4G2SRpXm5h54+IuhDxx+0fvLUeYEPaRrs28SmrBYGum/6/cPj8
         TSWg==
X-Forwarded-Encrypted: i=1; AHgh+RpM9+GvGdBN4l6QTF5HW4P8RW2egbrO/C30WTdid5l4124DLXWAIvYnJB6qDVuwbbKFfdr9GsY=@lists.infradead.org
X-Gm-Message-State: AFuF++mn9/py4f+fNRYQVoNmlABrc+UNwBeUrWX57ekJRaGyhKs3aGan
	qkJmD5k6Ef74W0u3DEsGqv8yCC9uYcg/juq1UrXbSIG4MVNXrpjcTmurl64YIwoQOkyS/8bY6QX
	rGLB1mYqi
X-Gm-Gg: AR+sD12OIglgcjEGvezGgwj7tU/mxQE796uqqqdUOwGmMDlWeu5bBRPd1ULYBQSI76R
	otASP655YSLDFrPhRpgnEvDYxmUev6Mq1npPPaOIG70CDYDrzNQ72iMAuMLEm3baH5oDsR/Kt3O
	HHx1wqIV7QQFVfY7LS58LWNaWVFE1ZSHHp7tKgFag39imVu5RYUfiK1z4IkGDn4tArrsEHRO3Np
	qjQBAz3eFcnS6CeOEpgQUkG1nT0GihuECsRPHvnNjBsgi+OvHHs3alRUGCcB+dtjhs5yVv81Vs+
	fgI8l5+pi+tjEQmFgO6edQLAuQZHZtMLG0K1IRqy0oSu4wFeJ6tS51ZBpDc/JOm9WSjId+wMIIF
	n9x4H/A51Uh5M30dCOupH3b1ljhu7zoh3MAiUUNYL7UoEYqF6sgwStLNvZ+81RktijwYSwJAS/D
	2HX+8AHwGUJ1bvyTgncOOaORIUEQmIG3CmjNC7/S7leEAVAfLnwYM6j5SQljisFd7wBFJ3TjDBA
	eOJzZckygKkyWg5LIyOTouAYwd17EVk9n95GaOVA3WjbnXTxKsOj5xL88y6nphKd91JckBivWKu
	RCxIjOzX2vhJ6y+WEpa8dMAPw7EvapLDeyLycamSgRPblybCWkD9MRLs5QIZuKGfX3WCVnb/c3O
	f2ACWtdMpfbBUPzrLoyww6vy0EfahXCWkkRdhD5i72Vwe6YhsPGaNI0UaWhtLhSfCH/v2mcKqCS
	vwVNZBjbcVR6Bk0ITSTzv3vZzs
X-Received: by 2002:a17:907:6094:b0:c1f:9c3b:96a7 with SMTP id a640c23a62f3a-c246a6269d2mr2635539266b.17.1787557377479;
        Mon, 24 Aug 2026 00:42:57 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:56 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Mon, 24 Aug 2026 09:42:25 +0200
Message-ID: <20260824074228.2114579-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004259_694733_B920866B 
X-CRM114-Status: GOOD (  17.90  )
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

A station whose airtime queue limit is reached stops being served by
ieee80211_tx_dequeue(), and the airtime it is waiting on is only
returned when the hardware completes the frames already charged to it.
ath11k starts a scheduling round from the wake_tx_queue callback and
nowhere else, so once the limit binds, the backlog moves again only when
the next frame arrives from the network stack. Under a saturated
download the arrivals keep the round running; a flow that has just
filled the intermediate queue, or one whose sender is waiting on the
acknowledgements behind that queue, stalls for as long as it takes the
next arrival to appear.

Start a round for every radio whose completions were reaped, at the
point where the airtime has been returned. The airtime queue limit then
bounds a queue that is refilled as it drains, rather than one that is
refilled when the network stack happens to push.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 52c4a9924a31..2270b2079297 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -694,9 +694,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -756,12 +757,21 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id, &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station is waiting on. Nothing else starts a
+	 * scheduling round once the arrivals that would have started one are
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios)
+		ath11k_mac_tx_push_pending(ab->pdevs[i].ar);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e5b2a5e56a28..996f421b6957 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6582,6 +6582,16 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar)
+{
+	u8 ac;
+
+	rcu_read_lock();
+	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++)
+		ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 void ath11k_mac_drain_tx(struct ath11k *ar)
 {
 	/* make sure rcu-protected mac80211 tx path itself is drained */
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 59f83c7175fd..4012155dddb6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0


