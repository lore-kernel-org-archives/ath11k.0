Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BE9C5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VZl1PgTMrv9AbBgLJ1P6kkw01P+MG1RQDwfvaSet2M=; b=H5PxDtjn2c5wDmyCGgJZ/pwcLQ
	6qLbkuPXozF+yx4XKlQ55pgAKI6Dfs43E+qEfHQekAWCflk1K39fZmw+fhBron0WiNdww5fjw/WH0
	++c3Ixto7/nKJUeM8j9hrghMZqB2XAnvUip176U8WvffzL/1ELzDFLFBxSEQQTLMEh/QkJ/SM6zRt
	Cz1nlFOxDynGQW+8YgelUWsSqIIAJ1K5yeWG66U5BlsDB28XW18XHx5kKOqfi55Qgk79t+4uwhg/2
	ocMetLFpQDdb7u4s+a3LheM4Nufvcpvlvq4q73E4ltY5KpMMBgi2rvYLsdjIYQ+VWMVfeCPuyjoPU
	KikU5dlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbL-0000000GlwV-45s4;
	Mon, 24 Aug 2026 14:24:39 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbD-0000000Gls0-1iI7
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1f758014b8so381742766b.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581469; x=1788186269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VZl1PgTMrv9AbBgLJ1P6kkw01P+MG1RQDwfvaSet2M=;
        b=Dd3FDa2mB9yh2uFxo2XSPYD+6+JQoP61Axpd2yWb4oVl5PUNMa1Tj7BFrZFnWU/L/K
         a7WZSUloXIY24uvU2ASVQ7noYMv3/vTDWRG26ogrj2k/69vpPsuPWO1m96tYaFHxg3eM
         Lx3Pzp1rI6ZMauaUOxLRngbQx1NMFvYwyQj1xeiuszPw36OD3mwPBPPW2cfa02EYHiLA
         P5RUony9raiFxOxfocNCKiko4myKCU3TyWyM9c5wCoGcw4RsGL4aTEE0spFIApaNDuUl
         oRX4UH3qCujDeI9WWWwWKg3ce2C/cSQVheTJZlaDtCHHn9evF/vaSgq3D7vc9hBX286k
         25PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581469; x=1788186269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VZl1PgTMrv9AbBgLJ1P6kkw01P+MG1RQDwfvaSet2M=;
        b=J3aD4bxnmLqadHzzkh7M0Rc7Ag9SGptjZ2i2uzfI7ikEfuL7YOqw1wpUhCWzzgPVSO
         1dyRHIBSrTtuSLNPkPVXjqRA8wfGUJT8yA3lDvB9glZSCX+WeiYQpwRMkKL+WlucGqIN
         c17Ec4iNpJMKxjOnUgd1hBCVRmIjUEAdsQ+fJu2lpE4spwFax9aOkuQiTK2tyPu/JW9y
         B5OvnRJEjjJkHfcy4OU3tCtJrxUkZ1E0kPJ1KquDDteOPzkwvYt8ISMIHq5nckSKa9+9
         TLFl1izA5a/gsM+HnkIDpyhuwxelhd5uPiiv6e++Jvj7L8QMxhtuPgXPjYvHnPbXK28z
         DCVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2e9UY0x9hFSivIiNGrimr8MOhD0yYsTn1cXKNhQ31MeWpKMj6ioTf8b7Mc6o2iY7M1VWoMdE=@lists.infradead.org
X-Gm-Message-State: AFuF++kveyw0B8qT8746/JvkDXiHuKKasEZUkzweSxwJUocApRE7CAKc
	l7pHMsnMwug5sv4LGQuptnt2q+RX6fOaAL2/wBHs/pWOSiK3xBrAT2xXS/qU3ag4KQ==
X-Gm-Gg: AR+sD13usRFkE+8vl68c8M6SJ8plAaWmnLvn4Tp8+RypIKPy5j2tMCIgT4lfUu7mxA8
	HTn4PGYHetQpLd265hs2m5L/mlsdWWNHKxo+hoA461RwmlHjE37HxmmCRRYQpul0bVsJImUGuJu
	hLfGgm7hzB6/Guz8cp7GwEFAKdfg+oLSdsjJ66cZT0wbxqx9grgnznDSP8f2qf4euQN/xDl3vf5
	4OtL2XjuupV9rHBDqk3QfI/JjwmvEWIs0HzlHoREGNvZG6Vu1Us2O4GAb0wW5xnLvKFlkTOotfv
	NZcOJPtymdTLm9CMjFSESRFx+89DHMQ1RRxlcgj2Z/Xm58SPbeYB0rkNH/MvaZxPsxcyd/beMZv
	VTBwPN5MZHAG1hGhU3meVXkWgGvyBy0S3NbLOutcH0aRpC/0pVnDx8KnBuYcSfRGGahZMvLRkxm
	bv8hSlE3LQUfTsNR0DeIGfB7NfP+FoIOGzJl+bKb7PJJ/ai9YuuctXSomW7GmQLK1/S1CUKNKGb
	Ve9GCNKQA3GenlDT/cDbZZdf4gB5+kHl++IlToZ8ACHA+I0Rc3MzCgS5jKXJAhDdrfFWnKFSGpr
	T59jf4t0YUn+QFCXTzHFD8N1y3h2gXCDITH0lOMlsw69Q4mjeMpL3KTA4Nfm5PS8bYVkylchZh3
	eNwA/IxpJZNFdKqQifmHpnwvpp8lcujKrfWy6mxxAGgyjkpur7WMmFMsdRn2/7luq8gE1OnSM
X-Received: by 2002:a17:907:9629:b0:c24:d6f0:f4a with SMTP id a640c23a62f3a-c24d6f1021amr378846266b.10.1787581468455;
        Mon, 24 Aug 2026 07:24:28 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:28 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Mon, 24 Aug 2026 16:23:42 +0200
Message-ID: <20260824142350.1757379-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_935823_77DE7767 
X-CRM114-Status: GOOD (  11.42  )
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

The leak also breaks AQL on a driver that advertises
NL80211_EXT_FEATURE_AQL, which the next patch makes ath11k do.
ieee80211_free_txskb() returns the pending
airtime the frame was charged, through ieee80211_report_used_skb(), and
dev_kfree_skb_any() does not, so airtime charged at dequeue is never
given back. local->aql_ac_pending_airtime[] rises without bound,
ieee80211_txq_schedule_airtime_check() stops starting a scheduling round
for that access category, and no station on the radio is served in it
again. Without that feature bit mac80211 charges no airtime, so a tree
carrying this fix alone sees the leak and not the stall.

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


