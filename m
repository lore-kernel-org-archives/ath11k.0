Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B405606A330
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L8UMB75i;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a58evAcO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ai47clIcETbb5x0K9gRtv2yXoRDAA5PFtwgsEioEvA8=; b=L8UMB75ih+X5c80faziX133zrF
	VhYYIBcBJkpx7oaWC4ard+JB2FMtdd5qE35E6SDdCc53OskrahSRieowSgUqtc4P+a9aqlQVfyIUD
	yQQhXiv71Po4bqQUwvomtAEt1eVnY58JKsfPEvhUUmhLzXd//0iM3XKsBEa2nz1ISZ3/NQYdphb7b
	nblovgsOHgPg6SvNYfnZHLG7FBifxBjMuqModCLEl6grdXTkgb78c/5AQj27tNltdHFv2RlMczR6e
	pDra/r+87IOL4vzQf9Ib8cHSHASbZq8iparJCmQcrI12zyw6GY5gCP+Q202xWXAztGt4zZ8tQu334
	S11F1dKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM18B-00000006mxW-3KQq;
	Wed, 28 Oct 2026 10:43:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM18A-00000006mxA-3TFm
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 10:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56C9D4148A;
	Wed, 28 Oct 2026 10:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E7A1F031E2;
	Wed, 28 Oct 2026 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793184222;
	bh=ai47clIcETbb5x0K9gRtv2yXoRDAA5PFtwgsEioEvA8=;
	h=From:To:Cc:Subject:Date;
	b=a58evAcOZtq4Xq8lH58Pan7Kmgvizf9cIKwrCLFphCLyrHOAghvhqpAGU4qz4uXBH
	 WkkNKBdhBli0KcZa8zXPgk8euCR4Kg1J1XH8e+5Q3+iclsvXdapV2pFuIWDwVNERBA
	 /HIeL3+zMcR69ZSaseCFSomQqigvqh4h40nMLEH8Vd4kEvzJ0Sq4pv1PQZzwrLu0h7
	 EtxrZg/USOO6DyIh4HUWiFfGhm8WmYUdlvHR8xoC41rkS+0iDtd5Tn8JtbITx/VuH7
	 h22jq8Q1wPL2ouVQSzOeZFtAf6iTaUHniir9cunX9Hm7/2wTuB5puvRTdH18L17ogh
	 TS+xJmUA+2reQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH] wifi: ath11k: Unprepare MHI on power up failure
Date: Wed, 28 Oct 2026 12:43:36 +0200
Message-ID: <20261028104336.1686334-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If MHI power up fails, for instance it happens due to a missing firmware,
ath11k_mhi_start() returns without undoing mhi_prepare_for_power_up().
Then the failed probe or power up unwinding frees the MHI controller,
but the MHI device context and the RDDM image table allocated by
mhi_prepare_for_power_up() are leaked along with their DMA buffers:

  % cat /sys/kernel/debug/kmemleak
  unreferenced object 0xffff00079156a140 (size 64):
    comm "(udev-worker)", pid 595, jiffies 4294893781
    hex dump (first 32 bytes):
      00 d0 f1 80 00 80 ff ff 00 50 f1 80 00 80 ff ff  .........P......
      00 d0 f7 80 00 80 ff ff 00 30 fc ff 00 00 00 00  .........0......
    backtrace (crc 62662f0a):
      kmemleak_alloc+0x34/0x40
      __kmalloc_cache_noprof+0x224/0x3b8
      mhi_prepare_for_power_up+0x58/0x548 [mhi]
      ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
      ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
      ath11k_core_init+0x8c/0x190 [ath11k]
      ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
      local_pci_probe+0x40/0xa8
      pci_call_probe+0x64/0x190
      pci_device_probe+0xac/0x138
      really_probe+0xbc/0x298
      __driver_probe_device+0x16c/0x19c
      driver_probe_device+0x3c/0x114
      __driver_attach+0x98/0x19c
      bus_for_each_dev+0x74/0xd0
      driver_attach+0x24/0x30
  unreferenced object 0xffff0007916fb800 (size 512):
    comm "(udev-worker)", pid 595, jiffies 4294893781
    hex dump (first 32 bytes):
      00 60 04 81 00 80 ff ff 0a 00 00 00 00 00 00 00  .`..............
      00 10 e0 82 00 80 ff ff 00 00 00 00 00 00 00 00  ................
    backtrace (crc 52e9e075):
      kmemleak_alloc+0x34/0x40
      __kmalloc_noprof+0x280/0x440
      mhi_alloc_bhie_table+0x54/0x168 [mhi]
      mhi_prepare_for_power_up+0x318/0x548 [mhi]
      ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
      ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
      ath11k_core_init+0x8c/0x190 [ath11k]
      ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
      local_pci_probe+0x40/0xa8
      pci_call_probe+0x64/0x190
      pci_device_probe+0xac/0x138
      really_probe+0xbc/0x298
      __driver_probe_device+0x16c/0x19c
      driver_probe_device+0x3c/0x114
      __driver_attach+0x98/0x19c
      bus_for_each_dev+0x74/0xd0

The MHI device is already powered down by mhi_sync_power_up() on
failure, but mhi_unprepare_after_power_down() still has to be
called on error path to release the allocated resources.

Fixes: 3df6d74aedfd ("ath11k: mhi: use mhi_sync_power_up()")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..76c194573ec7 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -446,6 +446,7 @@ int ath11k_mhi_start(struct ath11k_pci *ab_pci)
 	ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
 	if (ret) {
 		ath11k_warn(ab, "failed to power up mhi: %d", ret);
+		mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);
 		return ret;
 	}
 
-- 
2.51.0


