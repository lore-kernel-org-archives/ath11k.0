Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B189C5DF9B
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY7bftUz/AICMv2zegq1aZcyBsBdoVDaK+uvy3SJacQ=; b=bxdEeHfSqoMw8AEKvSBaeD2/7Q
	sTlKcOBKk1Qn5ufYJDZjAcCJqsrCFFcVn2rI2K30TslfmLqtMzMnCCqYx8milEPbggOcOMA66SvyK
	CKqANNKRkeo5jtwvbzh86zVFnRmRun7lkV9ap2ZDwZe6BIW0m5d++g7NIxayoVVenBsYGFc0en4+F
	g1eC5vhsd7vEjpy5tAe+W9A9DB6E6PuWzdCEbaakWt3av1CZI2XyfY3xLHWggonk44Wpm9UwbGhlQ
	RcUwbJqkqUl3t5NO03SgIUBpzJyxUuEoUClliF7wwPYNonl7tCKeJl0cqnsEtfXLI8O93pKWQidRO
	KrGSn3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbN-0000000GlzJ-38Lr;
	Mon, 24 Aug 2026 14:24:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbH-0000000GlsD-1LFT
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:40 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c160420289bso519648766b.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581473; x=1788186273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oY7bftUz/AICMv2zegq1aZcyBsBdoVDaK+uvy3SJacQ=;
        b=zgPrJBQ2YoMyZM+hkVEJSaDUkatwVk1ifGRYtAE3i63bPLTDJqcAxxWNisKEp8VXsu
         R8S+FaJtZuSfAW8KRxKQfFEIHhzIZfLQntZCeE0QsKofnox2fuwAQ+djbdWpjuaLfb/Y
         tHpkEVd6DNeyQsPZH4X8jXh9r/oEeZw1qFhGvCWAqTRYt+zt0TkF5Mn2K1ZSUn7yl+eq
         fvOWZZelYdbGNZxZ2GvkiJX5GP+qvK4HrcmQqmLyGJnI5xhZR6Tfygg6O5GXq9ESwpxd
         z5/Bo+Jgxi9kWi1F2YpBHpEUom0BaJ5O3HumaRGqrIP/TLTtOQeHxroOumGS2bEynlsd
         Q4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581473; x=1788186273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oY7bftUz/AICMv2zegq1aZcyBsBdoVDaK+uvy3SJacQ=;
        b=pH+yJULnLZKFOpn7+MhHGD99ckSX40trOTvzYXHeaUvfRc0U5xHDBnZL8zx1Bnyd6v
         MukEGO9YVKcAs0fEcg8rmwc+8vQftwfRykYkTKlKre+14mHiS7jnssnZ9zrtI4Mt2/Ic
         MJ6aFaGRzJgFbu/dMgasgb300MYjOPonuVQRvNLZtwXT1XYJ/X4N8yWKzgksKXPzVt7z
         iQ1X/3jC+ohk9+XPSfIwYq/gPBeNWP1dw3m2E3td0ox+fId8/dLm2sG7EpolGxZ/2W2k
         iZEmN5q7lByjSJf3Lt+ja/tHcm56lRK4khdlfdPOsfhzeq3LN9rvaSn+Kipsegn4Eiqa
         izEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqUUqk8nZVeuUu0cqacDcb/rJndXIU0ATqXCRsmxwvXNudlYzBW9+dnWtPR8HiZvP74wZ2dTc=@lists.infradead.org
X-Gm-Message-State: AFuF++lDTbhh4bdy5wROb/PKoKN3gbw+BRgM/akZePD0Z9puX73NkjsF
	MS7gP/fasqIgUt/bSju0Qb9aRJulmZfTPU9y8Rv6rD1EWXF1n596B3Wj9lZgiKHr5w==
X-Gm-Gg: AR+sD13zPJ/jE7AuJ+TLUJ6/JTzhF5WYx6trZiIfdZ6wU0Tzgr8hL6XJDm6qyN4ViMa
	BoihzBNfkeBplXU26vgiox2NIsTDc9idbkIDt2Pz3UE5BDH7dcjPUjX5NLICiHLmyVKADLnb9uo
	hbM+CVrDJFNMgi1KCWMcrO5IQyfi6GmjsAsmy2yotaDy6x/IPkT3FLuFJwqY3mhC7DMKAMUuTlM
	TnnHKg1GQAc7q3oAKK0B3oyAaj0NiSO6kDx9nS53biZIZTrivj1HF4Yn5kSZfQrxi7FWIS5dORl
	AWIeXoALRP5da1lm88mvr7UQYXJaZI9i7yeJenqHcNbCDj2zOyLPy9b5TZ+vDl4KU35ygRE11u0
	YfkffkDrlqgL856M8MMZ6LH/IWDsPioz1WHk3VuZa8nBV9wMx6/357visnOWrW2KFlh2cDeCf79
	45QtF8ovFBDbTLx6OtmrQQiZ5Cj2rSoxPaE4shwGozTShV+lMJ0jjoC3BxMe5HZiXQ5OblZTjcW
	R/liL86Yh6E7CkaAWF4bTMZ6BcucIsIyb2v+CvUoCjtX21b45qCY21C8da3rYXjH1TYCY0mIhzT
	7sPMxx4GhzM225Qt/MwVzahWSuAqOK+/vazZnKdi1sOHHjieP6mPAJxptzK1Ps+hE2uhNklETkZ
	9saF8e0TlQs0w6CKm9dqGS7GuRFnoDbUKLNJZfMY5TZ88l8kfieUmQt/QCiB2vdoM1DB9rwrO
X-Received: by 2002:a17:906:9f8e:b0:c19:5572:d234 with SMTP id a640c23a62f3a-c246a4ac801mr3371725566b.1.1787581472385;
        Mon, 24 Aug 2026 07:24:32 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:32 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Mon, 24 Aug 2026 16:23:47 +0200
Message-ID: <20260824142350.1757379-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072435_434705_E762E97B 
X-CRM114-Status: GOOD (  17.06  )
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
ieee80211_tx_dequeue(), and the airtime it is waiting on is only returned
when the hardware completes the frames already charged to it. ath11k starts
a scheduling round only where mac80211 calls the wake_tx_queue callback, so
once the limit binds, the backlog moves again only when one of those events
comes round: most often the next frame from the network stack. Under a
saturated download the arrivals keep the round running; a flow that has
just filled the intermediate queue, or one whose sender is waiting on the
acknowledgements behind that queue, stalls for as long as it takes the next
arrival to appear.

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
index 52c4a9924a31..e706ba1077eb 100644
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
+	 * what an airtime-limited station is waiting on. The arrivals that
+	 * would otherwise start a round are themselves queued behind that
+	 * limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios)
+		ath11k_mac_tx_push_pending(ab->pdevs[i].ar);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 342b38308468..150b3a1a9c19 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6583,6 +6583,16 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
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


