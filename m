Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9784C79F99
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=; b=3tSTqy8WdN+oJ8WxVwotURxm2C
	4P/BgxTMl5Q5PGesrD/MuqfyosDDXybB63DrNlJeP6LWYQfZG7QfinFPQFNmRd5taroSmHUeiVdN2
	oxQPN6YOwbsCx8j2TyRYCjB4+TLCNhTAceQB3Dxm7k+RjKy4I6sx2yMevXcyenlPpFZvJoMJ6Xp+x
	U0quDswbcNGc1skEf2/IpVU/mrfV2/rfDrVsSM9hGbDfL528wOzKzIB4gK3DsqkkWe1pM1MJVQERN
	/ETTs0jNSSSrW5GhlV0OW2ptYe8CO9nfNvXIyjo4sa85fUP+YFKgDzXCv5HjmNz/Q0cHanKqLwWY2
	HUBSatuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009Bpy-1kFk;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGO-00000009Bj1-11tm
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=; b=ajIlRA+KRUinoEsbSDyC4E5fA2
	i+cunMQGuh6G1hMzvNZUJlK4dPEJelg0aAz2WVpdQ0+dSSlR1xwOIYAHDjFY8ra6M3ABFYPs8S7dc
	/Ekqng+KtFB4k8h0IbToPa7d2m+gjGAT+5Vo2IC91ZR3SWI5ZsydfzsDY/27P2l1ccgPWMvc66K90
	r1XjANhdWa9dHOkLhbI79OC2T9Gj9GCAQGiRdCsbhv0zdPborAJQu41ASdMBOS8VQo53xBX2zutaf
	0ZRdUIXM7hVyFodurnsjXJGjREBrrC1a/P4JVdmM1HMUzcE/kkSd7+X21A3ICuQFDDmQgZX/QSnSb
	62OKWmCw==;
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGL-0000000HUix-1JL0
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:27 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c2537a164b8so171062866b.0
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875604; x=1789480404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=;
        b=pZDaCGMKf2wTjJCK+rbtCHpLsFztKPrJSqvek0B7zbMNAjqfHNUXPO3xaZv6zDJbCP
         aoCKWS3/3yqLArQaFYQBelJwumS7VDMWOGj1EDMKQCkO/fxfXNp0mYdJ+0ycU76T+2hU
         RLB+/QUxA6L44YIOJw7dNKvqu7h667/I0UiGO5IGmqKK/e5bh1pEkCENVqUBwUNM7/6B
         VsuHnuaRg4v+C2kDFwwslpkSIpece0c+HwtH087C8UcCS6k/+i47wMswUYEbmtNaOPkc
         hMfmywSLboroMxv3++4SGEdqECu3gQub41lWXWKYnLOQ7RwKW03n1hkJU390xbBU8BuM
         E2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875604; x=1789480404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=;
        b=HMVVTXYZ5ht7Zw00tzMWoBzgkK9oV5YNQ7SMsAwuXPvWSFlnoF+RnAiZbKe3YfZSNV
         GiRVydSkoT271vhNsy5Yp+pNyiS1NYXBtQzKwpc8RwXIRAtPEf6EEi9NW/VvJz6mHcf5
         MygPONIpT3BPQOj7lMFkZq/1C9iHqr9Bormcpq4znROaLxvgeZF8gZge4VtBM4/s29nv
         gs6FTwqffWvVOP5mxRAvqdCa7CQwJirmrnYYo4rv7a/fBoPimNagv34fRrPiUoXfQ3ka
         ILNjNYXtoJ2fviDZoMBnm538iNxIMMrODXE6FpQB+EYlEWdvuPp4ZDe40C7IHvpbCvK5
         z6ZA==
X-Forwarded-Encrypted: i=1; AKwUvByGT1+X3QTzI4C5KIrIL2Z6/5HEKpmkoTQoLu84qDWCah3WC3nIPTTdU5F9kdcIQE/YILQjAh0=@lists.infradead.org
X-Gm-Message-State: AFuF++kWVvcEw9PbSTq4BwmqRLAZTgfdHX6fr2ZqSmAk3xi9LcUuyWFC
	izV3cvwrF1BuACWVxwgjCbSSXraPINm4UwV0Rqt8DxFKKJD4PpJvh/wCVxCGhXJeNg==
X-Gm-Gg: AYBFou1jRUJZfKQ1TUUG8/FH1nlat5xu1dBL7CAQ7AqzbLnSYYj0TBUCJcdg9Yq6tPg
	PqpiqX3IVYtKOMmkgmEpR3LBtmOTkhtRlVquQQODuLFyafdg8p5KPYtVOhxm67I4tMkbiBiHGTB
	9IIx47EvGxpamoyEV4vv1x9CDRR6/L0xMDGTxYogtQSUofGCCymlGB9gVHb0KnTCn98FTIPO/LK
	95qp4JuawvU6udYIEJa2riKVDs7QlJSZ/hgA1ckIuyGR5bWs1oa3sPk51elQhJPG8+ZlcYxTNOl
	tqRPPVviFt5gxzEMUPMZkZpEWG2cvE8gneHkKJybBgdmUvq3f6cCjQqJa6oqOAHPbh2qDjOnnzr
	0IV1G79iC+VZhYAjRsn2rhE7DzfYEkYM40t3USCfktxj6xYmVz50Bsw0ZQz6bohPDQuRYC5X4lc
	J9/A0mVG5UQ/NF8n+990Y5lc8epPB/rGwcrT+fzocPOnsurimw+x3z5itrfPHww+5iSqcSI0m5o
	rZ3cFVeD60JUo9RECoKewBFd9b98/IqeRqq7Xo+ptmBwtILaTDom/iajgDoFe+ErlIFo1Ix2IhH
	0+gKn8cWlk45vHltaHQK/jk5jRkL2n+zo/p9VdQMBOAqLcq9hWWHP68XlLg0h5C7s/ytAWQLd9C
	EcbLd+97/l+B/OMyQpZA+nperr1ss1jPIV7E8kL2w+61hy7xzRZ6gvipmR1fuO22hBsXc6EzVr+
	knoROkgoejGOsv
X-Received: by 2002:a17:907:e00c:10b0:c26:19e3:e98e with SMTP id a640c23a62f3a-c2619e3f021mr646105566b.46.1788875604154;
        Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Tue,  8 Sep 2026 15:53:14 +0200
Message-ID: <20260908135319.754140-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145325_468433_54E4DBB5 
X-CRM114-Status: GOOD (  21.14  )
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

ieee80211_handle_wake_tx_queue() has exactly one entry point, the
wake_tx_queue callback, so a round starts only where mac80211 calls that
callback: a frame arriving from the network stack, a block ack session
starting or stopping, a station leaving powersave, or a stopped hardware
queue restarting. Every round runs under
local->handle_wake_tx_queue_lock, which is shared by all four access
categories of the hardware.

That is the wrong shape for a driver whose only backpressure is the
airtime queue limit. When ieee80211_txq_airtime_check() refuses a
station, ieee80211_tx_dequeue() stops handing out frames and the
station's intermediate queue keeps its backlog until the next enqueue,
not until the airtime it is waiting on comes back from the hardware.
Returning that airtime does not reschedule anything.

Open-code the round in the driver so that a second context can drive it.
The walk is the same deficit round-robin over the active TXQs of one
access category that the generic handler performs. A selection ends
where the airtime queue limit binds, because ieee80211_tx_dequeue()
applies the limit itself, and drains the station's queue where it does
not, which is what the generic handler does today.

mac80211 documents that a driver must not run concurrent scheduling rounds,
and the next patch adds a second context that starts one. The round
therefore takes a per-category lock rather than the hardware-wide one.
ath10k and mt76 also drive the round from the driver; ath10k takes its
per-category lock on the wake path alone, and mt76 serialises instead by
running its rounds from one per-device tx worker.

A custom .wake_tx_queue with a tx-completion driven push was proposed for
ath11k once before [1]; the design was right and the measurement that
justifies it is in the next patch.

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 ++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..40895d276de5 100644
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
index 40a2b6d2f804..342b38308468 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6546,6 +6546,43 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	}
 }
 
+static void ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
+{
+	struct ieee80211_tx_control control = { .sta = txq->sta };
+	struct sk_buff *skb;
+
+	/* ieee80211_tx_dequeue() applies the airtime queue limit itself, so a
+	 * selection ends where that limit binds, where the hardware queue is
+	 * stopped, or when the queue empties, as the generic handler does
+	 * today.
+	 */
+	while ((skb = ieee80211_tx_dequeue(ar->hw, txq)))
+		ath11k_mac_op_tx(ar->hw, &control, skb);
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
+		ath11k_mac_tx_push_txq(ar, txq);
+		ieee80211_return_txq(hw, txq, false);
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
+}
+
 void ath11k_mac_drain_tx(struct ath11k *ar)
 {
 	/* make sure rcu-protected mac80211 tx path itself is drained */
@@ -10067,7 +10104,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
-	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
 	.start                          = ath11k_mac_op_start,
 	.stop                           = ath11k_mac_op_stop,
 	.reconfig_complete              = ath11k_mac_op_reconfig_complete,
@@ -10757,7 +10794,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10791,6 +10828,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
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


