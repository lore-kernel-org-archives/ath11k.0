Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16FC04FF6
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miI9xGAlBZQu0akspfN3cRlFcXGyCJhvWho9XnQboUM=; b=crFkoN8+XKU/7T5pE7A/1txDlt
	GgqIgn7E4FSU+9/R9MuXcLOvqwTpcc2CfjjDIn+EU/YLJJy68gF0+Vcg/FxRNXWJ3n+VdFC0MITVg
	OwsKtMLusuwBunDjGM2kdpdoxEExsqYSClRflXUi7Gu2cZtGz95ufLvx0zdhpDa+OQNHmeYM/2XCq
	E6h65a9W6K5e3K5QUmcVl0r6uOIj9cKr7TKh6uC/dK9agy+gh/pYM5faHrOCocB6ouSEimSc45ttg
	oQWW9a/fcFCbhFuPzDaJzZzzy1+uqz3MsV5JfbtQbao2AL2joIXvV54l0DMRPXf3NVrMvIksFgu2s
	9C5Rf9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyZ-0000000CJRJ-3OFz;
	Thu, 11 Apr 2024 14:00:27 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyO-0000000CJJ7-3vpP;
	Thu, 11 Apr 2024 14:00:18 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so9705846e87.2;
        Thu, 11 Apr 2024 07:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844013; x=1713448813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miI9xGAlBZQu0akspfN3cRlFcXGyCJhvWho9XnQboUM=;
        b=cLFFTJjkxoRmQHdWEeh5N33VRc3EVh0rJ73rbhKyKRHNgjVU44D7ufEYrZTVkke73Z
         ++3IXJLK2LVwl9cmzofBeVFQaJiNXKgqSTDdkbJsMi6i/RmPnIlBAUD8T2oy4Afx4ZD9
         wJfWgFAlEiSqf82ceiHMYal6qJjRSS/v/4jO1B/IYGAfguruWcENlzggL1OmZ/QR3Wbd
         Is6JdY34yicnkIxFBnN24qHIcT6E/UGnLTZEAl5/gEV5jMw1KRs2IAb1Dgtg6cvizvnG
         jvbuITUMoRyILqAs7IdkMMKGa5bwn2y45Pb2id3kAshqosiUN8/WBYfJQm1+gBliHBje
         12vA==
X-Forwarded-Encrypted: i=1; AJvYcCUfBSpqnQU4Z8/WE9jD3Dkzmb2eXj0E3qPzYWpRAB7PFuvxmeEz/MqC6lEIj3wPofdKd1zqAN+ao09UBm0ErF2DPRP9++2Ct5Hnmq4JaQdebGlsrxQChkY1SbOO6A/lUecs9cOuKdgTV89y+KlR6YwVAe924ljFYihqde5xg3tDzgU8Rs+neL43OP5I4Ear00Ia5DQVtcq4TAB1vGYtfO0zSYQczqbOHPvcEHb1qplpiw==
X-Gm-Message-State: AOJu0YwWr15EsfOYQKK3XP0ESujMF1KFXVGLYgKqgWomMcgJW/exx+Ub
	JMeqIvLFyxwGwCdwbmRcWPx5S/KnapZk9OkBJrbQv19V0BBh8/zZ
X-Google-Smtp-Source: AGHT+IHY9+zh8lZE7k3z/nqra7TA3HH8AsJ5/ve/ktV2rxzWinDpyQg8luGGcQ1ckKlMeJnaaBKNsQ==
X-Received: by 2002:ac2:44c9:0:b0:513:2c56:f5e2 with SMTP id d9-20020ac244c9000000b005132c56f5e2mr3622069lfm.60.1712844013345;
        Thu, 11 Apr 2024 07:00:13 -0700 (PDT)
Received: from localhost (fwdproxy-lla-004.fbsv.net. [2a03:2880:30ff:4::face:b00c])
        by smtp.gmail.com with ESMTPSA id wp20-20020a170907061400b00a5226f9542dsm429609ejb.27.2024.04.11.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:12 -0700 (PDT)
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
Subject: [PATCH net-next v6 01/10] net: core: Fix documentation
Date: Thu, 11 Apr 2024 06:59:25 -0700
Message-ID: <20240411135952.1096696-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070017_066820_93999C90 
X-CRM114-Status: GOOD (  12.88  )
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

Fix bad grammar in description of init_dummy_netdev() function.  This
topic showed up in the review of the "allocate dummy device dynamically"
patch set.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/core/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 854a3a28a8d8..987039ffa63c 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10418,7 +10418,7 @@ EXPORT_SYMBOL(register_netdevice);
  *	init_dummy_netdev	- init a dummy network device for NAPI
  *	@dev: device to init
  *
- *	This takes a network device structure and initialize the minimum
+ *	This takes a network device structure and initializes the minimum
  *	amount of fields so it can be used to schedule NAPI polls without
  *	registering a full blown interface. This is to be used by drivers
  *	that need to tie several hardware interfaces to a single NAPI
@@ -10427,7 +10427,7 @@ EXPORT_SYMBOL(register_netdevice);
 void init_dummy_netdev(struct net_device *dev)
 {
 	/* Clear everything. Note we don't initialize spinlocks
-	 * are they aren't supposed to be taken by any of the
+	 * as they aren't supposed to be taken by any of the
 	 * NAPI code and this dummy netdev is supposed to be
 	 * only ever used for NAPI polls
 	 */
-- 
2.43.0


