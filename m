Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95FFC04FF0
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQTQsAWD0H4IVeRBYnbPwnRSrsgIyM+Tcz4KRrX5YcU=; b=Cfe0LhBkFJTk97ZQoIXOKFdva3
	t00MCn/ejf0Dw5xIM+nFZk5FsFKed3mW7nwhlCsRj9DCOzus4PBJd4lxYFF1p2LtXn3dSUrx+ju1m
	oKIid455EqhLgGrecI0HLV6xcqVmBE/vewpXsSRTscJaQ4RqrKu+f0EMOT1+4zHh8imXMijZRMQ4/
	JBIKvqH4KWGj7tkab35Qy0ZQocgx5zEa7vWx9Iw0G68H2oC7IfBf2FV9W4jDaFT1aBpYYl3+UCWdU
	Srh3kok6u2xKXBwBXaGvb2JNbScsgFxOV/19CVVVP3w8kizYZR64eUVMm3thth/2X5nw1N4IJCnnn
	6cCTgJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyQ-0000000CJKI-0xi8;
	Thu, 11 Apr 2024 14:00:18 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyK-0000000CJII-2Lkl;
	Thu, 11 Apr 2024 14:00:14 +0000
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d87660d5c9so55172721fa.2;
        Thu, 11 Apr 2024 07:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844009; x=1713448809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQTQsAWD0H4IVeRBYnbPwnRSrsgIyM+Tcz4KRrX5YcU=;
        b=CtOUGe+wIQG4AKbW46sftK9xUA6tSECK8mNL1rCpyxRCJBlXsX25YUZFy3lEtSozCu
         vkqu7lIPMZoFBpaKLjr/2GTk3jCDF8qj7HX1Qc5MZoDECxM3d0mD4lCxhSv5eQI3U1gt
         DFjaD7ig3sulArhsnLWVSHkk+zkk7ifSaQBjhHZ+ZyvURDi2U5/51CdD8NXejROw1/ve
         bJ7flC5O7UXqeTJYjYc7XO7cOVAiBlDXwj+LdCxuOD2amAowkH4Yfz8Zfdn8leHWMZSY
         ZoYNu3LQlxD4RTyVaSBJVBpyXy+wHHR86MNEY12L31pG2RfGu6XLOVwJQ0XqnJnCQ7cq
         rtOw==
X-Forwarded-Encrypted: i=1; AJvYcCUt4wJ67eNAGXNEJJTg2R0k330EvlJxyYgffGRtvYJtnivS7rgBucza6Hmb56tLU7gK4KuRbwXA7Wf55mek98RJC7GtfJWiT6XHEoJvQBe5tXp4FDniEGLj98j+dx4zZe5n0hRUty9SyZ7detNGAkNDCJWx0PLsuEfydjuVhGbqLmNrZc0AzroDWy0yHZmAkCNSfeczdVdinLVkTH/6JfFDggamr8jUugNbG8toMNquLw==
X-Gm-Message-State: AOJu0Yy9VrcQIJ31ev9dLocA++xuFi5boblsRifpbRBNEIukyW3jU8vQ
	2VmmNUiL4qgv5iykGAY9MT25DqgRW2Sk1nz88F8npwiju3Me3roB
X-Google-Smtp-Source: AGHT+IESLjyWcXTsaKcjwrLRsOCPb3ACwPBKm09zfGwKsisTsBxp7Z8j7Ziae4Bz2qMfBnvCUtsP1A==
X-Received: by 2002:a2e:2245:0:b0:2d8:781c:7ba1 with SMTP id i66-20020a2e2245000000b002d8781c7ba1mr3849191lji.7.1712844009042;
        Thu, 11 Apr 2024 07:00:09 -0700 (PDT)
Received: from localhost (fwdproxy-lla-009.fbsv.net. [2a03:2880:30ff:9::face:b00c])
        by smtp.gmail.com with ESMTPSA id ef8-20020a05640228c800b0056fed6d5664sm357820edb.54.2024.04.11.07.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:08 -0700 (PDT)
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
	bpf@vger.kernel.org,
	idosch@idosch.org,
	leitao@debian.org
Subject: [PATCH net-next v6 00/10] allocate dummy device dynamically
Date: Thu, 11 Apr 2024 06:59:24 -0700
Message-ID: <20240411135952.1096696-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070012_654924_CE4A54D7 
X-CRM114-Status: GOOD (  11.85  )
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

v6:
	* No code change. Just added Reviewed-by: tags and fix a commit
	  message.
v5:
	* Added a new patch to fix some typos in the previous code
	* Rebased to net-net/main
v4:
	* Added a new patch to add dummy device at free_netdev(), as suggested
	  by Jakub.
	* Added support for some wireless driver.
	* Added some Acked-by and Reviewed-by.
v3:
	* Use free_netdev() instead of kfree() as suggested by Jakub.
	* Change the free_netdev() place in ipa driver, as suggested by
	  Alex Elder.
	* Set err in the error path in the Marvell driver, as suggested
	  by Simon Horman.
v2:
	* Patch 1: Use a pre-defined name ("dummy#") for the dummy
	  net_devices.
	* Patch 2-5: Added users for the new helper.
v1:
	* https://lore.kernel.org/all/20240327200809.512867-1-leitao@debian.org/

Breno Leitao (10):
  net: core: Fix documentation
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


