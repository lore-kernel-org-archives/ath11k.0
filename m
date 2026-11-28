Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868D60A2619
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLIDs3m+;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zO/rdoX2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=; b=zLIDs3m+kz9gD4MPFKVFnnbEZP
	lJG9kSPbCNAcNBfDbsQgFLx1mTKKPAVDjNJcwmD9aitTF4rUHNGAQJTj0G+ub3OhfQjmSnBXMiPax
	nmO4iVkpCy6ii76jLHA0eg3Neod3wbpknSbNaYtCo7PSxofiulYUhwGbR6xMMVmp0ysbLiFXQJF+s
	W5IbvrK6zxPUOoyFn8j4L6MZscVHUf6Og+PiRdU2bA/uhfH+B5ya+LA9Xok9x2lWmovy9FS77BBor
	5/Q+Ny5xTWLf0WHXVaA8abFNlnm3+FZP//DyH0m9CLD5DqJsa9CzUT7NsAnB9KqV3b0QCe5zreaYa
	/M4HK0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtm-00000000wKF-0HG4;
	Sat, 28 Nov 2026 16:03:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKti-00000000wHr-3Dnp
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c51a02ad3acso663674266b.1
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=;
        b=zO/rdoX2Mos2rsO3bPb2J677Ha5JDzQm6rH8hcWLPfTzFSPZXTlTHMS9id+5R+BVR0
         rGFxR6ay86FsNjX257UL+XP9/qpIRFkDVwFK3Z3GmPzbGSpsIFcxpQS5UcIZNrVo8+/9
         Eqv5auzppJHpXTl/I5f30XVPnTNcxsvCGCSEuOEWcns5wlNg3CNtEIkK3wuMIbIo/Uot
         CLvPOQ8C32L4OR0episZO0BsXdSuX0mPGMtetKm4gxXqDkWKaU9zjM9MVuM5D9fQTAzg
         V9X10NY/c3QhGZcsQxVTzOcxCi0Oi0ctC+tGxyfOxMUBUEjSuctHku46lidrCKwJHPMP
         t39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=;
        b=Dm1Pb8/SCLyEOyPPE1jcOlAZrGGeTYPhAkWJ+NhxDPjmahTE66wXAS1S5luUqq27em
         K1ZobSF6kq5buGg2RA1VSf0JOjR1eWk8piyhuPyPAaP146/7KqSkeMfRkJY0ZtkEOJP6
         ZSMvo3RZB1wV5tQ6AOxZqzFuO35JWHGjD47mv9jXDLWOJZLFWJpNjm4Hxt72Lmcrl7YX
         GLZad46Wt/emkGqELZyWWVwsPu5ciCXHpnmDPTp5gxxrt7AVzksUWXJuiPevZCkUG7bv
         SeyjqMiQeS5cA8qNUN62EwS2El7OZDIEREI1l2fFgcvrPNeKp2LjanlwAgXzxdiz5B0b
         fP3A==
X-Forwarded-Encrypted: i=1; AL+hErGZRKDOXiTFI9v00C8GU9vWk3lo7zObgCL3PsMcjDT+47yVR+W7petIPJO7o2ga+Cf9S89beK4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/cbwmdbrdYya/odCqJIPGfIWdoWM2QsqeSeqtz/uIldnzKtX3e
	lxPpIxtQzMs2NJ+A8cG6ysq3/SzjlCRsAZW+zKYa1DKr+e/cL9JYVq0jcTxrgeLrUA==
X-Gm-Gg: AZFdTZfnXd1YA6hYgyF5HbdChrW7MMCuubveO/T4NCAuL2l/emQKs6ytGwXHHk8cy9l
	MYra29e7iqYoqusGMpWbVanNHIA2SDy9XqKiZ2kCsxbF3Z1i65q3n4iwUHjxzI9YGQDzmDImBi+
	EI9ZVLRZbcYtIp+DgrMDxTkJ5yEyLHGYS7/r5xQQ0gCceg8aSEHotXEApoYp/7Fqzjw4k0TyAmi
	RGUdnrDOcMS/EvyZQO7ZJbwUxtCCzIk6IJ14pCO14FKBGlhn7ncp8EMYU8Vf4zfV+vhmjQDzd6B
	0BsKxnM6YP5Tdq5N+sj4xw7bajMMjZ080jhnOEuqEO9eXhmemb0syVdJeQq/v6hvrECxDJX5jCI
	OyhsBeCm/Jln28TLTXZ4E81T8nzIQWbym/pj4mVVPC1WC9TuccvOMuvdnjZYCBEkwodolwDWVz7
	SYvDZ5SpNvGk8Rnmf1B7Tjp68lzpOgq2ZOagNaL4oymhCCnE+h1rUu6mdK9Tgv0Jd9mf/dzqpHf
	GMV5z9rlVij5A1ldepc+VP7wy/IPpgE3jycEZiklBOeFkQ5eLXpHbiNRfU62ncattJybVr+MD1O
	Gc/n6wpKZRAgtP+GFQQHcts6KoimI+gmm62pnWNjJtJY6ObUf/D1RcjUp0tsrfOPxmX/HYXS2yg
	t4GgZ4jWX8ktWO1PzR4YTwBu4LaHkmMG/FfsRFjJP2cdvZyx/ruv0mUM4TJ+q4R14yA5x9yhtCG
	L6wMReWc4+DC4POsn/mcLIwuKtiUNG4FzPr/crrAsJ/fOaEE2GAYczDSE+J80x1q5sz+iUeFYS4
	DVuc/7olChpEk8A3D2EPVIPLUDmutilhJ+DCOj84GiEvJnoC4IHdfd6o1uDKZqMu/YpYPzTq2PZ
	iPqoOJFjqylR8A==
X-Received: by 2002:a17:907:2d0e:b0:c51:e820:661b with SMTP id a640c23a62f3a-c51e8209357mr203301766b.27.1795881812763;
        Sat, 28 Nov 2026 08:03:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 0/7] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sat, 28 Nov 2026 17:03:28 +0100
Message-ID: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080334_842191_AC6D4C56 
X-CRM114-Status: GOOD (  14.74  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 4 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it in a series for ath-next that lets the TCL segment
TCP batches, which depends on this patch. Patches 1 to 3 fix the AQL
airtime estimate, which patch 4 uses to segment a GSO frame for a slow
station.

Patches 5 to 7 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 5 adds the field,
6 and 7 fill it in ath11k and ath12k.

What the fixes for released code change:

- Patch 1: a station that sends at a low rate to an mt76x0, mt76x2 or
  mt7603 radio, which compute RX airtime over a whole A-MPDU, is
  charged a fraction of its airtime and gets more than its share under
  airtime fairness. CVSS 3.1 3.5 (AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L).
  Found by the hosted Sashiko review of v1.
- Patch 2: every VO frame an AQL driver (mt76, ath10k) sends at an HT
  or later rate is charged less than its airtime, so the VO queue holds
  more than the AQL limit. CVSS 3.1 0.0, queue accounting only. Found
  by an LLM review (Claude).
- Patch 3: an estimate of 65536 us or more is charged modulo 65536 us.
  Without patch 4 that takes an A-MSDU of about 8 KB to a station whose
  last rate is 1 Mbit/s. CVSS 3.1 0.0, queue accounting only. Found by
  an LLM review (Claude).
- Patch 5: the per-TID RX MSDU counters of a station count every 802.3
  frame on TID 0. CVSS 3.1 0.0, statistics only. Found reading the
  802.3 receive path.

None of them touches memory safety, and nothing short of the patches
avoids them.

Tests, on x86_64:
- A KUnit test of airtime.c (not part of this series), HT MCS0 20 MHz.
  wireless-next fails all 5 cases: 65536 bytes come out as 2834 us
  instead of 80658 us, the VO and A-MPDU estimates of 1500 bytes are
  both 1912 us, and 65540 us is stored as 4 us. With patch 1, 3 cases
  pass; with patch 2, 4 (VO 1932 us); with patch 3, all 5. One run
  each.
- mac80211_hwsim in QEMU with a local change that sets encap offload
  and encap_netdev_features (not part of this series): a netdev created
  as station, changed to mesh point and joined to a mesh, TCP for 5 s.
  v1 handed GSO frames to its ndo_start_xmit and skb_checksum_help()
  warned, in 2 of 2 runs; this version hands it none and nothing warns,
  in 2 of 2 runs. A P2P client netdev has TSO and SG with this version
  and had neither with v1.
- W=1 builds of each patch for x86_64 (gcc) and arm64 (clang 21), with
  no warnings.

Changes in v2:
- New patches 1 to 3.
- Patch 4 (v1 1/4): the encap features are taken away per frame on the
  non-encap netdev ops, the AQL fallback keeps SG, a station without a
  usable rate gets its GSO frames segmented, kernel-doc for an
  encap_gso_max_segs of 0.
- Patches 6 and 7 (v1 3/4 and 4/4): read the TID before the copy of the
  rx status overwrites it, and report frames without QoS control as
  such.
- Rebased onto wireless-next 18d0bedbb5f0.
Details below the --- of each patch.

v1: https://lore.kernel.org/all/20261122134228.956044-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (7):
  wifi: mac80211: compute the airtime estimate in 64 bits
  wifi: mac80211: use the ampdu argument of
    ieee80211_calc_expected_tx_airtime()
  wifi: mac80211: clamp the AQL airtime estimate before narrowing it
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 14 +++-
 drivers/net/wireless/ath/ath11k/hw.c          | 25 +++++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +
 drivers/net/wireless/ath/ath12k/hal.h         |  1 +
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  8 +++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  9 +++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  9 +++
 include/net/mac80211.h                        | 23 ++++++-
 net/mac80211/airtime.c                        |  9 +--
 net/mac80211/iface.c                          | 28 ++++++++
 net/mac80211/main.c                           |  3 +-
 net/mac80211/rx.c                             |  3 +
 net/mac80211/tx.c                             | 65 ++++++++++++++++++-
 14 files changed, 188 insertions(+), 12 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0


