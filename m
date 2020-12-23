Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835C9C433E0
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3865620705
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3865620705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohWRXmX7PjciadoHn0tQMqQZtnIo0cdgMgRWN+rIwFE=; b=KXKgZOoWaKXaBeH/RGJFMpHef/
	X//CfieoP13VZO6P+rG2pJJSKmluhuqM7iZ3Ys8RGsVwO6sIiGgWm3bIwwlEcF1K76mexBFgtYiV3
	adyFj8ptmDVzLmZhKkd9kQCWa6spv/S+gdDxBbFyaeHHppsDuWBQNoW/reNYvFE66BQRSy7LSES9z
	noJ95bFsvKnDsbSrwxlH0Eby/58gmMD7Mw0ZqWq4ZhMfIXJ2oSEbCFDWf8IWjJvPdmz5cKt0FfaN4
	2dIkGQtXq5bbMq/TMEZ1m0csWRAb9KK1sp52QgmLCUqrfw3DiFvrVCq3VvRijIsOb6BVTDsHIjhfi
	oNWS7Msw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruRD-0007Xp-Iy; Wed, 23 Dec 2020 03:03:43 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruR9-0007SK-Va
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:03:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692622; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I1QNljUE58AFHH2SABSXPPFW7q2xOYSS3wHHUKO0u2A=;
 b=i9hymBajJ7anPJttWLwX3LY8Ins7uFhOhg6fb9AawzWF9kcXXsSwvyWvPNz3mO9UB7iwOj3f
 B64nQ65fnKl5cBAkTWa64FhSQWLBuyLj2TwuZcHX75lbvlLEJZeUyVljjZ4c8oSScX26BeYv
 7DRYv7ZED62t0p0rDGzxckRy+fw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fe2b3511d5c1fa427638e42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78F54C43465; Wed, 23 Dec 2020 03:02:41 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E9B6C43466;
 Wed, 23 Dec 2020 03:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E9B6C43466
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 6/6] ath11k: do not restore ASPM in case of single MSI vector
Date: Tue, 22 Dec 2020 22:02:25 -0500
Message-Id: <20201223030225.2345-7-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220342_579504_A8C70E8C 
X-CRM114-Status: GOOD (  13.47  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

For single MSI vector, ath11k doesn't restore ASPM as the MHI
register reading in M2 causes system hung.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a120d7c..8c6147b 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1119,7 +1119,11 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 
 	set_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	ath11k_pci_aspm_restore(ab_pci);
+	/* TODO: fo now don't restore ASPM in case of single MSI
+	 * vector as MHI register reading in M2 causes system hang.
+	 */
+	if (ab_pci->vectors_32_capability)
+		ath11k_pci_aspm_restore(ab_pci);
 	ab->ce_irq_enabled_flag = true;
 
 	ath11k_pci_ce_irqs_enable(ab);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
