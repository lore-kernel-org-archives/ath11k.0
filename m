Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3F4C4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48LVrXVS7hCk3whDT2bfgm8Paw2cUTHxHkmOyfqwerk=; b=sA6B7AWSEeVhqw8qu5hF8VUsXr
	eypMgZTaMSYeKIecyPRDKNHhmQVnbnUxiKpP0nfguGIIrREYfaORf/ez1o/5+P9hchRo5G2BwgUvc
	0//Uj/PRYwYZJ6hKMh6xi0wzFxQBeh5Qre6hbfKU4w7s7Uck4BR0rMMCcS0OAWcEGJHCfukjdr60V
	ipajCZI9ZDRduKAoQBDKw/kg3FLDMXK7lM1iLdeCq27uQK5za765O0/Yc8YzYz7+DAaDN2XfWygVt
	mMwBm1KzjuAhx4zGtI7Q8M82HcW2P3gQbaRIwGYMAEXlkd08jo4Ip/GNznG8UswLsqFcr1uckLKC2
	gvYvrK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyy-0000000CJme-427m;
	Thu, 11 Apr 2024 14:00:52 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyR-0000000CJKH-4AwQ;
	Thu, 11 Apr 2024 14:00:22 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d727074eso7766033e87.0;
        Thu, 11 Apr 2024 07:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844017; x=1713448817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48LVrXVS7hCk3whDT2bfgm8Paw2cUTHxHkmOyfqwerk=;
        b=QaolOkV/oS/aWzsPGO5oi+eue0b09fNxZyDtLZyoJJZpfkiL5FSojTwpLZrW0hlfQ5
         e5hQzrA0ILuL7Q8+tzgzIQLwr/ElvkKOZ5KwCh/BXckT1t182eUXXW5FoAyVm4XAwlTV
         u+dssyoyDQUi7wb4gL+rhgGZQD87rJesd+RyNwBFHjgIBBLnRFeY33lJ2tUNLyx71pM/
         SmXoRV8npLI8Aa+LLYmRM9SMBggQuIGINeLvUqhPZQe9Vi1abP8cuUFXLxSFyyZJmzp7
         hjkWi5yQ7Ev/SeON24Budu5oPSwnw+0DKoLhbAti90Yy0gRfNmtp1VpjhvHFImiCTZrK
         0XkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxM1goFyiw1ki5k7rcth2wmhK+p2vCyCDLes1yRFp28bwU+vtoZS2Qq+JEPWff5Ih4ZVIqym46O5e6zMmmk0siCQ2+STdy0YLLWvICioTX+nKNzXokoRb1X2eU4Cv78+sNwx0AzPHPsD2eNFcOqUxxrKOneibTTPkK7ksPrNlRjvHOAgVDkdNGr7VaL6r+TekwWaPoAb22O9vLRVnawEDdv3mRYBfEFlZbYWBwcQfgBA==
X-Gm-Message-State: AOJu0YxU9Lmr4NrsNdvSyT3FXY3Rtv0ycaL3hpwyho5xV7itplMn+yuN
	CKt9nrJNocSfscOlYxrGWnIhZmySYFhudVFXuEmnfIfEdoO6eKPO
X-Google-Smtp-Source: AGHT+IGrPLMoxbFZfdOPsWa0B79xpULXw8vQTkF3ZWlBdhuRM6Z4gSoOA0lmdY0K24jYvaydEzayKg==
X-Received: by 2002:ac2:5df9:0:b0:515:d4fb:907f with SMTP id z25-20020ac25df9000000b00515d4fb907fmr3578453lfq.27.1712844017308;
        Thu, 11 Apr 2024 07:00:17 -0700 (PDT)
Received: from localhost (fwdproxy-lla-119.fbsv.net. [2a03:2880:30ff:77::face:b00c])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b00a51b18a77b2sm771309ejb.180.2024.04.11.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:16 -0700 (PDT)
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
Subject: [PATCH net-next v6 02/10] net: free_netdev: exit earlier if dummy
Date: Thu, 11 Apr 2024 06:59:26 -0700
Message-ID: <20240411135952.1096696-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070020_316483_C08167B0 
X-CRM114-Status: GOOD (  10.50  )
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

For dummy devices, exit earlier at free_netdev() instead of executing
the whole function. This is necessary, because dummy devices are
special, and shouldn't have the second part of the function executed.

Otherwise reg_state, which is NETREG_DUMMY, will be overwritten and
there will be no way to identify that this is a dummy device. Also, this
device do not need the final put_device(), since dummy devices are not
registered (through register_netdevice()), where the device reference is
increased (at netdev_register_kobject()/device_add()).

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/core/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 987039ffa63c..c74b42bc6888 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11060,7 +11060,8 @@ void free_netdev(struct net_device *dev)
 	phy_link_topo_destroy(dev->link_topo);
 
 	/*  Compatibility with error handling in drivers */
-	if (dev->reg_state == NETREG_UNINITIALIZED) {
+	if (dev->reg_state == NETREG_UNINITIALIZED ||
+	    dev->reg_state == NETREG_DUMMY) {
 		netdev_freemem(dev);
 		return;
 	}
-- 
2.43.0


