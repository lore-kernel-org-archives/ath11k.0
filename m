Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81FAC021BE
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=; b=AMxkZyYvlwrp6KdiZ6hyLDoDos
	x7/WyF3YVZnPrWnsrT4Dd1DsoQMGh5uZ1phfSSzUi2a3Iacsvwuue5M36SjPTlSsx73ohv3P0U1vi
	1VTuR51x7TgSAizRQC30IhjJYgkUDmhuBx2xrFj2N7aTtSx0p8tMlKt1jZXk+5MC//r7mk3HV+es1
	9+xDngZBRBd+NEX8SKjgGLpkkQF6P9JC/WEQpxo4C3EVWFDvIJscxrvYk9lUvQPHhHJc9EbO9WALF
	utCttbsUJ0pgmCvO5Ayk6IZzufcuEsEzU9NnFw4AUI1rIlIaVnKwReEAuS05Sy+tBgXaFI0oef7e9
	RSm92vVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnaz-0000000G0wk-2OU2;
	Tue, 25 Feb 2025 05:35:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnax-0000000G0uJ-19hl
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 05:35:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-221050f3f00so117108635ad.2
        for <ath11k@lists.infradead.org>; Mon, 24 Feb 2025 21:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461702; x=1741066502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=;
        b=b14wgRUN5fjZBH7AzcNpO2TL+assjFzdRiIoFUGRjVRnewwmIzqodtMsv8zP7BeCDq
         YwtzXxOzpqYmLYslygukDS0/OeVCtt/732ghnklzCIcELyXUAg57wpDYFwEd7ZVfR1Nm
         7q/1J3q3WGIoFqA43nrjWuKZK6r1GmX1ZjxAr+7bancsXvZ0yer2i+4xCPvU5mY72h9m
         Luv6xymEEu0giNqbzvuKBYQCu1+Yw7GViferKmcqJtvbpf6EondXHs7RBLd1IX0xF8l1
         Zf0TCSbr0pvSATtEKjCU8jmkkaIibT1V85Edef1dtjiiaEzBdYVxGYpYUqZkD5wX3BVM
         oMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461702; x=1741066502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=;
        b=onIfK1bOA5SHjju3LkBk77uxwXkF9r9v8xu5tYxTq7JasF/pA7IdXpZ4cx+JUVZgSi
         MxwgBZgQ8ovwBGKiQnhkL/B4SUaQu8B8IIIUONGTeZxLFjoEu1eUYOkUKJ6xBGfeq/aU
         zmn01F00teVHH2lpyLLRR7fiC7KNtUW7FwPKjw6hPGJVARhxHwFBD/1NKDbHgn3yOSmA
         rC2wxeJqo/KIRW9TjZufcbFajQEA96UjmRC/R/DkFXqkwMk4bKlvyQ+o2orb4POQRqtz
         irAcljVs8ohBzp8whJyedgzeHs/2fAX6+OVFq3r6a3j3SiD69Ou/jdV4XXr01HNAcS2T
         ewcA==
X-Forwarded-Encrypted: i=1; AJvYcCV7tUguzeVbJLNBtnN+nKTHpursz5SJxif4SuoDSJeWJAMF3ZZJErynib2OgCXkSAENSY3Ra7U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5aIIt2oI3h2vy9EPZToOb1mj7CbOoiwrEj1EFHGMPmAQav1kt
	FOxit1PJ4E2MwgpYREopdkhhhf2ifwCiMcP0Cu2/OZ1ZEBaatkRI3xlLM5ED0w==
X-Gm-Gg: ASbGnctNcsayFfsdFa8sAn+F1qyDZfPY6qSx7M0RGm2zBmp69BfzxBC4rBxmoRBLjYe
	3UU4S7OAFy8t9lIUieeMH2NPQliBAZnHUjqoreYzG8VnhQyLq4lYaJA0u38CkXKRw+lWnWK/eBE
	QqwtRAC/3XEZHSmcXna6lLW4PdD+qg5IYji52yh5bBcrK0zVg9HgJZeqjGmNpQciKU58NGi8wxc
	V8X6s0bOtBQICE5Hm95d3C5oOTy4khcHPwN4x+kIZQyV8hGlrWiMG5whz+u1Gdod6RbVGY5BoIU
	kC+shHZSUm7a/yi3GCIoqhjJgd+/Rf8BSVjh1JdOEPgu8OZbnS03MA==
X-Google-Smtp-Source: AGHT+IEHljzwJD36eza1aeKcaU2dWlFSTtvnEQrg+fmzOtR5w21SUg7QvbAbtZaZAXH1YQPPhdGwlg==
X-Received: by 2002:a05:6a00:2e9c:b0:730:8526:5db4 with SMTP id d2e1a72fcca58-734790f8cfemr3218117b3a.13.1740461702511;
        Mon, 24 Feb 2025 21:35:02 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:35:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/3] wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with irq_set_affinity_and_hint()
Date: Tue, 25 Feb 2025 11:04:47 +0530
Message-Id: <20250225053447.16824-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213503_318569_00DB6321 
X-CRM114-Status: GOOD (  10.02  )
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

irq_set_affinity_hint() API is deprecated now, so let's use the recommended
equivalent irq_set_affinity_and_hint().

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 +-
 drivers/net/wireless/ath/ath12k/pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index eaac9eabcc70..be2791cd79d5 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -735,7 +735,7 @@ static int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci,
 	if (test_bit(ATH11K_FLAG_MULTI_MSI_VECTORS, &ab_pci->ab->dev_flags))
 		return 0;
 
-	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
 }
 
 static int ath11k_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 2851f6944b86..9883cb2de548 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -646,7 +646,7 @@ static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
 		return 0;
 
-	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
 }
 
 static int ath12k_pci_config_irq(struct ath12k_base *ab)
-- 
2.25.1


