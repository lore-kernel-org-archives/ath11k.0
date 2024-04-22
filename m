Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F35C4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iz0ikdoTMPeoGlY7AzEyABEuqkNB0Gjgw6bWzoieFE4=; b=TvW0FJYHFBdmuDNIo37XOKyFh1
	cC/H7g3xSdx/QsQChdM0arOi0PMfyWYw0Hbd8xJCe21GxIeQUKP8oepr7qv7GKBlO6TQ1HhagnUK3
	oAWYBYzIcbzyLhTcLWJZCHtFlokvsLiDJBoMsWz3AQOXZYTlPekOyEYZM4cClSZxlN5bv/WNfKbOP
	K3cNy+JY7Gb4OELmbSn4U9l7eaXUwsSrcKpw8BT//ye8+HsTOYt/HZ7KagtdKarTDqPYMlgZ6Y8DT
	+EZVI04GGCNdL+2kZJHDo8Y7cmYyIK+66iTx8z7nZlMJaEI0wmlw4zQ6f1NnRWP2tqkHwEVB5Ubxn
	kmHPvE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxU-0000000DWes-0f8K;
	Mon, 22 Apr 2024 12:39:44 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxP-0000000DWdD-26NA;
	Mon, 22 Apr 2024 12:39:41 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so2591602e87.2;
        Mon, 22 Apr 2024 05:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789576; x=1714394376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iz0ikdoTMPeoGlY7AzEyABEuqkNB0Gjgw6bWzoieFE4=;
        b=sOJUdZoO8NTqx+CWOJKxGncqzWDX3/lbbr44eLtfVXapv56PbPSAWbE1DaMYDyzsPj
         pf0kkUYDEZsHrOeWgf1Ci2+OUvqAqLfUz/z5qeVNI4hmU8F9yG/uaRaKSOT1Ne4FyVqa
         IZMwTFhYEXxMd0LBpsSPhkqkEfYUVoktUtVVoAJaYVNB65NAJeW0wUI1gJO61dqfKoVF
         nfLf1ytqVnkEbrQ4xJgmKWC5NmcofFOFIv4YcqTy4b4AiE5+Sz+Jfy4OlEWljKEC4KPX
         5W3lWDiAflW67S2dRwcmSAQ0PQtfM5bO/VNx1TLVh67U7DD0LsRzq4Id82S5W2zEE2Pg
         iEEw==
X-Forwarded-Encrypted: i=1; AJvYcCVeWUaqcfNyPhGe3x/jaQ6cxpl+GZXEE8M7fUj+VsP64ZsBYQHfqqD+IGOnFnE1hsWkoaj81hMfn3aUOTt4/tssEb9WAC43m1TAQHxww/69yXLOtulwofEiElO7eqm1VhAIyMs2LqEJ1h8Q2Zj64yxPokohDeYALt5EPqHIkxhOycMcwyaXjkWY+ZNBbAspW6Smtx5VciLVfHNyrBzclrxqajovXgNUD0FFR2QSJsHI0A==
X-Gm-Message-State: AOJu0YyAXEVu2VUMsWXp2NjrLk6yGy/bt3Q9Wk0I4rFt1/wWmzEm3C0E
	Vx+0AEbytSFsJyZ3PZHKqSP6sZKVukMBAL5Rvu1Mz092Pc81T+n+
X-Google-Smtp-Source: AGHT+IF5YTCCg6KEsN0PmqluDOTi/5NrwJEUq5lvraAub+lxIQJqUtef+oDOn/RubcUZafX5KbdePw==
X-Received: by 2002:a19:ca4f:0:b0:515:c195:d6b8 with SMTP id h15-20020a19ca4f000000b00515c195d6b8mr5518092lfj.60.1713789575968;
        Mon, 22 Apr 2024 05:39:35 -0700 (PDT)
Received: from localhost (fwdproxy-lla-117.fbsv.net. [2a03:2880:30ff:75::face:b00c])
        by smtp.gmail.com with ESMTPSA id og14-20020a1709071dce00b00a55ac4c4550sm1906884ejc.211.2024.04.22.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:35 -0700 (PDT)
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
Subject: [PATCH net-next v7 00/10] allocate dummy device dynamically
Date: Mon, 22 Apr 2024 05:38:53 -0700
Message-ID: <20240422123921.854943-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053939_561235_990BA787 
X-CRM114-Status: GOOD (  12.10  )
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

v7:
	* Document the return value of alloc_netdev_dummy()
v6:
	* No code change. Just added Reviewed-by: and fix a commit message
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
 net/core/dev.c                                | 59 +++++++++++++------
 19 files changed, 129 insertions(+), 53 deletions(-)

-- 
2.43.0


