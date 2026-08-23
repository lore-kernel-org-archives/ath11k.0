Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E7CC5DF81
	for <ath11k@archiver.kernel.org>; Sun, 23 Aug 2026 19:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AMG07QQWS+s9tSGkNXtvc6vnCfKc2sWGJhO/gRex6GU=; b=JiIuGrTuVYkIG2g4ppNUHmp9D0
	R3lwCXwY51nxrktJMUrI6hBhU0hZaP+Z0CaWPjHOJH0GXYX6CpE+gMmgUQOBPuuEKzO8d5nHh0bur
	3YSIBwQ0RV/9mJ3K4ZfvFIVPJdZLHB23Cu7CSUiH4pqt6XuxHuyo477IuaaHmTBmAU0CLcBVB858x
	h5FQo8iwNLfEupkEZqLFZ7bD3KeZbXZSuv0Zs5yh2QCno/f456foKTpyFauzuICNrzZZSej1V1Bxj
	RQ1G4ZcyLzYQLY1twhQChVISji2oJ/wISKf6B1Ac6XUGS3qqei9mmJ9UufuZ9q2oZyUDuelyKAb4b
	Gjv7xCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK5-0000000FZuO-1YzJ;
	Sun, 23 Aug 2026 19:57:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK2-0000000FZss-46Hj
	for ath11k@lists.infradead.org;
	Sun, 23 Aug 2026 19:57:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso4863209a12.1
        for <ath11k@lists.infradead.org>; Sun, 23 Aug 2026 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787515055; x=1788119855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMG07QQWS+s9tSGkNXtvc6vnCfKc2sWGJhO/gRex6GU=;
        b=La1Lnb2Ep0+4hFp7LulWl1KWSt02wKfbX0vaJGKjk1IK9EyWZsfl08wTniqnV5K1Vs
         Y91dEdaBZ3CTbPQp9qpjxb7wfyF68hGe9MTwbWNVAOaurJ2/5DPzxgQmMcyjvXt+hnQN
         s8Kp3NI/wyKjFCWhyeWPlgzyRmyDaRICeouaqfp7rjHkeRhlCZu6hJQDhO46Iu6PIjHX
         tQuEiJr1QqQfoM8HsY4+ZPFfRIc90WKS+RyWjr1NUC1mtGx7r1t63EgysVh591eSWHAh
         VHltoSV5KdRk4jtLE2izC6w2j3jML9ZtL07F6EmUTA7n0pOUstBZ2CGjmTCNCDC5Vf/b
         HxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515055; x=1788119855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMG07QQWS+s9tSGkNXtvc6vnCfKc2sWGJhO/gRex6GU=;
        b=UyOfVJ/dnYJaGngvowTxBcjJiE4Mib/qgm6/4TJ1CFcuE2pyI5RrBETwgBkt4PlUaz
         ZElc5tNRswxqd/FV8o7CFotn5bxYjCwuscjb9SJGGvnCo9WNc+QSbcV6JnWCGMcKuYua
         nkt1AqRPVVNlZjOmtPWFqjXLqJM88h8Rcmm7918WqqaC5d8VYllf5pZxr28uhman1GNc
         aooFi6271A5bNSPnlCu/3BA8UJZSBWANSV6fmmfV/MiB4QP3GJT9vyjNcPOxLUy3/OhW
         eCPyO++N7Sz8O6cm441qAYigLuv0rPVxQDPiI8h/0vd9y5DXeJ9eNz+cFOBVQeYc2FsE
         3q4w==
X-Forwarded-Encrypted: i=1; AHgh+RoWS3b15Ea4OdR+DRw7xgOa6xk4tBf4qR3o0nyBMUprC3lgqqT/kWDZBHEDl+3VjFeYFVfmNyY=@lists.infradead.org
X-Gm-Message-State: AFuF++ljMXMb0wLhT9e6TACCbH4AqGkJqoXdazMerhv61ujfhqdWSaib
	SJmZXYoyKeFf0EYyVHIJR2sAOfmrut/DKKctlgxZmuUlNZTcSlJ4yFm+2G9HPbKJdJ27AGlAcRZ
	JnkSwZ45M
X-Gm-Gg: AR+sD11WAxJeWOeXmbx2e3q7/FpgdiYlLw/eBtj5dUi6+dSFKEtz2ou73y0e3/yPjku
	gr2QCJ5cSHtH1ddA2eYm9pi9SxCtoBr/SSb3cB1RiMAqIcty2zHj3dCoRaoEYkvEAMlFEwh6sOT
	/apR37qRFtniRibNd9UDrBZnGStZq1KDTubMKhsgtYtpTyL1c5eLIwIBMf3PW9tXEcB84kB1rdV
	14xyW8Xhovj2jBhEbZUFXVUONGFSQ7TmTF3R0d0tKnsotTeu9QjU7uBkDvyv/1u/OzcU8dii1NR
	Gvf5uA5e3+l13ZdDl1K+zOzvFl2HI4TPUTH9t/5Ru3L3uI62e6C3UGM5c1hQ7QQ9jDmZWxA3414
	gJKNHBcWv5bMeJJBcyEH2C5Pwq/4ekG+JpTeQdyoNsRT0GZVy579FpHdhlK5RF4pbPRTaiCr+IZ
	AtErBfl67Z6xaeMFEJYVQs8HTYrx5e3QQyxai4Z7be95Ejl7hEmznsoqYAA+IqRfjyGFwJ9P3no
	x3Z7YaZqFXbGHRX3la2RyHLYGe9EBI67OE4SLigiPdvtEjlwCTdc47C4jMeFuxsQ07Y3BR2iAmI
	vGzIJglmXdFekaKHHUD9yCtwxHfpM4Pd90biwZqtDnIiPNU/k4ScA4EIEF77+nE9WtxlEVywnoP
	UWpZlIsM6gBVczwTqjIDZEatyrXff1hEHhLl9fnS/yxC3MUYrjSEnHVyUcZ9mUZmafmYPJReU+L
	MDN4E6dmnKpQOA
X-Received: by 2002:a17:907:a49:b0:c21:4393:c41a with SMTP id a640c23a62f3a-c246a606cdamr2258331766b.11.1787515055057;
        Sun, 23 Aug 2026 12:57:35 -0700 (PDT)
Received: from Desktop (pd9513a95.dip0.t-ipconnect.de. [217.81.58.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8edsm889532666b.6.2026.08.23.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:57:34 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH v1 0/4] wifi: ath11k: enable airtime queue limits and fairness
Date: Sun, 23 Aug 2026 21:56:59 +0200
Message-ID: <20260823195703.49198-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_125739_065556_D1E3596D 
X-CRM114-Status: GOOD (  14.91  )
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

ath11k advertises neither NL80211_EXT_FEATURE_AQL nor the airtime
fairness bit, and every user of either inside mac80211 is gated on the
corresponding feature. Both are inert on this driver.

AQL matters here more than it would for a driver with its own TXQ
scheduler, because it is the only brake. ath11k uses
ieee80211_handle_wake_tx_queue(), whose wake_tx_push_queue() drains a
selected txq whole into the driver, and the check at the top of
ieee80211_tx_dequeue() is what stops that drain. Without the feature bit
mac80211 holds no backlog at all: on a saturated download every queued
byte sits in the hardware TX rings, where there is no AQM and no flow
separation.

Measured on an IPQ8074 AP against one HE 160 MHz station at MCS 11
receiving 280 Mbit/s, read from that station's own aql file: its BE queue
depth reaches 6356 us of the 12000 us default limit, and 2972 us when the
limit is lowered to 500/1000 us. Without patch 2 that file is not created
and the limits are never consulted.

Patch 1 converts the last tx completion path in dp_tx.c that still frees a
frame with dev_kfree_skb_any(), leaking the ack-status clone and its idr
entry. It is independent of the rest and carries Cc: stable.

Patch 2 advertises AQL. The rate its estimator needs is already kept in
arsta->last_txrate and already reaches mac80211.

Patch 3 exposes the outstanding-MSDU count the driver already keeps, so
soc_dp_stats can report how deep the transmit path is and not only when it
overflowed.

Patch 4 registers per-station tx airtime and advertises airtime fairness.
Unlike AQL there is no estimator fallback for the deficit, so the bit
cannot be set without the reporting. The fairness it delivers is coarse
for reasons stated in that patch, and it is last so the first three can be
applied without it.

An AQL enable was proposed once before and left at changes-requested for a
commit message that did not say why or show a measurement. This series
answers both, and needs no custom .wake_tx_queue: ieee80211_tx_dequeue()
performs the check itself. It is orthogonal to the in-flight
"ath11k/ath12k: implement TX flow control" series, which replaces that
callback for an unrelated reason and leaves the check where it is.

ath10k and mt76 set both feature bits.

Julius Bairaktaris (4):
  wifi: ath11k: free tx skbs through ieee80211_free_txskb()
  wifi: ath11k: enable airtime queue limits
  wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
  wifi: ath11k: report tx airtime and enable airtime fairness

 drivers/net/wireless/ath/ath11k/debugfs.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  3 ++-
 drivers/net/wireless/ath/ath11k/mac.c     |  3 +++
 4 files changed, 27 insertions(+), 1 deletion(-)

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.53.0


