Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C254606A33A
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLE1IB4V;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tY3xypus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=; b=YLE1IB4VomXg/C
	4s5SKube/6EegENQPoHpuq5vIPXuJ/fJeKtXIGU9mNV8gckmGpH29kLhE5E5Gkxnuqw/P/gyOz7RD
	/9PvV61Ywx2UiaAB0Sr3VN22Y8DpqvsKEk1inSSsVmtfWBxtjkEo2vNL5AP16nXpyryDwymPVG4sW
	p47meWBISudtpUUS5SIbLIVZZ1NPoLYWfxiPxWv95zdw+GXNOftzFemhieI8gZ/guc+BCLnYdIhdP
	wkdhTR0ty0CLUV5lrPI/Y2mowQw9w6UUWHzCCBIF1FAZSjkFQ2CqUMbCv2IK35xO7yY467sD7QNOM
	puLkRLk+pcXhqV2ddg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIm-00000003bxo-2yNc;
	Mon, 23 Nov 2026 13:41:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIj-00000003brq-2Ekg
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso4541015a12.0
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441304; x=1796046104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=;
        b=tY3xypusaANxQcKAC+ofFPQJAYE8k7Hv4oM9ije+X3snAQMlOKl/J04sj2KgM1duil
         X2k/hjUPE/HqhxlnJw6Ew5/RezM3eyPFQ6NmgDH5LdUOFALPW5qkF7VsSycR0/a60wBI
         sz6JjL46YCnX7fxwTv+zEEFPrVjz0Er1ExCnxMDwW5zRsGyFAOWmmwtDzzqsoTG2tDdD
         SZrrsVZ+QU0+Kxlcx2j4YLGGo22HCyAq4n9wRkQRilNgjdITG3MKExOe3jNOTMSR7gdp
         0Nb+GDRx4H9Fp+dAQgdmWrqrFxcJcLR/cuG47EyAa3lxCVx3J0gBtJ01zREx3NAz+fE9
         Su7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441304; x=1796046104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=;
        b=y30uuaSTYH+EgC1NeMdiSwMFCKDANsaWyeF5oERAdB0LjmCst+B3RH4ZczyHG4nMbe
         KKWDBrL5DqvD9OeJv10GTmO8eIqXDZAe9f3QxadNPwGlyiRF6o5nBpT5BPDBz80c8FX0
         yzR86EO9O3ppaMo5mAX/Mxxq9ykNZazhexrBHdBrKyWAnKz1j+w8B0d3pkbqCKeH/66Q
         cGcR2jM1k9tQ2wN6/u2ngr3M0/mV61+0arUPiXQ34UDVRYo+g9kQWQ2oLSiIekXOsl92
         83qhY2bUqr7hq4vi6lChS91UHZmivYoamF7vsvZ3upBjy9h5d5nztDk7AxFzAdfk47AS
         Japg==
X-Gm-Message-State: APuU4Z8NAvF246NKxjBdt52uqX0iLx5cJ0Ciy8w/59gJPFMMiTgvUbub
	8b6tFZKsdF2nm+edaML7K+LXUk7zEl4MtUNnQvUODuowK7e3C84AOm/+f1fndW3BFw==
X-Gm-Gg: AZFdTZfzTEcfw4Oc8GEHRNpVAztdZbbYZBViXpdYKrJSWBIFXgl9JCywHn5Z++0BAtG
	dNxt6wCvschg+05QN7Q9ddRXgrYvstLduA2//7YPk52cgAyEJWGuNXHOzX9c+vXw7WHY3aR5AUP
	aLhLrFqmEah4THeiNGToxg0vjqhIKaX2M04hBKScn0Gq3T0MYEfRe23jVPeGkLAmP9JlasKguzT
	On4lkt/XMg/slN5Go0/pvfiKhL8fNhl0aG4+pF1kZEgpD9OYiSpYG7EXSeA87cSmuIZHB3/nMCs
	UcDgZck0/+uac5vFJME/23sr+TnDxEx05SKiLuf0JvBLNay+9vQuJxXXgsLDi1X1IH5AiefI2sX
	bQF565OsXB8UeVDe1Abk5NzdK6w/UksgidZnnDsTil9M14lrJZR1DoRNGUZbihQ/GuGCA6vp48U
	WcrxOEgYiWh7WcjtrUQDj1gegb3tGTM69fVql5HMUrKTCrPqQXp3htFdGJH/HpTOGtxXhy3UPKf
	qnop+9PuG7PMmFCIDvJWmawuNvGmXth4hmUiVlr/2JMcO/AC47nodo/CGlJvHSzSHbx78MsKrc+
	WtMJqFnYnk+2w9JtW/NWuJzRI5KIY2907S9Z2rdLS6khaqEiFAHlkasAziVw1azXsU/bf3OL5Mp
	aNAljteNcx4Fbmzf+oJ0Ny3P3EHBdnrRsk1y5u9PhGUhWbuu5K9KDQOea9bt/ch+NLLmwLBY6XR
	WZwOMVuQnq9nVqqavbqzd2PjgMB5Khl1gGRzgMTj/uW1gUWVzasGpfcKKFu2cEPjw3jLEhgdV6a
	JLcnKWvhnJuHUqqqcVstN/bJR9Up5VUE9AkCWcwrV5wHh5IBVNnEiGZesESh1eZqlcONxcG8ImZ
	8DUbLC+pjrvfM9UZAeeyxqrLBbI3X0KBN+U7P8xnL3HL3qEZUo7qnMLQp+e7MQufifqxA+fyDg=
	=
X-Received: by 2002:a05:6402:540a:b0:6ba:90f9:16ef with SMTP id 4fb4d7f45d1cf-6ba90f94aa4mr3423695a12.10.1795441303837;
        Mon, 23 Nov 2026 05:41:43 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:43 -0800 (PST)
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
Subject: [PATCH ath-next v1 05/10] wifi: ath11k: sync a cached ring's new entries once per head read
Date: Mon, 23 Nov 2026 14:41:32 +0100
Message-ID: <20261123134137.718575-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054145_610081_61996B38 
X-CRM114-Status: GOOD (  21.51  )
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

The REO destination and TX completion rings are cacheable on the chips
with alloc_cacheable_memory (IPQ8074, IPQ6018, QCN9074, IPQ5018). The CPU
takes each entry from the device with a dma_sync_single_for_cpu() of its
32 bytes when the entry before it is handed out, and prefetches it then.
That is a call into the DMA layer and a cache invalidation with its
barrier for every frame received and every frame completed, and a
prefetch issued a few dozen instructions before the load: in a profile
of bridged downlink at 900 Mbit/s (IPQ8074, one run) the instruction
after the first load of a completion entry in
ath11k_dp_tx_completion_handler() takes 0.70 % of all samples.

Invalidate the entries where they become the CPU's, when a read of the
head pointer moves cached_hp: the whole range from the old head to the
new one, in one call or two where it wraps, in access_begin and in
ath11k_hal_srng_dst_num_free(), the two places that move it. An entry is
read only below cached_hp, so each is invalidated once after the device
wrote it, and a line the CPU loaded earlier, by a prefetch or
speculatively, is discarded before its entries are read: the guarantee
the per-entry sync gave. The range is clamped to the ring. Prefetch the
entries two cache lines ahead, which may run past the head: such a line
is discarded again when the head exposes it.

ath11k_hal_srng_dst_num_free() now reads the head with READ_ONCE() and
orders the entry reads after it with dma_rmb(), as access_begin does.
Rings in coherent memory are not touched.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/hal.c | 86 ++++++++++++++++++---------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 98bd9e3f0aae..e5c35647a136 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -627,34 +627,54 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
-static u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
-					      struct hal_srng *srng, dma_addr_t *paddr)
+/*
+ * Hands the CPU the entries of a cached destination ring from word @from up
+ * to word @to, which the head pointer the caller just read shows the device
+ * has written. Every entry the ring hands out passes through here once, after
+ * the head pointer that exposed it was read, so a line of the ring that the
+ * CPU loaded before, by a prefetch or speculatively, is discarded before it is
+ * read. The range is clamped to the ring, whatever the head pointer holds.
+ */
+static void ath11k_hal_srng_dst_sync(struct ath11k_base *ab,
+				     struct hal_srng *srng, u32 from, u32 to)
 {
-	lockdep_assert_held(&srng->lock);
+	u32 size = srng->ring_size;
 
-	if (srng->u.dst_ring.tp != srng->u.dst_ring.cached_hp) {
-		*paddr = srng->ring_base_paddr +
-			  sizeof(*srng->ring_base_vaddr) * srng->u.dst_ring.tp;
-		return srng->ring_base_vaddr + srng->u.dst_ring.tp;
-	}
+	if (!(srng->flags & HAL_SRNG_FLAGS_CACHED) || from >= size)
+		return;
 
-	return NULL;
+	to = min(to, size);
+	if (to < from) {
+		dma_sync_single_for_cpu(ab->dev, srng->ring_base_paddr +
+					from * sizeof(u32),
+					(size - from) * sizeof(u32),
+					DMA_FROM_DEVICE);
+		from = 0;
+	}
+	if (to > from)
+		dma_sync_single_for_cpu(ab->dev, srng->ring_base_paddr +
+					from * sizeof(u32),
+					(to - from) * sizeof(u32),
+					DMA_FROM_DEVICE);
 }
 
-static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
-					  struct hal_srng *srng)
+/*
+ * Starts the load of the entries @lines cache lines past word @tp of a cached
+ * ring. A line past the head pointer is discarded again by
+ * ath11k_hal_srng_dst_sync() before its entries are read.
+ */
+static void ath11k_hal_srng_dst_prefetch(struct hal_srng *srng, u32 tp,
+					 u32 lines)
 {
-	dma_addr_t desc_paddr;
-	u32 *desc;
+	u32 ahead = tp + lines * L1_CACHE_BYTES / sizeof(u32);
 
-	/* prefetch only if desc is available */
-	desc = ath11k_hal_srng_dst_peek_with_dma(ab, srng, &desc_paddr);
-	if (likely(desc)) {
-		dma_sync_single_for_cpu(ab->dev, desc_paddr,
-					(srng->entry_size * sizeof(u32)),
-					DMA_FROM_DEVICE);
-		prefetch(desc);
-	}
+	if (!(srng->flags & HAL_SRNG_FLAGS_CACHED))
+		return;
+
+	if (ahead >= srng->ring_size)
+		ahead -= srng->ring_size;
+	if (ahead < srng->ring_size)
+		prefetch(srng->ring_base_vaddr + ahead);
 }
 
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
@@ -675,9 +695,7 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 	if (srng->u.dst_ring.tp == srng->ring_size)
 		srng->u.dst_ring.tp = 0;
 
-	/* Try to prefetch the next descriptor in the ring */
-	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
-		ath11k_hal_srng_prefetch_desc(ab, srng);
+	ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 2);
 
 	return desc;
 }
@@ -692,8 +710,15 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 	tp = srng->u.dst_ring.tp;
 
 	if (sync_hw_ptr) {
-		hp = *srng->u.dst_ring.hp_addr;
-		srng->u.dst_ring.cached_hp = hp;
+		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
+		if (hp != srng->u.dst_ring.cached_hp) {
+			u32 old = srng->u.dst_ring.cached_hp;
+
+			srng->u.dst_ring.cached_hp = hp;
+			/* the entries are read after the head pointer */
+			dma_rmb();
+			ath11k_hal_srng_dst_sync(ab, srng, old, hp);
+		}
 	} else {
 		hp = srng->u.dst_ring.cached_hp;
 	}
@@ -835,16 +860,19 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
 
 		if (hp != srng->u.dst_ring.cached_hp) {
+			u32 old = srng->u.dst_ring.cached_hp;
+
 			srng->u.dst_ring.cached_hp = hp;
 			/* Make sure descriptor is read after the head
 			 * pointer.
 			 */
 			dma_rmb();
+			ath11k_hal_srng_dst_sync(ab, srng, old, hp);
 		}
 
-		/* Try to prefetch the next descriptor in the ring */
-		if (srng->flags & HAL_SRNG_FLAGS_CACHED)
-			ath11k_hal_srng_prefetch_desc(ab, srng);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 0);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 1);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 2);
 	}
 }
 
-- 
2.53.0


