Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4CF606A6A1
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPsKzCGr;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G7w02Aeh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=; b=zPsKzCGr+OvKTU
	K8CKtbMNjWnCloXYh45gKnt9BVHAXuOt4wOXgYdhv6hitWRHggho2JzjBiRYzqp2m7ZP/HDFk3tJa
	dSaZBQORZ7GiY49tIVwM5pgYuA3EPeKboeTy9aPH37vUcf3uIEW+ZrvQ1GpGGAnlhNJcN+dadEC7v
	5GUkTxHV70AoZ5z3sHBmKsgj1pTLgd1Rd4C73upTsvohKfWCZGPIheo1xlXoZiJJm9aDTOBx773O3
	5+Bf9wX1zPk4wJnhY9yp4dlDLyiLsu8Clyu89HdKIUrZhOusEm0p36PAzdw+0wV+iHhye1vJK1xyT
	G5PmRF+czbs5FnG8FvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2c-00000001UJ8-15CT;
	Sun, 22 Nov 2026 18:11:54 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2W-00000001UD4-3bec
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c513a854320so432010866b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371107; x=1795975907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=G7w02AehBQ2l2j5oxhRPGentLneWYnkPg0QtIR1UXhk68Z3tFMzkmKkeYEP2/3zQK8
         RWSxfSYdMWBllIDEwfOyrORaS7v5ObmT6MtOMbr+e7bhzzbeMbgitQpmsp8BHR+f4pCW
         JabETh9KgEdFw+qd5YcnUAdYQzEbo5x7gvxZtN9m5CdCvcbwY58r2ouU1bYXNUeUcafx
         3QxpCOtCkGziWDtOR6GVye30Tc15xdTYp8E3qhCadKuPETn+oFKbu4oWHVKVRmgOh18v
         yK7gcfEasSeN0usgkq76cgB2maFBxD5qBcMA/NkrwA6vNrB/9wTOsXk1Q9A4dOCDztwG
         S7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371107; x=1795975907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=jiEStC9F1a5/lZHB0l++Kl0h3J62lYZbdcxyyel05PHcxejqLE8npYLZ9Knt+RoxdZ
         WKpD+qj0vN6o+f9tBxAB26i9RW/TqeNnWcQmwQNL5OtBdjHu3kiDAHjheGkdA1qNYGw2
         ykSGSrCCimBk3wAl1bMT67nKXn/+ECMn29bIVynAJEG7UH6W6pY+UtpC8VBm/CfUTqTz
         JGDvm83Xaj/tUHB7FCIYZWued6a93WC/R76RxAjUPkON+FehGP8flpE8/fjwv8p1cC2F
         qZgMaG6o7aoKDsmKENDfjKhfVspBQl2M0JKv0V88Sc9xjNO9lmVt8ba0kz1bWyLHbrLf
         n6ug==
X-Forwarded-Encrypted: i=1; AL+hErEJdHa0ql7fjb/u/KM2lOQ+DOVoCALfEXG+oTCBxHOkjHG+1r150TyN87xQRKh+hqeeUUgRtLc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9A19jOLKg31Up4UEGPT1bQb5alBZKfLhbtPp7CC6bG1XahOEKF
	xQC7gejO6gTdxVX8oUxhDC691MMCWIzcmXvL9GseX5LMfxplZDBMd2TpgeD4b2qvDg==
X-Gm-Gg: AZFdTZf3ClNyq5N0udtRbE73SyNHoE/BYcQEAb+CSWLh+Nq6+ByWjYH2olz/sYTDaZg
	bxmek8kVB6e6fqgypTobtYnI59X/i19OeRs+jo4x2tDKWR2aHwwwyihq6No01fRtPCYxoy5Ngxs
	M+Pm4QOzKhepYwd2unJR+P22i1bTFOuLHfZ3kSmT9Svcbyo4VjtF7CJuPXNEfhJPBCGf9PD7HN0
	EWYL2q6dNKGrA8JgBC0HYJ5ItW/35I4QfBM6pzua5o8abtSCRgnSS7LdWMzkjlnEW3ex16AiwFS
	iQp7fLpFcSUoJyizHwUth2JA0dtZm9lCJ/9LZABFa6Ee6Etj8rTN5LT0fTyjA7fnLD+6ozdTs7T
	YE1Q7wfgORzEz6W6LH/y9S5JU5S+Sogu+I4eNJ7FII7L87OWtHSepWEpW9XwOFo/ufqe49bHzbK
	6luqYiVDRM76PBgVG4oMdjLE3/fmUYEomKR/eVUo/PLKoqMGbcXJhx/zXLPIaqO0E0VmYWB3RwP
	NNPRFqz/rrRi6dELIC1RKq1sbXO1wqM2Xq9TWRDqvZtuJHrtbbznm0GC75YoxH1eEJgzJz+G/ZY
	LLQ6Wg0FMhRloIC7CAxHt9TwQgXbysvkZb71K7bD2qVSk0n551YB/GJqfBaKFDavNIi1jC4CPSc
	BQx57U4ZHg4pYLW3F+3MNoB35/+8vq2w1iJmV2cFA+E6dv46ncXhN0wg8IPnKqgVz0uJqBCMgXR
	QE67Kon3gLPTpmN8to8XBlL/HxPrHNM5TfTaUzVu0H1if+EVI9e68y4+fonuwvJNqnNS9Rf40qT
	8X+9kfcEQvCaJBonKVNWjrZ9mq0cn2yEFXJcYGRAZDhYKcfbAivPohiEv0BWPKQlfe+hoFmrZ/m
	xXy8sBvMCOXMjZbLvh53LCsEglXo08bNLcgoPiArkJiufRkX5a0MdGenELeewx/vMvcAP/2Z
X-Received: by 2002:a17:906:3713:b0:c50:4d71:a85d with SMTP id a640c23a62f3a-c513aac5448mr605392366b.32.1795371107075;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
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
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Sun, 22 Nov 2026 19:11:40 +0100
Message-ID: <20261122181145.1015729-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101148_924999_95C36E9A 
X-CRM114-Status: GOOD (  13.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 charges the airtime deficit only through
ieee80211_sta_register_airtime(), which ath11k never calls, so with
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS alone every station stays in
credit. Register fes_duration_us from the PPDU stats, which ath11k
already adds to arsta->tx_duration, and set the bit. The TID comes from
the ack/BA status TLV, sent only for a PPDU that drew a response, then
from the completion or rate TLV, then BE. fes_duration_us is the
duration of the whole PPDU, from the common TLV that all its users
share, so each user of a downlink OFDMA or MU-MIMO PPDU is charged the
duration divided by num_users, in arsta->tx_duration as well. mac80211
takes only local->active_txq_lock[ac] inside the call, which runs under
ar->data_lock and ab->base_lock.

'iw station set <mac> airtime_weight' fails with -EOPNOTSUPP before this
patch and succeeds after it.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 23 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..777c56e416aed 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1382,6 +1382,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1400,8 +1401,12 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 				usr_stats->ack_ba.info);
 	}
 
+	/* fes_duration_us is in the common TLV, one value for the whole PPDU
+	 * that every user's stats repeat; a user holds its share of it.
+	 */
 	if (common->fes_duration_us)
-		tx_duration = common->fes_duration_us;
+		tx_duration = common->fes_duration_us /
+			      max_t(u8, common->num_users, 1);
 
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
@@ -1490,6 +1495,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
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


