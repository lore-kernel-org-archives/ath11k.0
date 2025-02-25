Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53369C021B8
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 05:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Alp/86Yl8dv5OV9OIvJcS/PHlfX7ulpzzZhhzjQV/Tg=; b=q/g2oIoSgUFRj+oWtltCBkUYLH
	PabMyqd5q23ays1RiBEorXfrqor0Jjy0gkYZWLnaSzshsJhwAxOVVGxMZ2bfZC/UpWY5V1xuSr5k/
	r9RqT2jB4mTfOnAKeh9gjRx/xh3hhG+HB+nd8hEvNX5GKzoZTWsHM8wpHg7PecVhxdNlyz+TX1yTb
	nTlFOw9swAbTU/w4VaEijbsknVt+z/Vp4w9vnTPW3+Uzq8y35P4XQpZ8LW8xAK2vNDaRNT2RjDizF
	GQbwMDoMhSj+b/Y8f1MlCK7X0xYSKjs6Zr26w+XaQH8G2dh/BLv+L2gUrCneLg7yiznMJbzm2nv+1
	9UyFDSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnav-0000000G0sx-05X1;
	Tue, 25 Feb 2025 05:35:01 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnas-0000000G0qL-1nZQ
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 05:34:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso10390964a91.0
        for <ath11k@lists.infradead.org>; Mon, 24 Feb 2025 21:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461697; x=1741066497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Alp/86Yl8dv5OV9OIvJcS/PHlfX7ulpzzZhhzjQV/Tg=;
        b=nY7SDJ1OK+24cOD7zPvg14zNy2/+EL3RMKe/EMhyRcgnAIvlLwPjtPtO1/wCqckP/E
         s9fg8qH1G+z+vj5hrhS02X9OPd+jc3FO1Vt0PdtAAJ/o1/tTpozDQ6DQ9Fw3Cv9i7CEX
         rkeUt8LlDU4wiqvqsgwEgV4QQI2E5BergSLFaWphrqdcWH17DWRxDWLIM30SUDgLHO9w
         Ge0b+hBHmRzoiQhH2HVl9UZECbjPRa7r9UQbOSkDc7qRJjwX/3EkIOGi8FDAKYRQq5hM
         G+7QzvdMQu9cgOyyq8PQdAIcrNLk+RCU1Gf/syY6ERF/feGwqTWhdhUlQamoxj2Ah0SQ
         uJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461697; x=1741066497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Alp/86Yl8dv5OV9OIvJcS/PHlfX7ulpzzZhhzjQV/Tg=;
        b=hp8WSb/dhpoE75/dBuOAMdZpol0DK6CjsoX3hlkTmZ/szhEWT2ZZQMFMEGTMNyfz6Y
         3xsa+PrQu0erScJwaoVJqfr5G1EnVFx9TuZRy3LVSmu0Ob7MBaP0hhDAU33RJpx3g8lA
         7JiE1XUlKOIWaCoT5pGXRUjHBvF6b8JggsX3+vm1Mel0PDwzIsGCtCckk9Y0fsm85d9n
         fBlHd0Eb9iXln96s0n+paTTydRskVD0pyB8OOShH30T4EX8YW1QARXTQwuK6Q6y3kA31
         uzIPndm0KgIFsbz3hGeu8r8mqPv4VnRd3RoOZAkOUewB2cBAtIgU8zfdYvapUL4nphCZ
         47SA==
X-Forwarded-Encrypted: i=1; AJvYcCXWd9Ru1t0g8qDZOmgqHhbrUqWYiWP2hk3HAgwmfj7on/3qHjigzYPq54s/X0ok7v4Q5pQdkYg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUv0lovdTIEGU1uXrfGtgM+Rlucji0cke1BrP8KAvfdovvqaVn
	Zrm0FlqXBPhrh5Hxr5ZQu7IYtL+/u4InqsM/v9dnjcmQ0paiiUPsjw0+2BvpBw==
X-Gm-Gg: ASbGncs9fsO7L4LiQOUt7GD4sh3R/Ex6fsKjorbtvJRrVm1HTlBcsVLZdxr6YFhBdjc
	jhxbtUqXSaykKvEoTXv11QwUKcxsI5tRm+dIcYU8jYoHAcAHmS52muKgMYxpvNT5Brh4rhTQm7f
	+x8xwIgeLzFhg5XNfTPoxCj+D29GuNO3OF7acZGAVWzKENdgvvXq5wKuS2URsOkIhUVARt87AGV
	IvDO8aiQv2Sjzr/wxozPMNc5AbeBYnHeX0bO5WkxXkUOPcZlWg070OSDqDBkM/+v9EF4OrHAPrH
	W78JmYl0PhFyiDWoIb/ErSU1VPFN/q9+DHhdzdb/DxokYc6bmWVuvg==
X-Google-Smtp-Source: AGHT+IHmuD1aWu/v1EBbeaPKC/rVSjBidCILD+wsg56kWI0wnKQ941LQEdS/f9KRvfrcz7v3nfAKMw==
X-Received: by 2002:a05:6a20:a103:b0:1ee:dcd3:80e6 with SMTP id adf61e73a8af0-1eef517dd67mr30705278637.0.1740461697436;
        Mon, 24 Feb 2025 21:34:57 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:34:56 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH v2 1/3] wifi: ath11k: Clear affinity hint before calling ath11k_pcic_free_irq() in error path
Date: Tue, 25 Feb 2025 11:04:45 +0530
Message-Id: <20250225053447.16824-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213458_461462_286893C0 
X-CRM114-Status: GOOD (  12.56  )
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

If a shared IRQ is used by the driver due to platform limitation, then the
IRQ affinity hint is set right after the allocation of IRQ vectors in
ath11k_pci_alloc_msi(). This does no harm unless one of the functions
requesting the IRQ fails and attempt to free the IRQ. This results in the
below warning:

WARNING: CPU: 7 PID: 349 at kernel/irq/manage.c:1929 free_irq+0x278/0x29c
Call trace:
 free_irq+0x278/0x29c
 ath11k_pcic_free_irq+0x70/0x10c [ath11k]
 ath11k_pci_probe+0x800/0x820 [ath11k_pci]
 local_pci_probe+0x40/0xbc

The warning is due to not clearing the affinity hint before freeing the
IRQs.

So to fix this issue, clear the IRQ affinity hint before calling
ath11k_pcic_free_irq() in the error path. The affinity will be cleared once
again further down the error path due to code organization, but that does
no harm.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Cc: Baochen Qiang <quic_bqiang@quicinc.com>
Fixes: 39564b475ac5 ("wifi: ath11k: fix boot failure with one MSI vector")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index b93f04973ad7..eaac9eabcc70 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -939,6 +939,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	return 0;
 
 err_free_irq:
+	/* __free_irq() expects the caller to have cleared the affinity hint */
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
 	ath11k_pcic_free_irq(ab);
 
 err_ce_free:
-- 
2.25.1


