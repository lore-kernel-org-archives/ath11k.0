Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF06C79FAE
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=; b=E6MnBXNe+UY2bceZZteKuEem/k
	b06JreJtXXTc8Ligrab4263OG0gTmD+vGgiaNhA93cIaY7zPNMnSyIuUHxov7VE+FbBkcMeB1QZes
	KeckeGzzbZa7d6vlUPxUxi3IduSkt9sABenH15okB/netOfPb53gBRjZ25fvfb+92SD5tEHf4ofYF
	NNO7o7MwqvdEDgw9QgRmCeQE4UCLkAxpiwvq/dm1jQ0bQeQ6pU6KKFpKSxD1SyTan0pxFjz2Vtvu1
	Isft5VMAztj6ThrMXNqgVC11dkBLiv03ZL3TC/koAstn5sUfSKuKaS6N/wgO/CX21efVTi0f2MLKg
	JyFj6jLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009Bqj-2n6g;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGQ-00000009BmH-0LuZ
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=; b=f84XielKdXhZS2S3QPSwgDyO52
	5X753Qu3vqRWHEEJDxkqHv/1h27XQqQsOwvarikROBfxmw/WIVAjRhQ70ZTTITzvNkl2QEXeFRMD+
	yrhGf/GDs7A9MqavtZ5PMXLL1Eguyt3c4CWin8+CdX7HhHMFO7X4D1jafPiiozqKfRAJe7JV1Aoto
	Jpp1K5pWDfq/uOYdDWxUOz1WMzZuhix8oIIjbLKcvDGrPM97jHe9B0d8QhVhnxFOi7ZZ56oQaXOGs
	/00WDnoN754+1g73xUJg6ftE/srJtPr5yg3u0VhFa+8xVrrkFBoBF9w/f3j76+T7eNfQvdjSYgXxH
	xUPPH9fQ==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGN-0000000HUjX-1nIM
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c20e70a0962so592903266b.2
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875606; x=1789480406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=;
        b=S9JxFZcb4hThpaxsljdRH+gJQ4rbEqKfQMjtM6jyDCk58rW1F+8ZL+0/y50xyXvVrl
         wuyFQSKB2tH4GjpE5SDnxMgTJOiajBnNcPjNfQUq7JZfaNeVcsb7sfi0BEpNXHl6hGvY
         11qx/NNePsQreOa+xJmMbaDK0Bvk3TufqWR21TooCSN58CwlPCsgg9NXnpTy1a2b5ZE0
         MmJhIxd/4z/2f39lWPBjTMDf2kk610TaQ28/iROiWhxhLPo0xvfgs+bobHrbZGxO7zbQ
         ozq3v3XdmLJFew+7YAGuW7veH35F9bGpEnhQ7rp51vMHQvIO7nnyStDlVkS0fR4+7cTm
         4J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875606; x=1789480406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=;
        b=mwRgdZVGgr/d9CH6YpVlNkrxT2hFH6aTVCCzUQaaeRkys2VRbfo8VGyusOZ+K9wHhc
         Es4IZMeWWkmRqyswKRmgp8xQwBrPZUhNvKKs2R9s901jcvx8hYK/c+r7mHb3Mas7cquu
         eJqLUUeVKiZoUId7KEZs6gqFRZEHSvNTGcQci9Pviy206Dkf0xncyHad8EdhZB3LxfBK
         n9B41Svy6xCp8PaLy/Cd/unmzc8/yv89u30ZdNuDHWkWHz2R0dLb9IfM2X1IaIQ4DGeg
         s7+vBuq5K+dRCtyX+AYWdO/SbRsLuWk/dbKuzQN0Bzk5IBVt4SbtRdKu8+kz02YyZjst
         qZMg==
X-Forwarded-Encrypted: i=1; AKwUvByvpYgUYlnx+MBQYc32GSuGe4ERJuePYv5bY+FSEJR8LX4K21vb0rl42/8eHrcL85Uf4lDqT8w=@lists.infradead.org
X-Gm-Message-State: AFuF++nk//T5ZILKK1wEGrtALtnhuYJMRN5V4jKTVxVsPHgq5TDbq39j
	JHLIbJblE1U4lwpD7rCsQr03Vbzof9jpHZ6VTyPpF01BVi0aDePqTsKFoeXg8MWLVQ==
X-Gm-Gg: AYBFou03/y41EJWBjkwsk8Hcd3o9rZD/79SjYHOEuKNxtXqkWML04GPcapXxZQcGOJJ
	clR7yrBQetb/GNxhF583RFSg7dfH6KNjO5olWkL2oeQgb2zL03KA+CHbBqbECZ+2WOOaF3uLQ+d
	+MX39f1ubU7piT0x1SzvYHoWpwF9ZuMqkrL8grmz2ZgHEwFlXIzyWItfRAvZ54ut9vpMYCgfkLf
	r/6Hx4NYh6rsjDJEveveHXnknoVYsGXnjzIZD5fltNMcsBJj1QbgmJ87tGC1H/Vx2bS8fNvDWi5
	QhmjwOFlupr6GUTsEodM3Wr9VfCA5/2+3LUzsKcFwtmsyFhEnjgNdEk0hh+lB34t99DRyhjCMUv
	Kwll2+3wXk+fzCVjrCsqiGGTGP16VRx2xzxqiINIQoVdd0tHE348s+43qUZUZwEkazg9knwH0pT
	uZodV6W69sxJvg3KWHWHsgQaD0XczIC2YMdi4h21gX08WddjuHgllsTWunOmxxssWapqKmr9yrS
	d7mxSe+V7L96Wahpo5lpAjFwM8izCwB32ihiToYUYS6OiKXOc7T7bVAqgWHQVfShFRM6mpIogZX
	cuwCacrQq6Hu+g+32ZS6o9mQBBlBpAZIvJeJRRZfmyGiIckgGmE04flgqSVYH8uwWb32s1kjpad
	4qQjldxTd9iW/adkq1E0XnJFH4qhptMQ+t9Z5LPNgUS0WxpKdspn8l/z3HyUZpSRmdBiFse5oza
	Y4vYuXuz8RXDSA
X-Received: by 2002:a17:907:6ea2:b0:c25:8bcb:ea0b with SMTP id a640c23a62f3a-c260c6a0e93mr1982912066b.4.1788875605742;
        Tue, 08 Sep 2026 06:53:25 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:25 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Tue,  8 Sep 2026 15:53:16 +0200
Message-ID: <20260908135319.754140-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145327_568290_FA25848E 
X-CRM114-Status: GOOD (  14.48  )
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

mac80211's airtime scheduler is configured to account both directions:
local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
ieee80211_sta_register_airtime() adds the received airtime to the same
deficit the transmit side subtracts from. ath11k passes zero for it, so
an access point serving a station that mostly uploads charges that
station nothing for the medium it occupies, and the deficit that decides
whose queue is served next describes half the traffic.

Register the duration the hardware reports for each received PPDU. It
arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
subscribed for every radio, and ath11k already accumulates it as the
station's rx_duration. Charging it once per PPDU matches what the
transmit side registers, whereas an estimate rebuilt per MSDU counts the
preamble and the interframe space once for every subframe of an
aggregate.

The PPDU end user stats TLV that names the TID is not in the default
monitor status filter, so the airtime is charged to best effort, the
access category the deficit arbitrates the bulk of the traffic in. The
call is made after ab->base_lock is dropped, under the rcu read lock the
loop holds, as the tx completion path does; base_lock is contended by
every tx completion. A PPDU from a peer with no station entry is not
charged to anyone.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 68472e1e748a..a7b9bb295728 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct sk_buff_head skb_list;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	struct ieee80211_sta *sta;
 	int num_buffs_reaped = 0;
 	u32 rx_buf_sz;
 	u16 log_type;
@@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			continue;
 		}
 
+		sta = NULL;
 		rcu_read_lock();
 		spin_lock_bh(&ab->base_lock);
 		peer = ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
@@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
+		sta = peer->sta;
 
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 next_skb:
 		spin_unlock_bh(&ab->base_lock);
+
+		/* The airtime a station spends transmitting is taken from
+		 * the others, so its deficit is charged for it too, with the
+		 * duration the hardware measured for the whole PPDU, as on
+		 * the transmit side. The TLV that names the TID is not in
+		 * the default monitor status filter, so the charge goes to
+		 * BE. Outside base_lock, which tx completion contends for;
+		 * sta is held by the rcu read lock.
+		 */
+		if (sta && ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(sta, 0, 0,
+						       ppdu_info->rx_duration);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
-- 
2.53.0


