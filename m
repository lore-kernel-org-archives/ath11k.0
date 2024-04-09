Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A562CD129C
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeyrNbxQo5gOwdkkAEV+0vUgg75RvJ4U5yeN3K4c0b4=; b=BuGWXsSx43stxkSYq+tTfU05yL
	3TcjD/Mtp1kbV6/vAyH07I4tSHsXlLqF007bd1HtoNhRYrFHbQ4sRP3hHA/6dyvv75JfF0HxBW/Mp
	btkLHdhWdn6Pm+7nscSPznXaK0obC5Dr+2Wz/2mLKTlTO7oveXu8FMjDS2G/hBylPz+AAepxZhjbz
	AHlqiUbxch9HpwcZVjhBd5sROwGfhkHBaIuip2Dn26+MiT4oYP4NLTgRL1zlk8oGi3rebZNnyGcoD
	tSMrwSXA5HCMfnpi3tJsrK4vFlCsxML2FJuzKeSFCwwobvz/3VIMGip/YjbT8k5U/CAid3m4dyFTe
	z9i9h36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB45-000000020QU-3bJX;
	Tue, 09 Apr 2024 12:59:05 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3Z-00000001zzX-0Ji4;
	Tue, 09 Apr 2024 12:58:35 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so7044581e87.3;
        Tue, 09 Apr 2024 05:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667509; x=1713272309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeyrNbxQo5gOwdkkAEV+0vUgg75RvJ4U5yeN3K4c0b4=;
        b=OcQ5OgR8zOlIi8C1UbkKz6PRXufum+sDDOGMX+2LpPiO+TasNjZFNrEO6dRm7CKZGJ
         hHHkhh3r71WDO8ah5uvmU2Z0pHmapyv4wDdOULlCc8LcjMihwGNj87daonE/O/QiGn0n
         66RoYXl2abib5OkM151NxFM2Alo8SBmULW46lWc9dSFiGZQCu9uxC2zHrgNjP6SAQcea
         ucmIUCGywty4corTKfpUVS9caL3iEsxVU6jnbnu3qOGID6lZFTYn6KLjik8kSzVVikGa
         Cm9L4Sq08IlvrZ4DB02j5C2JUpgkOs18/oqQUe1eqam5tV56xa/noT+mkaVGm14fDks8
         ozog==
X-Forwarded-Encrypted: i=1; AJvYcCUOrX+sgmpzeH/YBZtgA0NhAJE/swV5wJP1wjpaIsAqba77ITJ7Nly86i/6j/De7A/rqWARdVvjdpjMN/Ads81HKt54Sy8gjnQaI/EduGgCbOWaPAwpRPaACVNHSewQ//A/t/KSOzLmr4ekksDF7GSkid13D+kZG47wsifCfUhq6LocKgu6gBPAHdiNOCKLT3ys6Wyt166sGmvUqLXKUN5kene7e6gbB2Du1zAhur2ZQw==
X-Gm-Message-State: AOJu0YxGEr2dca3qODadBvVbYsVVZvX3SaZpmMkSV+Kd+vEDkvrUUIz8
	js6MWhQfAmNJcHWjSkCKNTNGz7f01nG6oN+NZyKD2/rSZ8wH7Psi
X-Google-Smtp-Source: AGHT+IH6XD+fmejUsktY/+7eeYpDSuJZiImwWhbauJPASwZetxxyKDNYTe6x668707j5jS0/7gsbkw==
X-Received: by 2002:a05:6512:499:b0:515:d100:1650 with SMTP id v25-20020a056512049900b00515d1001650mr7312038lfq.57.1712667508768;
        Tue, 09 Apr 2024 05:58:28 -0700 (PDT)
Received: from localhost (fwdproxy-lla-119.fbsv.net. [2a03:2880:30ff:77::face:b00c])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906448f00b00a51d250a1a4sm2903733ejo.80.2024.04.09.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:28 -0700 (PDT)
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
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v4 2/9] net: create a dummy net_device allocator
Date: Tue,  9 Apr 2024 05:57:16 -0700
Message-ID: <20240409125738.1824983-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055833_186277_181962E5 
X-CRM114-Status: GOOD (  19.00  )
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
---
 include/linux/netdevice.h |  3 +++
 net/core/dev.c            | 54 ++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0c198620ac93..544767d218c0 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4517,6 +4517,9 @@ static inline void netif_addr_unlock_bh(struct net_device *dev)
 
 void ether_setup(struct net_device *dev);
 
+/* Allocate dummy net_device */
+struct net_device *alloc_netdev_dummy(int sizeof_priv);
+
 /* Support for loadable net-drivers */
 struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 				    unsigned char name_assign_type,
diff --git a/net/core/dev.c b/net/core/dev.c
index bf0a335781aa..5d2cb97d0ae6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10413,25 +10413,12 @@ int register_netdevice(struct net_device *dev)
 }
 EXPORT_SYMBOL(register_netdevice);
 
-/**
- *	init_dummy_netdev	- init a dummy network device for NAPI
- *	@dev: device to init
- *
- *	This takes a network device structure and initialize the minimum
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
-	 * are they aren't supposed to be taken by any of the
-	 * NAPI code and this dummy netdev is supposed to be
-	 * only ever used for NAPI polls
-	 */
-	memset(dev, 0, sizeof(struct net_device));
-
 	/* make sure we BUG if trying to hit standard
 	 * register/unregister code path
 	 */
@@ -10452,8 +10439,28 @@ void init_dummy_netdev(struct net_device *dev)
 	 * its refcount.
 	 */
 }
-EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
+/**
+ *	init_dummy_netdev	- init a dummy network device for NAPI
+ *	@dev: device to init
+ *
+ *	This takes a network device structure and initialize the minimum
+ *	amount of fields so it can be used to schedule NAPI polls without
+ *	registering a full blown interface. This is to be used by drivers
+ *	that need to tie several hardware interfaces to a single NAPI
+ *	poll scheduler due to HW limitations.
+ */
+void init_dummy_netdev(struct net_device *dev)
+{
+	/* Clear everything. Note we don't initialize spinlocks
+	 * are they aren't supposed to be taken by any of the
+	 * NAPI code and this dummy netdev is supposed to be
+	 * only ever used for NAPI polls
+	 */
+	memset(dev, 0, sizeof(struct net_device));
+	init_dummy_netdev_core(dev);
+}
+EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
 /**
  *	register_netdev	- register a network device
@@ -11065,6 +11072,17 @@ void free_netdev(struct net_device *dev)
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


