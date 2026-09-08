Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F548C79F9E
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPdLShOxqlTto6fsSHI/vFszQMvhlliVKlymqNv97DI=; b=cw0n4WXQSWuYD7Vl59u3TyIBtl
	PDVzeotfsErjmuj9KCsytOe5SOt9qC4Am7BTcmP+rGdKQciAqRWpyHsY74vIyUJZ09Y4VN1FBOETE
	Zk44xwLHAFspor7x75oUOsPbWndhsQvEGFEFrw5pExgiW/gJkhVy/HYux+GMcmvQvrVCLgM4WhC5d
	7W9ewmlPOgp+W0B9yTjoiJ2kKsT91DCxU/I9eWdzlA1Ne3ef3YDJH9fm4cYzbqDu3o50MhfYp4dlC
	MM/WWTWDEjIuJ+KlX7zLbQfDDuj3v8BtGvGeDZzLSYLCFgPkq4IVCcUifUlBGv/hy/AXVBHCDosl7
	J3bWUixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009BqK-2Lev;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGP-00000009BlX-20RT
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RPdLShOxqlTto6fsSHI/vFszQMvhlliVKlymqNv97DI=; b=DcyuS6EqPcz3XaQ3yfn9JhZCeS
	oAoDDVa2ODQvsYxbAjd0caD7AGVq5u1fezd6yyDA2yeUnbg0Qq9nTXFyfC2hItdZ8ulcBpIPFnpKY
	fy3s9y3+Eu5STzuPqXp+fL+M5dxjyxX110INsFq3IID/R/9W76ONeDq1rvFpXEPZNqF4a4xZqrZvb
	0V9TaAf1MKwf4LrwUiMyNwYHfJbN++6pnUZ9ilBUVQfYKi7ARNwekNqBGAE2f2lwdRgPoy9mtKE4r
	WhotQ5kmzl3xXuGqeIbR8X4i7RGThqqGLbkCXGPmyRPFZ4R2y7bPbwKd9B25SD6xJzl2zfnvkg8AO
	OrZ2DCOg==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGM-0000000HUjD-2iVG
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2531f453eeso652530466b.3
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875605; x=1789480405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPdLShOxqlTto6fsSHI/vFszQMvhlliVKlymqNv97DI=;
        b=b/4kIRIfqslNb5IvVlenTlq+qDSnge8Jk/7rCk040hLqRucFPtKtVxbc5JUttU9RPY
         D2YwMu3rJTOuUOWFNsnDQGHddbdn+hZMDbCOXeVRMIXWnRdjSpRWAQVcd42MF0KQcGNP
         rvQ4tkyePX49lJNnnwSmOR5eMKH2pGONj+E5UElGm8kl8S/cK6vkfcampMgy7iw+YJSL
         qd9YVtjbrHw0xbY01Qn71JvmeSAxuCEddqiUr4AY8Sj/lrBSPOQhDFH0vWS7qvUbS/ua
         MLAHw2b3UhuJiYbCSe0rMFDyiM02F9esCMnjV1knGo9Sk73q6cWu9bVzuRBEjPyFkCQM
         pV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875605; x=1789480405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPdLShOxqlTto6fsSHI/vFszQMvhlliVKlymqNv97DI=;
        b=H2p9qN0HMmbaCfNeEhmseWhtbKiiFNKSkL3Kx/1pYivYfFxIib48fF+6Mf6JYNNL0w
         JsKam6mvoDn7p2Q6mHIlwZwK+UcIGVUj276WdvtKn1k8zlRxDmScPPZxiij0Xb2z1JdG
         jDj6oFDcJoVEijcKL5HfHzQXAMKSOCkEsFv3fxqmBrAfIVVxa+KsDTJNc+J4nt7GBUYr
         BfEHe5csmamKAQX5PSMBBd105wnlyUrQk0lhA0E/cCDW94fQtTBQ6I2MioLSx3naB49c
         J+45uoGxzhAiHU/zvCNU9iZhUj3tzl/x5JxREu5NLog0z7LoGO/eFaLTYnW68RSHm2ne
         NKqg==
X-Forwarded-Encrypted: i=1; AKwUvBzQUIAMz1VnGyl8qSNFVo4Yj7aj8/Y4Ew81hnxNiWlX4cyLsz44WZXwwnKBuNsHvbm8uazjrDQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mAVTjYqeGXVX0Bbmpw88JzzhelrBfJ7PulV7j3xSDrq+5NjkG6
	Q5iNyC2DQIyWRZDPSkBFTCkr6NtBDqD7XoAxrU/L/khmoSIn6Z9FeCJ9p5zDiot7Hg==
X-Gm-Gg: AYBFou2OHlCkmlDmX/UGdT1ji1RZIY1zrKqOakfr62uTLRfBLNQj+5rZkp+sFZHkMSD
	Q3hy9datjEzSGVff225LW4wXpQ4kvj7hcaVksZUmTX6V8g86obd5v/8MCG50PfxYce0cz3mL2kj
	TYe+vn2OIue1ohmnf2amKaGiXTnUFvTmbApyazMAhQbiAf81aROSUQ/BobZJrfD7Z1wVzwdV6Or
	L1+z79U4BMpRnnKfnsi9DobN2lTFCm6AHc+lzG1vNWONGhVhMVE4ghXA2CDy4optZgRH0fY8JPi
	uSiS0R12VxcgCPQti1s8HN07xJR4WuC2ESelk9f0CZySCtCNYnxY5DrEw8mNIHT5HQ2oCbhvxkk
	plGpNegoeS7cRnEbJwY+eQ4w9i1UldF4MiGM9UNmt48tWadUyKMN/0azxrIbDrA+oG0Gplb7E4m
	nfYNuANcZksgb7xsvDFp9VPXrI1HW3VVt34sTvjwpqBr+juge2wr+ymFFfS3JSNzGuWXUFarHKs
	OampCAAlmLW7v9bpB7rfoYn12BRCoyjo0AjfdpRmwBhkQ1q3ru8tqkeKq5QRDTLhB63NrfMQ6G/
	5/Hje79pzLjn4yXGsWPzVmecJTxGHEvWYQsl79Yes3cedofuh+9PX+nlNM/RrY7EU3u18Od4Uw6
	AdjYS41klrlMvtmczoosihgAvkgHv6N6w7J3EksN6OLZXs1rQbNDo03nTtjW5EBypRVe/lfD3h1
	sTouG92R3TBdja
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c260c8e77fcmr2400016266b.9.1788875604992;
        Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Tue,  8 Sep 2026 15:53:15 +0200
Message-ID: <20260908135319.754140-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145326_850181_B12BCA7A 
X-CRM114-Status: GOOD (  19.34  )
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

Start a round for each access category a reaped completion belonged to,
on that radio, at the point where the airtime has been returned. The
airtime queue limit then bounds a queue that is refilled as it drains,
rather than one that is refilled when the network stack happens to push.
The access category is the queue mapping mac80211 stamped on the frame.

Measured on an IPQ8074 AP with a TCP download forwarded from a wired
host to one 1x1 VHT80 station, BE aql_txq_limit 500/1000 us, 20 s runs,
three interleaved runs per arm, download rate and the RTT the sender's
TCP sees on that flow, mean and maximum:

                    Mbit/s               RTT mean ms   RTT max ms
  with this patch   100.8, 101.5, 100.6  27, 26, 26    32, 31, 32
  without            93.0,  99.1,  76.2  26, 27, 94    66, 36, 347

Without it the download moves only when the network stack pushes, and
a run in three stalls until the sender retransmits. At the default
limit, which binds on this flow as well, this patch reads 101 Mbit/s at
48 to 55 ms and the arm without it 80.7 to 101.1 Mbit/s at 54 to 79 ms.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  7 +++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 52c4a9924a31..70d326fe6a1f 100644
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
 
@@ -756,12 +757,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
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
index 342b38308468..ffb6b865c2df 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6583,6 +6583,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 void ath11k_mac_drain_tx(struct ath11k *ar)
 {
 	/* make sure rcu-protected mac80211 tx path itself is drained */
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 59f83c7175fd..d577c5ca249c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0


