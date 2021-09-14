Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA16C433FE
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90682610A6
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90682610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpRCX8LSOHy3YvQmjkYHWaBQzVIc/nyfgp6z+CjVxU0=; b=2QYLruZHFx0xj5
	W0afRh1qIWVVjqKmFCTvblNsTBLztHPVvtILT8a5MONm/e1H0JifYOqdbwuJL1TMHuQ0kzFNkYh31
	6UTAuihc5dJfbkU/cA1Q2r/utchPOW8qgL4laRGSkIilMeKUkpHlppnmjiFOzRlc/6nSQDG2gCQ4C
	5xgYRqeCPSazRPME3wHEVMN45Udu6CN9X9lXDxqFjUBljMJ3HcpRHxpcib805Jh9A1136Vkp+hzvv
	rQwkwRiki9qKp9waH9dgBwCDS1SJ021N6hWz5jdIAc8KklbYgjUR15YSnCAVr1+q6HMG/sZway4i1
	aaaxLzy1cTd30FQS0GiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBWR-006Tw1-I8; Tue, 14 Sep 2021 16:43:03 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBWM-006TtZ-Ms
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 16:43:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631637780; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9g90ln5epljHjohWwqm7/A4ZVQ9dSteF76PJngkFhDw=;
 b=iUXI7i4zENAXVOLBXwm3+7x2Ev8mLHfVmUK5Yf96ja/LOrCXoHd23e3X2icggR8M72mz3bnK
 3hmewYphXT+PmD3W1VZLvfcNbO669luYzEwOjXkm0goIzpQauM30Us95CZZI03etaBZci3yz
 WSg6F+aioKYui1NGgVFOQPW3/6A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6140d0fcc1b30e2f0202cbfa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 16:42:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AA27BC43460; Tue, 14 Sep 2021 16:42:35 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A6A0C4338F;
 Tue, 14 Sep 2021 16:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9A6A0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/3] ath11k: indicate to mac80211 scan complete with aborted
 flag for ATH11K_SCAN_STARTING state
Date: Tue, 14 Sep 2021 19:42:26 +0300
Message-Id: <20210914164226.38843-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914164226.38843-1-jouni@codeaurora.org>
References: <20210914164226.38843-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_094301_100042_FECD7F3B 
X-CRM114-Status: GOOD (  16.54  )
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

From: Wen Gong <wgong@codeaurora.org>

Scan failure can not be recovered from when running a loop of the
following steps:
1. run scan: "iw wlan scan".
2. run command: echo assert > /sys/kernel/debug/ath11k/qca6490\ hw2.0/simulate_fw_crash
   immediately after step 1.

result:
scan failed and can not recover even when wlan recovery succeeds:
command failed: Device or resource busy (-16)

reason:
When scan arrives, WMI_START_SCAN_CMDID is sent to the firmware and
function ath11k_mac_op_hw_scan() returns, then simulate_fw_crash arrives
and the scan started event does not arrive, and then it starts to do
recovery of wlan. __ath11k_mac_scan_finish() which is called from
ath11k_core_halt() is one step of recovery, it will not call
ieee80211_scan_completed() by logic currently because the scan state is
ATH11K_SCAN_STARTING. Thus it leads the scan not being completed in
mac80211, and leads all consecutive scans failing with -EBUSY in
nl80211_trigger_scan even after wlan recovery success.

Indicate scan complete with aborted flag to mac80211 for
ATH11K_SCAN_STARTING to allow recovery from scan failed with "Device or
resource busy (-16)" after wlan recovery.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 97a2c92b7b9b..e015b22b8dbf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2985,18 +2985,21 @@ void __ath11k_mac_scan_finish(struct ath11k *ar)
 		break;
 	case ATH11K_SCAN_RUNNING:
 	case ATH11K_SCAN_ABORTING:
+		if (ar->scan.is_roc && ar->scan.roc_notify)
+			ieee80211_remain_on_channel_expired(ar->hw);
+		fallthrough;
+	case ATH11K_SCAN_STARTING:
 		if (!ar->scan.is_roc) {
 			struct cfg80211_scan_info info = {
-				.aborted = (ar->scan.state ==
-					    ATH11K_SCAN_ABORTING),
+				.aborted = ((ar->scan.state ==
+					    ATH11K_SCAN_ABORTING) ||
+					    (ar->scan.state ==
+					    ATH11K_SCAN_STARTING)),
 			};
 
 			ieee80211_scan_completed(ar->hw, &info);
-		} else if (ar->scan.roc_notify) {
-			ieee80211_remain_on_channel_expired(ar->hw);
 		}
-		fallthrough;
-	case ATH11K_SCAN_STARTING:
+
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		ar->scan_channel = NULL;
 		ar->scan.roc_freq = 0;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
