Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673BAC54E68
	for <ath11k@archiver.kernel.org>; Tue, 19 Mar 2024 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5vbUK0x5mQPz4Xbo7a3iJQ4eSaXAWOMaKCyLfiRGyQ=; b=qz+M5Y+eZbeGKgmq/3TpGn5kSA
	A1gO4fFImuotkipkR7sd6FAGq3wFBaX6mNH4iwsNFBPYgnyvSGekj/DJ5Gps//146cy0D/cBh+A52
	M7tmhlD3wEZq6YCby5B5qFSmUkhGJtP+PT+BkPd0zPRKl+tvG6BBlhf13HTLgTVfl6576M8NIvqV2
	RzR8esq58fOqNJLLf4oOuOhCHpXTaemGNHB2W08J3E0dyP3E6L6z7Afo3j5MAlVWA7D09crPgTZgF
	UKWyt/ggMnzCA72Go4SMFBz2w6M6D7NvHmrz7Xo2eRH+Vs05ms6Eg521PUD1OKX0j2cQdomHc2FMp
	3iwcVzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeel-0000000Du51-3ngh;
	Tue, 19 Mar 2024 18:57:51 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeei-0000000Du46-2UIa
	for ath11k@lists.infradead.org;
	Tue, 19 Mar 2024 18:57:50 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513e6777af4so4820073e87.2
        for <ath11k@lists.infradead.org>; Tue, 19 Mar 2024 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710874666; x=1711479466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5vbUK0x5mQPz4Xbo7a3iJQ4eSaXAWOMaKCyLfiRGyQ=;
        b=Li21ia5917oAVMYa4hfx24Cx/xlpdka//LFAETjogWXHaUwTKyvo8AH/4XMlIWFOo3
         enuYrWE4as7qEVcKDzxva1NUkSF00DpGM0FEZAvOpdUI70aLxaHMW63MUYTokOQ+N5KN
         XaGkG8gLVE6n0/LklOOGALWUgHKbvkGHepswrxNHY+kzEslVYEk6A1LPa763+4qIzS1s
         1fF0GQpl7uP1erTjmsTc7/WY3WKmC+Fj1kivwUBSPhsv1RNMpITU7g6PK02DPzKyEhBF
         sIBawGpLo+9VyrEr8AVRxYfwdp4Vn2zy4JKdqZWndnCKOwMAPx8zuAyDe5BIgx9xRuab
         09nw==
X-Forwarded-Encrypted: i=1; AJvYcCVyrjDzYR7/XmSr7GUxavLA608TKAV6kRIQfJi7TcNkxYyvQty5n++cmdmdhjg7FYep8wdh9uwB5/hhtEzeS0Nc/QE/jAU1jFzCCA==
X-Gm-Message-State: AOJu0Ywb+b9eUP3RLGWn5RZMRuzy1+IA21dLNPgv216J0xXRR+uHXF1X
	UfOIugh2qWsKvycC5WP+GkIZeYThBScPjcMT3O2NgjXBvcfABpFg
X-Google-Smtp-Source: AGHT+IHEWx37j6x265cYHrxTAmCCI0WI/coMWHrWzV++c9l6d4k592ZUGWdrKqUy/weuDlnX+e09YQ==
X-Received: by 2002:a05:6512:3c9d:b0:513:dc7c:4956 with SMTP id h29-20020a0565123c9d00b00513dc7c4956mr10588671lfv.48.1710874666277;
        Tue, 19 Mar 2024 11:57:46 -0700 (PDT)
Received: from localhost (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709064f8100b00a4671c92907sm6282594eju.28.2024.03.19.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 11:57:45 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: kuba@kernel.org,
	keescook@chromium.org,
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] wifi: ath11k: allocate dummy net_device dynamically
Date: Tue, 19 Mar 2024 11:57:33 -0700
Message-ID: <20240319185735.1268980-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_115748_693723_8AAAC2CA 
X-CRM114-Status: GOOD (  13.51  )
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
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  8 ++++++--
 drivers/net/wireless/ath/ath11k/core.h |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c | 21 +++++++++++++++++----
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7c0a23517949..a8d89f510f62 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -442,6 +442,7 @@ static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
+		free_netdev(irq_grp->napi_ndev);
 	}
 }
 
@@ -533,8 +534,11 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
-		init_dummy_netdev(&irq_grp->napi_ndev);
-		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
+		irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
+						  init_dummy_netdev);
+		if (!irq_grp->napi_ndev)
+			return -ENOMEM;
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
index add4db4c50bc..ebb1d0432d94 100644
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
+		irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
+						  init_dummy_netdev);
+		if (!irq_grp->napi_ndev)
+			return -ENOMEM;
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


