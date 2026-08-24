Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAF1C5DF94
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NseC193O6mLkVIeO24aPT+5wuVWeRgDqN0479cwztvs=; b=pIEM1lUULDK88uiYmX6kIohvXS
	T/CLJDTeEQcbvHaZeDltf/Yiky8ZfpUMeQTv1hVAlDdzVMa1xzSWzaEoWRFvfTEFwCtnP6+QIuM08
	6psrY1aZiO3XK+z0Y3Wb7KS0cDCgguQPu/KPwnu8vu1fS/v6w7gyH6hrz7Pim5d0uuFFT1UYPF6uA
	R2YmJOd10snAhleo2TUcxTr/P8H8uwoG9861voKmscRKwdgLasTzCrIQ+ILTzcR328LsNU8fzCslV
	hGl1saV2/23DsQSQQvpy10v9Erf9buCkg5wS4rjm6TTfO/8ivkFuM39HCONrunknfBg87pQk6h5O4
	D7ab7mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKc-0000000G7AX-0D33;
	Mon, 24 Aug 2026 07:42:58 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKY-0000000G77Z-3FXf
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c197eaaab00so520090466b.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557373; x=1788162173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NseC193O6mLkVIeO24aPT+5wuVWeRgDqN0479cwztvs=;
        b=HGTsMP0dgrSjpEqldxbruoXatvfugVDOiS6UZoCySkF2/7WT0J7Ln8uumGI+KUE4Et
         zA9dRjGVi6do6J2dNCiQ/D7x0yznu+BcQNWZF4dvfxJTG3XlmBT5txPGzEnRKF9s5iUZ
         rl87998TAznXAme9aesyj+N8/9VLUi60i/optGn7NrRwd8O+Eum8RhMfDoAov3mwYa/W
         OYIvIWROJONPlNYr5kpR/e/c2Iuxmx24KIkzJ/MlPaIqgUME5/f5WXs1Eoh/zpRTB3MB
         V3kvo19hnZsiBEbpigdRTca5HPDYe9I93xwIoswQq5kDpAhohvPOBOAAQCASGEPWNJwq
         +n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557373; x=1788162173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NseC193O6mLkVIeO24aPT+5wuVWeRgDqN0479cwztvs=;
        b=g5tyfS8pBtEidr6I+MdkJPtJfTaEIWhNLvL2E0/pW22g0QNbZseNfULsqrRnLRDS2g
         JKtTWziCMOMB/YxT9VRqudNbshDuT/gV1HYdhalilf5HZhrduYm+ngmw07FV3A0px6xk
         aCL5HlqskbtAq3S0kwhXnWChXnszbL9ffottnEbb/LJoyQST7YocVZPCVaNXFFosgfiX
         eAMyy1xYa5hl86ncaJA7dvYlpi0ztl9sAJWsjy0zHSjLL+7ar1udJgHEs+esiZTj5Vjw
         G2o2r/Ytc4poaP+0A1rutw4gt0BMoOY4QxrACDgYwvJmIQgsdmCcIX2HwEEJ4uuDsgrz
         fdMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq74LvVuaXiLUgzLUT6chWnL9B9k+/Y8tHBbn7U6vdWCuhCSLTufWxkVqRc2ikeB6zi82J2DEQ=@lists.infradead.org
X-Gm-Message-State: AFuF++nt/Yc1lOlpFJofXeAsUMEzwHZAezW+Qv0Irgbk3sS+OzmVlkUZ
	qFi/0J+PQd9/tyrPX2WDkAkNeis7C4LyFgCpBrHTiUlQTARaw34vTmk70/b7NfVYyQ==
X-Gm-Gg: AR+sD13zS/SG/QXBdDx9ASg4befZEtO9R0PTtPtH31VqdJqTneuhlsK2e5gfj/4kqTr
	Ns//IieoEBly2B8+lqTRFM4omriV/4FY+0wbItlRyQEOcPd51kLls+Ni85r6b5/AKwakYeHtGOW
	n/bGc2sq9RohyWq7Q6eKj1iK/4fCd70bFMBh71ZT7LDSoe4+KNiUMDI/X+/FCHWGFcJgUmR5AJ8
	aC2vrfQtQkjBN/4Xy4vtf8qDR3XmqqW4PBXrSuRMGYKwyZbvt0ytFGTpKgBdzepFj7v6LwRv5az
	YGmmk4KdGoP9ZPZ3tfd+4ih9g09DK8a0drHWJnbFXnlwn2q6qTTG7ZSJbNq6F02HtCLJAmIv98u
	qnueVzZTnyDM3/69m7KdcZt1+Kp1/YIzreSOMd5QRoJvD24bQ2mSd62O2JWQ5TWC4exLVwbVNCL
	NvH8hgBErNT9jwtxSnhCqFACkrZpmsZa1DRTCndNfsFYPfIcF2v238GrHBTkfR88gNljdwxdLur
	RxZ3G1IwGR9xzXYB35PeJTGlMOkVyJj65g35H3t4X9L1Pldevaj/Al6WhCc1vheujVfB+WDVU8/
	JaCbB4hIYNNHZWrbXFtxzM5IYn21mydJVCXimxS67WBvCkffsWngV65RHjOez60t6se+Jhq7Kh4
	3r8JcqERk/em3rFyApg8nnCKr2T3duNWBPw9ywnKabI/6WWxjzJANqlInkII4UAPhixa8FUDvrb
	L30AKPTHYSCq+9AQ==
X-Received: by 2002:a17:907:3e02:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c246a6b1745mr2800831166b.16.1787557372785;
        Mon, 24 Aug 2026 00:42:52 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:52 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/9] wifi: ath11k: enable airtime queue limits
Date: Mon, 24 Aug 2026 09:42:21 +0200
Message-ID: <20260824074228.2114579-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004254_851573_CDD84744 
X-CRM114-Status: GOOD (  16.36  )
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
debugfs, which is not even created. AQL is not untuned on this driver, it
is absent.

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
limit is lowered to 500/1000 us. Without this patch the file does not exist
and the limits are never consulted.

The rate the estimator needs is already there: ath11k keeps a per-station
rate_info in arsta->last_txrate and passes it to ieee80211_tx_status_ext(),
which stores it as tx_stats.last_rate_info, and that is what
ieee80211_calc_expected_tx_airtime() reads. Where no rate is known yet the
estimator falls back to its 4 us floor, so a station's queue is charged the
minimum until the first HTT PPDU stats arrive and the per-AC limits of 5000
and 12000 us stay loose over that window. The current code charges nothing
and consults no limit at all, so this cannot behave worse.

The estimate is only as fresh as arsta->last_txrate, which is updated from
the HTT PPDU stats when a descriptor is evicted from ar->ppdu_stats_info,
so the rate behind it can lag a rate change by up to
HTT_PPDU_DESC_MAX_DEPTH PPDUs.

ieee80211_sta_update_pending_airtime() returns the airtime but does not
reschedule the txq, and ath11k has no completion-side push, so a queue held
back by AQL is re-poked only by the next enqueue or queue wake.

The bit alone brakes the queue but does not refill it: the check at the
top of ieee80211_tx_dequeue() stops the drain, and nothing restarts it
until the next frame arrives from the network stack. Later patches in
this series give the driver a scheduling round and run it from tx
completion, which is what makes a binding limit affordable.

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


