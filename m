Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A834DCD1296
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uFDdytT0v09rWVgCaqJM24d+bAkOK5uzvp9jq8SPpic=; b=iKJS21bTM9RSf70IbHmaF0SuXH
	4GNlsAfWlzsWN9pDAhoz35+zQ34nLqZsEH8DBJNmFeallpTIpjS+GYoGqsDvp4mgEuqPC2fcTBrxY
	dIxN4Ka8qDa64be/YaYTAAHCRCRNnhsAFY2yr+SPqGluQyntCZ5YGCRbWcsXp6W+HO9xYKS9KRmxs
	ZCiuvb49YQBztD4gi4fSV3ynZe/ZQYFgZiycLALH+aaAplHQF9po14k2UUPPYjHNJfO7LSvsAXfd7
	lSSGDJriNruzRdRuUwR+5qkhTCPMjD9dXd4yCcNor5pYo3s9kEzwEoOvg1i+QXyctEt5ZvGTTCNYl
	CCukNvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3V-00000001zz7-41p6;
	Tue, 09 Apr 2024 12:58:29 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3Q-00000001zvr-2h3x;
	Tue, 09 Apr 2024 12:58:26 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343e70dd405so3603924f8f.3;
        Tue, 09 Apr 2024 05:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667501; x=1713272301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFDdytT0v09rWVgCaqJM24d+bAkOK5uzvp9jq8SPpic=;
        b=FSxmJoQ8Oq33eXZ0kMZtjmNps2zADwlW1Gq3vGSv/Hv1ns42B8DS7QQ0uEMhXbWLG/
         4ABSZ/j1qIb7Ux6GUBsI01KiGc+k62VubWy08xPJWgLDAYY2e7OM201Gx8TSNppU0qqF
         0i8rO2ZcrawcdsqNwMF7yAI539ojJH4v8BGBJKt3Ud8677adRXR97sv0W/gX+LeMEYrl
         2aAAyBpb1I6asXmjrHnWKnw2C4ul1kqlsWvJtxPYhnQIAAP3VX2iXKWMyBMMwsW7ZT5W
         X6sh2OZBIErNtX7v8yTNIu7GLxGkU5FJDDFW2D+9x+inyMlCjUSImb9dpX3V3JOPFPs6
         QhWw==
X-Forwarded-Encrypted: i=1; AJvYcCWsIp4NMVwIRw9WGdySrmMFEiQBh8WJ30Rb3+FM6LtLSTGkIDQBG5a7JmABYfk1nAfeI8uekAcyYPSYMgpJ0rX83mcGP+Vv5j8OVyBmns4KuUpqqY8OaiTKaA50HxG9EUTQ/SIu0oejbTOsy9Zgl0ctSUlMcAn/YCPBVQomeCzJamiCBtrFl+mByIXnWIUlxqC0ahWDbdujpRmhyBEby0Uvj77VHo04fi7ZYAm7ZNEzag==
X-Gm-Message-State: AOJu0YzYIITGJRSanOazODjZ7f7CSGSfTBUiMmoB1DiLKt0T32tUFJzS
	Vzh7G/EX0zAXEhqIt5GF8pulbJi8uhnuemSk2qNbvRJCoDzucy+Q
X-Google-Smtp-Source: AGHT+IF5sJSCYs5v+qNFkqjxztOrDHFXX8CMXk5zRc/0XtJPRH8TOBlSdoo+czWfsit+YhsaIA7hyA==
X-Received: by 2002:a5d:438f:0:b0:33e:ca28:bb59 with SMTP id i15-20020a5d438f000000b0033eca28bb59mr10807960wrq.57.1712667500650;
        Tue, 09 Apr 2024 05:58:20 -0700 (PDT)
Received: from localhost (fwdproxy-lla-118.fbsv.net. [2a03:2880:30ff:76::face:b00c])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906270d00b00a4e98679e7dsm5644168ejc.87.2024.04.09.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:20 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: quic_jjohnson@quicinc.com,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net-next v4 0/9] allocate dummy device dynamically
Date: Tue,  9 Apr 2024 05:57:14 -0700
Message-ID: <20240409125738.1824983-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055824_702247_6AE15483 
X-CRM114-Status: GOOD (  11.42  )
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

struct net_device shouldn't be embedded into any structure, instead,
the owner should use the private space to embed their state into
net_device.

But, in some cases the net_device is embedded inside the private
structure, which blocks the usage of zero-length arrays inside
net_device.

Create a helper to allocate a dummy device at dynamically runtime, and
move the Ethernet devices to use it, instead of embedding the dummy
device inside the private structure.

This fixes all the network cases plus some wireless drivers.

PS: Due to lack of hardware, unfortunately most these patches are
compiled tested only, except ath11k that was kindly tested by Kalle Valo.

---
Changelog:

v1:
	* https://lore.kernel.org/all/20240327200809.512867-1-leitao@debian.org/

v2:
	* Patch 1: Use a pre-defined name ("dummy#") for the dummy
	  net_devices.
	* Patch 2-5: Added users for the new helper.
v3:
	* Use free_netdev() instead of kfree() as suggested by Jakub.
	* Change the free_netdev() place in ipa driver, as suggested by
	  Alex Elder.
	* Set err in the error path in the Marvell driver, as suggested
	  by Simon Horman.
v4:
	* Added a new patch to add dummy device at free_netdev(), as suggested
	  by Jakub.
	* Added support for some wireless driver.
	* Added some Acked-by and Reviewed-by.


Breno Leitao (9):
  net: free_netdev: exit earlier if dummy
  net: create a dummy net_device allocator
  net: marvell: prestera: allocate dummy net_device dynamically
  net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
  net: ipa: allocate dummy net_device dynamically
  net: ibm/emac: allocate dummy net_device dynamically
  wifi: qtnfmac: Use netdev dummy allocator helper
  wifi: ath10k: allocate dummy net_device dynamically
  wifi: ath11k: allocate dummy net_device dynamically

 drivers/net/ethernet/ibm/emac/mal.c           | 14 ++++-
 drivers/net/ethernet/ibm/emac/mal.h           |  2 +-
 .../ethernet/marvell/prestera/prestera_rxtx.c | 15 ++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 17 ++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  2 +-
 drivers/net/ipa/gsi.c                         | 12 ++--
 drivers/net/ipa/gsi.h                         |  2 +-
 drivers/net/wireless/ath/ath10k/core.c        |  9 ++-
 drivers/net/wireless/ath/ath10k/core.h        |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c         |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c        |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c        |  4 +-
 drivers/net/wireless/ath/ath10k/usb.c         |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.c         |  9 ++-
 drivers/net/wireless/ath/ath11k/core.h        |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c        | 21 +++++--
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  3 +-
 include/linux/netdevice.h                     |  3 +
 net/core/dev.c                                | 57 ++++++++++++-------
 19 files changed, 127 insertions(+), 53 deletions(-)

-- 
2.43.0


