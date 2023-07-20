Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C19EB64DA
	for <ath11k@archiver.kernel.org>; Thu, 20 Jul 2023 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fdNzdXsSXmjr74hx2tyu4/yNUNFyCGyUfFr8JXB0ACQ=; b=ZMQytNJb/BDIFe
	77gNY7mdHehKyfoWfAEC7eZzRu6TzBjGMxk72MmlBbhRPZwrwNMqyA3bePD+yRIAeBGqkXnSwW2Ge
	Tf8FapxjlzUNbGN+NzJdudfsmufXqbXNuYFDf8QVSN6uYmPpDM9o3nLq6+VrxACIrJV6x6xZzG/Hr
	MlysCbHtd5kgPPFmfJtRxY6yuG5ZX1NdAPuDh9zWPWg8AhCO6AXR0JydAk3T44ujVtoD4kJnfLf6g
	zpvysuXBlqopea4ee4mtPahgq32gG5y2d2wFp/wD9VbyLEDI1f2QjN09rT+yo/6R5nLwBcAzpqxyQ
	LMhDeQ+tFcuKA8vfYf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVMg-00BVrx-27;
	Thu, 20 Jul 2023 15:14:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVMe-00BVr4-0d
	for ath11k@lists.infradead.org;
	Thu, 20 Jul 2023 15:14:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD9D961B3B
	for <ath11k@lists.infradead.org>; Thu, 20 Jul 2023 15:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8836BC433C7;
	Thu, 20 Jul 2023 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689866087;
	bh=5ELkPJcjYCzpeSg2TRXcApgBHsHAR6BWhJZznl/8NUM=;
	h=From:To:Cc:Subject:Date:From;
	b=jIzQYvav17pLrACw4dSg/i23Im3FxhkxhJPzDZNYu4KWDuCAE2eRTJX2sdTJheuwx
	 NtgrQrr7NpoFxCC33rjPvD7Wh/yNmihFdBP3Z5pDdAGvFONJXbOSeUvLW/dLYbU3yt
	 Eh9pqVfwefFMgvs2h9ENc85Qk7Xhh7BDF3BHdsHz5kKwv9vds9c1mswH3fakgTt6Vr
	 gGel5Ff8keX6uDVmCsUk0Do7V0HC4nIZycUPkxlhIGVwHBEbCuMDwajTeLwqvO3Bqz
	 9bN9Edd/rANVS94XCm54CEuuF792mFVVpahtCdPeH89xKCqmaJfyh1v0jmUl8kRmcF
	 C3acxzwMutJCQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v6.5] Revert "wifi: ath11k: Enable threaded NAPI"
Date: Thu, 20 Jul 2023 18:14:44 +0300
Message-Id: <20230720151444.2016637-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_081448_278243_476A3F0E 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

This reverts commit 13aa2fb692d3717767303817f35b3e650109add3.

This commit broke QCN9074 initialisation:

[  358.960477] ath11k_pci 0000:04:00.0: ce desc not available for wmi command 36866
[  358.960481] ath11k_pci 0000:04:00.0: failed to send WMI_STA_POWERSAVE_PARAM_CMDID
[  358.960484] ath11k_pci 0000:04:00.0: could not set uapsd params -105

As there's no fix available let's just revert it to get QCN9074 working again.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217536
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 1 -
 drivers/net/wireless/ath/ath11k/pcic.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1cebba7889d7..139da578831a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -376,7 +376,6 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
-			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index c899616fbee4..c63083633b37 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -466,7 +466,6 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
-			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}

base-commit: ac528649f7c63bc233cc0d33cff11f767cc666e3
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
