Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E8C79F82
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=; b=snRCzU22kLllvogcdhQXIVd3sB
	KpKTlJkw4MvmFuIFBbdxPV1lRKcUtekohdM2QcOgabJ6/Ib21SbiYLcAJ3UxO8LxjqsEoArCSk+u/
	Hd1qdB4nf5kAvyFJcxY/3tEO1lUzYQ67+UBdUQTyNjQUqddpv/VbKVjEK2YcaHi46MUe6AHzcJ4UI
	xZtaMzs3+0LkVsfD+JLkl9BfwFH7HXKOovc9GJ5WTBwHm9kGk8oZ4xw8tHrvfCc8+PU5u0S9TRXKs
	voPLs1iuWh3B85GiLTVmxihViDUnA/nV0Ad+4AVgM2ue/BcmQh6RZw7h93Un8jEPtKNIzD1k1iDNv
	TN/aPFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGU-00000009Buv-1VxO;
	Tue, 08 Sep 2026 13:53:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGR-00000009Bnl-3nmI
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=; b=ZctyZKkWwNEcIMeSGLesoWn/ow
	m5tibU6u1kjUI3myTukLRwgfRIdeiftjbzQ1Yl5N4GG5+wMhX+bBjAVZ63Eh+07mksQClUpD3qgQr
	O4XMIj/4DeS29Mdfl4GUiUfL+YUvRyijt9rRInTvObKZbJwxpo0bM9j7nEFnyVk2hernka6C6P1Ve
	5Y3t3iK5/VhKkYeOqG22Fk6aFgqy2jdcAgKHEFbWTYAKfvZxMQsyr350U8HUKYh9c3im9s3hdKXV6
	rZye1ZH0vk4JXXD7kMbifRVZ69XRuaOtqGZHynnK1mNVBOUPvMBFiOuvKN+hMdMoeyZEHC69g8Qs/
	VY+aWCaw==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGP-0000000HUkB-12Af
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c253425b253so684160066b.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875607; x=1789480407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=;
        b=hmgSQFbcNexanoEEzZRb07ppSUT/jDCGDAY0IvWc/WJ94ifiRfwFQc3pkg0/JKPq9H
         ovwEobtsZ6QkHbcbcUCCHxrs4Hk3X174nDZJLiW8JwiQgAuSyjfdnhRlAswIh3nSN03r
         qU3Vgs3XauR2C8euhomJvuSjI40GoMTUGfQbehZ7jp8ZVty/l5fZiYX/QSW6eck5hXUL
         1IJ1PpZqCgFArrfnLa9Fc2gP+Dm0mksO2+yh3dmlgGFwF1ESuvudU83rf+KsnObbN9eL
         3PcfVs/hEgJpNrZJ9x3uKrZBuqflfSQnjjOlEDm2af+9F/dhChJ49JWLXKneV1Ncpa3U
         GqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875607; x=1789480407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=;
        b=DMbQGQrXuIgMJE8Ekb3KAmglOnDLmmP4YGsenLBUMnorEIaGPnlKorLPfVAa30PLE4
         kJ423Dvcfw7W74I1AItEolXtkk5HiTZufPtWf5O5smB97ykxMO+NhzK4X9s6RukM0I4x
         SuOginmBY9d1Dt47aD1Qb0xS4FyrIowFunvBFV/SLFA9o3lMHCLK7T3UObZva/cm2fTK
         ATTsrXZ/jeYVE1H0mPVfUM2yl2LEa/2yysht+lL1y5ijLBosWTPTTZoR5GnZESbxBZvP
         V2PjehjhZZiXiQLS+rHz5y79s1aopZFZTS4xHuALN0w6rjV5+zOQsrs3eDpfH8AGouxw
         O3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBz/enVHrRFShsC/qF2RLnNv9Y6HYYzu9KGNjkNL1pz8CmEeGeZW/kHwbRa9Kq8hobb7/q1ZXlI=@lists.infradead.org
X-Gm-Message-State: AFuF++lVRNocFnc9MlGLVGeS+0VRkUaKRNmWL+/tJZycqWcEqxZErupt
	hbceeNhvq+EsJeKOrbChkqxZwm99fyK45DC3QHcAdoFRh+Cd2v2CVoODslTRyouD2Q==
X-Gm-Gg: AYBFou0ZwclYBTb/kPswAFyIGpmH8mKKvB6kSavOAEta2JuZjgUfhFLdrTVMJeYhGdC
	829S+3ftAMmi9fSEL6Z1zPWIS7lqBuyTarLGNbEGnp/MuNNdyCHMBT3rxr1AxVTWvJVbYPMcghV
	hwUkGDIVaZ7Js9wvpPlZFBCfssYP0REDSwgoBgQezzhqf2SCzgf4o/G6Jq7Kub7P+5inQJlb1EM
	kIKRFo0/8gWclF+fHw0vP+rsERuEJfnY6VOTYOlaxyCoOwFZvQye3JoWypz04R15oacWc5/kX8P
	9RzFEsAh0NX1Ao5b6EniFjFpkmVZYGVLvZdg9HCF4aUEtkC6bJ59mler+0gBusYZVsNJ++kOoFo
	a7n2eppRHWc2NqCeXNJ4Jy78NnvkLTskvpaS2FpB0FjxA8WC69E/1qMNS3kO1x+Zb/3jBIWBimT
	3g3wt57UZfbqKWzOKpgKzr2iWwLMK0LIKquePstJ+blpjsUhsE6YYlGm7EciO34cmGp1eXZx7bQ
	CNPP7yJ5RYvtv1zscaqPFVbIHnnfICe6mXJpNATeoTQ2L0jhAqoqbTD8Zdo6ffG9B3g4bBfcnKh
	k+DwlrFc36tGd/nlqi5QrjPRD/foGDZ/hDM+ZwOa2Tbvu1M3QUxLJHkD7cGEReTopy1weECDH3C
	7En9bRo9r5gKOBzkUsHx4XQolqEKuhYT1lUasz1tkEa8JPvU1wcuZWS3pJmYulNWUoUN4dIdzZv
	thuBo2prp7tNxH
X-Received: by 2002:a17:907:db01:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c260c8bfb07mr1133695366b.6.1788875607271;
        Tue, 08 Sep 2026 06:53:27 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 9/9] wifi: ath11k: budget the tx completion handler
Date: Tue,  8 Sep 2026 15:53:18 +0200
Message-ID: <20260908135319.754140-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145329_384158_0A8C0E84 
X-CRM114-Status: GOOD (  15.01  )
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

ath11k_dp_tx_completion_handler() reaps every completion the release
ring holds before it returns, and ath11k_dp_service_srng() charges none
of that work against the NAPI budget the poll was given, unlike every
receive handler below it. With the scheduling round that now ends the
handler, one poll that finds the ring full runs one round for all of it.

Reap at most the budget's worth of completions per poll and return the
count, so the poll ends and the round runs once per budget of
completions rather than once per ring. The completions left in the
FIFO are reaped by the next poll, which NAPI schedules at once when the
budget was spent.

Measured on an IPQ8074 AP with a TCP download forwarded from a wired
host to one 1x1 VHT80 station, BE aql_txq_limit 500/1000 us, 20 s runs,
three interleaved runs per arm, download rate and the RTT the sender's
TCP sees on that flow, mean and maximum:

                    Mbit/s               RTT mean ms   RTT max ms
  with this patch   100.8, 101.5, 100.6   27, 26, 26   32, 31, 32
  without            74.7, 101.1, 100.6  120, 27, 26   1873, 31, 30

Without it a poll that finds the ring full reaps all of it before the
round runs, and one run in three stalls for close to two seconds. At
the default limit both arms read 101 Mbit/s at 47 to 55 ms. Two soaks
on the series, a 91 s TCP soak at 1033 Mbit/s aggregate over five
streams, about 86000 completions per second, and a 60 s soak of
200-byte UDP datagrams at 60906 packets per second, produced no
status_fifo-is-full warning and no TCL ring-full failure.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..ddb434c513e0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -783,8 +783,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
-		    ab->hw_params.ring_mask->tx[grp_id])
-			ath11k_dp_tx_completion_handler(ab, i);
+		    ab->hw_params.ring_mask->tx[grp_id]) {
+			work_done =
+				ath11k_dp_tx_completion_handler(ab, i, budget);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 70d326fe6a1f..3997bd336942 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -685,7 +685,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -695,6 +696,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -723,10 +725,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (done < budget &&
+	       ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
+		done++;
 		tx_ring->tx_status_tail =
 			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
@@ -774,6 +779,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e01..b5296cda73e3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,7 +21,8 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
 			      struct ath11k_hal_reo_cmd *cmd,
-- 
2.53.0


