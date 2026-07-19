Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA5EC4451B
	for <ath11k@archiver.kernel.org>; Sun, 19 Jul 2026 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d76k8owGu9adTwGj/IM8Q9U7V5diOFFO3Oby67bvuxI=; b=sUoB8FVKxgRvrIGnAK7fbvQ1gs
	W7mkKS0KiD0zz3q/Hb2P4hsrmaJeY1j5+H4ixfhs4Ors0f02Tyk74fewoakaOc5TJnoupRK8flUXz
	RgDeupl2CAOBvlibBd+y/Wi9KgbXa6RE1wZSB9hzyAD/oeUOEWGGqwP+WsTWpmT7//4nfLzCcO2UM
	BrYi2PbZrhcp/S8BXml2lIotOwKylSuPM1nLOlY4PZDVVhTeM/V0l3dZnjW1ycq0mAjQf2Cm5m5Lj
	eh2NuXG4zDFIJ7DSJJ1IDzl9v0zSOntmti/hdqmQiVMTEnlHaH4EPwnDvF95gH5EP+M39MrqWPvla
	edFgCPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWp-00000005PCF-0tCh;
	Sun, 19 Jul 2026 21:58:31 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWm-00000005PBF-0AdZ
	for ath11k@lists.infradead.org;
	Sun, 19 Jul 2026 21:58:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c15c42a45adso494023466b.0
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 14:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498306; x=1785103106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d76k8owGu9adTwGj/IM8Q9U7V5diOFFO3Oby67bvuxI=;
        b=rTucdNsMlxzkwRBig5WKsOyujK5dNSdVtP+rBAfaLC5z6jhmHAPvAyHpNd2fcJpvrb
         ODUO4TZv7XVijAD0+IC6AygBS3vWdzfVdLvEGylX6kXoxuJoUycGqrz4DSDblD4HQY+U
         a33PdSPRmtKawm+nUZF2NZ7+PImSm+cvSBPW74m1xc6HTphTkNkmSeWfkzkvlte4RR/l
         UL5MuF0VQFeR4LAcgMNNL7o2acSvlGFyVcgtXKT359G/T9DMVvWz1GbRRF71N9hR0lin
         VbbdJ23/YZkSFAbdLMdlC4q0xuIAYYFxQcDHeow68oETxMOnb3Pe1G9HcIR8guH5twyz
         r8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498306; x=1785103106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d76k8owGu9adTwGj/IM8Q9U7V5diOFFO3Oby67bvuxI=;
        b=ieLuXBh3XoN37riaR/3labmp31t2s4+0P/x9Jlw5CaCsQ8vY73ZtGZCAKoRlpYSfdV
         plEVyJFuYd/3pVWgwGemSzARKUoTl+X1umVwtQ1/V3NGfkTSZhUImmndJx4GU121UKAB
         RiLOB2e1ddKXKMP/7DJ3sRou3aqSYMrfHF2N+Vd5i3XQHrSAfld+JQDr3y5A6POLddyT
         XVloWAm148g4pVUNpqWKzOXX8glgAEuP6jcMiQLHmG5IL880tKYK6e8jzL58useTRW9y
         boUG626PYX5CZc8NgQKtQ88kiPwtuqtN03GPZR8ezzGi/ElbFKOOdMtbHSBCMbTYrzSp
         NMjw==
X-Forwarded-Encrypted: i=1; AHgh+RrdEfH3dFsacTrPgXkyKXuzxwO32i5r/AbpSBz13gHcA5y51PS+k6KFKyovBIYe1+SYlxIXj4I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZuIQZCZy1zOGjK6PoSj2Ugphutv9PZtClj1jFM/Ki5e5rAU6E
	THxghW/VBXSJypW4g22MEqj6ukVfjqUIVGX+xlmrDxHlqEKs1ks6mrmQMPbTfzC+
X-Gm-Gg: AfdE7cn6jMJWxRjqicd2Yw9V0ls61IFenfrHz9ILNcaATkIfacgEOj8X1hVT8GHfjh8
	a3jTGyYQOl++PE50X6I/u7MQjgwVuVdDUmS6dDYbQsvzfNtHphmQkkA5hTw7+4K/v8N4PRB6mDa
	NfkFqrkL6vpXkevulgGkfRDCW1eWjeL1X+3PshNzkRHHOBGEBx2Iy7Ah4G+uNdZD9bAWPMtDjbR
	fNwimCySHZ6asuVajpL3GsD+Dwpfl/mD5TBsLgxKD3yfBT8XotxUhrWVrCLmI+/WhzOcM0YVnc8
	VQ0gxYQDx0Rdqio/7MZP3HTIfDUYgcmvbjUMEoPw0ESvhSD0KNa4TATSUmL2rLYJxVbx+Rf+F9I
	86U711eU0Ffs877PiRb0QtnJLIhLxM9iNJfCrerbZ/+vnztTZ6h7Dl8nwrJ/qZQtAEUmfrq4kMD
	5rk8fzMPFvsY8+Lg==
X-Received: by 2002:a17:907:3d11:b0:c12:c5d2:bf37 with SMTP id a640c23a62f3a-c1692104a7cmr618368166b.12.1784498305865;
        Sun, 19 Jul 2026 14:58:25 -0700 (PDT)
Received: from nv-msd-x1c.mtdk.labs.mlnx ([212.60.125.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm379116766b.0.2026.07.19.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:58:25 -0700 (PDT)
From: Mark Ruvald Pedersen <wabsie@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Subject: [RFC PATCH 1/3] wifi: ath11k: reserve headroom when aligning RX buffers
Date: Sun, 19 Jul 2026 23:58:15 +0200
Message-ID: <20260719215817.2468580-2-wabsie@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260719215817.2468580-1-wabsie@gmail.com>
References: <20260719215817.2468580-1-wabsie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145828_081601_88517F31 
X-CRM114-Status: UNSURE (   7.86  )
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

RXDMA buffers are allocated with extra space for 128-byte alignment, but
the driver tries to move skb->data with skb_pull(). The skb is empty at
that point, so skb_pull() rejects every positive delta and leaves the
data pointer unchanged.

Use skb_reserve() while the skb is empty. The existing extra allocation
space leaves at least DP_RX_BUFFER_SIZE bytes of DMA tailroom after the
reservation.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Mark Ruvald Pedersen <wabsie@gmail.com>
---
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c..e4ea0c216 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -378,7 +378,7 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 
 		if (!IS_ALIGNED((unsigned long)skb->data,
 				DP_RX_BUFFER_ALIGN_SIZE)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
-				 skb->data);
+			skb_reserve(skb,
+				    PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+				    skb->data);
 		}
@@ -2875,7 +2875,7 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 
 	if (!IS_ALIGNED((unsigned long)skb->data,
 			DP_RX_BUFFER_ALIGN_SIZE)) {
-		skb_pull(skb, PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+		skb_reserve(skb, PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
 			 skb->data);
 	}
 

