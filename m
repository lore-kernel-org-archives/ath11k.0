Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E35C10F1A
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=cYVKFwPBcvEqETdDDVwuCZ/4oV
	+JKAcf7cFGLvGbEwefPTUXWO8/lXsoNy1K3E7SUvi7KFryZxHqfvChLWmv05D0sjtt9meAbioSITi
	+4QQ+lk1zsl48Fh2AhPsRJBAbZXbRfdC2NO0mTido913VKPGaVgSKxu1DrHgfOpsun/N+uNWTjN8M
	1MIfHz5CsLoVeqrd36JWHCbyMP949Y9b3Bh/TXtJoKm6ir2zNO/1wsZN2YxgJSw1DtsdZW7AxzP8a
	o64t2KofapMSvNGH/kZHmxhx03U01EXtsiMJfZo9aKITPpzaWC8Uv/3TGdvg8i0cazE//0kMo2Sdf
	Q5nc2x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryszN-0000000DXye-3euA;
	Mon, 22 Apr 2024 12:41:41 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxq-0000000DWsh-1I6H;
	Mon, 22 Apr 2024 12:40:12 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-571bddd74c1so4081296a12.0;
        Mon, 22 Apr 2024 05:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789602; x=1714394402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=;
        b=LN5sixlHZ8f8WE8vm07WkHDW/D60dT4KiNkIdCRH2Djf6JAPGfWa4tVGPYbVaMciKg
         NK59acOyWf+HDXukkbgrARdn3ma80G1K9CL+PBgBa3vqJb3X192YjK20yWUczo0BvVyk
         4Y13IG3HWv9xgPuQwgH0RSxwLaFN8ZHx2GciGglYwsIcSP3P2g5Y6c8oGxVQCBXrmuLz
         vXJCk8HaUA6jV0oTq0eBiy1u04ZwIwOtyHzAVr9xLKoImr3L2RcQH5XfYZFuPvmZzNSf
         GiGeiGpVZYkdE4GzSsZCLwVFef5YBDZ+EKQGjAf5w6m6Ngn64q2U8eBr6gSrZyDQy98H
         Mabg==
X-Forwarded-Encrypted: i=1; AJvYcCX3yuuslSiXRlny/7f9nthDxiuqfoUNhGP18VRX/1s4aFBtZiA5MxARLYgAQ75Cfufz/En7+170TAPDWCBpzwnwmvmJ0w3KRtorEoV/HP1s+GAhp9t9C50/ocj/gR1RWCfkoVdXBz3N91+xAbe0bHjUzCz84H4iYkMKwO6ckYyl1JL+Fsk+nNLdQGKqob9kvsnG4lPL8ia02auwm1f8Zp2aABb/o161pmwn4gPYBBToWQ==
X-Gm-Message-State: AOJu0YyqWf8YrVDIOSdT6lOI6Z4bIWZcFBQPX3/LeInQJBKjSAkytCuG
	nh7H8q793a1mStWHRRyr1dt9dOrprLFLXgBzLKiT+CzGUl27lxBt
X-Google-Smtp-Source: AGHT+IHYhw0Rn+ozFJSEJTushyVa4eDMtV3KSJg5ZGsXSxqJSwj9e3Rtt1XVTXpakF4a8hoFl8I45g==
X-Received: by 2002:a17:906:7949:b0:a47:20c3:7c51 with SMTP id l9-20020a170906794900b00a4720c37c51mr7458383ejo.71.1713789601643;
        Mon, 22 Apr 2024 05:40:01 -0700 (PDT)
Received: from localhost (fwdproxy-lla-116.fbsv.net. [2a03:2880:30ff:74::face:b00c])
        by smtp.gmail.com with ESMTPSA id fy7-20020a170906b7c700b00a55b1253fe5sm1659428ejb.194.2024.04.22.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:40:01 -0700 (PDT)
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
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	Alex Elder <elder@linaro.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v7 07/10] net: ibm/emac: allocate dummy net_device dynamically
Date: Mon, 22 Apr 2024 05:39:00 -0700
Message-ID: <20240422123921.854943-8-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_054007_010161_80990D1D 
X-CRM114-Status: GOOD (  12.92  )
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


