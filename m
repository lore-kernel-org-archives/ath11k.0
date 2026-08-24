Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56641C61DB7
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEHKshZ50VF+vld2tceM1/dTFTvHUFhobWJ0AfZzzco=; b=e/a/CP3jZnRIZhcufdqRZNaScl
	bKYv5TqaVU1Ii0fefwLFCQ6ohdEGmNxQXB3FWOfcEJzwoFt18iJeljmGIX9+BabGl4T39DIkHTfG2
	xH5+BjpTXP9dAeFRrbNwnw5AhH6l+ZKDHoBgsyV7JAKi3Jt6Fs8v99nGJpwR1Wvu5IJhVs9JVZdbN
	213jfBGhvgYTlP4Dmcih/UX10lpRCEE3ISSkl1ptDMLw+SQIRds6RXGTUR5qcwtgrQ8apQunamM0M
	xtN27nqe/+zxHowrfwPr69fR7/7uv8Hk/C0wMUCZDQsCsLbQnbV5dgBQ42H7XxhjDk5Mco+/xndbl
	6gYoV0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbN-0000000Glz4-2nGn;
	Mon, 24 Aug 2026 14:24:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbG-0000000GlsB-1PYL
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c1c52d920b8so505358466b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581473; x=1788186273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEHKshZ50VF+vld2tceM1/dTFTvHUFhobWJ0AfZzzco=;
        b=C/5weCK25UH5tmldmAqX94+QUnnDlVHUqribgp0th18Eqoj68CRvzSjb71Hc5y12Wf
         Bf6Jppx4yz0sAjENsQEZuA+jCbkVFRbRC83m0l1SJxhs2tDJY1s3yocZ/LRtDv+PD4mZ
         wrCYbWK1sRX8mjgbIXNLsl22ctCYsbpiqKOdb2iw6/DJosudYIglJsLmH81zWMPDc4p3
         M6qAqtN2cjwxGH1mswUPzSWfG4Lxm6LXV3oSX3RRFgXwBxR0G+5leKKR/EasV1Ui8Kdz
         zR6OSVn0NavlTpenbtyaR8ga3DxGxKttYVg4/f6tGS/JNKYJpY9QGDp3u2kyPeIHTGsP
         y6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581473; x=1788186273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEHKshZ50VF+vld2tceM1/dTFTvHUFhobWJ0AfZzzco=;
        b=RtEH5tld7iKjSlPFCyyUyA6swXTJ1t9vIajOI4cV69PBJpf3c1EtfzkkXgMPnLxbBq
         tGyGbfaTmZ70FHFpGe4M2gL2D+pOsaeyiJRlAzLjNDPTC6af6psbqMrEeH2506/RTgo5
         79jQtN5vuAJ/maeiasVZ3IYTfSWf2f+qudM2854TPAXGdPZBc6OOYJyb7pIGXnBbsrzS
         25lRiMdBzhZBMBRDaNxgWWPBeyPvBrbvHpjebFS8kvMuze3ptdOg+oYtX0YEEdManGWB
         Tk1+XXwFww5TjmHJvZO1JHUTUBWoDnZnc03ij/KUJXVC1Yne9y8fQb7WKEBss1noqiyD
         WabQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy4/ufuAGIDSNnrTT6FP/DUakJFBX27ITMptS1IzLwVYFfASmYLg+sVCKMC4R8IQjftTeQfls=@lists.infradead.org
X-Gm-Message-State: AFuF++lvNZT7TzpS3J3IY5f6D7ASCMzvFIvmUDtM49mnrpfiw3Q2Ee+h
	DH3vS2ZCbALneKCrHAOw/oPita7oQXPgaz5BZSqy2rFQvRLzQoR2iFw3vCoWMP/ey5kukx8y8dB
	WI+jTZCOb
X-Gm-Gg: AR+sD13HJlKkjwk6jeK3DyKxiUdlqdo/0NkpbHkggbADPXZ/FQIY8wDtgO/LB4zlB2e
	jKKpEj5CkZn7iyqR7T60htbAHWoSD4qw4/qYl0LpZ74Vc3S47P/busHw6n5r/aWmPa4P54yxotJ
	bDPCgIBVrRCr/aqi0/Jzi2rwFCZdS/s4J4GrLIdl6tFeqSSCGHJ0OoKZcQTwxmaDGHrY1YsbU0L
	q6hXNh9mebAh224vY9gUwWHIb5/a1nNAmu6DnpRZ+i8Ys1WjRjdtDiR+0jLSrQewDgwEZbfOWes
	oWbC7wnBkkFvXX89nIM6H9ufgNXB8z2GwO439ViBPfuEwtpL5t0J7QSZQVseYtdW/UU4JnH4cUI
	XsVgTuezttv5zYesabRDEJ1Mznb5IC7GS5SqbsY5JWbjYbsnulC+68gn9vSCsn/66pzKav8sAhv
	7vDwHw4m0V0r9J5Ow28tN1e9fi6gcxQizuasgKzGHMGE77Sb5We+ry7BBE4k7z6OedLAmO+btj7
	dxStdTvHCxg2nitGUgdB0iJu9KGTrB8G33DYbLICvMBLRA4dlmELdIlCQXWFCp+7PSkJcvoDcAd
	Zq/EXNP1vRS89PEXa4BRXrFF3JuBJWJnq32VjbBESntgIHK0hnjaPdG7XgWhHqcVK5dGxUrmHQA
	X9Zgotrs5J++E0BmPXl6OSdcaInrJb1hsuqePJyBqN6IPd8YNhy+hGo9lnF+WBoivIDoWqVHjTZ
	Fp/cPi+rM=
X-Received: by 2002:a17:907:c706:b0:c20:f913:9337 with SMTP id a640c23a62f3a-c246a657f9fmr3239680366b.20.1787581471726;
        Mon, 24 Aug 2026 07:24:31 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:31 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Mon, 24 Aug 2026 16:23:46 +0200
Message-ID: <20260824142350.1757379-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_882123_8359E284 
X-CRM114-Status: GOOD (  20.67  )
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
justifies it is in this series.

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


