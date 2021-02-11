Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E48C433E0
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 10:51:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C24D60238
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 10:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C24D60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I7+F9Z+AJiYlEBdgnm8SZTX4Wo4LvtooFqHrXoDqUSo=; b=fB81JYnSLbGakU5hoKDlUdcQbr
	x2PO88rP0u6+CXVB3dCiS8KqL51yrQCx5ddJxTe+yNH76Qb6BBOk87c7/J4yx3hm5rpow2gzsAiUA
	6RZKrI2g/JqUdTu5A39ExheDSO5qUotXQ+RVpLem1ERaPccuc558TQ5deK6hCc8EgC43zeHqpzAkV
	tgRwDwXlYB/bzloG1ldiuOKqoOt6K+NYIVFOLmtaKkH4hJVV7Z7JxwJee/xu+SepgHKdh0eIW8ju3
	PN5v1cZybpJ3F98C0aEiVcEqRn1d9i4y+Kok9NPjL1BpfrSQgHgOnQf22r/U2ueEC5SI6XoyvmjeO
	pRnfvh7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA9Ze-0007Kz-IJ; Thu, 11 Feb 2021 10:51:50 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA9Zb-0007IM-3c
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 10:51:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613040707; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5nBs8GymhtNvefApGFXNXO8pOMGpQcTR3XMiXbf9eQM=;
 b=gZ7IJCP4T8OlIZc9suCejlAS8wsi09eBgIwusZdT1gVT+mry/TetQG4gSrPnuftbnjd4XfGG
 TaEJDice7WkDXUjrXdqWJAGraNpYTkk0ef8wjoGDUQq6RqqE6h42f+tBHPexRLfFXo62tU0B
 zHjg9tkbgufX3KJvIskctuWyFsA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60250c3e8e43a988b75c1112 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 10:51:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5F7AC43461; Thu, 11 Feb 2021 10:51:41 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DF3FC433ED;
 Thu, 11 Feb 2021 10:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DF3FC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: pci: remove experimental warning
Date: Thu, 11 Feb 2021 12:51:37 +0200
Message-Id: <1613040697-20289-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_055148_276071_AA6C2A60 
X-CRM114-Status: GOOD (  11.78  )
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

I have received feedback that QCA6390 PCI support is working for many, and I'm
also using QCA6390 on my daily driver^Hlaptop. While there are issues still
to be resolved it's not really experimental anymore, so remove the experimental
warning from driver initialisation.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78478b2b3ba5..d14416816acc 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1086,8 +1086,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	u32 soc_hw_version, soc_hw_version_major, soc_hw_version_minor;
 	int ret;
 
-	dev_warn(&pdev->dev, "WARNING: ath11k PCI support is experimental!\n");
-
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
 			       &ath11k_pci_bus_params);
 	if (!ab) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
