Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14BC10F1A
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShvXVcuHKM27ZU0oRYsT/Zoz+8yVSDnGcsCzeAiDpLM=; b=fSfA41QY5654wFqhjpkMFF4S31
	JFtjOefqfVVTW8PKJIsuDc/UZnyS16nD8ziR2rZS9DYYTk68VuoxO4U/wysLEJyfdEO4O7Q8f9hVh
	EMOiYnwzALynjBAdU02rBb6xOVC0qYN4plnZ8pZbKxRhd5jMRJI1kTZySyjGcsCwRtVP95P4LaHbY
	jOBi/gXMTVGHnN7vDO1GQ+m4NHd+yaUpnh3qa39hjoHJB13vgejwv1G1Erz2CFZeGG7fU8iTKVs2v
	bs85RZuAbfGmDXsMsxYhfeNduxXkSNpwz+Y/u6gDehyjU2M9SvFB+79TOSJ9vivn3sGj4+03ER7FP
	yMdNrM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysy5-0000000DX9h-02Df;
	Mon, 22 Apr 2024 12:40:21 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxd-0000000DWjE-20Eq;
	Mon, 22 Apr 2024 12:39:55 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a55b3d57277so123292266b.2;
        Mon, 22 Apr 2024 05:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789591; x=1714394391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShvXVcuHKM27ZU0oRYsT/Zoz+8yVSDnGcsCzeAiDpLM=;
        b=IgF3kie3ywSTGv3EXijNL1GxAM2QXkH3SJq1TaCYoc53mwIgVV4TdIlpCx8ZvlBxP0
         hWHfF3QYs3df/cD+QKdU+8wwb0efXu1Bg0aCx7UzhQ08lPFSDdPmxswkQRPvMnV9ORx8
         7lCLKZVeowKcaMjs7hoSZvl8tbB88zg98Y1fSbSN4qcYWzdpdbub5AreYlPSJprfVvMy
         2SST6FAE+3cZqVrSXCehDOpJW1MffN1eaw8OyKbwtH9tmcUqm56Y5Aru22/yFu+dEZ4j
         nLTSxMxvNVy1e8273cmStyueCa3FJJTSIXY0ReTR2ajSgZwCeDr9ORFLDLrPBPZ+eoCQ
         ESBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWqoypFG05sPcPZelD693Cr6dsW6Er+R5z+LtjJAYgQ3W8VyQAFyVfHx+YDeZJ13nuDkynbIQAxGP5eFrZ/7McAPiABkP+dMG6NcCbyyhmqvjmZiGVtSsOctgjVYBpuoglIL1d/57TfSQOkZ2bWcGp0vuftaKAwHwBdldobcAzfikWWsiuMgfeWfiSv9XZCFLS65F0c8pXiCzpmR/mRBMnQzY0Csv+kvrRqM2T9IBWug==
X-Gm-Message-State: AOJu0YxujgRXWmkX8DyL6X7ZFi0Qw3OwW0i8QPnU2/Oxy8qgitnJskf4
	IZJAMkvylHbjffw5y95M/J82QAkVz+AcqHgUpYA6p6MY2E56JfE8
X-Google-Smtp-Source: AGHT+IGHXbG42TBUs2qM4JFDBLm1Sczss7RLzeg45Q/pfNGgTnWOgk3VY3uvoEjCD/lPGpvH1Ft/ig==
X-Received: by 2002:a17:907:94c5:b0:a55:9e16:f005 with SMTP id dn5-20020a17090794c500b00a559e16f005mr4187823ejc.57.1713789590608;
        Mon, 22 Apr 2024 05:39:50 -0700 (PDT)
Received: from localhost (fwdproxy-lla-117.fbsv.net. [2a03:2880:30ff:75::face:b00c])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906361700b00a56c0866c71sm419551ejb.69.2024.04.22.05.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:50 -0700 (PDT)
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
	matthias.bgg@gmail.com,
	Ido Schimmel <idosch@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v7 03/10] net: create a dummy net_device allocator
Date: Mon, 22 Apr 2024 05:38:56 -0700
Message-ID: <20240422123921.854943-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053953_575696_76BE8FD7 
X-CRM114-Status: GOOD (  18.38  )
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
 net/core/dev.c            | 56 ++++++++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 18 deletions(-)

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
index 62b39d6b1d8f..e09aa3785c15 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10420,25 +10420,12 @@ int register_netdevice(struct net_device *dev)
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
@@ -10459,8 +10446,28 @@ void init_dummy_netdev(struct net_device *dev)
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
@@ -11080,6 +11087,19 @@ void free_netdev(struct net_device *dev)
 }
 EXPORT_SYMBOL(free_netdev);
 
+/**
+ * alloc_netdev_dummy - Allocate and initialize a dummy net device.
+ * @sizeof_priv: size of private data to allocate space for
+ *
+ * Return: the allocated net_device on success, NULL otherwise
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


