Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF1FCD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=; b=2PzUQH2efjmKr3g1L6dXcJxt3P
	beDPLsL1JtKz5ALH2ofBhkvQD5ZH7d2Ozfle7FtB2BKID6mLqVQWNDq8aeVWceiXMleQeWQ2BUPhS
	TREFJuvhZ2rI4WM15Qp/Ufp5ZfYKKw8syv5ecGJa/hg767CLeJbjLAbyLGTaV7MZ2v298AHRb4rLm
	bJN7H/xg66XFK4LfMHJ8A5Itx3Lqg1m3XXhnRKSHvJvC1KQCw5qQJChm2IjkDtZpW09PkU+kK58or
	iRDDxvP+Q63Qv3+7amRku/PX6mPeXgxdc7JIrPJ1RCqleEkW59Yt8SR/EKb9vGHLoxXodnE6kA5vk
	aCoMrhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqi-000000075vx-2DmH;
	Wed, 10 Apr 2024 13:18:48 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXq2-000000075LO-1jRQ;
	Wed, 10 Apr 2024 13:18:08 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so3741232a12.1;
        Wed, 10 Apr 2024 06:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755085; x=1713359885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=;
        b=fqILSOsIQpI5VWWt6kdd51zHlqz8RyRYn/C2fE3T2vAXiaw0VbJaYecvvvvsm34waU
         Rok2wTq5C2ZdvYIfw+CdH+oUcikCrRmd569OD0jdpUpEHOmtquJWqw38jGECaDF6XaiP
         HnpEt9QUroy7vqB4dFDXMcbUXJEItCRVgoz1l8Y3B4BL/ZEuaPobnzcYbSky+VZOdpIE
         15nmy6TUsc6I2EtLUFgFfMjHZ1UmMw9r9xrALf3KtkVCBg/Eij6Eq61ztQs0Vq6M/In/
         wrcVBeJaplfp53shxrlzXkAbEjcAZI1JS6UglEF9Qp3bWiCggqMjzUa3mZ/z3zQh0RPd
         F0qw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ24hfHO2SP0ByUZiC+mJzkolkpmPcJxTcKrPp89VZJXuIEJrBE2ct/WQEREyvReoRI9BgaQkC/OOQqOaX1NOBgsmYSxbzmgZC5Lh8ZRpKbeR42FITJf3xThK//+w20LVramzntBz18IKslV6ppj6eN3LdebsFSRdnEe5Ng6hVrajjetDPnSUrLllmjMBmMvzak+L5tVjkMWpZ1q4+Q2NZyi+6z1TsKr7mvCw5bZLwUw==
X-Gm-Message-State: AOJu0YxhxOFRHIEuh4UxKyRup0AAjD+jtHpB+UWf3d9aJ4dARIrhmkML
	cgl9UlCXIZaTS7ZO9p8hF5ABu/KGJbwkI8m4nXuh/AEMX5IDHKml
X-Google-Smtp-Source: AGHT+IH7+U+qW5DuChVaZ9Yjnr/uILgb+IAUK0IN9pp6hNnY+Ion9hpWvWwXtUxP7oAsdllTb4QHyw==
X-Received: by 2002:a17:907:20e8:b0:a50:e067:e211 with SMTP id rh8-20020a17090720e800b00a50e067e211mr1583949ejb.36.1712755085041;
        Wed, 10 Apr 2024 06:18:05 -0700 (PDT)
Received: from localhost (fwdproxy-lla-116.fbsv.net. [2a03:2880:30ff:74::face:b00c])
        by smtp.gmail.com with ESMTPSA id gs44-20020a1709072d2c00b00a46a3ad035esm6986256ejc.179.2024.04.10.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:18:04 -0700 (PDT)
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
	Elad Nachman <enachman@marvell.com>
Subject: [PATCH net-next v5 04/10] net: marvell: prestera: allocate dummy net_device dynamically
Date: Wed, 10 Apr 2024 06:13:45 -0700
Message-ID: <20240410131407.3897251-5-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061806_512096_118647C8 
X-CRM114-Status: GOOD (  11.40  )
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
Acked-by: Elad Nachman <enachman@marvell.com>
---
 .../net/ethernet/marvell/prestera/prestera_rxtx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index cc2a9ae794be..39d9bf82c115 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -96,7 +96,7 @@ struct prestera_sdma {
 	struct dma_pool *desc_pool;
 	struct work_struct tx_work;
 	struct napi_struct rx_napi;
-	struct net_device napi_dev;
+	struct net_device *napi_dev;
 	u32 map_addr;
 	u64 dma_mask;
 	/* protect SDMA with concurrent access from multiple CPUs */
@@ -654,13 +654,21 @@ static int prestera_sdma_switch_init(struct prestera_switch *sw)
 	if (err)
 		goto err_evt_register;
 
-	init_dummy_netdev(&sdma->napi_dev);
+	sdma->napi_dev = alloc_netdev_dummy(0);
+	if (!sdma->napi_dev) {
+		dev_err(dev, "not able to initialize dummy device\n");
+		err = -ENOMEM;
+		goto err_alloc_dummy;
+	}
 
-	netif_napi_add(&sdma->napi_dev, &sdma->rx_napi, prestera_sdma_rx_poll);
+	netif_napi_add(sdma->napi_dev, &sdma->rx_napi, prestera_sdma_rx_poll);
 	napi_enable(&sdma->rx_napi);
 
 	return 0;
 
+err_alloc_dummy:
+	prestera_hw_event_handler_unregister(sw, PRESTERA_EVENT_TYPE_RXTX,
+					     prestera_rxtx_handle_event);
 err_evt_register:
 err_tx_init:
 	prestera_sdma_tx_fini(sdma);
@@ -677,6 +685,7 @@ static void prestera_sdma_switch_fini(struct prestera_switch *sw)
 
 	napi_disable(&sdma->rx_napi);
 	netif_napi_del(&sdma->rx_napi);
+	free_netdev(sdma->napi_dev);
 	prestera_hw_event_handler_unregister(sw, PRESTERA_EVENT_TYPE_RXTX,
 					     prestera_rxtx_handle_event);
 	prestera_sdma_tx_fini(sdma);
-- 
2.43.0


