Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A59CCD1299
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=; b=Lx2Df690y/ND0o5m+mhZzu5VSN
	HBvWNbpKYLjXoWlYKev+bfBi//LFKdp5ZitEsvxL1PubMhldTGOk9raROkenohQGUe4OUVHUiXMFl
	jEo/yYrD+ATrPBdurWtoO9fSHjjkdRvULs8Rnud9KAPA5n9LZcKyDypl8JPyrWBheSEn6heMKDUb5
	FgZyQhIA9W4dCql8AErnsIwNLfe5EaqW+EYRMcfz+aqGMUbeyVSLMmoGVjXxGeB/xKqcNfPT8zhWC
	M77cw+jT4mGzCsLXoQNNvoQ/Jz3Eb32YPZzUoUfPk15cn2BCflB3Xkmw/Kozf3870IA3XqiaiaMLr
	/aDDZG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXrf-000000076kY-2vej;
	Wed, 10 Apr 2024 13:19:47 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXqJ-000000075ZX-1l8L;
	Wed, 10 Apr 2024 13:18:25 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51b008b3aeso531384066b.3;
        Wed, 10 Apr 2024 06:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755100; x=1713359900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=;
        b=biUokhFVrxEwHuFiCuTTM/1rmUpk2OJtQN7xKR2wJEmDlysOOuADYkh5em4vALOqMa
         VtnOFZC3QrKCbF5gl9r97sMcBc+EvqkndWZU5RxnmB2QDf6MTRzg6LpPVxBB0bCUbskA
         87XPwceumrUt2lqUsGCAQSY6SdYiOCQExeeEVDyxZVAyNqrAx24J+4m/608/hX5Xkrye
         4480HoUApWPTBuscB1HCI02p2kbxv1A7LaGzRkH1+/Wa2plztdSk2MOknrVz+R9bKtKu
         4xYKoJIx1J9IaXxzvx/8DnSEfQztcI09IBclsC6dx1TLqghsdgLZVXbS2HmyQrDVjZ/r
         4bxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlvwzolFJDrP0POA+5SCc30CxnRLtovoKg7zrEstGhTQbQYSASWoaX6kLUUcxzeQNDlFa0Cxm7Mfx9L+6VRTeuMXYTkXK1ynwjAu0bTaz8Yv8N53pT2Ool4j23Shlql/MwnGTo/VbgxxKhaBBhLTt4QRkBZ6x3NvNqGXQluIwU3O6kp/O9Don/Kr9Ne18AmC8f3Io33z3LuEq46tAs9nMrwl4Gn8licnl6TsPwoJzWhw==
X-Gm-Message-State: AOJu0Yx2XL85UBchEg7VIlby4xnUtgJazidrnId/xxcs0s997Y9kBevh
	4qvGjAMRfwWYLZmwFzrCHgg2ijk16ot8F9dLed329Yr3KXtmqptf
X-Google-Smtp-Source: AGHT+IFr2S2LI08jI8XIroOmyyE/85QrJ6Hsd+T5Ighzae4CMX/NDkh7+a/IOM6kncoda2BU+ME9hQ==
X-Received: by 2002:a17:907:7ea0:b0:a4e:6957:de25 with SMTP id qb32-20020a1709077ea000b00a4e6957de25mr2199693ejc.57.1712755100549;
        Wed, 10 Apr 2024 06:18:20 -0700 (PDT)
Received: from localhost (fwdproxy-lla-116.fbsv.net. [2a03:2880:30ff:74::face:b00c])
        by smtp.gmail.com with ESMTPSA id qf15-20020a1709077f0f00b00a47439647efsm6935601ejc.133.2024.04.10.06.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:18:19 -0700 (PDT)
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
	Igor Mitsyanko <imitsyanko@quantenna.com>
Cc: quic_jjohnson@quicinc.com,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	idosch@idosch.org,
	leitao@debian.org
Subject: [PATCH net-next v5 08/10] wifi: qtnfmac: Use netdev dummy allocator helper
Date: Wed, 10 Apr 2024 06:13:49 -0700
Message-ID: <20240410131407.3897251-9-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_061823_544928_BA01EF8F 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

There is a new dummy netdev allocator, use it instead of
alloc_netdev()/init_dummy_netdev combination.

Using alloc_netdev() with init_dummy_netdev might cause some memory
corruption at the driver removal side.

Fixes: 61cdb09ff760 ("wifi: qtnfmac: allocate dummy net_device dynamically")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
index f8f55db2f454..f66eb43094d4 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
@@ -372,8 +372,7 @@ static int qtnf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto error;
 	}
 
-	bus->mux_dev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
-				    init_dummy_netdev);
+	bus->mux_dev = alloc_netdev_dummy(0);
 	if (!bus->mux_dev) {
 		ret = -ENOMEM;
 		goto error;
-- 
2.43.0


