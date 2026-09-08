Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E7DC79FA1
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=koyRmR036WyiywhS5c/zgf0ngCK/tJ+nGXVvSS1SMpQ=; b=ro8RKEeGohYrYUi4YbkK6ATP+H
	Bze2ePDEeGiMT/CcG4rhNMDygAWPGKmiTSRisPvUDugzkH5Jz2t1QInS7u/a9yiYWrd9N9WsnP8kB
	LeTZSRbnRGaqovMiaVoQwXynUgG2mISWkmjX0Oaqm9VIecj+Gbx4774zbl9AsfqQs53lIFgtyBifC
	ibba+Un2o6GL4qu7eX3cJm6C0PXsd0LUp6ykD6o5W2c33dN0DmUXkm67iCkYyIEU3Dc88U14x2Jp4
	4WdFNW893uBcTg3sGgYxiFhDRJjHSQRnTgC41hJN6q9VYAYztRGq2Zyi0fAcO/mqp97fmGj1LXnaa
	jOE3aO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009BpA-0chw;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGL-00000009Bhv-0QBB
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=koyRmR036WyiywhS5c/zgf0ngCK/tJ+nGXVvSS1SMpQ=; b=VSNJB7kR/bkXZ8VvnRDlJTIVT3
	5nu4ipr68hTZ7aTpXZTtnF6saaYReRjxU3762bIYSxKvFd1OMoWYlF2rjCrKn3auxJC3svc7sRcPp
	Vxz+ENoqYtWTyrSaDp7evJSiTX4Ebnic4JCpxWVRi3xKyzp5KxGg0dxMEaMfoqTluo4x0fIS7z4sZ
	HkcWixg8tXQfxuMngFLmy1TmgHWhGhD6CtMFuVL3zMTicEyp5T+H11dFsSTAQXtVA0ZCIMNhEMLM6
	aEKZ1AeG1fcXHwhSIx16cMrew9BXoRKvjiepkSq8qNEXQAr3JiLWBlChJAonvnrRkn/Q5PHBPDowS
	lk6rhVWQ==;
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGH-0000000HUi7-42rl
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:23 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c2532688fceso192896866b.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875600; x=1789480400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=koyRmR036WyiywhS5c/zgf0ngCK/tJ+nGXVvSS1SMpQ=;
        b=rL/kxr6e0xweEUAtmVjio+dDSXg5cbux9ZEMzRaFUzswPn0TbrqxLXlNruCjzH6gjN
         /nYkx7eiwLuBB6nt3Ag2fv9qtna3+bA/LohouFpI12JHSdNE6PrBrFFvMWWIx5sefUnN
         jD4fTOt2+HI9BFcD+3OqowIY1wTK2rsO+FQPhwSAZ4tD8ziHc7olLDQFT7IBIDAwD0gx
         M72ZWJ6o6jyCuxf9foSPO1Vc8P69pU8btSCe1Lo9KCkGLrzEtq1STFULusu+5eY7+nCK
         mrXuNXx7Q1rFf3pfoXAAgODCqorEEsf+3fsAKTl7YHw3NlkPw7wxFfvMJldkrYUrgK3W
         IkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875600; x=1789480400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koyRmR036WyiywhS5c/zgf0ngCK/tJ+nGXVvSS1SMpQ=;
        b=ccNGcbF90i6r4+pNGLOZ3Mxft7obxuZpDrp617wF7l3BfO6/03k5wv6qhZn/JL5x1h
         WtwL0Zha1sGWAZjWZOdX4QOzWF7OpPm2DRGOKH/WDcf2SR/I6uENq39gaFOIsDdq1Ev4
         /3uvbuXS2t2qHiN6MUXrX3jgISuk5MRO7EnGS6EHp77wKCiDqM4s4jck8p9WAKh62kDB
         wQG6ViQ4lHPweO1UatdkmPEO3Jui6lpaAuF38cHUuttb73O7U7xpScE/j9XDBeNEJYIy
         KqXVH4q1Y2m6F2GmXRQHGMF3yZAcs3vJ/GSyQSHvMdO9VP3SxA58xW56i862FX2ziaC8
         3rGw==
X-Forwarded-Encrypted: i=1; AKwUvBzTZDvMpgGGiQLdarYx095hnx6/B0OthPTjtdWqwi7Mms4DSdbRHBJDhBCpQrF01mkufbWAUSI=@lists.infradead.org
X-Gm-Message-State: AFuF++kWOXGqh2TLnJ0NvheYg2EgZoQeTWoW04UNgmD4zAOBavX1mmgI
	MT2x2wf0htEqM+ZXGsDdobnyn67Edyor5+E0CldKc+ny6nlDW+YM+xpZfpPjxw5wnw==
X-Gm-Gg: AYBFou1+3sR2nzKf7VIwJ2TCN6toMCEl+u1Nu0Qd842p/asYK2CX+G+EmbU/ZLQgdEm
	dJxXFhf2KvVuqF8USP9fBK1XTDH1FHDg7kVndnPEf05dhgWjbqKP10ZvSpqWhsfpmT94c9WL459
	rXLB/MFL23hp3s0wNVXhn7+VGzidFLNy58+vHVAP/pnJ32vrhmTP2oSn3pfe7QhroT/uvG38U28
	EHo/gtPIsd9Dp1GC2ssyV5+9V3MHMAkp+FsRc0UL65Db6XqPi9Ez+uFwnBChwkEtHafUIB4xDSW
	8eBK68Y5SXwQ1OOO+U2jS9nLs/BpXUS05tl0cOeXV+3KUVuPJG5bpKH5mJ+ClqTyWyCXGVESeyR
	pnG2yqbhKo7eIPAf2uFsswZU+EjJS+5YuWxLZ/2S4mF3egHioHuYKpg8vLbZO52XbiD9+L0kL+u
	X137stlXyWosjc//m78E8kVx3vH/dwbaSleNM8ACgiBroVg4fllWoOT+J2Qcr3g6/TUCTRBvsH4
	FB4vRy7XracI+WX7prUdJiX6+pQMlwhDU9+tfJ3Mree6kVTOrL7PzhS6chPzS8ghF5epb7QS4+2
	IOrtK2sm+wZnNEFJRKCNFtkbanOBHmXihYMmGnV3TsNYIJBCe+m7AM9Kpt0HRKSpzEYLujrJ/i3
	1fdJQkqYmBNl731+9NlEG5YgkRR7T9lGzGqcP/XTFLHU7ACu58diRsT7G2GxiD6Dn6wtJrzXgax
	eEO+DKCCmZlVPyGQ==
X-Received: by 2002:a17:907:1c17:b0:c26:19de:9ae4 with SMTP id a640c23a62f3a-c2619dea7ddmr975360566b.35.1788875600085;
        Tue, 08 Sep 2026 06:53:20 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:19 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ scheduler
Date: Tue,  8 Sep 2026 15:53:09 +0200
Message-ID: <20260908135319.754140-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145322_139579_10AA8857 
X-CRM114-Status: GOOD (  32.03  )
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

ath11k advertises neither NL80211_EXT_FEATURE_AQL nor
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS. Every user of AQL in mac80211 is
gated on its bit, and the airtime scheduler's deficit is charged from
ieee80211_sta_register_airtime(), which ath11k never calls. Both
mechanisms are inert on this driver, and the driver keeps no queue of its
own, so on a saturated download every queued byte sits in the hardware TX
rings, where there is no AQM and no flow separation.

Measured on an IPQ8074 access point with a TCP download forwarded from a
wired host to one 1x1 VHT80 station, 20 s runs, three interleaved runs
per arm. The first column is the download rate, the second the RTT the
sender's TCP sees on that flow, mean and maximum over the run.

  stock                              101 Mbit/s   207-239 ms, max 313-322
  series, default limit              101 Mbit/s    48-55 ms, max 62-64
  series, BE aql_txq_limit 500/1000  101 Mbit/s    26-27 ms, max 31-32

With the access point's rate pinned to VHT MCS0, one stream, the same
frames are twenty times the airtime:

  stock                             23.6 Mbit/s   502-523 ms, max 871-1139
  series, default limit             23.3 Mbit/s    30-32 ms, max 38-41

On stock the download's own RTT is the depth of the hardware queue. With
the series the airtime queue limit bounds that depth, the station's aql
file reads 12024 us at the median against the 12000 us default high
limit and 1008 to 1024 us at 500/1000, and the rest of the backlog stays
in mac80211 where fq_codel manages it. A second flow to the same station,
a 20 Hz ping from the same wired host, reads 8 to 11 ms in every arm
including stock: ath11k spreads frames over three TCL rings by the
sending CPU, so a frame from another path lands in a ring the download
does not fill.

The 500/1000 setting is for a fast station. At MCS0 the station's aql
file reads 1308 us and the download drops to 9.3, 11.8 and 11.8 Mbit/s;
no default is changed, and where the limit sits is left to whoever
configures the access point.

mac80211 skips a txq in every other scheduling round once the access
category is over its airtime limit; "wifi: mac80211: keep the TXQ
scheduling round number across a closed round", posted separately, fixes
that. The downloads above do not depend on it, since the network stack's
arrivals start rounds often enough to cover the loss; a download
generated on the access point does, and reads 35.6 to 44.4 Mbit/s at
500/1000 without it against 95 with it. Everything here is measured
with it applied.

The airtime AQL charges is close to what the hardware reports. Comparing
what mac80211 charges against the radio's own measurement for the same
station, as pending airtime over outstanding MSDUs and as tx_duration
over completed MSDUs, the charge is 47.2, 50.9 and 50.4 us per MSDU
against 90.9, 92.6 and 91.4 measured, a ratio near 1.85. Part of that is
structural rather than estimator error: fes_duration_us spans the frame
exchange sequence including the responding BlockAck, while
ieee80211_rate_expected_tx_airtime() amortises the overhead over an
assumed aggregate. Patch 3 exposes the driver-side outstanding MSDU
count so the two can be compared at all.

With two stations on one radio, a 1x1 VHT client and a 2x2 HE client both
receiving at once, airtime_weight is refused with -EOPNOTSUPP on stock.
With the series and the limit binding, the HE client takes 52 to 60 per
cent of the airtime at every weight setting, nine runs, and the weight
does not move it: the scheduling order never reaches the air on this
driver.

Patch 1 is a prerequisite for patch 2 rather than an unrelated fix, and
the series should not be split on it: the tx completion path it corrects
is also the path that returns the AQL charge, so with the feature bit set
and that path still calling dev_kfree_skb_any(), pending airtime for an
access category rises without bound and no station on the radio is
scheduled in it again. It carries a Fixes tag and no stable Cc, since
the completion statuses it covers were not seen on the tested hardware.

Patch 2 advertises AQL. Patch 3 reports the outstanding MSDU count.
Patch 4 registers per-station transmit airtime and advertises airtime
fairness, which cannot be set without the reporting because the deficit
has no estimator fallback. Patch 5 moves the scheduling round into the
driver so a second context can drive it, patch 6 drives it from tx
completion, and patch 8 ends it when the hardware has no room. Patch 7
registers the hardware's per-PPDU receive duration into the same deficit.
Patch 9 bounds the tx completion handler to the NAPI budget, so that
the round patch 6 adds runs once per budget of completions rather than
once per ring. Patches 6 and 9 carry their own measurements.

Two notes on overlap and prior art.

"wifi: ath11k/ath12k: implement TX flow control" [1] also replaces
.wake_tx_queue in ath11k, to stop -ENOMEM under a full TCL ring. Its
handler serves only the TXQ it is handed and calls neither
ieee80211_txq_schedule_start() nor ieee80211_next_txq(), so it removes
the deficit round robin that ieee80211_handle_wake_tx_queue() performs
today and forecloses airtime fairness on this driver. This series keeps
that scheduling and adds the airtime accounting it needs; patch 8 handles
descriptor exhaustion by ending the round on -ENOSPC or -ENOMEM rather
than by reading the ring pointer once per frame. Both series replace the
same callback, so they conflict textually; if that series lands first,
this one will be rebased onto it and its ring check moved into the
scheduling round.

An AQL enable with a custom .wake_tx_queue and a tx-completion driven
push was proposed for ath11k in 2023 [2]. The design was right. What it
was asked for and did not have is the measurement above.

A related mac80211 change is posted separately, "wifi: mac80211: scale
the airtime queue limit by the station's weight" v2. On this driver
every station keeps its full airtime queue limit in flight and the
firmware picks the next transmitter among them, so the order
ieee80211_next_txq() produces never reaches the air and airtime_weight
has no effect on the split. That posting adds IEEE80211_HW_TX_NO_PUSHBACK,
scales the per-station limit by the weight for a driver that sets it,
and sets it in ath11k as its second patch. With this series, BE
aql_txq_limit 500/1000 us and that change, the HE client's share of the
airtime is 57.8, 57.5 and 55.1 per cent at equal weights, 73.8, 76.7 and
74.4 at 1024:256 and 22.6, 22.7 and 22.4 at 256:1024. The one-line
ath11k patch that sets the flag depends on the mac80211 patch and is
posted with it rather than here.

v4:
 - rebase onto ath-next, commit 1d8e73163ef9 ("wifi: ath11k: unregister
   PM notifier on QMI init failure path")
 - measure with a download forwarded from a wired host and report the
   download's own RTT. v3 measured a download generated on the access
   point, which TCP small queues bound before the hardware queue did,
   and probed from the station, which measured the station's uplink
 - a mac80211 fix posted separately, for a txq skipped every other
   scheduling round once the access category is full; v3 was measured
   with that bug present
 - patch 1: drop the stable Cc, say the statuses were not seen; move
   Tested-on above the tags as the rest of ath11k does
 - patch 2: drop the claim that the TIDs of one station test the limit
   independently; the pending counter is per access category
 - patch 3: the idr bounds the count added here, not the ring-full
   counter
 - patch 4: say why the lock nesting is safe and that each MU user is
   charged the whole PPDU as arsta->tx_duration already is
 - patch 6: start a round only for the access categories a reaped
   completion belonged to, and carry the with/without measurement in
   the message
 - patch 7: the default monitor status filter does not subscribe the
   user stats TLV that names the TID, so charge received airtime to BE
   unconditionally, and register it after ab->base_lock is dropped
 - patch 8: a full management queue also ends the round; the frame that
   met the shortage is still freed, and ath10k and mt76 avoid that by
   checking before they dequeue, which the message now says
 - patch 9: state what the budget does, which is to run the round of
   patch 6 once per budget of completions; the claim that receive rings
   wait behind the handler was wrong for IPQ8074, whose tx completion
   rings share no NAPI poll with them. Measured with and without
 - cover letter: the mac80211 weight change now gates on a hw flag the
   driver sets, the ath11k patch that sets it is posted with that
   change, and the airtime split is remeasured with it
 - v3: https://lore.kernel.org/all/20260824142350.1757379-1-julius@bairaktaris.de/

v3:
 - cover letter: v2 claimed the AQL estimate runs an order of magnitude
   under real occupancy. That was wrong; measured against the hardware's
   own tx_duration the ratio is 1.85, reported above
 - cover letter: v2 described the mac80211 weight change as posted
   separately while it was not; it is posted alongside this version
 - patch 1: state that the AQL half of the rationale needs the feature
   bit patch 2 sets, so the stable backport is not read as describing a
   stall that cannot occur without it
 - patch 2: correct "nothing restarts it until the next frame arrives
   from the network stack"; a round also starts on a block ack session
   change, a station leaving powersave, and a stopped queue restarting
 - patch 2: drop "cannot behave worse", which the same message's note
   about a stale rate contradicts
 - patch 2: say why pending airtime stands above the limit it is tested
   against
 - patch 3: the idr holds one entry short of DP_TX_IDR_SIZE
 - patch 4: drop the assertion about firmware TID markers that no ath11k
   header defines
 - patch 5: correct the claim that only a frame from the network stack
   can start a round, and the claim that mt76 relies on bottom halves
   being disabled; mt76 runs every round from one per-device tx worker
 - patch 5: state the bound conditionally. A selection ends where the
   airtime queue limit binds and drains the station's queue where it does
   not, which is what the generic handler does today
 - patch 6: the comment no longer says nothing else starts a round
 - patch 8: -ENOMEM also covers a DMA mapping failure
 - v2: https://lore.kernel.org/all/20260824074228.2114579-1-julius@bairaktaris.de/
 - v1: https://lore.kernel.org/all/20260823195703.49198-1-julius@bairaktaris.de/

[1] https://lore.kernel.org/all/20260811172435.616200-4-jtornosm@redhat.com/
[2] https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/

Julius Bairaktaris (9):
  wifi: ath11k: free tx skbs through ieee80211_free_txskb()
  wifi: ath11k: enable airtime queue limits
  wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
  wifi: ath11k: report tx airtime and enable airtime fairness
  wifi: ath11k: schedule TXQs from the driver
  wifi: ath11k: run the TXQ scheduler on tx completion
  wifi: ath11k: charge received airtime to the station deficit
  wifi: ath11k: stop a scheduling round when the hardware refuses a
    frame
  wifi: ath11k: budget the tx completion handler

 drivers/net/wireless/ath/ath11k/core.h    |  5 ++
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 +++
 drivers/net/wireless/ath/ath11k/dp.c      | 10 ++-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 32 +++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 28 ++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  3 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 81 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/mac.h     |  1 +
 8 files changed, 157 insertions(+), 13 deletions(-)

-- 
2.53.0


