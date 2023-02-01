Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69796C05027
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2qWzQQvgZhB97s+tjN0VHlR32szIb6i6yk6w+oUllOw=; b=1HW9Vu1wGChoUR
	T9s/6vdDtMlMlu5IsXpXJUAfc3ThSxVemJSFmM0bLsbeT8auZJBhHSKY3Ad5Aib7m/FDykHRkti+3
	qWiLPpLnfgVULhsYi2oeeozZ+3px2wCR3xa30y+8ebX3RId0lqd5hADJNrMbaf6t0D+zCGOpTvYpc
	p3OmBlwK9jS+heEmLliFjiQMFqnU4t0etA6XzSQsj92RpJ4m7ccaBiHrICE+Ej4Nwum+BiZAxSVxs
	zEnrzwxkMnToKz5/gciRUvj95Ff9MtUIKwqz8sICTEfywBdMZfVBl5367IFXj4R/7wJlLkuMxfsuK
	TI7Z784AHPwoKW/5LWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGO0-00CuEn-Jy; Wed, 01 Feb 2023 16:55:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGNx-00CuBO-RM
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 16:55:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id t17so1731354pfj.0
        for <ath11k@lists.infradead.org>; Wed, 01 Feb 2023 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v42abFOaxIlmW4awj8kF2Nh0ZkUL+DGZkQ/FsMg5/Lo=;
        b=VrF1mG7zFBzc+C7jPblzg3iCFvvDjx/+tr7aA+HecgsS4iWudNCaPX0qWgYt2dCN0e
         PUmM93Vz92MUceh+zk1SV2VAWdhH8oePYHYIgZI435fyTmnP9z3hGnrOY3I0PyzsNeWs
         tHMMajIgi3fbTPiqhxmZlJiypDtRj4yIt4mXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v42abFOaxIlmW4awj8kF2Nh0ZkUL+DGZkQ/FsMg5/Lo=;
        b=fWlNTXcjr+q7d9WZte0k0nyWHJQMKO428CrYxM3L2MN9+sPdUiVCwoFsMZYUktdNTJ
         TS0qsplqV81db9qEfwMhYJoWt+1hDD8OSC2hkWESAj874JCnCUAXTHjkZqsKVO4+/PoI
         SM99bowaKHnAK+Uky90rkP7WY9oiQu4gOGCDfAUMy8SgCXNnpiFTJDiWEFabpDIsj2nO
         8jR4Ym0LEwJk9d6OESB91jF314jpQAbqoS+3mNzotzSOLmrV2OYJ/yGeryVjTFPsKqQq
         8jUbbvrqzkWidNDhWqoQrw86LsnsL7xSSPI9UMfPJAPnHmvcL5vYZfEEL428gAHmMT7i
         tQCg==
X-Gm-Message-State: AO0yUKUnWZStq5gd3fo1gxjUOfIQo/eoLDMw8c2MrIziRZjWxnjLMNyc
	ZZ0+AE9j6f/HpWSOLz++VLT4ceMB4vtSPwIsWxg=
X-Google-Smtp-Source: AK7set/Ngk6EWKR6yWWn0hLrOjHifSFiaIyR4hRkotMraLijRfBa3zbKNX1T18IRweHaOow9z4BwTg==
X-Received: by 2002:a05:6a00:1d9a:b0:592:6313:20fb with SMTP id z26-20020a056a001d9a00b00592631320fbmr2864421pfw.30.1675270494150;
        Wed, 01 Feb 2023 08:54:54 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:ba26:efe8:5132:5fcf])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7870f000000b0058119caa82csm11605090pfo.205.2023.02.01.08.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:54:53 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	junyuu@chromium.org,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath11k: Use platform_get_irq() to get the interrupt
Date: Wed,  1 Feb 2023 08:54:42 -0800
Message-Id: <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_085501_899106_42EDFFC9 
X-CRM114-Status: GOOD (  13.93  )
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

As of commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ
resource from DT core"), we need to use platform_get_irq() instead of
platform_get_resource() to get our IRQs because
platform_get_resource() simply won't get them anymore.

This was already fixed in several other Atheros WiFi drivers,
apparently in response to Zeal Robot reports. An example of another
fix is commit 9503a1fc123d ("ath9k: Use platform_get_irq() to get the
interrupt"). ath11k seems to have been missed in this effort, though.

Without this change, WiFi wasn't coming up on my Qualcomm sc7280-based
hardware. Specifically, "platform_get_resource(pdev, IORESOURCE_IRQ,
i)" was failing even for i=0.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Jun Yu <junyuu@chromium.org>
---

Changes in v2:
- Update commit message and point to patch that broke us (Jonas)

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
2.39.1.456.gfc5497dd1b-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
