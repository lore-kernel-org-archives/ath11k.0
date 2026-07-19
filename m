Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEFCC4451B
	for <ath11k@archiver.kernel.org>; Sun, 19 Jul 2026 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrnWAngYS6JLzxtxY9C76JD3u8HKuRum017zjKAx33U=; b=DFFECGNG54SjyWujYyQQzQ06w5
	A++5+X1QqNyhRyizD3ZDIm4WTHJy4hubqhJt2LqFg0ITUvOOY2ZEzrcyWmQ863FEnORFkIojTsUbK
	CPHkVqNyNV2j5dwcvirD8oQa9AurpxsJsaAPFh3B/6jitYG6G8qiCOKc28amNODDy6HQn4eoR9k/K
	EChau6XmjQPWEwinzNElCz6NhFiXC8VbuOQgTAH3Uuq9rA8n6VFIjzv7UAYPnRv0D9jyCNaGUxrQA
	s1dtbxBM7qBpRJn+zc4/iIUKeWud5mPd5t4+hFOUb6ZXDwUyUpf7fb/T26hv/15GiqPgtzAePnxGi
	eFT1d3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWt-00000005PEa-1Qqw;
	Sun, 19 Jul 2026 21:58:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWq-00000005PCj-3G2L
	for ath11k@lists.infradead.org;
	Sun, 19 Jul 2026 21:58:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c12614b81c9so1705450766b.3
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 14:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498311; x=1785103111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrnWAngYS6JLzxtxY9C76JD3u8HKuRum017zjKAx33U=;
        b=gxMFzVOCsOFr5Wv7V4ewiV+YYGB+vNkAsdDAHpDBerCJXXKhTq1FCNWl6E+yY2pvRO
         GNsJuLDm+y6VP9WDec03tX2zt7W7BJs0afQ7LlbOd9bQclvHqOQVOH2P6NUarIJOVtoP
         OCKAz8ZYRiU04UnQeQ8L25SZckxKHhTSLVDf3AAS3kejvqk8IBBlraayecIn1FnrtEKr
         ghhjeI8VXO/0wOlMQIMs/po1cw+3IJlas5FU1fzohkPys26d6zUldRUd2xWWt4rMv8Gr
         /KW+6SMRYY170WByG0iWUNQAPLO7Wj1Y7jhspGSIE6YADXLQF5xwLdo01hJscUY4CvUj
         hgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498311; x=1785103111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrnWAngYS6JLzxtxY9C76JD3u8HKuRum017zjKAx33U=;
        b=jdPAKkC8Gb1sV8sjV1jyx0H882qVk+68Ducba+730H4aDGbGDzOAxbY4g7pt4w/XbV
         xkR/36tVwWoUWIAIb9QARQL8rTdR6lYZ5i694j7rhbGOxYTEV7JpyhGf6M/6amtY9GVi
         N8/JbcFULAqdLNbp/0Xuek1mLIIRClCKb7+xf5cx8OEt8K95vgcjKF93aJ54Bjbkf0bL
         xv/wHUus90A/48sSlt3T67eM95O4ivBRzg7/fAPt5idupP991XDEqhdNqbTWmDxzJiZ0
         EOzmtk5mrWVqqfhTTY6mEGC/uTh6PmMPp9SPkjK3/Kt38IdXmedvRYB4TYg9YdiVSUrW
         /QQg==
X-Forwarded-Encrypted: i=1; AHgh+Rok17/+KwGJCiMZMGQam/GQ5FIEW4YQvku59A0XL1vatlDb05g1hGsPWptBaM4hov6aJLNk2MU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp+lZFU75uwG+44fgEOKFcMXzdi58Y7sfSqveVr5O2s4+I9cSy
	TNr1UmuWdpzV/ImsGNyhjC7SIYB0SLWnEWuqhudS3b121FM5B6ThJlm2
X-Gm-Gg: AfdE7cnA35C6nfZYaeLxonJ9NVQLD6Qv1g3SewPksAwp5LcC0ZbY8csCx8AQoQtITRy
	LES6cpm+04EmprZzHyMgTqd7s5p+dWUhdB9ytTAGR1JXe9gEr0nHujVFiRs8sLO2z30DTW3tjQZ
	/Q9kQEbv+56JY0eOea44O+l1ZHhFZBdppINliwjGVhJ2blPeDvC7cUFvrJW6n/fbf6Um7drejv8
	PWBBw16J3vckU9CWPhxj6nBr+8u8J95y1v/MkLjBrR97Q8MozmimD1jeqsgtaCS0wuAzzxzY4f3
	UPYjd3gqPthRjMqofoIMH9g4ioC1sQj9GnJ2BH1oATiTb3zDeuLXUsF+DoYrcoUccFv2qxGA1nZ
	EgOoYyBVNfgU1UQEtSJvKCUSR1Raj+up9vwGwJ6jBBAw5GSsPMmDnaY+3SpFZgrRsTsH6Oztgr6
	SZDgwi7wQVjumCCw==
X-Received: by 2002:a17:907:709:b0:c16:5a9b:5966 with SMTP id a640c23a62f3a-c16b47c50damr506688866b.33.1784498310938;
        Sun, 19 Jul 2026 14:58:30 -0700 (PDT)
Received: from nv-msd-x1c.mtdk.labs.mlnx ([212.60.125.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm379116766b.0.2026.07.19.14.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:58:29 -0700 (PDT)
From: Mark Ruvald Pedersen <wabsie@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Subject: [RFC PATCH 3/3] wifi: ath11k: use private page-frag caches for RXDMA rings
Date: Sun, 19 Jul 2026 23:58:17 +0200
Message-ID: <20260719215817.2468580-4-wabsie@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260719215817.2468580-1-wabsie@gmail.com>
References: <20260719215817.2468580-1-wabsie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145832_847549_0FDE864E 
X-CRM114-Status: GOOD (  15.04  )
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

ath11k allocates RXDMA skb heads with dev_alloc_skb(), which draws from
shared per-CPU page-frag caches. RX buffers from different rings and
unrelated networking allocations can therefore share a high-order
backing page despite having different ownership lifetimes.

On IPQ8074, RX ownership tracing found bounded ring and IDR occupancy
while page-frag backing grew. Two captures found current or historical
cross-origin fragments on 86-87% of the final tracker-visible physical
pages.

Give each RXDMA ring its own page_frag_cache and use it for regular and
monitor-status buffers. New fragments from distinct rings can no longer
share backing pages with one another or with unrelated users. The
monitor-destination path that intentionally uses the data refill ring
also uses that ring's cache.

Commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset
path") moved HIF IRQ shutdown from the common crash-reconfiguration path
into the reset worker. The non-reset QMI recovery path can consequently
reach DP teardown while NAPI can still refill an RXDMA ring.

Quiesce HIF IRQ/NAPI processing on that non-reset path before teardown.
The reset worker already does so before power cycling, therefore keep the
existing reset path unchanged. This makes the cache change self-contained
without relying on repeated IRQ lifecycle transitions.

The refill paths serialize each cache with the corresponding SRNG lock.
Drain the cache only after ring-owned skbs have been DMA-unmapped and
freed and the IDR has been destroyed. Keep the dev_alloc_skb() allocation
flags and headroom behavior; build_skb() propagates head-frag and
pfmemalloc metadata from the backing page.

This leaves buffer and ring sizes and all DMA map/unmap operations
unchanged. It isolates cross-owner lifetime mixing; it does not prevent
lifetime variation among buffers belonging to the same ring.

With the private caches, page-frag backing remained bounded in natural
load, resident, and high-packet-rate pressure runs on IPQ8074. The
non-reset recovery path has not been runtime-tested in isolation.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Mark Ruvald Pedersen <wabsie@gmail.com>
---
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8dacc878c006..e71a22ce332d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2330,6 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 {
 	int ret;
 
+	if (!ab->is_reset)
+		ath11k_hif_irq_disable(ab);
+
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
 	ath11k_dp_pdev_free(ab);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..e69dc23b2051 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -7,6 +7,8 @@
 #ifndef ATH11K_DP_H
 #define ATH11K_DP_H
 
+#include <linux/page_frag_cache.h>
+
 #include "hal_rx.h"
 
 #define MAX_RXDMA_PER_PDEV     2
@@ -72,6 +74,7 @@ struct dp_srng {
 
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
+	struct page_frag_cache frag_cache;
 	struct idr bufs_idr;
 	/* Protects bufs_idr */
 	spinlock_t idr_lock;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e4ea0c216740..6bbfa0ebddd0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5,9 +5,11 @@
  */
 
 #include <linux/fips.h>
+#include <linux/gfp.h>
 #include <linux/ieee80211.h>
 #include <linux/kernel.h>
 #include <linux/skbuff.h>
+#include <net/sock.h>
 #include "core.h"
 #include "debug.h"
 #include "debugfs_htt_stats.h"
@@ -340,6 +342,36 @@ static int ath11k_dp_purge_mon_ring(struct ath11k_base *ab)
 	return -ETIMEDOUT;
 }
 
+static struct sk_buff *
+ath11k_dp_rx_alloc_skb(struct dp_rxdma_ring *rx_ring, unsigned int len)
+{
+	struct page_frag_cache *cache = &rx_ring->frag_cache;
+	gfp_t gfp_mask = GFP_ATOMIC;
+	struct sk_buff *skb;
+	void *data;
+
+	len += NET_SKB_PAD;
+	len = SKB_HEAD_ALIGN(len);
+
+	if (sk_memalloc_socks())
+		gfp_mask |= __GFP_MEMALLOC;
+
+	/* Refill paths serialize the per-ring cache with the SRNG lock. */
+	data = page_frag_alloc(cache, len, gfp_mask);
+	if (!data)
+		return NULL;
+
+	skb = build_skb(data, len);
+	if (!skb) {
+		page_frag_free(data);
+		return NULL;
+	}
+
+	skb_reserve(skb, NET_SKB_PAD);
+
+	return skb;
+}
+
 /* Returns number of Rx buffers replenished */
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
@@ -371,8 +403,8 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	num_remain = req_entries;
 
 	while (num_remain > 0) {
-		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-				    DP_RX_BUFFER_ALIGN_SIZE);
+		skb = ath11k_dp_rx_alloc_skb(rx_ring, DP_RX_BUFFER_SIZE +
+					     DP_RX_BUFFER_ALIGN_SIZE);
 		if (!skb)
 			break;
 
@@ -453,6 +485,8 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 	idr_destroy(&rx_ring->bufs_idr);
 	spin_unlock_bh(&rx_ring->idr_lock);
 
+	page_frag_cache_drain(&rx_ring->frag_cache);
+
 	return 0;
 }
 
@@ -2867,8 +2901,8 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 	struct sk_buff *skb;
 	dma_addr_t paddr;
 
-	skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-			    DP_RX_BUFFER_ALIGN_SIZE);
+	skb = ath11k_dp_rx_alloc_skb(rx_ring, DP_RX_BUFFER_SIZE +
+				     DP_RX_BUFFER_ALIGN_SIZE);
 
 	if (!skb)
 		goto fail_alloc_skb;

