Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C2C5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x2IYwzlbtio5Xh8rRB/sJgLP9WAbcTtyfFVFxSqfyQ=; b=qhXxSFo5YT/rnpV4hXFclczmYM
	Oh4tSC0lqmwhSr+XAsWzB6nNI7nj2Dl7kCTH66Ub0eOyEIThUnd+VxwmWaizogvYBQWcWLr/N6EN5
	slB9IzZBmB5byBIfNJeOYLF564sBK+f4k233pS6oHMdyxLjXhD9DX46jflhuHkdo+5jszx0TAKONt
	nOq1zMtiLIhV1NDEylxU7DWwmbDO0CHSxogs6zgIQQ6n2FUlqj9Ksp6x4jS8kCxpEgSBhB8cHIR+K
	VhpyrYgX0nVTpCTAn9dkg60CK7TJ05QDOLNq0XTZPT1HtYmZSXbIv+xh/fKFkJIYLV0dRbMTJusLZ
	lWY0jTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbQ-0000000Gm3Y-19sh;
	Mon, 24 Aug 2026 14:24:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbI-0000000Glu3-2xeQ
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso7352853a12.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581475; x=1788186275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7x2IYwzlbtio5Xh8rRB/sJgLP9WAbcTtyfFVFxSqfyQ=;
        b=R16lvVKr7vOxUN+goNADuwnasFd5zTilUmdFDKqyFTWn02W9i3UJunk3YH/1Pg2p4S
         C1JTPi2Tpg2/up1mZl3ktUyBhMttWWw8SRzM/ujQihTWPJHn5FDz9wGlPBFapXq4RQKu
         QXjQQySkk/0bFpP0lWJKbnAgR23Sq2PmrFdiZwp9W1R7+KThnuSQ72p6EN+7p2be4Rft
         jMh1ru7DmZt3wKJdgdNGEDTKjhLmOYcKSD6oOvfOR6NghgIufyJoEqngPNnnmKSVbBaC
         a72R830BKLNCupbKNByTO4D7Jq9hmGe8PEYbh+0qR/VZpCMIFIetuOpqBQoO4zHVLxwP
         ANbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581475; x=1788186275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7x2IYwzlbtio5Xh8rRB/sJgLP9WAbcTtyfFVFxSqfyQ=;
        b=N+13bkmrTSNUvJmnDAH7ys9SXnCVBdcYUytHlfyyTqx9PyCS/coyHH2BJpcQtAcwKH
         TRgEzXC89i3rU9TV9eyMwv1SLz8vVGFqr0CThJGvRskGthAf747pcquUPKWqFiRLVMBq
         2spKYcTHMaAuNssDiJnwmQLDZ57WN8hX3jtP/IZxMgSMlOFtK1LBUR8TWH9FmPgowuwR
         g6DjiDXRzPh/6mONpUR9KOqzmjMCqy9Yc/BeACvb2TtelrCxQklhJGFhrnHKQnuJN3cJ
         JtGM/2ghUCtKxZPxntkJxDEjqXZ6Fj59EKt1haw9XAtr9WI/3EvrE8qZHAg7DJydu+Ya
         7h4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVwZAjnk7vG+jwW4BuIVG1y0W078C+qyrfLv08GrOY/mTOfowANp9G6H5de1TplTaREVd9ZnI=@lists.infradead.org
X-Gm-Message-State: AFuF++ktyHU28BOHNM8pSp8islRty1EY3zOlFHlWDQOmnoos3fh6TYv9
	V9n4w96jMUyfsS0RU10uzukmem3t/LkTEh/C55V3bZZvKCmkFNUEPWBAs9fH7Ka9tw==
X-Gm-Gg: AR+sD13hL4iKQEM9KqGdW6q7K3+kq0oaac1/sMeSVpkQZZdmhoO0w3WEymgsTRA3Ld8
	bxSJnT8Z/g8CFv2mymVat4up4WF4UeAOxRGouSTrnktJAY6WBnwYy7ewTJq/Q8nyA6cgwa2Ff5M
	Bq8GQtjpoxeQj7H1ISLi/zAGb6ce8OTxmMLXq9u9MbwM3MtVv32og1Dpjt3Wv/FEacIJepd4HjH
	xNSteJD4ttMnEnV4gZxgiZA9O1hQU/yn7b+L+LISq7arA9KWVfLiaQ7RvdodhHpFvrMzPScRPXL
	hgw7xzfQWl/7d/4x5InLYbIohfYc9/ZSarKuHAt2S5TjDk9WfhdtyNiiGvLqVM2fpqSZtsi9i1V
	DCFGfmVH+gz8nW1gCUIRqXo9jTCgDSrG8ddnwaM/7ESNBXa9OmSTK5dNXBdqbsJBW+Z7OpCBeOi
	HcTH4f2A3Au64fvhHHY6q3o/VecJ+Mejls05qyKHeODuYJIsF6zDJnt4IfMkCdbX2I9XKUs+sWY
	if+SJ/qpqploMoEJboiBl9XJIQkAZU1999UPTwr1DN55jrHhhPqKW+Pg1OMAykb5v4JzkTNlUrn
	EUYzrFI1WF2xwJIKMHTrTMoBXGtptN+MUYVyLzv+PaB0sHUr+dKeazJqZwMX/Y9w2ksYuIuFdDF
	TbrXSS6xPsl4c/65B7O4sIFmqSaITi66j+NnPfLZTgIbil45eamU9x55zPrp616StAJynakrols
	txTONqy5U=
X-Received: by 2002:a17:907:724d:b0:c21:393e:6d10 with SMTP id a640c23a62f3a-c246d5eac42mr2556330466b.4.1787581473811;
        Mon, 24 Aug 2026 07:24:33 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:33 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 8/9] wifi: ath11k: stop a scheduling round when the hardware refuses a frame
Date: Mon, 24 Aug 2026 16:23:49 +0200
Message-ID: <20260824142350.1757379-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072436_768848_4F3A5943 
X-CRM114-Status: GOOD (  18.33  )
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

ath11k_dp_tx() returns -ENOSPC when the MSDU idr is exhausted and -ENOMEM
when no TCL descriptor is free on any ring or a DMA mapping fails, and the
caller answers both by freeing the frame. Inside a scheduling round that is
a loop: the next iteration pulls the next frame out of the same flow queue
and drops that one too, so a transient shortage costs the head of an
FQ-CoDel queue rather than the tail of a hardware one.

Return the error from the transmit path and end the round on it. The
round-robin over the remaining stations stops as well, since a shortage
that reaches this point is not specific to the station being served.

ath11k_dp_tx() also rejects a frame the hardware can never accept, with
-EINVAL or -EOPNOTSUPP, and every frame with -ESHUTDOWN while a firmware
crash is being flushed; those describe the frame or the device and not the
ring, so the round continues past them.

ath10k and mt76 end a round the same way when the hardware has no room.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 41 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 150b3a1a9c19..2a70a9c58235 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6499,9 +6499,9 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 	return 0;
 }
 
-static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
-			     struct ieee80211_tx_control *control,
-			     struct sk_buff *skb)
+static int ath11k_mac_tx(struct ieee80211_hw *hw,
+			 struct ieee80211_tx_control *control,
+			 struct sk_buff *skb)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6533,7 +6533,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 				    ret);
 			ieee80211_free_txskb(ar->hw, skb);
 		}
-		return;
+		return ret;
 	}
 
 	if (control->sta)
@@ -6544,20 +6544,36 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
+
+	return ret;
+}
+
+static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
+			     struct ieee80211_tx_control *control,
+			     struct sk_buff *skb)
+{
+	ath11k_mac_tx(hw, control, skb);
 }
 
-static void ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = { .sta = txq->sta };
 	struct sk_buff *skb;
+	int ret;
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit itself, so a
-	 * selection ends where that limit binds, where the hardware queue is
-	 * stopped, or when the queue empties, as the generic handler does
-	 * today.
+	 * selection ends where the airtime queue limit binds, where the
+	 * hardware queue is stopped, or when the queue empties, as the generic
+	 * handler does today, and additionally when the hardware refuses a
+	 * frame.
 	 */
-	while ((skb = ieee80211_tx_dequeue(ar->hw, txq)))
-		ath11k_mac_op_tx(ar->hw, &control, skb);
+	while ((skb = ieee80211_tx_dequeue(ar->hw, txq))) {
+		ret = ath11k_mac_tx(ar->hw, &control, skb);
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
+			return ret;
+	}
+
+	return 0;
 }
 
 static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
@@ -6569,8 +6585,11 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 
 	ieee80211_txq_schedule_start(hw, ac);
 	while ((txq = ieee80211_next_txq(hw, ac))) {
-		ath11k_mac_tx_push_txq(ar, txq);
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
 		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
 	}
 	ieee80211_txq_schedule_end(hw, ac);
 
-- 
2.53.0


