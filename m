Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD0C79FA1
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUfEGlTlgKOy+Yc5P7GRFfi0p70OFiu/Xw7gbqqsFKY=; b=nUM43QOV67W5scZ0E2Gy6MHyJ2
	j19AAa4USmJWXPTKEuvAdYQBVjtQ56/gAupQ5qucILpdnEpyvxmMviygy6g4CqoDl7QCoYUCkE3J1
	/dY0SIqV6t9GQMNND3+odKc6LAXSWzZHpQXpJGaDPjKlpdNgzYL+Oxx7UnCclCL9rEKGfkIali1ox
	GrJdBxtxJvbNYggciBRpn/cPB9RySqwHIS6SeS4F9NDoZBLXDpWTtC3fGob/jB7xkqt5Fk4IzvJda
	PjPw+T39R9jHJDB7467g5l4fzkplkcfOirFRoDCQq2z0tydpuRAlAedv/bu8H/6wRAm+Lc5VaqwG7
	/GA6fh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009Bpg-1Dt1;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGJ-00000009BdB-00mK
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2533d83e3bso801881966b.2
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875601; x=1789480401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUfEGlTlgKOy+Yc5P7GRFfi0p70OFiu/Xw7gbqqsFKY=;
        b=I+hisYXh2rO3vQcYZdcMip580RZvDwjvNdCjWZNV8IaIH1cUknafXQCiYhtdMtKXGB
         oF/g9Zk6k4hu4EI1QaA7nS/nUUnmGjrHY+uknTJSUdMypnx5pLfD3xxBMac0kYcFT1XQ
         yt/pkVDww29V+Wi1Ywx/7ptBLCzCA18z9U2ucrgsXNuxjEu1PIheJHZQtxcGUWn9U+PS
         QohDU6IFJt+aq5JM2XfP4G+bgDVM0YCghAWUn0ZNPySAuQPHeKJv32LQ7VSwRdCfSjSO
         WA1rCibQFR8sm+8N75eg+o2HhMd7H8pm9/SGZc3Mu8VCoLcKMPAWCPu8xav25Smgus7d
         DgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875601; x=1789480401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUfEGlTlgKOy+Yc5P7GRFfi0p70OFiu/Xw7gbqqsFKY=;
        b=kmkbJc58/BMxobMV8VUnxbYoaZTKoCy6zSx1uWp7eb7UFn86FXpkfVirNk+rFa8890
         fV6iiSvvHojLEnMXvwwmx2zU48tDebO44khwMCDaisANAqaJ5yu1GW0cC+RXNiuLpKt4
         uyJSKwMb/jvLHuyhBZ9npR5Y0IdaWuO3LX0r3gqnJ3eDB0s8qo8H6scLyQ/RKFysaDsJ
         bFuR/i2i/b/2b3fUhlEtWscGn5UAZfQV+mpWCOGj8kRJlQIGJLZEymxfenwVv4SXVx/Z
         VEm3bDud08lwH2nVLMVX657vaMmrd27xWf6gWxZY0hUP0oj1CdOkA27cN3DqDkHcHp+0
         v1rw==
X-Forwarded-Encrypted: i=1; AKwUvBwzCVcKViD3D2wb3aS3gCh3w9K6lurMRfRKqlGmEwO3IY5LbsyoVaCEiG+yzChqdQLWGJsTXSc=@lists.infradead.org
X-Gm-Message-State: AFuF++nHHpSxy+YzoTmYPwb33rEuQitS+L0NGwdboJWffA5TPVyMiVKb
	7RQj4tRYzxa2mj/x25tOhmrTutKdHUDllS4EmkaN66QHc3vlKeWenAiLJ94J+Mlbmw==
X-Gm-Gg: AYBFou1rCXdQLevDRaslbEusMeV+YimbBjSBP+swH08Cxt0dqsSPaOey6vmoNAQ6My3
	6RkQodXjN5u9dW/giBRCBbZxAssFmrHwKhesoIgef3wlqDbyqubYZlVuPWxedqqJTN6y2X+POSb
	MCu2lCLvHuY7/Pmr7iLriGAit8oDZ01OwVJWq/texHdpj7ZQMcPAIp99q3lAJEvJDeWGhw66sDU
	dSFHesadxAjGU7OhJxcveDWD7EI6Oqa0aGNRFHIwM0mpZ1ixZCnmAY5uEidCL245TZT5y26BOeK
	wd4X+esJ1e0I85xYWN0RG0acQIs8bLqs//SJuLrg64ToB09u6gLQU3JNSyIpvCcDUIwtIJtNQL5
	D0Q2DOgi4+ykFMOeYfmJu7+OHNWqZpIUVNHaJqRipkzD1yjuIfpQCcw1j6iyNfIQqNzg7B8mQa8
	VLvKA3Ou44pe/TlDdqNIeEoZLbyN8smq0uMBt9JyBvVFrYMtrkYO21Yw9qb3OO+vxmPxIe+MWca
	GEkvgG9Do8PTO1xODUP+oQhObQyxnciw7KwBtH9shI85Gr1IWN+j+bI8JES7T07+iag7Hztiek8
	x1TPVrbZ80871fp8+OnegNO6xi5UI+b3cQpuqXvFO4ns1kSKDx36eUJNOcppBsEo117b7gXzsPc
	I5KrvtTWgdLUOJtDWa2o2jtYj/obSOIH2LUMjFMcIYlDamym74RMXjjFh07cfGZpdgG7b7fRJDo
	YeJs6uUb6FIEQz
X-Received: by 2002:a17:907:d28:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c260cc0bcdbmr2124035566b.17.1788875601078;
        Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:20 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Tue,  8 Sep 2026 15:53:10 +0200
Message-ID: <20260908135319.754140-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_065323_060971_C18BC807 
X-CRM114-Status: GOOD (  11.22  )
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

On a driver that advertises NL80211_EXT_FEATURE_AQL, which the next
patch makes ath11k do, ieee80211_free_txskb() also returns the pending
airtime the frame was charged at dequeue, and dev_kfree_skb_any() does
not. The charge then stays on the access category for good, and once
local->aql_ac_pending_airtime[] reaches its limit
ieee80211_txq_schedule_airtime_check() stops every station on the radio
in that category.

Neither status was seen on the hardware below during the measurements
in this series, so the change is by inspection of the completion path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
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


