Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C36C4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=; b=I1O5dt1Th+UTQgXbv+jbUbZ7eD
	E0lXYgUGaY1PnC5vnNkpk4/EZalnGXnaCyf1MLLm6mjQy3KXekTR1pksT3MWWAUXwSQteYrPtFHMz
	XlRXaXGZy8nfbqmE5yjfcyRpQYWur0rNsHkyQoiFWn0hd2aLzI3tohVxehVLSb18JFs4PIh9XCqmA
	nGG2GpZgiFoJTqBQg2cPu9maxyaXW41luey7b1gVyXxs3K3n1m2S7DVjVsb2sDmVehEvlPd1fWaAK
	tQ+w8nVfGXWs//oHKAXJ6eyBWBFQxU6B5Dii0w+8Jak+7b4oE9MOE/nlSRQyuTGV+xAldIs25ii+z
	ook8PIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryszQ-0000000DY1h-3q6l;
	Mon, 22 Apr 2024 12:41:44 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxu-0000000DWvz-3xy2;
	Mon, 22 Apr 2024 12:40:13 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51967f75763so5100105e87.2;
        Mon, 22 Apr 2024 05:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789605; x=1714394405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=;
        b=LPJSMjiJrRQ+Ecax0LKY+TbJObJQS9FAMZTJsQddm09oZXn6Xp4c5acGXd38rPbeVz
         tAb9HcMc0eGj0LQ7Tl0E0DEts0Yi4I57FsrZ4ztsigonECUL19qlvIQQNh4YcoDeJThU
         ZVr2IaJRrtRvUw8oFhzNUy6GfGLvYV70vOKlfS+/2de+iZX40Znmz789wubBJJfHHstN
         h4dFc/WcxCeKvoNshmZEuk+tJnxPwnPK6B6gvZeRm7Ybt33SIEmomMdu1n/LYwfCZYIk
         NYhzGZXrdZIrsfaNloviHgTS49QvnDtNNJ9SpxYSV4cMll3rzDzLvttSGdfsO1T776jL
         G9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYrYiENAlNpgHNsNjZyVc1cdgZzkMQz7g8GanGy7jNBT5RpMQ2J0blGVG5KgVl+8/b3u0L3uum9ADyTxR6EqU80MqSGsM6ZFEixueD7O7uGc5eWDVHFomrcnTlN4TU3C5AVOH34S8v1+Xkt5AvvCTjIk13qZlW7xT1Z6nK20YhFqXSpBflEOmj6TzjuHyLGlqOHLKrqR2l0zHECb9Vbv8qehpXIT2N/Xj/X7oAAhftdg==
X-Gm-Message-State: AOJu0YyyYFFwn/wElx25SPWrhje6tOTEVe1xVnKBzbA0rZJo++IAqHqp
	XXAohdfk0p8n5MRdSA6WrxCcF+bju/slNB0DCaUpQQCcDlzue2r0
X-Google-Smtp-Source: AGHT+IFPaMXGPrfIOWC3xSs/FsiQyHtswf+lwwOxRqmyAAyNI/Q/4fT0q5REUlhk4xp7o5aQnfs+OQ==
X-Received: by 2002:a19:7019:0:b0:518:96b5:f2c5 with SMTP id h25-20020a197019000000b0051896b5f2c5mr7368797lfc.46.1713789605113;
        Mon, 22 Apr 2024 05:40:05 -0700 (PDT)
Received: from localhost (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id gc24-20020a170906c8d800b00a55ac217235sm1944772ejb.90.2024.04.22.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:40:04 -0700 (PDT)
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
	leitao@debian.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com
Subject: [PATCH net-next v7 08/10] wifi: qtnfmac: Use netdev dummy allocator helper
Date: Mon, 22 Apr 2024 05:39:01 -0700
Message-ID: <20240422123921.854943-9-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_054011_210605_A0751B4B 
X-CRM114-Status: UNSURE (   9.54  )
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


