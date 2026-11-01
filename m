Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D514D606A325
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bMYozYg;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=hsHTIJG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sR5ie4tJ1WjHnkmUfnOmHpKTm3TzECiPGao53FlKIfo=; b=3bMYozYgRWPkKJ
	fn7P3RWNLNAs9W9Z7jaOd6a0OkFSLTlRXm2h9utb+WoB1X5JXnwRdyZ+ipGO0nHSd+LUd46ymzYBx
	7rAlTScAUc1RqClzGgiIUNMl5K8g/6Bq70H3n+6InHCDM/GVgoxl9b5l+efX5FkFSeCHmLXkUftl1
	bDvUJujSRsvVtyk39OFPN0ToAs3vL88grBIsGZ7CFhN690G98tIQixU0QGhp0tbPHvVpkAWo9ogmV
	8JO/DmaZAI1Clz2UNrgZe4vdzu9QP0pytms0cP0wc2DmuSjqYhePsitP0u8TfZGAK8iIzNF+d0I6l
	MoOSf/DvGR03jPOiznXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVQr-0000000EWi2-2L5Q;
	Sun, 01 Nov 2026 13:17:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVQo-0000000EWhf-3r7L
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 13:17:08 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D77EC8086C;
	Sun, 01 Nov 2026 14:17:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTqhoqVt2ltI; Sun,  1 Nov 2026 14:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793539023; bh=Cap59tPzgyoMi8G0Vy10GjN4ejlXEnh4z+J/nWuu/zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hsHTIJG/nC9YT8EfoYvlmP1+2yioi8Ciw00gShVGkdkD2770WfXmIhjF1/qnLbCsI
	 B8XVD4Z/rw8ksH+SnAMkrFfMBmlc+dUfalWP94mPsehMO3fKjvlfgsHg2I2b3i2ROH
	 l3YbFiMAbtv0YB7oAqw0B817Xsn6RJ+jK89Yggprva6QM+gSL7NrFYtXuZvx3Vi32W
	 jI7xP28prkwH7e6uTROXhDyqPz25IHkeu8NgndPwWXqmn+CZsYQGHJXZfnt5TuunBz
	 J3HZLChSIRc5C7XwCvXFPboel0m8POQ8y/Emyz2hON/LAiebuLmmOtoqw7lRKLkp+h
	 DHzbIbyX0ECsQ==
From: Florian Maurer <fmaurer@disroot.org>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery fixes
Date: Sun,  1 Nov 2026 13:15:50 +0000
Message-ID: <20261101131550.1890062-1-fmaurer@disroot.org>
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_051707_104223_C4B5959F 
X-CRM114-Status: GOOD (  14.57  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julius,

I have been chasing the same recovery problems on IPQ8074 (Xiaomi
AX3600, WLAN.HK.2.9.0.1-02146) in a Freifunk mesh network and ended up
with fixes very close to your 2/5-5/5, so I tested your series instead.

Setup: OpenWrt 25.12, kernel 6.12.112, your series backported to
backports-6.18.55 on top of the three ath-next IRQ fixes (a7ab5c835e42,
f7a74e131d3f, e56c9d429ba0), plus two fixes of mine that I posted on
top of your series [1], together with a Kconfig prerequisite (A: stop
TX before remoteproc resets WCSS; B: don't disable the ext IRQs twice
after a failed recovery). AP and mesh vifs on both radios, real
clients and mesh peers.

With your series + A:
- 10 simulated asserts (debugfs) while survey and station dumps are
  polled and downlink traffic runs: all recovered, no WARN/Oops.
- 10 real firmware asserts under load (5 AP vif, 5 mesh vif),
  triggered by an out-of-tree patch that sends WMI_PEER_FLUSH_TIDS_CMDID
  with all 32 TID bits set: all recovered, no WARN/Oops.
- Failed recovery (forced via a test-only knob) followed by another
  crash: the radios come back, but TX completions stop, TX fails with
  -12 and the firmware asserts again repeatedly, 2/2. That is what B
  fixes.

With your series + A + B:
- Failed recovery followed by another crash: recovered 3/3, which
  your 2/5 and 3/5 make possible in the first place.

One case is still open. It is not a regression of your series: before
3/5 the same failure freed the srng memory and crashed in the same
ath11k_ce_cleanup_pipes() path. If the firmware crashes again while
the restart work is bringing it up, the QMI firmware start can fail:

  remoteproc remoteproc0: remote processor cd00000.q6v5_wcss is now up
  remoteproc remoteproc0: crash detected in cd00000.q6v5_wcss: type fatal error
  ath11k c000000.wifi: fw_version 0x290b84a5 ...
  remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss
  ath11k c000000.wifi: failed to send firmware start: -104
  ath11k c000000.wifi: failed to start firmware: -104
  ath11k c000000.wifi: failed to reconfigure driver on crash recovery

That recovery fails after ath11k_hal_srng_clear() but before
ath11k_ce_init_pipes(). The next recovery then tears down the CE pipes
on the cleared rings and hits a NULL pointer with BHs disabled (under
ce_lock):

  Unable to handle kernel read from unreadable memory at virtual address 0000000000000000
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Decoded call chain (6.18 backport, the raw trace has wrong symbols
for the stripped module):

  ath11k_hal_srng_access_begin       hal.c:834
  ath11k_ce_poll_send_completed      ce.c:706
  ath11k_ce_cleanup_pipes            ce.c:884
  ath11k_core_reconfigure_on_crash   core.c:2403
  ath11k_core_restart                core.c:2574

Reproduced 2/2 by triggering a remoteproc crash 10-20 ms after "is now
up" (measured 11 and 21 ms), with your series and my two patches
applied. So 2/5 and 3/5 cover a recovery that fails once the rings are
set up again, but not a failure inside ath11k_core_start_firmware().

I haven't tried a fix yet. Since the CE-layer guard from v1 was
dropped, one option at the core level would be to remember whether the
CE pipes and DP were set up again since the last teardown, and to skip
that teardown in ath11k_core_reconfigure_on_crash() otherwise. I can
try that if you don't plan to cover it in a v3.

For the series:

Tested-by: Florian Maurer <fmaurer@disroot.org> # IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146 (backport to 6.18)

[1] https://lore.kernel.org/linux-wireless/cover.1793531790.git.fmaurer@disroot.org/

Regards
Florian

