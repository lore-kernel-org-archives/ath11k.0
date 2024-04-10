Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B45CD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=2XUmNaZphwNHq6zMqd0ViagAAD
	f0hAHwT2a+6xg3yz8JoM0EzxYgGY1eehtQzIHvWSDx4RM7RQxUsSOo86NZ5A+GpI50FtMekDAKDRc
	PX7I6d7pjCEQJtS3v6h8y7o7a4Dg3aZ/AboJ8Cu2ud5AjeHkDvrcAU/vA4HjSKDyNlr6vrXX+huKk
	eC4unGJWv0Eh3PkCEQeVSycVTFFUgaNy6rLlPxFDH3e5vTjQ+6U+1QW2jmKpd+V6kvrCN51dH5HSH
	eio0ppyExKPI3E6Q3YAMFdN0Oyt0vcBfj0cyJPIorLm2py0Ct4zHUxLP/wFHbXO5Rxq/72y7UkuTq
	voMgx0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXrS-000000076Yk-3OGu;
	Wed, 10 Apr 2024 13:19:34 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqE-000000075VZ-3Hvo;
	Wed, 10 Apr 2024 13:18:21 +0000
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d82713f473so115448541fa.3;
        Wed, 10 Apr 2024 06:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755096; x=1713359896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=;
        b=kwM1V1kGpXnpcr1ebZzp7Bf2T/kHjwqCdwdQWXUk1WRHMv7g/hGzlQgZIZI7BFp9/d
         TWfkFnICfuMrVUUZPmu58w5HdfAX70eTHac7d7DJ1m0rHL2zfa2vbpRf80nVaYidILq9
         geNcuHqhesq6Uy2zFx1a3psVLYZPGHK+3S/EqWktQ+NhzRCrEcgB/Th4iF1nlq46V/Kp
         0d2lIDlD+QTuMrvVcip9zbpgzNJdgIl/h5vqKN9tR24+SG79DNOvwn2rOC0JemiFWGBw
         kIa0SCgfdMWeY4V4m+zu/9gHo5F6YXL/ZtdK/xsYmCnhuaIx/Yrci6KZfJFJSAkyGCS/
         Ufyg==
X-Forwarded-Encrypted: i=1; AJvYcCVa2U28ocyvsAVEp6gAFkFKZUSe/TMmWMD7RE2lYnTtiStxWXC9SVyZuc3b0WBkoV0EdI3A39uUvHiNHjKdC5SjZUa9wn6fnu3OAcVwmQHJHMn3pd6Ltp2uz+WuIAWKVjtwf6n9WCWDW9uLR6TBAhazEgoeUtu6rDKtuk7Xemmp2sqAyVbY6uhzMUGz7I6i8Ik9JzLblZJdspnuBS4kyJa3tYC38qLM5EZMlhfEFk81og==
X-Gm-Message-State: AOJu0YxBQsh1Lwmy9xBwjMzKhKJv9ECrP7uS5H7fW/aWSxsOxz15/aTV
	oTARCCAO72s+4zW2j5VatHO9ZQQ8jzWGvi4VvXZdhhvPENv3Asuc
X-Google-Smtp-Source: AGHT+IGPO9wT0OKbwO/gx4+xhRnOuGA7eN0JCfBeTdRn7c+VdXyJ56ZmoGT8+49f0mI/Xs97HLpwLQ==
X-Received: by 2002:a05:651c:4ce:b0:2d4:49d1:38e with SMTP id e14-20020a05651c04ce00b002d449d1038emr3242747lji.28.1712755096217;
        Wed, 10 Apr 2024 06:18:16 -0700 (PDT)
Received: from localhost (fwdproxy-lla-119.fbsv.net. [2a03:2880:30ff:77::face:b00c])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906b30a00b00a4e08e81e7esm6881397ejz.27.2024.04.10.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:18:15 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	taras.chornyi@plvision.eu,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	geomatsi@gmail.com,
	kvalo@kernel.org
Cc: quic_jjohnson@quicinc.com,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	idosch@idosch.org,
	leitao@debian.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Nick Child <nnac123@linux.ibm.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v5 07/10] net: ibm/emac: allocate dummy net_device dynamically
Date: Wed, 10 Apr 2024 06:13:48 -0700
Message-ID: <20240410131407.3897251-8-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061818_912856_43F79988 
X-CRM114-Status: GOOD (  13.14  )
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

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_device from the private struct by converting it
into a pointer. Then use the leverage the new alloc_netdev_dummy()
helper to allocate and initialize dummy devices.

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/ibm/emac/mal.c | 14 +++++++++++---
 drivers/net/ethernet/ibm/emac/mal.h |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 2439f7e96e05..d92dd9c83031 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -605,9 +605,13 @@ static int mal_probe(struct platform_device *ofdev)
 	INIT_LIST_HEAD(&mal->list);
 	spin_lock_init(&mal->lock);
 
-	init_dummy_netdev(&mal->dummy_dev);
+	mal->dummy_dev = alloc_netdev_dummy(0);
+	if (!mal->dummy_dev) {
+		err = -ENOMEM;
+		goto fail_unmap;
+	}
 
-	netif_napi_add_weight(&mal->dummy_dev, &mal->napi, mal_poll,
+	netif_napi_add_weight(mal->dummy_dev, &mal->napi, mal_poll,
 			      CONFIG_IBM_EMAC_POLL_WEIGHT);
 
 	/* Load power-on reset defaults */
@@ -637,7 +641,7 @@ static int mal_probe(struct platform_device *ofdev)
 					  GFP_KERNEL);
 	if (mal->bd_virt == NULL) {
 		err = -ENOMEM;
-		goto fail_unmap;
+		goto fail_dummy;
 	}
 
 	for (i = 0; i < mal->num_tx_chans; ++i)
@@ -703,6 +707,8 @@ static int mal_probe(struct platform_device *ofdev)
 	free_irq(mal->serr_irq, mal);
  fail2:
 	dma_free_coherent(&ofdev->dev, bd_size, mal->bd_virt, mal->bd_dma);
+ fail_dummy:
+	free_netdev(mal->dummy_dev);
  fail_unmap:
 	dcr_unmap(mal->dcr_host, 0x100);
  fail:
@@ -734,6 +740,8 @@ static void mal_remove(struct platform_device *ofdev)
 
 	mal_reset(mal);
 
+	free_netdev(mal->dummy_dev);
+
 	dma_free_coherent(&ofdev->dev,
 			  sizeof(struct mal_descriptor) *
 			  (NUM_TX_BUFF * mal->num_tx_chans +
diff --git a/drivers/net/ethernet/ibm/emac/mal.h b/drivers/net/ethernet/ibm/emac/mal.h
index d212373a72e7..e0ddc41186a2 100644
--- a/drivers/net/ethernet/ibm/emac/mal.h
+++ b/drivers/net/ethernet/ibm/emac/mal.h
@@ -205,7 +205,7 @@ struct mal_instance {
 	int			index;
 	spinlock_t		lock;
 
-	struct net_device	dummy_dev;
+	struct net_device	*dummy_dev;
 
 	unsigned int features;
 };
-- 
2.43.0


