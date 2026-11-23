Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536D60724EF
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1weypBOd;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ZGssjbvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=; b=1weypBOdTRg3LGzdSK+hBo1nxa
	jYJPWPm0EGuj/LEv/p7SKh2wFRFMo3D06uN2jhk4Ohr8W6hBh7hMwFSDNyYMcUUnj93t+E9cme1Zy
	S56sV8buIjmfig+EQJy7o4UVBrc1yvDQxjzhQoAoZrFS3Td8wXAMj3mfMjXnSct6T0czKCLpe623G
	Hrex73gdWMQ57DjAgVWs+HWaeRiLBeXKu39p9VmPtaFIqqcuXH2+VobMdLC/8vcJ3FXsq0Q8Vww+D
	JiEiyjVJkPnWNFRQExlsJxqAlAkEuiQU+bLXhO5Fc6Frw7PwyHaeHrfOU8ObBt2g8J1ss6UtmjLG0
	e7ABlXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIj-00000003bsa-0rhP;
	Mon, 23 Nov 2026 13:41:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIf-00000003bph-3naw
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so3824018a12.3
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441299; x=1796046099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=ZGssjbvralRJy64mVDsjl2X6IcACPqV4YXIXQGfCkSAbHPEyTVc8yGjY6l9hSIj9u7
         866FTPVi/qWwgRpHoOPnppWosn7eEJ5eEBD033bwyIELVI68oddhhtI/2sNcwz/wQgSH
         G14FVgkHupyumNM88gojTR45gqpj/DohQ//d2jRbHEjKTe9cdYsq1j9M9yJrbkDMt07Q
         Q//CgMPZ4ETcfTWIkCYqIPpKg9Rp7YXR9LTb6/rS8RaHy27aHpoy4y1ppvpBQFqhgv5N
         Ut87pSnbCCc74mQwdGCwcE7KS9HIvX/Fs7td/pQOOrzEd9cDuY8q2y5SAq4XiGTv3Rxb
         AaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441299; x=1796046099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=BmipGFNMyt5TFkxKdV8G0SVsf4M00Cxpo//yvugyno8zDVnWSyytPCuI0QyR3UbYoa
         822EdJm9EFnDbIM02SPMk+UZPLFLbElT2vVz4a+zRW4A28HuLOlsGGleIchnhsz6WeJv
         NZebQ959Dy4b3FcjDnaBFew42ghpiO4UjnCONvskyhhXhhEExM3EcwmlbzqqiDk1Gh3S
         sj5LAOhUfA5jM8oRMmfOWLeFvBDI8LipepDpJx4qvzQrRBkqkpMedIwnseOE6OrXWAHF
         OGq63jlR1qUQpXWHRrq6IdR7omnrWsPNYXPDSPBrSQSHCrwF0zUMrdPjB+zrSuffD+da
         FKow==
X-Gm-Message-State: APuU4Z/5JUCq/LkQj16tKz4cQQbhktx5RfZ8TRaqM5Db1yYDNCJwTZZT
	zxj8tYR1lly7COzCYxH2CfbJEFw1AVWdv2lEPGEsCOAIOs52ui5xaTIxTRUdiguqHw==
X-Gm-Gg: AZFdTZfqPLG+ZHSVkmmCwjMYu7r63C9CiDSL6kWypL+iJOLQrf7nxIuv9mEmGymQyDw
	pi4d6/Nb4USmJKASyZ1Z/Eiji8XUUoHPqsuOF4DVsnI9BUhT+RMhjw5YZlMisUTOVAKLeDmKBy3
	x289hWgbV0O5zLTbg/iRKIM9UdfgYsxxTiyorXW5gr2uKwmsaeiEn+YKjt7ATydDiO4hHBowq0X
	uueLXnRYG4SxjAxqTK9SWi4YQ3zX59If1lcgLbb66AjdDHwyGAGGppLvt/sATk2pTm9jO+2mOMc
	SOhrUYWfyGAiX0UtZhwEl70gzqzppgkYad8Zs5pUB/c6AQL19xPmDkARXaYGqj7Fej65hUn4tcL
	WQlQ0pWCX96TDjgFuw07jfHFq3pW/IM/ru8avQqgcWkTfAuqy4KRfsKJVTzPr5R4F7MEr3iq5A7
	3Lg3l3FL70utmQfWWkIP3Wf81YmDUm8KCBvt/hqB7MEZHq3VHHOZw+ACrRyvmdFG4LqOr+KDuIB
	AUJBZxts/MHYCFCbj0iqYu6cQ+bN/A8WP+SgLZvcBhMK76AEcqI+8/UmIVad9Noy37pTNXubrxC
	XkbBReivsX079IWY1WJ0dtVWnIUAl/jRQ1T7XFrS/taRrM6PTnOXiuR1hF8dOrAisiHUna1svdv
	rpMbV2ZqLp/3WmTASkfcaov+23q4s5P2DWaZDGzHanvX36tE5hPqs3EeI7NfHVpTSRb6FYbveBf
	BZNwqR31AcFLGgUhXD/QGjtioHFdQej4WDSEKJyxfdCk0u0oKAB7j4EGxqr23JS9J5NKMb/dLnh
	MbPeiv0b6S1w8l2WOSNjT7yIDES00POsicjWm1uDvTgrGQd9v7l1NwwLw41ltFcV5P4UYByzFXT
	76e0Up+yLELZIWI3hmy8/LqBsUC8Iyzc9wg1X57dpdsz/bMrLj+0NU/bF9k5rohaA46Mkdm3rw=
	=
X-Received: by 2002:a05:6402:4501:b0:6b7:b872:27a0 with SMTP id 4fb4d7f45d1cf-6ba37e84aa9mr7855224a12.21.1795441298551;
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
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
Subject: [PATCH ath-next v1 00/10] wifi: ath11k: cut the per-packet cost of the RX path
Date: Mon, 23 Nov 2026 14:41:27 +0100
Message-ID: <20261123134137.718575-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054141_979911_A1633467 
X-CRM114-Status: GOOD (  14.09  )
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

The ath11k RX path spends a part of its time per received frame on work
that the hardware or a cheaper structure already provides: an allocation,
a DMA map and unmap and an IDR walk per buffer, a peer lookup done twice,
a cache invalidation per ring entry and per full buffer, bottom-half
toggles inside a region that already has them off, PPDU stats TLVs nobody
parses, and a flow hash computed again in software. This series removes
these one at a time:

1-2 give the refill ring a page_pool and replace the buffer IDR with a
    table of ids;
3   asks the firmware only for the PPDU stats TLVs the driver parses;
4   sets the skb hash from the receive engine's Toeplitz hash;
5-6 sync the new entries of a cached ring once per head read and
    prefetch the buffers of the entries ahead (cached rings only, that is
    IPQ8074, IPQ6018, QCN9074 and IPQ5018);
7   looks the peer of an MSDU up once;
8   drops a nested bottom-half disable in the reap and refill loops;
9   invalidates only the part of a page pool buffer the device wrote;
10  takes the buffer table lock once per chunk of refill buffers.

None of them changes interrupt placement or adds work on another CPU;
each takes work away from the CPU that already handles the frame.

The profile shares in the commit messages come from perf on an IPQ8074
access point (Xiaomi AX3600, 4x Cortex-A53, 5 GHz HE160, one station at
850-900 Mbit/s TCP), one run each, with OpenWrt's version of these
patches.

On a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1) running OpenWrt's wireless
backports with the RX fixes, with one HE160 station at 830-940 Mbit/s
TCP and 3 runs per cell, the series lowered the share of the four
cores the traffic takes in the cells where the station sends: bridged
IPv4 33.0 -> 27.6 %, bridged IPv6 32.8 -> 27.7 %, routed IPv4
33.7 -> 27.6 %, and routed IPv6 31.2 -> 27.9 %, which is within the
spread between runs. Where the station receives, the change was
between -1.4 and +0.8 points, also within that spread. The share is the time idle-priority spinners lose
on each core. Switching pktlog (lite and full) and the extended TX
stats on and off, adding and removing a monitor interface on both
radios, and unloading and reloading the modules left traffic and dmesg
clean.

The series applies on top of the RX correctness fixes https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/: its
4/10 uses the msdu_start_info2 accessor that series adds.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (10):
  wifi: ath11k: use page_pool for the RX refill ring
  wifi: ath11k: replace the RX buffer IDR with a table
  wifi: ath11k: request only the PPDU stats TLVs it reads
  wifi: ath11k: set the skb hash of a received frame from the hardware
  wifi: ath11k: sync a cached ring's new entries once per head read
  wifi: ath11k: prefetch the buffers of the REO entries ahead of their
    reap
  wifi: ath11k: look the peer of a received MSDU up once
  wifi: ath11k: take the refill buffer lock without a second BH disable
  wifi: ath11k: hand the CPU only the part of a REO buffer the device
    wrote
  wifi: ath11k: give the refill buffers their ids a chunk at a time

 drivers/net/wireless/ath/ath11k/Kconfig   |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   5 +
 drivers/net/wireless/ath/ath11k/debugfs.c |  15 +-
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +
 drivers/net/wireless/ath/ath11k/dp.c      |   9 +-
 drivers/net/wireless/ath/ath11k/dp.h      |  27 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 712 +++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  34 ++
 drivers/net/wireless/ath/ath11k/dp_tx.h   |   1 +
 drivers/net/wireless/ath/ath11k/hal.c     | 107 +++-
 drivers/net/wireless/ath/ath11k/hal.h     |   1 +
 drivers/net/wireless/ath/ath11k/hw.c      |  22 +
 drivers/net/wireless/ath/ath11k/hw.h      |   1 +
 drivers/net/wireless/ath/ath11k/mac.c     |  13 +-
 14 files changed, 765 insertions(+), 193 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0


