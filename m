Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C29C7EE2A
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKDu29PFOsKGUqd1uyCSXzL+voQsVV3x4Nv3+YmmEvs=; b=huYD55H0KakmwcKbyRrt1j94lz
	IRHqcEmT+k7xdP1gq0vWz9FWvS/zQ81E/j/wNJubYi6S7Q/sQEPvbSNTzVCoxFa0IkaohXXNfQFrQ
	+cGUm7Gj0wi7iL1zr+XBpy+OLF/9iMHtFGVq5fiHyej7fpZeb4P8HgMBLkU/n+qm69iJ9NbBf6pOt
	ISqf2GlZIQVscsvtUVoXChlWP9fb6kt++mvrq2esfco6rRVYh2bsZjmTasp512fUNRkOyFW/mZ3Ne
	Wvnyeq4j+ZWV0kDDTiZx8jXnwj0zUH7yViErFnxXH21RTxSuoM3SpaEmVYUaKXxuUa/B2zuplstgY
	uDWI8D2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTz4c-000000052IH-21Yx;
	Tue, 24 Jun 2025 08:32:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyuS-0000000500J-0E4m
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 08:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F95361154;
	Tue, 24 Jun 2025 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C38C4CEE3;
	Tue, 24 Jun 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750753299;
	bh=sMDYw/iEzAAz7E8kipgSoSk+Xe3siOFd54HwBLDS/lw=;
	h=From:To:Cc:Subject:Date:From;
	b=Z2MzqTxI3dtLZ7GtsTSYeMod9QaXWm+vcXoL8iaQcrCqlf1k5EKrjFgoyzhTbm9DQ
	 2dKYoB8gMhemY3752FmjoAUa/O11f/+md/cW03qFT80BXvOHXo6XKwcV/Ah5sEUat0
	 rngw8dM8a1lnP5BY6oogNa4uQngxhw2R8fMvNhJKUAX3duH8DFom9eu88Z5qK1gKsH
	 HYBzuIl38GffZQT78sqHTncspRbMsmE9UkOJ/ekXxHcXkfzEIsUAY3H4GauB4fX6jL
	 6J/E89XR9yeySKbTATQ//O57LFo0fdm6yK4/LTxmLGSFry0jDB5su41mEZqJohGMgo
	 N9wMXqqxeNHSQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uTyuO-0000000042t-3zC9;
	Tue, 24 Jun 2025 10:21:37 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix suspend use-after-free after probe failure
Date: Tue, 24 Jun 2025 10:20:22 +0200
Message-ID: <20250624082022.15469-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to deregister the PM notifier to avoid a use-after-free on
suspend in case core initialisation fails (e.g. due to missing
firmware).

Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/all/d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com/
Cc: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 22a101136135..eb1f35617c64 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2581,10 +2581,15 @@ int ath11k_core_init(struct ath11k_base *ab)
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to create soc core: %d\n", ret);
-		return ret;
+		goto err_unregister_pm_notifier;
 	}
 
 	return 0;
+
+err_unregister_pm_notifier:
+	ath11k_core_pm_notifier_unregister(ab);
+
+	return ret;
 }
 EXPORT_SYMBOL(ath11k_core_init);
 
-- 
2.49.0


