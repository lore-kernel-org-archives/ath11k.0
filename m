Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D36FCD1284
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=XngZ+7BZUTb5dypfeya71TK4cW
	m/kk850shIld83Svg226TumbivoXtFSsYVjdEHPLN4IqwKDeUB6Vm7OVs1Ns9IiID4cY9FPq6/jdH
	LLWCl9nN2WfAQnj8tNeZU/oqnXPFph61x7td7YOs/CmYypajat/aggt2jGTiZJDjwdnMBHQZPHHii
	C8LX8XuSGe0kmno3yPQ8dufllVYjvB8G9JtO6bVxN2vLVf63evZg2TQKNHDjim4Lbq0GqIJ8N5Fke
	rLZmJewwbZ62d25xmxfOQHT6eHoY0nwaeVrW4+Xrvyv4nT3vjZmYjNz5MkfyH+5FVGZfB7ICTqW11
	VT2KuCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB4u-000000021A4-3I2h;
	Tue, 09 Apr 2024 12:59:56 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3l-0000000207W-1115;
	Tue, 09 Apr 2024 12:58:52 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso22745551fa.0;
        Tue, 09 Apr 2024 05:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667520; x=1713272320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=;
        b=cYxns/BotyBjIkUehRLYwA09rrPGUYHJn4BT96Y9iKf6KktFpneRrF7KT3MWapurQ9
         Rq3qCgH7RLbTztYJctBdnoRmqJSSUPmF5DZDbshQH5m5O/XwVDCP6RopiFFo5me5EsHu
         Z7c4RO6oZMQ1qfQ4AMzW/nXRcI3I6oMEUmPlkNJIUixLcqf1uFjaw0xMvoTnUxMS2r9P
         3UcGG+4q1juDW/c/IBN8gop4DOxpVK2sM2cAW/SFeI+ASUuiy5h+TY4yb79i7DngJmfG
         Fd/hZmSWTUJpNVILmrqsc0ux6LIHr7mX9RACk1Nuwp+JT+pgmGSVxLR62YSCh8I/TItq
         gQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg5WqeKYX2nd1l2TSQz2hWDW98ZiOnNR4rIrq8ehiO13aiTkYPcVIqK/fPkxuZL40SSXs7Uj35U+R+ruJhYYwIBIoDSoq/9j+RVQI9jgoN6zY9FcYVG5EEVZpQFjv0gHowX25CZr/Ydx2+HYYGxzBiBlkRsRrBugIN8cOeuFonDJtN76NjO61+OHA9MdjLJlSv7mKwGSm+xFRFA9LkzpQy7mj5p7/FPoXLT4vnxY97Mw==
X-Gm-Message-State: AOJu0YzsmvQCcrthxG/2p813eLxBoaDKtCPsJXOR+kQERB5gB79uyzmI
	SBo3nj3OG/QV8xF/buv6iJiUh4iG8qyVaXmImDGya5GxNNO3Hz57
X-Google-Smtp-Source: AGHT+IFv2F9tjG1pTfhQ3ayjSwIyYhqoG2h0I6HYPRoOOsyO4a7PYZ9y4kYYkXAVTH8/Ca3Th0oWfA==
X-Received: by 2002:a2e:86d0:0:b0:2d8:a82f:50a0 with SMTP id n16-20020a2e86d0000000b002d8a82f50a0mr1107084ljj.35.1712667520220;
        Tue, 09 Apr 2024 05:58:40 -0700 (PDT)
Received: from localhost (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id q18-20020aa7d452000000b0056e247de8e3sm5224408edr.1.2024.04.09.05.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:39 -0700 (PDT)
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
	Tariq Toukan <tariqt@nvidia.com>,
	Wei Fang <wei.fang@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v4 6/9] net: ibm/emac: allocate dummy net_device dynamically
Date: Tue,  9 Apr 2024 05:57:20 -0700
Message-ID: <20240409125738.1824983-7-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055846_165324_31D69972 
X-CRM114-Status: GOOD (  13.22  )
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


