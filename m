Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A28AC77B72
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jS7EhKkBEsc3NFowQ60EdHaPoDfP2YTkhxxvJF/CxA=; b=mTHACmrHP6P9Lf
	kJG7vmKfMqCPbChyCdb6iwbT5Jb+qgLBwoiGiznf2f1xFVPsViRWMy50yDNL8O5vcU+GzAlD93t8N
	WGupRdik0xUhkAnydWYAxFi+/QjaXFNUlBa+vj3ZAo6tqMrvzz3Pu0jJcXAgnxI6AxtgsTxVaYWdL
	Rw9Xh3jWkZ3sm3H2zvE9fajMacvILQ3zcRSBFbRtv02ba3T+tYAgtuIqATDmy5CU+qGgnDtafHTNx
	AVc7VIKyu2xhZYscbMkVeXVSCJ0L89gVPK0kXLgeUiR7gTP/gWejWdLX5A2qBUjOU/zd8bF6xGTtK
	byM0l6PcU8SRx6yOnqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppS3c-007sSH-2G;
	Thu, 20 Apr 2023 11:02:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppS3Y-007sPQ-2t
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 11:02:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C49F647D6;
	Thu, 20 Apr 2023 11:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD2AC433D2;
	Thu, 20 Apr 2023 11:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681988547;
	bh=jpupAkuoIR9JZhgmPqEtxcQHV2WSoE1rm0Idsw6o3cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIDXD0JnR0ulJujsnKytrAeIEtkeVDumXgjC+l9El9jvs47d17GH2RaVKdS0KpTmF
	 5g088FDRjZ6SLuVeZbMn7rtitySoTEAJd+Mii8JLNfCm92iM7SNmVnIXTNCmqLM43V
	 Okg6R+Athsm8/g4dM4PM+b61y6Z5R3VJi5cd/siiKeQ7RwmxIugeltBqgxcGsoygaY
	 6xdP3tjvYDf8TbHF+/H8bVBarjvuhY1xsEtGGpbY8KudmpYw3DyutflKJrPJ/DKVKh
	 Cbz78GmZHoxsSgUWGReItkPOenuHc8lRO3gDm8kK8YwsGoM1ZS2c7J3fRKsbwmeFSA
	 0if9pJDiMEl2g==
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
Subject: [PATCH AUTOSEL 6.2 16/17] wifi: ath11k: reduce the MHI timeout to 20s
Date: Thu, 20 Apr 2023 07:01:45 -0400
Message-Id: <20230420110148.505779-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420110148.505779-1-sashal@kernel.org>
References: <20230420110148.505779-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_040228_972353_D3CFF19F 
X-CRM114-Status: GOOD (  14.99  )
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
