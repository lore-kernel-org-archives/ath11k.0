Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E079EC07E8E
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbJZnQssCi/hJC/xoZUOS5idPxjZFYtuFqS1Ajkusf4=; b=UllEtIiiMB7ZunFSBiL4DUMU5x
	OUpOt6hbM7eNxGkvZVI7ziYtYhVI96t5BgChzyVMYBtIFeM9O9TxrPHYhLo1GVC372Lcj4u7tjORS
	+9SwNa/pSv2YTlAGIEu5i+TM+ZuW1YBLsHYqwEOyQQGuJBYWmKxVNqvBspp5U3O0l1z8WuRcwuQbG
	1DlOFepXjRHUdG1AW9RWX+p1HWz34Ld5rL4+xD77M5EaIDn+5ZIK7wQy7QwSkdqPyZUQFoE+EUWuQ
	EyrkHObomU4/CiyPf5M0yBor1SENx0BrDpDW9CrabhNaPmOc5avw5WnubqpYsotaM23xOafE4+pwg
	95JsGKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxt-0000000DWyw-42Ks;
	Mon, 22 Apr 2024 12:40:09 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxa-0000000DWh7-004l;
	Mon, 22 Apr 2024 12:39:51 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a55b3d57277so123283066b.2;
        Mon, 22 Apr 2024 05:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789587; x=1714394387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbJZnQssCi/hJC/xoZUOS5idPxjZFYtuFqS1Ajkusf4=;
        b=pJHsDlDgnYP456lRMc8BhqorGJoCw4haxEUTnyeWQ8jqJtas/Cr5BvBqFBDlchjkTm
         rcUl0ayTczWz6kUlhC1PCXjwtGeo6+apSEuL3YoCOQDlQbVnYLesKA+IKuRhneDWl08A
         uK08ZaUQSwCpYmCJrhdKZntZYCmbjaisn7kDEKaRg6+S7uzAzKkcOelMflbUh6P6dCC+
         zZG6/CxZGxtBwp3XyFUoRWzuGEU8OuHdjHB7fJ76u4curJ8F5uhhXkDXqEc/XfZXA3YJ
         XpQOVTn0YeKLsPxYoak/wjs+37kBZOphj58wtYTI9FxCOCZWkxESmmWCxA3Xh2WcjlZW
         b+zg==
X-Forwarded-Encrypted: i=1; AJvYcCWf8YNGWTr69QTyHEyzcotOIVKmzSy/roiwGtwBEgLNCFcSdCy79TJvTjlyx1yQqhTx2BwQ4+iO4zScm4fOUmlkCP6Ygcu8h6UT+F8SsYTcT8q531bQtSsu+vp9qYegmcMuc/5mv3nvTBasi1FpFVpToh7Jv0Gy2hKsMNLgmDaWNE8BYm6SZS8bK20XyIvImo/EPfPXI1Ij1CxDBP6sgEu/+LN/F7Pk0tEyD2nHbBHu4A==
X-Gm-Message-State: AOJu0Yw4s/iWLOuhBGP5aMf625+7VxbAAupLDtbTapCpUxfjRa3iKzjG
	h3xIDxpOjFiPzmCRbJxkpMN9aSzK9Ilj83qGRUxvF8MfFIfnGh3W
X-Google-Smtp-Source: AGHT+IFgz1cSAQ4ZHhLBiz7E/9ZRPzAm7gHu5+JNi39+LH9FDyOn8sfX5i//ePdYd5DWE+bbIInw4Q==
X-Received: by 2002:a17:906:5292:b0:a55:90f0:bdf2 with SMTP id c18-20020a170906529200b00a5590f0bdf2mr5064912ejm.32.1713789586720;
        Mon, 22 Apr 2024 05:39:46 -0700 (PDT)
Received: from localhost (fwdproxy-lla-002.fbsv.net. [2a03:2880:30ff:2::face:b00c])
        by smtp.gmail.com with ESMTPSA id sa40-20020a1709076d2800b00a5255afc856sm5708684ejc.84.2024.04.22.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:46 -0700 (PDT)
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
Subject: [PATCH net-next v7 02/10] net: free_netdev: exit earlier if dummy
Date: Mon, 22 Apr 2024 05:38:55 -0700
Message-ID: <20240422123921.854943-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053950_068495_626191E6 
X-CRM114-Status: GOOD (  10.40  )
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
index 44c2d698fd1b..62b39d6b1d8f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11066,7 +11066,8 @@ void free_netdev(struct net_device *dev)
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


