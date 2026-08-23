Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C48C5DF9B
	for <ath11k@archiver.kernel.org>; Sun, 23 Aug 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2t4yG6gfh8pMrdVrUa/k3ybLPI1hNpC6NthZHGNkDo=; b=ntgyjZWhxh7ZcqA7sEPuM/x+42
	4ero2JFSdf8riseX0vLnJlx+9USKM8U5zHMRSlrCd/ZEBsgN+F5N1maxGxu9aGjI3J7VdeoRx+TfS
	IPx3yKDYSZ6nGcUIrlK7z6E6OHd7yKS7quIx5TOf+rZaF5n2egC1q0nGEaq6pK939AwoZk5Ok2n+t
	WMBQhtAS4rQU2kDhN80XJPlmHIlmijx9gFqttIDPweIVK/vZKCkP28WtNJyfC7LVqJ1F7hvcBP5gX
	KLou9hCMLRP1DbNXoO5T4wCkRVL9PXFs6QGtK+mCpu/6U5cbZcCTb/YRtyxMzNs7xLSVp2id0El+B
	7MucG6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK9-0000000FZvu-28AV;
	Sun, 23 Aug 2026 19:57:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK3-0000000FZsz-28Z1
	for ath11k@lists.infradead.org;
	Sun, 23 Aug 2026 19:57:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c1670dad7a8so486089266b.3
        for <ath11k@lists.infradead.org>; Sun, 23 Aug 2026 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787515058; x=1788119858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2t4yG6gfh8pMrdVrUa/k3ybLPI1hNpC6NthZHGNkDo=;
        b=VciPzSIaL7KbViA5c7I2BAgKJFiKGLBgSRlCfp8gvUNYxhzpK0C7Iy5gagzLgA1p9n
         WbetgilCxzLwUGtAAV8qUerkukrLMdHAnwY/FATvSN4e4R7NKbuf8+zc3X9Wvd5b/C+p
         K4bxCpQbvN8DHO284K0V+w0UGD1R9KzO3XqMhWVwHnfdCJPXuvQBpGtuY2EaHZ8DUZ84
         4hHzxOfDqg7Vqivv5Hsgm482leWVVzgYh6eq22jKxxIcUY6kVo/AR5qUpTRF1HliAICm
         JrF11AiV62Xc188y31JtUAzzxF/Mfy+XwRo1oERDP8UoDC93EbnCXuTvtZBBuBGuBWZp
         3Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515058; x=1788119858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2t4yG6gfh8pMrdVrUa/k3ybLPI1hNpC6NthZHGNkDo=;
        b=d6unIkqSHzAQV7Eyg1fDTBzlMSkfm0TOpdSMSFOO4l0cK5REq+3yVV201wMdSpaZY0
         GtCwPALooGT4/jEVOQdlBGxTMrpHV2uvO0f8qASC45UTHB2il9QiKMpYJN3SvtFmM68u
         OSZhZNjRxk/J6Hk1fXScIAfT3bHKuSRCbquJ6LIR6n5M/S9/ciAU3Vdtq6Lxd+P09g2N
         +RG9lefORVcHUhQw1lFhaICZV8cpfRLU2kHvIwRZptOxJcdJJp2yDtPcN+uPLy6NMpYb
         Zr9FPLxX0qDTNNB6RQn5zj9ktNAilUyIUYf9trOCTFwUUeGxcoy/s8S1uMxenmUDssyI
         EitQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpg22KYWLn8ayeFpgeEdqU0Byj9JOmTc7CVm9sIV19bKqUAI6azt5k02+am91J93ChNmQExKw4=@lists.infradead.org
X-Gm-Message-State: AFuF++l1IiH+PvkhYACC+nkPIsRdp32c9lT0bjKcO7KSqNrvYTG3wBep
	VB8YPTwfzyDKdZkIEbeDKufVjTnUxRWRp6rC5xNtFpejLjaVRn1vZM+wVwWwTvbKjw==
X-Gm-Gg: AR+sD10MUgpB8AAl2pAf56syGuhZJcDQ3tyF7hi3Xh660zp3BwrVKD4pFnxdKVcGjue
	5LT5TELVkIcs85Vv/sR++ZaKloOr7ooMKAEpSJU659jkvgbob3do8XNqfJn+0VHOp6QAavX1j7d
	qciZ2qq3bRNRU+GhxPsxST/WKys0AIvtQNwSklNhMK8MLRlxfMpMUoahMNsbdehPnraUVJ1ntP1
	cFR0V+nSZia4mh04Y8OqLIPwO9ODvyJubaR7hspHbxQ8gomRcNCV5heKRSY4q6bb8SSiY7pgxTm
	eVAs7MKKQnVt3BdPkNw/1exIAq0gVZJ2RHvUWJ2wBVjAS/IXMGYQCry97EJ8fXCoPTUUaLtGnLD
	P9dLNLog+PKp23QhJ9ypWf52U58gPeKgg1k7qxQMIn/hSPWE0IT5NPJ2UAy0K8gRi1Zr1Dz5blR
	6gboOi1u2U5mgiLCmLEfVWKD4FsrOntF+BLrzm3267Oy4HkxcAK8J2zFjDULxCSp/a/JDhWcPU4
	0M8I/bAtlJj0ubEmcNn2lJI5OUmqHCjU1pRnnBPhw7YgwOSHfGa4RtPb13rTMnA3yyK4XUvPqGg
	iuAPu90wZsUo5vFlWKOVPAhq7Oeyh6WI4ZDQynSpaquaWJZUIpf1E6GIp0LVFDOVnnGBGeTA4AY
	vA6CI7g/9cGGLxEWU4fdxDCUBo6WY8D2y0cBl0P9S9EuA6oDHAjk8Rrmo8qWZeiop9oOJFOt98X
	eViLjaaUhpA2ar3Q4Od+Gre3w=
X-Received: by 2002:a17:907:d08c:b0:c16:8931:245c with SMTP id a640c23a62f3a-c246a72fdcdmr2465179066b.21.1787515057687;
        Sun, 23 Aug 2026 12:57:37 -0700 (PDT)
Received: from Desktop (pd9513a95.dip0.t-ipconnect.de. [217.81.58.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8edsm889532666b.6.2026.08.23.12.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:57:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH v1 4/4] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Sun, 23 Aug 2026 21:57:03 +0200
Message-ID: <20260823195703.49198-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823195703.49198-1-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_125739_575590_E7BA59C5 
X-CRM114-Status: GOOD (  15.65  )
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

mac80211's airtime scheduler charges sta->airtime[ac].deficit from one
place, ieee80211_sta_register_airtime(). Unlike AQL there is no estimator
fallback, and ath11k never calls it, so the ATF feature bit cannot be
advertised on its own: the deficit would only ever be
replenished, every station would stay permanently in credit, and the DRR
would be inert. The bit is not a no-op in that state either, because it
also moves txq insertion to the head of the active list, which
__ieee80211_schedule_txq() documents as safe only because the DRR moves a
station back once its deficit goes negative.

fes_duration_us arrives with every PPDU's stats and is already
accumulated into arsta->tx_duration a few lines above. Register it, and
set the feature bit in the same change so the two cannot be separated.

Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
client at 433 Mbit/s and a 2x2 HE client, both receiving at once. Before,
'iw station set <mac> airtime_weight' is refused with -EOPNOTSUPP and the
per-station airtime file reads zero. After, the weight is accepted and
read back, TX airtime accumulates, and the per-AC deficits move.

The fairness this delivers is coarse. Weighting the fast station 4:1 moves
the slow station's share of airtime from 59.5% to 52.1% and the fast
station's throughput from 315 to 392 Mbit/s: the direction is correct, the
magnitude is not the ratio requested. The granularity is bounded by the
driver's push model, since ieee80211_handle_wake_tx_queue() drains a
selected txq whole into the hardware and the scheduler therefore reorders
only between selections. Tightening the AQL limit to shorten those drains
does not improve it: the share moves by one point and aggregate
throughput falls from 401 to 178 Mbit/s. Finer control would require a TXQ
scheduler in the driver.

Two properties of the source are worth stating. fes_duration_us spans the
frame exchange sequence, so it includes the SIFS and the responding
BlockAck, time the radio spends receiving; the airtime registered is
therefore larger than the airtime transmitted. And it is a per-PPDU field,
so on a downlink MU PPDU each user is charged the whole sequence. No
per-user duration is reported in these stats. On the firmware tested here
every PPDU carried exactly one user, measured over 21051 PPDUs, so the MU
case is latent rather than observed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 +++++++++
 drivers/net/wireless/ath/ath11k/mac.c   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..33c6fd9553a6 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1485,6 +1485,15 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* tid is HTT_PPDU_STATS_NON_QOS_TID when no ack/BA TLV came with the
+	 * PPDU; mask it so that airtime lands in a real access category rather
+	 * than one chosen by the spare bits.
+	 */
+	if (tx_duration)
+		ieee80211_sta_register_airtime(sta,
+					       tid & IEEE80211_QOS_CTL_TID_MASK,
+					       tx_duration, 0);
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
 	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 38f641bbc53c..40a2b6d2f804 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10593,6 +10593,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


