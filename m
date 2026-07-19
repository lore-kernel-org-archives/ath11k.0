Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C9DC44524
	for <ath11k@archiver.kernel.org>; Sun, 19 Jul 2026 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+b/LWj/hLmWJErzZT/ZoMVshAClUgZMmHRGkesS9h0M=; b=R5mV5X/RrAtE3+blXjZTmH4JKV
	6k4G3j5PoaGwNOlqcyTYqQ7XmfNAnaVHi8Nu9ojvoaRnyFTll92O2lcDr1f77IiZ9V5K2ZZ6H8Q3a
	0L4a1jUwpxIg9CXLFDVhfEzYZEBWB1Pq/h+yf9wl5gtpD+GvdHJbka8Gck4b6yhO0w9T7jUxzKYjs
	txcO3RHL4InzxmstpZ7rtnBRdtslEW/6sjW5eJVqnWA2S8G2OfdWc57NmaZvu0TY0yNmU41BL1tz+
	jBCoPz07YOeNUeOf3492YOgCGj+AHUnJ1h6Ytm34flHvZM5DKR+vXzJYROHIdJvcSd4l0yuLfviCY
	SA9+69gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWo-00000005PBs-0Il0;
	Sun, 19 Jul 2026 21:58:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWl-00000005PBC-1rh0
	for ath11k@lists.infradead.org;
	Sun, 19 Jul 2026 21:58:29 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c1600d040e4so503770366b.1
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498304; x=1785103104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+b/LWj/hLmWJErzZT/ZoMVshAClUgZMmHRGkesS9h0M=;
        b=BC1fhV0RWVm2VdOfRju+06HJi4oc95v0BT0Vz/V42I1N2igWb2kZPbC4VOUXiRt5VL
         GXzLzR8VdxzMF75Se9QDln2PT8sDftJJGZ2q41g2eaVn/EBqhcWyo2lfAqJKMsXuVZtQ
         UtEyDmBPAfci2VjgwgocGgYLb4TMRUNXojMG0PkzZGyOBv9odgHt503y/nZVH+o5d0rl
         ihDU0cnFGOnBu2cH4+Sg6ipREIwqEkc0Ql01BvOXmFJaPhKtkpqqb8NJZMt9QgupZNdD
         ENutuU1qqKV7oLhID3g/pc6kFKQkYEsgsjqMyvJzAygWzlyxno5oCXKSl01hZNatTQYi
         qMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498304; x=1785103104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+b/LWj/hLmWJErzZT/ZoMVshAClUgZMmHRGkesS9h0M=;
        b=HNZF3iz1Epo4jD2Ks/erWMhA5KLAT/PRC/J9Rf7Iw6JjJyz9WjOf5G6cFbISnu5FPR
         b0wbASaJRqyCZ5yAvsVcCAoBV2clPp8ZkfAXogKsNz9B0SyOhCRYkMIqpDdgiOuZKp3y
         0MJXGzhlenq5f5XthKcS8j+CScOvn9JQvq5OUGh8UmWdT7KdwlGbQ3f3MO3g6LTb56sY
         pDGXPxSpPDEZaScMF3Z4Uu6mLpJpTxqI5Yew1S5uruLvPZ6B9xAxwkayYhz475SWaxS4
         x59+fDVY07d0MUTJRvTjt1DOhfpdbO/wSumz1/VaE+lA02OGwveIJ1O/U8/SVLVk6Cfj
         PrAw==
X-Forwarded-Encrypted: i=1; AHgh+RpQavzMNu17S/vrbi9bYay0eD3aJoeyGH+MpuyLKao1ErXNUVdy8518vRyJNwLhBQm1KTOZezc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4C4pVqXRC2aF1JCIrbdreVGzTBvtqcOmCC1z9coxJo3/EDhin
	TJ2aSbcN4zlExRjnhjWF/nzI3sAIstwkzqVG2x2vxKoc6S6mFJ4RXGlas2x0r9CH
X-Gm-Gg: AfdE7ck2TYLMAOtU3UKMSeOjUo8bwDXuXbOklpt24ex3mjVBpk3E4bZ0ACdYALKP+/7
	jfsBopvc2CiOC13vvSofpLYeUYDn4Wc9qArFIR/VQNgixcgy8DPgBUis8VU7nXa5z8qcp97wJDw
	TxhM+IA+5KxNNdBjo2JNKm4zOGR5Ehk7jFbnEClkisdx1uRvrQAX3AW0IPcjSiZjgaUQ02Dptz+
	94XlJPWfr2IW6cBypGP4BLjv32bizCp6oek8p0WW1F3VU6s5hP38EQQuRLtCJkHgg/1MiQ3j/5q
	+fy4ORQKou8kYhoRQoKIyAEWMUYxmaaJXIwz+O735l4FaddGt43a90jt9MajkwnnyPaRAjrlWnQ
	BTlAzGMIcH+z6yspfyRIjzI8EdCw1KOwLe8b7/QKmC3ienG+p3TgLshPnA5mbObRs7mepeowTfh
	CekLGr1ahloiGKRQ==
X-Received: by 2002:a17:907:3e93:b0:c12:b68f:1a72 with SMTP id a640c23a62f3a-c169240e51fmr720302766b.24.1784498304106;
        Sun, 19 Jul 2026 14:58:24 -0700 (PDT)
Received: from nv-msd-x1c.mtdk.labs.mlnx ([212.60.125.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm379116766b.0.2026.07.19.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:58:22 -0700 (PDT)
From: Mark Ruvald Pedersen <wabsie@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Subject: [RFC PATCH 0/3] wifi: ath11k: isolate RXDMA page-frag lifetimes
Date: Sun, 19 Jul 2026 23:58:14 +0200
Message-ID: <20260719215817.2468580-1-wabsie@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145827_502363_1B0BB607 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

ath11k fills RXDMA rings with skb heads allocated by dev_alloc_skb().
Those allocations use shared per-CPU page-frag caches, so unrelated RXDMA
rings and other network users can place fragments with different
lifetimes on the same backing page.

On an IPQ8074-based Linksys MX4200, repeater/AP traffic made available
memory fall at roughly 12-16 MiB/min until OOM. Ring and IDR ownership
remained bounded while page-frag backing accumulated. Two ownership
captures found fragments from multiple allocation origins on 86-87% of
the final tracker-visible backing pages.

This RFC:

  1. fixes an existing no-op alignment attempt on empty RX skbs;
  2. makes sequential external IRQ/NAPI lifecycle transitions idempotent;
  3. quiesces non-reset crash recovery before DP teardown, gives each
     RXDMA ring a private page-frag cache, and drains it after the ring's
     DMA mappings and skbs have been released.

No RX buffer or ring sizes are changed, and the existing per-buffer DMA
map/unmap lifecycle is unchanged.

page_pool should also be viable, but it is not a mechanical allocator
substitution here. These skb heads need about 2.5 KiB of backing, so an
order-0 pool uses one 4 KiB page per buffer. An order-1 fragmented pool
restores packing density but lacks page_frag_cache's lower-order fallback
under fragmentation. page_pool also adds fallible setup/unwind and
requires every skb return path to become pool-aware. This RFC keeps those
behaviors unchanged; I can prototype page_pool if that is the preferred
ath11k direction.

The AHB version was built as an OpenWrt backport and remained bounded in
natural-load, resident, and high-packet-rate pressure runs. PCI has not
been runtime-tested. The non-reset firmware-recovery path has not been
validated in isolation, so feedback on patches 2 and 3 is especially
welcome. The IRQ state guards make repeated sequential calls safe; they
do not add synchronization between concurrent lifecycle callers.

OpenWrt discussion:
https://github.com/openwrt/openwrt/pull/24254

Mark Ruvald Pedersen (3):
  wifi: ath11k: reserve headroom when aligning RX buffers
  wifi: ath11k: make external IRQ control idempotent
  wifi: ath11k: use private page-frag caches for RXDMA rings

---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af

