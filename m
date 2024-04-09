Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06320CD1296
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=; b=3k0Uk7p9z8asGRaxCWN+4qJBdN
	32SOlAlbC1OLDEM5+mPCAdKOaC5trGYEsRJiNVNEXFfX0jDbd8qkdadgRWtl6sP4cCgTzcLSmyni+
	m7+6Kyw/ES5zvdYJWXS7xr869LuL6r5UHgbdQMyZcdG+oDyjJ1Tse1B2FYz9p45ffLPjT0rnycmPa
	U1pW/Oz7ytnhdWgiijr4fk0+mxhgaWUsac2MPWJFNNwUwRCVHV7Bztu9wU6E6Ka1ehlPpZ+1LQIIn
	AADnJz115Gaccc9qS1iv+ZyCArnytfHsgqd0bZGEKiTji/e/f8NblRSleZRCV32eE8RfydaKec9EF
	RRjkTg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB4L-000000020eQ-3woA;
	Tue, 09 Apr 2024 12:59:21 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3d-0000000202d-25Eo;
	Tue, 09 Apr 2024 12:58:43 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a519ef3054bso503913866b.1;
        Tue, 09 Apr 2024 05:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667514; x=1713272314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=;
        b=mdf6/SiUv5g5aQNQbzWoAk8bcqcmlbtDw7nkFP/tUEaa1fVAfvbN+Ez8VnYHmtk6j6
         nThq1r3NYL9SgOhhRrMkjVABPgl9E3jEE+ejjifEngjHyTWPyuboN0qR8Kuj69VfkNOV
         fSvtoTbzxS+fP41WD+9RcxGHaFYKMm3oSxgjCIWeH4DfMcm7V4VyU99Cnig3xhXuES4Y
         Pvl6U0yLs5c+A/ahpka9IvvBzYcqKdvDAQc9zTJS28RDBUH5Ky2Xil13zGug4OUc3yfG
         FI0mi3NBfJnRBH+rHjKe4aYNDF45K+ocREH/aDvWgFQv1n9ZK69m0Vi8J6cY9X+Acmie
         7ZcA==
X-Forwarded-Encrypted: i=1; AJvYcCWZgzehrIPxSQkVxMfo9etW+6xq+pQUhZsLLtj/eH9xCjL6MZcteD+oDRqS/G3cbs/Rf5oQoQIlWhe2wOs0kjSCrKVZRzvCUiUD0ELssQ1vBzvkxMmKnwfHoaXPBkiT26EC9/vBZeFOloH1ljyAMLhaCCPZUxufNbmpUduW4pMPZWWb+GFY2uU8xax0P15IY9hVz0lwQUfwItP0LelKL3XnFnA4Vizmfv2CqljRLmn7fQ==
X-Gm-Message-State: AOJu0Ywtt8bEKuEaekyC41W+AODQLx4wz/7Rbd8exEW+H5GZKcVU0Wp/
	4PawDaN1+dWvg48HCqFvprmsFIK9uyQibM36J+/UOmsswoCNCDCp
X-Google-Smtp-Source: AGHT+IFX9vgI8UCCry7BfofE5Ljgb8WBye/SIsxKOnQZrsH4P+U5jyrpZ39NCimgZJgd0natGKodbw==
X-Received: by 2002:a17:907:7ba2:b0:a51:b0e1:8640 with SMTP id ne34-20020a1709077ba200b00a51b0e18640mr9945768ejc.9.1712667514412;
        Tue, 09 Apr 2024 05:58:34 -0700 (PDT)
Received: from localhost (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id ao11-20020a170907358b00b00a51aa517076sm5293794ejc.74.2024.04.09.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:34 -0700 (PDT)
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
	bpf@vger.kernel.org
Subject: [PATCH net-next v4 5/9] net: ipa: allocate dummy net_device dynamically
Date: Tue,  9 Apr 2024 05:57:19 -0700
Message-ID: <20240409125738.1824983-6-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055838_402106_9B86AC0B 
X-CRM114-Status: GOOD (  13.33  )
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
 drivers/net/ipa/gsi.c | 12 ++++++++----
 drivers/net/ipa/gsi.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 9a0b1fe4a93a..d70be15e95a6 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1730,10 +1730,10 @@ static int gsi_channel_setup_one(struct gsi *gsi, u32 channel_id)
 	gsi_channel_program(channel, true);
 
 	if (channel->toward_ipa)
-		netif_napi_add_tx(&gsi->dummy_dev, &channel->napi,
+		netif_napi_add_tx(gsi->dummy_dev, &channel->napi,
 				  gsi_channel_poll);
 	else
-		netif_napi_add(&gsi->dummy_dev, &channel->napi,
+		netif_napi_add(gsi->dummy_dev, &channel->napi,
 			       gsi_channel_poll);
 
 	return 0;
@@ -2369,12 +2369,14 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
 	/* GSI uses NAPI on all channels.  Create a dummy network device
 	 * for the channel NAPI contexts to be associated with.
 	 */
-	init_dummy_netdev(&gsi->dummy_dev);
+	gsi->dummy_dev = alloc_netdev_dummy(0);
+	if (!gsi->dummy_dev)
+		return -ENOMEM;
 	init_completion(&gsi->completion);
 
 	ret = gsi_reg_init(gsi, pdev);
 	if (ret)
-		return ret;
+		goto err_reg_exit;
 
 	ret = gsi_irq_init(gsi, pdev);	/* No matching exit required */
 	if (ret)
@@ -2389,6 +2391,7 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
 	return 0;
 
 err_reg_exit:
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 
 	return ret;
@@ -2399,6 +2402,7 @@ void gsi_exit(struct gsi *gsi)
 {
 	mutex_destroy(&gsi->mutex);
 	gsi_channel_exit(gsi);
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 }
 
diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 42063b227c18..6b7ec2a39676 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -155,7 +155,7 @@ struct gsi {
 	struct mutex mutex;		/* protects commands, programming */
 	struct gsi_channel channel[GSI_CHANNEL_COUNT_MAX];
 	struct gsi_evt_ring evt_ring[GSI_EVT_RING_COUNT_MAX];
-	struct net_device dummy_dev;	/* needed for NAPI */
+	struct net_device *dummy_dev;	/* needed for NAPI */
 };
 
 /**
-- 
2.43.0


