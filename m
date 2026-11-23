Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0665606C15F
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ijE8lBMw;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vZJBxkS2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=; b=ijE8lBMwQC9Ybe
	98p7JC7rlvfPFsvC9wCS63njviP5MiUrCWTL2S7O6wjqPWHbpkApJloRkTiFASxFpGeS8MIcuezVn
	1j0xufe7YmIc6TULJW3+pSthrhUhE3p0ITce3rdDKHF7v6Ull3j+kJFZN7MRh3+IvHhh8t8l/W+Tu
	dfXaJSQA4wkhH8dBjEuBXlZtvJTpplK2rbVADIO7v+HcWJpVgHVY7Gk/Njm6Lgc6nycl24qGLLtsG
	UmfNF3it1M49XDH0MGW6K5R3unaE+cZBiImyMO8xzObDiZtZoGv7kcIZwuNvaI6mFNH8HOG8oXoiQ
	BTxiy1q3h33R1lmMgMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIr-00000003c7D-2G5S;
	Mon, 23 Nov 2026 13:41:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIn-00000003bxu-3JQz
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso4239546a12.3
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441308; x=1796046108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=;
        b=vZJBxkS2OR1Fc4cCW5RqkPmWBvGK6lEvyTEVFqi4vaRepKOTGv560nLkhbgK/bIKnU
         6vaoyabcL1/fmNFChhIXSMzSKuGhuZTTXjtc1w/0PCLEgbxHRZs1Siu6fdItKinQiTLm
         p5xofiK1Nu8oENuIcMLmoiqnRGhByCSk4lia49pIri6++4LPgjSKECL6KlcmRf8nxXho
         0aNSYRFIU39v+jgTrsE8h0AUCk9VMM9A2976glDeu9MoLusksjLUwzayHGmABC7uKXwV
         hURPgufJG+clvJxw8O7efCycJkJxW+ZK0D1VcLH90JPuo5GJR4O6BOsynPHLxzuP4T0w
         jzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441308; x=1796046108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEwCxqYSa78a+8RvsiiGGU+aVSJtIui2RNJ0j0sohk8=;
        b=PI06aV+qFoHrz3TmzWCeoJbHPIQ/2TzN7HpCFbPBPn816LwlOOnrEH6Yv5VupVp5cp
         MvJjDQKUkrfHOYY3mELCj07rFI7gI6biWrsrUYQmUJSxUOc1OnODxUH36dkjBdeR9+4/
         xFCgzJpZDyAbw+Lmi2uUw7xO2hHohbgxgq0WQBkCpBjQ0Q96rI0DN+wwT8lkLpgEY9Cy
         8DKQG5K/cBzh+MF5AcIT5jSiUc/HTsJzvfpNqu0+CNJoykIghfA6O4il9s0qf+/LL5R2
         qWylOPcWuBW2CLsfPBJuWOCRbPTk5AilIY0CGQyZrh5CR6eUIm5PMWZU4iNME96a+Bav
         YQsg==
X-Gm-Message-State: APuU4Z+R95znTAUtUSnfK2CmzDSumDAHThzU2e2puzWy8JqUA17W+yWL
	J1D8aAz6xis0p75/fjNDSDIHiu54JYqnMJbLMQwp+7AcPwLClKJp9CTAaP/vbL5hQA==
X-Gm-Gg: AZFdTZcF1VFK7pwaosV9eF+Ba97CFUetI7/VGwhG9MAfBaE68s9h9R6cj/amdCLc18C
	weQqVSaH/WCkEZEgDkbIn16PgzE462lLv+xdGXMowChq9ZsSZxJcojKZUmFRdjQndtz9LBfP5zy
	L8N4gLioynOTl+gIVWrPldj5fgE9Nr3fDL0d88ePuzij9H8o/lGjCEB4tFYOEFNFncbuerxNGtI
	6G2I7+raczoQUtu9hRIkqKvQtsQuB0G5jJwrmtSbY006Q6eYJOOwWNoXST96qP7KMteeYmMgWK0
	tbVdZXT7DNT4DSX6cwFKPTbO4sUjYg0J9EP4eMeC2HZZ7Gru1sutwNn7f8Pw/MX7rc0d21RNk4l
	JVp06qJ+htVHrJI5iPfbtcWmnStDYat4+CAL53g+e3L5RWRxKC/d9fdbWUntBmW7JpIEsYACU5n
	v1dkDrZzgjXhMstaW4V24esiZ7LsW4QMh+1yFFVBCFfpxjWCpmPKJ3CYgub0o7sUrQSUFGF5/oI
	3wCaJHtx9YoRZ+V2cLeC1rZlsYyZgj28KEU4Od77cdXX+AV6zwWGhLbbTjYyugiMZ3b5Nin7NYn
	5E6SVOCF+VMZw45wdBAeUyX/l42ARFOVokyJF2pMao7w/UFa7Scj0mT2gPfk3g7NHFtfdY9mX6L
	Mv6eGe/asdVWFLFAwLGRxI4tXQ56rW3Rv2wb9SAtKR9LQc3QKMr/xafOtnp+ksrrJiLrhHwSpKm
	FrqVsamPXimp2zsfzah5s5ZiB0fdKN2exP6fyKyWy/S2G8VnTTJ3EwMkpM8nFR/HgoJoci79mGP
	TEZWpCu0heBji8zymcSbabN8RaHrMhvItwSypBuv9ICyZUJelG163Z1wqM9JyiF50riqdTXaC2H
	g7xcjuQ4FED2ewaH4vPv7u9Om7zAJaFwefsWvQHYzKerHJ9daNHak7xU+/qpIArKNpjcSUcUKw=
	=
X-Received: by 2002:a05:6402:5411:b0:6ba:1f74:ba6b with SMTP id 4fb4d7f45d1cf-6ba37eed98fmr8090525a12.36.1795441308127;
        Mon, 23 Nov 2026 05:41:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:47 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 10/10] wifi: ath11k: give the refill buffers their ids a chunk at a time
Date: Mon, 23 Nov 2026 14:41:37 +0100
Message-ID: <20261123134137.718575-11-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054149_883042_EAC61DBC 
X-CRM114-Status: GOOD (  18.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The refill takes the buffer table lock of the refill ring once per
buffer, and the cache line of the lock moves between the CPUs of the REO
rings, whose reaps take it for every frame: in a profile of bridged
uplink at 850 Mbit/s (IPQ8074, one run) the compare-and-swap of that
spin_lock() in ath11k_dp_rxbufs_replenish() takes 0.84 % of all samples.

Allocate the buffers of a chunk of up to 16 first, outside the lock, and
give them their ids under one hold of it. A buffer that gets no id or no
ring entry goes back and ends the refill with what is on the ring, as an
allocation failure does. The reaps still hold the lock for one table
entry at a time, so they wait at most for 16 id operations.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 142 +++++++++++++++---------
 1 file changed, 92 insertions(+), 50 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 313a39f15781..a85edaf19bfb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -497,12 +497,65 @@ static struct sk_buff *ath11k_dp_rx_pp_alloc_skb(struct dp_rxdma_ring *rx_ring)
 	return skb;
 }
 
+/*
+ * The refill takes buffer ids for this many buffers under one hold of the
+ * buffer table lock, which the reaps of every REO ring take too.
+ */
+#define ATH11K_DP_RX_REFILL_CHUNK	16
+
+/* A buffer for the refill of @rx_ring and the address the device writes it at */
+static struct sk_buff *ath11k_dp_rx_refill_alloc(struct ath11k_base *ab,
+						 struct dp_rxdma_ring *rx_ring,
+						 dma_addr_t *paddr)
+{
+	struct sk_buff *skb;
+
+	if (rx_ring->page_pool) {
+		skb = ath11k_dp_rx_pp_alloc_skb(rx_ring);
+		if (skb)
+			*paddr = ath11k_dp_rx_pp_dma_addr(skb);
+		return skb;
+	}
+
+	skb = dev_alloc_skb(DP_RX_BUFFER_SIZE + DP_RX_BUFFER_ALIGN_SIZE);
+	if (!skb)
+		return NULL;
+
+	if (!IS_ALIGNED((unsigned long)skb->data, DP_RX_BUFFER_ALIGN_SIZE))
+		skb_pull(skb, PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+			      skb->data);
+
+	*paddr = dma_map_single(ab->dev, skb->data,
+				skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
+	if (dma_mapping_error(ab->dev, *paddr)) {
+		dev_kfree_skb_any(skb);
+		return NULL;
+	}
+
+	return skb;
+}
+
+/* Frees a buffer ath11k_dp_rx_refill_alloc() gave that is not on the ring */
+static void ath11k_dp_rx_refill_free(struct ath11k_base *ab,
+				     struct dp_rxdma_ring *rx_ring,
+				     struct sk_buff *skb, dma_addr_t paddr)
+{
+	if (!rx_ring->page_pool)
+		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
+				 DMA_FROM_DEVICE);
+	dev_kfree_skb_any(skb);
+}
+
 /* Returns number of Rx buffers replenished */
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
 			       int req_entries,
 			       enum hal_rx_buf_return_buf_manager mgr)
 {
+	struct sk_buff *skbs[ATH11K_DP_RX_REFILL_CHUNK];
+	dma_addr_t paddrs[ATH11K_DP_RX_REFILL_CHUNK];
+	int ids[ATH11K_DP_RX_REFILL_CHUNK];
+	int n, got, ided, i, j;
 	struct hal_srng *srng;
 	u32 *desc;
 	struct sk_buff *skb;
@@ -528,70 +581,59 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	num_remain = req_entries;
 
 	while (num_remain > 0) {
-		if (rx_ring->page_pool) {
-			skb = ath11k_dp_rx_pp_alloc_skb(rx_ring);
-			if (!skb)
-				break;
-
-			paddr = ath11k_dp_rx_pp_dma_addr(skb);
-		} else {
-			skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-					    DP_RX_BUFFER_ALIGN_SIZE);
+		n = min(num_remain, ATH11K_DP_RX_REFILL_CHUNK);
+		for (got = 0; got < n; got++) {
+			skb = ath11k_dp_rx_refill_alloc(ab, rx_ring, &paddr);
 			if (!skb)
 				break;
-
-			if (!IS_ALIGNED((unsigned long)skb->data,
-					DP_RX_BUFFER_ALIGN_SIZE)) {
-				skb_pull(skb,
-					 PTR_ALIGN(skb->data,
-						   DP_RX_BUFFER_ALIGN_SIZE) -
-					 skb->data);
-			}
-
-			paddr = dma_map_single(ab->dev, skb->data,
-					       skb->len + skb_tailroom(skb),
-					       DMA_FROM_DEVICE);
-			if (dma_mapping_error(ab->dev, paddr))
-				goto fail_free_skb;
+			skbs[got] = skb;
+			paddrs[got] = paddr;
 		}
 
 		/* bottom halves are off with the ring lock */
 		spin_lock(&rx_ring->bufs_lock);
-		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+		for (ided = 0; ided < got; ided++) {
+			buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skbs[ided]);
+			if (buf_id <= 0)
+				break;
+			ids[ided] = buf_id;
+		}
 		spin_unlock(&rx_ring->bufs_lock);
-		if (buf_id <= 0)
-			goto fail_dma_unmap;
-
-		desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
-		if (!desc)
-			goto fail_idr_remove;
-
-		ATH11K_SKB_RXCB(skb)->paddr = paddr;
 
-		cookie = FIELD_PREP(DP_RXDMA_BUF_COOKIE_PDEV_ID, mac_id) |
-			 FIELD_PREP(DP_RXDMA_BUF_COOKIE_BUF_ID, buf_id);
+		for (i = 0; i < ided; i++) {
+			desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
+			if (!desc)
+				break;
 
-		num_remain--;
+			ATH11K_SKB_RXCB(skbs[i])->paddr = paddrs[i];
 
-		ath11k_hal_rx_buf_addr_info_set(desc, paddr, cookie, mgr);
-	}
+			cookie = FIELD_PREP(DP_RXDMA_BUF_COOKIE_PDEV_ID, mac_id) |
+				 FIELD_PREP(DP_RXDMA_BUF_COOKIE_BUF_ID, ids[i]);
 
-	ath11k_hal_srng_access_end(ab, srng);
+			num_remain--;
 
-	spin_unlock_bh(&srng->lock);
+			ath11k_hal_rx_buf_addr_info_set(desc, paddrs[i], cookie,
+							mgr);
+		}
 
-	return req_entries - num_remain;
+		/*
+		 * A buffer that got no id or no ring entry goes back, and the
+		 * refill ends with what is on the ring.
+		 */
+		if (i < got) {
+			spin_lock(&rx_ring->bufs_lock);
+			for (j = i; j < ided; j++)
+				ath11k_dp_rx_buf_put_id(rx_ring, ids[j]);
+			spin_unlock(&rx_ring->bufs_lock);
+			for (j = i; j < got; j++)
+				ath11k_dp_rx_refill_free(ab, rx_ring, skbs[j],
+							 paddrs[j]);
+			break;
+		}
 
-fail_idr_remove:
-	spin_lock(&rx_ring->bufs_lock);
-	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-	spin_unlock(&rx_ring->bufs_lock);
-fail_dma_unmap:
-	if (!rx_ring->page_pool)
-		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
-fail_free_skb:
-	dev_kfree_skb_any(skb);
+		if (got < n)
+			break;
+	}
 
 	ath11k_hal_srng_access_end(ab, srng);
 
-- 
2.53.0


