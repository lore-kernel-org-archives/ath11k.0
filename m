Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C02C43334
	for <ath11k@archiver.kernel.org>; Fri,  8 Jul 2022 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I2ev1bYrqTZsZykEUzplkaYsfMVNbBBcHkO4VG2MDtc=; b=IbDdJgYoNdhqx/
	G0ABoVPGMGOH9DOujK6QRhW8s6fzL3ktbj53ehWkPtkWzNW86nLF05nN4Ji4N8LtNwaY/Yg5w/3bP
	l9AVkPv+qSKlIFJoZsk4jhCvFTlkHiEzobpG1BZ5uXyvISpq6k8g3s9bKo52OH2RyML03+MJfZx78
	RK+hMDAVjtlEhki3Rn7pQv4c80yvxZRNASkBolpwd8eYO1FAtbI2B50irHmDp19melYI5KepnrDNF
	WztF0Sx9SJ2bIhmg3DfHJJJOOY49yqIZRCe1wJnoRGvCZs1h3E0ertoA5sTGPzO5Pn78lyWdfrPWM
	1W/deeWtCMdlglOtetGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9rLm-004r7S-4h; Fri, 08 Jul 2022 17:01:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9rLh-004r4u-7y
	for ath11k@lists.infradead.org; Fri, 08 Jul 2022 17:01:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D60BAB828B7
	for <ath11k@lists.infradead.org>; Fri,  8 Jul 2022 17:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E800BC341C8;
	Fri,  8 Jul 2022 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657299658;
	bh=+V60161RGtW5N2RGODtn5HtAyykE0KHHtN0onZutMI8=;
	h=From:To:Cc:Subject:Date:From;
	b=cEC/oG7yFRU0/FRvOfo7C7WzZc2GgLRYJD/O4TmiOxLmfPGmHCtDV5pDadYB6OElR
	 o2CeoIIcC2MPMrFpVMlXaVat5ZAHehqcBA6BvBqdoh5OYNsS3f19Dr07CXLaMkYDFE
	 Sb1RqbOFy0cLPSEHL61TSApUnJrpa2R2uDP1Ig9LFSS83Q0EZhS6zFMP5itwNjalvC
	 s9D9KgezNa9XQN869q5Zaw1W9voc2BKMBb1hcGFTucGvRTU7cf+dSLXIlvQa1erIcQ
	 fGQwFvx/iLH+IPRfgTd5Yxv0KpDvuv37PXS4tLHGv9sN5yfQZDc8cYbW1z0fHTUzLb
	 zr7epB7jllrBw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] ath11k: mac: fix long line
Date: Fri,  8 Jul 2022 20:00:52 +0300
Message-Id: <20220708170052.28615-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_100101_480301_88D4B7CA 
X-CRM114-Status: UNSURE (   9.92  )
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

Recent mac80211 API changes introduced a long line warning in ath11k:

drivers/net/wireless/ath/ath11k/mac.c:1404: line length of 92 exceeds 90 columns

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 17dbc7d9cf29..7f3e9c30cfb0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1401,7 +1401,8 @@ void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif)
 	if (!vif->bss_conf.color_change_active && !arvif->bcca_zero_sent)
 		return;
 
-	if (vif->bss_conf.color_change_active && ieee80211_beacon_cntdwn_is_complete(vif)) {
+	if (vif->bss_conf.color_change_active &&
+	    ieee80211_beacon_cntdwn_is_complete(vif)) {
 		arvif->bcca_zero_sent = true;
 		ieee80211_color_change_finish(vif);
 		return;

base-commit: f6bb3df74ceb88929dd7e09170ec156ac2e5d809
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
