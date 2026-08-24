Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BBC5DF9B
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+s09lJoW19HOfjqPgOsY+MAuN3xrwX1WGWVvclfdOM=; b=kJzDRNLBZ1s33woKKnBlLG4o4t
	WIV6CU3yVQ5GE3E6YRFX5XExFKybcKHi/vIU0uDjylDoOx2fvKb7OxFoy508Z1oVxnq7RG3gXxMz9
	/0pEtIuksl+Togd8Ni6K/+i4kJCSCy0zfniexN2V3UTCjPdDXYjJnesgJvM3Idlg1mrHxgHI4gXZL
	x6Ub62hQHKcFIPktu2R16I8BTHs29sr/6l0mAq6XVJTuU3TUQirLSIXyejKPwpRWSFuZuBawSiL0M
	vtM0P/sX4rr2uSy2kz3Jvd0NkIGEGIFX2zHNsD1lYLf60V3hA3BMhl57aRu/pJuMjcEbdIHeB77GX
	ChqN7ZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbQ-0000000Gm2x-0Jol;
	Mon, 24 Aug 2026 14:24:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbH-0000000GlsC-0Re2
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so533720866b.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581473; x=1788186273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+s09lJoW19HOfjqPgOsY+MAuN3xrwX1WGWVvclfdOM=;
        b=qwAiag1DCgf6/ByT0Vby5VdrDLhNny6+Kpb/YVax1o/3gqic7Zn9UfEb1x2SzLEfx3
         opZ103x9S/Ov08e066Jz27+k4a+k/spROeFvF5uqppmEpwfUJLvQI1FFS5uR/0uFU8VH
         SMrIdt/VdYmTOdH4PprHmmexkl8ezRRw5ddBNca5NMRIZZc/LTGEjAYE09iT65Q5QI+y
         JV7vcHt0a1UODsey2VqJhprWYzX2RNqYYL03y50PqGeJavnI/HbIImk1GDfWHy8UcKCN
         1/2uSTGA07guLwxX+whgEZXDIjLAOPqSEn498d4lwlgtJvyOQTh7xeWbCgC5ESn3cdBW
         fDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581473; x=1788186273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+s09lJoW19HOfjqPgOsY+MAuN3xrwX1WGWVvclfdOM=;
        b=nQzMyLmU8Kh76WUgN2RHaY6ZIrmMqvWUp2xXUqLcfv2shZhqORTU0VFfBLH8r0QwZf
         ni0u7USf8h0gq/9qsV4jQsgw626gtmqj7PcPMAqsOmVJ/AAX2leEWTSdzMqBEzvEuPCd
         Nhwy8bt9SmaUoSAuQjBOI4OiC03mXd3nU/+v9oqJcQ3A5IbZrOO+6SvKeLK36VrZ/Vdo
         ccYE7wz2jsZ4M8sLC4lSgAEufIAP7F3lJkEwC3+9nHsYIXb58LSXRiqLj0xKtn+pmxUI
         Vn1R0aai/HjUy5sCFDDjFvjNzKC7UULM9RXvwzu04YEYFgrS62VkLPnooUCf/Tn1bvLa
         QMwg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8u75sPNnKYPuJn8nTZM68PapjIuS/k4nnWos5PTEry7xY7pyhRxKcBc/jo+9LXeFBljPXqdo=@lists.infradead.org
X-Gm-Message-State: AFuF++lxKl3RoTv/CqognyGSIJW6Br4Ou6AkIGNkNewWes1SRWzu+S4g
	R0pU8y7G0JzLNDsQ3U0cvv8iDIp/KdLUBrFumqmBT7QrLNEy8N4YoC//sCbO/B79yA==
X-Gm-Gg: AR+sD1395wuD20Lb8fMVxNq0pTz362Rxw4em9HndS32qeoSVC4I4B48M0sxSBjYN5/m
	Thc/87v7pam+Kor7BnpeFcDFONXeyUPDJY1G/FEGDJqGYh9133DdnkLgipByIvv6FeRDxZ990Gr
	oRo7LR/Y2K0OLkEiHHXFiSRmhBeWTmk/TpCizFNLxM8OKeD06B+pS70fpbBiEcAONnR7R7ALsU7
	h0G4XdQRf43rm92FrlL7zrre0uo0l5lYhe7E+uPkemkaanf1UgcHDu1W7d0ZTdsBVz7cZ0nhb+r
	DFTS/d3103RVuMcEybUbsM53+kSf7zXqd4hL4N9tnmhlZsfdXJ9lwlKp7aZ4WwTBmxMA/BGlRUp
	FxnaYbXxxVqSeF2R0Yaamcv3smbNcnRu664fp2Cvv9x8OAd9lyhhxcaLflYlfxFIhDkDltWNl1B
	JPPiqq43Vumn0U/yy4pkZiP4ELB+9kv6Fk1LDo6rMqnd4Rf0tLwsr4fzARZYKl01lS03PgrkAki
	W60RnrKs6z2W1K8/7h1oiX0mogs+yU2ZAk0QmR55LAZMpGFAXP9VhKzR7KtwTUdRZFHoeJEf6RM
	ZZdDfh57ixEq6UsOQkaG7EAfboKcx1wTMBCNvaigH1pytS7XJ0JBZ0SZnLgv74dSOnrdx4Fhr2R
	xPrw6/dv8f7ov5L5HDz18X1KjUPFH/4teSref2MCnclZOeJgRvn5h/w963+vvb6U5GAD6GBNf
X-Received: by 2002:a17:907:97c4:b0:c20:af9d:454a with SMTP id a640c23a62f3a-c2492621bf8mr2119993566b.16.1787581473076;
        Mon, 24 Aug 2026 07:24:33 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:32 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Mon, 24 Aug 2026 16:23:48 +0200
Message-ID: <20260824142350.1757379-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072435_158869_17BE2F28 
X-CRM114-Status: GOOD (  16.04  )
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
aggregate: measured against one HE station, the per-MSDU estimate from
ieee80211_calc_rx_airtime() reports 16.9 s of receive airtime where the
hardware measured 6.8 s.

A PPDU that reports no TID is charged to BE, matching what the transmit
side does with a frame carrying no QoS control field; the value cannot be
masked into range because ppdu_info->tid is ffs() of the TID bitmap less
one, so a PPDU reporting none leaves 65535 and masking would select VO. A
PPDU from a peer with no station entry is not charged to anyone.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 28aaf39cf342..7ef58152719d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5341,6 +5341,26 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
 
+		/* The airtime a station spends transmitting is airtime it takes
+		 * from the others, so the fairness deficit is charged for it as
+		 * well. This is the duration the hardware measured for the
+		 * whole PPDU, which is what the transmit side registers too.
+		 *
+		 * ppdu_info->tid is ffs() of the TID bitmap less one, so a PPDU
+		 * that reports no TID leaves it at 65535; charge that airtime to
+		 * the same access category the transmit side gives a frame with
+		 * no QoS TID.
+		 */
+		if (ppdu_info->rx_duration) {
+			u8 tid = 0;
+
+			if (ppdu_info->tid < IEEE80211_NUM_TIDS)
+				tid = ppdu_info->tid;
+
+			ieee80211_sta_register_airtime(peer->sta, tid, 0,
+						       ppdu_info->rx_duration);
+		}
+
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
-- 
2.53.0


