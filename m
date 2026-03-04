Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC5CEB7ECF
	for <ath11k@archiver.kernel.org>; Wed,  4 Mar 2026 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5O3Ko5mPIFpGsAMJYA4vIhkP7670Rgqn1lLiurHAd+8=; b=Qgj6wWXKIpEQUZ
	PHhK/vnHCJC18VmAhbwSinvao8oV8KwWDhG7rep+L+QDeJd+TZJpOdxksrgWFZ8kCYDas9cZp9YmN
	6tgXZiIKm0KofIwKL23/6fC6av/N5czaTUFktMGh0cQUvP/D6CmQiB08BiC2akGD/9b06XtVB17Br
	Z0a7JQ34RzJy/GdCbNiZ9nQ9kFHEcU5qeuP9bWAZpGcFnjb17MJCWBpV9xqRvQcPpbKBRBrRq9b6D
	JDy8bQ1IbU5OfO4CqptsH8gPcvAfxG2AS6REugZllSy6XhPfmZcPdM1hHcpVAnoSzqgrRLYrqp7H2
	69II84gnyMFkEVUQ2Zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxldu-0000000HCWF-1DJf;
	Wed, 04 Mar 2026 12:47:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlds-0000000HCV5-1CYT
	for ath11k@lists.infradead.org;
	Wed, 04 Mar 2026 12:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772628473;
	bh=VSlYb3du74hsNmTtTtO0NkW7h5OmhCaYzsaAbhsMwho=;
	h=From:Subject:Date:To:Cc:From;
	b=L4wShVIqz4qUu/Ek1Ogqw8KNpBuwjpLP/2K21tCGztyAPsGHKM2tHYQY7rUWx5lTH
	 Qg6Rq4rYkQhNxzvlCEkPkYKn9MoKcVrtHwcvoUN0cZXvBEi/qeK8GVU1o3Ep8dxisP
	 ek5TyQ9o8HqMfmt1U0t7rK2nAAdbGNSMjJvp8qruLFb06qkNK4VskpvnUD4UG/PTl9
	 bgxOhSUJt/neKI1fwHFaPBc/fv5GWpgz2JafJdCv3aE7pjZeVxjGgr4M34qdodW1Kp
	 /i30+s2Tzym8Gu/AexNit8y3NRQdQ4Dr3zE0A4AHQhoOssC/awwy6I0IOy+vXM9YO4
	 A+HYASDePimoQ==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:64f:0:a5a5:9171:d9e9:ce23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55D8A17E0454;
	Wed,  4 Mar 2026 13:47:53 +0100 (CET)
From: Matthew Leach <matthew.leach@collabora.com>
Subject: [PATCH RFC 0/3] net: ath11k: Firmware lockup detection &
 mitigation
Date: Wed, 04 Mar 2026 12:47:12 +0000
Message-Id: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3cSSDEPDbN2c/OTs0gLdtMyK1GLdJAsDiyTTZHNjQ4skJaDOgqJ
 UsARQY7RSkJuzUmxtLQC25+UTagAAAA==
X-Change-ID: 20260304-ath11k-lockup-fixes-b808b5c7318b
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_044756_475702_2327DE89 
X-CRM114-Status: UNSURE (   8.26  )
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

When sat idle for approx 24 hours, a user experienced a firmware lockup on a
ath11k chip, resulting in the following log output:

  systemd-timesyncd[558]: Timed out waiting for reply from 23.95.49.216:123 (2.arch.pool.ntp.org).
  systemd-timesyncd[558]: Timed out waiting for reply from 23.186.168.125:123 (2.arch.pool.ntp.org).
  systemd-timesyncd[558]: Timed out waiting for reply from 64.79.100.197:123 (2.arch.pool.ntp.org).
  systemd-timesyncd[558]: Timed out waiting for reply from 69.89.207.199:123 (2.arch.pool.ntp.org).
  kernel: ath11k_pci 0000:03:00.0: failed to transmit frame -12
  kernel: ath11k_pci 0000:03:00.0: failed to transmit frame -12
  kernel: ath11k_pci 0000:03:00.0: failed to transmit frame -12

  [...]

  kernel: ath11k_pci 0000:03:00.0: failed to flush transmit queue, data pkts pending 564
  kernel: ath11k_pci 0000:03:00.0: wmi command 20486 timeout
  kernel: ath11k_pci 0000:03:00.0: failed to submit WMI_VDEV_STOP cmd
  kernel: ath11k_pci 0000:03:00.0: failed to stop WMI vdev 0: -11
  kernel: ath11k_pci 0000:03:00.0: failed to stop vdev 0: -11
  kernel: ath11k_pci 0000:03:00.0: failed to do early vdev stop: -11
  kernel: ath11k_pci 0000:03:00.0: Failed to remove station: xx:xx:xx:xx:xx:xx for VDEV: 0
  kernel: ath11k_pci 0000:03:00.0: Found peer entry xx:xx:xx:xx:xx:xx n vdev 0 after it was supposedly removed
  kernel: ------------[ cut here ]------------
  kernel: WARNING: CPU: 0 PID: 1229 at net/mac80211/sta_info.c:1490 __sta_info_destroy_part2+0x14e/0x180 [mac80211]

This patch series:

 - Fixes a bug in the core reset logic which could cause a second redundant reset
   after the original reset completes.
 - Implements the error correlation logic and queues a chip reset when detected.
 - Adds a simulation to the simulate_fw_crash debugfs file to test the
   detection logic.

Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
Matthew Leach (3):
      net: ath11k: fix redundant reset from stale pending workqueue bit
      net: ath11k: add firmware lockup detection and recovery
      net: ath11k: add lockup simulation via debugfs

 drivers/net/wireless/ath/ath11k/core.h    |  3 +++
 drivers/net/wireless/ath/ath11k/debugfs.c |  7 ++++++-
 drivers/net/wireless/ath/ath11k/hal.c     |  7 +++++--
 drivers/net/wireless/ath/ath11k/htc.c     |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c     | 28 +++++++++++++++++++++++++++-
 6 files changed, 52 insertions(+), 5 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260304-ath11k-lockup-fixes-b808b5c7318b

Best regards,
-- 
Matthew Leach <matthew.leach@collabora.com>


