Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2720CCA490
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlOGk4B2S+sC0KxKSWrB/2y4+wcPHldmFXjF9XSW5C4=; b=uVErN70fPlaG7FDOLHoc2YRRRT
	yS7T7mz6kr/zh1VNRBNCBVGAlYO0J02PQR9vRwmilynZGARRxjC+LaJQtDXUFq48jju8udLl4tXN/
	0TlSqadF7544NPvH4mtC8vxPaSGVMfziXc3JOf/5HYr8+mnmZ6qQhd4kITwyerM845Nsn+ng48KQX
	kaX2jJTIyiGArU7QNlNR3TijAUGVCqwkWmvhDTONKSluxRRQ+mWHsKtKIrHW+sdRlgTIPdVZ2PYrH
	4Za1I8XLV9LtRmbiPz1KK/WbcygcCMPREN2TPxWEqcgKjMcUB4Sn7GMUv1fBA+n6Ogh1d+1wzXnox
	RaKq4tLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0T-0000000673Z-2WNC;
	Sun, 18 Oct 2026 17:49:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0R-0000000672r-3HBA
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c43373ae89aso65672066b.3
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345750; x=1792950550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlOGk4B2S+sC0KxKSWrB/2y4+wcPHldmFXjF9XSW5C4=;
        b=r54zBmiJJXuShwmrwmCEE9ooVytZXAPiq9D5x/HVPYxuP+K4wk25tgjABY6zHAAh1l
         5mkZ6z0W4lPMx4F8NgHhKeXVCyLydeUPrHVZ1tTMVVTyUuReGGGb3V/OR1QA4JJE3eaz
         pikLSSfQCffFwsKJ9dIDQlGRWZIsei8lCqWMETD+beHgYLlCtqaVaM4iX8H9UjoS2pbm
         S8TM+0NYA2TEInK47mBwCOeD1treRR/Ymw+6e1izThIPaGOKTUET2I8L+BeQY19X54CR
         DzJwsbi5QXhzWpUCrQ4xIOM3K7szUjzuVrQQZVgobA/2m0n+96A7qZ+qlW6kLYYK79wv
         PTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345750; x=1792950550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlOGk4B2S+sC0KxKSWrB/2y4+wcPHldmFXjF9XSW5C4=;
        b=M50b/xgC4fDU0XyCVKc18G+TVJ4+FNlymTsJXktqOmLWclicU4BnzSM2jMa833S1Bm
         cjmMtaQBFCcPfl2ookWRxmiOv3796gHMHupykp4n8R5Abecys1p/0rHE+GqG/A0l1L+4
         ORJMoZ5D2qIzzT16MqXOQBMuxxWooOqQI/1jx7NS01K8ls1e+vRERwV3+et/aqS72rGQ
         J0lAhHHuQ7I5FG4c0cyVHCv4sbGLt27wPD0S6zlHhoSbI64WJASw6svmIlpT4NaYUnqM
         qEE4DkK0bbZl+QCd3lU1aIIfQ/sAmimfYx057BmRjhYkS2w5drmwbV4WRp6+mNqs6WFS
         ig+w==
X-Forwarded-Encrypted: i=1; AKwUvBxYqRO0WvyrRE+k5eqSnfxCIEgCFKMQm46UY8MKx8ow18DTi/qTozuxxLBcvtgX91xrbL6qWoA=@lists.infradead.org
X-Gm-Message-State: AFq9FYK1xkAwUx4yunc4SrTVJrcxEsORZmHqsIfD2t5un1LFxDNdWG1H
	HgmRWMVxM6nCdS2jHvVK3QINBXDFjuEudYmobYmlYU/fJ5zRcnIYfTbFIKSnLq2pOg==
X-Gm-Gg: AYBFou1jrQr40B1hqoVu+lky3W0U2C+bAxNZAtMYuAycC2tvP4d1JkWHqHjjiMO0DnN
	qYEI+smkDkh+DnuQ9tv+CepO7R2vexNH7gTHtuRUJnc17ckOURfBe4LvvUqxDddxKP9ZQhte41y
	tdAFJ9ECahmJ2OtNV6O5ySh0DXr1UV7or4KDN6Z5cp9qfmdW7T3ffQndXciJ68QCQ/xKw08K/E0
	PXEL0JpTj9aoR7RiOESWI8ZL/0xzJAP+1gRwyZStBuG8ZHnftBp88wSnbUVz0yKViJdjxHhqL4J
	PH+q/z2mSA2xTeyuY3LHt7imAQcDAYZMa5VsCN0mEqegCDJtHxoIShJDC6rmEJdcneg37Tq5/pO
	F2ZVmEPhjA1pzQ5VFRaoGVSWC0zwpBnQ8B/M+aT8V3pjfDDmG6eTG1lj1ahJalYYEOMNpgOqrvz
	1tqWRjXI3wvTJsFISkzs2HhUcF8bNimBdKQcLxDqJyRRhzYNAzQNgQfdkEMi6k68bV5Hj08cQCo
	bJ2BXugYmo5U7uQY+XIRlvgis1PxA9oEYQsLqf2hRQJsUtas0wLSLapfezTUMOrjntbPLjDl3VJ
	ihizPtXZ9h7/ZCBAHVPKZfirdlEu9ffUaziqC+Pm0zTEKsmxhF/FGB1zO2qV1zeWog7yuWAhqLU
	YQTaJUeZNSW8POpfnZ2drrKohQjqEeVX68q/cYTe3Og5RTyuN4yTy+ABs9g0DAmy8HOxDgaZHgd
	tPji8jbtCo
X-Received: by 2002:a17:906:ba89:b0:c31:6a37:f284 with SMTP id a640c23a62f3a-c419a05c3d2mr331429866b.1.1792345749860;
        Sun, 18 Oct 2026 10:49:09 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:09 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Sun, 18 Oct 2026 19:48:56 +0200
Message-ID: <20261018174904.1757161-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104911_841594_CD15E977 
X-CRM114-Status: UNSURE (   9.17  )
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

ath11k_dp_tx_free_txbuf(), reached for the HTT REINJ and INSPECT
statuses, frees the frame with dev_kfree_skb_any(), unlike every other
tx completion path in dp_tx.c. This leaks the tx status clone and idr
entry mac80211 keeps for a frame whose socket asked for status, as
commit 29d15589f084 ("wifi: ath11k: Cleanup mac80211 references on
failure during tx_complete") fixed on three sibling paths. With
NL80211_EXT_FEATURE_AQL, set by the next patch, it also keeps the
frame's airtime charge, and an access category at its limit is never
scheduled again.

Free the frame with ieee80211_free_txskb(). Neither status occurred on
the hardware below; the change is by inspection.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 083aca8ff355b..f7d3cf0ff0358 100644
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


