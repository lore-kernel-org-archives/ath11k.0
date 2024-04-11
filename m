Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420CAC4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=ykF3ncF5okOCRb5h4Co/In2nTk
	T4IKyguDeOyi7denCKMD6K5FGQpel1hMP5LWnxoHFUf3qIY0kMXxD/9bKJd46JdU0Ae8VlqqzrjvA
	AYcqm5C6tSdCgoLzYbzaQh2C9o3lDSbILC9G+YEPh2QZSVpcjYr7BN8+rLF23mUEOM/A0dC097FPO
	NGArpNizjGrI0nOEsEKRf/tzcSWgXA6QT4lJeCot2gIeDy24B1g/orP4Dbb398ZxXWP0+uCThtqiy
	JiOJS8rosChrZVajy8Bqs79I7Z6XW9VJUPN9NXyo3RQxTkAg6yBq2Nrwpj3D17PM4caBWn9ri/njr
	Zs/e0Rbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvx0-0000000CclC-2ftf;
	Thu, 11 Apr 2024 15:02:54 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyi-0000000CJWQ-1FO5;
	Thu, 11 Apr 2024 14:00:41 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so5782782a12.3;
        Thu, 11 Apr 2024 07:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844033; x=1713448833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=;
        b=LJxcP33CD7eeEiyDG0ZovzGdjB8ZBduzLZX6CuAspVvSYNONE/urVDmhGIYLg6QEI7
         IInlB8X6XHSlMKrX/a7n/Bkf3GstDY/8HvDpVHCpB3D4n8Y9oIziSfehbBjAFXOqtRf7
         dPAOo6GSsrNzKRKJQdyg/my8J7wjTZI6t+r2S7Axgzp5txW5GlVagOIA0y7UnDPRGmzo
         a4xBR1Lj6LRXuhF7ak+bPjj7ONIz2zFQ9DYk0eCEWyVU8M0SNYA8JEawQib/sntYQwFs
         3VMhdGEMe0ToS8/FGw7VtHtNyP2wouxxZPlaiA5mKQBZ1gozWuKrFzyLgmLfROYPUyCq
         zFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuR+AIiBYBEDE+1PlHdinfU6J33e9ajzM9cxK3UFQpr/hSdlCclr+8Rbsq1QC6r2jrrq+QHsFJyYJohUJgQ/PMQ1lstU1aSzP9ZWERaaj+4E/fKTP0Jpoja4+m41wpDJKPkUUyoJwECg8V4kLWxxDbZG+PWDxUxzOrytxabJ6K9b76GkrbFMTwDuOXmwJN0Qh1DQCotbnDQg4yk4Vdgg7wlnNhVdNkGr4txYk811Xawg==
X-Gm-Message-State: AOJu0YxxAcXdujQKN1Mx/oNSOjYsxqLLmd9V3xWv9niZpD8lDGRPTb+G
	eEM+TfP91I1im5DSCZ+HglvHoZPa/AmRBDW1R32n0KA8U5kh1bre
X-Google-Smtp-Source: AGHT+IFud+Eom8L4ZFwJRqHZVgEqfH7X88Ie/XPPj8tgIpWpDGGDBjHw1/LfCtyATsqdzgihSLhWLQ==
X-Received: by 2002:a50:cdde:0:b0:56f:ebcf:bd94 with SMTP id h30-20020a50cdde000000b0056febcfbd94mr1037512edj.12.1712844032908;
        Thu, 11 Apr 2024 07:00:32 -0700 (PDT)
Received: from localhost (fwdproxy-lla-111.fbsv.net. [2a03:2880:30ff:6f::face:b00c])
        by smtp.gmail.com with ESMTPSA id cs9-20020a0564020c4900b005682a0e915fsm733377edb.76.2024.04.11.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:32 -0700 (PDT)
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
	Tariq Toukan <tariqt@nvidia.com>,
	Alex Elder <elder@linaro.org>,
	Nick Child <nnac123@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net-next v6 07/10] net: ibm/emac: allocate dummy net_device dynamically
Date: Thu, 11 Apr 2024 06:59:31 -0700
Message-ID: <20240411135952.1096696-8-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070036_942753_9EB6825C 
X-CRM114-Status: GOOD (  12.93  )
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


