Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F1C5DF81
	for <ath11k@archiver.kernel.org>; Sun, 23 Aug 2026 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkjpekjfGs9gr2eeO5fTYbep26DOExkXq9P/fdtSzww=; b=Y74LhhrVFKcHpAhxN1LMuTCav1
	DH7Z9rG07r373KLu/2Evu3/Rt5PyF9XNAHZ3TKY0Ff742Tk0vyPXLo+FKy96lRulqAddf5LjocQ1v
	8qj3fs2zfYs/9wwKmzoZ2C6fDuuT3szO2P5BC/3zUE1/9I2hD3ccUM3mKP0ROoha4WUYheuQe+8NU
	m7fR8FLtvtGsv9Kr0ZeyUw1uZ9/v3JjS9rdZzmSWa3A87gvg7Drbj311ZT/fhOoJzAnfhRXNLLzOF
	k78EB1sf5Y1QuoLEeqrZ9NDB6si7yjOLwN9b2eMPup9P2WruLU75OV0op34JIJNIXBuvQHiFwHZEQ
	mG/W1JIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK5-0000000FZuW-1qKx;
	Sun, 23 Aug 2026 19:57:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK3-0000000FZsw-05UG
	for ath11k@lists.infradead.org;
	Sun, 23 Aug 2026 19:57:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso413045766b.3
        for <ath11k@lists.infradead.org>; Sun, 23 Aug 2026 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787515057; x=1788119857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkjpekjfGs9gr2eeO5fTYbep26DOExkXq9P/fdtSzww=;
        b=T5NcltYUBEX12DPmB6ZRvrvp0WoYzgqetSaWN0cE/zgDDQjzhk4CTZiw7hNX00FbuY
         ijqPFIqokqmDL3rCE22DcknXughvUc9oXicEWpRbOgHFQ0MNMWDQJt+dMGQFECGJxhoQ
         hFexo7Ml1D9YBtbzzh5VcdlkTusJdmyNPKUrUfbCOZpM54dYvDQBXczuVZGG2tDTTyaK
         0x0zhtGnv2ATZvF8WBQRh4+zWIQmwDHRZwM65q3nIs/5gtvyFXUpKE/2PU+SRdt3rdQ3
         MhdMSlMIt0sH6GAE7hEpma75Cj/bedai36zfW912V1j2jQFy8UWg4+HBbr40V6dtJ3Jy
         GKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515057; x=1788119857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkjpekjfGs9gr2eeO5fTYbep26DOExkXq9P/fdtSzww=;
        b=ecpnC3bP/mZ7IqnrVgzqQCXI91F264859APZH6ZYZB1bplqcWnCXLE0wAjeXW/xh2e
         j+8MPIBaG3BE2U0F9LH5O+45UEO2NCdz06vX6WEqaUkMad8M0dvjfnSoRvtg4L5wwUE0
         SVmvNjBJCoCunPuOFCvkpWd+WcX0hi3m1WE5QC7odUto43G1CxFUvshjbwqv/V6tOh5K
         muapOaSWKFf5DFnjiQHOD8+l2EvhSoADfK/B5ag1/gOvritYtXPO5t/t2SZY9hZcPWK8
         ruf8MvFt3oTXvbjr+VveyKDcj7aJteXnS/Zx6opNWh1H5qfYH33IB1bYm3ZjY4gphvsf
         NPfw==
X-Forwarded-Encrypted: i=1; AHgh+RogXG/vxLsG4brYhm09qUnUJa7I3QqVlAqQw8LHmO8dkKPjZ6+KcEb5PmhhsrUDEkl6uq/Y3Y4=@lists.infradead.org
X-Gm-Message-State: AFuF++lueZPWMJ0QgLbLY0tqZmpyL3Ja4BEubromrtdNwEijoUSn8dRT
	AKEra5pC9FqtQ//UQYlAQMCDm+wmbu2Hee8hnl/KCk4poAOQstbW+FHYAjIXedJyBw==
X-Gm-Gg: AR+sD13Wvj1hCT4qibslj7UpRnUF0NTSuFj2biYveK6oKsjji3UW6A7XNPJA1chdk6g
	v3sywFYCLgEKWahPvspyqQgsDE5zgQUADXb5U7hJNkb+ppCzkJfqlYFDhG0rOCVd3RxCC4UYmam
	YGOjamYAjxxlVUH99cpd+opgeMbbnaj9uA8hd4Ny7Oma/LcbJek+z+o8P7GaAyFOOZCpeCIrF3c
	FVE0i2QU8S86t1x4TD6SAbIrJPSLmNbkkdTcM0Eo6tv2hmi0X38YjQTNrmsE9K8M+zYeL33OZLD
	OMbKUdOuRrnmj2+UxK14fiBoWUaUgPLZ5Z+fCReJMqVsG1bgbiGqjRbidb8OpNwFf48rJUsz7qg
	sagxl9DcYYJCCSarDdwnFKIcFJO/HS1R3I25B+pZr/ma1Fxt3OI0+lxZOpnBca5rgJx7Eaq287V
	35re+jCfFrAemTLFlat9jk/ZSU2z32v0qcgdA5IzfBVdaNKG/8TlO5z0hnewzgyyP2a7lVl+ipc
	2KRxiQjSf6DfQQQ5xU4Jjone6GfuBL5Ie4K2tgNgDyPH5vF/jhXr9BT91rw4EbVRDRzww8XG/SA
	TMValyRo9YrIxC3clSTsxde4Gdip+7E7X2ZdxxOm6th1Z0NMAV9eXm4QjOFXP4jonKuCUIJf4to
	5DwUANLTV/ZgNucyAnLrGeyV7sIvbjXNW5KK4ARIiIxM+RKkIxQl+52YDMTrcl3HnKu0Nh6R1Tg
	WDv40PA3Bum+gB
X-Received: by 2002:a17:907:97c1:b0:c1c:64d4:5ba3 with SMTP id a640c23a62f3a-c246a651d39mr2378935866b.20.1787515056375;
        Sun, 23 Aug 2026 12:57:36 -0700 (PDT)
Received: from Desktop (pd9513a95.dip0.t-ipconnect.de. [217.81.58.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8edsm889532666b.6.2026.08.23.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:57:35 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH v1 2/4] wifi: ath11k: enable airtime queue limits
Date: Sun, 23 Aug 2026 21:57:01 +0200
Message-ID: <20260823195703.49198-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823195703.49198-1-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_125739_083793_2D914C47 
X-CRM114-Status: GOOD (  14.88  )
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
estimator returns zero, no airtime is charged, and AQL stays inert, so this
cannot behave worse than the current code.

The estimate is only as fresh as arsta->last_txrate, which is updated from
the HTT PPDU stats when a descriptor is evicted from ar->ppdu_stats_info,
so the rate behind it can lag a rate change by up to
HTT_PPDU_DESC_MAX_DEPTH PPDUs.

ieee80211_sta_update_pending_airtime() returns the airtime but does not
reschedule the txq, and ath11k has no completion-side push, so a queue held
back by AQL is re-poked only by the next enqueue or queue wake.

An AQL enable was proposed once before [1] with a custom .wake_tx_queue and
a tx-completion driven push. That scheduler is not needed:
ieee80211_tx_dequeue() performs the check itself, so the generic handler is
already braked.

ath10k and mt76 set the same feature bit.

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]
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


