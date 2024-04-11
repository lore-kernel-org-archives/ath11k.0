Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9AAC04FF8
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrYnp1tDsZ0sxZFnn5u9gBZrt+Gb2bRXco5M67sATos=; b=gklgjmnaMXbLXosPYZzpIgytug
	i3KrHvVZUXsAfCzdZy8rNAtjNm6y9+BWFKLWAb9OxrnvP70Mdci3mThJnLJ3YHtU7fTvu15o4NlI5
	laDXprM92nFVWAXRaP2ke5tUXy1+vQSbYacxyDOQa5UG0xqbXLxKDIGkcW+MadJK+ZeOTa+p45/TI
	rwn1FbsSt7St7aEEzsVlbVkK3DF+APKj4oVc4R4xIK4ijJuQcGfl8QOOVWDD3lNWdKv1zTewJGW9v
	h3ugVakejW2YEcuoOcxQawMdJDem+32hFt7Br5MStzo7ET8OPQGcPLjBjFVlJ4026uRjBRlQDRPrV
	ENpUvL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvx9-0000000Cct2-1j5L;
	Thu, 11 Apr 2024 15:03:03 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyq-0000000CJeB-0alZ;
	Thu, 11 Apr 2024 14:00:47 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56fc155b646so2326186a12.3;
        Thu, 11 Apr 2024 07:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844042; x=1713448842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrYnp1tDsZ0sxZFnn5u9gBZrt+Gb2bRXco5M67sATos=;
        b=XByWwfp6kBj9VlTiXtZsCnlJuRzBXv9myogOovelkvcG2hQwrD0/wirHg2TZb+6yVP
         yVbpWUIwOvVylsn784YMZkkyheeqe1XZnzfbJStnSi//bvL3KbpgVW4bGvlz5R0xf/ck
         lpqW/1KsaADtIXtq0R8ZqF/a+G8niXB9rPbYw3HnF8fbaB43tVz5vQUandYf/8pwzc3T
         Aqvmug/D0rde99Hi7pRftMSDX924MrpoDPMxGuC80U21cRxXvBa+xBdzejyAiQi9QKbF
         AeDJaEOBqR7yA5KkrQ3TgowCmYJj0goTJvP7Y3bdBNxdDuiYERrFuJr4RLkHwfTdsx1o
         h3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrAHwJvrdqjrBCOWCg9pY7PB2nDjBYmowr1FHBAAkQKUnEgjplbCXjQaBuJMagpO5ihcEzc/P9HXVnXQBObJ3Oth5RT/+jw7R6U315aZRSDji+pW1ZrtAdGO3nVNBGQQRi9EInmRZlltFyayQi1u+JqNFHz0afNJajl/IgImHzHdNvLeqF+9JEBtWVcVCUgdabAxEFJVroa9d/33FF9Nru8OogU8Gw/NbWrY30zShBNg==
X-Gm-Message-State: AOJu0YwfddpbifdWcVEsGxS4MrD5RP00DoColJW4+f7kNSvrlkyew9Wl
	GEFIdhRyByEEixU4lgQH1zkEv5+IvYjvx1k+gHLe1hYemSnLo43Q
X-Google-Smtp-Source: AGHT+IFZGP/scO0ubNJmt0aoTujRGQZJOvjmWlRs+FjC+tWdWZmrmvYWjoweGZeS25kI0JSSKLCy0w==
X-Received: by 2002:a17:906:e95:b0:a51:b00b:45a5 with SMTP id p21-20020a1709060e9500b00a51b00b45a5mr2923428ejf.74.1712844041681;
        Thu, 11 Apr 2024 07:00:41 -0700 (PDT)
Received: from localhost (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id ox2-20020a170907100200b00a522bef9f06sm212031ejb.181.2024.04.11.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:41 -0700 (PDT)
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
	leitao@debian.org
Subject: [PATCH net-next v6 10/10] wifi: ath11k: allocate dummy net_device dynamically
Date: Thu, 11 Apr 2024 06:59:34 -0700
Message-ID: <20240411135952.1096696-11-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070044_577131_82A5F611 
X-CRM114-Status: GOOD (  13.70  )
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


