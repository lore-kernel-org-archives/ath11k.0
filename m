Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9EFCD1284
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=; b=VbWGJOmfKoS4qwPGEBgxCkvVYf
	tRf5UI3jy1FYLxUuJc0J/QxCCgGmuDC7tevPTw9e0ERUoVS3xp7Tb60YSWYkukes1TF/urrzmSdtM
	rau1U9KGBjQt4cbvHKJBFHlVE4Ppr4Vq7eqa6RxNG3507LYJU4FZsYQaHVPsa6zsTp7ETwWM6/8hx
	cIoofjudypZaEqGKI3HPmVKqqvaFvRYyDPyVlMq33p73/p2tqlPkDl1ytsD7njSB47jteHrxKeNBD
	01VeGuozOYCR8wcLeiEu/lRHssb3kjC4ylviFz1zU3Xy0OMLK/TMfZ1zFp1HJi+RnaIIT2KMNTXkT
	T3UgXspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB50-000000021El-074w;
	Tue, 09 Apr 2024 13:00:02 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruB3p-000000020AD-1z5g;
	Tue, 09 Apr 2024 12:58:54 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d0c004b1so6462681e87.2;
        Tue, 09 Apr 2024 05:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667524; x=1713272324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=;
        b=pXKTIJt6RREOu1a2HyCHeO3CARStEMMAaS9XlfYkyh0aH70QwH178TjQvMp4h8+OXO
         SeRTFtZMdi8iXFbAZnE5WO7JQT/EZtak6zoObOaPzpdUtn3Nfcd+VpbxRlGO8gE4EVt2
         vfirqCg3oMIll3KdV2AXRLr8JLFB0iwque136MCtIiryahrYOz6zo7+XBNmt/AupB0p/
         XkF+JABma++BilAoH9CYc7YvunjrpRNu7ywRKtAicwVwm1kj9vIuWzllL/Km+q2UckHl
         C/hriMzefa3t69bYmKX6Mdz0l4/3iMRVY/1Su7n/58etGkKQZgRg7qiMK+sW7pznnth+
         nDyA==
X-Forwarded-Encrypted: i=1; AJvYcCUQEebmPYFi9DYOI2VGhikWuNmJtaONt4lWd6CVSZxMVB5pfTETfyyUoIrZ04/hmFCUGEkbOAYqTem2Wd7U1HLTdmYNTy8un6t+Rm0NqNpIihAR0lkesWQGi1VSooTkDBbuDnxUK3mQsQP9soqHGUsLrbGFrOgh+t543vpdHS8W5/GYzuPQoPo7EiixWLSccepxDq4nDbaP1gLVHxyI2uiizFjMGWoimIEFhCQb6QqB7A==
X-Gm-Message-State: AOJu0YxE1i2AnMFpm8y0odl/FuyggwxPce2TsQg7rQIHo01ljlAehHmh
	UbYaoR7zMklGHJ9eMrWYKvPq+z5ub9YwPqFO7KU3t5LfOOSpdAH4
X-Google-Smtp-Source: AGHT+IEl+OLSX5EKE8Svhc2Wiu4wKJokIxStZwY7ArPgyL/m9N/Ov3vBZPbfAeUYvjwOSj4HMJgJgg==
X-Received: by 2002:ac2:4f16:0:b0:516:cf23:588 with SMTP id k22-20020ac24f16000000b00516cf230588mr12706898lfr.27.1712667523822;
        Tue, 09 Apr 2024 05:58:43 -0700 (PDT)
Received: from localhost (fwdproxy-lla-117.fbsv.net. [2a03:2880:30ff:75::face:b00c])
        by smtp.gmail.com with ESMTPSA id og42-20020a1709071dea00b00a4e657a5f1asm5633237ejc.112.2024.04.09.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:58:43 -0700 (PDT)
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
	bpf@vger.kernel.org
Subject: [PATCH net-next v4 7/9] wifi: qtnfmac: Use netdev dummy allocator helper
Date: Tue,  9 Apr 2024 05:57:21 -0700
Message-ID: <20240409125738.1824983-8-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409125738.1824983-1-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_055850_123005_AF146B95 
X-CRM114-Status: UNSURE (   9.95  )
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


