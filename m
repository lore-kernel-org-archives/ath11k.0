Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE84C433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A10A60D43
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A10A60D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qgl7kPSSg/zu/vXQYURIeK5l5btYAW5aJT58CddyW94=; b=14bIQu69jo5OSw
	iU5VtQWuy4b1dfHmoss3eByoDD4vSRlJ+4kesj32xmOA7V/zV0lsjy4dhUcP1RW1U9OfIktCwEomV
	1tYz0CGFwMorjgrC4He4sDGe1Hac9mJ89PagFmEEio8exWe+uHTXACltgcgZmBP2CX57b3EIvMmjb
	HKz3G+AbYBmOpMCP1CTzA+H1wXhdxlqxOdBVi8ZWM5BFYqbYjkPHUV/ZSlTHMk1JKNTgzzvK6QTcK
	DsxeRTXl8hG97CL9eNRMA3ugzPxbL5/iBOaf+bLIX29pXEXOMnthpSM04cczGK0GU4yTqbKqHvQVE
	VlD5BcVJH5/r1BM5Oirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDu6-000ZfP-DY; Tue, 26 Oct 2021 04:17:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDu1-000ZL0-TJ
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 04:17:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635221855; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jEEIgUVrINI0IucnhBKSg0qksHoIt+oGv9TeC+tnQHU=;
 b=O7LgpDyy9U0vQhejs633dbUZgHdvPl2WErusoLevGO1+PIHIWAa84jsc3j+RYP2G+DfOl/z+
 26qXnWq6P4ddWbqhhEEX5Yr5q+0vSfCjId0dQMf9c7FUOjDS3mPhjourm9oaSev9JVAyqkvQ
 3bo6uQZES8kbN2LKy9CowDRIZ3A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617781585baa84c77be2fba3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 04:17:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ED78DC4360C; Tue, 26 Oct 2021 04:17:27 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ECC69C43460;
 Tue, 26 Oct 2021 04:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ECC69C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 6/7] ath11k: do not restore ASPM in case of single MSI vector
Date: Tue, 26 Oct 2021 12:17:22 +0800
Message-Id: <20211026041722.5271-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_211735_843795_49966F3C 
X-CRM114-Status: GOOD (  13.26  )
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

From: Carl Huang <cjhuang@codeaurora.org>

Current code enables ASPM by default, it allows MHI to enter M2 state.
In case of one MSI vector, system hang is observed if ath11k does MHI
register reading in this state. The issue was reported on Dell XPS 13
9310 but is seen also on XPS 15 and XPS 17 laptops.

The workaround here is to prevent MHI from entering M2 state, this can
be done by disabling ASPM if only one MSI vector is used. When using 32
vectors ASPM is enabled as before.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 0a87d00a3a23..b450b4ed35d1 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1220,7 +1220,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 
 	set_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	ath11k_pci_aspm_restore(ab_pci);
+	/* TODO: for now don't restore ASPM in case of single MSI
+	 * vector as MHI register reading in M2 causes system hang.
+	 */
+	if (test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		ath11k_pci_aspm_restore(ab_pci);
+	else
+		ath11k_info(ab, "leaving PCI ASPM disabled to avoid MHI M2 problems\n");
 
 	ath11k_pci_ce_irqs_enable(ab);
 	ath11k_ce_rx_post_buf(ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
