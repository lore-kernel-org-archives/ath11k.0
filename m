Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479DEC4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Ae7k9lijBp0F/VP8Ro8qYWURLGpFUJnDIhv/puORMg=; b=LFQB9zwnXltk83
	12FuwYSEMCTYBg6pObzvwdA4XXMBxIN0OSX7r1MEaA76JUy73nafiBzXHVKtuhizxx3I2HiTliwnn
	h9UzvDvxcfoI7mbnoNT5kmpmSMtxl5wvhGwbP97JLbHAeVbpY1TV86DWBCWDzUSpLpu9XiUca1H89
	7OlS/9VRYy4NstuLzr4L+x4JO3JuUrCb4hhy4WEtO+o+vNsjxf6iRL/y09C+fKfw/cNpRDFNgYJL/
	VLw5avnG7jyYGN6+UCxQREaNyspRbUpK0DKa9gYNDCaNYryaHLhlBam1ARHl2/HyfJIGCbKigJFvb
	9D2dpFqrZzGSHOxs0FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLs-002xSH-00;
	Mon, 27 Nov 2023 16:20:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLS-002xBP-2w
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51F8D6132F
	for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 16:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500F2C43395;
	Mon, 27 Nov 2023 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102025;
	bh=Z3NXOof2eRrfFmizeCVpeB9sXefpEKLjnDTpPAKUtmE=;
	h=From:To:Cc:Subject:Date:From;
	b=QTY5d9bdSSSIFrsCI99T+x4ZtlVlyH+tYoAWxqM28/1oGVAA6Y9G0wh1KPC93PRQg
	 DX4tBfsyZ62TSGRKp+lmp2shWbbj7cd056knxIEGuIdcK5iumFru67i0Mf5OziAMA1
	 t+Xkd1TaJEBkAtna9alo8vp1EO8Qefty+yPCDq/0eGKMim1WkMXjCTEv/HrX866P9Y
	 6N+4mA3g97SbfBavsTr0wt9bACzC+YxFAzSHN5ukKRh1RHnH/NrGjxWoA0ESBkeAef
	 LS3PFiyjt6aOoAe8/PV9Zo5RArQ4sa+SnySTKQU48aEPBFGL+4FI69flPcljhB8KuZ
	 m4IMSzu+/tLLA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 0/8] wifi: ath11k: hibernation support
Date: Mon, 27 Nov 2023 18:20:14 +0200
Message-Id: <20231127162022.518834-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_082027_059507_C148BC43 
X-CRM114-Status: GOOD (  11.65  )
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
positive results.

v2:

* rebase to ath-202311221826 (6.7.0-rc2-wt-ath+)

* 'bus: mhi: host: add mhi_power_down_no_destroy()': fix null state string for
   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE

* 'bus: mhi: host: add new interfaces to handle MHI channels
  directly': fix typos in comments

* 'bus: mhi: host: add new interfaces to handle MHI channels directly': honour
   initial autoqueue configuration

* 'bus: mhi: host: add new interfaces to handle MHI channels
   directly': don't prepare/unprepare MHI devices that don't match
   with a MHI client driver

* 'wifi: ath11k: remove MHI LOOPBACK channels': remove LOOPBACK channels for QCN9074 as well

v1: https://lore.kernel.org/mhi/20231110102202.3168243-1-kvalo@kernel.org/

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

 drivers/bus/mhi/host/init.c               |   1 +
 drivers/bus/mhi/host/internal.h           |   1 +
 drivers/bus/mhi/host/main.c               | 107 ++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c                 |  26 ++++--
 drivers/net/wireless/ath/ath11k/ahb.c     |   8 +-
 drivers/net/wireless/ath/ath11k/core.c    |  44 +++++----
 drivers/net/wireless/ath/ath11k/core.h    |   2 +
 drivers/net/wireless/ath/ath11k/hif.h     |  12 +--
 drivers/net/wireless/ath/ath11k/mhi.c     |  77 ++++------------
 drivers/net/wireless/ath/ath11k/mhi.h     |   4 +-
 drivers/net/wireless/ath/ath11k/pci.c     |  55 +++++++++--
 drivers/net/wireless/ath/ath11k/qmi.c     |   7 +-
 drivers/net/wireless/ath/ath11k/thermal.c |   3 +
 drivers/net/wireless/ath/ath11k/wmi.c     |   1 +
 include/linux/mhi.h                       |  47 +++++++++-
 15 files changed, 285 insertions(+), 110 deletions(-)


base-commit: 16a212b4f33c4edd9ce9a9e0953b5389216e8ed9
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
