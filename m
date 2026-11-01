Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF8606A32D
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eIE6+APb;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ah3+st6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n6s0PbgjoxExCuhdVbLCqymraLrHLOREUbqNiOJDGAo=; b=eIE6+APbPQW1bD
	erA6IB5akGwTiOL+AFAl8fTSrxEWSW9Qk/LLRkabVFdiRCU/qwMBoSySARokIiAPJgdT3GI6kiPlW
	bCpo68eyrSkMgwQrTmMxoq4kD1b65hC6PRLu7CEpAY+MzG1nvUVvsPq3FRKUQOKQnTYVHFXosM21X
	weeBI7e1TK5lpOe884U1XxhdcHJyK5AlexViMH4yemsFQ2jZHq5cXw9q9b/xIWa9TsxTbGIApLvrX
	r1HGZredOPWV+vLNmJiEiPETbRkYnBGFPfmLRqjHugG7tCQ1f6i9MOn6uYRRURukvBrlH1w++MDUQ
	xYdxn33Q0rBZSul4KKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9K-0000000EDxc-0h8A;
	Sun, 01 Nov 2026 12:59:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9G-0000000EDwu-17Vt
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 12:59:00 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 91D9F80736;
	Sun, 01 Nov 2026 13:58:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvKG7l_Ws-ol; Sun,  1 Nov 2026 13:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793537935; bh=ZLT1WbLas04zpKBdCe4IEe1IgdHhHJeTD5MXp7RfssU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ah3+st6HlE/ZHo2/14wlrBD1qWmRrCn6eSKK+/vvrff+DIQRbOsJxrLIEZzAp7LF0
	 GvuYJxFteyEEml65xc7hO1lohNFH4HIflS+bVFWYKToRKEB0riECRcHCmIEI0yIN7C
	 rN9vty2aX84kkrUBhIPYtQ9SEdsDhL7eVLcU0mswWc9Cld5UF7Py5+4M3LR0Wl7QtS
	 VEFQTZBAH/Xf5C67BUqDWgXmkfvFt+KbMmjxzQc3kYvYLQOhcIOJ8JV8zZR3vy8W78
	 BVY+TG3RaKMM4kJASmGOhlXnAeWgHbyZos/QA7rijOr+PoNIXFfV5BohXL0AafCQJY
	 MhtMNRyg9kgLg==
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
Subject: [PATCH ath-next 1/3] wifi: ath11k: don't disable ext IRQs twice
Date: Sun,  1 Nov 2026 12:58:01 +0000
Message-ID: <84ffca34cf7f76d6642dfeb9f2b1a34c288d5234.1793531790.git.fmaurer@disroot.org>
In-Reply-To: <cover.1793531790.git.fmaurer@disroot.org>
References: <cover.1793531790.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_045858_640431_DE88A762 
X-CRM114-Status: GOOD (  15.88  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_core_reconfigure_on_crash() disables the IRQs at the start of
every firmware recovery and ath11k_core_qmi_firmware_ready() enables
them again at its end. If a recovery fails, they stay disabled. The
next recovery disables them again, so the disable depth of the ext
IRQs goes to two and the single enable_irq() leaves them masked. The
DP rings would then not be serviced after an otherwise successful
recovery.

This is the same kind of imbalance as the one fixed for suspend/resume
by commit e56c9d429ba0 ("wifi: ath11k: fix unbalanced IRQ enable/disable
during suspend/resume"), but caused by a failed recovery.

NAPI already handles this: it is only disabled if it is enabled. The
ext IRQs are only enabled together with NAPI, so only disable them if
NAPI is enabled as well. The pcic ext IRQ code has the same pattern, so
change it there too. The PCI CE IRQs (ath11k_pcic_ce_irqs_disable())
can have the same imbalance after a failed recovery; they are not
changed here. The AHB CE IRQs are not affected, as they are enabled
and disabled through register bits without a disable depth.

On IPQ8074 (AHB) this shows up when a failed recovery (forced with a
test patch) is followed by another firmware crash: the recovery reports
success, but TX completions stop, TX fails with "failed to transmit
frame -12" and the firmware asserts again repeatedly. With this change
the same sequence recovered 3 out of 3 times. The pcic change is
compile-tested only.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Hardware-tested on IPQ8074 with [1] backported to backports-6.18.55
(OpenWrt 25.12), build-tested on ath-next with [1].

[1] https://lore.kernel.org/linux-wireless/20261018210153.1925962-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/ahb.c  | 4 ++--
 drivers/net/wireless/ath/ath11k/pcic.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9..3ff7d5f27f5e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -235,9 +235,9 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_ahb_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_ahb_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3bbdc..2e7dfa8388b0 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -455,9 +455,9 @@ static void __ath11k_pcic_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_pcic_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_pcic_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
-- 
2.47.3


