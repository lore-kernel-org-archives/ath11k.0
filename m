Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0820CCD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GDpaKQ90WYO0sLid+cb+1t26hG02cHYGSR1vXVItmw=; b=AIyshDWFYdSBS5hWP9wQXXc3vH
	Y0icrh4r7YDDQrfTijN/8enzs2HcAEOho1Jj5WgJO+LrnznUkzvA9XArA2HesfxyGaKOSeHSlVGgQ
	rmG0I+4mYQ9fdmod7GEgXrKQruvWNmOk/sqmm4JlnbeYx3p4HvaXIOU3ugmTsyLJDZiq2NhJLmMna
	i/PyoqYR2KYelQ5VD5hrTHuxtaAAc3TDdeVdI9dIqAQvwM3Gw3Ud0DKgVGZqcig/uraKaxcbHPRbC
	lLpwHW3ev0c7f6LtEfhyJGgT6uuArAsh3bP2sMm5DI2wtFHB3H59niVDFM9yXXPUsxqtHM0CifylS
	gsWg/kWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqK-000000075ch-3Rbj;
	Wed, 10 Apr 2024 13:18:25 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXq1-000000075Jg-3LsQ;
	Wed, 10 Apr 2024 13:18:07 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso6342068a12.3;
        Wed, 10 Apr 2024 06:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755082; x=1713359882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GDpaKQ90WYO0sLid+cb+1t26hG02cHYGSR1vXVItmw=;
        b=MCEAydMDbzxF/zWUNjlL5Nrc460Wmy9+zNIF6k6+vrwThFHx1yjiZ6PIlyUvf/k+Os
         KodV0AHBdhCR3woXM22uB1wZWaPq2XV4Gk4KFpSHXRWQYFVgVDS2bTb8qCtpYx9mHqP3
         266CbP87Ky5baLejzhU4+2J2+av1jRomKpqTJ5LF2Jhm4exWFscdxQANaHgvnrBEpIYs
         cOtdzCiBIcxp2kOfBciv3z6/ZFBVd9D7nXKW/SkU9iRHgBWleIcdYO2gjmYN1y9aObxQ
         l3Bjc4LySZoQ4BTMaEj2bAPeNx0opG1lT7Pc8c182VQM1JKgro0Ui3u9M9ttDFytWnig
         4onA==
X-Forwarded-Encrypted: i=1; AJvYcCXYy5TdzuytqeDwWs6JZN7HmgxAZEY+q7F43D7lgMP8LTZfyRcF35fndBM7ZpOVHqAnR4MVKRmxR6mlVFbaN6aF20dIumKiCgHsszTbv28Qp4+49xsT+KT/QvwcV9mIDQsecQoVEbbNRD5rv9mImNfBXTQHs/9CSW9eGvV28yifTJFXLbSxlX/cTHf3zfoaMZFS32pZNvcklhddRJuiOljjrVIB87UF8Hh0CsaPDqSzDg==
X-Gm-Message-State: AOJu0YxmsiqjScLVJstlpBgcjN/ZJYND6PSf1HHm7wSZ8wZnvdLcw6eS
	tAJcyaPwz9KhnEABDYnSv2x7jEhpZ9U+Dz+VnnPWAGqSc5duTeAY
X-Google-Smtp-Source: AGHT+IFB2h2wj+pUhlzhaGoVNqqjo/9uYytmBm9+9zCMtIRWllNip2uVE2aeJZshA4tzxKRVhkpMvw==
X-Received: by 2002:a50:ab18:0:b0:56d:c4eb:6328 with SMTP id s24-20020a50ab18000000b0056dc4eb6328mr1697426edc.29.1712755082627;
        Wed, 10 Apr 2024 06:18:02 -0700 (PDT)
Received: from localhost (fwdproxy-lla-118.fbsv.net. [2a03:2880:30ff:76::face:b00c])
        by smtp.gmail.com with ESMTPSA id cf27-20020a0564020b9b00b0056e59d747b0sm3937051edb.40.2024.04.10.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:18:01 -0700 (PDT)
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
	Ido Schimmel <idosch@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v5 03/10] net: create a dummy net_device allocator
Date: Wed, 10 Apr 2024 06:13:44 -0700
Message-ID: <20240410131407.3897251-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061805_884502_C98BD8BC 
X-CRM114-Status: GOOD (  18.76  )
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

It is impossible to use init_dummy_netdev together with alloc_netdev()
as the 'setup' argument.

This is because alloc_netdev() initializes some fields in the net_device
structure, and later init_dummy_netdev() memzero them all. This causes
some problems as reported here:

	https://lore.kernel.org/all/20240322082336.49f110cc@kernel.org/

Split the init_dummy_netdev() function in two. Create a new function called
init_dummy_netdev_core() that does not memzero the net_device structure.
Then have init_dummy_netdev() memzero-ing and calling
init_dummy_netdev_core(), keeping the old behaviour.

init_dummy_netdev_core() is the new function that could be called as an
argument for alloc_netdev().

Also, create a helper to allocate and initialize dummy net devices,
leveraging init_dummy_netdev_core() as the setup argument. This function
basically simplify the allocation of dummy devices, by allocating and
initializing it. Freeing the device continue to be done through
free_netdev()

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 include/linux/netdevice.h |  3 +++
 net/core/dev.c            | 54 ++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index d45f330d083d..f849e7d110ed 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4519,6 +4519,9 @@ static inline void netif_addr_unlock_bh(struct net_device *dev)
 
 void ether_setup(struct net_device *dev);
 
+/* Allocate dummy net_device */
+struct net_device *alloc_netdev_dummy(int sizeof_priv);
+
 /* Support for loadable net-drivers */
 struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 				    unsigned char name_assign_type,
diff --git a/net/core/dev.c b/net/core/dev.c
index c74b42bc6888..417abfd12871 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10414,25 +10414,12 @@ int register_netdevice(struct net_device *dev)
 }
 EXPORT_SYMBOL(register_netdevice);
 
-/**
- *	init_dummy_netdev	- init a dummy network device for NAPI
- *	@dev: device to init
- *
- *	This takes a network device structure and initializes the minimum
- *	amount of fields so it can be used to schedule NAPI polls without
- *	registering a full blown interface. This is to be used by drivers
- *	that need to tie several hardware interfaces to a single NAPI
- *	poll scheduler due to HW limitations.
+/* Initialize the core of a dummy net device.
+ * This is useful if you are calling this function after alloc_netdev(),
+ * since it does not memset the net_device fields.
  */
-void init_dummy_netdev(struct net_device *dev)
+static void init_dummy_netdev_core(struct net_device *dev)
 {
-	/* Clear everything. Note we don't initialize spinlocks
-	 * as they aren't supposed to be taken by any of the
-	 * NAPI code and this dummy netdev is supposed to be
-	 * only ever used for NAPI polls
-	 */
-	memset(dev, 0, sizeof(struct net_device));
-
 	/* make sure we BUG if trying to hit standard
 	 * register/unregister code path
 	 */
@@ -10453,8 +10440,28 @@ void init_dummy_netdev(struct net_device *dev)
 	 * its refcount.
 	 */
 }
-EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
+/**
+ *	init_dummy_netdev	- init a dummy network device for NAPI
+ *	@dev: device to init
+ *
+ *	This takes a network device structure and initializes the minimum
+ *	amount of fields so it can be used to schedule NAPI polls without
+ *	registering a full blown interface. This is to be used by drivers
+ *	that need to tie several hardware interfaces to a single NAPI
+ *	poll scheduler due to HW limitations.
+ */
+void init_dummy_netdev(struct net_device *dev)
+{
+	/* Clear everything. Note we don't initialize spinlocks
+	 * as they aren't supposed to be taken by any of the
+	 * NAPI code and this dummy netdev is supposed to be
+	 * only ever used for NAPI polls
+	 */
+	memset(dev, 0, sizeof(struct net_device));
+	init_dummy_netdev_core(dev);
+}
+EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
 /**
  *	register_netdev	- register a network device
@@ -11074,6 +11081,17 @@ void free_netdev(struct net_device *dev)
 }
 EXPORT_SYMBOL(free_netdev);
 
+/**
+ * alloc_netdev_dummy - Allocate and initialize a dummy net device.
+ * @sizeof_priv: size of private data to allocate space for
+ */
+struct net_device *alloc_netdev_dummy(int sizeof_priv)
+{
+	return alloc_netdev(sizeof_priv, "dummy#", NET_NAME_UNKNOWN,
+			    init_dummy_netdev_core);
+}
+EXPORT_SYMBOL_GPL(alloc_netdev_dummy);
+
 /**
  *	synchronize_net -  Synchronize with packet receive processing
  *
-- 
2.43.0


