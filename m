Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ECBCD6118
	for <ath11k@archiver.kernel.org>; Mon,  9 Oct 2023 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ggVkdkDjUhKNi6kSV4ABJUS1bTERnhNjYwts9PJWeYk=; b=QdTHJ02ojQ/TVY
	zAOik0mjP/EuvV9UnNDlhsOQIzc/Mq0yZEbjR+yh194CxfUp/wW3rkLTdASnpHkiboXsEaUFoQqQg
	wgrY2FkAYzsvMs8DEnN85OV+CA4Z6lYbtwUE0g/X2DAPNprSJnnwC2KSH6t28pNnJJHad/AVACmE5
	5NUw7ivZf5hNFatLzn/dpMcH7ideJCv+lGkNpjk1OnyxFteUemoi/02vZ6uELjrnlb6LuQvs7NqI9
	wU5Qy7ZZJlVNcQ/uJ+f/4CZz1k5ZKKvEQIih3H4IeulQIeoSH/LzB804hngmQdw3kqJ7tP1DIslr3
	Kbu2uF5kvo6UwSlk3c8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpu7D-00BIj4-37;
	Mon, 09 Oct 2023 17:32:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpu7A-00BIiJ-1o
	for ath11k@lists.infradead.org;
	Mon, 09 Oct 2023 17:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FB4361253;
	Mon,  9 Oct 2023 17:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB7C433C7;
	Mon,  9 Oct 2023 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696872739;
	bh=hEEuhVXB8jp3AkUNOcjWDBzJbGLaSJnvN8RUFaE21U4=;
	h=From:To:Cc:Subject:Date:From;
	b=TYyL+4tOoVHormNoyYzlFs41+kBwRCWzQ1RjpCVa8R+Eg8z+ly8uzQSRc3uL5AQnJ
	 SS/klPxwVxHrdxfK1ahqQ83DANXbmFEl8R/W7p3FuiEjnyZWYODv7d4gwH1r5/FLYv
	 tF4bUi6M2UOba1gdiXweHmR+tSF8f/5zSow2Uw1Wig+T/5qjKxkp+R6R2XEVWYX570
	 3peoQs07wT4hJ4Hwm5BYBo2XcV7jeJTo+KGG4+vHAlOI0MmoO9HE5iZQuM1vZZfhxa
	 ELgXzSpDY4VQ75G5HjtQAlFHxTipo1kmTUbsiDSwLQKlNYbcky6bz1I6fZtygtpSO7
	 t4CC/FsPJcJ8g==
Received: (nullmailer pid 2523356 invoked by uid 1000);
	Mon, 09 Oct 2023 17:32:18 -0000
From: Rob Herring <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: wireless: ath11k: Use device_get_match_data()
Date: Mon,  9 Oct 2023 12:29:06 -0500
Message-ID: <20231009172923.2457844-11-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_103220_640812_EFC31909 
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

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1215ebdf173a..235336ef2a7a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -6,6 +6,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/dma-mapping.h>
@@ -1084,19 +1085,12 @@ static int ath11k_ahb_fw_resource_deinit(struct ath11k_base *ab)
 static int ath11k_ahb_probe(struct platform_device *pdev)
 {
 	struct ath11k_base *ab;
-	const struct of_device_id *of_id;
 	const struct ath11k_hif_ops *hif_ops;
 	const struct ath11k_pci_ops *pci_ops;
 	enum ath11k_hw_rev hw_rev;
 	int ret;
 
-	of_id = of_match_device(ath11k_ahb_of_match, &pdev->dev);
-	if (!of_id) {
-		dev_err(&pdev->dev, "failed to find matching device tree id\n");
-		return -EINVAL;
-	}
-
-	hw_rev = (uintptr_t)of_id->data;
+	hw_rev = (uintptr_t)device_get_match_data(&pdev->dev);
 
 	switch (hw_rev) {
 	case ATH11K_HW_IPQ8074:
-- 
2.42.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
