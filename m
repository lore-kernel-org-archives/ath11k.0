Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF9C61CE4
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUe2piPfROCuIddmZ/ae/9op4qLIu+jbzjbUhLZABGU=; b=X5mDAM+I1cjTnjlzTQzh1r4VKa
	UUlT12X/BJBQU8vcwwsXbLVm4Yr1BXHBQ7b9wA/15wY7XHkafHudIAM2C5833B66URIAKoz+uNHFJ
	hT08TcpzDThbunOo/Y0EACeq0v9Mi7YCR/c5uaNgN46kJuZ9i5r7V99pTyOv3bodntCzVbUNhj8hy
	vapZkq9wIJLrIjQzjY65x1Fd61zrr5vX169S29jqdp66mGRmaTWdVFRBCZVrwYvF2EjHMJzUEmgWU
	fm1EMXCAm3i7ss1QpTvpRHL6tzNZIpYiD/HqFxi5Rgf8uhmE6IL/IVv0YvHbUhOtqIdZ2wEgPgFsJ
	SEVdALIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKh-0000000G7JJ-2HYT;
	Mon, 24 Aug 2026 07:43:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKf-0000000G7DK-0kzx
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so4650806a12.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557379; x=1788162179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUe2piPfROCuIddmZ/ae/9op4qLIu+jbzjbUhLZABGU=;
        b=SCeBhM4U/uNsfCMWSIBxp9isMZmi3yg5xC9vSvhurXQoafBgLPFmGN8gcVeQwBdk59
         86IO1SoGDvt5+r96LW96bLUipY2DlJttAu9m94A8qxoggs1GCFOiAJ+HFREGnWDj3/bI
         4jAa0qvtsl1XQZAVAwbQPRMIbXqpnE+YpYzqjHJh0nQAyCjl5wtaP4j9G3mXGWZAxR97
         Pm8Q8zSwbzJtXRzkKIZYRbxO4kBErNlYyPTK0nVVHu0eOGbQ1o8YdAyNDHaKMrI2O7+p
         jyZjKJ+xRXBWc6WEor7tXHnjjnjrviFOqBNxwfHMhp6p9gd58XC5kvgnux/58rNCwuSZ
         WSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557379; x=1788162179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUe2piPfROCuIddmZ/ae/9op4qLIu+jbzjbUhLZABGU=;
        b=C1HMBqoTJ/HVz0ZguBa1DkMEBCjY8xGKuQI4ga/SbX8O9d07s3/9pmUpxWMoIdB+jv
         MPP5qj7SBtN3z1K7PcGxoeh9rxvL93GvdrTF9oS+rsah4r7ktRWhFTObSZrpjx1FJ7Z+
         Ceu3e/rbpo8RJ245oup+t9JG+gppCFwV54Ep9doiFbVd6FZco8dQnkbYIoiboHX4hTdZ
         AfSAi547nP1SspKlHUfZKsm58fZ09WtnuWDN22il4PnowyY2wsTekES2WvO9i1GchTrR
         DSOFViQ79U/0sckJ/e/1D628tbQ4kuZJsXg8J1519lJHgA88wGf4O9LMtYPL68xNrvw0
         R1Ag==
X-Forwarded-Encrypted: i=1; AHgh+RrAD19Taj5lq+1vYSKjKgZwuNKwqTgemsz5aBDVBXHXVT1OnEkTIoS+Z07LKQKhKnk6MqLXMKQ=@lists.infradead.org
X-Gm-Message-State: AFuF++nkR2p6f/FyS6fBl1LR0kiEnGGFdI3zWElNZ7l5nS0oD8ISFN76
	cqlNMVBN5Fmv3Tc/6cV2NoSTzCqe7uMWBhESSK3rU98fdW27MLywA0r8uL8alYlVIg==
X-Gm-Gg: AR+sD11I5MHHn3uWEtqx1KXG0E/2qmRksNkxLiY5RLLWySwoebPf3zJ5CDB/NgzTvWt
	JYFmiy6S9JZYMc+YHLJjiPsvPaARBfxoSWh6VLIq+OchBSp5Nz0aE16g0lCysHD5qy4IbJ52PYL
	UGXd2dCGLTuvENZsZHAkcIUW2oKr5GHQrIHI7z1FvXC4RsiJO2McmnbbNnLbfMjb+GVyxrOAfSX
	e3j+bV+828JP2XTV5hX2ejZgq9IEBKk2jHBdZBCAyC+l9xyAUYVgwReakJ0JLOALmZgcaNZtO0x
	kk86uO8ubrg2eRUg4bVDf0UiWqfo0iETYhtu6mO9RAF02ltfp//O5tqHll3asZP7VMNotYVcBSI
	gndd2k+a65icw+SUvZrsMuGOmFfd+gsk1IJNfex+ZDo4Pd/R/Gwo3ETM92s1V+aiZMTuAlDokVs
	p2ZEfklSsLdW9UnnWdJhyBG6VB30YBHiwAfgtnqkKTHvQVGqXEnUCzsN19TN+ZQoOag7n3jMWL9
	1H3OXkh1DaB7L1YbpxzktUO1bAiNmlhmMF8E6+kb9TfGwYT2ebI7D6OWFca8XTv8xEZ4l2/c4Y8
	dmOTyI+OYuH1nt0D9EUIKivP4fng4l1n0WmAJbNb1h/abTjL2+11NKCTnxSXfoiN1C/fNuw/g++
	L623d4MvJA+54Z5vpagetIKoaLTWv85xMdwI8CQxlxyvAT1GTmxmGPA6cCl1jT44nVfC7A064RK
	Kz3FvXd4uZg7BzAQ==
X-Received: by 2002:a17:906:4fc6:b0:c08:417e:3696 with SMTP id a640c23a62f3a-c24d922ff39mr61778966b.20.1787557379061;
        Mon, 24 Aug 2026 00:42:59 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:58 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 8/9] wifi: ath11k: stop a scheduling round when the hardware refuses a frame
Date: Mon, 24 Aug 2026 09:42:27 +0200
Message-ID: <20260824074228.2114579-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004301_322025_67ADF821 
X-CRM114-Status: GOOD (  16.43  )
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

ath11k_dp_tx() returns -ENOSPC when the MSDU idr is exhausted and
-ENOMEM when no TCL descriptor is free on any ring, and the caller
answers both by freeing the frame. Inside a scheduling round that is a
loop: the next iteration pulls the next frame out of the same flow queue
and drops that one too, so a transient shortage costs the head of an
FQ-CoDel queue rather than the tail of a hardware one, and the frames it
discards are the ones the queue had already selected as most deserving
of the medium.

Return the error from the transmit path and end the round on it. The
round-robin over the remaining stations stops as well, since a shortage
that reaches this point is not specific to the station being served.

ath11k_dp_tx() also rejects a frame the hardware can never accept, with
-EINVAL or -EOPNOTSUPP; those describe the frame and not the ring, so the
round continues past them.

ath10k and mt76 end a round the same way when the hardware has no room.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 34 ++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 996f421b6957..eb420fa0fd68 100644
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
@@ -6544,19 +6544,34 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
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
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit, so the burst
 	 * a station gets from one selection is bounded by the airtime already
 	 * in flight for it rather than by a frame count.
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
@@ -6568,8 +6583,11 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 
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


