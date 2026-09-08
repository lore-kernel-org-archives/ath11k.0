Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32B1C79F99
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=; b=16S23PEItfPnThmchAchUsJqXN
	NlxauHWYeqXV7uWlNFv7WGGWjeMx9nyLqvohFijTZXSo0PiXIzHlg59DPk3xAzdYIIvjG52+nxAAW
	iwrD6fkxkORvIqt+cdaLz5cxPmrnQoVS3SqtCKGrVOA35i4xOa7271UaCpY9tAx/DPNxbjP+S3Vbr
	77UUPatfd2HBrnhDMYM+6PeYDhGwpzuUa4wHaxrkkViPrn+1/ve/gJf+xOiQPRVn2u4qrV4EWz8ba
	FccXlitkGVxJQNjfrGN3dS0Mt9y2J47/owqndQxGQlWViS0mHnrbEN3kmoyx438KN8moppz0E825R
	ISIBI/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009Bos-03mf;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGN-00000009Bix-1Ydi
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=; b=B0yJ2UZQSsl0GW1MdksjQEP693
	SeWpUg2mqNcdeN8BbuNDtC86Lr9WRGz8Io71tGaQPanUi1dZrQmCWZoJK2jubkVoEeex2/isrRthc
	5vUglGo7bpW9srkBqccQUi5BWraelwTNZv14sG4HFi2XBIB5ILKECqzN3fwP7xvJH7IzW0ARvyR02
	AToXeOirtQ4p8QEXxJvdbt1ClQPy0bIa7W8Mtk+whQnyrwsIpwpzhHvUFR4lDE7fpZ5RcRc3YSLd6
	uzLX5fOIjAb75Ikccf7E9t9DNM/cQq+bEAKRgOTxxbJn9Gu/SMkNSdS7QJ86UuQglMZkW7QLr/ght
	lhckiHyA==;
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGK-0000000HUii-2ZeI
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:26 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c2537a164b8so171062366b.0
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875603; x=1789480403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=;
        b=R94PkOMzpR2b9h4wmSEyWipr9wgp5ku84HAkkU+i8Mm2iTxKa8mMfxwb/q6+D+k/24
         Sj1cohH25jdmVIZ69lPl1OG8fygv3RrijSCqH/J1/WnBTJUuQdJ1jngmIqf/1aBcpxqP
         ePCma8bV+/h+56VrdMkI5wyBAdWGKagLmwvmt55fTeqZWH529hW5WlMDxN28PrBgLae0
         MoIqxbQ2VixhE7nKYqTsrr1HgM9+PzqaJSqoJzFG8Z/KYu115LXkAVd4ofa2+e4GRkUv
         pXM8CiY+/agFVrQwvFvOMnBiPjEZE/MtrVaxAMoEHadCd9B0qzxdjEDqoODjK2UlZUOL
         dX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875603; x=1789480403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=;
        b=UnNCgQ3WJaOvjGQA+bzID756493wyGladjmFkBMH15tUlYHL3baU3aX4jm0fpZ26Q3
         3YveT/TEpRbX0JMcjL4BW8Roo9QkeYEBu2CTMAzEsQmOleIT+BhAh/zRKuqop5rQlngu
         J7790wlEIyI9c7PRK3+m7TmFHyIERwcYOmGPDZhjHbOcn8MPHjpvNZ/Lx7hR03GTHWeQ
         G9XinQExudvwgfYkj3DUX3PAmiNuyxXpdcmaTrW5IRiwoU9UnFlqDLPg5bl//StcWL/Q
         x74P+ZMzejmzUxsaec0WS5PURJ9H/zBw1VSkNb4eySZdI+cSy4ilL6eU5WpqIrRKjept
         fvlA==
X-Forwarded-Encrypted: i=1; AKwUvBwKmofzVE0+jTDjIur1GYUIa+wR12VOItHwUp3LJrgzoT/m+SeJKfuLHLidjot5KF2qK640+Ek=@lists.infradead.org
X-Gm-Message-State: AFuF++n7dwRPboOPYlq61dGQJiT/Hi3OwOwJ8wp60zHnNEgcmBtkv4U8
	gNXK3//Gjpb9USJNfkJOVEeTockNBh3/1NnnLcwPFgEkfs12zSp+7GH9p8vIrizP9w==
X-Gm-Gg: AYBFou1XYCD0t2+GtqhUdT0H99tlm3z+vLEK4O9NhUDxtG82v511G4wCgKo8PoBHhCa
	vfmpLxRFTfqURCxolU3uGfuImMheQbjr5y/bsx8l5XlueGf+ZePQKyqzhiXLnivWQpzwG9gDB3D
	1ILkVmm6EDwmcbdKEYHFkTbNCsaAqkH5UuuY3OzD5vhFoWafIXIEKmDDOReLT/v+PNUc0Kmjm/v
	esYajtOgm1/kP8EAYDth87pmFtdq+yyBRYHOFMuptJJKGY4+azisn/xd4UjrBI0zQ+/p+bLru/L
	YTd6LpBxmw7pZUZdBmF0RkuM1NVZp8cqZe4BJmFCgZ5jBpC5RpETYzsZelVk/loxo3TqLqdYHGW
	YTaqJ4EACkOQDUe+geUbJ4KW91g207FseHGlh7nb/VqSPGQF09TBXflUuDDPRSACe2n2kica6on
	da5KQqo63PssOZ/riWyyfTYazL5IOedGGIsK3cyxT7RMe3KC8JK2qgRI2j69t3PqOfaq/Ip5ulo
	4ZHggBqbkaHiHxof0wDsIOOBMbQFhNy8B9wOXrFrfWFaVGG3Z8jCZbmT0iAmADhvA0jHe5i71Sn
	YSS0ouGZmhB/Udffbd70zLPXh2wGkrr99GeDmlwB1GXjL9sDKyrlf3LauqOoymd0iKpCiKms6MH
	vm1HmIjyBtoMzfmricboRF4c1lurAG0SLnp0wNCDBM6b6KmnXUFaF4YBQIT6BIvsEIUCzGqRc4Z
	woiKlJPOjEOL0b
X-Received: by 2002:a17:907:d649:b0:c26:19e3:e982 with SMTP id a640c23a62f3a-c2619e3eee5mr931925666b.34.1788875603444;
        Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.22
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
Subject: [PATCH ath-next v4 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Tue,  8 Sep 2026 15:53:13 +0200
Message-ID: <20260908135319.754140-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145324_812755_BFBADCF5 
X-CRM114-Status: GOOD (  19.40  )
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
advertised on its own: the deficit would only ever be replenished, every
station would stay permanently in credit, and the DRR would be inert. The
bit is not a no-op in that state either, because it also moves txq
insertion to the head of the active list, which __ieee80211_schedule_txq()
documents as safe only because the DRR moves a station back once its
deficit goes negative.

fes_duration_us arrives with every PPDU's stats and is already
accumulated into arsta->tx_duration a few lines above. Register it, and
set the feature bit in the same change so the two cannot be separated.

The access category the airtime is charged to comes from the TID, and the
ack/BA status TLV that ath11k took it from is emitted only for a PPDU that
drew a response. A transmission that timed out, was filtered or was aborted
names its TID only in the completion and rate TLVs, both of which already
reach the driver and were read nowhere. Take the first of the three the
firmware supplied that names one of the sixteen QoS TIDs; a PPDU that names
none is charged to best effort, where ieee80211_sta_register_airtime()
also puts the management TID.

The call runs under ar->data_lock and ab->base_lock. mac80211 takes
local->active_txq_lock[ac] inside it and calls nothing back under that
lock, and ath10k registers from the same place under its data_lock.

Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
client and a 2x2 HE client, both receiving at once. Before, 'iw station
set <mac> airtime_weight' is refused with -EOPNOTSUPP and the per-station
airtime file reads zero. After, the weight is accepted and read back, TX
airtime accumulates, and the per-AC deficits move.

What the deficit can do with that is bounded by how the driver hands
frames to the hardware. Every station keeps its full airtime queue limit
in flight and the hardware picks among them, so the scheduling order
does not reach the air and a weight moves nothing on this driver by
itself. The bit is what makes the weight settable and the deficit real;
what acts on them is a mac80211 change posted separately, which scales
the limit by the weight for a driver that says it pushes everything.

fes_duration_us spans the frame exchange sequence, so it includes the
SIFS and the responding BlockAck, time the radio spends receiving; the
airtime registered is therefore larger than the airtime transmitted. It
is a per-PPDU field, so each user of a downlink MU PPDU is charged the
whole sequence, as arsta->tx_duration already accumulates it; the stats
carry no per-user duration. On the firmware tested here every PPDU
carried exactly one user, over 21051 PPDUs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..68472e1e748a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1377,6 +1377,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1485,6 +1486,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV names the TID only for a PPDU that drew a
+	 * response; fall back to the completion and rate TLVs, then to BE.
+	 */
+	airtime_tid = tid;
+	if (airtime_tid >= IEEE80211_NUM_TIDS &&
+	    usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+		airtime_tid = usr_stats->cmpltn_cmn.tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = user_rate->tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = 0;
+
+	if (tx_duration)
+		ieee80211_sta_register_airtime(sta, airtime_tid, tx_duration, 0);
+
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


