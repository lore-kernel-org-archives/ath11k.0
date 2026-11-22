Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CC606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pvp7SwlV;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=H0sXR6Ye
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=; b=pvp7SwlVDlfxre
	itD17XsCTmpsUyDAuTzwUhyXt8qZBnWIYdFEW7g73XnXVraTm+5i+BZOVpamW8HVBcSdK85GLyDDw
	/S4oBGZImSZki77c6o67+SwJ1fHx9cUmKjDR5878N+p2DzgkzOerL6JJUbcJiEvRAJWpmcveuFVy+
	VxGNk0I09GmE0kUTuToM5DTOmNosehJ7ALDm6b1DzWEB3jNa/fJFfYQI0oNjHTvnLKijJQe9nBwkS
	m/O6HOjjVL7ttXjz0eF9RfaB6XXL6KiNFLUG7uajCXvWRzF9DkC/VZacncl0fU42V6/y9iv0iwlyW
	ASKo2Bfk30N6/gU5c/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3L-00000001V6u-0qBf;
	Sun, 22 Nov 2026 18:12:39 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3B-00000001UvQ-1PhR
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:37 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so3250018a12.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371147; x=1795975947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=H0sXR6YeideZR5ShZCIlP7lf/VFI9Jj37czK1UUvd6R/WA3xf2YYkRRk+RKRLsMNFr
         nFy/cudiJ0Ak49MuhT+MGM9Q+vvngoiSZ2g+eq9LSuEVcK+2u81b+2Y4y4/hMcrfNIJX
         TCxl3lpJnA+EIDc3P/YUl18Pr5uZFtW8LhUMhlNihG4xMuFxORd2Kb99l85TLJ2LiF/B
         NTcfYNVovXxjGepHb6PuDtJ9R1KrLmIDqn5+4Gg7ifHuwPAa90lTSGZd1TLICzB5Z2RP
         +VBTsrX9dx/KebkRLe1LvIeF93UVPMukAFKx3fqJvqR2Fi/iSUCLfc053MeJbZQN/P9p
         YhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371147; x=1795975947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=XwjBAfXSsYbYLYYHe3fgXA4t65IIdsWt+eMdLUM6nohfLtydFeqh4FRMvBz+6nVH00
         dOIGWJR+uiXgwbz4GFiGNX5c7arP6P3Rp36FcjdXnho5lY9L1RP6RoA2ZcHwjBvH0bGM
         37CHq4Gy5Fg3qHo6z+6lgY1Ci0EoUVGYIVkkLEcGppHfnKVxqzBiieNHR0+QS/0qCr1g
         KBPG7weKMLCHxSYBB2zZ1GOAUFq+KwSSlwih/r3mpkjaYNlnO3jxvKXyXXraAo6JkNfD
         mOIklaMkB+iDTFTU+jjp9o4trEOAxQJoY6ahamMpRPoF4DzXFbIYbJ98r57qgs1uD4ud
         Eyxw==
X-Gm-Message-State: APuU4Z94uCPWfoHZqevLehfaOtPiQ1XSgm25/HYPf7G+1wexBD539rB3
	Q6VqzLHKBt0I6Ok3dQxTtEpAJvlfMuwI0xkmuRdVNsi4AGqd+CErDnTzR0WaJxex2Q==
X-Gm-Gg: AZFdTZcq2aE0N2WIbweBqVe9YxaApleU3xJlU50fdSjvsag5g9V7uYeQOWUfnjdWMOT
	FOZ9x35hfYQibpZZGuxmqi4FH/yNxP2kB5xN7VO0EDd5ZtUE2hB5gTCTLXiwK/X+ver588+H4NZ
	Op1Nw+0NQdzdIfqa4SxCS9NmKD0FlaJpcMa6cCaT4A64b3WFzy4gNfPXf4H84TAzqID/GDp44O0
	VksJMdLy7MGb3WjOa5rlKP+syWQW4Rv03CWQq/nCKWLM1FijATlHes4cnggNFFy/23v9Z5tCtvt
	+PoVtxIowcChGevkykBmvh7eHTWEDz6/hnZsHNtItS6ydDrNgimIOwsUBn6C5A2sVUWgLBz0KRM
	1abv2RlmEneilC75Pm6jxRPjpdZ67mLIaOlv065NVs/xTKi4VDWAzIik2XmP0y3HNsaqS9ZtQpu
	k2DiA4f8idqr98gSeDcqb2hvnLxvrIqxR/4IV4XEMGFaGYba5bfDwG2BFGOFimaK01oWkvPy0kc
	Rt4pS+JhV7qg3GhKFJe2rfB38Q2SorZqxn2Bc1dlAki/K0AePyz4ssk0gYZYMhK2zE3SKFh/lKK
	RoRevEfEOVxh49vaQ+/+Ey0cFJ9tVw2qlJnytpGI8vnm0O4m//VUv8kURCCchkwRRFu82KT6Jzx
	qTwSe1M30hXti7uDoo44KXZ5/ijMHIPpn/6gghP0X9rsOZFz5vDmlY0+9iMbsvAIALfmV1ANrPW
	cyG80FP8r+B5LzI8JjyEod+K25OApYRou5db41ylEobFUkVaX0m1jMeFvO+kGmXfYXB4kEXuHyn
	a6vs5YrVfYvLf5fyW3e1hB7rlY/gOZTX+Bq2G3NPUpwvdiacR+ytkrkhXto2hHNhK4LvWAVrsm2
	S8dZ1vxHttOIG0KnZd6mZ/Ry4fNx3xpT0FYcV2cdXaPDQ43pqZ/jJsLl6FT9SCctWgqmtrna
X-Received: by 2002:aa7:d287:0:b0:6b8:818d:520c with SMTP id 4fb4d7f45d1cf-6ba37c7ba50mr4620662a12.5.1795371146993;
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 7/9] wifi: ath11k: take TCP batches as long as GRO builds them
Date: Sun, 22 Nov 2026 19:12:11 +0100
Message-ID: <20261122181213.1016590-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101229_895900_3C9EE37F 
X-CRM114-Status: GOOD (  12.01  )
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

The netdevs offer ATH11K_DP_TX_TSO_MAX_SEGS (16) as their gso_max_segs,
but a bridge or router hands them what GRO built on the ingress port: up
to 64 KB (the default gro_max_size), and for a frame list up to 64
segments, where tcp_gro_receive() ends it. At an MSS of 1448 that is 45
segments. gso_features_check() clears the GSO features of every frame
with more segments than gso_max_segs, so validate_xmit_skb() cut each
such batch into one frame per segment before mac80211, and forwarded TCP
downlink reached the TCL one segment at a time under load, when GRO
batches are longest.

The 16 is no limit of the TCL: each segment of a batch is a ring entry and
an MSDU extension descriptor of its own, and a ring has 2048 descriptors.
Raise the bound to 64. The transmit loop then takes a frame while 64 of
the 512 TCL ring entries are free, and a batch keeps 256 bytes of ids and
descriptor slots on the stack. A batch whose airtime does not fit the
estimate is still cut by mac80211 before it is queued.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index a923ba792e4b..1bdf2f564dac 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -81,10 +81,13 @@ struct dp_rxdma_ring {
 #define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
 
 /*
- * The most segments of a TCP batch the TCL takes whole, and the payload
- * pieces of one segment past the headers
+ * The most segments of a TCP batch the TCL takes whole: each segment is a
+ * ring entry and an extension descriptor of its own, so the bound is what the
+ * stack builds, the 64 segments at which TCP GRO ends a frame list aggregate
+ * and more than the 64 KB of any other GRO aggregate hold at an MSS of 1024
+ * or more.
  */
-#define ATH11K_DP_TX_TSO_MAX_SEGS	16
+#define ATH11K_DP_TX_TSO_MAX_SEGS	64
 #define ATH11K_DP_TX_NO_EXT		0xffff
 
 struct ath11k_dp_tx_ext_map {
-- 
2.53.0


