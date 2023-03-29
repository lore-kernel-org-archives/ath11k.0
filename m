Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D5CC6FD18
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pTvNqHDrROCFXLGa1RNhZXbliCLkGvzPpp1mX7k/ZBE=; b=ihubnZ/z4FuVPB
	oly1W8q1PlP5NENJ7JszZB1KJk8oikEywEByaciXmTjEPw6/6ao6d+yxZXYu9LSaSvTTi43EeAzP9
	YrYKwd8ASkL7iAQlIQUxWDnO9ZaAiXsBGLMKrHMzZVfX9vzIk6vH3khmelFD47NOUZW3P3ppKTur4
	6Aeh9tIK3SGIHGwmAbFMapYsiVfWnH/Mxctebvc17pcNVZp2f5N99cgDLFEpfPeWZcPUMC4rgTc9n
	r8TT4qlcoICPOrWTrHB0xpMP1ggwM9CGRl5Vs6nhaItem40McV0YqpC/IL4ORrichoZuSQo+9bcfc
	Pvd9uo9TGrRJU9W1nLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYXX-0014Rv-32;
	Wed, 29 Mar 2023 16:20:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYXU-0014Qn-2i
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 16:20:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2477BB81E4A
	for <ath11k@lists.infradead.org>; Wed, 29 Mar 2023 16:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A45BC433EF;
	Wed, 29 Mar 2023 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680106841;
	bh=vOk0cgYmlWsKP5u7OjDTcUC1HKBh/95816/u0sOAjso=;
	h=From:To:Cc:Subject:Date:From;
	b=clQU8xF6DNIhk2+760jsgMfW0RwLmNu5Jc3S/Yw2EYYrVzlIcM7mpbWr1tCV4ptmB
	 +u4as1hB49NzaTQCj6uHu9956/KYzzkvJidMCwsIf6Jr0zYyS1CZxEC1PgTerwmBLt
	 i9i2/pT6nzMeml4Nd+9feTGoVc+coW7cpoNVXeCjGCwqBjVKSAeRixIBz+zP7qRu/1
	 /0z1wuVy7SC/O+Q5WZIapvycFhP3KfPZLgCpp4xR+Md/0RSnKWw1LKT9nDAiOdji+c
	 57gwnOiVE+80Cq4wjluEFgyAlFjyNWanQhXpAIrWOSBNHzvkFHzLwhJC+HVRwJMFy5
	 04et300/Pq8AA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: reduce the MHI timeout to 20s
Date: Wed, 29 Mar 2023 19:20:38 +0300
Message-Id: <20230329162038.8637-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_092045_054705_451A8F7B 
X-CRM114-Status: GOOD (  14.69  )
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

Currently ath11k breaks after hibernation, the reason being that ath11k expects
that the wireless device will have power during suspend and the firmware will
continue running. But of course during hibernation the power from the device is
cut off and firmware is not running when resuming, so ath11k will fail.

(The reason why ath11k needs the firmware running is the interaction between
mac80211 and MHI stack, it's a long story and more info in the bugzilla report.)

In SUSE kernels the watchdog timeout is reduced from the default 120 to 60 seconds:

CONFIG_DPM_WATCHDOG_TIMEOUT=60

But as the ath11k MHI timeout is 90 seconds the kernel will crash before will
ath11k will recover in resume callback. To avoid the crash reduce the MHI
timeout to just 20 seconds.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214649
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 86995e8dc913..a62ee05c5409 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -16,7 +16,7 @@
 #include "pci.h"
 #include "pcic.h"
 
-#define MHI_TIMEOUT_DEFAULT_MS	90000
+#define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {

base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
