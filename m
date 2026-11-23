Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA580606A6A2
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uc7jPSYS;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oNnMHDDU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=; b=Uc7jPSYS1xnNlP
	tbpSSe+Vl8znjXXSOsQXaZ6N5YdywA6gUAkPJEbb1FCmiLw3MLHc3+UUyPJ2MpLPvQJ9IwlV+WUJ+
	+8PM/IzgGvPd7hi5/XYX8QAD2oZ50SpIo7Pxu6QDm6/gDBn0Qyttw4kwE9v0zRjaXUS+H3u7E0lOG
	ANPw1SsoSHsWZb+alNX3E9X92D/7jNaFnPR80yYyX6mUCnOXJ4+U1qgSStM5i+R0aHokfB1a1hiLa
	SenkShynG8g5yKo2s7hPtpJ+tHVIUHPiV6WMJFWIzdF7WgWTlRNjvHuefLRltlMCUDmWk2fLx1SSE
	KasU/GjezZarfkc7fjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIp-00000003c3D-1OXR;
	Mon, 23 Nov 2026 13:41:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIm-00000003bwK-3LRF
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so4419594a12.3
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441307; x=1796046107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=oNnMHDDUeQplj9AQkvupRsUH6vFjK3sYv4ZIdDQYwSSOhgB5QNffHm+KHzZJMzmCRd
         13dKhiVyVRa4FJUGrVUKEjBufc3uz/wI0ibM98afvx7LRNrvZiV5a5J0IriWV6QpsgSG
         mu4VnFjqZ5r5sLQBuzjssE5PZ2QTVJK/LX0LADk5sfJGsIa6fqC/UPxQoMujdz4Wl0+l
         YftFiaVA5UavMzvtqVbBNBY9nts8kAEf3ZuBk/xp9EHwEoCrci0NGCmzUSVQVDyKwQmb
         Be68R2jM0Sm1G6NWfYe//3/BxmCYZo7MUUyzuX7Y3EkwsQ5R78ZiKIGSzp3Q2iQRZlXJ
         Dbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441307; x=1796046107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=HC1TsddpEKsskZOVN6mhtzu3bQByJk5rnkJhBXbMSGLTDGDPWpNJlUuD1wm+GB5RRc
         FICJ0+jgkkIxvSfrAtGqaFQtcDHlSOAP3Anuj6jgNn2645YI5UXQmQmc36c+YRyBwW7j
         h5yHRBHx5qkra74f0YdbooaFbc5AUevdp+EzuFtpJQ9cIHvKbV73GJsRFa7YAf00rc5W
         YB8DUOVrha/SYIGYyf0xYJpJyuQjC+FMTH2vvCgdSOQq5DTMtMu79GylSAh4l4FVRgFJ
         mymLQk1SezhFnODYg44V2ERSL/qEPFeK1iY5wgwPYHu18ADI88sTrtL5R/HJsALwCKGH
         tvag==
X-Gm-Message-State: APuU4Z9GQxy9iocYpGNQ6TjahcPPSMh+wXJsp2MTQA8E8YSx80KNcu98
	iwBMOAm3Xl94nA8bgOMgCBx59fPv0A5GoxqsPdXrMfTiEy08pyTQr4RFZc4Lj0i8/g==
X-Gm-Gg: AZFdTZf574hL10XJ72HUsGrmJuJtojP+gTE3dGWRJiXZksvkgqM6XwcG2mcR16sn4F3
	A+MplafGrPsdZVM767wSFsqdAf3YjZ5rETUvXA+j11vdmLb+5mkYzBg23ub8PT7O8MuptC+i2hv
	wDfYumjKX0LRl54GFqQyLzIeFwMgIK2OKqfPN+PrtpDGzoKAivafS7sz+Ybl7Rz7DxIcpsC0r0o
	GlU6c7xkEMCSdAkf6e+G8gfGCz5qp8bU6qCyWIrQYqYUwSHXP0rm1o4ii373oB0zFTvd0/rzPOY
	X+gqdnQiF2kBCwJh9WTuWz0/MDpX1riXp0gt14CCIBry1awoGblATIv4FdBLT6G4Yewnj0HYOMJ
	viXexCTyomSus3/iHmNb22B8b/+okQV/bL2obJ/HFZs8xBIBOB3db541/hoU9V6KwtnNXJAWbO6
	PZAdYmJg1ShrCO/HeMpSjzavApT5TuS7V+VKItjnMzysZkzppOumCjBxMBarIvvEpmqLPU580x8
	R4hcWXUisyMts35J6377V8HTUad/NUwfeUtPRnkdDAkR69pirywe07yItzk7w0tUx74L0BhoujO
	Bhdtk26CP2pg2ZlQnMY4BZR2985YEyCNTxcKgXIGpPf+lZO7sdyigLxhWyN+H4VyZE6K9eu0zhZ
	nxhn/TiotjmqV+WUl3UGtG7LniP6687ciGotCrV1+89KqQVPKfqSgfx+0MjvQyn0GZMCSKoRamF
	lB1gf4HhUtv2ncUApCN9tFrH8hyBV8YpOSiYLSUJPIDJCWr/Jeh7Orf9Xmfdkfn1adpVrGarFi1
	iUrvnsSlf30a9rObVgHnlvP0RyIGydMXGdbZsuKPcWKRWYDy2brxXI2jQljAWT2TEPoV2jZ8wwd
	t1gKTQoHzUV2aKqfF3yCQnSDCOUEvbK91ko1N3nd+gHBC24up8fp8OiLB0W6PdiBBHzVTvUGHif
	rHF4+/mL7yajDNUDudvM=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id 4fb4d7f45d1cf-6ba37ea6d00mr8878197a12.33.1795441306709;
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
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
Subject: [PATCH ath-next v1 08/10] wifi: ath11k: take the refill buffer lock without a second BH disable
Date: Mon, 23 Nov 2026 14:41:35 +0100
Message-ID: <20261123134137.718575-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054148_882037_23F65229 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

The REO reap and the refill take the buffer table lock of the refill
ring once per frame with spin_lock_bh(), inside their hold of the ring
lock, which they take with spin_lock_bh() and which keeps bottom halves
off for the whole loop. Each unlock then goes through
__local_bh_enable_ip() for nothing: in a profile of bridged uplink at
900 Mbit/s (IPQ8074, one run) the instruction after that call in
ath11k_dp_rxbufs_replenish() takes 0.43 % of all samples and the one in
ath11k_dp_process_rx() 0.13 %, and __local_bh_enable_ip() itself 1.23 %
from all its callers.

Take the table lock with spin_lock() in these two loops and in the
refill's error path, which all run under the ring lock. The other holders
of the table lock still disable bottom halves themselves, and none takes
it from hard interrupt context.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ff09463d829f..dd5bc35581f7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -513,9 +513,10 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 				goto fail_free_skb;
 		}
 
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
@@ -540,9 +541,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_idr_remove:
-	spin_lock_bh(&rx_ring->bufs_lock);
+	spin_lock(&rx_ring->bufs_lock);
 	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-	spin_unlock_bh(&rx_ring->bufs_lock);
+	spin_unlock(&rx_ring->bufs_lock);
 fail_dma_unmap:
 	if (!rx_ring->page_pool)
 		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
@@ -3071,17 +3072,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
-			spin_unlock_bh(&rx_ring->bufs_lock);
+			spin_unlock(&rx_ring->bufs_lock);
 			continue;
 		}
 
 		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
-- 
2.53.0


