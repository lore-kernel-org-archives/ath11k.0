Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE8606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2hj/x41L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=alufipsx;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i7ZkG3fG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=; b=2hj/x41LJl8+/oFTvgKU+gFdS4
	AJ1Z0dJbnHM65ZsmWjzfxMn5QmcES7FUziyganQISjGYoKXZMkB8UAED4bkrDjEkkDNj8piVJstJ6
	r1hJXwAIFXc5mzjF0Pyea8jpdTk+W5bJQAnz9LMeR3L128/aGFKZrRSEyKe8dc9j8dWDr/3ONStBl
	2PWTwR+m3z22z2uBdFWFWktL+hIJsCNdKznsGsmKZRxwLxOr9Su/lhJ+87jR03AQJJyaAVqO1ODc/
	I9k/9mTlZlg5l0Td8uES0HQ+Jz8sVVNlAa3755QeB7n69N320G+eTT9nZrvdO3p5iogAZwaQOLJcs
	s121A6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC34-00000001UpS-1VSi;
	Sun, 22 Nov 2026 18:12:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC30-00000001UmN-0C4C
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=; b=alufipsxuZz8Y3ArBgRhEqUIDK
	L5U851JISXPQ4xcOKBpJl++KgcJ4cfuDxTZpv534XNUFyoh80r0mnQriRoku6rZG3R4ZDW82ykCNz
	FcipCeQQmByF9bXa7BW5YFoiHQarMsOItr7O+8dQ9j2jKbAlam7FipAuCklAbf/57lgFLqMGOugWP
	kef7dPm0Ev+vFjTGgosKvJgspXvtBu0yV4tZs++L4G5a8nFTI3rqfiMfZN+3InqDnq3V+zwLLzKxn
	zDVG4wIZhkGBY2jjP1oa2TEIvPGeoVf+UuRBDHEayqmfoFyHdinxEBTLbyC/VV0kagKWCiF1sQUJ7
	vRHAEJ0A==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2x-00000002PfN-1c09
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so2945186a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371133; x=1795975933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=;
        b=i7ZkG3fGP54SSp/+zNoiGh71w4zAjXopB+LqVlOyCSpGzxvyLse62i4sfcA4TCe0wP
         AFXTumiMKTiQwVpe56nicnkSI0USBM1xP9X6EFX+SbNz8td9yUow7X6J5Q8a88v+FwUz
         ahMdEfbjN8WVabdnl4skspD5QADf0uPxgD1MV1/3Ku1+64ihELNKXdvwMEecMMLHkCn5
         Egp+LUxbGyc5zHP9xvZv+ZJr975mjzwVoD3EDotpM6KUhMrvS5vNzKekUcG0+tusCNDW
         ZtGDGvc46GIoWKqfCFnNCOrbWwzFcwh90BfjqBKEolttVlxSC2AV6Z0OszDzPbqsRF3r
         vCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371133; x=1795975933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=;
        b=hKhfL0Z6/VidiF3VYXJl40zOuS55ZbCknEsi9KYGElgF8QUa/VUdWG4vBDVUzJ7Moo
         NQPQeFiEDdsqkozLBIhZzmp7SxLGyDrS3gvOo3l6crWeyBw6/9n0Lfyann6sMy0WCFik
         ote8DYObqGiMR2fjZb7fbCTWvU2b6VydfOaO3uetBZoD2fMV7TSLy8NI6esEUMQsbECA
         YdvWs/GJLPykQY7Vz0eOvAGdZQwC/v5qupt5uW5knf8FS9ACSBf5Pi2yhf6t/CEHlwmN
         6HGmm12p0rNnRtocf3JMQZHYpohfVay430kezK2vWH5+1PssSVALBHh/eZJmhjDokbIF
         LmZw==
X-Gm-Message-State: APuU4Z/ew4uZHS6Zw6pWNgEfeUyIp5ZY6QU+v+ZbSMJeL2kWtYj4UiuP
	AISQjOwna72LIoVT+8WPYjOYHsSLhc+tsc3TB7Itl1yCNKS2xvUBe0gFIbKqV9mX0A==
X-Gm-Gg: AZFdTZczP+A30YQ4bcSBo04ctbF2PCW4NVA0twWjHmO/T58k8Cru7uOcv34y0KLt4Jy
	irMTHEGcXC8QVle9jx/2LUznAFOhaeNPlYT0k7CQ/R1a9JuRyx1A9SFGnaLHG4wl8zmZiWwo5S8
	HgNu8Jw0kiYbIgn4W4l+QyMU7hzrAEPo0F6AFDIcCl75y0pod47Rsshd/G3XUWXrIpECRNrBlJO
	4kapoq8QvE5m74uyYmCH1AZ3Wm7bBNPfaAw3gdEFwKh6uuvQpzW0oOaRGuZ6qKJfz1w+apW4Am0
	l5o+uVsRnqYhq8nshHVzaRSJHIo90YMEBESWe896g91SAFZlq2utLSzSHbK1a49gOZgkh64QYon
	pieba3wHVZ3Er957QmhF5jcgFyqqe6oQJjIdPdLL5WZw2fIKmrKJENvz44HyxLNCQhhWmd7lag+
	GflG1p6buBJU71IKgCxRRYZxemHC6zjamtsqxIHoRP2+9jOHxduv9k11SUUQw/lk3+kCQhzfYNw
	R9wRrpfQntSdvij2YhnU0aLsXLWFXZRXa4LNT0gxf4rONt43NaZV2/vW06mP37vNBk6kB4cC/er
	5a9ugXhGx3lOzGZq/FRphrqI3CqoH4ocKyED/QEMC8CesleXTW5PEC0G0hBFgw9cWuKT6fu9EBX
	jXHff6lw08YaPG/q4v0X/M4mfukR2bx/WLx926e+uTTRYfXqIpJivYo8aA6KNpzpTbQRwiTZGqj
	SnXNbcmZLSukvDYjXSZiPBo7eq4+RNbfhXlNEoB6HS1QwZuMK3sB4mhbA48Vs9LSQ5NCR1vrJvG
	n2x7Ggrn9N1iQS30LUvC6OURQ7jbiYYK85Z/mXekyzqu2eF5UP1YLTh7CxTPL8zCi5poqukbd78
	emsxYFMs5WhOW/vXe/PUxOPuF/7s9Zzuek3ucothk8PPWepu9N9KaBwCWVpQ4F/JIq31MKBC
X-Received: by 2002:a05:6402:360a:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6ba37ea37c3mr6361595a12.34.1795371133000;
        Sun, 22 Nov 2026 10:12:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 0/9] wifi: ath11k: hardware TSO and scatter-gather with Ethernet encapsulation
Date: Sun, 22 Nov 2026 19:12:04 +0100
Message-ID: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181215_290961_E012926E 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -0.2 (/)
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

With Ethernet encap, the TCL of IPQ8074 can send a TCP batch from MSDU
extension descriptors: one descriptor per segment lists the shared
headers and the segment's payload, and the TCL writes the IP length, IP
ID, TCP sequence number, flags and checksums into each segment. This
series uses that for TSO and scatter-gather.

Patches 1 to 4 rework the TX path the series builds on: completions
freed and their peers looked up once per run, the TCL ring taken once
per dequeue run, TXQs pushed from BH work after the receive poll, and
the TX buffer ids kept in a table. Patch 5 sends TCP batches and frames
with fragments from extension descriptors, patch 6 offers SG, TSO and
TSO6 through the mac80211 encap features, and patch 7 takes batches of
up to 64 segments, as GRO builds them on a forwarding path. Patches 8
and 9 take work out of each segment's completion.

Only IPQ8074 sets hw_params.tx_tso, the chip this ran on; Qualcomm's
open-source WLAN host driver on CodeLinaro uses one layout of this
descriptor for the whole hardware generation, and each further chip
needs its own run before its flag is set. TSO and SG take effect only in
Ethernet mode, frame_mode=2.

This depends on Jose Ignacio Tornos Martinez's TX flow control series
[1], on my airtime queue limits series [2] and on patch 1 of [3]
(mac80211 encap features); base-commit and prerequisite-patch-id below.

Tested on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware WLAN.HK.2.12-01460)
as an AP with Ethernet encap, on OpenWrt's 6.18 kernel with wireless
backports 7.2 and further ath11k receive changes, with routed and
bridged TCP over IPv4 and IPv6 to one HE160 station, 3 runs per cell.
Over a full run of the eight cells the TCL segmented 2,609,390 batches
of 14,450,235 segments, and none was segmented in software. Forwarded
UDP saw no loss, and the kernel log stayed clean.

I used Claude (Anthropic) to help write these patches.

[1] https://lore.kernel.org/r/20261021060725.242681-1-jtornosm@redhat.com
[2] https://lore.kernel.org/all/20261122181145.1015729-1-julius@bairaktaris.de/
[3] https://lore.kernel.org/all/20261122134228.956044-1-julius@bairaktaris.de/

Julius Bairaktaris (9):
  wifi: ath11k: batch TX completion frees and peer lookups
  wifi: ath11k: fill the TCL ring once per dequeue run
  wifi: ath11k: push TXQs from BH work
  wifi: ath11k: replace the TX buffer IDR with a table
  wifi: ath11k: let the TCL segment TCP batches
  wifi: ath11k: offer scatter-gather and TSO with Ethernet encap
  wifi: ath11k: take TCP batches as long as GRO builds them
  wifi: ath11k: give an extension descriptor the number of its buffer id
  wifi: ath11k: count the segments of a TX batch without an atomic

 drivers/net/wireless/ath/ath11k/core.c     |   1 +
 drivers/net/wireless/ath/ath11k/core.h     |  22 +
 drivers/net/wireless/ath/ath11k/debugfs.c  |   7 +
 drivers/net/wireless/ath/ath11k/dp.c       |  30 +-
 drivers/net/wireless/ath/ath11k/dp.h       |  54 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c    | 976 +++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h    |  16 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |  46 +
 drivers/net/wireless/ath/ath11k/hw.h       |   1 +
 drivers/net/wireless/ath/ath11k/mac.c      | 156 +++-
 10 files changed, 1161 insertions(+), 148 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ff44eb6f1d673e75bc013e3ffc870d7d30252c17
prerequisite-patch-id: 2cde5e2a788f79e4b8c858a60ec11cd120b1b97e
prerequisite-patch-id: c86d3c9047c851f45b5d46398850c9d810d82258
prerequisite-patch-id: c3c9a2d5971c3e294bbef307df3befb0ff6678fd
prerequisite-patch-id: 013f4003b682991301e1f6e4c381b30ba7ef38c7
prerequisite-patch-id: a3d4787acbb5c0739313b5f098bfb19add947ba7
prerequisite-patch-id: 0118167889d6928ea3b7922b59cd92c629d8ee1a
prerequisite-patch-id: f04db5549c465332f7abd795b0b3ed0984ca3444
prerequisite-patch-id: f0e6efbc4fce124f2b272bc3329a1903fdfef382
prerequisite-patch-id: 46dda0c1aa2552cbd23ab02fc8478d76bc8c8e99
prerequisite-patch-id: 383da58791500dcdad9357108b629eb40b25585e
prerequisite-patch-id: 603dbe7c8c57bd2d47c82087c7b4c45331e50e74
prerequisite-patch-id: 2d25128eaea6ab74b040b0334d0ca670a030870a
prerequisite-patch-id: 510f2063d0566c28ff6f72e99d607dcfd61c0e4c
-- 
2.53.0


