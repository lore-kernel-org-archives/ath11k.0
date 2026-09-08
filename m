Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C79C79FB2
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2hMGkA6N+e7t0Ka56skOJW9Bs0c/5KzjT5GcuZfFgU=; b=ZwCxuTJLKxqVQqDC5MjIObKw7R
	wg7KO9tgnO2XuutIUZKzVq02IMXQ4mDrHD1Tgy8gsmWXpI3mWHrQBGzEmrFZIHY8kVVEGWtHDcp6m
	wmFtnPzUtVEsthUgKE39s9VbznDSgAIDUXWH/OOgxnA51pzYyEkzxcMls8asB6P/wypU0qQRj2ZHd
	ip1zSw0fTP1xYnQctZ87GQpaAaJSG07Jh7u5qM4YE50XQh89J9wFzsX70PoCjKqIWJyI5BOGOkn3o
	kBCyckPbWaTeqokl55atVb9ug07pqwOv0FQ+eJBzgxV5s31aLo7Its5Hq4S7YIBx3h73B3PwA9Ua9
	xnt0i7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009BrA-3MyV;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGK-00000009BgN-172E
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:31 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so458986466b.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875602; x=1789480402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2hMGkA6N+e7t0Ka56skOJW9Bs0c/5KzjT5GcuZfFgU=;
        b=LnMqKxrm+YOgeHwoQ1K4zi92OHAOarc9MUopZSO51fRzfXg6I2KYttFflIWtg3Y/GQ
         xxu9ojGAWG7Y5VY1Qi0YA90NDPFXIuD5Ese9OXVshsmwhmmLIKTTfjovabqJLXTSIWFK
         FpvJ+Pwywx182ZZ02zszpNovti6tUEvv1Xd9Aa9bEGp9zdp0G8kR8DJWwdgITVPlsMip
         5hab/flzpWoBHBOE9ZUmKewMLgH6LgajfASNwV+LFCeEywbmSDln93OY+2Yiwtm5e7uq
         aAh/NJt4PU+b9xMbJUOriwk3dAL+0SySy0BRYWihx3WFY5yS0+IAdMTIHw1mepiW2xuR
         +D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875602; x=1789480402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2hMGkA6N+e7t0Ka56skOJW9Bs0c/5KzjT5GcuZfFgU=;
        b=m3Y9iU9jQ+optCCNEz2SxPGocO2IgUXrWcWqTEp4DZhj9ZRmwYz5ze2dAVlzr3dODT
         bPYdEzFnnoWo/KgCYFZgwjAtuEXC6UbXji1HYrcQhLSsHCR9kOvfTQp5iweOmNc7UNRl
         CeErxXVRMDzQ2iGHpLoEzq8K06FQjfLn3bnV407q5GyfF+K5unfR312xWvfzRZPtfITf
         rkJJd9bNmv2bOsfdNFmXTdauB59dxmdxgrR6QILE69TwtwLlkvTuNEIx13JIHPJ2w8t6
         Jr5/lLxJeuf4Hmw+TlTe+Tnx6y+FBQ/cuaMs4iz6pAmGPKFwWpCY5+Xd0K7jaK7Q0TJH
         KAGg==
X-Forwarded-Encrypted: i=1; AKwUvBx94JGHuhi6axMcI9p5oRJq+FH2WkFltWx51UAKckET9F3k3NRPh5a6qIE+ysH9sMoYJ0ljE88=@lists.infradead.org
X-Gm-Message-State: AFuF++mTYv7LorPgTlFHtGetK1cdjXXEr6nLLtjj8i+/EZZP43aw4kgQ
	cJMuwGOfj6ieTuTlOD6JCcp3oCmV6XkHnC+2TINlQ2o7WYPmr6pwUJRqa5vtrUQCTQ==
X-Gm-Gg: AYBFou1L8gFfO7kSUEnEX/YY+P3CQ848HRizKdU2wEEGQNg5zv+/+iFERA/NqfqH70N
	+ys6EvbhYHSJ96FZIcWE/YUwdjp6Ia0XiDVuCeO5iIBVf/0xL8zYYz6wyi+JcKwQe0O+6IX9sNc
	yr2spq7yqG9Gi4BVqddxA6N0fD7vC2Wm0dS9e4mY46UhJwxhMDO6nWM5E0yQ2PsSQoguLcKvL1K
	yso1ewhVKO9FYnaJhuheavkhjj0VpsiGexbWp5Ot0K6G/176J4Ymw7UXiDM0Bh6fGSpm0ZkdaC5
	fSWBgn1YsHbQJAz7/ZOBhe2B1LjrzEydHgIH4aWMbdDc6fShWBxVMW9Ea7/nty/FnAXy09VKhsx
	NOcXnfdm7PeLHdnyPONixsomhNUGHdEV0bLxMVBhZ9KaKOo7diK42KAfyq+Tp5XosazULm/J92Y
	aa+11qbqzmFxXAJlaTkNS0Gg4bfkF1fQzwZ3gVvIu3c+FkEs9M4sLWzS1wzqWcZ5d4V2gqunGFN
	lh7rDXW5towQ0TeP/mTyjg0MPvCAfMPsvKe4c0/QYWHnig685rucnsUVcVWvUCtD5zOpsjrs2VI
	vLG7HyFK0VJZuAf9I1NXcfKXueA9FQTvCSGaa+lsv1mxmFXZ8jRYi5ULWZ7wKzZj7RlHKp8ZgLt
	TM5POtDWNcRGuEd1WU0tvvBUGJMG1/y7Kfumdkl4fQuOE1ubdPpn0TTEbpF6f5OmXKHok81HSmN
	Gtq71MySWO030q
X-Received: by 2002:a17:907:7a8e:b0:c26:19e3:e97d with SMTP id a640c23a62f3a-c2619e3eefbmr961872066b.29.1788875601889;
        Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 2/9] wifi: ath11k: enable airtime queue limits
Date: Tue,  8 Sep 2026 15:53:11 +0200
Message-ID: <20260908135319.754140-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_065328_351919_C5816896 
X-CRM114-Status: GOOD (  17.47  )
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

ath11k does not advertise NL80211_EXT_FEATURE_AQL, and every user of AQL in
mac80211 is gated on that bit: the airtime charge in
ieee80211_tx_dequeue(), ieee80211_txq_airtime_check(),
ieee80211_sta_update_pending_airtime(), and the per-station aql file in
debugfs, which is not even created.

That matters here more than it would elsewhere, because AQL is the only
brake. ath11k uses ieee80211_handle_wake_tx_queue(), whose
wake_tx_push_queue() drains a selected txq whole into the driver, and the
check at the top of ieee80211_tx_dequeue() is what stops that drain.
Without the feature bit nothing does, so mac80211 holds no backlog and
every queued byte of a saturated download sits in the hardware TX rings,
where there is no AQM and no flow separation.

Measured on an IPQ8074 AP with a TCP download forwarded from a wired
host to one 1x1 VHT80 station at 101 Mbit/s, sampled once a second from
that station's own aql file: BE pending airtime sits at the 12000 us
default high limit, 12024 us at the median, and at 1008 to 1024 us when
the limit is lowered to 500/1000 us. Pending airtime stands a frame
above the limit it is tested against because
ieee80211_txq_airtime_check() admits a frame while pending is still
below it. Without this patch the file does not exist and the limits are
never consulted.

The rate the estimator needs is already there: ath11k keeps a per-station
rate_info in arsta->last_txrate and passes it to ieee80211_tx_status_ext(),
which stores it as tx_stats.last_rate_info, and that is what
ieee80211_calc_expected_tx_airtime() reads. Where no rate is known yet the
estimator falls back to its 4 us floor, so a station's queue is charged the
minimum until the first HTT PPDU stats arrive and the per-AC limits of 5000
and 12000 us stay loose over that window. The current code charges nothing
and consults no limit at all, so that window changes nothing. A rate that
has gone stale low overcharges a station that has since sped up, bounded
by the same lag.

The estimate is only as fresh as arsta->last_txrate, which is updated from
the HTT PPDU stats when a descriptor is evicted from ar->ppdu_stats_info,
so the rate behind it can lag a rate change by up to
HTT_PPDU_DESC_MAX_DEPTH PPDUs.

ieee80211_sta_update_pending_airtime() returns the airtime but does not
reschedule the txq, and ath11k has no completion-side push, so a queue held
back by AQL is re-poked only by the next enqueue or queue wake.

The bit alone brakes the queue but does not refill it: the check at the top
of ieee80211_tx_dequeue() stops the drain, and nothing restarts it until
mac80211 next calls the wake_tx_queue callback. Later patches in this
series give the driver a scheduling round and run it from tx completion,
which is what makes a binding limit affordable.

ath10k and mt76 set the same feature bit.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..38f641bbc53c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10592,6 +10592,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


