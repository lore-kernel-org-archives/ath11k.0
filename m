Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB986C5DF9C
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6pRZ9lo49gs2yifUnauSOrX6fxKPA05MA7r7zA0lK4=; b=ug2Id6KFESmD95Lh/LYQCR1+mT
	g3EHB+ADIdGkTooAO+XtvDgOfY43I6nuMQ01ZlWf3djiKjxojOQUAFco8ktwSHgng9Dme1gu5+U7V
	95QNWAjfgd9lzqCK25Ol3Sz5h4qPxHvT/W5qaodIgT5BBDm7OqxzZHF3ACwZdXDnjGoNSWYaVILrU
	Iq7yD7/F7j6OdA3h1KoCvwQRx+iTp3w30JJ3uLRPb5taAv/vH2RPuLwEVaCjnnfgdpiW1iWXoQiMM
	Ie2ftrZdZeSu7mx70pc3wYzqFehOfftbcSK2+qFLyC6y5l9CeHH8mpjiTrp8iuQQ6IzB4gnp1UHcN
	syLJ6Ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbI-0000000Glv0-3Edc;
	Mon, 24 Aug 2026 14:24:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbE-0000000Gls8-3GLm
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c20e70a0962so533752766b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581471; x=1788186271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6pRZ9lo49gs2yifUnauSOrX6fxKPA05MA7r7zA0lK4=;
        b=cQwV+BtO+yBw6u7vKX+vIsRAsQ2ybkTuFAtl58AmvcDPJBOu6BkfcTx9Z10g/sLi4E
         rpxEw2JtvLZF+ickkYzdqJgrAExXbqfT1lXqNhXMQbZ2vqxrdVZBB1CuQSlORfidNoH4
         mArPxxriMjT63ZSyCGCvvX7STYRTQlRNZ1AhgH1rAJvwuJmWECBjRi0/eLpRkeB1KS7F
         gCZSDBkZPiLHMyBuEhWXdXfFr7rv64HtMLYOKK3Q7Gm/fODrU7TCw5Nh41YfD8eE+Ffw
         FBci3bKFP9AnmZR+VXGi5dYPe0n8Y+aQDHzCJXpzqZJ5Dl/MIpj9Fjwdmnzo0C2+JPIl
         Q64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581471; x=1788186271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X6pRZ9lo49gs2yifUnauSOrX6fxKPA05MA7r7zA0lK4=;
        b=r5V3XMO5Z7/Aq5tK+QGFJHF7ENzTn12zH6ieM0knyu17OTwjiXeBbfwAXVCTt27crv
         ZYfraQ8BkaBkTWhpoE9aEYqUQ8ETvXC0nh421Bim8KoyHbk9IGR1mrcdlduJF2pJ8WE1
         t8ush8ngUw1Z4RrCHBHPqRw7UpqVdZiREtsycnp07txBXAYmFWvlHboKKNezrbsbOpI0
         z5D8QYr/DCLL0uJR/ZU9HZGYZlEkGTh8jafTbC0ueipN/oA2BCMOmxnnInJk8cda7F9G
         l6QL6no9VuLHCy9dhNP6IjWqx+IJxRAMgUXJ6yp/Ap+0pka95jKUzokHa+BM9BH+3pyY
         C/aw==
X-Forwarded-Encrypted: i=1; AHgh+RoLKC+dllicuByXyjgYOoqI16KFc9XgdIm9ZBdcQtbXt8HqAdb6OP9mldsrEjPbAM+zr/iAInw=@lists.infradead.org
X-Gm-Message-State: AFuF++nBl5rpMg/cUv6qZQSKf+AZq4t0hnlFS36XbxSBiLEXf2QtZjRz
	Pfi9lzr0ddyKQYBuS7t/vHwz7r4nZtcU4uuRFHxYLRotIt/7dvkCO0SjbnsT25VuzsUV2UD36zQ
	tOVTifi71
X-Gm-Gg: AR+sD1388z8ZByTUedTas5JEGdy0bEakO8oSmmYQvPrZDjYpKs37iO5/fZPakYLHRm/
	JeAAtolglWAxi3Gge+BM0zL0vBNglqWYZuBwRzB5e58vY+B2eUUXDnCH1es6YyaBJ0ww3NsW9CD
	DkC8yLVHIKct+GExlb/suC4yYHU784V85p8R1kxutF8wthw+yqMNrrfcSXQ9YRARZ52XE9evJPc
	/TAsiQq7jpqHMp21jWBxmZL0pctPyZdWoCanVdp4Mt59MnBLhJhXBN4eIspv/FXjAtnGDs4UOJ2
	PAb2ODWmxFG/x/CpELGUbEXlFoZfzI84ulsX6nnDa4hZhd/tqNJTfpmS8KCxPkaFdIlJ21I/E23
	igfzyoOYYpKljFhVEx2wAP/OaaotJZdtO7x4K5fZIP0CR1SqBG6wdmthuat9ExfCiEGgwCCScjj
	pjwW4ORno2shpaFDz8ticoI5zIH91dNA2rQsIyD+3iXYoYIVYtrP/UeTFWB4H0f4dCau03Wd4Zu
	GoWdveL1Za8ISLHb7uaCDUF4xDnnlwe/NnhsfsdzyqLG6Y6Tia6vO2lHSe8yPeNJ1BL7iuYnsF2
	Hngqz0Ijvxjls3gPiUWoLtRcUPP3r7yRISeAD6wdsbFmO4PpYKQpHTiJzDI+dQh5GEwT1j0C1ee
	S1KNwK7BKk4VRwwCwO2B7O9EtelI0Z5FtRSZhJA+9YMRWKReVqp2xmRBDN5iPVX8/J8jmCaCj
X-Received: by 2002:a17:907:7283:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c24b11a493emr1213893666b.0.1787581471018;
        Mon, 24 Aug 2026 07:24:31 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Mon, 24 Aug 2026 16:23:45 +0200
Message-ID: <20260824142350.1757379-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_757177_F76998D1 
X-CRM114-Status: GOOD (  17.85  )
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
none is charged to best effort, the access category mac80211 queues a frame
without a QoS TID in.

Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
client and a 2x2 HE client, both receiving at once. Before, 'iw station
set <mac> airtime_weight' is refused with -EOPNOTSUPP and the per-station
airtime file reads zero. After, the weight is accepted and read back, TX
airtime accumulates, and the per-AC deficits move.

What the deficit can do with that is bounded by how the driver hands
frames to the hardware, which the following patches change; the airtime
share this alone produces is reported with them rather than here.

fes_duration_us spans the frame exchange sequence, so it includes the
SIFS and the responding BlockAck, time the radio spends receiving; the
airtime registered is therefore larger than the airtime transmitted. It
is also a per-PPDU field, so on a downlink MU PPDU each user is charged
the whole sequence. No per-user duration is reported in these stats. On
the firmware tested here every PPDU carried exactly one user, measured
over 21051 PPDUs, so the MU case is latent rather than observed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 20 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..28aaf39cf342 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1377,6 +1377,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1485,6 +1486,25 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV is emitted only for a PPDU that drew a
+	 * response, so a transmission that timed out, was filtered or was
+	 * aborted names its TID only in the completion and rate TLVs. Take the
+	 * first of the three the firmware supplied that names one of the sixteen
+	 * QoS TIDs; a PPDU that names none is charged to best effort, the access
+	 * category mac80211 queues a frame without a QoS TID in.
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


