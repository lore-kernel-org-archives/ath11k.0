Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41327C5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfowLqhDZunasKyUhow1L2/oi1+oZM/zPnoYhQBWbJo=; b=eUcC4F/AKRAK7OCzWUFAK3SDpm
	cvHigxiOFB6C/8IMV+8NNSwQ62aWneV0/GxbcUCXxPO1JPWoPZsoEkDrSuJpKIhg0Ip6CA+0si3xy
	SCp2OwJeqiLtm/DmxIpypGZ4bNKb1AHnHuoSzmczpHh7Y8/TiMXANUpyO5rHXO0U2oJobfxmicQly
	QvLC9I5MZ+CvLsb2N2BpIE4PN6yvjXdwaLwjMbEnLVtI3LxB1dCw14CCG4sLJ1HzzQRVpr53GJrTb
	RpgMqdzzDJ9HqDqZ5pLVgr2wcNe4UqKEXNG6HUhqS+vZW0wlQr1Pn80L84bP0g5WDAnWpGmc1c+vg
	Sjg0lzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbN-0000000Glyj-25Jt;
	Mon, 24 Aug 2026 14:24:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbE-0000000Gls2-1AWU
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c1c52d920b8so505351366b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581470; x=1788186270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfowLqhDZunasKyUhow1L2/oi1+oZM/zPnoYhQBWbJo=;
        b=RC0qowfH1D5lYe6tPRboFH5rwXo2UlJKyw6/fE4sYYe+RoDSA8VV1fyUSskASYErVK
         wv/rVF4aM8DcPlitUtZuT/fg/xJWVGhQOecqhbwyMn+dHLR6C58EwElrW2ar/mP/PEnX
         fxVjVjTVlvFaVYawDM4XmbixhcuUUcKRcFna57aDtfNcmCEpAaRqSsH1U5CEBQqIeZvE
         IwntVoQOrphoEmGZMyrEB9u/X+45rbpDCWBGexZNwZhl+MM2GRi/CxIMkc5ToKPji2ov
         jmGb/sBvoyi9VYVqqaLRfTyU8AH7SsQwUZbK5vavYpCf2oADsrBO5Ct5aVOV+I3wfKRy
         Jnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581470; x=1788186270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KfowLqhDZunasKyUhow1L2/oi1+oZM/zPnoYhQBWbJo=;
        b=bNncMusU0/eoY5FjfbvEeVDe2Bj3vcLgbySuSJ3FGVWanA06+UlLtuZNMvwPS3BwHU
         RbTNW0tdpQSxkFaljv4n17zIBdDOJhINJ+4m0DVghIJ+FuCG2z5DEarQIUU16JX3srkl
         CKaFQrJa+rmPrkD3xarrGe9FEGhia3pFcJNois95iEeiZ6j+2+YSJo0MX7wxTil5Z7pd
         ewJAQ7RN+8138i7LX7+aMygfW4CjhJMM9ZrqKksSIkMel9fcAr0XAauW7k3CCRi2Oca0
         v+ghbhP+tYGh4+Wr8m4pcUxdAXrIX27cHfjdHhugHugP7CIQCuJ4FjJ/pNt48f3MRTgw
         HJsA==
X-Forwarded-Encrypted: i=1; AHgh+RoDR3EL2N4PH2CN+e005M55dFAZA3oyD5LBT6P6mEIFUTm/Ox4Dp0x3JcQcwo86kl9qcOoKc8M=@lists.infradead.org
X-Gm-Message-State: AFuF++mz5fWHT31gtuXH2pgwK0kpavgpVOMXGM4XID9TuzTrfHxuiOQU
	KcqdcHjwnVrCx3teuUOoxWdhU9Uh5j5NJcTNk01G8hM+tUdNsvJ0FduvgtiYG1+L5RQAsyWCltL
	eGmljQ43G
X-Gm-Gg: AR+sD10XIyrRccksqjST5mNS0HuiULMajlE4ZmmcXa2pPw6z48zpxze7dhq0i4J8Z/x
	NMW49OUiEkNNk05Ryd6zEPEx+EqX0qh/d64+Z7kP0Zpz61m3lANmWO+8t12wXg6lLVOuZVoXINR
	SefmQqRbaxmMdIaOO1253wEYjxOldJwEN2vV9FIpkYIHb9SP9yS43tSJ1qKwNmZoO1zLjRz2FC6
	lDT/+5CbBEH64SkiMSvGTHzJRsQFd+Luf7vANtZsEZFdEZhL7Lu2qlo1CtHFfEBNtj8j469lDHd
	ECrzo3tGVJ3lsWm+G0GihXkp8iH0lGuXfH5fQGdpVjLtW6a6HilwBh4zvlsNyaSGWmc9kfiqBfy
	Rz5R/yXj2JcAXKCVFfwP9NeGNyu08um9wRz75w82iRBlj8JgtK4YXVtl34/Uao+SRIkY+I3rgcr
	mT4BIiWlGNmyoinMXbyrIQl6yQYi+O5F5dH6BPJBOie789P5ze1DJg77JWzV+zhv5B6jc9NrRt1
	o7RnNbk5DDxxqSFpXz1oOx4rduMTH/1FJnIQFv3pgnfzamSEvh0eIO+wFDQ3eA23rlde0Sin/Nr
	gVnHixasPawbc+HsZfp1bH+yLSQ/i8/f2h5eeHIVDnjmVvTHJvmN20qFQF7wfuvbp8BwZKxzC1G
	2hCjQRUEF8CV4OnK0LGc9ZJmqu6R+R1GU2VIDW9jeIDBo14QyXWK0DuZjDRmUiJ3VLGdYBHgn
X-Received: by 2002:a17:907:cd07:b0:c24:b11c:6c05 with SMTP id a640c23a62f3a-c24b11c6ce6mr1396610166b.14.1787581469243;
        Mon, 24 Aug 2026 07:24:29 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:28 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 2/9] wifi: ath11k: enable airtime queue limits
Date: Mon, 24 Aug 2026 16:23:43 +0200
Message-ID: <20260824142350.1757379-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_945241_2586B491 
X-CRM114-Status: GOOD (  16.66  )
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

Measured on an IPQ8074 AP against one HE 160 MHz station at MCS 11, taken
from that station's own aql file while it received 280 Mbit/s: its BE queue
depth reaches 6356 us of the 12000 us default limit, and 2972 us when the
limit is lowered to 500/1000 us. Pending airtime stands above the limit it
is tested against because ieee80211_txq_airtime_check() admits a frame
while pending is still below it, and the TIDs of one station test it
independently. Without this patch the file does not exist and the limits
are never consulted.

The rate the estimator needs is already there: ath11k keeps a per-station
rate_info in arsta->last_txrate and passes it to ieee80211_tx_status_ext(),
which stores it as tx_stats.last_rate_info, and that is what
ieee80211_calc_expected_tx_airtime() reads. Where no rate is known yet the
estimator falls back to its 4 us floor, so a station's queue is charged the
minimum until the first HTT PPDU stats arrive and the per-AC limits of 5000
and 12000 us stay loose over that window. The current code charges nothing
and consults no limit at all, so nothing is held back that is not held back
today. A rate that has gone stale low overcharges a station that has since
sped up, bounded by the same lag.

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


