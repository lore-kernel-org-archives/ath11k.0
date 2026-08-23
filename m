Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEF2C5DF9D
	for <ath11k@archiver.kernel.org>; Sun, 23 Aug 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drU16NpqjOVFYwneScziNmmGyeG2YnXzmWqCFYgIDxs=; b=Fb4GdHlKxz9FRLwlg5nmXr6LKX
	Dy0pMx8UeopUBHnvQ7djpPCmUJvefybnJmp3kwMmcUkA3ysvXjk+CaxTcQczLUxEf+22lQHdIF9SR
	b9uIRgJl2B7vXlyQqebHdi03N+Fsy/B+wsI4H5/9dCnNV86tE3QzsD/28CKuXhTTgETurWf0+UTKt
	uj7UqxBTcIB1OI/GGUswdmJfIyNFtqsB+yZTHtplCt5vEr9mBvc3ECziOAhmoE2WnFg0+YbJt5H98
	d1hvsfUsRl2jD1KiISchqhQNefLmVWELp2oHuoNnRRAA8Eqrkgzs2hPCpxphWqkL5gIzVXRdCK8nP
	lh7T7onA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEKA-0000000FZwD-0Cs8;
	Sun, 23 Aug 2026 19:57:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK3-0000000FZsv-0B9D
	for ath11k@lists.infradead.org;
	Sun, 23 Aug 2026 19:57:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c2055f5a993so314211266b.2
        for <ath11k@lists.infradead.org>; Sun, 23 Aug 2026 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787515056; x=1788119856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drU16NpqjOVFYwneScziNmmGyeG2YnXzmWqCFYgIDxs=;
        b=jEAbm0PcpQ2fspBIQYvHkaY7xqsZKKZcyfVhmSmEsQ1m3EL/Dy3rO/84MFVm136Obi
         SYZbJkP5j9tnnoVKL5cNkDlWPiEiC+9d3gixpab5A6ui3hVPaYMJP6FPBA9Zgs2AXyWY
         DeSr7tjSfvlZ1Afag69V/lRssP9vD2YA7tQggmsZxGXTs8OQsG3q2yqNGZbiZGl6I31G
         sHb7xY+gSU7SgbGH3If8Q5j9BTydXZa7rSbbsjmdoqVy0fbcHj25qEmPXo2HVP9i3oF8
         NzETg5LhENeE+7tSJhd3YF978sQ+eQ3OV/Q9LPUCc+KuhCyjfIoSkS+JoquUfp8vHxZK
         0qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515056; x=1788119856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drU16NpqjOVFYwneScziNmmGyeG2YnXzmWqCFYgIDxs=;
        b=dOh2s/qNdyvg54IayJ1Ng4S9DNlo2AmBjVQsLDY9apH+f4RPQJXJps0SjAyMX9zZ58
         c30MPOw/HaAvs2kvt6FQT1usGHZ64mnIhm/uZWOHIis76SBNsPBkPR9VJIsn2eH86I58
         y4QSuwgGAIuV5CMcNZuqfSJilShhb1UOBGou3OdRJoZa8LhMhFNJBmUDGLN0WXqB8Mqq
         9Rz0wnJn4Gj5Zb6iMvrLCjwdOh4L73M+UnlzPrO2/stH9OdVXFg+5uvQdshw9Crdgq9b
         dfsvJRhGB3UEnMPj0ZgnigwMoTzOzM3KNsPYpVhM03vxFFVdrqAFrXTksSx0HLtqtbJ7
         1Zuw==
X-Forwarded-Encrypted: i=1; AHgh+Rqco3J5FRsDILn24jD37nmiNZ99Xv4imzpEfzzZskFkVEm9izM3CmOXJXsaW0x8hEDg+W3qQtU=@lists.infradead.org
X-Gm-Message-State: AFuF++kZTQJOpmBQT8V2he1+F9E4cC/RRY8c+25LzBImNIWe11qmKVvU
	hdobmfrn+rg8tgA0asL9yDkVhQhTOyuwqntCXFXzTv/JWT/EGQPAOfTMbko7YkheguTwxc8cupc
	ivEb9yvUj
X-Gm-Gg: AR+sD13pDS9J1XVd7rrHpgDAJyNjJryj7CFNwFeffvMZTe4Er+4X0XRWu6rl6Z2BjDj
	Xmfj+RcQzjoPUNsHXsiJ0IH/SPSn7vmMirmjfRtuywADGg8GBTE9U39ZW+op4M/xxRefOr3QHgg
	6Mtq6pyd0SbWHrrfprIEAKNxwyWdJzLTB5+pUq3coKY2hhjXxwsGuUtI5Bw590Vlz5kZKbMk5Fx
	6iq4AMZaGXSttTnX8uuSxsnE+U5kDVOSfzgozlHN69oSSLPlmmESKCyIFc6DOnAd1i9CpwKOlKR
	zK8A3HVXYywH7JYcglUJHqPbY2AcKiUTTJCpvebJ3P+YU75Nq5eJNPJHF4C8NVuRzV95Xz/Th+2
	s2hd5o0Qkc8Ql2nv5g+Q8YEe15GlJALhIR5NY12Mz4CD8wItdJh1hApZD5QUIf/pG4oziGkBPL6
	JaowWoAi1K1isXbreXMbU6tMwETe7AmYr564RgYbQ/qR6k7WtiAtE2jKb5F48R/5LM108A+Hujv
	tg1ugGK19JkYOQjE4f+X1E5ElGtrjjDWSil6mR3W+MGv05kn8HsGjBIxz3P2P9FDJCxQnEtcYPD
	Alt/kuGA+ALHD48iIv0c/9T0uiGx+FN2sZDF0IrdNI1BSRJhpzQlHhBDaCR5ZXEL77JL2BSSww/
	RsQBlHBAJfnfJQwvLO3LMzkuKahSBp9Hq1Qb9+06H1sd1OiLhNcSIpVTbdf5VF9NL264x8fv78S
	OxS9iOSsqXAvvT
X-Received: by 2002:a17:906:9f8b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c246a4c6d63mr2074267466b.7.1787515055706;
        Sun, 23 Aug 2026 12:57:35 -0700 (PDT)
Received: from Desktop (pd9513a95.dip0.t-ipconnect.de. [217.81.58.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8edsm889532666b.6.2026.08.23.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:57:35 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/4] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Sun, 23 Aug 2026 21:57:00 +0200
Message-ID: <20260823195703.49198-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823195703.49198-1-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_125739_098277_50A4573C 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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


