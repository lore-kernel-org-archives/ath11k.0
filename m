Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763A4C67861
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=; b=UUTVFSVp/UoTmG24DmeyWVdv7u
	an82K4jKn61gaJSQkpdnceLzDc3caV0GqFYOYF4L2cxdaGazigWSzA+p4lNOpcoVTa5bYrcIdTWgi
	DWHrEYvB/C0SA/rpvA7KKn+C62wHMKA6IESiMzl1rlat462kdFCnhG4ndcZqkN/hNe7TRPNrsLNgZ
	Uo6YJ8wYaE94gBOAGENiceGNG/WWiz6QkKB1kWgRHEjN3m/wyoNXXlkrq1BHGA0/MBRxO/feCjQ4+
	raNKRBSkPkeND8y00YoPNJSXe3KSYoS4eMjIv+XYTibGS30avXlMZh1JJkzUc7G1x2o1IsDxHOSFG
	EDT3mdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB45-000000020PW-080x;
	Tue, 09 Apr 2024 12:59:05 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3Z-00000001zzs-2p4G;
	Tue, 09 Apr 2024 12:58:38 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51a7d4466bso488733666b.2;
        Tue, 09 Apr 2024 05:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667511; x=1713272311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0v0jOuLRJCnWd0s0TIZZ1gZgekQUwAKs2R0RJj3DsM=;
        b=uk4INKRRdtWww815cLHkt58IyNdMqaJqxJFK1MKQqR2cx0F8EaZMa/+qExiuUJguVo
         KKYpXtklRmg4S1E7XYq75pB2zPEaeGQsj0jeunQVDd5cvxLE6zP1JW28iL3ONnvXIQud
         bdeWG2uGQeJ3wTbOIONX35bFnoKOP9QFeLzC15kfg4+UjChlVxJVjUDwuM8x2hQuvayQ
         gUHS7FoisRnt9hDKfuiL7kfObR0wLWNocGL4yxZ2ucLi6+JcJZJAyup/SC9d68NanCaE
         O19F0CoB4UTpUUhlpDjkngwrzIx4bl99nu1nRxVG/1Gm87wqI0vmvPSyQ9uEqPHIhJ/O
         7u5g==
X-Forwarded-Encrypted: i=1; AJvYcCVGuVVung5B+hltrew9sFMakkyaqy2gEZYQw79wTPbbn4BgEsiyG+o8RSryHpE68WQXu9iWn3HvGqa97NNxTNHhwXmQRjwAAnluFP7Ej8nfvgt7ERcqe3Pr323zslifj2ZNMUNWNDlscwy0/rAr/aHq8nxFvPSG3zgoXVKiUiq4EUDPs21eo1YVvSLdi9VyeaoNyrPLktlRF826e2ARvUnBIWHU/dmz+Ncze9Fl+rTGjA==
X-Gm-Message-State: AOJu0Yx5XLFoFa6xHtOik7rTO//0wk9M99wIC6TINR2bcwYS+S0YXdtU
	ZVRiSQDXXhzapH5Rpu9MnuVY1FKibXmx6ZPOcwhhJ8p7wzhekKx9
X-Google-Smtp-Source: AGHT+IHyK7ujyUyZh8iF233ZssOvRS6odkm3B+SQqJXDLyPLOk07R78HAolnGi6zyM2diHi7B8+VPw==
X-Received: by 2002:a17:906:11da:b0:a46:d041:28e0 with SMTP id o26-20020a17090611da00b00a46d04128e0mr7230425eja.59.1712667510661;
        Tue, 09 Apr 2024 05:58:30 -0700 (PDT)
Received: from localhost (fwdproxy-lla-003.fbsv.net. [2a03:2880:30ff:3::face:b00c])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709061ec800b00a46d2e9fd73sm5660571ejj.222.2024.04.09.05.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:30 -0700 (PDT)
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
	Elad Nachman <enachman@marvell.com>
Subject: [PATCH net-next v4 3/9] net: marvell: prestera: allocate dummy net_device dynamically
Date: Tue,  9 Apr 2024 05:57:17 -0700
Message-ID: <20240409125738.1824983-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055834_088998_54A03C1C 
X-CRM114-Status: GOOD (  11.58  )
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


