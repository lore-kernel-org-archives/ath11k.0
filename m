Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA79C79FB0
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=; b=ZZUh/PXlCfhB9ELxeNofGxQ9yK
	SfSG13Vf8QtUccDbbZnZIPXjjMzQLoh18hJoiDScaLLgAUMAyE1NjwPFl1EXPDZWek7fL3MTKkiHN
	9emOKGIJT+X+AKsmJNKZaGVVBKPPgQuwScEqC3QPxMVNBzdHJOQBlMEl4aYCkT9gDgoSYk/sBeaIz
	mU3CFtpHpP96f5tylz+2DkDU0TTc7ngXva/pOl2LnL6u23uOm0XL1ANqfxxCMnFDnUjT9QEze/FHZ
	lVa7ZKj+wCU1Vxjoa+i9snyzCBlgWAQzQXK6gwhdoFfJQbdkrplNEE3yHcN9l2W9WlFsWXp4aQ7C6
	kqikh30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGS-00000009Bra-3y1x;
	Tue, 08 Sep 2026 13:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGR-00000009BmJ-0iKH
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=; b=N+9j1pSH/hSPIEfXibnPlIRE0b
	WENSw1UMmLny3YRmC9RW3I1mujZAIaMrK3StW8b2ttoYuEpWBayEzN2i/g1JSngeV2H9rNwQIhB9W
	FAl+MCPdobWCURYnRqQ5S7Fo2H8KDbm7JixiPgZLCzJXNfoO560tC7jylchQ3tPAFHgvz9uaGTKIa
	DnuIm3QTdKCTMDC9GD5rs8C6+OSCyorvm4bti7D1tIadf2krcLaq7JgkGacTrsVRZKVWDdpx+saGL
	dRdkmjxNbKnpQ1wsx01olW2H9ZNjpDrtxYnpGOdh7mtGqIMBCTVMPFj/5GLDJEZ2TsYngJVpC83nX
	fyn8PphQ==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGO-0000000HUjp-1SZN
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:30 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c207cb16cf5so742115466b.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875607; x=1789480407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=;
        b=tCcFTG/z0ADhH7xfQ5TMWczUD9YQkTE4iJ1QYLh13KuFkaQ7oHGONHVy/vnJK/b17c
         Zzr9mbqqIs2tzVq2LGEzFVc17bIeH2ttVm2jVROfdxOtxcX80tlST7at0SkpefJygnWb
         RDYFeeUi74fZ8oRd2+bGoG0IO43JfbSrVBaXAknhzIcWeDonFrabgRe09fknHq7AUKLk
         iLjCNTyoSKKfAmQNKgk9hOQfCVQcLf7J9W/RSXDEowOSfapA6sVgRH6MYd/zwqLtcLNP
         STivFh2rSIc41moHZSDhW/27FQjfPxsS+5Cr0gLMl+yiL7yQbvDelVM1a0lt7Df0dyjs
         XYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875607; x=1789480407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=;
        b=QqEaHuacNFPVOOeIAVkvj3cdxtcVMnyYiIME685G8zF8SBZCzHivKmu9sxNHxTynTS
         w8GFRp8j4WAxhvnMS2bLgT9C8p1LaIU0gzbyjQ3ExNe95WIwvBlvabb3bDyDnyTBDgSG
         Fy44JD8/TtfnFdCeK7yjPbehm55v4kdIc2M0pXaOALg71WNLpZEidCkkTyiBfDJzmvVX
         5A3RE3urbJpFuxqppIXrUnZVlCJiRZDecOJdEqetqhwdyOHhysukWMcDYSpWJHuEL6+O
         I6158Qs3fMlz5TC7zJ4XVmKEcGoQnQNkUioIk1trh9y7h7/G40c1xyTXzR3snEyhzdkb
         cV2g==
X-Forwarded-Encrypted: i=1; AKwUvBxmMOZIzdt3KY1nkNvhM4VuwRFRk0rcyzrGUKu10ARFBBCOTX4SCUU3vGgF+ujxuz3ZzmCslTA=@lists.infradead.org
X-Gm-Message-State: AFuF++nFfIgoTSyGDq5AXoF6bWjOXa14zXlgZTgMsQEhFcXOjcrtE2nZ
	sYK7uxKPH9NVdxumSjqM+0UpXYoxIFEoA9stjpqpLWrWIgabaHWs11zwEGbB5WRZfA==
X-Gm-Gg: AYBFou2GrYnTT3rF+HvBnbgJCQfiprZAcnUKo6dAKrMTNnH4W1KY0apQK51w8bC2iBN
	npXDNjJtyJobhdrOv8rDFy401A7Jx4t/JBme5ncrqpZVnpZ97KRCILG3brDiGeVCf//GntdC9pj
	DvH1qJbTJmwsYLEFH4zqXQDmvWDcQLzWKUvmv2Q1jxlTCDjeTMFmQpe3GuAB5A5ausLgUFxmmV4
	M/tdCJPUfKTJhHPQChNGSL7PqYZH0BwadiTNtIM0y+02OmTA35tFjIeYinhd16i6h02CysD1hld
	Rrm6Cw6JY4/I3v07Y4LUkHjs92ppLfJKpciWp1mBDHzSlkkJJrbyicPxKnFMd+u/fjvB4OafoCe
	TlB3eRZ+DDqZNhsYQ/nmzQBPvDSmd9a/fpQnLb25I5L31p2pqvbcjxQBBBV8Pb2c6ZHDckG0Nop
	0sjVYgCCK1vvNKds6Um2bGmRjm9qMhZVhifv9K+062srJssq5ZdkzraVB1wXLTYcKpjapcl4xyT
	vRHNd3P3rnGsQ+nZf75igYz2dGudgrVud+fFAFCwWm2RPUm4tpuyQOJEE9e47uVSmyPdQ/ok7mc
	DbT1SOj4VMoswcVggwiDQKTGbNGnlD0QsRZqZT0MmC3CTtcwLqB17s/JCtrc8v0iPfBXUBfq3i8
	qeiKvDaXyvflXlTzt3cy/OjaqrE/PDhKBTkDCWnLTKll7+IZIoXLLJnhY3PW9zkd+eeDo/rfsCC
	AUlePzeiObQa1b85nDSjmGzpO1
X-Received: by 2002:a17:907:9708:b0:c26:1648:a06a with SMTP id a640c23a62f3a-c261648b7afmr1033756066b.37.1788875606512;
        Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.25
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
Subject: [PATCH ath-next v4 8/9] wifi: ath11k: stop a scheduling round when the hardware refuses a frame
Date: Tue,  8 Sep 2026 15:53:17 +0200
Message-ID: <20260908135319.754140-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145328_589307_AF2ED879 
X-CRM114-Status: GOOD (  19.71  )
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
frame that met the shortage is freed as before; the ones behind it stay
queued. The round-robin over the remaining stations stops as well, since
a shortage that reaches this point is not specific to the station being
served.

ath11k_mac_mgmt_tx() returns -ENOSPC as well, for a full management
queue, and that ends the round the same way; the next tx completion on
the radio starts another.

ath11k_dp_tx() also rejects a frame the hardware can never accept, with
-EINVAL or -EOPNOTSUPP, and every frame with -ESHUTDOWN while a firmware
crash is being flushed; those describe the frame or the device and not the
ring, so the round continues past them.

ath10k and mt76 check for room before they dequeue and never hold a frame
at this point; ath11k learns of the shortage from ath11k_dp_tx() and
cannot.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 41 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ffb6b865c2df..12535926631b 100644
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


