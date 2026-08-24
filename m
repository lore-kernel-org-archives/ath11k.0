Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930BC5DF94
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HXM+WNd+B2XYbg3o+nNvm3AmAwWPtOhb9tONzD0mz1g=; b=dyoVp2d+89x798uA/27c/t/BM+
	OdYyVcUUgeIBf4n4Hv6P5X8p85uyGCE8Kx6HqJeZ5I82pBStpPMGTRxaL+AmgezQeLj1SlFTeH7Sk
	+Uj8oiXmjcvXC5UR/Uvqb1XztEq8q47hS7/cN8GwXw5Ycops0frWQ3Cy4gXRyfJhgDszi/QYb368/
	f5yPI+HRChZFp9aQRBhb0EQFuAok5tnyUS2Eiwj0k7oJda5btO7SW06QjHhYmQ9pN2kW/5dqafVNt
	hFsWhdokYOHVGM/GSD7AJWbV+aQbLKf7dnXwZlpjmz9tWdbbDfwt18al6eHLKCxKWtIW8O1V5EHVt
	KLYGryHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbN-0000000Glyn-2QOP;
	Mon, 24 Aug 2026 14:24:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbE-0000000Gls1-0GnU
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c16794450aeso510196366b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581470; x=1788186270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXM+WNd+B2XYbg3o+nNvm3AmAwWPtOhb9tONzD0mz1g=;
        b=Q6gR2SYzOKgj77iSTy/llLpdTXbsvLBbJ3dXT2d4lqUHPS6thkpNXErUercdOFqyRi
         d6oeZDHltxw5bBqjiKzyamrOWrJPHiopf5dFNW2U6duuOkr2pJzmnixwa159DkJLmMsl
         Gf3P1cJzGnlAl8BtTKPflt+IC3rGPNmGC1XnZPX0xg7pssFLld+kHGXIbSMV79gQtFIM
         pswdhE0gUUSFt9jCc2w5xaz+BeHPxW5ONpAlqAv4CfGPaP6hlGR1+O0JcFq0Gzm8AEGc
         HvvLNQgEZYBdNZScl3y1z6fcW2IaDdibwIhNKjjg2Uw/ENOmRvhL0qSn67Pxpi+5cxYP
         rk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581470; x=1788186270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXM+WNd+B2XYbg3o+nNvm3AmAwWPtOhb9tONzD0mz1g=;
        b=H1fdRmAnZlHCojY29fskGNr7I5EJEoGjqOMzuGM6ELlmigtjIWWZOkO/Ttx7GldVqN
         AFFgu4sxn+ql0NUwQ0NdCfPg8EQCYkY4lfFUbWFqFg655PPHGyCqfBLmFoATIYp6rkdp
         gtxxsVeAg+TjNhhQjt5rgfhtkyu3yEOc7JCDn654sHE7UJq0LheiyQ6AWDBGnmeZiC8f
         p04vd+44fDD0sm1SxGYUGVScqkZ5ox0OchJxgOTZC5ijgZehPUs+FP09PXJe96kHtGU+
         VRAtx7cYkMUwnBxPBCh93LpC/8Z4TBUqwIuAGjAcHQ3FaXe+D3KYBDerSaWGm6rqVbzp
         hcJA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9glk68Ueaxgkupeq0IcLgYXT/gOp0bywsPtwXmN/07UgsmtOi791FEFrjLBjbyD/uWgAC3Zk=@lists.infradead.org
X-Gm-Message-State: AFuF++nrJpMYbViYbn9OjQkMG2ehiYbPRFv4r9VT3BTiAhzsBVg0Xftq
	0F0Zgr2LpkRpEzYALaRCrzLnVihMEu1Zt1wl8X1H0OMxT1kd2pDzBNXEQv6bKV1/GtrAOAWGscA
	idWWWNn6o
X-Gm-Gg: AR+sD12Im7xxTiv7u9f9H9DwYB1UTQERJ5pKx7Ll1SOZt6FtsHSkVcqa1ugzGcz69Xy
	EFs4W4tpI+Eyt746CIJXFqRoj33Pb2KYUXmVBMwe1JCfIRN358ZzkKcaN5k7eAQFCkKGXwj9LjD
	Ig22b0chOhnYFlThLuWU2ijt/UkXc7KJWJeKxVvTD4BgYqPux3r8kr56CBlbakyiOmF172HilVc
	ZappKgV9c4xpW8ohE3dNq6S5a3KbvKF0rW8s0DIKTUJerSoLzw+RuLJbdEjqamPn75OCI0ygZXe
	f1MyyuF+coSn5jFmf84tIIwjdX0IKr8kIrXgCFZGQjvEfExz2AMfV+ETDFPu2e/6+qjw2J1o5NE
	ZeejS/lpDuTeQYK+rNiAB36Z3T2El0Xne+GtANeqeiXoD6neNk9OMwiB4jOdpO63xy6qQYZLVsR
	A9xGdew5EiczPlShTQ96jcgK0vTGcHPbAJncoUFIL2/rJOMYQB98LRcmB2r8oh7H4ak86/GUWbK
	857ERJJ52Bg84MIyz3FHnW0kJB3RS73Zi5/wyrIw5eRxgo0sbesKDnB8sOy9WYvdNuTxfEu9bEn
	dzyONtdBg3xzA0r3Gv+mswyLkeNgHJfMoQzkPxiWL8Uz4yQlAv6QszB7hbMHvJQcVVZXKRoFCyI
	FcKuWHebrUnGsKKvQuqmB2FdI4fIshaKe3UCWBm42QtqVbjHiUNg1rQQ9O0q+y/8dhtl8X7dI
X-Received: by 2002:a17:907:b048:20b0:c20:1c9c:b36f with SMTP id a640c23a62f3a-c246a4b154amr2154119866b.8.1787581467698;
        Mon, 24 Aug 2026 07:24:27 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:27 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ scheduler
Date: Mon, 24 Aug 2026 16:23:41 +0200
Message-ID: <20260824142350.1757379-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_930291_DECE7343 
X-CRM114-Status: GOOD (  27.30  )
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
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS, and every user of either inside
mac80211 is gated on the corresponding bit. Both mechanisms are inert on
this driver, and the driver keeps no queue of its own, so on a saturated
download every queued byte sits in the hardware TX rings, where there is
no AQM and no flow separation.

Measured on an IPQ8074 access point serving one HE station: saturated TCP
downstream, a 20 Hz probe from that station through the same access
category, arms interleaved, three pairs each.

  stock                             94.6 Mbit/s   155 ms
  series, default limit             94.0 Mbit/s   157 ms
  series, BE aql_txq_limit 500/1000 74.3 Mbit/s    22 ms
  the same, patch 6 reverted        33.7 Mbit/s    21 ms

On stock, mac80211 reports no pending airtime and one frame of FQ-CoDel
backlog, and aql_txq_limit has the same effect at either setting, which
is none. The series puts the queue back under mac80211's control at no
cost where the limit does not bind, and roughly seven times lower latency
where it does. Patch 6, the completion-driven scheduling round, is worth
2.2x throughput at identical latency and nothing at the default limit.

The default limit does not hold the queue back because the queue reaches
it only at peaks. Sampling one station's own aql file at 1 Hz across
three 60 s runs, pending airtime averages 4.0 to 5.5 ms against the
12000 us high limit and peaks at 12.0 to 14.0 ms. At 500/1000 it sits at
the limit continuously, which is where the latency goes.

That accounting is close to what the hardware reports. Comparing what
mac80211 charges against the radio's own measurement for the same
station, as pending airtime over outstanding MSDUs and as tx_duration
over completed MSDUs, the charge is 47.2, 50.9 and 50.4 us per MSDU
against 90.9, 92.6 and 91.4 measured, a ratio near 1.85. Part of that is
structural rather than estimator error: fes_duration_us spans the frame
exchange sequence including the responding BlockAck, while
ieee80211_rate_expected_tx_airtime() amortises the overhead over an
assumed aggregate. Patch 3 exposes the driver-side outstanding MSDU count
so the two can be compared at all.

With two stations on one radio, a 1x1 VHT client and a 2x2 HE client both
receiving at once, the slow client takes 63 to 72 per cent of the medium
on stock for 95 Mbit/s while the fast one gets the rest, and
airtime_weight is refused with -EOPNOTSUPP. With the series and the limit
binding, the split is 44.4, 43.9 and 44.0 per cent at equal weights.

No default is changed. The series makes the existing knobs reach the
hardware; where the limit sits is left to whoever configures the access
point, and the curve is a continuous trade rather than a free win: on
this hardware 900/1800 us gives 92 Mbit/s at 127 ms, 550/1100 gives
81 Mbit/s at 31-46 ms, and 500/1000 gives 72 Mbit/s at 19-21 ms.

Patch 1 is a prerequisite for patch 2 rather than an unrelated fix, and
the series should not be split on it: the tx completion path it corrects
is also the path that returns the AQL charge, so with the feature bit set
and that path still calling dev_kfree_skb_any(), pending airtime for an
access category rises without bound and no station on the radio is
scheduled in it again.

Patch 2 advertises AQL. Patch 3 reports the outstanding MSDU count.
Patch 4 registers per-station transmit airtime and advertises airtime
fairness, which cannot be set without the reporting because the deficit
has no estimator fallback. Patch 5 moves the scheduling round into the
driver so a second context can drive it, patch 6 drives it from tx
completion, and patch 8 ends it when the hardware has no room. Patch 7
registers the hardware's per-PPDU receive duration into the same deficit.
Patch 9 gives the tx completion handler a budget, which it did not have
and now needs.

Patch 9 was unmeasured in v2 and is measured here: two soaks on this
series, a 91 s TCP soak at 1033 Mbit/s aggregate over five streams,
about 86000 completions per second, and a 60 s soak of 200-byte UDP
datagrams at 60906 packets per second. Neither produced a
status_fifo-is-full warning or a TCL ring-full failure. The bound the
patch adds is on the consumer of that FIFO; a device sustaining a
materially higher completion rate than this bench can produce would be
the case that changes the answer.

Two notes on overlap and prior art.

"wifi: ath11k/ath12k: implement TX flow control" [1] also replaces
.wake_tx_queue in ath11k, to stop -ENOMEM under a full TCL ring. Its
handler serves only the TXQ it is handed and calls neither
ieee80211_txq_schedule_start() nor ieee80211_next_txq(), so it removes
the deficit round robin that ieee80211_handle_wake_tx_queue() performs
today and forecloses airtime fairness on this driver. This series keeps
that scheduling and adds the airtime accounting it needs; patch 8 handles
descriptor exhaustion by ending the round on -ENOSPC or -ENOMEM rather
than by reading the ring pointer once per frame.

An AQL enable with a custom .wake_tx_queue and a tx-completion driven
push was proposed for ath11k in 2023 [2]. The design was right. What it
was asked for and did not have is the measurement above.

A related mac80211 change is posted separately: the airtime
queue limit is the same for every station, so it binds before the deficit
does and airtime_weight has no effect on the airtime a station receives.
Scaling the per-station limit by the weight, bounded by aql_threshold,
makes a 4:1 weight produce a 3.6:1 airtime ratio on the pair above and
1:4 produce 4.2:1, where without it the same three weight settings all
read 43 to 44 per cent. It is only useful on a driver that has the
accounting this series adds.

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
 drivers/net/wireless/ath/ath11k/debugfs.c | 12 ++++
 drivers/net/wireless/ath/ath11k/dp.c      | 10 ++-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 40 +++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 26 +++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  3 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 84 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/mac.h     |  1 +
 8 files changed, 168 insertions(+), 13 deletions(-)

-- 
2.53.0


