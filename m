Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74008C61DB4
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6H25IhW3xS5zD2V6sWstLC40W2D2voHGreESygqwOc=; b=XrrrrR3cZGkC5XsEns1sV4NKlU
	sivZqDZKSPGKRTCA5/dtQvlK1pF+JYn64BUcV5qh2yXECPMXHz+Fadr64tP8zoyvl8/yrM6rywavK
	198dMcoi9SO6U53v7DTUKtGV2FjdK3nZ+vgKEmTIF9TsAlJteBoUgUYo3JzNVqlRJYTlM9/xaqAKK
	sUBPwYtyGfs6XgWOlWwSG/4RDE+NULzt4p7TuFEUsjhf85Bb8aZY4c7QmtA9VezDSgJ17CgChzpj2
	I0XVlNRX6FBA7eJjIiUpCTW71trXlpAC6kmUeR/yMkENNluv4vH7seFcUiTtVZBnt9TIp5dyFxJn/
	g/RAwS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKd-0000000G7Cu-30QU;
	Mon, 24 Aug 2026 07:42:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKa-0000000G78X-3Wu0
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c16794450aeso451231666b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557375; x=1788162175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6H25IhW3xS5zD2V6sWstLC40W2D2voHGreESygqwOc=;
        b=ZscS7ozjWckAuM38K7wjd0PmvDo4shR+9PT53oe7+Y+vwaWxOILPGRHQ34/z0Y5MPb
         Ufy4AVEX0wWB5y4Tf34hZJqxTuq9hCFXO2/mgb9o+/InzvnCcW+gR9aY5/N8AQAKUoS/
         957cPH8c1ukS86DSigYHGpQOEKyB+QCQXrDSfl+T82TcH+3+NAvrTM8K+MZ9u+11puLF
         HEBWPFvLM3iSTd3Gbw5z45SoAzS++FElHYhHboHdg/zOUHPyL7qiN5nLHZRyRVydHvhx
         WNarTTNX9IxTq85NYkYLUWRKzW4iW4ple58NUWI01T2uyW/PHOBZogQdq7nyMAamaYZh
         d6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557375; x=1788162175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6H25IhW3xS5zD2V6sWstLC40W2D2voHGreESygqwOc=;
        b=m1THCrzqus6CAWU6ifOyodyV1QJ+6f8su+OWu2MhQZ2VTSINTUG+6WTKeJCerXDMj/
         rxHAtYw5F444gaNeD/Ba1i3Tf8TUVXCH8IuvDVbnBmOeMm7kzlvTRdKKJIQ2cd9sNfCA
         939RRUFLRdm75H2kVoLYfa+tHwApms0KxIPNQ1+uL4qGp4aQhtfAxn8cKCFN5XxBx/I0
         n+oeqDcUYIeSb4Q6Rj0rBLF55lRWcEGmdcx68eKv5SFelZ2sqGlNgzrsBSR7lE0aBNmB
         DnOPn8AUl3qlgVYIcfC9W8BhwHE2GAUiSqfqFcKzdzxwvIv6wpoel7tfHRJGqIEQMR8i
         ZeiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBlw33d0qBWNQ6SfURXkQ9FmWqFxIBW/3wm1pepxDMJyN5HFwsFpNtGNEOrDptU1s/h2b3Cro=@lists.infradead.org
X-Gm-Message-State: AFuF++nI37qKFtf+nF9/Yr0HIhjbAfbslhk4T32xpjBfDg8B02HucIzq
	samUC2BA1iabSKO77NYddq+Bdk+pHMT9+Semhur/8MSd89EoWosaZWK0Awu3qSpRHQ==
X-Gm-Gg: AR+sD13/jysDhpt6+TjWCj/CVo/coEE0BmqteL+JThIQslTmt/RUdjPT1jOhtjKAxQ8
	LSkNYV292jdozAFQl1R3d1EdMd6vVamp+HVzHjdkS/btBANj55ckeXqEUAGn/911NTFebAKPKhx
	vpN7XV1ei8QTC/8veZ8wC4ORrbL0fYh3it3uZQ3khc3kEo7N6kIgag2NVbBm7KxHHHb1fKxPPdg
	yWQ06lGCXcShaA0gqW60IgXhL6/fln9AjhHhtO8Ud1hUI26Mpa+v0jq11d1cIFYsEjIxbJMaqa0
	ZCevAVQvWGuEuZ5GsaYmp/AkjLY8sAJ2B0Musnudvm0Z2wKCFwLFQ8z1N9SzthTq4LF7wCe9xQd
	0XFZHZej1vF+rRGwc4q3bpU/O7xsXHWy6N91CmVrP1zFaqjoS9ak6XiuJCzuaxgyrsU99Gzptzh
	PRZ222eV9VdL1S3ixly5Xavhb78TGuyhdByc28vswTCwWcJo2ISXJQ5dT5Z1JnoTu/0Ontb1pZg
	hyY23QalLOvQaFhw56H43YdREHd2gzSR7d4wJ2maaZ9QpxVweEN1HZg//VN9hdg56uGzYq4JkxF
	QV1g8+i+1fuy7xBiCiHLFAgy+cNDQZveNGvrZl0Z6c+CPh7bM0OxbQjek62HI/1C5DZh/wyf4IS
	5UTlwLb6qDFw9uwHt0SttpiSBYX2CLyGgicAWeWqHUvdfPBER/4oatCncj5ItcKtLcwENnzOECV
	DzwGHMPJs9S3RYdg==
X-Received: by 2002:a17:906:3e5a:b0:c20:2165:d74f with SMTP id a640c23a62f3a-c246a6ca4f5mr2287983866b.22.1787557374842;
        Mon, 24 Aug 2026 00:42:54 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:54 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Mon, 24 Aug 2026 09:42:23 +0200
Message-ID: <20260824074228.2114579-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004256_915774_D037F682 
X-CRM114-Status: GOOD (  18.55  )
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
ack/BA status TLV that ath11k took it from is emitted only for a PPDU
that drew a response. A transmission that timed out, was filtered or was
aborted names its TID only in the completion and rate TLVs, both of which
already reach the driver and were read nowhere. Take the first of the
three the firmware supplied; a PPDU that names none of the sixteen QoS
TIDs is charged to best effort, the access category mac80211 queues a
frame without a QoS TID in.

Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
client and a 2x2 HE client, both receiving at once. Before, 'iw station
set <mac> airtime_weight' is refused with -EOPNOTSUPP and the per-station
airtime file reads zero. After, the weight is accepted and read back, TX
airtime accumulates, and the per-AC deficits move.

What the deficit can do with that is bounded by how the driver hands
frames to the hardware, which the following patches change; the airtime
share this alone produces is reported with them rather than here.

Two properties of the source are worth stating. fes_duration_us spans the
frame exchange sequence, so it includes the SIFS and the responding
BlockAck, time the radio spends receiving; the airtime registered is
therefore larger than the airtime transmitted. And it is a per-PPDU
field, so on a downlink MU PPDU each user is charged the whole sequence.
No per-user duration is reported in these stats. On the firmware tested
here every PPDU carried exactly one user, measured over 21051 PPDUs, so
the MU case is latent rather than observed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..05fb34e70889 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1377,6 +1377,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1485,6 +1486,27 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV is emitted only for a PPDU that drew a
+	 * response, so a transmission that timed out, was filtered or was
+	 * aborted names its TID only in the completion and rate TLVs. Take the
+	 * first of the three the firmware supplied. Its non-QoS, management,
+	 * nonpause and invalid markers all sit above the sixteen QoS TIDs, so a
+	 * value counts only when it names one of those; a PPDU that names none
+	 * is charged to best effort, the access category mac80211 queues a
+	 * frame without a QoS TID in.
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


