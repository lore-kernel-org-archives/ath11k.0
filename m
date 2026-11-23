Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8679606C15E
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzD7wY79;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Wagxkd7U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=; b=pzD7wY791YV2jV
	jWB+90+UT05JGhaI9cYE61XdDA0UpktXoTVCx4IU2NodEEzyiTN43/I3gWHCmp4MnqLwcstjr1SPO
	XW6IHzG6DvpoRrjEvGHwlodshAyFC3p5b3+lTskIXOMDW1zNV/0ZptpuBSJpSZwj0Zy8HATX51kXu
	scx4n709CvLqdzjVBmJfbQCFkyCplUTr2L8gL0T6al/rnCu36tTUoRL8RFjWYfRDlaAmRj+beYKFb
	KtPxzk4FkMP2eQCzhC4uHVWBspIK3vwdt+3FSdkHk8LB332xN2+kiGc4enS/v3oobptQJeWfY15FC
	dlREQiRnFA0lqP1Quu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIr-00000003c70-1tpc;
	Mon, 23 Nov 2026 13:41:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIn-00000003bwi-20ZI
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso4541135a12.0
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441307; x=1796046107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=;
        b=Wagxkd7UAR73zh/rs5celfLf8XH8NwO0tM02/RWgonFR7fLreN2fRUAsvxXor1gxz0
         /8mlAUTzNEOWcWMTRXKAfHMmmRk1V35DKAO+A9vDyppfqoO0vbS4T+bwVy6RvDXp/Q1/
         gAL+pCmWlZ+ybjzAnaX3845Fi/SF/u9pg0dqD1TMn8MNK8DK9BC52qZC8CFKyZxVrAJ1
         1Xg6uqKG3EOieuXkXZJ3ajgfO5JW3WIvbr8DCgx/2xalnKiH/FeAQCoMckpUkcvNkTAN
         UhuEHRgdIDpjTr5W4uWFBozjC+auZkEhl7/ExMAuqnBwUFHXVx64nH0r1uJatxEX+KDO
         tvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441307; x=1796046107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=;
        b=fTOEAJjd4Fo0y+ZpdaKDltecwjOtsg2kOGEkmfeIhIubNE0lDCJ3BKEsznXcN/HG2a
         SChuiY3scW5kMNTlGPVKAXDKX8pGj1IWW5iCLtMMEA0P0+npG2ydY9qRcKwa5ym56oyz
         hjC5hJTK6yWt8TZfWLXsXk6PFaBk0a0CT2V+Lk7/vhh7coNjVJtRPQ+50yH7RrJcQjOU
         rRF0wFcSbU2vwuX6ndT56Gko4tlBoU5LvYRBOO4M3C3QagUE0KRZlf1HVnHy1Pt4+15p
         dZOYT418crNlGy/i8TvtRdXdtN8BAmUjpMeKXr6OYHKVyEXISb6I0udkqfYtLXYex2bk
         z/LQ==
X-Gm-Message-State: APuU4Z9CsB86D7OP9f/yzg47XSULoHBZt95S7PBttZL0Z2wcTIpNoitS
	dDJiSC8ubGjsrKvVUd/8GZ7NXSWhRVSbqrsRclVcE+6LF33aebcuhZnvE7hTtqWIkw==
X-Gm-Gg: AZFdTZf5LMMUbRQ2T4WLuDTNxpwdNzJUeYGNCMkmLcQylbMZDeFN+1JvV/OPlExCAgb
	fcdEgNzz++hvRhhIFv0GF0hEpUGkM/gZUDzUU2rEfIm0IPFJfPFydvFsS1pvtHJVEJsFQ6Y96Co
	aIgRpSA27XxTvllQ3IfOS0MaP3dPOv5sln9w7hPMMVoSRJS5XHMwxps5/LacaWoe86W0JaxYt4b
	PmlhJdYu9u1ideHzP68fBQTq+4UAwe7z7f/ekEBJ4o1w9Xr7tWFWD6Iruf3pKa1jFAEEk30wJXU
	8XD6MyBT1zH12+i7doCEUjYNCxpWf5BlwisCykury9JY5SkV9SUwcY33rHbqz0ua5GeEMs/z5pN
	m6Cfzij5j1AEX6IFlxR03NNwdTlWhWYNNh3Bk3V4QByFxJAcqDDUbazA6X/sRKEZDkvFi19T2aB
	nKpqZdQuqyhHqA5BTAFJyifNgs2CXYEpp4TKe1gk3KS514wYb70lONupc6VdgREJcXeWjjDR983
	f42PzEaBCJrjWkwPycfFw7dBxwyXkZiGw3FwRMpJ7SVVYHWgnNwQlbNpa+4WxD8XT8ik8nwZZPQ
	AjxdLqK0LDQ3migHZLrqfVavB/cF4QlKM8e+jrLtqjcq6ERTLoE5j+hWFJ1IAOyFPc3fO4oY2ts
	5Cm6y/KzFYl2qcOYnkEzv+usMFG7yL7xu3DAee3ZbbtaQo6OYYp5WGXD7/wNZCZqwxi4Qn5FTg3
	L1At4e/Y6SgnKQZdUheJzHJv4ycvLgb/hu1CMnRICn9n2sC9ywqk0sCZHukt5Eqs5YG66h0t6h5
	ZYHNiDmyDpSiwF3wKGZFNIhW/zdbWuajS9zmefBUPbkjnn1WMGjZz9sw9cNg6in4GRbrGmvn6jF
	fv7rFhG8LtNd1g/cjulB7lO8b1dIW8mQkUDBWvm3ppya7bbS3jXTGbB65T/nVWj8x8Vf1Jx5QzB
	oRvwr4GI/SSMH5WUWxMs=
X-Received: by 2002:a05:6402:1cc3:b0:6b8:7816:8735 with SMTP id 4fb4d7f45d1cf-6ba37cc09f1mr7420178a12.3.1795441307436;
        Mon, 23 Nov 2026 05:41:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.46
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
Subject: [PATCH ath-next v1 09/10] wifi: ath11k: hand the CPU only the part of a REO buffer the device wrote
Date: Mon, 23 Nov 2026 14:41:36 +0100
Message-ID: <20261123134137.718575-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054149_565316_711E7D48 
X-CRM114-Status: GOOD (  26.27  )
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

The REO reap takes each page pool buffer back from the device with a
dma_sync_single_for_cpu() over the whole buffer, 2048 bytes, while the
device wrote the descriptor, the L3 padding and the MSDU, whose length
the REO entry carries. A TCP acknowledgment, which is what a station
sends back on downlink, takes 453 bytes of it on IPQ8074 (384 of
descriptor, at most 3 of padding, 66 of frame): on a non-coherent system
the invalidation walks 32 cache lines where 8 hold what the device wrote.

Take back the descriptor, the largest padding of the two padding fields
and the MSDU length of the entry. The buffers of an MSDU that spans
several, the one with the continuation bit and the ones after it on the
ring, are taken whole as before; whether the last entry reaped had the
bit is kept per ring, so a chain split between two polls is still seen.
The length taken is recorded in the frame's control block, and
ath11k_dp_rx_process_msdu() takes back the rest, up to the length the
descriptor gives, before it reads the frame, should that be longer than
the entry's: the CPU never reads a byte of the buffer it has not
invalidated after the device wrote it. A line past what was taken back
is not read and may hold a stale copy; the page pool syncs the whole
page for the device before the device gets it again, and the reap of its
next frame invalidates what that frame covers.

A buffer of its own, without a page pool, is unmapped whole as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 +
 drivers/net/wireless/ath/ath11k/dp.h    |  4 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 71 +++++++++++++++++++++++--
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 4eb40e674c14..6b05b2e4d926 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -142,6 +142,8 @@ struct ath11k_skb_rxcb {
 	u8 tid;
 	u16 peer_id;
 	u16 seq_no;
+	/* the bytes of the buffer from its start that the CPU took back */
+	u16 sync_len;
 	struct ieee80211_sta *sta;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5e973c337cb2..861cf65c5218 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -234,6 +234,8 @@ struct ath11k_pdev_dp {
 #define DP_RX_BUFFER_SIZE	2048
 #define	DP_RX_BUFFER_SIZE_LITE  1024
 #define DP_RX_BUFFER_ALIGN_SIZE	128
+/* The most L3 header padding the msdu_end TLV of any chip gives */
+#define DP_RX_L3_PAD_MAX	3
 #define DP_RX_PP_ORDER		1
 #define DP_RX_PP_FRAG_SIZE	ALIGN(SKB_HEAD_ALIGN(DP_RX_BUFFER_SIZE), \
 				      DP_RX_BUFFER_ALIGN_SIZE)
@@ -279,6 +281,8 @@ struct ath11k_dp {
 	struct dp_srng reo_cmd_ring;
 	struct dp_srng reo_status_ring;
 	struct dp_srng reo_dst_ring[DP_REO_DST_RING_MAX];
+	/* the last entry reaped from the ring had the continuation bit */
+	bool reo_dst_cont[DP_REO_DST_RING_MAX];
 	struct dp_tx_ring tx_ring[DP_TCL_NUM_RING_MAX];
 	struct hal_wbm_idle_scatter_list scatter_list[DP_IDLE_SCATTER_BUFS_MAX];
 	struct list_head reo_cmd_list;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index dd5bc35581f7..313a39f15781 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -410,17 +410,59 @@ static bool ath11k_dp_rx_buf_is_pp(struct sk_buff *skb)
 	return skb->pp_recycle && skb->head_frag;
 }
 
-static void ath11k_dp_rx_unmap_buf(struct ath11k_base *ab, struct sk_buff *skb,
-				   enum dma_data_direction dir)
+/*
+ * Hands a receive buffer back to the CPU: of a page pool buffer the first
+ * @want bytes, or all of it for a @want of 0 or past its end, and records
+ * how much in sync_len. A buffer of its own is unmapped whole.
+ */
+static void ath11k_dp_rx_unmap_buf_len(struct ath11k_base *ab,
+				       struct sk_buff *skb,
+				       enum dma_data_direction dir,
+				       unsigned int want)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(skb);
 	unsigned int len = skb->len + skb_tailroom(skb);
 
-	if (ath11k_dp_rx_buf_is_pp(skb))
+	BUILD_BUG_ON(FIELD_MAX(RX_MSDU_END_INFO2_L3_HDR_PADDING) >
+		     DP_RX_L3_PAD_MAX);
+	BUILD_BUG_ON(FIELD_MAX(RX_MSDU_END_INFO4_L3_HDR_PADDING) >
+		     DP_RX_L3_PAD_MAX);
+
+	if (ath11k_dp_rx_buf_is_pp(skb)) {
+		if (want && want < len)
+			len = want;
 		dma_sync_single_for_cpu(ab->dev, rxcb->paddr, len,
 					DMA_BIDIRECTIONAL);
-	else
+	} else {
 		dma_unmap_single(ab->dev, rxcb->paddr, len, dir);
+	}
+	rxcb->sync_len = len;
+}
+
+static void ath11k_dp_rx_unmap_buf(struct ath11k_base *ab, struct sk_buff *skb,
+				   enum dma_data_direction dir)
+{
+	ath11k_dp_rx_unmap_buf_len(ab, skb, dir, 0);
+}
+
+/*
+ * Takes back from the device the bytes of @msdu past those it took at the
+ * reap, up to @need, for a frame whose descriptor says it is longer than
+ * its REO entry did.
+ */
+static void ath11k_dp_rx_sync_more(struct ath11k_base *ab, struct sk_buff *msdu,
+				   unsigned int need)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	unsigned int len = msdu->len + skb_tailroom(msdu);
+
+	need = min(need, len);
+	if (likely(need <= rxcb->sync_len))
+		return;
+
+	dma_sync_single_for_cpu(ab->dev, rxcb->paddr + rxcb->sync_len,
+				need - rxcb->sync_len, DMA_BIDIRECTIONAL);
+	rxcb->sync_len = need;
 }
 
 static dma_addr_t ath11k_dp_rx_pp_dma_addr(struct sk_buff *skb)
@@ -2870,6 +2912,8 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 					sizeof(struct hal_rx_desc));
 			goto free_out;
 		}
+		ath11k_dp_rx_sync_more(ab, msdu, hal_rx_desc_sz + l3_pad_bytes +
+				       msdu_len);
 		skb_put(msdu, hal_rx_desc_sz + l3_pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3_pad_bytes);
 	} else {
@@ -3027,6 +3071,8 @@ static void ath11k_dp_rx_prefetch_frame(struct ath11k_base *ab,
 int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
+	unsigned int want;
+	u32 info0;
 	struct ath11k_dp *dp = &ab->dp;
 	struct dp_rxdma_ring *rx_ring;
 	int num_buffs_reaped[MAX_RADIOS] = {};
@@ -3067,6 +3113,21 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
 
+		/*
+		 * The device wrote the descriptor, the padding and the MSDU
+		 * of the length the entry gives. A buffer of an MSDU that
+		 * spans several, which follows one with the continuation bit
+		 * or has it, is taken whole.
+		 */
+		info0 = desc->rx_msdu_info.info0;
+		want = ab->hw_params.hal_desc_sz + DP_RX_L3_PAD_MAX +
+		       FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH, info0);
+		if (dp->reo_dst_cont[ring_id] ||
+		    (info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION))
+			want = 0;
+		dp->reo_dst_cont[ring_id] =
+			!!(info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
+
 		if (unlikely(buf_id == 0))
 			continue;
 
@@ -3086,7 +3147,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		spin_unlock(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
-		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
+		ath11k_dp_rx_unmap_buf_len(ab, msdu, DMA_FROM_DEVICE, want);
 		if (cached)
 			ath11k_dp_rx_prefetch_frame(ab, msdu);
 
-- 
2.53.0


