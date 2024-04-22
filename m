Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CBC07E8E
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrYnp1tDsZ0sxZFnn5u9gBZrt+Gb2bRXco5M67sATos=; b=UWT3WPsqk7Ffm3l/jLgTZd5/+Z
	QncJs35zd6YnEExqziY3nk1452iphIwYpUGxMP3KFgAaGOkxmJjS+bDFSTMjNjMaYapUCg53+/2lv
	ypsRJv65wIEOwyyCiwPTu/8sRBrmbIhSHwT9YKKdwbh2nk82clag0O5QbNhVPa2yC+iKednelodz4
	FnPGGzqsCu14IRL+QxDfpILfgsI8qVy7iSguXO9WHQhL6W7XinmME28PjNb0YSZi+tpi6QfbJFuqN
	6IMvHpXLI12lg8MLyTToTC36nqNFdZc4LoXdRrY0rpF+kCk6wD24xfg73AuuoeSyxpVLfkyM5tQBm
	JWkYPI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryt0A-0000000DYfJ-1U2J;
	Mon, 22 Apr 2024 12:42:30 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysy1-0000000DX0J-3AhR;
	Mon, 22 Apr 2024 12:40:27 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e69a51a33so3955489a12.1;
        Mon, 22 Apr 2024 05:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789610; x=1714394410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrYnp1tDsZ0sxZFnn5u9gBZrt+Gb2bRXco5M67sATos=;
        b=eEv4PJzwboZAckreTWSfsVOnO2WSDd+VSVp2SyUqF3TLbFTHoEoOmkREwe8vIj9L8Z
         T9EoNb+8lGt6ofBw+GBYPlYGqeQs1tk+Ke53D3AOOoGeK1XxT+lRMiZ7fkhXxgjT+S+G
         gq7B5SkkaGEflYEhACWs7bhDctY3ZojTz21kQgAIohd6zsAuzjTAcuhkQarIQvd0rk6q
         MEiDP04S070tplrjxizddIuIcL7wO3MCmme3aohx/ZxPTfPqJfifttPujxmSYprgM4fd
         dY33c2laVSuVA8dyGNPeWgQrJ6hbVpaUhJBdAJ6bJX0ny6pWxleOkDlM1HS3mH20TnAm
         blGw==
X-Forwarded-Encrypted: i=1; AJvYcCVba/11ZMOTlmoGYO8vktwJ5Xh0H6Z0/2JUdxoIksoLNfhIpgWGs65vGF79toEwYrc36mKwo7f+3G7MOxM+NY9DKBhvPAXcacOktatDYxbwQw+VumriHpj3k0stjYVHEYFBmvt5KySP53pmfh2IDSb+08cduDPa0SsVmw+exXf4YnLCkfPmEkm2c9/DRSXugHSjuHtzAASKu3+pnFrEvB9GMVj5b6NiETgWrG8kVtu87Q==
X-Gm-Message-State: AOJu0YyWcWIMhg3iBK0Bj6n7WDVy/cMqIbuY71F69r7rcxjxqftsETbC
	14C3NBvZmXJutED+wK33kLuM80FmUMgYGYs6VGd67q5cKcvOgroM
X-Google-Smtp-Source: AGHT+IGrZgag9UeQefghQLPV+ku8otAJz6U28ozWysOWpOYWi3aSs0tMI8tAitrA/dkQ2iNnyOPaxQ==
X-Received: by 2002:a50:8e5b:0:b0:56b:cfef:b2de with SMTP id 27-20020a508e5b000000b0056bcfefb2demr6802703edx.26.1713789609790;
        Mon, 22 Apr 2024 05:40:09 -0700 (PDT)
Received: from localhost (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id q10-20020a056402248a00b0056fe7c5475bsm5505410eda.10.2024.04.22.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:40:09 -0700 (PDT)
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
	kvalo@kernel.org,
	Jeff Johnson <jjohnson@kernel.org>
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
Subject: [PATCH net-next v7 10/10] wifi: ath11k: allocate dummy net_device dynamically
Date: Mon, 22 Apr 2024 05:39:03 -0700
Message-ID: <20240422123921.854943-11-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_054018_964478_21A95421 
X-CRM114-Status: GOOD (  13.69  )
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

Un-embed the net_device from struct ath11k_ext_irq_grp by converting it
into a pointer. Then use the leverage alloc_netdev() to allocate the
net_device object at ath11k_ahb_config_ext_irq() for ahb, and
ath11k_pcic_ext_irq_config() for pcic.

The free of the device occurs at ath11k_ahb_free_ext_irq() for the ahb
case, and ath11k_pcic_free_ext_irq() for the pcic case.

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
Tested-by: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  9 +++++++--
 drivers/net/wireless/ath/ath11k/core.h |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c | 21 +++++++++++++++++----
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7c0a23517949..7f3f6479d553 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -442,6 +442,7 @@ static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
+		free_netdev(irq_grp->napi_ndev);
 	}
 }
 
@@ -533,8 +534,12 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
-		init_dummy_netdev(&irq_grp->napi_ndev);
-		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
+
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev)
+			return -ENOMEM;
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath11k_ahb_ext_grp_napi_poll);
 
 		for (j = 0; j < ATH11K_EXT_IRQ_NUM_MAX; j++) {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b3fb74a226fb..590307ca7a11 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -174,7 +174,7 @@ struct ath11k_ext_irq_grp {
 	u64 timestamp;
 	bool napi_enabled;
 	struct napi_struct napi;
-	struct net_device napi_ndev;
+	struct net_device *napi_ndev;
 };
 
 enum ath11k_smbios_cc_type {
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index add4db4c50bc..79eb3f9c902f 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -316,6 +316,7 @@ static void ath11k_pcic_free_ext_irq(struct ath11k_base *ab)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
+		free_netdev(irq_grp->napi_ndev);
 	}
 }
 
@@ -558,7 +559,7 @@ ath11k_pcic_get_msi_irq(struct ath11k_base *ab, unsigned int vector)
 
 static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 {
-	int i, j, ret, num_vectors = 0;
+	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0;
 	unsigned long irq_flags;
 
@@ -578,8 +579,11 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
-		init_dummy_netdev(&irq_grp->napi_ndev);
-		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev)
+			return -ENOMEM;
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath11k_pcic_ext_grp_napi_poll);
 
 		if (ab->hw_params.ring_mask->tx[i] ||
@@ -601,8 +605,13 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 			int vector = (i % num_vectors) + base_vector;
 			int irq = ath11k_pcic_get_msi_irq(ab, vector);
 
-			if (irq < 0)
+			if (irq < 0) {
+				for (n = 0; n <= i; n++) {
+					irq_grp = &ab->ext_irq_grp[n];
+					free_netdev(irq_grp->napi_ndev);
+				}
 				return irq;
+			}
 
 			ab->irq_num[irq_idx] = irq;
 
@@ -615,6 +624,10 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 			if (ret) {
 				ath11k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
+				for (n = 0; n <= i; n++) {
+					irq_grp = &ab->ext_irq_grp[n];
+					free_netdev(irq_grp->napi_ndev);
+				}
 				return ret;
 			}
 		}
-- 
2.43.0


