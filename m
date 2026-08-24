Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F3C5DF9D
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjcWIAy7x/ETai6n4CfB8f6nIC+kIzPbY8w6pVYrWR0=; b=iZQ4LZvf36cVTe8wgaM3kRbHkV
	iJ+PJnjwSRYFkx/gf9mU98Ocs7/etw/b7JeN1t98eu/3HlN8h/Touk0iadc2mnhw7Zp7LGdhz35ng
	mgLLy7bUiRn4V9x1XMzI6o0evXn0oJ22ipig+mcbjWFMXP9L+/DCwpqe9/RQOmu8Fygg5WTIrTegT
	fHil+FmRZnYB9OCBuxNqQtQ9F2RUUU6/O3QFFpKvfnz2HPmTlfPDCVvxFiiQ1Bl+dmbThKlaFD5ta
	Au9x66sZEjQd1gWC4J7t2W8jG7a9kz4F3LBhMg6uqZnvNqi/BA6HhQyF25vi+YFJg6PzrtX1kA5er
	WlzlQx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKa-0000000G799-3Oad;
	Mon, 24 Aug 2026 07:42:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKX-0000000G76q-08n8
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1671ec8692so445456866b.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557371; x=1788162171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjcWIAy7x/ETai6n4CfB8f6nIC+kIzPbY8w6pVYrWR0=;
        b=R1XL1rKOVBGEJOPcD83rNXz/uo4M+22EOvhV7HBUyYZUdWKlFCJElE6icV6MxQRM+j
         vnGw12BW+A7p/+DwOX9xfe8h8dgb5YZAVp01Usvx3Bx55FuhubDekIcvlAJdKqLE8fbq
         5O29NS/wcmJF89BAtR/ivH3g39Xuig2hq1G0Tj+vC335ANakKjKTFAoQTrbEDjXqD1dF
         IlTw+8rrHe2itW7lNq/lTr7Z70r2l9YCeBZuntPPBm4H7aIqwjgw6zrKTjcF9YTOMRUA
         rdDwjcEYtuxLMGIdzE+AvFrzEaFqb7l/j03dIY27WNXm5Ueal++PRKzU+6ZT0cRq26Vn
         4XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557371; x=1788162171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjcWIAy7x/ETai6n4CfB8f6nIC+kIzPbY8w6pVYrWR0=;
        b=JpvcnQcEkGJfJIQUnQdtq9OEj4ZmoBY3U4fXKGj20MpecHNuo8G14Jlmzlx2BuAqxI
         37rAQvwTC529R219GRgnhB4fK2KQBQWOZOukYLz/RiOxoVpPiMAm8YbePV35p5n8roLV
         yI3BKLXmG/mVfywBk2GdbDryKjBMXGaR09t5wIwSxz4Xjy7k+0eolubl0a1JMv6Omqv0
         gJ+BgkbQz9ZgBC4zc45hs+5fhlAUPowR0i3hFfPAMp64YM3VgBV5vs5djTczh4PL4XyQ
         lmRYyfttqaDPjcR70uDgak5/bI6bMUL0lvVgbcZZLpCpd3hnoXXG4IEck6RH6s+XBBFU
         ksIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp64t8lD+Pzyb6Wg1PSbqpxaps8EBYcinV+N+zfL5Xkr8/BMw2TEpfxU1fmgToJpflm4coWj1A=@lists.infradead.org
X-Gm-Message-State: AFuF++nH76E3pjEKE2dj/3/qxVite96ZZ5OPfv1C1ahC3u6kA+B8stP/
	auEJYlaa7mrHEUXNJ0HsT40VOmXQPHDznqKLcrQY/l3RX79Zs/xLZgF0DwO+wZgclg==
X-Gm-Gg: AR+sD10HZrVJAIiHfgF0A0xJCyFb8I12M7Idv5fTMbrbPcALkZzVinfRc86qZpIvsnN
	Zyox+6k/5VIBqpcPn38ScmrQrGSGdDpfRBd8tOR2I/x1exiMXTYl6KO76dAa0w+dsvXCT5B9VO7
	2ShGpJ8LvaBPZ6GSlAY8lmaz2WHHpMFw0RCIsJHcZmEAEvQpVk7f1Ee6sOeX/jXq3NtnzCxxGJK
	rsm871pMdwaVmNUBs7wczTC+kqwHPO53/aIxM30gyiRQMMQCHI88KD+mYUB4k5gjZKoOXwHL0Kg
	O5LrXFilw81B5R6M/Cjl1gL1+n60Zdk5mWTMNVcwkA/jPEa9LsRGQe+Pm+dJ48hbR3geAM62u6q
	sWfurej19zMpX7ULWR675ImyEXuRvFvBEl8VFbHFCuA3p3NcSiNMuPhn9DwlP6E6LffOzGjlywz
	rg0jhbPLnk7DiQfiidtUWcWOZZqF0NiVNHTenzT6PpRHwMuCQpxXvlAmInch/29JRIJgDrx7CJ3
	vnMjBza6t4ZdlYaoS9Hs14C8FQI/vRxH8pRQBZZuvEVp1TOEqkTj62b+LPOjMdVyskcYOZT3eo6
	6CHT+y6wCOf3hOnm/yA6Nd6f3ow/Fx8nARSRoOMbITL8tgt9q6UeLJ5lAw/BRdF6bh4MZAVkj1Z
	vyyX4iMRgToJI9u15cZNrqWcomua7wdG5MYI8vpyWIQVbmzRCph9+Rp2uyp5C2wdkf3dAIo/Ne3
	t1NtPd7VfMEvBfug==
X-Received: by 2002:a17:906:ba8f:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c24920e2f93mr2097394466b.23.1787557371057;
        Mon, 24 Aug 2026 00:42:51 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:50 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ scheduler
Date: Mon, 24 Aug 2026 09:42:19 +0200
Message-ID: <20260824074228.2114579-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004253_123740_B4EE68CC 
X-CRM114-Status: GOOD (  25.87  )
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

With two stations on one radio, a 1x1 VHT client and a 2x2 HE client both
receiving at once, the slow client takes 65% of the medium on stock for
95 Mbit/s while the fast one gets 35% for 550, and airtime_weight is
refused with -EOPNOTSUPP. With the series and the limit binding, the
split is 43-45/55-57 at equal weights.

No default is changed. The series makes the existing knobs reach the
hardware; where the limit sits is left to whoever configures the access
point, and the curve is a continuous trade rather than a free win: on
this hardware 900/1800 us gives 92 Mbit/s at 127 ms, 550/1100 gives
81 Mbit/s at 31-46 ms, and 500/1000 gives 72 Mbit/s at 19-21 ms.

One result is worth stating because it bears on how the limit should be
chosen. A sweep of 12000, 6000, 3000, 2000, 1000 and 700 us shows pending
airtime tracking the configured limit across the whole range while the
latency through the same queue only responds below roughly 2000 us. At
94 Mbit/s, 155 ms of delay is about 1.8 MB in flight while AQL believes
14 ms of airtime is outstanding, so mac80211's estimate runs about an
order of magnitude under the occupancy the medium shows. Nothing here
changes the estimator; patch 3 exposes the driver-side outstanding MSDU
count so that the two can be compared.

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

Patches 1, 2, 4, 6 and 7 carry a measurement. Patch 5 is a prerequisite
with no behaviour change beyond a narrower lock, patch 3 adds a counter,
patch 8 covers a descriptor-exhaustion path the tested configuration does
not reach, and patch 9 bounds a loop that was unbounded.

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

A related mac80211 change is posted separately: the airtime queue limit
is the same for every station, so it binds before the deficit does and
airtime_weight has no effect on the airtime a station receives. Scaling
the per-station limit by the weight makes a 4:1 weight produce a 4.5:1
airtime ratio on the pair above, symmetric in both directions.

v2:
 - add the driver TXQ scheduler, the completion-driven round, the receive
   half of the airtime accounting, the round-ending on descriptor
   exhaustion and the completion-handler budget (patches 5 to 9)
 - patch 1: state that it is a prerequisite for patch 2, and why
 - patch 2: correct the claim that the airtime estimator returns zero
   before a rate is known; it falls back to a 4 us floor
 - patch 2: drop the assertion that a driver scheduler is not needed,
   which patches 5 and 6 refute
 - patch 4: take the airtime TID from the completion and rate TLVs when
   the ack/BA status TLV is absent, instead of charging it to best effort
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
  wifi: ath11k: stop a scheduling round when the hardware refuses a frame
  wifi: ath11k: budget the tx completion handler

 drivers/net/wireless/ath/ath11k/core.h    |  5 ++
 drivers/net/wireless/ath/ath11k/debugfs.c | 12 +++++
 drivers/net/wireless/ath/ath11k/dp.c      | 10 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 42 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 26 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  3 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 82 ++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/mac.h     |  1 +
 8 files changed, 168 insertions(+), 13 deletions(-)

--
2.51.0


