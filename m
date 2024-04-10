Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ABDCD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCSWo+cbTjbJqU2UMVUeUJFNUS6Yf5iPYegXsbIUp/M=; b=1Q+ndnSHqjqLBYj/BRwXhmmIyn
	CofeP/RPTJBoHa6qW55azdYh/yzQ9O160YwOcZkwU+xWtUtc5LtvDmCURgxecWZJLytte+H0+FvIx
	5+pCUw+Oqjo4f+A85AScDASYckFVrKeqqO6sold9FKd+UwIbLYe42af0CC9q3GSs0/xdfAMBIwKma
	dzaaJOpzhLlo0Rm2sp4aojcYi4MH6VYEdDhP33oVBgeCEav8z/fpu4V+rq8UdVM1ItmcP0p99URe1
	CJkrtASLOnARfOzZ9BEPoobSEc8DhDsTFrOiBSZJYY4lvsG05WFfn8nl5Aot51a0LCT1YIid/i68S
	ZoOZuRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqd-000000075sn-3FPI;
	Wed, 10 Apr 2024 13:18:43 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXq1-000000075HB-3j4T;
	Wed, 10 Apr 2024 13:18:08 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so8242940a12.1;
        Wed, 10 Apr 2024 06:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755074; x=1713359874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCSWo+cbTjbJqU2UMVUeUJFNUS6Yf5iPYegXsbIUp/M=;
        b=OY3HXb4kjBo88or738hZioG27a4PXF24jLl1Qi3a25V7ZT4CB8s55/WVSgr6SbgN4h
         kDHe47wpjsX2sE/nk1n1NGUDYjERoRDfh/WQ3bKqNfUlIS/QkdneBolRmjrlxFVsJOkB
         FbOfopvkkZS/YScuDlirElH1zdHNg8fY/nW8lSvtGAKZZVsI9arafmb1XXqF/FRJhJWv
         n76UL1b7ioIWZPETKihatoR64BIZEaztKimLcANDqIZKEuYEo0Rut2OOni+VTvrWWGrv
         XYpNUgHjYxqOO1pMxu0m2FurMt3qsehgZhtRW3YKrVetm3zVUlEiWX74Tb+cXJHqV79X
         jv1g==
X-Forwarded-Encrypted: i=1; AJvYcCXSMMyQn65Pmz3OjYReTKLaKkqGLQKqsW5kLgTnfT6SpOgb/39aCLoqWtuIYZ1kDIpmqcsq3CW4gFWAqxDF3Dkm1IGheix1ZmJ3GYQwtftirABMTbF+8LRQLPUr+FGBSUgzbLYVlK+C+xCzzNJ/TkUZXFxQh5jEVAxmlVoioSR7HmtbJL9MmnDI1l5GaJQu3M2XdDXE93xr4tC5j9EME9tHUakZu/tiefvZD9UdWCxbjw==
X-Gm-Message-State: AOJu0YwhlzbKhp8HPnWrz0+bsMQl31ovCrb1UOtBxifS7Xo+ERyDDiCD
	5mcx1eOo+JLtvpYJdhn9HLYYNAhCqW37eM4bEU4N9bKJYFME6uSb
X-Google-Smtp-Source: AGHT+IFzohQ8nifeoYK9ng+dXMVkUWT33vP4drtn7UGXanZmNkg0eJxYz4rgtTa24o9nG26otr90ng==
X-Received: by 2002:a50:baa4:0:b0:568:9d31:2a75 with SMTP id x33-20020a50baa4000000b005689d312a75mr2097283ede.4.1712755073613;
        Wed, 10 Apr 2024 06:17:53 -0700 (PDT)
Received: from localhost (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id y9-20020a056402440900b0056e3707323bsm5689027eda.97.2024.04.10.06.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:17:52 -0700 (PDT)
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
Subject: [PATCH net-next v5 01/10] net: core: Fix documentation
Date: Wed, 10 Apr 2024 06:13:42 -0700
Message-ID: <20240410131407.3897251-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061806_020739_AF9CB36F 
X-CRM114-Status: GOOD (  13.20  )
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

Fix bad grammer in description of init_dummy_netdev() functio.  This
topic showed up in the review of the "allocate dummy device dynamically"
patchset.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
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


