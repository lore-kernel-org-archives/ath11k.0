Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E032CD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=occnMuVDkr0AXBDmVEHk6wT/diJ6dvMaufRR7UkwoZc=; b=rQTAsdkdmGPwPS+f6NwNj87q/P
	zagrpGhokjfAtQBLbdQwpzJk6ZunCEa5/bT3MUmS+VAPpDxvBpMtzmZt36mcyjM8b5hShDt7D9tbo
	Lg1vx6h0Xe6SyaAXTtThaWLpPkxAMXYV4877tOgu63kDIcsPJvblIIHX+J6WPY8IZTQxgTn8s3MjK
	urNNL3iwYcFtTjOmzhAzWO+nzRPnuQP/XZYHZxwWY/5cKE8SzhbBbEkMKMXpINoglOkDgaaTX2BHE
	K7qCVDP/xkc0WlxF4NPf7UTfUtlzaY/LhDEGggRish1xRVFNtsitQZ/O0W+zrwD+d6av3zrEdgw9O
	KnemrHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqF-000000075Y0-3vLx;
	Wed, 10 Apr 2024 13:18:19 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXq1-000000075HY-3atf;
	Wed, 10 Apr 2024 13:18:07 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so4120702a12.3;
        Wed, 10 Apr 2024 06:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755078; x=1713359878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=occnMuVDkr0AXBDmVEHk6wT/diJ6dvMaufRR7UkwoZc=;
        b=WS/KyEpHTtkTW0m3N2ohz3NGNkH+Lrt6VvpzJs4woh9lWhrCqkXsdFRzaE3h+KtjrE
         eo2Wf+a94JYdUnaFluUZe2TBt1GCbOrvw9cuFnOrvFDI7+eDMrfR4hU6O0kW3CTKLthQ
         2LdgvXwU/zM3zoUiPInJNUElxCSIu7l0uXLgJ6XGIE1GP/PFkS0NhSwSsh6jZJOnq6jX
         H10By6H/ZGhZS1+QmiO2YlHZ7kKhSnPHrZcbFLw4QBPIqHm+Suc7rXByCnabVRTi6nAI
         0kSypiUeSFwvFCm1M8aBrnf9EIBaMLKoER2j7EDet0WyoMN2hYrqgLPyKLw7sPFc/MJE
         uouw==
X-Forwarded-Encrypted: i=1; AJvYcCV1R1hklKRCy2ogRu50nJ2L7eJs0JplzLQBXTeTmXIEZZfKwYPudHKsj2VtAcqUe/jRzlFkwb4VUQs968rA9aon/lNa/alyV4GzZYge7B8aJNL//LhIge/31LNfpDmzf+K+AOkrhtI9kuJBCyOd07pgdnGh86rOPSNpXd6Tm1jqGD93V3c4gHZ+q1Fv6XvPM2dzLrv/0bEd++PjbWJYHc+SL0I8u9ctYbr0NPfCA8xRLw==
X-Gm-Message-State: AOJu0YxopMYymB5xxNgE4VTIkJTQZVdZRyuidIptIjmu0V530vs/6JJl
	IKjQMV/jd4dtjSDsBX8kQPijCyKCX1HnO3KjgUWQ5Yn05IzmRwC6
X-Google-Smtp-Source: AGHT+IFYz6nezPO0nvcRaOh3691IM+U3aDTWAVz3mLdQiEXd+y4Shu3fXDmKe+RO4EdGoiCoIVd5pg==
X-Received: by 2002:a50:8e50:0:b0:56d:f3a7:60e with SMTP id 16-20020a508e50000000b0056df3a7060emr1782120edx.22.1712755077926;
        Wed, 10 Apr 2024 06:17:57 -0700 (PDT)
Received: from localhost (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id ij6-20020a056402158600b0056ddd9427d2sm6504617edb.58.2024.04.10.06.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:17:57 -0700 (PDT)
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
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v5 02/10] net: free_netdev: exit earlier if dummy
Date: Wed, 10 Apr 2024 06:13:43 -0700
Message-ID: <20240410131407.3897251-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061805_934692_465C760B 
X-CRM114-Status: GOOD (  10.83  )
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


