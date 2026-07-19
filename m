Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAB9C44512
	for <ath11k@archiver.kernel.org>; Sun, 19 Jul 2026 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sGXqOXERG0g5LCnDxjc6HxcIh4ePUmjqAzBWTaTJ4M=; b=obaDaL8D3ZtD/Mjv+NWepg3uFx
	grNdZxCjAZsFTS1xQsiFtUenA6ubDmmyadpXi0ORLlMlS6Xsf2fISmmh2byI2Ykao4qd3yQfs/oQv
	6IGu9t4waVgYa2a4iVtOGM6XOUIin0Lj3eKEaLUTKVwO/UVpUYmVZ9nv2HveAVhXu05uR8Wxa9n1V
	sCy3fyufiYddqSbuQphLUleYsOde6Xx8XNCea6cqtI6yBhrZWNDfOy2eeuubON5Ttmo0PDTcQ/9nw
	zV1geVUKivE2+nve0rij0Y0H0sD3sz1JA5ePzNFl5UDrbQuA64jPYovigsF5+GqMvmMsGZHAEEYJD
	GxNDpjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWs-00000005PE5-18o1;
	Sun, 19 Jul 2026 21:58:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZWo-00000005PBn-3DUU
	for ath11k@lists.infradead.org;
	Sun, 19 Jul 2026 21:58:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c1712a04ddaso499939366b.2
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 14:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498309; x=1785103109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sGXqOXERG0g5LCnDxjc6HxcIh4ePUmjqAzBWTaTJ4M=;
        b=nhVq/KZsB3VI6oBqSXeesVQVhRoNRMHWwAF6nlKAlE5x0XS7CvHbb47Gut6/mhcMdA
         bvMkuD0uVzgSVIyxt97WuFbX39RP1q/J0EJZ7h2Zc7/jwYRAWk/QaVbBr3VZAenfXMmR
         kyHIS+xFkwMLs2KatR8ipkymF4WYX5p1NNp7/vBj0JyiSQzg9XGrqHy33sT9ZB7CzBMV
         g5GlafUR3uip5y38K9tqzMN7O2tA8g2nE8IKRH0OWJvzF05jbe+oLr5DWL1dt62jKrV1
         dmyWRQyQFjbijMtEAetiwxzjFPvOat7zgVQ9UENyXla9uaGRSwqgpWazieF7WXX3miLa
         QjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498309; x=1785103109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sGXqOXERG0g5LCnDxjc6HxcIh4ePUmjqAzBWTaTJ4M=;
        b=QLKJ3MQEAs5UeZs99bshWNjoGya/KfwrFmk76zWPY4DOP0NslUeHd0qaBj7hw0Aw6v
         YMUYdq/MZmkLoNvjF+Rs1LEZIZrkLKN4q5yRIsscCnueumk138mak1X+1+sz8fGMb6IC
         WnKXEQf1hKNdKlM1fKLAlqdd+tsBULazTDTusvdf6Ki9XvyfJttNYZknfda3J/R6f9Hi
         SA/5MNbOomeHNdHB6zffg/KqFvpo/vbZ1/F5MR55LnIqoC3OCzPpC81WeDw79HaDHlO/
         E4umXKIvl0KzTaeB500J2fHsayc2l+O6C1n8jlB7qg6PUfGZBKzgLzFh7zrruxpHsr6H
         x5kA==
X-Forwarded-Encrypted: i=1; AHgh+RpthYCrXXmmoqsQtThH/XIoklN5Z0qxNhVirQLO05huMYPX+ENF4K5fnzoFn+p9JSdkDkKqGz4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKtkVeYITv1L8RF7P4XRML0epSQti07bGjRaOvfoSDGMUQzBgE
	UY9tZllJ9XhIquMjptwxIi4uD2Js4OIRh2P5AvUy1Pm0VDJIgvktZ1/p
X-Gm-Gg: AfdE7cnhizMjQD4ItyCC32YmojRcVYflkhqOjLS/YwtbyMR8ha20+mvYU17BsjgP3iI
	f1U7Wuj3TiQQCQ1Y22HmccvEHupgfguPXdy/2hqPWawDom/lqtGmCHMP0KVGsDJEb33ygHbgA+x
	B8Jk1mU1MmEK3pPWRoAz1EniZ8mSsp2xV5wqIneNld7EYILQjSagu13+wwWub0zd7KcrdP8D1un
	+ZSYNH1RlzUh4V5d6YGIdgy8GvkvrUV3Zty9dYWix/2kngB6eLp3bpIH8xlAxka0nqs6k3VQkvs
	rzETOLif4fN4p3GBvSwMkgZXlIVo1thq9mlwciFhrrpwuNpETqAQvT/Lj1ndMsFGCaKLlF6DQCR
	TRE+m0oHgdDSs2YRJB2omZN5eWmMYS651IT07I9RNe/SuuEFLWqpLT1FGbM0ol/mraFjMnqE/W1
	4ZzQKZo9DNCiE+LnnwjIqrUh3h
X-Received: by 2002:a17:907:78e:b0:c12:cacc:92c6 with SMTP id a640c23a62f3a-c16b48890abmr432532666b.59.1784498308387;
        Sun, 19 Jul 2026 14:58:28 -0700 (PDT)
Received: from nv-msd-x1c.mtdk.labs.mlnx ([212.60.125.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm379116766b.0.2026.07.19.14.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:58:27 -0700 (PDT)
From: Mark Ruvald Pedersen <wabsie@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Subject: [RFC PATCH 2/3] wifi: ath11k: make external IRQ control idempotent
Date: Sun, 19 Jul 2026 23:58:16 +0200
Message-ID: <20260719215817.2468580-3-wabsie@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260719215817.2468580-1-wabsie@gmail.com>
References: <20260719215817.2468580-1-wabsie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145830_821752_FE09ABF8 
X-CRM114-Status: UNSURE (   9.74  )
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

ath11k tracks each external IRQ group's NAPI lifecycle with napi_enabled,
but calls the physical IRQ enable and disable helpers outside the state
guards. Repeating a lifecycle disable therefore increments Linux's IRQ
disable depth on AHB and multi-MSI PCI even when NAPI is already
disabled. One later enable leaves the IRQ masked.

Move each physical group transition inside the matching NAPI state
transition. Preserve the ordering: mask IRQs before synchronizing and
disabling NAPI, then enable NAPI before unmasking IRQs. The outer
synchronize_irq() calls remain unchanged.

This makes sequential lifecycle transitions idempotent. It does not
change the temporary disable/enable pairing in interrupt handlers and
NAPI poll completion.

Fixes: d943fdad7589 ("ath11k: Fix napi related hang")
Fixes: bbfdc5a751a6 ("ath11k: Refactor PCI code to support WCN6750")
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Mark Ruvald Pedersen <wabsie@gmail.com>
---
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1e1dea485..1f1562ff3 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -235,9 +235,9 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_ahb_ext_grp_disable(irq_grp);
-
 		if (irq_grp->napi_enabled) {
+			ath11k_ahb_ext_grp_disable(irq_grp);
+
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
@@ -380,8 +380,8 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		if (!irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
+			ath11k_ahb_ext_grp_enable(irq_grp);
 		}
-		ath11k_ahb_ext_grp_enable(irq_grp);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3b..bf367f60b 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -455,9 +455,9 @@ static void __ath11k_pcic_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_pcic_ext_grp_disable(irq_grp);
-
 		if (irq_grp->napi_enabled) {
+			ath11k_pcic_ext_grp_disable(irq_grp);
+
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
@@ -490,8 +490,8 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 		if (!irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
+			ath11k_pcic_ext_grp_enable(irq_grp);
 		}
-		ath11k_pcic_ext_grp_enable(irq_grp);
 	}
 
 	set_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);

