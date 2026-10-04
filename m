Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F3BCA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjmGNy9+5i4EYioG2mjTWb6R3JieWsNYIsTGT1wtIFc=; b=B2mHGFvbrtgXaQA7Kvw6ES/4WE
	rhFJrUZL1tiik6UDpQtGAMKGc3VKI2RhNEoFOxTyN/fJbTjT5BR4ai3mxHyTss3f2q2T5j4E6WQsz
	WmnpZxWsIss3mii+LD7MS6F5JPw61vTDXUiUK69wFZqzG5pqwhqj/6bhe/AIVOpkxhB9FpJ2efQCc
	VQ80C/n+EOWlJvHSng0F7uaSIwqBv5sTw8nABTpGNWIY2Sh6r5vVyb/ApE6/K+0dwgJ5yChRatVPO
	pnA290m0rLMlvIGDzpX7sc6aCgdqHmZ4ZNaQi78BHpkmE1UBV1Ggu+vervPjyXTG3kdVI2OnVQVPz
	9Dydkd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKJk-0000000EjUp-3HjB;
	Sun, 04 Oct 2026 11:23:44 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKJi-0000000EjUB-0LXB
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:23:43 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id E19631BBB3;
	Sun, 04 Oct 2026 14:23:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=HjmGNy9+5i4EYioG2mjT
	Wb6R3JieWsNYIsTGT1wtIFc=; b=aCemBFGzygvc5Fa/LiedRKYKC+lCGqnlWK9z
	ABJ9N1fXLLE3kpeGYteWsy29mzwuPyrZZufB4CgQTZF8zW8L0l5univeLLCOtlre
	W5Awcs6msANvuvgeHo974/7CoTpCwzpsNR+UwpsW642dGP0CnKxxVUvGIFvfAEPU
	cs2lifheN/c7YVJTwaBo9ZF0sgcBdYTAs7uX7rJgXQ0LVRLG8HimZ5unUxnQ4nJJ
	W9K2UZBIRkC/Fz2DRO+CRayERPahhRcjoK7RLWD5wcsVNDtM8AHTlQjv2enMObTy
	ZF8YWY8eEVIci85+wdC8zF/eVG2zL4B6l9RmufMVK1nNWtMksg==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 375831BAC2;
	Sun, 04 Oct 2026 14:23:39 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:23:38 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH ath-next 5/5] wifi: ath11k: map DSCP to TID as cfg80211 does by default
Date: Sun, 4 Oct 2026 14:18:07 +0300
Message-ID: <23e008aae70cc20169686c84f61139237fa1eb6e.1791111135.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791111135.2.git.me@andrei-z.com>
References: <cover.1791111135.2.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042342_309614_E1AE0F6B 
X-CRM114-Status: UNSURE (   9.30  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Where the hardware classifies frames by their DSCP, it takes the TID
from the DSCP-TID tables ath11k programs, all of them with the DSCP's
class selector bits. cfg80211, which classifies the frames mac80211
queues, follows RFC 8325 section 4 instead (commit 6fdb8b8781d5
("wifi: cfg80211: Update the default DSCP-to-UP mapping")), as does
Wi-Fi QoS Management. The two disagree for AF1x and CS2 (UP 0, not 1
and 2), AF2x (UP 3, best effort, not 2, background), CS3 and AF3x (UP 4,
not 3), VA and EF (UP 6, voice, not 5, video) and CS6 (UP 7, not 6).

Program the tables with cfg80211's default mapping.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/hal_tx.c | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index b7e9b1cdd7..c42d9d4f53 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -11,26 +11,26 @@
 
 #define DSCP_TID_MAP_TBL_ENTRY_SIZE 64
 
-/* dscp_tid_map - Default DSCP-TID mapping
+/* dscp_tid_map - Default DSCP-TID mapping, the one cfg80211_classify8021d()
+ * uses without a QoS map: the DSCP's class selector bits, except where RFC 8325
+ * section 4 maps the DiffServ service class differently.
  *
- * DSCP        TID
- * 000000      0
- * 001000      1
- * 010000      2
- * 011000      3
- * 100000      4
- * 101000      5
- * 110000      6
- * 111000      7
+ * DSCP              TID
+ * AF11-13, CS2      0
+ * AF21-23           3
+ * CS3, AF31-33      4
+ * VA, EF            6
+ * CS6               7
+ * any other         DSCP >> 3
  */
 static const u8 dscp_tid_map[DSCP_TID_MAP_TBL_ENTRY_SIZE] = {
 	0, 0, 0, 0, 0, 0, 0, 0,
-	1, 1, 1, 1, 1, 1, 1, 1,
-	2, 2, 2, 2, 2, 2, 2, 2,
-	3, 3, 3, 3, 3, 3, 3, 3,
+	1, 1, 0, 1, 0, 1, 0, 1,
+	0, 2, 3, 2, 3, 2, 3, 2,
+	4, 3, 4, 3, 4, 3, 4, 3,
 	4, 4, 4, 4, 4, 4, 4, 4,
-	5, 5, 5, 5, 5, 5, 5, 5,
-	6, 6, 6, 6, 6, 6, 6, 6,
+	5, 5, 5, 5, 6, 5, 6, 5,
+	7, 6, 6, 6, 6, 6, 6, 6,
 	7, 7, 7, 7, 7, 7, 7, 7,
 };
 
-- 
2.47.3



