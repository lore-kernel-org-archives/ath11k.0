Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B9EC4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=; b=c1hH23Ub8gP6e0wC7OlhijvNgc
	VoOt/fYjfAyWJJkjriYB+K+P3nO3nJFEJqXtk06OEoSniiLEDj5ayk+O+hI6SWU/HN+vwVRZkKC73
	Ahdvayffvq8iD4nC+heys2eL8T9QgUDtSAGrqx5EBTvIYtO6XJjZV2YfAcSoAd6adHDEcVjrBbZLx
	hXhZElRwEz2nYyI2Mny6zjp4sXT1F187V1fBVARKWl+UTCzFdL9gW4MASZ7bbgSdVNs9NskuQKWv3
	kjx8fRiyd3XIqoGsTpirHqBp+X5/tncXo9fB/WsIfHAg1mqdESauGbDgUoG1VP8d4GD4oQ7ukrzS9
	VYnWGvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuzS-0000000CKBx-2aWD;
	Thu, 11 Apr 2024 14:01:22 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyc-0000000CJNz-1WJm;
	Thu, 11 Apr 2024 14:00:35 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51beae2f13so621428066b.1;
        Thu, 11 Apr 2024 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844023; x=1713448823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=;
        b=Zm0DXy9TR33d/XDpS8Xnm9A70HTE2auH6z4wsdNENJFwod1K7dty3JgYayYL+4n2tr
         siXjs5oRApVHZ8sK/1llI/Fn7A5Rqv3Azs2E9QfAqWd+D1CqAFb9xcC+SJKaJCRaa/ug
         uFJFVxkeseUrYgg0Di4NIrAvOQZ1wJU6rFgo2o7Ygfc+P/jFkv6pcQKodwEwI973KBAB
         5RfDoi+FcQRPAXbyiytB4uyVks2I4zOP3srK5JXBwde0F0O8sqQ99cwIMAAPKme39zkR
         DkRbsXI2lcYFyL4Ld7GrQ1kIgwOj19bQ5CpgVXV4OqZkGYNzBBXqMfI2yWkg4mp/soGp
         1wpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+yBJScP4ABOowRSa7iDcgVCdXo3a0M36nQpuqdwbUINEFlTDk2K0OiORm+DEKWvFBvuRfxZZCZJv6D7vIpyYzcMyeoPQokcXGjYqvZcbMjlSaefIWTY0kg9yh3lwot0amo7djtti18Hnizva0KmV0VVhCl9r3Fe7+5MH7gALryZf0WWwSwcwv2aYnpt8/K4NYNTmxu484h6e4YXfOv3ZJnDVgQIuR/cqejWEY8uBwqg==
X-Gm-Message-State: AOJu0Yy9MlosO/pCoGOW4Kv+0TtiEBsIuFxh5eSU/+Fj/odkDH1uSXH3
	evGd9dxnLJvJOVyxVHo2DFKdm2nQunFaK0+a2WTrQ9s2c9ZRfbmM
X-Google-Smtp-Source: AGHT+IFTqR/jZFnHmzm557r9/orvtXq98TQqJsnkJeh4/hAmpJeNcj3bTkWrbtWZGaebbkVxKmYtuA==
X-Received: by 2002:a17:907:7210:b0:a47:3526:2e0f with SMTP id dr16-20020a170907721000b00a4735262e0fmr4354803ejc.75.1712844023166;
        Thu, 11 Apr 2024 07:00:23 -0700 (PDT)
Received: from localhost (fwdproxy-lla-118.fbsv.net. [2a03:2880:30ff:76::face:b00c])
        by smtp.gmail.com with ESMTPSA id hz12-20020a1709072cec00b00a5226401c60sm454107ejc.107.2024.04.11.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:22 -0700 (PDT)
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
Subject: [PATCH net-next v6 04/10] net: marvell: prestera: allocate dummy net_device dynamically
Date: Thu, 11 Apr 2024 06:59:28 -0700
Message-ID: <20240411135952.1096696-5-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070030_882935_E2A85A04 
X-CRM114-Status: GOOD (  11.18  )
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


