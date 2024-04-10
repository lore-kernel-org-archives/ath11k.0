Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2DECD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=; b=sMx1lOGEVt74zAiLKtuT6tzk9E
	um6q2AwlUYQTF1f4kTafUbAClIUYJjtbSHOMN9kF7YdIMaUqw5K+q6YJe1NSJ2QVmXx6v6ahzwNII
	b8OA1h6JGOuDsYPj0Gj90r22Dn89h4w4+7kBeER8iJlxFDFy2We1lLz6582Usuyw7UHsMDHe6ErQ8
	G3WKrteQVUBmnlO3olGGsE2lrSBNVEBUBwrp2nS5/Rd3GTrjCSSx1k3IgZhjLD7eQsxjHhsjEx7sd
	QLQ30LEMc6o35g4SoH/EgmFlWbfd/RZAce9TeXB6DTsf5YBpFu55WzTwhxq3bQTUYEUhBebuSvs9C
	fDwt4idg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXrH-000000076O9-0Dh6;
	Wed, 10 Apr 2024 13:19:23 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXq8-000000075QC-1VrK;
	Wed, 10 Apr 2024 13:18:13 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e509baddaso3718904a12.1;
        Wed, 10 Apr 2024 06:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755090; x=1713359890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=;
        b=kZjXlqjS/p1PmKTcIccvwQXYqwjHgNYwo9I3sFHjfec7RvaQiIzV0kOFb3M/JyE6Jz
         NRDHfZZ9Dv9grvGqaNNQHObJvz8MZBxEmBAIVtvpz69auDer5THc/08ouW91vXBGt+26
         sWlworOo7ovQLxYAEW/MYiAoMkN51COCLg+OmwsQC34tztkPI8st/1yjuOlc1GnZxd5U
         GAjzVO0gEtnIDgTNkxL1Z00Bi+ZLr6gYsDJs9BrJJXDVfQ4NReFsXpobDVLtaQ8KNi1f
         Mcg0grgh6i5LcdK7Jp0wF8P6SCC2aWa8OO7gtVmiwAa8bSwih4mjUrGr3B0ErmvfzTxU
         cOZw==
X-Forwarded-Encrypted: i=1; AJvYcCUM+Pa0fEa9NNAUBtfk68K47iJVV7s1Al1MZQnzEdjjyo/ZfrJ8Q9TlXtTUt7m589oN2lLYizPJ/EPbh7mfLw42DGBT2hKQj4aeuMfRpQwjXC4RDOeMbRh6e5I8syzykt5I8gX1kn1mdisEmNJyWb3PIVp6u55U9WFhwLgDO5Bnkve9TTEXQHrnHGa1Ky9BKyFuIrywFhcAY8TZNNLffHiDEj+kWanLOrKDaH9jGh5+vw==
X-Gm-Message-State: AOJu0Yx8+XIgG6ZZ+S/SnsSJy1CZwlKIVt0Gv+GDQQk5y5+9SmTKZCVQ
	ti3Oq8PBwi9TCfuUf5BPZ0xOtBeJx8+PJ3pVxuKmRSLMW+hDRFTY
X-Google-Smtp-Source: AGHT+IGftURUiLhae3IWuo+JgModGLFYkH2l8Vww82aSVu0SYVtXrmdtfM8lFQGJV5CM4+6FNOQ1pQ==
X-Received: by 2002:a50:d49c:0:b0:568:32cc:f808 with SMTP id s28-20020a50d49c000000b0056832ccf808mr1310263edi.15.1712755090031;
        Wed, 10 Apr 2024 06:18:10 -0700 (PDT)
Received: from localhost (fwdproxy-lla-002.fbsv.net. [2a03:2880:30ff:2::face:b00c])
        by smtp.gmail.com with ESMTPSA id fi9-20020a056402550900b0056bdc4a5cd6sm6359853edb.62.2024.04.10.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:18:09 -0700 (PDT)
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
	leitao@debian.org
Subject: [PATCH net-next v5 06/10] net: ipa: allocate dummy net_device dynamically
Date: Wed, 10 Apr 2024 06:13:47 -0700
Message-ID: <20240410131407.3897251-7-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061812_486678_596ADAD6 
X-CRM114-Status: GOOD (  13.16  )
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


