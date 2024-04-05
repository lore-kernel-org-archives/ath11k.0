Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2018CD11C2
	for <ath11k@archiver.kernel.org>; Fri,  5 Apr 2024 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BGqPmC8OttnSs/eU7zOpIE4pu3ScGIxqadvcYRpWVY=; b=KuoBx9gM1TNL1KlaKIX1Ki+gX0
	A86hFEFGRNPkGLWanP7WG5HdsiKtsB5BoV0/eqmdY2cMuE6fPktOZt2bBmIy/pF/bmXRsZM9qAe8W
	A4BbwnjBhTb285wG3hAVedv/+ruHtgHc6NiDYXxKQBm0ONnFNzwww/Tmt0z3+OFzMlUMLnVGd2JrB
	OYVfgk67coN7e+AZK09Mv92xNvFhMkWyeVsNJNwJQ2GhiMF3U3mrwWJ2rIeZx8I1QzNqrkC7wpswW
	RPBWUgEBDMNSlYv/exZe4rhMU5VfYTFZVJoFOx49NDKcFwXUZO5rWpzlkeTxdzkcUcMHAyQQccCyJ
	zJbTIdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsib5-00000006uYq-0TH3;
	Fri, 05 Apr 2024 12:23:07 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsib1-00000006uVX-1WQR;
	Fri, 05 Apr 2024 12:23:05 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4702457ccbso288980766b.3;
        Fri, 05 Apr 2024 05:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319782; x=1712924582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BGqPmC8OttnSs/eU7zOpIE4pu3ScGIxqadvcYRpWVY=;
        b=w4WB/GQXlepVxEVLOA8+EE8yNu/Rw1r/wiqc9MXzHTPeQF6joZhe/6YrG4H4ns2aWF
         +Q7ZwwDWBgkwciSM/KiX4XpIXiL9q405tz65d0HzyD6xzJpH6bZkGPD5yNnWIDv5Qhz1
         uzjoTjMVtgqzDoQfzQp3aNvfQ7dAU6YWFvgqxcu9G+eYYWEta31RSbpvTWHrxWM9VdwG
         khM42BVDBR7KmR/i77PHcHOUjJw4kL6IWG3c/XfHj55EbSHWEGnFzZ9rNm8aB+D7frFt
         YP0Dt/WwRGQLNyu6qHu6Q15k9Jtdkhtm9zm45JvnUiTY78UAGIRimAQ72n5d/rs/A77w
         mAwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Uf2gJ83B3MWIpJz+QL5qa8GuvlQ7mQBMUBUmCOwFkXhtsa0BALYdTGafgQki0LNxUvFynvlTOU7P8s/xSCR8RWOs2RoW+2jT5vWA886KVxXMNlwE/LZYiZum+h4dqbDL8y5pG3w=
X-Gm-Message-State: AOJu0YzDPTfV8DaGI37MpS1CJv1V7AyzTdxhBuefVZ6F2qvCbqtjanro
	xp6xswa0ieqfHOiRhrplPeq/AppKf48ke3NBOgQ+2UDx+pzIVsQW0RZ+KQD0
X-Google-Smtp-Source: AGHT+IGKha/gW15rqj8yxEmoF6NvPeA67QbKdUpHKFCqgH7dp27+JFAhF0GFak9FbVt+cDFFSgw2vw==
X-Received: by 2002:a17:906:459:b0:a45:ad29:725c with SMTP id e25-20020a170906045900b00a45ad29725cmr803081eja.62.1712319781425;
        Fri, 05 Apr 2024 05:23:01 -0700 (PDT)
Received: from localhost (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id j5-20020a170906830500b00a4734125fd2sm782157ejx.31.2024.04.05.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:23:01 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	imitsyanko@quantenna.com,
	geomatsi@gmail.com,
	kvalo@kernel.org,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/3] wifi: ath10k: allocate dummy net_device dynamically
Date: Fri,  5 Apr 2024 05:21:17 -0700
Message-ID: <20240405122123.4156104-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405122123.4156104-1-leitao@debian.org>
References: <20240405122123.4156104-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_052303_689863_0CA242D7 
X-CRM114-Status: GOOD (  13.01  )
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

Un-embed the net_device from struct ath10k by converting it
into a pointer. Then use the leverage alloc_netdev() to allocate the
net_device object at ath10k_core_create(). The free of the device occurs
at ath10k_core_destroy().

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 9 +++++++--
 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 4 ++--
 drivers/net/wireless/ath/ath10k/usb.c  | 2 +-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9ce6f49ab261..8663822e0b8d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3673,11 +3673,13 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
-	init_dummy_netdev(&ar->napi_dev);
+	ar->napi_dev = alloc_netdev_dummy(0);
+	if (!ar->napi_dev)
+		goto err_free_tx_complete;
 
 	ret = ath10k_coredump_create(ar);
 	if (ret)
-		goto err_free_tx_complete;
+		goto err_free_netdev;
 
 	ret = ath10k_debug_create(ar);
 	if (ret)
@@ -3687,6 +3689,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 err_free_coredump:
 	ath10k_coredump_destroy(ar);
+err_free_netdev:
+	free_netdev(ar->napi_dev);
 err_free_tx_complete:
 	destroy_workqueue(ar->workqueue_tx_complete);
 err_free_aux_wq:
@@ -3708,6 +3712,7 @@ void ath10k_core_destroy(struct ath10k *ar)
 
 	destroy_workqueue(ar->workqueue_tx_complete);
 
+	free_netdev(ar->napi_dev);
 	ath10k_debug_destroy(ar);
 	ath10k_coredump_destroy(ar);
 	ath10k_htt_tx_destroy(&ar->htt);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c110d15528bd..26003b519574 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1269,7 +1269,7 @@ struct ath10k {
 	struct ath10k_per_peer_tx_stats peer_tx_stats;
 
 	/* NAPI */
-	struct net_device napi_dev;
+	struct net_device *napi_dev;
 	struct napi_struct napi;
 
 	struct work_struct set_coverage_class_work;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5c34b156b4ff..558bec96ae40 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3217,7 +3217,7 @@ static void ath10k_pci_free_irq(struct ath10k *ar)
 
 void ath10k_pci_init_napi(struct ath10k *ar)
 {
-	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_pci_napi_poll);
+	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_pci_napi_poll);
 }
 
 static int ath10k_pci_init_irq(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 0ab5433f6cf6..e28f2fe1101b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2532,7 +2532,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		return -ENOMEM;
 	}
 
-	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll);
+	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll);
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "sdio new func %d vendor 0x%x device 0x%x block 0x%x/0x%x\n",
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 2c39bad7ebfb..0449b9ffc32d 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -935,7 +935,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 
-	dev_set_threaded(&ar->napi_dev, true);
+	dev_set_threaded(ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
@@ -1253,7 +1253,7 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 
 static void ath10k_snoc_init_napi(struct ath10k *ar)
 {
-	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll);
+	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll);
 }
 
 static int ath10k_snoc_request_irq(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 3c482baacec1..3b51b7f52130 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1014,7 +1014,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 		return -ENOMEM;
 	}
 
-	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_usb_napi_poll);
+	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_usb_napi_poll);
 
 	usb_get_dev(dev);
 	vendor_id = le16_to_cpu(dev->descriptor.idVendor);
-- 
2.43.0


