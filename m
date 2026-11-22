Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2B606A320
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f42PuD1h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=U43h7EHK;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=pZiF4oaB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=; b=f42PuD1hk6dVAU
	7ZxTpdRfznFxvlXeFEK713Y7OcfWJQ93cymL/wIy4Ab4EcWyALnxXD6JaTE9zYvhJUt1sDHVjBHjH
	wvm60Ysmhv/zlnyaH04gfV8Z3nGbf8q9xNQVN82dHbL7+CCzv3+ukiP6r32d3pDALX6vbCoCceHfi
	4KUCbkvjG3iLXXy0EGetqhV24A6PrGrF3nFFiSPUbeZgfhPM7iP5rAWZiSyOODZ6/OP5Kx7hquRhG
	BSd4bbxj85XxDByU4ghevAhnqoWkWaKS8HjpffvSd5d1mHYWa6OdOxKDmyjz6KoVHeQzACRDkEELv
	hVIL44bmqEwlHU4N61bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3U-00000001VIY-0sVM;
	Sun, 22 Nov 2026 18:12:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3P-00000001VBY-0r0V
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=; b=U43h7EHKIraoxGlmcGZsDFsM5b
	uvsIXd9ZjKhIQVi6RsdxaHEOeLugoiaEQv3uit4KSeRorYS06GKc3w7+OlyL9LoeWJ0cxay8/wQB2
	I2bLn7BZ1i/VRb6e8lS8fu2PMPNA3/WTKeK5PSqYXUnGfcbHNiJKbPxqVM/m6v2N8trYnoHFDZ87I
	OwNxBILFoeMbcKW26C5BFk/527Xxrzl+eRGWdLYG7TLo2XuHX9Sc4TQ8MQX+ItH4GWHQtXnoc3hyn
	uhAEg0Uxp6EizXnolVwo3Ftptty7V1iS12njtTLGLCh/FCzf3M4YlrxKEUDa9FM1It58WDE+Wd7wt
	elAutVFw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3F-000000007oP-1CLq
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so2546964a12.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371151; x=1795975951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=;
        b=pZiF4oaB60GLnYRn1NhsXe6P2CEAuVzmoWVqbnThEDsOv9CAZXo5kGb/2j+Qy0CMqX
         B7UkL45LYMSrN9XiY7CZ/mRObHj9sKv3h7VF2ZZspziUuGKC2IXpRKOQURDs0eoSsrk7
         LvI31vADRZVtUqz1ERVDwYlnYQc2isNPx+bdJl4r9vjiutl7R0I5prgTl5L/LVxmy8Ol
         JqRWMbyxf5k4Mu5Tj044uQqb20PjkVyKUZVeC33a442qOilLOan7israUbb2+s0ICsAI
         3hXlK9RXiv03jM/dGUviSUW2+s+Neh7NGeech8qVsPNVyKdoD7AGSwB5PGJhZNOLYwck
         G70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371151; x=1795975951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=;
        b=jSC0dIZDd2XtldyRBUcs1Gc3ZD8PCSi3bwRGAYd7T6gPJDPYCwqGqwkxi14Qcs4L6j
         8RIojbVrTiIO/HBzWpiWFxMFQ+cq/wXalyJKJKZF8KXFnRgpwCxl8fShCZL/MFfG9nxd
         d+iDSj9c/3WOCwZwiCb5THfO083n0sHYykwo7vC2Q+7COrldA9kP9Ydsbi0rgSFPu6sG
         krfjIW0bvuVw1TsDYSxo63yKFiVEst98nduQjDoAX+1mt7Nq9Lz96QHMYrWXfMYMIfA6
         aizZQpT2hwSkiS2e8H1SlRJsUhpkRHx2LpTx9ITGq9eHlwVyTxbymEEBTVmMlbUnOuNp
         S08Q==
X-Gm-Message-State: APuU4Z++n1MeaaQACoDaxAO6EeZrPouLrCvAVrWXwHK0WsRjlPM3UOTi
	b17h3nSlWbCrU7qKgODhlC+9YXj7f4aHJGHC4/LsX1ZP0Vh0oO7A4GFaUCsdm93sUM4s3pbkVcD
	/5Nt3K7cB
X-Gm-Gg: AZFdTZdHQoh1Wp/A8MQmwwHlYuv9aTwN/1aN1n6DgXk1VadFTR5M739AvLTmE9+Upd5
	QwwNzVZIuJZ2UVkgZzOe8HeluQAjw7XDnhxewhMGmiOTz2rg1LLbr/X6XJ0tHYlfE0jvHPodrYd
	hbgh4HDgXPkgEGI7ZOjQchmlZI4kt5K9qR4OM01bbIGLFTJGpH5sXwNAk92xCHtsvo7yROP3WMP
	DdNwOIZMSdFCVcppGT9PrLubIdAyvUv9NBMko0IXXa2Y2cs0SE/sO1tWR0gfTDcj4Q76ldVr5gj
	g6YLPiyr1T4WzdBDyAwPZJo9oklB6pOURtYX0hpM4vyZmAUxsnWaJLBuphtCv/ozDnX/LpOsyPw
	jMPW2JkHx4+7xFP/8UZnaWG1SaQhuigRb0kZ8qGBV0GSTJiVNYeGvv6aqETWT59nZqN2m8PdcLO
	0mO2US3pokebtlYw/JH0RL4C/iYC0gTDN5Co3n/YI14PE4dBpbHybFswG6wQXGg3CGSkB+A/45n
	WK8UEYP5BUsSz8AC45mpda6XsaVFcqEthHv5rJHEG/UPh5JY7m6cfLJKFfPWVNIisnmChE3bJpr
	DAZvd98Snw9dE9JUq+aEHTJRUZDCCGeLH8367GyK6DzBmBQvJeKFZJfcotvlYRuzev3Y1AndWSs
	0brjSXlfbCtJ/98o895C3IJ30Lv1yYvUEgfG6so1BWE3EdQeGllghBtSA8meEIjYqgtxAwP7tuv
	2W6HQIRveAkPx4BkTVOnFUC9/esrd/8p2g99LC6n6eBhh29Lf7/j8xq5/IWodMT5yKvF64QE8rz
	oAvhDodbkHo5yy4r40uLOfq1sDkUKVLqUEFHkRMkP2I+W+s2Bs4txsT/bdT62iHzg7FKU2QYt+t
	y6drsjQiKmBon6vKzynTQaE78gBwl/SG/g0C2bIDGqy0E/d17IwKjafpq3eRK9yrLFaaBM3Z
X-Received: by 2002:a05:6402:1d4b:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6ba37e97cf6mr6095104a12.26.1795371151306;
        Sun, 22 Nov 2026 10:12:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:30 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 9/9] wifi: ath11k: count the segments of a TX batch without an atomic
Date: Sun, 22 Nov 2026 19:12:13 +0100
Message-ID: <20261122181213.1016590-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181233_502613_EC811430 
X-CRM114-Status: GOOD (  13.69  )
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

A batch the TCL segments from extension descriptors holds one reference of
its skb per segment, taken with refcount_add() when it is sent, and each
segment's completion drops one with skb_unref() in
ath11k_dp_tx_buf_put_id(). That is an atomic on the skb's reference count
line, which nothing else of the completion reads: in a profile of routed
downlink at 900 Mbit/s (IPQ8074, one run) the instruction after it takes
0.44 % of all samples.

Count the outstanding segments in the frame's control block instead, whose
line the completion of the segment reads anyway. The send sets the count
before the first descriptor is on the ring, with the frame held only by
the driver (its reference count is 1 there), and every release of an id of
the batch decrements it: the completion handler and the firmware release
paths under the id lock, and the teardown, which runs alone. The send's
failure path gives its ids back before any count exists, as it gave them
back before any reference was taken. The release that takes the count to
zero returns the frame, as skb_unref() did for the last reference, so the
frames of a batch complete and are freed in the same order as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  5 +++++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 17 +++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 11c79d0f5c34..32f24e1a396f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -128,6 +128,11 @@ struct ath11k_skb_cb {
 	 */
 	u8 tso_try;
 	u8 tso_bad;
+	/*
+	 * Of a batch whose segments are counted here instead of in the skb's
+	 * reference count: the segments whose completion is still to come
+	 */
+	u8 tso_left;
 } __packed;
 
 struct ath11k_skb_rxcb {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 089696bff4c8..2d044ed408c0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -245,7 +245,7 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 		ath11k_dp_tx_tso_unmap(ab->dev, map);
 		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
-		if (!skb_unref(skb)) {
+		if (--ATH11K_SKB_CB(skb)->tso_left) {
 			*more = true;
 			return NULL;
 		}
@@ -638,9 +638,9 @@ static void ath11k_dp_tx_ext_unpad(struct sk_buff *skb, unsigned int len,
  * its segments, and the payload in the fragments. A TCP batch has one
  * descriptor for each of its segments, which also gives the segment's IP
  * length, IP ID, TCP sequence number and flags for the TCL to write into the
- * headers; every segment holds a reference on the batch, and the completion
- * of the last one reports the batch to mac80211. A frame with fragments has
- * one descriptor, and is a batch of one segment.
+ * headers; every segment holds a share of the batch's segment count, and the
+ * completion of the last one reports the batch to mac80211. A frame with
+ * fragments has one descriptor, and is a batch of one segment.
  *
  * Returns -EAGAIN, with the frame untouched, for one the TCL cannot take
  * whole. The ids, extension descriptors and ring entries of all segments are
@@ -829,7 +829,12 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	skb_cb->ar = ar;
 	skb_cb->tso_try = 0;
 	skb_cb->tso_bad = 0;
-	refcount_add(n - 1, &skb->users);
+	/*
+	 * Each segment's completion gives back one share of the frame,
+	 * counted in the control block under the id lock every release of an
+	 * id holds.
+	 */
+	skb_cb->tso_left = n;
 
 	ti.encap_type = HAL_TCL_ENCAP_TYPE_ETHERNET;
 	ti.meta_data_flags = arvif->tcl_metadata;
@@ -898,7 +903,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 		ath11k_dp_tx_ext_unpad(skb, hdr_len, pad);
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	for (j = n; j--;) {
-		/* no reference was taken yet: release the id only */
+		/* no segment was counted yet: release the id only */
 		tx_ring->bufs[ids[j]] = NULL;
 		tx_ring->ext_free[tx_ring->ext_num_free++] = ids[j];
 	}
-- 
2.53.0


