Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A51C5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEvSzrV5rFR5uHelmOPkOPAfb0Dsg+m2IDvGU2X7KdA=; b=WzUXDA+6ClYAeml0t03WfCSldz
	bGedNSGEEWQ4uJ7Yikg4hy4HUUvHzeTw25wPunc/mZ/I7O6UjMGPOyym+p5HVxHXWiPs3kN8Itd3Q
	DrSMBJrPB8EEy9+ZbFn3da7E7P0+fpoMh/ZPisQoNLBmtONh77+d4jhttJMdFgXA5UhSeikIizf+z
	qjNyrEjjxlBpg6/MEIIDA1b/qsy5Gh+acarWyo1p5C/8G0mAEbS0AUtLAMQhsUFcKQZ82O8aY9WV3
	1uF19ys35N1HKt5JQrp+0iO6iZsfBU951fOaEz4fScbzS65UKGR9fg6+GWaDjlfd+3zC3UlcbmdAt
	ZEbfGKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKa-0000000G79T-3rlZ;
	Mon, 24 Aug 2026 07:42:56 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKX-0000000G77G-3c8C
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1671ec8692so445458766b.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557372; x=1788162172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEvSzrV5rFR5uHelmOPkOPAfb0Dsg+m2IDvGU2X7KdA=;
        b=ZCiWued142B+M1neBeDklq5fr7iVOgbD1uKpXJSnO2BH9rIaOkemlYG3TYrTbaYJrK
         bla47rUJ7a7QUcHnvmQEsmpQ6eaF06yerrH+OmTEtdAWW2343LQxy0o5nYDP+Xmtr44V
         7KcPILdsuHbF4VvyVD1DhZ/rmb2NTIsFI/Fr9g98clQ6CNopk3n3/c+b1u+3IKZDmDMC
         7Cw7aNmPF0x/EK760lyDV6mXizuwyC56yv1XiHl31AQn37QwIyrjVYlRm/KvvKOet3tB
         SjVIkrCcleuOmpL6X20VKN0LIDruRqSmi0fIYZGfrmnDvNn0F/iU47qrviUes0EAumuo
         lA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557372; x=1788162172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEvSzrV5rFR5uHelmOPkOPAfb0Dsg+m2IDvGU2X7KdA=;
        b=rcx3cX8ikn8PKBqwVmpynpFHkEBZWSHVoKXqxY2LCMwd1zbG0pV0fMbVOXLbXhUecB
         LoTdTIbQ3VEPR1wXl44MioRIa8Rg9+XR6Ya/u4eYZ/NRYNLOw6nCxcpZFCWNPSPy7Nzt
         mXnIB+20gxsvJfRFJq6XiXwYAAiQoS7FSc1++aKhzpu/RiBlIZdY7Lq8FB6BwQyT3yqQ
         FzYn88kyO046yCuq4bw21iZ9rUEP9lv9XwYdVifz4WqLDovPB+I7teBTn7SPsPUlMQPg
         Zivmym1rF/U57NGPZ01pxMEGFht2CGAUOiK7qRfNJsmBc44VHmDHrWQyZ2htGMT4+Mqx
         avRg==
X-Forwarded-Encrypted: i=1; AHgh+RoP1UdPjbNo+daljbSB3259ymh5S4lHCsHn7DQpIYfID82IrV/XHzHE6tkDjIGiqwut8uMUhkw=@lists.infradead.org
X-Gm-Message-State: AFuF++mKoEdl7GBxSufflBGbCtAeAKrVdP89pcRXdtdn6P+ifP2I3kWT
	DZTGNDZNx/fbcdCefTc9P4bymC3f7h3/6eIP2GbRcJoflzR/9dUPy0qg3SGwzQAZUYfNoMghvFE
	5HnBa7Rf+
X-Gm-Gg: AR+sD11ADTg6K1RzgWtqgm9Doe6Yu6LzePk2KUpqZSsLf71haeanF6FBTsa7sCTwg+u
	KHYgZlwqQwy1bQWzWWcLfCvFPNDJxIc2tCbYxNE47NUy+5MEjHdOSqSdXd15TJu2r6QdOw24hsS
	dXfKtVQGqJON/Vx2uqEWRiEGALKQPZ0+VBwZV2XSbPPx4H+itlvKwf8c3asrpqZ7PTNFq00ZNb7
	dyKYaW+221bhVecuWedoXscZH2opGz3ixRId9BNgCowWBKYro/TuzSVper7920c99uBtjA3fb92
	g/3lyDjyQSN0mpCaVWieVOz0z6w+voWfV3fkVjy5yjJoXNPPAXUiuG6DtCHGIi2ecK6saH+VqWJ
	rkihvYuYFxSINAVsdyWVFy1mAga5s+gCYSNUEI0dRHTwEYX+dVot+YlFQ5QyV1bJGaaLa6KWTxv
	+eTGSb6PIT6P/Y1RW/buTuN+bnaVnNfM7mLqUJ35xYy/jKRDX0cg1+zVJFucj0fk7uaRyi7uJNf
	QJ0lMOyg7He0ciWChdGhlmLXjzblGKVj3BmYrqGkw+T+aSCAKLHETZo2/9pmNxIaDP9F/CrqC+f
	EBNV6mQj2IFfLJxYDtd3kb6WWe5qdHogQqMI2QyFEbDQwEIWLrbW011Y6SXaFZoBWQ7bM97pIIm
	MjcDHzgTVdzLUnlsto6U+3gi265UkjSQODN46FbRVFtHDoiCqfCf6qT9S0ff7bJcGezFx4VU0uD
	Lw3MV6S/cgt4ZecL/Rra681i6U
X-Received: by 2002:a17:907:d78a:b0:c20:899:b8bc with SMTP id a640c23a62f3a-c2491c836e7mr1648797166b.6.1787557371929;
        Mon, 24 Aug 2026 00:42:51 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:51 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Mon, 24 Aug 2026 09:42:20 +0200
Message-ID: <20260824074228.2114579-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004253_933399_8D4E5930 
X-CRM114-Status: GOOD (  10.46  )
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

ath11k_dp_tx_free_txbuf(), reached from the HTT tx completion handler for
the REINJ and INSPECT statuses, releases the frame with
dev_kfree_skb_any(). Every other tx completion path in dp_tx.c hands the
skb back to mac80211, and this one is the last that does not.

A frame freed that way keeps whatever state mac80211 was holding for it.
A data frame whose socket asked for tx status has a clone parked in
local->ack_status_frames and an index allocated from an idr bounded at
8191 entries; ieee80211_free_txskb() releases both through
ieee80211_report_used_skb(), and dev_kfree_skb_any() leaks them for the
lifetime of the hw. Commit 29d15589f084 ("wifi: ath11k: Cleanup mac80211
references on failure during tx_complete") converted three sibling paths
for exactly that reason and left this one.

The leak also bounds AQL. ieee80211_free_txskb() returns the pending
airtime the frame was charged, through ieee80211_report_used_skb(), and
dev_kfree_skb_any() does not, so airtime charged at dequeue is never
given back. local->aql_ac_pending_airtime[] rises without bound,
ieee80211_txq_schedule_airtime_check() stops starting a scheduling round
for that access category, and no station on the radio is served in it
again.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..52c4a9924a31 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -305,9 +305,10 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	skb_cb = ATH11K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
 
 	ar = ab->pdevs[mac_id].ar;
+	ieee80211_free_txskb(ar->hw, msdu);
+
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }
-- 
2.53.0


