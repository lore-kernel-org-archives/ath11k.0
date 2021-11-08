Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29D1C433F5
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E805611C4
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E805611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9k+dMda5P3K5JSNlVH+YFOiGbAZtO9QHldtf5fv0B0=; b=4+UGTGsdLSaRxx
	7b5SXQ+c7giGh1kvyGb/yi/Ar96CtfJ5SoJPacwS4Fiv26TJkRL/w2C2F+oTmcdHPV0Lc30Se/Uzc
	TGgYm0MfH54bi/I2rS9a/58fmKRLST4UEO8jry6980ABNpxdM06YzgAEv05CUjg7Zmew2bazODu6g
	qsFIpfgbSpJyfElBJvH0rgIO2b1+8OrRL5QjHGKGL6DDOecXjEAp1+MxKU9diEcGTF5ma2rvoUaVQ
	diadpDRDcxnF6AVlXl7svtMHjVCvxyd7sn2qK6NFnNCtCaJOrRMv4TX/459QH1YIge2kGKjx6M0sL
	bzLAl1EP+CaLoHaEbffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFgC-000F6r-GJ; Tue, 09 Nov 2021 01:12:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFXD-000BWM-SK
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 01:02:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9D1561A2E;
 Tue,  9 Nov 2021 01:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419766;
 bh=2hvDv9wxZ+0b1dQ9oTl3HLQSryXIL1L4jzgyRKntOls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O786A43a4BfFfANlmCv8PvZpgLxNG1rdbsjwKiW08roW4iHd7IR3lnVvfwEms1k5h
 mLGid1OJHq9b6TK08RGh9LOa6llThN95Hue0Mur6+GaH30IZSony+9J9GkwuAuqJiV
 zz6jsBH6RpLg+AvbpZR2adyAF3M6faq0yHBWpOjyGU0CDKj5Kx0+8OGOpqbdv6QrbQ
 zQXVfGuSYlAxDE1g/AXrimrX2DkuZB/HwAyR0C1g4a51XrKesRRupUrawOTHrivzwK
 2aq1RgksvfJ5aqTKXTuK6qecmFUDkJuVTUx1+pAlw3JyNuZd6bVNv3nC4+G6S6rkAO
 cHXRrI3+zNpig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>,
 Kalle Valo <kvalo@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 031/138] ath11k: add handler for scan event
 WMI_SCAN_EVENT_DEQUEUED
Date: Mon,  8 Nov 2021 12:44:57 -0500
Message-Id: <20211108174644.1187889-31-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174644.1187889-1-sashal@kernel.org>
References: <20211108174644.1187889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170248_006054_873A1FEA 
X-CRM114-Status: GOOD (  10.43  )
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

[ Upstream commit 441b3b5911f8ead7f2fe2336587b340a33044d58 ]

When wlan interface is up, 11d scan is sent to the firmware, and the
firmware needs to spend couple of seconds to complete the 11d scan. If
immediately a normal scan from user space arrives to ath11k, then the
normal scan request is also sent to the firmware, but the scan started
event will be reported to ath11k until the 11d scan complete. When timed
out for the scan started in ath11k, ath11k stops the normal scan and the
firmware reports WMI_SCAN_EVENT_DEQUEUED to ath11k for the normal scan.
ath11k has no handler for the event and then timed out for the scan
completed in ath11k_scan_stop(), and ath11k prints the following error
message.

[ 1491.604750] ath11k_pci 0000:02:00.0: failed to receive scan abort comple: timed out
[ 1491.604756] ath11k_pci 0000:02:00.0: failed to stop scan: -110
[ 1491.604758] ath11k_pci 0000:02:00.0: failed to start hw scan: -110

Add a handler for WMI_SCAN_EVENT_DEQUEUED and then complete the scan to
get rid of the above error message.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210914164226.38843-1-jouni@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index fa27115483c6c..72da1283f2ccb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6313,6 +6313,8 @@ static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 		ath11k_wmi_event_scan_start_failed(ar);
 		break;
 	case WMI_SCAN_EVENT_DEQUEUED:
+		__ath11k_mac_scan_finish(ar);
+		break;
 	case WMI_SCAN_EVENT_PREEMPTED:
 	case WMI_SCAN_EVENT_RESTARTED:
 	case WMI_SCAN_EVENT_FOREIGN_CHAN_EXIT:
-- 
2.33.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
