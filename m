Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F96CD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NK/ebucV8gkQdirPclBiNQxag+qh5mnAVP3hrQ1KOiw=; b=eKGQwtCaWk+Rc/4TMoFZ0BNNnm
	97/iudNpsgVfW92rdGgbhhn43/ghRGYduhhqQwSkzRgA6Q9Se2mw60rD5SSG2fjqXTp5BE5Cn88qP
	cIXLrcRHN6nPcbpOAO0HhTW35SaVwrGjuwyeYzs1NNTjOJF06NuSWmhEUFt41qUOiyR//aQdGVgH2
	JIcp4vDtwL+Y0N1/+G4MzTvUR3/jhCQUJMEII+i2KCneYtNAiqNv2ZYytimBji52512kzI0B8/Lz3
	EjtZNRoGREPS+eHloQJImnba12Cj6pvfCA/E4uwguFNlnUgg5KnKb55S5wv51/SGIZlTQZPM9tjZn
	C7FIBxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXpy-000000075J3-1dkF;
	Wed, 10 Apr 2024 13:18:02 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXpu-000000075G8-032D;
	Wed, 10 Apr 2024 13:17:59 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso8939103a12.2;
        Wed, 10 Apr 2024 06:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755069; x=1713359869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK/ebucV8gkQdirPclBiNQxag+qh5mnAVP3hrQ1KOiw=;
        b=ndRxqYTpK05J2IZNJMIt601saG8/1+I6/oia5KbUgdDhdHVNExhtDKfBQgRqGgLRvV
         RB1kyEP1+d4KxpN7enm/Jm5Jp+0iQ6Pn5Tsex3Hs7MuiG1pzAy7oM01jQpHl1X+FSLi2
         cY4JJz1hBlDpCY1Y5L8D1BvfrLO9ECN+HXvFqp7uHJkxQ2cvzkGvTAG7VUumvXcoqtWV
         b0KPCeCLiBWaODcu+GRWRrkSJwFw/4HtBZNjQ9xSY2wFIB3eMcsqW5ygOEn5JcOFrXKY
         Qk4F0nBp2zT87vcsq6EtmTXPCV4TD54xVQgtWC1bsIcfmtTpSS5dLftlMQhYUSmCkAYD
         o53A==
X-Forwarded-Encrypted: i=1; AJvYcCVbzxiJ0334BHuLrJruPHiIjQv61KDufzWBMTuY4U5LxImhOplTUwQaVjTHi6d13swg+2k+LEaa5b+6wJwFZZnJ/69n4bkS0xYQGBxvFL5wUIK5H2T1Blnly37OoECK2MKJ7yVKQzUILW4GrPYk3/c0lUwVtE7VatN0ODeV5EiHyhCINCkdxTRoHD1uH++7Rm63UqtymIDON0M62MZ+/nBguj555jxBqeMD3VbweHMpog==
X-Gm-Message-State: AOJu0Yx4gWFrQh7zGWKIiOlFL0Jdn4b4XTtp5kh7TV0VPjorvRXa3/L2
	yHygwkZ72YVJbG28pD9LxVPYww4NRoUSLNY7C/AfviC7NXfyZhNO
X-Google-Smtp-Source: AGHT+IFSd0Sg381tqtWe29jdXXqCNujDjWni8Ms+Iy/hEjPdANID9QF0uHrZU2yu/2/4I7NBrTO3cw==
X-Received: by 2002:a17:906:4f17:b0:a52:140c:571b with SMTP id t23-20020a1709064f1700b00a52140c571bmr735783eju.3.1712755069216;
        Wed, 10 Apr 2024 06:17:49 -0700 (PDT)
Received: from localhost (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id jl7-20020a17090775c700b00a4e70ede2b7sm7016390ejc.174.2024.04.10.06.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:17:48 -0700 (PDT)
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
Subject: [PATCH net-next v5 00/10] allocate dummy device dynamically
Date: Wed, 10 Apr 2024 06:13:41 -0700
Message-ID: <20240410131407.3897251-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061758_076559_B1547FA6 
X-CRM114-Status: GOOD (  12.07  )
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
v5:
	* Added a new patch to fix some typos in the previous code,
	  suggested by Ido.
	* Rebased to net-net/main


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


