Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC1C77B6C
	for <ath11k@archiver.kernel.org>; Thu, 13 Apr 2023 02:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jS7EhKkBEsc3NFowQ60EdHaPoDfP2YTkhxxvJF/CxA=; b=09fjkqX9iz6Lnn
	8BzWWI/Ad1GwEVLH8vp5qNJqFUb1rgVwK3pBEXTWQEgT2ciwp8pu+H+pH356WAWV+kFZv46+tRwLV
	7HrZZ0Vs4Yxxp61UP694Qh1jFUUdkXIycP77KYYrsWAZrGF+QvPhSAomKYJomClrO9kZfpheBwdUY
	J8y6012ntA124Lvxwo4lQHy8VzKpaKNkf3zQ18f4Ff4ObD7rA6iNWn2gRepv1Fapi638L/VQrwcij
	Arw503aLMT5V3StB7CjXscyRCV+ousaJs1bg7m8L6hjlXHvOulHNhVOHdBgm11BXdSp5nuWISMIUQ
	GW9YOS3Y5as+yHuYrr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmpF-004pRE-2n;
	Thu, 13 Apr 2023 02:36:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmpD-004pQV-27
	for ath11k@lists.infradead.org;
	Thu, 13 Apr 2023 02:36:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D8C363A8E;
	Thu, 13 Apr 2023 02:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C858C4339E;
	Thu, 13 Apr 2023 02:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353398;
	bh=jpupAkuoIR9JZhgmPqEtxcQHV2WSoE1rm0Idsw6o3cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXlUkrc3hX+KavuWDGCFeYvlSEFPybslCUy9DcI+YWqTVRhXJTg6XkMV/tzrHO2C0
	 EIt9l43oeHML/Kavf3Go8nT+9mHcAWCH1IRElSQE3KKOTOdgVQLJG40h6Aq/Kzxrws
	 RAqlMfUbFPc7udsRuCxVGQJ3oxq1YpzxHknBxRnUlUpMWHCrn827Fm8NJmUK0NEGti
	 u3ABV5eSiNScEIlfy3Czk/7WZzJxAeM9BKRCgszTOEGD5Pu8Aw3hGgtPsAcAzVkiCY
	 Dp/0gKgHgDrE/2sl/GE95KrzTYGmryjhyYKTOWha8qr9HUP1wVVXWYXICLEl7HBucT
	 92t509mh/UCfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 16/20] wifi: ath11k: reduce the MHI timeout to 20s
Date: Wed, 12 Apr 2023 22:35:54 -0400
Message-Id: <20230413023601.74410-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023601.74410-1-sashal@kernel.org>
References: <20230413023601.74410-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_193639_732281_4FFAC525 
X-CRM114-Status: GOOD (  14.61  )
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

[ Upstream commit cf5fa3ca0552f1b7ba8490de40700bbfb6979b17 ]

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
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/20230329162038.8637-1-kvalo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 86995e8dc9135..a62ee05c54097 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -16,7 +16,7 @@
 #include "pci.h"
 #include "pcic.h"
 
-#define MHI_TIMEOUT_DEFAULT_MS	90000
+#define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
