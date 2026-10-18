Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A64ECCF2D3
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNnVVn8ZmmAppQLNnGauLJv1tl92SVrN5Z9s62QXmWo=; b=Xa48vI2jwdJyijWsnx2P08lJ11
	lsbUom6syrJpfqQHOQ4JC+ZCfAcqFxi+14JPnBdzGkLTQIVvs4dps4zw6CHsp+eMQjlqyVBtwG0Jw
	J6tuzzvbKOoEnLUlDnX7kCMawrZU4kqZ+ywzLinPxs94M7dC/8iVT2sBMuj7ikPaMXrwh3H587Gin
	a97ixUNyBUC+PXd48cQmgbxgn/N1fV02Wur92Qvzr9VFWIGRBmU+jgHyVDb/V9ddb2I1ipwjP7PkK
	Z/TW72dnD9nFdVItJQhxyznX5ZAVsYFVJMbOLybckff++rOnhyO2a6R0ChtIi1ZJWmQCkTDbbQdM3
	4IixqXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0Y-00000006788-3mUm;
	Sun, 18 Oct 2026 17:49:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0W-00000006754-42Cr
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:18 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c445c95d553so9670666b.1
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345755; x=1792950555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNnVVn8ZmmAppQLNnGauLJv1tl92SVrN5Z9s62QXmWo=;
        b=io3uwpPSfVzZNbK+Zow6nFir48WbmLsEAHq5mCP+8HxGS714NrxReg0Zkksm0hmeQp
         XL3F0OasSBIeOwNP7cX/Js2RyWaSMSixTFhztfu06k8JvrvNUqQjM11wWvHi6ByRlb9R
         7M3GN0gbVlpds6Fv23VPBCYvdLmtbK5fAgCOouB9XtS8lmaHEEAiIlPDPKCj8tzsFVA7
         fw1ro0vAE6Pv6kGQSsk+Kc7cdjR7mSBlOiJ5oZvY2ruxZmrHrkV+cSdhAjjB8jh3WCye
         NMVCMQ9/GhpEZ08ZUfbp4tj0VRNyoKChXWbbWqss+fNYFXFiSOuj+XgBu7QSDuQdshKJ
         GcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345755; x=1792950555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNnVVn8ZmmAppQLNnGauLJv1tl92SVrN5Z9s62QXmWo=;
        b=NVrrQnbgvT/zbIqPScPuPLNCJxxpXuYLiKH1OCK2fl5mAw6datzqVN0d6eJ0UaBWTV
         QjFcWk7NoSHQYZqq04H9Llp88W/ockZpqCXFmgDp0o1FNGtvFAYFCqIxSjsscvAX+qZ5
         F2xc9c4H9SpZq/mkFcXzRXt2SsNGIHJAYazWX4M/pQkEZmVLctVKw39WU0I9tQLRXwDZ
         +nmSWvoEp+kcnxCr7QLEKX3JNHanDX9zLtURW/EKVhEobeVVdWwhgOkdWBsf0pF85Iak
         0NNN49EqIqyvbuaSPWslmVM2aDsE2tA0k2husBQi/wM8aTV37o7JO9c2FBwQ5SxNsMnP
         UZtA==
X-Forwarded-Encrypted: i=1; AKwUvByEvMRDiI5wRMlFovqUIOg9NajbVuYMnfIM/1uj/zBfNF/ZXS1vkWIIIHpOywv6diBYwrJ09wc=@lists.infradead.org
X-Gm-Message-State: AFq9FYIYPGtRzwSSe/G2/MgQeH15XQ5N/ksr+KRt0uqJ4bkEzsNKHivv
	4CBwJkakdoq9DJpsrUuAGkG+j07EcPxlouyZLdWcRuEnAFeVhtxsb/6VpXqKdM4YBQ==
X-Gm-Gg: AYBFou2athGB118OvT4TnTOmap9BB6jUCRaRN2YT3kh2hvYvXq0nyefj2ItzYDXqK8g
	UXqj6BhsfycbG39qODitxgZoso+yQ3L+r9wF8hZiiUN+V4okC7pJlyFTsMp8mIEi8ilE9t9wvWM
	LmhTS4VPvWhsCABebkri2mP/3PD9rJsztemPcNF63wDS8ng4mMWe1d1mmmO7h7IEBCT8aP7s1O8
	LJAj84gw9QBsk5hgvCfga29dJnvxXUVAaooyqGlMP3d7xnVuaC/hlMG4EcB3hoabvwF+nZeM1Qm
	abltVzurS3MPVY47WmfHHSOYGjFRFavcnPVodDbSHQRqO8zD5mnxoY2cx5E3Fw4wtTTU9QnisLM
	fm8WFSfVuI4WFleZQvy/6JFLD7O7is9pQ7CniWE8n+f8MRMfC8gJjMm8tyVYL47SJ2MXPqStY7t
	jAXhcaTeMClYJBgBJMnSOQfkPQu2K/49iy101Ovj7zc1vFaMctHaquhDMye3kYUgkpBrAe5hJbY
	e3SvrnFwYrGQB0iY6S8Y50hlxh3KJIMcHocGPfzMxtdjPA88WcXvj3ovJcc/YBrMTe9e00f6v7W
	S1Zxeu3efS512YyU1NVxeWeXoLJ1pha8Zd52E+30mJce4mX0dyyNJoy/jRTnv9r0dYG7J2xnWEi
	UskiFG89WunaH5FeCp827zVya2HCF6q2Hnwa67D03lAyhF4mCr2Dfdpek2vMaEXmZA3dndi43TS
	AAgpraeReD
X-Received: by 2002:a17:907:c305:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c4196aa9278mr343812566b.0.1792345755046;
        Sun, 18 Oct 2026 10:49:15 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:14 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Sun, 18 Oct 2026 19:48:59 +0200
Message-ID: <20261018174904.1757161-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104917_022364_76AE5B70 
X-CRM114-Status: GOOD (  10.75  )
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

mac80211 charges the airtime deficit only through
ieee80211_sta_register_airtime(), which ath11k never calls, so with
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS alone every station stays in
credit. Register fes_duration_us from the PPDU stats, which ath11k
already adds to arsta->tx_duration, and set the bit. The TID comes from
the ack/BA status TLV, sent only for a PPDU that drew a response, then
from the completion or rate TLV, then BE. Each user of a downlink MU
PPDU is charged the whole duration, as arsta->tx_duration is; every PPDU
on this hardware had one user. mac80211 takes only
local->active_txq_lock[ac] inside the call, which runs under
ar->data_lock and ab->base_lock.

'iw station set <mac> airtime_weight' fails with -EOPNOTSUPP before this
patch and succeeds after it.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..8b9df63966989 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1382,6 +1382,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1490,6 +1491,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
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
index 6f4462b7d3f15..eca16a151d068 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10653,6 +10653,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


