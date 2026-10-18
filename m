Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332F7CCA490
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS0RADOWk/YlWZLm9ufvki+kHt2Uzf9z4JtPVKhgy+s=; b=wuQSEtUK/Xueywaiy6wtEYioXm
	Fee869ibW0TEPl1smLfUlHm9b9vUm+h+/Cu4kjBHQW5RKDMH97JAhrwGxqcvH846Ii3VOn8JqtAas
	6FYcr8ZX1jbUICVljkx1fHn0nCm5WvkWZwzRI26cpib2AkQ6EKyNcgRv1yZnxDsLEjcz8fxGu3Sd1
	N/Jv/sHPM/irnrrdZC1IOI2lrZD+LRBx4JRLQA4A1+bTI1rnxCKaOXoUDBVY0qxCKCmDBRmqiWVBj
	Y7oY3NsgMf4QtyxCZQkiwnM13EXavmz0FXOVy8lXIBdC6IU3XiVvo6FhNh57gvil83A7KWjgSfGx5
	YRDF3NAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0m-000000067O7-2YUD;
	Sun, 18 Oct 2026 17:49:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0g-000000067ED-04Dn
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c418e215671so161276166b.0
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345764; x=1792950564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS0RADOWk/YlWZLm9ufvki+kHt2Uzf9z4JtPVKhgy+s=;
        b=qfoHdzRT0SCEUWuQAs3hVuvJ/sLs/d/EqGISTQoeqtsVFXRMEimfKpPB8ry+V4p8bX
         C/M/vG1/0ooU60SIWifdK0Uq5uVd8T8GGK91cGajEI60fY88oqyyh0JFjARUMpU9p25y
         xzxv+CkcyIY5NgePUbwrCFWULcOodRy2U0LgJyZ1r1EAfYf6NMus25SLI9BZqlG4osZx
         /ZOgXWDWe+8fB2mFM7yplKDZaSWhJxQ5D7rwq8+MDXnc8QKTAN1xQBEK4TgqxTVJ1roS
         mRAfBpNzxAwW0ZAnbIGBJ1P/WtlnA1oObclCy8uMSgIJ7ZvGnIw48p5WgLw3iVbM6UAU
         yWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345764; x=1792950564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TS0RADOWk/YlWZLm9ufvki+kHt2Uzf9z4JtPVKhgy+s=;
        b=dGLPwoI+9CoZafIlLeNdkVnntfpytMgWtrbOGMNDPF8rUnWEH2kVPBSdFzxmoDF6Xi
         0sbhajZyujAIyHSCkRhE4EtrxBL0z1Sz+F6JliB5UO/00WUKYW6GoIAIZ12g1onz3Mml
         9c2DQXPxcv3rJfxlW1YlpHluQki+u182W8q7oyD4vH3NaGWF/Ut78P52LqaERAdU2e+j
         uprqPRRXwoSUhUnYSwVSwT+kPLuwBblUCUl6lgHT6xfJcLxEp4mlJnTu7t4o/+dPMaHH
         dtSINkbKfde5fLmYrkl7eMYp/nkB4DHJsJzjllf1riEwVatJ26nMOlIsIanNf7IIgaBI
         u7QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSNzXV6y4OXlbGMFGXRi2n3fRtMdGD/+Lb2ZAiuaQbwItXum5v894qclAr3uznSiQnLzcwb/U=@lists.infradead.org
X-Gm-Message-State: AFq9FYIuP9HKuWVlV8f1HKosIn4K2kv6h+34C0isbe/k4TLJo1MEJyOx
	7TrRxeMZDKTug1AWzYhGlIO4jMA7/KTIV/XrOIjK6TVCVsiaVmXm5o943fAgfIysFw==
X-Gm-Gg: AYBFou0Y6H7013LwyhGLA7U1ru6KF3vZ7gsn5N38FH0ngt339LPhx+gwDf2vgTPXprc
	miSWXysedcIE+8wZQp82UNjOX8EhD9ePqJCDcZGK3wyGfYV3++jNwOlYl2OPenpq2QBJ6wj9pSq
	4sRKKAG0ElWRnUFtRqD8jfBMYs73nzqMA2hpgCT1g2dtunZMhestCGcCASHFf3hNeUC7qB4jMA9
	uYi4G3cU+sIK3BKC80u0oFRc41CvBsJFFKKC8e3KvH82isF9hbKTWYTFYZpufIXygnkrBI/wBRx
	yicekUZBZr5cZLdS98bpChAHYPqWwOaC4yTEEsMh+KTCFbgUOHWkMCbhiR6O4agdqmogYcxWt3U
	eBptYnnshq90MHurEaWyrV2I9yvRHsz7F6EAW7AW2ihzUDLsRP7ekSwZdgPbjuLTGqOsrfY598n
	PwA7gl9916JR4zMEAkaCGS3Y8AZwFCPTLaME5aXp/rz7+ZRcHpn/gtyS+Ro+DOV3XBHEhuxPH8/
	uEZYsZBMmLBv4PAyobH4rPCeepPJytDfYKmXuGKq9ws+SJu7R/VkIqGB8029LiLIYGIW5RSkYml
	hAg3PP6bjAC84wz0ip84jFgeAPIZKYqx65VkWoHdLRqITpk9jtrRXetJA9J9rcE8cuk6yGdmw2N
	CJzk2jatH8M08AZE2yKXTJ8gonPkpqDpWHwoIyn79zh9I4mXxNdnqe0WNbq0vPwewEFFYyS2kPa
	kaNxgI2PYi
X-Received: by 2002:a17:907:3e05:b0:c29:7953:6c06 with SMTP id a640c23a62f3a-c41a04f115emr341294666b.49.1792345764353;
        Sun, 18 Oct 2026 10:49:24 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:23 -0700 (PDT)
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
Subject: [PATCH ath-next v5 8/9] wifi: ath11k: stop a scheduling round when the hardware refuses a frame
Date: Sun, 18 Oct 2026 19:49:03 +0200
Message-ID: <20261018174904.1757161-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104926_080357_83949296 
X-CRM114-Status: GOOD (  19.74  )
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

ath11k_dp_tx() returns -ENOSPC when the MSDU idr is full and -ENOMEM
when no TCL descriptor is free or a DMA mapping fails; it frees the
frame, and the round then dequeues and frees the next frame of the same
flow. End the round on those errors and on -ENOSPC from a full
management queue, leaving the frames behind queued; other errors concern
only the frame. A category whose round ended this way or on a full TCL
ring may have nothing in flight, so mark it and start its round from the
next tx completion on the device.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 ++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 10 ++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   | 30 +++++++++++++++++++------
 3 files changed, 34 insertions(+), 8 deletions(-)

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
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5bcdeeb7e65ad..fb6a43dc45b81 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -776,8 +776,16 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	/* A completion returns the airtime the frame was charged, which is
 	 * what an airtime-limited station in that access category is waiting
 	 * on. The arrivals that would otherwise start a round are themselves
-	 * queued behind that limit.
+	 * queued behind that limit. It also frees the ring space and MSDU ids
+	 * that a round ended early on any radio is waiting on.
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
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d17f80cbcdb5d..6b9cc54a7f5cb 100644
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
@@ -10090,6 +10099,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct sk_buff *skb;
 	u32 ring_selector;
 	int num_free;
+	int ret;
 	u8 ring_id;
 
 	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
@@ -10099,7 +10109,8 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
 	 * selection ends where that limit binds or the queue empties. A full
-	 * TCL ring ends the whole round.
+	 * TCL ring ends the whole round, and so does a frame the hardware
+	 * refuses.
 	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
@@ -10123,9 +10134,12 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 			break;
 		}
 
-		ath11k_mac_op_tx(hw, &control, skb);
+		ret = ath11k_mac_tx(hw, &control, skb);
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
+
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
+			return ret;
 	}
 
 	return 0;
@@ -10143,8 +10157,10 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 		int ret = ath11k_mac_tx_push_txq(ar, txq);
 
 		ieee80211_return_txq(hw, txq, false);
-		if (unlikely(ret))
+		if (unlikely(ret)) {
+			set_bit(ac, &ar->txq_starved);
 			break;
+		}
 	}
 	ieee80211_txq_schedule_end(hw, ac);
 
-- 
2.53.0


