Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C42C4332F
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=69KHGCSIwZP2wWeCJ74Roxs53YpSkIWWPXusKoGc3Ew=; b=vglVffdhPJGj64
	PiIqFhdEva8E5g/qJiFRPjaBVpFPs96q5ziMfj2k7mPALjNb2rAropHIOd3UPllBRUqZKzakSUqe8
	o1TL+pwbCskpbdG3RedqJPRoWD7JIyYgBZw40qrj/11ulZgv8lduSGyijuIO/tm0YrOwTP1NxsFzt
	QN5u/vd1ervzXpVujqK+9hdLJgzC/gY5Xu8JUR3CK4acKxLawFx8m5ctQP6aX5Zepw3dx0RGf1oLb
	vVXlNnWqWoHXE7mGN2yBz5lnpvACFI1JYjc+bWaoYF/syhoc0RMA2AByEgCjOWlF6ZupNHWOeEa4E
	jsz+TVLYmw1LB8qt+uYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeQ-008Hpz-1K;
	Fri, 10 Nov 2023 10:22:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeM-008Hox-2c
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 10:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E52E619D6
	for <ath11k@lists.infradead.org>; Fri, 10 Nov 2023 10:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63945C433C7;
	Fri, 10 Nov 2023 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611725;
	bh=AMPU4LRyX+OkgHTzmLqYpkHVXivN15INxbcqDW+e4HI=;
	h=From:To:Cc:Subject:Date:From;
	b=f25paLpmrrOypJkE+2mOFhXwjwmYKnrZzre9uvCGJFfliCC3KoHtyiViJoXGT2cFi
	 b++rfZtaMcghghE2dF3fFBgMn+UB7HUphttZhtMwguSh9I3D6IJTbHHj9B/jPCdD1O
	 MV5Zya/1VfTCFtMACL/Yl7WhXzNgjoqP6VsS/kul3cyhGif5Ogyp2Sxmp+DP/r907u
	 wX23PukQ4ay1o7U69473/LRzGr7DOzWQMVLlLrs5PaxXAvsEZAPqE4TURk4zv4RwBE
	 +y2zB+cIyrJQIDcDORId+jQeoRTJLr4v5xKKpi8NnolmFYVPswBMa144n8zgG4Ljxk
	 M5keyYeN+XCrA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 0/8] wifi: ath11k: hibernation support
Date: Fri, 10 Nov 2023 12:21:54 +0200
Message-Id: <20231110102202.3168243-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022206_914641_2C1EEF00 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Currently in ath11k we keep the firmware running on the WLAN device when the
network interface (wlan0) is down. The problem is that this will break
hibernation, obviously the firmware can't be running after the whole system is
powered off. To power down the ath11k firmware for suspend/hibernation some
changes both in MHI subsystem and ath11k is needed.

This patchset fixes a longstanding bug report about broken hibernation support:

https://bugzilla.kernel.org/show_bug.cgi?id=214649

This patchset is marked as RFC as it requires changes in MHI subsystem. Also
this has been tested only on WCN6855, need to test also on more AP based
chipsets like IPQ8074 and QCN9074.

The patches are also available at:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-hibernation-support

Earlier versions of this patchset have been tested by multiple users with
positive results. Takashi also tested this latest version:

  Tested-by: Takashi Iwai <tiwai@suse.de>

Baochen Qiang (7):
  bus: mhi: host: add mhi_power_down_no_destroy()
  bus: mhi: host: add new interfaces to handle MHI channels directly
  wifi: ath11k: handle irq enable/disable in several code path
  wifi: ath11k: remove MHI LOOPBACK channels
  wifi: ath11k: do not dump SRNG statistics during resume
  wifi: ath11k: fix warning on DMA ring capabilities event
  wifi: ath11k: support hibernation

Kalle Valo (1):
  wifi: ath11k: thermal: don't try to register multiple times

 drivers/bus/mhi/host/internal.h           |  1 +
 drivers/bus/mhi/host/main.c               | 91 +++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c                 | 26 +++++--
 drivers/net/wireless/ath/ath11k/ahb.c     |  8 +-
 drivers/net/wireless/ath/ath11k/core.c    | 44 ++++++-----
 drivers/net/wireless/ath/ath11k/core.h    |  2 +
 drivers/net/wireless/ath/ath11k/hif.h     | 12 +--
 drivers/net/wireless/ath/ath11k/mhi.c     | 49 +++++-------
 drivers/net/wireless/ath/ath11k/mhi.h     |  4 +-
 drivers/net/wireless/ath/ath11k/pci.c     | 55 ++++++++++++--
 drivers/net/wireless/ath/ath11k/qmi.c     |  7 +-
 drivers/net/wireless/ath/ath11k/thermal.c |  3 +
 drivers/net/wireless/ath/ath11k/wmi.c     |  1 +
 include/linux/mhi.h                       | 47 +++++++++++-
 14 files changed, 268 insertions(+), 82 deletions(-)


base-commit: f24dee89bb8a7ef33c28e31632b1f3dd4e196413
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
