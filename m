Return-Path: <SRS0=D7u2=LU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F21C49EA5
	for <ath11k@archiver.kernel.org>; Sat, 26 Jun 2021 15:32:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A77461C40
	for <ath11k@archiver.kernel.org>; Sat, 26 Jun 2021 15:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A77461C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=avTILwB1C+rl19t0XboyZM9fC5t1n/GkutERhuCB6Y8=; b=3xQNj6EufKGioz
	tk+38oV9IX34yVCoBqgqjD62h0qlvFryr44r7ms5nn6+OJUdqj9ml1+CFagqjQql5TagVVS6ysMCV
	FK77C8efpH7+GsWl275SUGUIYHnOoelBXjFCnSgIMTS9hHLU7LonN9pPxwP9XNTczxj1SE2HlUCyf
	A7Vqzjt54yHN7BQq1KITiXgtsfJIRoapR0wr1b4OmiUTwpilA8rMHrQ+0x4R2qp8HtAcHuw83eoNX
	4C54H5w6rAdbZMQNhyF3vOMMkAoBiRwtz5qWbrp6l8NxBvqomKKD0jbc6m6x5KkQ8AI5GiPbCcety
	TXpcLhehCux2DcHj+vmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxAIg-004MWO-BG; Sat, 26 Jun 2021 15:32:54 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxAIc-004MT7-V5
 for ath11k@lists.infradead.org; Sat, 26 Jun 2021 15:32:53 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d78 with ME
 id MrR62500921Fzsu03rR6lY; Sat, 26 Jun 2021 17:25:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Jun 2021 17:25:11 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org
Cc: ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ath: switch from 'pci_' to 'dma_' API
Date: Sat, 26 Jun 2021 17:25:04 +0200
Message-Id: <9150bd6cde9ad592aff8ee3ad94dffa90b004e89.1624720959.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_083251_338027_90F48A86 
X-CRM114-Status: GOOD (  11.09  )
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

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

While at it, some 'dma_set_mask()/dma_set_coherent_mask()' have been
updated to a much less verbose 'dma_set_mask_and_coherent()'.

@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@ @@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@ @@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@ @@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath10k/pci.c |  9 +--------
 drivers/net/wireless/ath/ath11k/pci.c | 10 ++--------
 drivers/net/wireless/ath/ath5k/pci.c  |  2 +-
 drivers/net/wireless/ath/ath9k/pci.c  |  8 +-------
 4 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 71878ab35b93..4d4e2f91e15c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3393,19 +3393,12 @@ static int ath10k_pci_claim(struct ath10k *ar)
 	}
 
 	/* Target expects 32 bit DMA. Enforce it. */
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		ath10k_err(ar, "failed to set dma mask to 32-bit: %d\n", ret);
 		goto err_region;
 	}
 
-	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
-	if (ret) {
-		ath10k_err(ar, "failed to set consistent dma mask to 32-bit: %d\n",
-			   ret);
-		goto err_region;
-	}
-
 	pci_set_master(pdev);
 
 	/* Arrange for access to Target SoC registers. */
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 646ad79f309c..5abb38cc3b55 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -933,20 +933,14 @@ static int ath11k_pci_claim(struct ath11k_pci *ab_pci, struct pci_dev *pdev)
 		goto disable_device;
 	}
 
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(ATH11K_PCI_DMA_MASK));
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(ATH11K_PCI_DMA_MASK));
 	if (ret) {
 		ath11k_err(ab, "failed to set pci dma mask to %d: %d\n",
 			   ATH11K_PCI_DMA_MASK, ret);
 		goto release_region;
 	}
 
-	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(ATH11K_PCI_DMA_MASK));
-	if (ret) {
-		ath11k_err(ab, "failed to set pci consistent dma mask to %d: %d\n",
-			   ATH11K_PCI_DMA_MASK, ret);
-		goto release_region;
-	}
-
 	pci_set_master(pdev);
 
 	ab->mem_len = pci_resource_len(pdev, ATH11K_PCI_BAR_NUM);
diff --git a/drivers/net/wireless/ath/ath5k/pci.c b/drivers/net/wireless/ath/ath5k/pci.c
index 43b4ae86e5fb..86b8cb975b1a 100644
--- a/drivers/net/wireless/ath/ath5k/pci.c
+++ b/drivers/net/wireless/ath/ath5k/pci.c
@@ -191,7 +191,7 @@ ath5k_pci_probe(struct pci_dev *pdev,
 	}
 
 	/* XXX 32-bit addressing only */
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "32-bit DMA not available\n");
 		goto err_dis;
diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
index cff9af3af38d..a074e23013c5 100644
--- a/drivers/net/wireless/ath/ath9k/pci.c
+++ b/drivers/net/wireless/ath/ath9k/pci.c
@@ -896,18 +896,12 @@ static int ath_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (pcim_enable_device(pdev))
 		return -EIO;
 
-	ret =  pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		pr_err("32-bit DMA not available\n");
 		return ret;
 	}
 
-	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
-	if (ret) {
-		pr_err("32-bit DMA consistent DMA enable failed\n");
-		return ret;
-	}
-
 	/*
 	 * Cache line size is used to size and align various
 	 * structures used to communicate with the hardware.
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
