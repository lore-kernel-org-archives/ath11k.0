Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A910C4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=; b=UuOWEK6/GXYDNkf4hTu3MIAPyN
	MxFEzIut4jCz+HSdjWDSE+0BmilvkEEXknPs4uoOIj+sbpryNHPytGU49U53Zpqsdr0NtZ7NuK5OQ
	HKBzp09jgDCNMxN5KmSs4FWqMtBkKjtprm879HJiYitMyk/rU1eMMB1/0F61cmUhdQL8xCyU3o1od
	hepIGupy8J/Zhs73x2Ob9xKJ4yWQK86MaqFE0xpXNR2CBnWGXv8pv7d3DKBEmNBA3Pf7aa4XzJt+K
	n/UNhen5al5nm2/DqWr5NXy/SbPHCBcC83eLiKOwjvyiptqRbP7P6BZSSrW3CdE5yDOXd2CDEqyhU
	LrbQpzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytz1-0000000DnXu-3d3n;
	Mon, 22 Apr 2024 13:45:23 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxe-0000000DWkL-3oer;
	Mon, 22 Apr 2024 12:39:58 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a557044f2ddso476977066b.2;
        Mon, 22 Apr 2024 05:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789592; x=1714394392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=;
        b=Cu+l5oqTQuUyo1biibHPb5TVcNtwwQ5KJ8qIXqTMXHKlh7nbwwWjkWfwc5l9UJGnqf
         fOWHcazbPGFaoYn2WOU92jX+PbNZZwLXqGOiIzlmAfeOxPbmVBX2qc641so1oU2xSVX6
         CZ4O5fcvQ/TJM/WElkydi1dFDYbcaoTBHjCBmxNVUvcON167xIO14bUKJnbinR3SCGFm
         1Ko70gWtjn7bMe1Kr5Q0RV0qYqFuguCqlDheXGGNhUYBXGXBqydrqQRaD5B3Cx0k7JT6
         2ALygpPsT7c3YrA+MIj1NQk2wBB+Eczh5Y+2+iQbFFBeLbeVvMOAtIVy0LGIFeZ4VR1r
         QUqA==
X-Forwarded-Encrypted: i=1; AJvYcCV4SzYVUqFw2ca4FMG0xy5/+uMwHX3xtOA0+y/+xGstS2lrpNnd19GbWagUaWXLWq0racmp+1a84MD0x6/6xxgzm+i0hNS1cma9YENxfCwq7QxxmFG09PiftRCzKwdVv5RMltj0KnsCYP7tpH8f80xdfmwQdHx72vbclhM/bblnvMiz787kUrbSYM32uSHcCAROn1UL4SbKGJOVD2zEfrG9M0An+noE+cp6b3lT9ablzg==
X-Gm-Message-State: AOJu0YwcsSTQDs+G682OvxjM9tecWYYsj6Otqo71Ln7Ask7JB9Iat+9o
	jdoJJVXFqka7X+LdH1G4HsTylgzM262ZfPhTiaFcUkEP9m6C3wL8
X-Google-Smtp-Source: AGHT+IGHbh2X84tfuM0BxvxkSJ4a/Te4rvJmXfwdgWIdWRMMTjRGBDQP4P9Ep594uDPYAWS3wGgSnw==
X-Received: by 2002:a17:906:1c5b:b0:a51:d204:d69e with SMTP id l27-20020a1709061c5b00b00a51d204d69emr7213996ejg.7.1713789592388;
        Mon, 22 Apr 2024 05:39:52 -0700 (PDT)
Received: from localhost (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906591400b00a51d3785c7bsm5686475ejq.196.2024.04.22.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:52 -0700 (PDT)
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
	Elad Nachman <enachman@marvell.com>
Subject: [PATCH net-next v7 04/10] net: marvell: prestera: allocate dummy net_device dynamically
Date: Mon, 22 Apr 2024 05:38:57 -0700
Message-ID: <20240422123921.854943-5-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053956_130006_5C99CD32 
X-CRM114-Status: GOOD (  11.17  )
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


