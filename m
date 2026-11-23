Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBC606A684
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fOFyexYf;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ywESlbml
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=; b=fOFyexYfipHaDf
	s7/YXgYlxtqJR0Jd8Z5DEe3BLO2ZGq2IzQHvC5O6CNNF1iF5MN6RB7tKucv/ZmOFf3vvHjL88fL/q
	YHW7zW7qqK//P54SlCJgGSP+WQ9/jhrHhJSOuvX3DB2sy8P3O2Q+dsQ84dv5dXAVhsK9yEmeMIZTi
	/cn4ZtyQWL69saz1S4PjQ6bPmqwcKYLWTuqIUTPKmXtSJMA334PPLfxpUTuwgLdEPo1WFjrCV2QDf
	usd1HoWfE9K6eW06lc24kyey+zD1LWkw5liL4XPvDi415A9duPdydQREcYoyBgDn/8jw2TjdGZJBP
	CJzIyV+//eI+weG5twww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIm-00000003byG-3dtu;
	Mon, 23 Nov 2026 13:41:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIk-00000003bse-0hrO
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso4589044a12.3
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441304; x=1796046104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=;
        b=ywESlbmlnqIqlEgtiCxBBgc8hYu77LVAPRigRwVfBIloJjF7BxV1hVoImyOcrDCoKp
         gm1GZXen9vtLWPRCTalO/FEPQ1vL8AfU69PIV9fx0oqwTVe6HZx0QNKGCzcxlv2ZR1dj
         ls1IKq1TUlt+hdLqi1SwCRO8rP8DQLVymSZqaAfcLiQnz/7idakaQr0TuR3F0J5lGBNH
         1oIJMRXjy33wZ6PdnziRJrTQfkUClKZmrW2SWbmx+XU5rIUVsJMEWJ67pUgin1hZbF2t
         eihW9FoyWK3WpzQYaFVnkZ3plCE4+vWBTxzryNMSFrwuGLGe2gTB/y+NCQ5b7qjMUCjt
         BGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441304; x=1796046104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=;
        b=Q4l0cYQO7rUvX9kUDT0mjIkQQ5Lv+loNTnyzp75PtKOEWQEsav5zrw1/S3S0ynTaL2
         KmDbSVng9SLnbnBBpd1mZfJKtJ00GgYNULca40NTCEm86YOKalOxn4JUDRldLrWH955V
         e4fIXMcYnq/zytsTrxEQHvgwPiVpeXi7GiKkRmkB0NvMiaowNDYPHnZd8aGme6zTunAV
         fsx9uqiHydMQ2CNnk/j0pSk1rFxdnoqLfo+6h4F8BqUkvXM+5c36FDR4mw0c5pZknoIr
         XgmrJ9PPa94GSzUj6q/laCH0rMiH/XWuUlocr9+pxAsETgKxgRd378lu9I7FPAaquAv3
         1YnA==
X-Gm-Message-State: APuU4Z/JDFmt0Kw5NZgFd2ECsghO4PcyuJIvWkvlfKILyc2rYGWCdN1Z
	Cgd3QSyD6ghy5apkltAwibN713DmKq91Ml2sIblQciif88uK1NAxXEiv8eCzrC0oQPyBa+BtOXW
	Cy9BDWAD41EQ=
X-Gm-Gg: AZFdTZdjFjNusVIUkV/XZHHpHenHUQa7Xm0RQxqyNWHc54AFnuTz0ScdlyR9yP3TayN
	isxOZ9zjhdW3gXRzq9h6/n3xXjbaT2IcLFY9Dq4phsaT0M0BM7pMZttJQqLpPzIGMfJ1/Nis/If
	Mplfk7FAutS+Cb4EgrKhCDUIQy00uKauw2NJ2PIL2029Yoq1uIEqeWqolXaI9L0FoRz4LueqEUQ
	Jfq6WeRkBHwMF/C0jZfiyYsBArTMVPn71pl/i2OogdJ8BvO4az5vcsJLeka/8WcNPkpwPF1Kb9Z
	VVF4/N/fkHFnjSVCYNlIeFTwMEYEEcxd1wn69wmLngqRK482rl9Nb7K0qXFqjkTIzcVNOFwtBNr
	CHnzluIKl83jMaKCZncvAgOgfWO+mtqY8FCgAfNwv1sRmaCMNkfWo1vXAyC/EqQxGVFGqt3/2cV
	7KiRXXmLgwX3ak8JEMBF1Ky5zKrAdjXNEBiLwY2awXekPzUdz29Meq63E1NXZFwtlHHV+Bhp638
	MIJubP4JR2Ftq4225v6FHZnhibh9Wa7/4EuwDh5n28DmBGV7Uz/sFJh7m2EToKuj9wTu/2LV69y
	I66A7ZbsK49MHHBWdYw6G5V5z631oqGS84LK9JHKK49Ca+nm2LJyPxlJ+osJVhKGMgM61DYXJQu
	QjA2q8hxUQmB/rmJHosTXh8SasEK4Rp/zdg+nrThcoFHdMn59BJVhiOXNv5gj2SGefWbUUeSyMS
	6nXAXDIBUAsujaGLoxhRKXVt3uiWiQCYCXVJ0Ign/RG7FE1Xtk0ICs9csy/gEAFj1ugB8EdbPx+
	rPmWDO7RyP2z/3fzvfV4oz0pjEUNeP9kYyNK9TvBygz2wdp2f0lkSCcbE9qy85MFKajc5VNVYrW
	nAviyHj0X/toj8xFAhqz7i7+KO9yyk9Ce9ZzAXGJxEr7cHKUI86x1489wzfXV5GFYFpUOHekvbi
	/xZMtT9UclsPiEWrh28I=
X-Received: by 2002:a05:6402:1f07:b0:6b6:e808:9711 with SMTP id 4fb4d7f45d1cf-6ba37eae2f5mr7555038a12.29.1795441304531;
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
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
Subject: [PATCH ath-next v1 06/10] wifi: ath11k: prefetch the buffers of the REO entries ahead of their reap
Date: Mon, 23 Nov 2026 14:41:33 +0100
Message-ID: <20261123134137.718575-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054146_290902_D8D5F7C1 
X-CRM114-Status: GOOD (  21.04  )
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

The REO reap loads, for each frame, the buffer table entry its cookie
names, then the sk_buff the entry holds, and after the reap the
processing of the frame loads the descriptor TLVs and headers the device
wrote. Each is a cache miss, taken one after the other: the table entry
and the sk_buff were written when the buffer was posted and are cold when
the frame comes back, and the frame's lines were just invalidated. In a
profile of bridged uplink at 900 Mbit/s (IPQ8074, one run) the
instruction after the table load in ath11k_dp_process_rx() takes 0.72 %
of all samples, the ones after the first sk_buff loads in
ath11k_dp_rx_unmap_buf() 2.26 %, after the attention load in
ath11k_dp_rx_h_attn_mpdu_err() 1.10 %, after the source address load in
ath11k_dp_rx_h_mpdu() 1.01 % and after the load of the data pointer in
ath11k_dp_rx_process_msdu() 1.05 %.

On a cached REO ring the entries ahead and their cookies are already in
the cache, so start these loads early: as each entry is reaped, prefetch
the table entry of the one after the next and the four lines of the next
one's sk_buff, whose table entry the entry before prefetched; once a
frame is handed to the CPU, prefetch the first three lines of its
descriptor and the first two lines of the frame behind it.
ath11k_hal_srng_dst_peek_ahead() returns an entry below the head pointer
read last. The table is read for an address only, without its lock: a
buffer the table no longer holds costs a prefetch to nothing. Rings in
coherent memory, where each entry read is a read from uncached memory,
are left as they are.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 93 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hal.c   | 27 +++++++
 drivers/net/wireless/ath/ath11k/hal.h   |  1 +
 3 files changed, 121 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b027b76ea3f3..e8226b2b832c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2919,6 +2919,92 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 	}
 }
 
+/*
+ * The refill buffer table entry a REO entry names, or NULL for a cookie that
+ * names none.
+ */
+static struct sk_buff **
+ath11k_dp_rx_reo_buf_slot(struct ath11k_base *ab,
+			  const struct hal_reo_dest_ring *desc)
+{
+	u32 cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+			       desc->buf_addr_info.info1);
+	u32 buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
+	u32 mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
+	struct dp_rxdma_ring *rx_ring;
+	struct ath11k *ar;
+
+	if (!buf_id || mac_id >= ab->num_radios)
+		return NULL;
+
+	ar = ab->pdevs[mac_id].ar;
+	if (!ar)
+		return NULL;
+
+	rx_ring = &ar->dp.rx_refill_buf_ring;
+	if (buf_id >= rx_ring->num_ids)
+		return NULL;
+
+	return &rx_ring->bufs[buf_id];
+}
+
+/*
+ * Starts the loads of the reap of the next REO entries, which are cold by
+ * the time the frames come back: the buffer table entry of the entry after
+ * the next one, and the sk_buff of the next one, whose table entry the reap
+ * before prefetched. Only an address is read from the table, without its
+ * lock: a buffer it no longer holds costs a prefetch to nothing.
+ */
+static void ath11k_dp_rx_reo_prefetch(struct ath11k_base *ab,
+				      struct hal_srng *srng)
+{
+	struct sk_buff **slot;
+	struct sk_buff *skb;
+	void *desc;
+
+	desc = ath11k_hal_srng_dst_peek_ahead(srng, 1);
+	if (desc) {
+		slot = ath11k_dp_rx_reo_buf_slot(ab, desc);
+		if (slot)
+			prefetch(slot);
+	}
+
+	desc = ath11k_hal_srng_dst_peek_ahead(srng, 0);
+	if (!desc)
+		return;
+
+	slot = ath11k_dp_rx_reo_buf_slot(ab, desc);
+	if (!slot)
+		return;
+
+	skb = READ_ONCE(*slot);
+	if (skb) {
+		prefetchw(skb);
+		prefetchw((u8 *)skb + L1_CACHE_BYTES);
+		prefetchw((u8 *)skb + 2 * L1_CACHE_BYTES);
+		prefetchw((u8 *)skb + 3 * L1_CACHE_BYTES);
+	}
+}
+
+/*
+ * Starts the loads of the descriptor TLVs and the headers of a frame the
+ * device has handed back, which its processing reads once the reap is done:
+ * the first three lines of the descriptor, where its end, attention and start
+ * TLVs begin, and the first two lines past it. A line past what the device
+ * wrote is not read.
+ */
+static void ath11k_dp_rx_prefetch_frame(struct ath11k_base *ab,
+					struct sk_buff *msdu)
+{
+	u8 *data = msdu->data, *hdr = data + ab->hw_params.hal_desc_sz;
+
+	prefetch(data);
+	prefetch(data + L1_CACHE_BYTES);
+	prefetch(data + 2 * L1_CACHE_BYTES);
+	prefetch(hdr);
+	prefetch(hdr + L1_CACHE_BYTES);
+}
+
 int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
@@ -2936,12 +3022,14 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	struct hal_reo_dest_ring *desc;
 	enum hal_reo_dest_ring_push_reason push_reason;
 	u32 cookie;
+	bool cached;
 	int i;
 
 	for (i = 0; i < MAX_RADIOS; i++)
 		__skb_queue_head_init(&msdu_list[i]);
 
 	srng = &ab->hal.srng_list[dp->reo_dst_ring[ring_id].ring_id];
+	cached = srng->flags & HAL_SRNG_FLAGS_CACHED;
 
 	spin_lock_bh(&srng->lock);
 
@@ -2951,6 +3039,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
+		if (cached)
+			ath11k_dp_rx_reo_prefetch(ab, srng);
+
 		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
 				   desc->buf_addr_info.info1);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
@@ -2976,6 +3067,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
+		if (cached)
+			ath11k_dp_rx_prefetch_frame(ab, msdu);
 
 		num_buffs_reaped[mac_id]++;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index e5c35647a136..fffecc077eac 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -627,6 +627,33 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
+/**
+ * ath11k_hal_srng_dst_peek_ahead() - an entry of a destination ring past the next
+ * @srng: the ring, whose lock the caller holds
+ * @n: how many entries past the one ath11k_hal_srng_dst_get_next_entry()
+ *	returns next
+ *
+ * Return: the entry, or NULL when the head pointer read last does not
+ * reach it.
+ */
+u32 *ath11k_hal_srng_dst_peek_ahead(struct hal_srng *srng, u32 n)
+{
+	u32 tp = srng->u.dst_ring.tp, hp = srng->u.dst_ring.cached_hp;
+	u32 avail, off = n * srng->entry_size;
+
+	lockdep_assert_held(&srng->lock);
+
+	avail = hp >= tp ? hp - tp : srng->ring_size - tp + hp;
+	if (off >= avail)
+		return NULL;
+
+	tp += off;
+	if (tp >= srng->ring_size)
+		tp -= srng->ring_size;
+
+	return srng->ring_base_vaddr + tp;
+}
+
 /*
  * Hands the CPU the entries of a cached destination ring from word @from up
  * to word @to, which the head pointer the caller just read shows the device
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 82603a389bb9..45ac2391abd8 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -944,6 +944,7 @@ void ath11k_hal_srng_get_params(struct ath11k_base *ab, struct hal_srng *srng,
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng);
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
+u32 *ath11k_hal_srng_dst_peek_ahead(struct hal_srng *srng, u32 n);
 int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
 u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);
-- 
2.53.0


