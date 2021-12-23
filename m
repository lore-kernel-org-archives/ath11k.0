Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42F7C433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=18JQgqsq/xvfaTRihVUmNYhNch9MdO31opbCabPqSCY=; b=X04
	4RcOoQPNzOpuiD7UJb2dnnMlx5yKbg+BKs2utZ8TClkoasXmH2ZC0M0ScKKdtjOolr/GPBZTJtNSG
	+Lg847LQTGz995wn5q8LHM2j8l4Y3si+IRbXQYEotv4hAgmVK0bCKn3WtBI6+Mu1I/U3L/hs7tdCw
	fN6NNPTO4w5i9qGy8EOUc5U1mzgiZWjdq/H6ZF9mUm2U2Aw6ruBZE5AUK2Q0dADpTQpE1NOOv0jV8
	VHOdDTzi+OskpC2LlKypF1tl3GuHGvD46yzoyf5QVBp1mOXxLWgn9IkgpG1NQ0eEFu3fnSMpMnddM
	eBWQ489Ce/aU1W8ez4PrnMXmsQ02Ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0NKz-00CiDU-60; Thu, 23 Dec 2021 12:36:49 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0NKw-00CiDC-68
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 12:36:48 +0000
Date: Thu, 23 Dec 2021 12:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flu0r1ne.net;
 s=protonmail2; t=1640263003;
 bh=oiub/fb/MlfZ16yWB9IPpr6gVCtYaOvyAUDhAFY063c=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=rwn2v//uVbLWDrr65JRieikcBOZ+cAsT7kb2xil7uhwLTrXVvovUlI1mA3NEXTxpW
 UElyF17yvDbpVdFQxNUt6ZcRSTxz7NlfUhHCvlpfilhY9spCkpAiG5RYNFbDOisNYx
 KtyX4exELcrRZemhEJPwlcbIbYjfBA7pGvRKwzk65j9CVSJltmsiA+DVcjkAbDySNb
 ttcAvnmsxae7/r31Ehz/CjTDRDuA0DRl5qpb/n7mfB6eKDfsdxzX/DlU0H0pfD4Hp8
 X5btvLZtivyVD0V541/nXL2Bq3goCtPSYEdAJcLJ0C+wXz6pIWqyMFl5oWKwz9ZVxj
 RshjpYEdmZkoA==
To: ath11k@lists.infradead.org
From: Alex David <flu0r1ne@flu0r1ne.net>
Subject: [PATCH] Change the max number of active probe SSIDs to match
 registration
Message-ID: <YcRtS0oQyDNjCTQS@peregrine>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_043647_035609_8C9BEB3B 
X-CRM114-Status: UNSURE (   7.76  )
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
Reply-To: Alex David <flu0r1ne@flu0r1ne.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The maximum number of SSIDs in a for active probe requests is currently
reported as 16 (WLAN_SCAN_PARAMS_MAX_SSID) when registering the driver.
The scan_req_params structure only has the capacity to hold 10 SSIDs.
This leads to a buffer overflow which can be triggered from wpa_supplicant
in userspace. When copying the SSIDs into the scan_req_params structure in
the ath11k_mac_op_hw_scan route, it can overwrite the extraie pointer.

Signed-off-by: Alex David <flu0r1ne@flu0r1ne.net>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0584e68e7593..86bed27e90d8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3077,8 +3077,8 @@ enum scan_dwelltime_adaptive_mode {
 	SCAN_DWELL_MODE_STATIC = 4
 };

-#define WLAN_SCAN_MAX_NUM_SSID          10
-#define WLAN_SCAN_MAX_NUM_BSSID         10
+#define WLAN_SCAN_MAX_NUM_SSID          16
+#define WLAN_SCAN_MAX_NUM_BSSID         4
 #define WLAN_SCAN_MAX_NUM_CHANNELS      40

 #define WLAN_SSID_MAX_LEN 32
--
2.34.1



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
