Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627960724F1
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bdPu4GNL;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KNqw7Dw4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=; b=bdPu4GNLPGjrhg
	tpkUO++RzAYqstdW+TwN2R4lnadw0uNMOPHcPgKGfe/FJkq6y4y0+nUUTf/k4yW75/funR3A2cZ1y
	tphL9n96gmYsUrSiflNkaK3ptwgB1C3z4gnxzVu4j5OcoDOrZy7SPSs8iQM8C22nEQikwUCbFf7iA
	84nsS7rW09bZKDXxAjzNkI/k6RQ7ADV86vfGqstTSxJSc/2xOErTroBth//4X1JtFjZCHjZcz6kGL
	Ma4JQZ42TluBJ86Vj25H7H5oVsuU3P6YjEG1SelfpXTDs/y0Rml6D2HGnBr+DOnhk45vPA5TL2PVh
	RDwJh7bkfbvX4Es5GaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIj-00000003bsm-1Ydu;
	Mon, 23 Nov 2026 13:41:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIg-00000003bq0-0ZIY
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:44 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so4208818a12.2
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441300; x=1796046100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=;
        b=KNqw7Dw4/msGO9Uh79S6C1zGKqqPZo+nfss7QbMW0I1RR2j+2n1CLWC4Hl4Y30U5w+
         m6eGJLhfXf1JeXo1wWh8ppaVCntz+r57tq3H4KZoeUUyZinHMG19YlZq98fo8dJh4AIv
         fg2DrAikM80XdURwhV3/eEmYasjlaM5bOjLvTGB4cPaT+zFuHmATXuFWVgDMG7UxEZiS
         KIJ7SCLqExqecnzXyMC9nlc5QsVb4MsMKr8dd41dg0Bnj1a7nCwU0k9EwaXQ8aflVGDM
         cLnvTLASy85CjH50dXRKKUgP+frKVNB2Zu0DBNKToBwniXfps51mWl3BAT8NDppJfgCZ
         QM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441300; x=1796046100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grepWVLzeUBtCj/pUc0eCATuCcMmtVEX4tnzLZWc9aU=;
        b=ISWpU64TLOu9IpCnLi/sb+DG2VjNRw/98ozuA1EQgPQNQ2GneQDyGVT8bYQOshXbBe
         6ou/KaW+H3fHxgcG6K8GiTlTpPEeT9qU+RqsE/Vox/st+xxH7ex06j1KBuJBdRtHNgMz
         +FZ9/iKigXo4T8BqN4RnycFuEKI3ON0WMaNV77uRGCKXqT7U/B6wcGKUKBty6BpqbGfg
         NEvUz9tvmLVgKaEu0FMu3sC5yE4jo1zmqVHg2D+WAi3yGe7HSTvlNrvHijmpeGNBdfVH
         eqBhHVh4dKI5XYtvse4qUE1PXkDGqtACAv5ZPGfWCMBB6agSSS5MDfPYtls3lsgEbp1d
         Ljow==
X-Gm-Message-State: APuU4Z+7gbZe23EcBRAZh3UTHZYuodowU1bbj2xSSfxFfSqyFJ6tXBxX
	jvjyA/LtyxwzdeCLkWQ1VIjzZhqV6obJNXpchLtak4sOmLw9RX6OC+OL45dC6F7YIw==
X-Gm-Gg: AZFdTZecl90v+y6j/SJ89NWc+XaeLZk7I6BwVInk1OAFD1ZbAA1srk2o3+0DuQvXnBE
	DdYc4OtpSXiyQjB+Unfb/w7HKp+XiL/A80EkoY5PTBoOkSN0RKx+z+XmaoszZtIIx07ztuYGs4R
	6NAEMobk2jLlHhk4OtXowP/IqBmRhrPZ1VhsBpQILRQ8QkL/15cJWq+gUk6dvIBk/ZnVga1sjrB
	5Qsp2IPcfau+gWD3N8Jh5DlxtRFV9748Zgg75Km3shHRrAldGSsq8AQVyjWPJ2K1CVZ1aUAORYJ
	4LtzngwodQTNlbVmkQ5UsSel/72X4JhFTY4GcXwYUDnPXMr2ZpiuTmZLc6B8FDyIXFCL02F+nMi
	8AXt6hSsQ7S2q3Jq+/VWbdftTx+C3oAwdCaXDnQZVlnELUFU5GdpD4TveS8WAXEotLSVFvCQpfa
	iu2dMMkcaluf6v8bdJuYM3Itpt05K+0dHy6lZGq2FfwJ+wIJjdLCXq3tlvbC3MUBZC0vrRCQ1Id
	EVL3KMUswOPYTku+j/8kEaKloI9ntwk9N8VwnMrki4YstjG3rNDQgKNFP71TtXGhedY4JYQlGxG
	BFO7JVkDvjueyfqsOZTSRU0ar9loY9fI3HHdjtEKbt/SEwGaxy+onWmUhkTYvr2b39h8bztPtgH
	hWODhjpQlAIO8ttwxxvLkMzzmNkJjqPNQ5jZReTXWDAI3Pnspbl8pCOcfH98DuBryGNBHXzEExN
	vwDv60ZKDF2r2MHzm+GnCRbBEjbpyRwTLaLYzkAqXvHZmdo9mSRqY8hxXAkBGxu5c/C3tj3rOWe
	ZmgVx4WCv1YvoTBx90w2zcOtyETRY///0SbvUN8/+GGRj9ku8hHdo7eWxx3z+YVL11dfokjQnW5
	0DUDAmiT7xVAyfghV4Z7NNwUApSYWJfCNPIx0jfWIhjgR8p+nTncWZ7uVGoISwjjhPcWu+h3026
	o3kEDDd0vJ9md46kHmc0=
X-Received: by 2002:aa7:d789:0:b0:6b7:6c8:70d5 with SMTP id 4fb4d7f45d1cf-6ba37c76e5bmr5780868a12.3.1795441300094;
        Mon, 23 Nov 2026 05:41:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:39 -0800 (PST)
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
Subject: [PATCH ath-next v1 02/10] wifi: ath11k: replace the RX buffer IDR with a table
Date: Mon, 23 Nov 2026 14:41:29 +0100
Message-ID: <20261123134137.718575-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054142_317936_492FA7A0 
X-CRM114-Status: GOOD (  19.46  )
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

Every RX buffer gets an id from its ring's IDR when it is posted and
gives it back when it is reaped, so each received frame costs an
idr_alloc() and an idr_remove(), each a radix tree walk with node
allocation and freeing under the ring lock.

The ids a ring hands out are bounded by its size, so keep them in a table
indexed by id, with a stack of the free ones. Posting a buffer pops an id
and reaping it pushes the id back, both in constant time under the same
lock, and a lookup is an array index.

The table holds twice the ring size: a ring never has more buffers posted
than entries, plus the defragmented frames reinjected into the refill
ring. Id 0 stays unused, because the refill path treats it as invalid.
An id outside the table, or one the table does not hold, finds no buffer,
as an id unknown to the IDR did.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    |   9 +-
 drivers/net/wireless/ath/ath11k/dp.h    |  10 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 214 ++++++++++++++++--------
 3 files changed, 155 insertions(+), 78 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..e29a49df2a42 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -897,16 +897,13 @@ void ath11k_dp_pdev_pre_alloc(struct ath11k_base *ab)
 		ar = ab->pdevs[i].ar;
 		dp = &ar->dp;
 		dp->mac_id = i;
-		idr_init(&dp->rx_refill_buf_ring.bufs_idr);
-		spin_lock_init(&dp->rx_refill_buf_ring.idr_lock);
+		spin_lock_init(&dp->rx_refill_buf_ring.bufs_lock);
 		atomic_set(&dp->num_tx_pending, 0);
 		init_waitqueue_head(&dp->tx_empty_waitq);
 		for (j = 0; j < ab->hw_params.num_rxdma_per_pdev; j++) {
-			idr_init(&dp->rx_mon_status_refill_ring[j].bufs_idr);
-			spin_lock_init(&dp->rx_mon_status_refill_ring[j].idr_lock);
+			spin_lock_init(&dp->rx_mon_status_refill_ring[j].bufs_lock);
 		}
-		idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
-		spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
+		spin_lock_init(&dp->rxdma_mon_buf_ring.bufs_lock);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 357185e45ae6..e6e05eb25692 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -73,9 +73,13 @@ struct dp_srng {
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
 	struct page_pool *page_pool;
-	struct idr bufs_idr;
-	/* Protects bufs_idr */
-	spinlock_t idr_lock;
+	/* Buffers by the id their descriptor carries, and the ids not in use */
+	struct sk_buff **bufs;
+	u32 *free_ids;
+	u32 num_free;
+	u32 num_ids;
+	/* Protects bufs and free_ids */
+	spinlock_t bufs_lock;
 	int bufs_max;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index bad5c58dfafa..b3b8afb82a78 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -341,6 +341,68 @@ static int ath11k_dp_purge_mon_ring(struct ath11k_base *ab)
 	return -ETIMEDOUT;
 }
 
+/*
+ * The ids a ring hands out, as a table indexed by id with a stack of the
+ * free ones: the descriptor cookie names the buffer directly. Id 0 is never
+ * handed out, because the refill path treats it as invalid. Callers of the
+ * id helpers hold bufs_lock.
+ */
+static int ath11k_dp_rx_bufs_init(struct dp_rxdma_ring *rx_ring)
+{
+	u32 num = rx_ring->bufs_max * 2 + 1;
+	u32 id;
+
+	rx_ring->bufs = kvcalloc(num, sizeof(*rx_ring->bufs), GFP_KERNEL);
+	rx_ring->free_ids = kvcalloc(num, sizeof(*rx_ring->free_ids),
+				     GFP_KERNEL);
+	if (!rx_ring->bufs || !rx_ring->free_ids) {
+		kvfree(rx_ring->bufs);
+		kvfree(rx_ring->free_ids);
+		rx_ring->bufs = NULL;
+		rx_ring->free_ids = NULL;
+		return -ENOMEM;
+	}
+
+	rx_ring->num_ids = num;
+	rx_ring->num_free = 0;
+	for (id = num; id-- > 1;)
+		rx_ring->free_ids[rx_ring->num_free++] = id;
+
+	return 0;
+}
+
+static int ath11k_dp_rx_buf_get_id(struct dp_rxdma_ring *rx_ring,
+				   struct sk_buff *skb)
+{
+	u32 id;
+
+	if (unlikely(!rx_ring->num_free))
+		return -ENOSPC;
+
+	id = rx_ring->free_ids[--rx_ring->num_free];
+	rx_ring->bufs[id] = skb;
+
+	return id;
+}
+
+static struct sk_buff *ath11k_dp_rx_buf_lookup(struct dp_rxdma_ring *rx_ring,
+					       u32 id)
+{
+	if (unlikely(id >= rx_ring->num_ids))
+		return NULL;
+
+	return rx_ring->bufs[id];
+}
+
+static void ath11k_dp_rx_buf_put_id(struct dp_rxdma_ring *rx_ring, u32 id)
+{
+	if (unlikely(id >= rx_ring->num_ids || !rx_ring->bufs[id]))
+		return;
+
+	rx_ring->bufs[id] = NULL;
+	rx_ring->free_ids[rx_ring->num_free++] = id;
+}
+
 static bool ath11k_dp_rx_buf_is_pp(struct sk_buff *skb)
 {
 	return skb->pp_recycle && skb->head_frag;
@@ -449,10 +511,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 				goto fail_free_skb;
 		}
 
-		spin_lock_bh(&rx_ring->idr_lock);
-		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 1,
-				   (rx_ring->bufs_max * 3) + 1, GFP_ATOMIC);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
@@ -477,9 +538,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_idr_remove:
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 fail_dma_unmap:
 	if (!rx_ring->page_pool)
 		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
@@ -500,9 +561,13 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_for_each_entry(&rx_ring->bufs_idr, skb, buf_id) {
-		idr_remove(&rx_ring->bufs_idr, buf_id);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	for (buf_id = 0; buf_id < rx_ring->num_ids; buf_id++) {
+		skb = rx_ring->bufs[buf_id];
+		if (!skb)
+			continue;
+
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
 		/* TODO: Understand where internal driver does this dma_unmap
 		 * of rxdma_buffer.
 		 */
@@ -510,8 +575,13 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 		dev_kfree_skb_any(skb);
 	}
 
-	idr_destroy(&rx_ring->bufs_idr);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	kvfree(rx_ring->bufs);
+	kvfree(rx_ring->free_ids);
+	rx_ring->bufs = NULL;
+	rx_ring->free_ids = NULL;
+	rx_ring->num_ids = 0;
+	rx_ring->num_free = 0;
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	if (rx_ring->page_pool) {
 		page_pool_destroy(rx_ring->page_pool);
@@ -571,6 +641,14 @@ static int ath11k_dp_rxdma_ring_buf_setup(struct ath11k *ar,
 	}
 
 	rx_ring->bufs_max = num_entries;
+	if (ath11k_dp_rx_bufs_init(rx_ring)) {
+		if (rx_ring->page_pool) {
+			page_pool_destroy(rx_ring->page_pool);
+			rx_ring->page_pool = NULL;
+		}
+		return -ENOMEM;
+	}
+
 	ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id, rx_ring, num_entries,
 				   ar->ab->hw_params.hal_params->rx_buf_rbm);
 	return 0;
@@ -2848,17 +2926,17 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
-		spin_lock_bh(&rx_ring->idr_lock);
-		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			continue;
 		}
 
-		idr_remove(&rx_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
@@ -3039,10 +3117,9 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 	if (unlikely(dma_mapping_error(ab->dev, paddr)))
 		goto fail_free_skb;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	*buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-			    rx_ring->bufs_max, GFP_ATOMIC);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	*buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 	if (*buf_id < 0)
 		goto fail_dma_unmap;
 
@@ -3111,9 +3188,9 @@ int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_desc_get:
-	spin_lock_bh(&rx_ring->idr_lock);
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
 			 DMA_FROM_DEVICE);
 	dev_kfree_skb_any(skb);
@@ -3181,9 +3258,9 @@ ath11k_dp_rx_mon_buf_done(struct ath11k_base *ab, struct hal_srng *srng,
 
 	buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	skb = idr_find(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	if (!skb)
 		return DP_MON_STATUS_NO_DMA;
@@ -3245,9 +3322,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 		if (paddr) {
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			skb = idr_find(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			if (!skb) {
 				ath11k_warn(ab, "rx monitor status with invalid buf_id %d\n",
@@ -3289,9 +3366,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				if (reap_status == DP_MON_STATUS_NO_DMA)
 					continue;
 
-				spin_lock_bh(&rx_ring->idr_lock);
-				idr_remove(&rx_ring->bufs_idr, buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_lock_bh(&rx_ring->bufs_lock);
+				ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 
 				ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 
@@ -3300,9 +3377,9 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				goto move_next;
 			}
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			if (ab->hw_params.full_monitor_mode) {
 				ath11k_dp_rx_mon_update_status_buf_state(pmon, tlv);
 				if (paddr == pmon->mon_status_paddr)
@@ -3611,10 +3688,9 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 			return -ENOMEM;
 	}
 
-	spin_lock_bh(&rx_refill_ring->idr_lock);
-	buf_id = idr_alloc(&rx_refill_ring->bufs_idr, defrag_skb, 0,
-			   rx_refill_ring->bufs_max * 3, GFP_ATOMIC);
-	spin_unlock_bh(&rx_refill_ring->idr_lock);
+	spin_lock_bh(&rx_refill_ring->bufs_lock);
+	buf_id = ath11k_dp_rx_buf_get_id(rx_refill_ring, defrag_skb);
+	spin_unlock_bh(&rx_refill_ring->bufs_lock);
 	if (buf_id < 0) {
 		ret = -ENOMEM;
 		goto err_unmap_dma;
@@ -3668,9 +3744,9 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	return 0;
 
 err_free_idr:
-	spin_lock_bh(&rx_refill_ring->idr_lock);
-	idr_remove(&rx_refill_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_refill_ring->idr_lock);
+	spin_lock_bh(&rx_refill_ring->bufs_lock);
+	ath11k_dp_rx_buf_put_id(rx_refill_ring, buf_id);
+	spin_unlock_bh(&rx_refill_ring->bufs_lock);
 err_unmap_dma:
 	if (!ath11k_dp_rx_buf_is_pp(defrag_skb))
 		dma_unmap_single(ab->dev, paddr,
@@ -3901,17 +3977,17 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, u32 *ring_desc, int buf_id, bool
 	u16 msdu_len;
 	u32 hal_rx_desc_sz = ar->ab->hw_params.hal_desc_sz;
 
-	spin_lock_bh(&rx_ring->idr_lock);
-	msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+	spin_lock_bh(&rx_ring->bufs_lock);
+	msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 	if (!msdu) {
 		ath11k_warn(ar->ab, "rx err buf with invalid buf_id %d\n",
 			    buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 		return -EINVAL;
 	}
 
-	idr_remove(&rx_ring->bufs_idr, buf_id);
-	spin_unlock_bh(&rx_ring->idr_lock);
+	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+	spin_unlock_bh(&rx_ring->bufs_lock);
 
 	ath11k_dp_rx_unmap_buf(ar->ab, msdu, DMA_FROM_DEVICE);
 
@@ -4332,17 +4408,17 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 
-		spin_lock_bh(&rx_ring->idr_lock);
-		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+		spin_lock_bh(&rx_ring->bufs_lock);
+		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (!msdu) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d pdev %d\n",
 				    buf_id, mac_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			continue;
 		}
 
-		idr_remove(&rx_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
+		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+		spin_unlock_bh(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
@@ -4455,17 +4531,17 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_cookies[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			skb = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			skb = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 			if (!skb) {
 				ath11k_warn(ab, "rxdma error with invalid buf_id %d\n",
 					    buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 				continue;
 			}
 
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			ath11k_dp_rx_unmap_buf(ab, skb, DMA_FROM_DEVICE);
 			dev_kfree_skb_any(skb);
@@ -4928,9 +5004,9 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_list.sw_cookie[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			msdu = idr_find(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 			if (!msdu) {
 				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 					   "msdu_pop: invalid buf_id %d\n", buf_id);
@@ -4997,9 +5073,9 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 next_msdu:
 			pmon->mon_last_buf_cookie = msdu_list.sw_cookie[i];
 			rx_bufs_used++;
-			spin_lock_bh(&rx_ring->idr_lock);
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 		}
 
 		ath11k_hal_rx_buf_addr_info_set(rx_link_buf_info, paddr, sw_cookie, rbm);
@@ -5553,17 +5629,17 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 					   msdu_list.sw_cookie[i]);
 
-			spin_lock_bh(&rx_ring->idr_lock);
-			msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_lock_bh(&rx_ring->bufs_lock);
+			msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 			if (!msdu) {
 				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 					   "full mon msdu_pop: invalid buf_id %d\n",
 					    buf_id);
-				spin_unlock_bh(&rx_ring->idr_lock);
+				spin_unlock_bh(&rx_ring->bufs_lock);
 				goto next_msdu;
 			}
-			idr_remove(&rx_ring->bufs_idr, buf_id);
-			spin_unlock_bh(&rx_ring->idr_lock);
+			ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
+			spin_unlock_bh(&rx_ring->bufs_lock);
 
 			rxcb = ATH11K_SKB_RXCB(msdu);
 			if (!rxcb->unmapped) {
-- 
2.53.0


