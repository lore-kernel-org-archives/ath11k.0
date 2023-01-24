Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5DC54EB4
	for <ath11k@archiver.kernel.org>; Tue, 24 Jan 2023 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lstx581j3O8h/WJPewcnRs9jd61x2IxSrR3Yh8VE1BQ=; b=I6AiXA2h7eCegp
	qwjV/Wxm00hpqM2ma6Ecgzqz48epoep5Z34kVbZfdInI9CedRy+9/J814lWzw8tZ+XD2gZoO0HAuE
	+KfKaj4xsD2PytOym9OY0ha51G/uc9t/LTwfS87/08ox3+/z5b7RyhLVz7THE1Z8EfLAuir4R/MkU
	QmfjBsLhPgkmPi6MWRq4OlatkeTy4z3e5L2JDUkTSEbZ5n4ddZKACQvTFqPR34e29kxTa1vtRrU6m
	KAsICxH2ZwXK/DZH00U5v7gc9XD2QKEkURfr8IHAyYlsyKZTCcc9ngC0BspUsTUBZVY5j0k0SJTCt
	VqeLjphuYt9JvWdo4TAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKOXy-00503q-35; Tue, 24 Jan 2023 19:01:30 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKOXu-00502n-Q6
	for ath11k@lists.infradead.org; Tue, 24 Jan 2023 19:01:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so19606082pjg.4
        for <ath11k@lists.infradead.org>; Tue, 24 Jan 2023 11:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEJDfnpuHczelrJ6vp0fb1JDaeIwWS2iq2BACn7e/IE=;
        b=ZPjYuk0ya4aeNvJO7qCFVWhUdg0oqrtCfCmpbpBLA+ntney22BIz/3+x+FcjsEArwy
         EhC1rTUOzPpnWRcgDlgTPkpWxjQVhxbNJKGVBjVKQb4u+qsL8owwjnObWFkBj3oGR3sl
         BW7yKEPe0fUVC9ATGwooiBc7H5EhIV8q26nao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEJDfnpuHczelrJ6vp0fb1JDaeIwWS2iq2BACn7e/IE=;
        b=Ao4j8E46gXLPwxk3SaoYuNyWZnldevmEoznfLj85HF/uWsScl3pnbIdwu9gK59wjIa
         9ibi8tjc0D7uyRuqTTpN/F50oOBaq//VjVUQORIo/XAV6z07UeYyiPOdT+dtlAZXGTnD
         rDGGyQQzln5Kih+rL6jkjpJml2V3Dk8YFg/F0tMbgLsMIwOizjCeW+lRfDsThJHpU3JM
         jlUJMJCYL6q62SMSLLau/3Vt6ehY9zeP/ovhqc1mdPXd0HNi/RtFoDwBHxzQHAHPM9Ko
         T+6RpZkf9XU1V5Y9ZNl2IoJyztye6pYfjHB3hEh67SBvlPE8KFS1voBYIqlrvXH6HimL
         Dx8w==
X-Gm-Message-State: AO0yUKUMtiYaqQVc680jOgE+rJlnbgpLtsWxml8L3sS2i/7ElNYXg8ds
	q51hXDOTJqWkaZrhoArCayKfJJhPuVp4EfkZ
X-Google-Smtp-Source: AK7set9PfKKjjgxVS13+YwcKa14yZ/3qzh0IOTUKCI7B6Y/ZCJe76Mnqs2L7VttHh0r/YqkC2bCS7Q==
X-Received: by 2002:a17:902:e747:b0:196:1d89:7002 with SMTP id p7-20020a170902e74700b001961d897002mr1941570plf.31.1674586884928;
        Tue, 24 Jan 2023 11:01:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:7b28:de8d:ee0:2cd6])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001948720f6bdsm2010415plt.98.2023.01.24.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 11:01:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	junyuu@chromium.org,
	Kalle Valo <kvalo@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath11k: Use platform_get_irq() to get the interrupt
Date: Tue, 24 Jan 2023 11:01:00 -0800
Message-Id: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_110126_885925_612C579A 
X-CRM114-Status: GOOD (  16.29  )
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

For the same reasons talked about in commit 9503a1fc123d ("ath9k: Use
platform_get_irq() to get the interrupt"), we should be using
platform_get_irq() in ath11k. Let's make the switch.

Without this change, WiFi wasn't coming up on my Qualcomm sc7280-based
hardware. Specifically, "platform_get_resource(pdev, IORESOURCE_IRQ,
i)" was failing even for i=0. Digging into the platform device there
truly were no IRQs present in the list of resources when the call was
made.

I didn't dig into what changed between 5.15 (where
platform_get_resource() seems to work) and mainline Linux (where it
doesn't). Given the zeal robot report for ath9k I assume it's a known
issue. I'll mark this as "fixing" the patch that introduced the
platform_get_resource() call since it should have always been fine to
just call platform_get_irq() and that'll make sure it goes back as far
as it needs to go.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/net/wireless/ath/ath11k/ahb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d34a4d6325b2..f70a119bb5c8 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -859,11 +859,11 @@ static int ath11k_ahb_setup_msi_resources(struct ath11k_base *ab)
 	ab->pci.msi.ep_base_data = int_prop + 32;
 
 	for (i = 0; i < ab->pci.msi.config->total_vectors; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
-		if (!res)
-			return -ENODEV;
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
 
-		ab->pci.msi.irqs[i] = res->start;
+		ab->pci.msi.irqs[i] = ret;
 	}
 
 	set_bit(ATH11K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
-- 
2.39.1.405.gd4c25cc71f-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
