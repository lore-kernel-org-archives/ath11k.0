Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A0BC79F82
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLbvcyq3q/pbF30deRaLGbbCTJlJfhASYsjhDtA/Jsc=; b=zE/+TB9gBvDd8NVFI+UgvbPfXA
	lBSGVlnqJEowexaIF7NQAE60ly7wPMH8AyhOFw6yi2p/YdT56WVd2YGTMrTSZa4indMCZ2ftAE1MQ
	SrYretVkI2KhqwZldM/hrR7QtUVZa9rkv1AE1XTEzf0WnAQ7Hbj6ebSfxbmyyUpwTuGONnRHqba/A
	HMYIYNYVTrW+jTTe6FaJZr7i5t5dLFAxJ5JZypDfTQBkzhTgJNPgxbVYnhgVXfzBpaxyxSdaOmSCo
	N12dib9LC2nkC8Qqz5vSC8Rp2M3tsvdA08Axjp/TrVmEs5N8CQfyBTQI7PZBNohuVjhVJfqToGk3S
	6X1hqccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGJ-00000009BhS-3Ubc;
	Tue, 08 Sep 2026 13:53:23 +0000
Received: from mail-ed2-x0a.google.com ([2a00:1450:4864:33::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGH-00000009Bbf-1iR0
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: by mail-ed2-x0a.google.com with SMTP id 4fb4d7f45d1cf-6a672286019so2529638a12.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875597; x=1789480397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLbvcyq3q/pbF30deRaLGbbCTJlJfhASYsjhDtA/Jsc=;
        b=YZhKZUV8095gB1JofPrbpwugfEYclQl84V9rnck3C9JmGBP8dYbFT2g15uB9r85QED
         01ajNdYDw/BfQ1zEm2852GolaSuaLQ2nUk1M/Wx0Tz3vpT4NXFEp89ohyVPG5OHfQnOG
         9Jgmvjx+EPbUmfCI/IykdAbUTpHeedP5Oaz0vk0FUaXpmzPwbapGFnCMIm4UTgTolgZm
         HNKOe9I94MdsXq+6+0UaL4JrptOy8HDL5LgXfPDY9TKQ9kiurRV579s3QxZEA4MH7Dw8
         LZJko2LFKwuLNvpA8V33Guz/h7a+htPIOcHzPIcQ6AF+nVIPBDAcEAOSjmGWD/bA2FpY
         gRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875597; x=1789480397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLbvcyq3q/pbF30deRaLGbbCTJlJfhASYsjhDtA/Jsc=;
        b=Tkv8qH1iumkJj79JZhOcGCCi8H9qwyCyPQLiXsyiap9OeIIRscUKElnEh/5qqdm3WT
         ZTFMBqvmVtA5OQe4t+vZrch/jPq+W7cuox9mjPKDxx0mcPqGZrr7YgA+UVk9uN0DD5PY
         2vwOTOryDTxS2L6IvFYWRGaxVai0WMSAN0caT0KCh95/3dmIZ0eqsSTZ3QnDcvndnpJA
         ZGpeuN0q3uSDYJfixWss0d3BGYeu+o4j0eqVMS026iZRqUxGTr0AGe39XJw68yCL+sJB
         VyZus8LScjUAwDA1HFvl9Jh6VXfjqe/Qljwndn6jrcK0DttnhYJGMgH4rInyAGzBpmdQ
         yyVg==
X-Forwarded-Encrypted: i=1; AKwUvByfZxZwuL6wn4IEjUwi3ZqsfW6Wi7iao73/ykgHKKUmuZOgF2e/cOIe+7zM2ZKP+QO//aClAFs=@lists.infradead.org
X-Gm-Message-State: AFuF++lzVsX2Xp3q1JO/Lt+ld7wg1L/D07pM1Ee1MGxuRZM7MdGUnops
	ti4+3jPha9XRsewc9MTfs1lsR4Z7qq7rMTXa419PpjkYScRYmr+X/+IdQqr4lM3Odg==
X-Gm-Gg: AYBFou3+r48BY0GBXs5NJIJtuV0TAmiVQYdGRWDp44WO72ji40pAd+APYLyqY2+Svgd
	FPeeKdzl3+h2A3aGGYn6Yb7TVeaLdfgjaD5AHs2LmcRxOinyHV8PjNWK1Z4UCRF0n6VmKHA2/ks
	j0pkvasivQkCnrTI3wgddHBzZz8ezZOfVuIkjixFll3Uvyiap7EQLIeWqxtj30EhwA8wr18YdCK
	bq9Ya5m3OAi1bpf5zWQ8daqcgBWCTEssSZ59nGfWdcGo72pGj+82DatTJduAcAuZOi5jzfzS1Bv
	CRpsN7EiKUPQH179rOfUv7Sp70U6JtH9BwWxeOQDFbzBw22TFjtWHl8g2KcYVp49rBGyLSgbOhC
	JzlPFOLByPoKyPMrKpGMtOweKrbgUOqARgH4+GXhamWpiOY40yDOc1T77gz2LtzBSNCzcAE/B5F
	WP9L7yYpZjpJUYvXq7AIjLoK1bdHTFz29D7P/YuqgFqUYqw2MemDFa6iQ8DpWwnMxjzPIOgPcvM
	PUWC1wTVW22uGydnNtrH1IFWJkSrRaAUeXcZouE3J2bRKNbVabsYlvrqIikS1nmSMZ+qfClZGCH
	caWnJCJiBwZQ5mQK7LwmD7jlbVgRIRP8dA1ol67m14Amr/lfx1pN0mMO0vA/YwV+FSkdB4JTskG
	/o4+gzrxWMF+BjrnhFSK82Y+58FhU5QFKVYltseyx3X+lVZxpUGiTFdzC3tElo2mAdz8RMlMgbN
	7TTCAa0q7blmqR
X-Received: by 2002:a05:6402:3241:b0:6a7:f207:278e with SMTP id 4fb4d7f45d1cf-6a7f2072851mr6378442a12.15.1788875597050;
        Tue, 08 Sep 2026 06:53:17 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e19sm5519140a12.10.2026.09.08.06.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:16 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: johannes@sipsolutions.net
Cc: toke@toke.dk,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: mac80211: scale the airtime queue limit by the station's weight
Date: Tue,  8 Sep 2026 15:53:14 +0200
Message-ID: <20260908135315.754126-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_065321_563422_345AAF54 
X-CRM114-Status: GOOD (  21.74  )
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

A driver that hands every frame it dequeues to the hardware at once
holds nothing back but the airtime queue limit, so every station keeps
its full limit in flight and the hardware picks the next transmitter
among them. The order in which ieee80211_next_txq() serves the queues
never reaches the air, and the airtime weight has no effect on the
airtime a station gets. ath11k is such a driver.

Add IEEE80211_HW_TX_NO_PUSHBACK for a driver to say so, and scale the
per-station limits by the weight when it is set. A station with twice
the default weight may keep twice the limit in flight. The scaled value
is capped at aql_threshold and never drops below the configured limit.
A driver without the flag is not affected.

Measured on an IPQ8074 AP with ath11k, a 2x2 HE160 and a 1x1 VHT80
client both saturated downstream, BE aql_txq_limit 500/1000 us, 15 s
runs, three per setting. Share of the tx airtime taken by the HE160
client in per cent, at weights 256:256, 1024:256 and 256:1024:

  without the flag  55.2, 54.1, 52.8  55.9, 51.9, 59.8  54.8, 56.3, 59.2
  with the flag     57.8, 57.5, 55.1  73.8, 76.7, 74.4  22.6, 22.7, 22.4

Mid-run the favoured client holds 1.2 to 3.2 ms in flight and the
other stays at the configured 1 ms.

Ping from the AP to the HE160 client under the same load is 4.8 to
7.4 ms mean at equal weights and 18.1 to 25.1 ms at 1024:256, where it
is the favoured client: the deeper queue costs it that latency.

The scaled limit takes effect only where the configured one binds. At
the default 5000/12000 us both clients hold several milliseconds in
flight, neither queue runs empty between transmissions, and the weight
does not move the split.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- gate on a new hw flag, IEEE80211_HW_TX_NO_PUSHBACK, so a driver that
  pulls when the hardware has room is not affected. The flag is set by
  the driver rather than derived from the use of
  ieee80211_handle_wake_tx_queue(): a driver with its own callback can
  push everything it dequeues just the same, and ath11k does once it
  schedules its TXQs itself
- add the ath11k patch that sets the flag as 2/2
- rewrite the message
- v1: https://lore.kernel.org/linux-wireless/20260824142435.1757391-1-julius@bairaktaris.de/

Measured with the ath11k series "wifi: ath11k: airtime queue limits,
fairness and a driver TXQ scheduler" v4 applied, which advertises AQL
and airtime fairness on ath11k, and with "wifi: mac80211: keep the TXQ
scheduling round number across a closed round" applied.

 include/net/mac80211.h |  7 +++++++
 net/mac80211/debugfs.c |  1 +
 net/mac80211/tx.c      | 21 +++++++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 7bb4618065b6..80381c7abd84 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3086,6 +3086,12 @@ struct ieee80211_txq {
  * @IEEE80211_HW_SUPPORTS_NDP_BLOCKACK: HW can transmit/receive S1G NDP
  *	BlockAck frames.
  *
+ * @IEEE80211_HW_TX_NO_PUSHBACK: The driver hands every frame it dequeues
+ *	to the hardware at once, and the hardware picks the station it serves
+ *	next, so the order in which mac80211 schedules the queues does not
+ *	reach the air. mac80211 then applies the airtime weight to the
+ *	airtime queue limit instead.
+ *
  * @NUM_IEEE80211_HW_FLAGS: number of hardware flags, used for sizing arrays
  */
 enum ieee80211_hw_flags {
@@ -3147,6 +3153,7 @@ enum ieee80211_hw_flags {
 	IEEE80211_HW_HANDLES_QUIET_CSA,
 	IEEE80211_HW_STRICT,
 	IEEE80211_HW_SUPPORTS_NDP_BLOCKACK,
+	IEEE80211_HW_TX_NO_PUSHBACK,
 
 	/* keep last, obviously */
 	NUM_IEEE80211_HW_FLAGS
diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index 8946b027782c..ddbfa991ec74 100644
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -462,6 +462,7 @@ static const char *hw_flag_names[] = {
 	FLAG(HANDLES_QUIET_CSA),
 	FLAG(STRICT),
 	FLAG(SUPPORTS_NDP_BLOCKACK),
+	FLAG(TX_NO_PUSHBACK),
 #undef FLAG
 };
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index c33092960df2..c94efff48d74 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4217,6 +4217,21 @@ EXPORT_SYMBOL(__ieee80211_schedule_txq);
 
 DEFINE_STATIC_KEY_FALSE(aql_disable);
 
+static u32 ieee80211_aql_sta_limit(struct ieee80211_local *local,
+				   struct sta_info *sta, u32 limit)
+{
+	u32 scaled;
+
+	if (!ieee80211_hw_check(&local->hw, TX_NO_PUSHBACK) ||
+	    sta->airtime_weight == IEEE80211_DEFAULT_AIRTIME_WEIGHT)
+		return limit;
+
+	scaled = mult_frac(limit, sta->airtime_weight,
+			   IEEE80211_DEFAULT_AIRTIME_WEIGHT);
+
+	return min(scaled, max(limit, local->aql_threshold));
+}
+
 bool ieee80211_txq_airtime_check(struct ieee80211_hw *hw,
 				 struct ieee80211_txq *txq)
 {
@@ -4238,13 +4253,15 @@ bool ieee80211_txq_airtime_check(struct ieee80211_hw *hw,
 
 	sta = container_of(txq->sta, struct sta_info, sta);
 	if (atomic_read(&sta->airtime[txq->ac].aql_tx_pending) <
-	    sta->airtime[txq->ac].aql_limit_low)
+	    ieee80211_aql_sta_limit(local, sta,
+				    sta->airtime[txq->ac].aql_limit_low))
 		return true;
 
 	if (atomic_read(&local->aql_total_pending_airtime) <
 	    local->aql_threshold &&
 	    atomic_read(&sta->airtime[txq->ac].aql_tx_pending) <
-	    sta->airtime[txq->ac].aql_limit_high)
+	    ieee80211_aql_sta_limit(local, sta,
+				    sta->airtime[txq->ac].aql_limit_high))
 		return true;
 
 	return false;
-- 
2.53.0


