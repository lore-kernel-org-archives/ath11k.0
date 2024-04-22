Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23762C07C79
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM0a8ULPX5sI9tlDTBlw0auBDoAkdJnRbFJIF1dAPsY=; b=Hlov+IKAMeugiYJiYFTQrnCvtQ
	u78FBr2OaSEUr6U39FtHNabAeiaUbcVWBaGiS2ZurysWII7GCbAkHREXq4ECFuWCwxwYF2/KhikHN
	RYw6LtKd19ob0BxHih+HRpWrxTIYk+WQGppX6U5VNUTvSe0YIdLeykUI5bmOG5JbpkOxCMIFdRFmx
	Fl8/3X9tNJwsVTbX6U7c/OZKObRSKHUpNkYA1JM3KP6KEVRQHvIMRQVXOhWurGJ9xweAHlobKwGHt
	1ynqZbNEo6uKbiQSfqF2BRGiiJk1OpAWwJKd3YySuGivffRpTpFMD61jf8dxTy0Eg5C8cn+xR6E62
	6rIRP8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryszE-0000000DXr8-3MzB;
	Mon, 22 Apr 2024 12:41:32 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxi-0000000DWnD-44gB;
	Mon, 22 Apr 2024 12:40:04 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51addddbd4so426587266b.0;
        Mon, 22 Apr 2024 05:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789596; x=1714394396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM0a8ULPX5sI9tlDTBlw0auBDoAkdJnRbFJIF1dAPsY=;
        b=KXSYnz/bGm4W35zuagmexL0TKc/1sv/WdamRBlZqHvk67+U7p2D2O1lug0IgmcSyXv
         jBLoAjiQT1reZGNaSfe+w9toNRMlQpzY+EoHypgyE+MEqxlHsUU/Kyr7zY2hx/uLq8c8
         Hp76KK+bBD3vqlEsSWaAxPA2Ce7ZEdrExy+CL11FsD1ogMaaOUfweiOcOlXzD6ZrHcUp
         pbGzANmZXRbC5UCKv05UCaHsUvRK4SgA4ParRPV2a5zTE8MrAPnzUcXu2Ibb1TFu69cq
         axJhTGyJh5P85zr8lPqnfdKAU0gqcQvWNh7JRq0Wd89HT14/A7ERcvgKD5V/HCwKzSiU
         XfZw==
X-Forwarded-Encrypted: i=1; AJvYcCX7cZeqbcYITTGj7NW9zf0K4wwkjotOv1i0pcONbgfFgzsZxPbQGDB+HWghVb/r6jagRA6dvBLj7aMRqdF5eNWSiTMlc2vukaKxFCKb6oj2G/O7YbYy9bAV1/if35ugUNExOaPW2IOu26l+RSvDs7frorIY6059aH7xQOVEPxu46M9LSKEVapQdODOmYri3uTddStNamP3qTgqz7JyCkFpq1h6bh2PPCUgaL3+v+ck4Pw==
X-Gm-Message-State: AOJu0YxSv1911D9wL/+3q+hhwguz7FE4s/Z7cni6+An7Jf8rA3jVRDHB
	9NHNimTPghWVaBPv+sURy7s/HwmiJ5yunIrgIOf60TKc1cFv1ZZE
X-Google-Smtp-Source: AGHT+IElmg7ko2SsLHcYhHpsj+2DNo6Q3PnnNVq9w1uOVEKpYSOEVIxGi3DE4xNzSKfjHpu7I5+s8A==
X-Received: by 2002:a17:906:bb17:b0:a55:55b9:57d1 with SMTP id jz23-20020a170906bb1700b00a5555b957d1mr6041497ejb.66.1713789596151;
        Mon, 22 Apr 2024 05:39:56 -0700 (PDT)
Received: from localhost (fwdproxy-lla-000.fbsv.net. [2a03:2880:30ff::face:b00c])
        by smtp.gmail.com with ESMTPSA id gu6-20020a170906f28600b00a4e44f724e8sm5708241ejb.186.2024.04.22.05.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:55 -0700 (PDT)
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
	matthias.bgg@gmail.com
Subject: [PATCH net-next v7 06/10] net: ipa: allocate dummy net_device dynamically
Date: Mon, 22 Apr 2024 05:38:59 -0700
Message-ID: <20240422123921.854943-7-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053959_379427_9086263C 
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
 drivers/net/ipa/gsi.c | 12 ++++++++----
 drivers/net/ipa/gsi.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 6c8feb640a97..4c3227e77898 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1728,10 +1728,10 @@ static int gsi_channel_setup_one(struct gsi *gsi, u32 channel_id)
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
@@ -2367,12 +2367,14 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
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
@@ -2387,6 +2389,7 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
 	return 0;
 
 err_reg_exit:
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 
 	return ret;
@@ -2397,6 +2400,7 @@ void gsi_exit(struct gsi *gsi)
 {
 	mutex_destroy(&gsi->mutex);
 	gsi_channel_exit(gsi);
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 }
 
diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 833135b35380..9d8e05d950e3 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -151,7 +151,7 @@ struct gsi {
 	struct mutex mutex;		/* protects commands, programming */
 	struct gsi_channel channel[GSI_CHANNEL_COUNT_MAX];
 	struct gsi_evt_ring evt_ring[GSI_EVT_RING_COUNT_MAX];
-	struct net_device dummy_dev;	/* needed for NAPI */
+	struct net_device *dummy_dev;	/* needed for NAPI */
 };
 
 /**
-- 
2.43.0


