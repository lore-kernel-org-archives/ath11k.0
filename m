Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB4BCD1296
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUhpfEWYqP2FV8/YIvHMQS1+mW5LiNeJMicGbuHOQqA=; b=LAPlXI/9AkS4RmHbwEzWHsaNVq
	FF5ZxZbjq7wG3dCLheMzcoH80ZsaYu74Iu/fIZNH4ra63r14Gyo0Y8pSPv2x+zZvN67XGmkK8JxqQ
	nIMpjemBWNh6isW3Hbjl3ns1ycGKCx4KOSywrRacpwJKGf6xDzLEu6qvGjmDLJawPjYAdwYloiByP
	nGaAg5zZIABVd63ixSLLBSZ6LCrS1epc2uAiVHKEfKlF4YGfeFtmZ+mDbO1DMqRlLvQgd0nFJkFXv
	wg0m1FBykPJErgwPRzuK5w3xCP8hK3F0C1cKDlu6B8Dr4O+S/hu/Rm2cAYUkXNRtbNSOJuwZnnzjY
	a1wKPZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3c-0000000203k-1V80;
	Tue, 09 Apr 2024 12:58:36 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3T-00000001zwY-1oD8;
	Tue, 09 Apr 2024 12:58:28 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso2481529a12.1;
        Tue, 09 Apr 2024 05:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667505; x=1713272305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUhpfEWYqP2FV8/YIvHMQS1+mW5LiNeJMicGbuHOQqA=;
        b=UpRkSAa0Bge7IYClAeCHdQJ7uzDclQS+rDqMJvjm2Tads4nKkMTh6qy788Y7OCcx9X
         kdwEusH7rrYjfdLTvSC4hENxogoUtMPWm80v7GAm6z0RtIXTmyEn4rZ4cQmpLZjeWIpt
         dCaCqBtpKtxqgjxNQfCZqqE9M4JfXB8Vc+S44CmjNSl5ux1FNmdvsgKg7NLExo8fPGPo
         /oLWfgniZ0G9l4JvA3hNJL0Q+7/pH84Gs1lD1hmix+qVZnaBsXbMvj+LmplmtO+KRks6
         0sLSqd/P4iLJ4rIUCtt1TM6YHWsZcBsGX+I8YRyF43mjZ91GlA9VKNr/p/jD5nIp7dqr
         uJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVDNmT8+j6IBinW/iGgqqblbFQ6GZ71jk9grj/AN0DDVrBAz2So2QBNTs6g7SXHLXyrZalMmfzTkVqtVjd/EkPkgIiubrBELlReQ6KO2TXm9j8OU8C+MD7v7PBpi8SvoJjZRNPW6TEm6AQ1LDIothlJ7AMYNj7n/XO2akn5AcE1kdP9tX5KfUEr/tfhHWy1aOey/s4+AokEaTqOpKI5+0pm7aV9MY7/wYS2zQz8jp3pIA==
X-Gm-Message-State: AOJu0YxQHUwoGn8UindCfqXJ58Z4LzMf2NEszGzIENtlI9eTfxzABBQh
	bdeQtb3K8NMRpQeS7b4K1+23Q703ksLVOGGn/yH+ivNCOjbZZA1l
X-Google-Smtp-Source: AGHT+IFu2X6ZpedgoYhXGO+Q+OoGaIGzUSaEFpMawPlTuhVCHDAOIiyjG74dC49hqb1KU2Vp/0neGg==
X-Received: by 2002:a50:a69d:0:b0:56e:2e17:a3d1 with SMTP id e29-20020a50a69d000000b0056e2e17a3d1mr8145016edc.25.1712667504651;
        Tue, 09 Apr 2024 05:58:24 -0700 (PDT)
Received: from localhost (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b0056e3e0394absm4377170edb.68.2024.04.09.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:24 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/9] net: free_netdev: exit earlier if dummy
Date: Tue,  9 Apr 2024 05:57:15 -0700
Message-ID: <20240409125738.1824983-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055827_523678_AF6C3C87 
X-CRM114-Status: GOOD (  11.35  )
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

Otherwise reg_state, which is NETREG_DUMMY for dummy devices, will be
overwritten and there will be no way to identify that this is a dummy
device. Also, this device do not need the final put_device(), since
dummy devices are not registered (through register_netdevice()), where
the device reference is increased (at netdev_register_kobject() ->
device_add()).

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 net/core/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 92f5bddbc2de..bf0a335781aa 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11051,7 +11051,8 @@ void free_netdev(struct net_device *dev)
 	dev->xdp_bulkq = NULL;
 
 	/*  Compatibility with error handling in drivers */
-	if (dev->reg_state == NETREG_UNINITIALIZED) {
+	if (dev->reg_state == NETREG_UNINITIALIZED ||
+	    dev->reg_state == NETREG_DUMMY) {
 		netdev_freemem(dev);
 		return;
 	}
-- 
2.43.0


