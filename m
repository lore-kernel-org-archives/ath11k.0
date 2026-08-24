Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC0CC5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HX+XBP/q492aCWaLX86g+IhZqWVnOcY+XsmiqZR6Tw=; b=IRUmo4FvIE19t0E3s/SKIa7x5K
	2i7ZknrID0W3f3vzN2QYs107CQmsCtCjuUdneWccYk+8h3papyMWT5ngiupiiU+uHaROSUhpwzwel
	ifz2n3MYx11qnwFbXLVX0sIrlFAdMKgEnRjjpu/d+ZZSLjdU8GKqdiXTILVEyRDkZt5OTyJSM6MNe
	jNeoxc/ZbumjNASC0sopF1OqPqK6JDKi5LRcyePy+K+brSvjomuoIZmz1OSkEVPJDT8uo6VEcrm5h
	uZ7MUBkZ78WjYgD8/ACtWaSVIOe+MrEpYzeAxSvOqNLj6T52KY9SY7cX9nmQG1122H7ZYwAefQfAk
	ezCgLXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKh-0000000G7Hz-0237;
	Mon, 24 Aug 2026 07:43:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKc-0000000G79G-0GmS
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:59 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2055573c8cso465404566b.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557376; x=1788162176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HX+XBP/q492aCWaLX86g+IhZqWVnOcY+XsmiqZR6Tw=;
        b=JPicWaGeDSaJ6E5LyH001g4a/5rInHCjAetf5x8j2vPF6JhNoXYcRvx0VU4/DdXlXB
         H1a36B0CZbzQ5WA8RnTWUjgO/xzQnNXvaZirMYXJqmbT+u+S05SYGBYq6BA2LQE991FG
         LxmnYbOC30Ckm6qzO8E79oPOIIcgjXuC4j6Wt37O9b2UcMXqgoV40I0LeneL04YlXX75
         PlD7Ci58G6xzXSMcWeEne6LcQABEFS+G3KgyzOSpRxcawZVTUXjR8aYFGLozh3pXUp3p
         MvGMUs54FWsDxipMKYgcZHCN7w9HDSUY/XD4DSxGHs8xjT6fuFsaSCvKWuK6M/1pYSDd
         Ppgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557376; x=1788162176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HX+XBP/q492aCWaLX86g+IhZqWVnOcY+XsmiqZR6Tw=;
        b=TDtf5acMQqi+gVE+AYffaKyEUPApA659ds7L7qK8aQieVv3FxzvwOUxtUI5fZKEO/d
         4tEmen4Ljm98b9gRNjCfVKxlsODm3jIsbMvDek2QuWwVQiEnnP36nBV7m8Hqjsrqk+Jj
         OqnZkfThLnACh45navfQ3axQ52ik6u+AsTFSOdxVnOpnH5bshd1Td/XUeWzuaLAmF8ab
         IcjV1tXZkRk++G/rfg2nZj2boipUdGfQR9jwbyn1ONYsTBRsizzSAVxJ/i5Yk6ZdROEU
         oa6Ar5GaRWa3bm2H65PnDC9/f8BI8l4cMXIKxDiREqKhu8mVmLyFzoGOjcrKJ1wrvbFt
         qI4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoL+HvYdvDUa3oAC6sRfEYjhqkp331qjrDL+vjZpDdAa8J8v24V0Ht/pNa9Y5fRdTNDFaHpEaE=@lists.infradead.org
X-Gm-Message-State: AFuF++kWoUWKGcx/MjURIyLNYTsa6mrdiE/d+2wrHcV3+DtJwCj1nzvE
	1TSzOOaFnUtECPjXcCqFd9HHAxncljIgY3lLpxVMP1GN3N7IZVWoZDNDGTkMYh7QmQ==
X-Gm-Gg: AR+sD12iTUdaY8coe/2CxKTnf9GIzu4keF5tErSeb1RvP3qRav76T5IMPuzLga8Vpu1
	JbuVB5IsxFx0WXlYNQudnWa4HfzcyDlKNMyZIVsfC55v28NZesyV3QKLm7cbFRKswzEGDzSenMp
	SB8miTTwqnCspwpokwlyzZQ82DykDOwMuU5n8wSMYlExSM0T0eCbU8c2f5SX57eVW6WsTi3MJ+N
	Y0qdd/8WoGeuaumVTImBkL5ldyHHJsjHR6pw9INsJwnRtLRT55F4Xloh0dW4/tB559zB49nA7vx
	bJ2uHrX9yviEq6FsINhN9Lq3mbnOJDoXgwaMjoKur4gKcSmgDbm8x57TN7KpDrRQbGYYUuOBgem
	/BjvVzlfX6zbtWw8HLKTuPVKtTu+5so2xEE5Deg/GdRXVTwRFKlnDbgwMXuTWqgG9rAY1LEXZi5
	6AthdPO4Jdxuln7mUpFeHwz9gsTHqN6gIJeX2mmqJUz73bo+kZot5V1ElsLH/qUGWRUH37xC2fm
	GtGleyq2Dd4SpO0ITYBOrEBVyyoA0wcrO0+7+rMmKSRnvRy/uUUk2dDq1TlYmJO9QPkje6XPXB7
	s1xzAMAef9v3kg4CbOKVps1a/ZVkIh0v3iF0WMfLmT70GWi3r//jLDiiI8Lo1QIEff4lGlcGwSN
	KbR4XKTHbXBwPj2snDA8Q7y+m3vHwAtQIOmgJbd4pK7YeMuhyix5dbSbOTHvlaYlMVoGdxDCRjp
	FFlYxBwMDGuRaTzQ==
X-Received: by 2002:a17:907:948a:b0:c1f:922d:34c3 with SMTP id a640c23a62f3a-c24926a1c3dmr1664099266b.14.1787557375972;
        Mon, 24 Aug 2026 00:42:55 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:55 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Mon, 24 Aug 2026 09:42:24 +0200
Message-ID: <20260824074228.2114579-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004258_189482_9CA7B43E 
X-CRM114-Status: GOOD (  19.06  )
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
wake_tx_queue callback, so the only event that can start a scheduling
round is a frame arriving from the network stack, and every round runs
under local->handle_wake_tx_queue_lock, which is shared by all four
access categories of the hardware.

That is the wrong shape for a driver whose only backpressure is the
airtime queue limit. When ieee80211_txq_airtime_check() refuses a
station, ieee80211_tx_dequeue() stops handing out frames and the
station's intermediate queue keeps its backlog until the next enqueue,
not until the airtime it is waiting on comes back from the hardware.
Returning that airtime does not reschedule anything.

Open-code the round in the driver so that a second context can drive
it. The walk is the same deficit round-robin over the active TXQs of
one access category that the generic handler performs, taking a
per-category lock rather than the hardware-wide one, and the burst a
station gets from one selection stays bounded by the airtime already in
flight for it because ieee80211_tx_dequeue() applies the limit itself.

ath10k and mt76 schedule their TXQs the same way. A custom .wake_tx_queue
with a tx-completion driven push was proposed for ath11k once before [1];
the design was right and the measurement that justifies it is in this
series.

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 43 ++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

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
index 40a2b6d2f804..e5b2a5e56a28 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6546,6 +6546,42 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	}
 }
 
+static void ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
+{
+	struct ieee80211_tx_control control = { .sta = txq->sta };
+	struct sk_buff *skb;
+
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so the burst
+	 * a station gets from one selection is bounded by the airtime already
+	 * in flight for it rather than by a frame count.
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
@@ -10067,7 +10103,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
-	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
 	.start                          = ath11k_mac_op_start,
 	.stop                           = ath11k_mac_op_stop,
 	.reconfig_complete              = ath11k_mac_op_reconfig_complete,
@@ -10757,7 +10793,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10791,6 +10827,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
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


