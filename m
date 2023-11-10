Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96035C4167D
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6MmMSFsSS4xJbasUpA6mBPUF1E0XaBtx5gd1H53crk=; b=mNL0QR2Iv6qG3y
	kNtixmYsKsaMtWmg3z+/Rbg8gHbI9B75ici0EMi+5XoxopCBixDyHbwV6wbmUu7+EGI535JQD0h55
	dQwFJAXm85+FEkHVvK5kwGQOzKYknSd+rebqTUEjTqNznxrOD3mmHco9Y3UtaE0NchS7xCEklqQbh
	ahU34u6QTausc0KHRS8wi62AKiUrrYGC7g89ui5Py39ugjUq5nB4Honb3jm0c2H4szb+YuG1DJx66
	YF1Zl11H5IELBu/bKAfx3+gqg4kUiUxMpwL+Vsst/bw9tks8VJ9KmfaYHYJmfZTkAJuskHxAlKDD+
	1HUIxvC+kzQhOYPSmUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeV-008HtE-14;
	Fri, 10 Nov 2023 10:22:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeS-008Hqq-0n
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 10:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D734DB81E21
	for <ath11k@lists.infradead.org>; Fri, 10 Nov 2023 10:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A57C433C8;
	Fri, 10 Nov 2023 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611730;
	bh=hptKbYz04+x5Rr0maSkv69QvScaY06HUThEK/G5dIhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkMo7EG6iUws0M/o6eo67UcGSSC6caRinXQ6YCAQIeTAjUdzj/soIs7A00vEsswei
	 Uz/eA64OKT6OWdFUiYd7UnU211hCMV65JQ7yG/A3Oze90Fxlfau00+KR1j7ZVgW9I2
	 cutec7332I9fLZAvWwAXxK81C3Tq7rGL5yIIw/13E0quEN6Wq0OCiYWWWUKUwLXDJt
	 qFG4eaApzDzE0dpRhvw3DMdyOICKrbvEiYmrQ5JJPeuJ0sBWQtgIbV/aLFkNVPhFZK
	 Aj+E0Ts36sj/gKYP57gKjgM7aNhK78Pk8RwoD1DBDk/68H7Sf8jYpI5kS8ttPPjsgc
	 rHN3ObEhPfFDA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Date: Fri, 10 Nov 2023 12:21:58 +0200
Message-Id: <20231110102202.3168243-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022212_435056_7B48A492 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

There is no driver to match these two channels, so
remove them. This fixes warnings from MHI subsystem during suspend:

mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 28 ---------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index afeabd6ecc67..d4fe1d1c86e4 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -21,34 +21,6 @@
 #define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
-	{
-		.num = 0,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 1,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
 	{
 		.num = 20,
 		.name = "IPCR",
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
