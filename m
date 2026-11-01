Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840E9606A32C
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2JK1D2vJ;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Zbq8qJbI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=42uUpwxeFlIt+oVlZYyg3MehKD4BJExenLU7k+2MNBE=; b=2JK1D2vJOvDf3aAdas9Obr6LZu
	iTE8GbWghdCHgXL66Pk5wabhrGmiai3Vf43tZLBI8LZfYmEOqtnpE7RuO7zwaXy4pQF9UlS4NOaTx
	BJXYOGZaSdk4Mi2oX0bbc3Z2mdNvPkmEB5O6DN16nKVNPCFb/qdrBSbgUpOqG8c8l4GRQRFerC5y6
	eRgoI68yCaY/AOn0AfeXUkIYue54X8SnXFETcjTsQUAWkP/soJn9sV3gXYvaAlvqK5wBGGNxAgh/o
	gtqm278lQNm2fuEOciUo9AQ2vpAc1h+e7zQfVDRU2Ste9Kg5U9VOMrYYjrei7pSpYMPqVPRLqNVFa
	JG1TJVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9K-0000000EDxg-0vl3;
	Sun, 01 Nov 2026 12:59:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9G-0000000EDwt-0iFF
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 12:59:00 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 70E3D80710;
	Sun, 01 Nov 2026 13:58:53 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Esdo88_qE1eM; Sun,  1 Nov 2026 13:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793537932; bh=6sl3s0b1KzqpQad7r6W0dlFWZcquTtdY7WN+602Jpg4=;
	h=From:To:Cc:Subject:Date;
	b=Zbq8qJbIWzsun0y2XIFeg7/KX+NbKsNCqrjoDxGmkBzL4fwlXZVeSG+/CGbMdWyKs
	 pfUex37BHb4Q9aF/J5BgZ1USh/HD16pG7nXrSOBD84txLi6RgyqiWJNLMCI2XJA2Eh
	 AAAKLLYhMkyuD6LS+hpnAz675iNkC7fKpauVqQALKcDdH0USzWDGOX1EWGiznQh3kI
	 eEeClwNexVxFEpGaEdaxwVG/80XA9hrRIZjQ8jbqRCHlcawFQx4W/rGv2d/HDwx7Il
	 pwKXkr8bD2DardiPhwDEvtgW/L6NEr/rAPDnnhGvr/RnSXaql8MXJH6RVTjMKmXG4N
	 spEZQ3H9wql+A==
From: Florian Maurer <fmaurer@disroot.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath11k: more firmware crash recovery fixes for AHB
Date: Sun,  1 Nov 2026 12:58:00 +0000
Message-ID: <cover.1793531790.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_045858_640461_E264C46E 
X-CRM114-Status: GOOD (  11.91  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three patches on top of Julius Bairaktaris' "wifi: ath11k: firmware crash
recovery fixes" v2 [1], for firmware crash recovery on IPQ8074 (AHB).

Patch 1 keeps the ext IRQs from being disabled twice when a recovery
follows a failed one. With 2/5 and 3/5 of [1] a failed recovery is
recoverable, but without this patch TX completions stop afterwards.

Patch 2 turns the "select RPMSG" of ATH11K_AHB into a dependency, which
patch 3 needs to depend on QCOM_RPROC_COMMON without a recursive
Kconfig dependency.

Patch 3 stops TX before remoteproc resets WCSS on a firmware crash.
Today a TX in that window ends in an asynchronous SError and a kernel
panic. It depends on 4/5 of [1].

Patches 1 and 3 were tested on a Xiaomi AX3600 (IPQ8074,
WLAN.HK.2.9.0.1-02146) together with [1], backported to
backports-6.18.55 (OpenWrt 25.12), with real firmware asserts under AP
and mesh load, with simulated crashes, and with a forced failed
recovery followed by another crash.

Not covered yet, both to be addressed separately:
- A second firmware crash 10-20 ms after the firmware is up again can
  make the QMI firmware start fail before the CE pipes are set up
  again; the next recovery then dereferences the cleared srngs in
  ath11k_ce_cleanup_pipes(). This is not caused by these patches; I'm
  reporting it in the thread of [1].
- A crash within the few milliseconds before the restart work clears
  ATH11K_FLAG_CRASH_FLUSH (see patch 3).

[1] https://lore.kernel.org/linux-wireless/20261018210153.1925962-1-julius@bairaktaris.de/

Florian Maurer (3):
  wifi: ath11k: don't disable ext IRQs twice
  wifi: ath11k: depend on RPMSG instead of selecting it
  wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash

 drivers/net/wireless/ath/ath11k/Kconfig |  3 +-
 drivers/net/wireless/ath/ath11k/ahb.c   | 63 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.h   |  2 +
 drivers/net/wireless/ath/ath11k/ce.c    |  7 +++
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 drivers/net/wireless/ath/ath11k/pcic.c  |  4 +-
 7 files changed, 76 insertions(+), 5 deletions(-)


base-commit: 7b14c8f4a9615579b09cbcdc4515b65ae6124753
prerequisite-patch-id: cd9f2849ade92e165f15fe3f887edabd1d06b6e8
prerequisite-patch-id: 3c9ba2aec0d93942448aba1dc5d26b632d519e5a
prerequisite-patch-id: 9a833c602db147b490fba6df590eeea3847f4877
prerequisite-patch-id: 6fd3e11242fb3ead65751e3cd9972c4d7c63f989
prerequisite-patch-id: 01e149ed860e5e40e79725580548ce4034f344b2
-- 
2.47.3


