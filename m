Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC199C4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=; b=cOV64XRfHqDmhl4YIHm4Sex+wD
	80n0o791AJOCLcRv1d3gK3rYTneqxwVSu4NCjPuLkuLGY9dCZfZTM661i2w13jH0I05Z3gtG+IumS
	QBhwJMF93kp9nilaKqF/joSCEHos4o3TgSw6iQ8XuWQhyIVRN2p80nl8m9krkWBXhV/OzVcqliJTH
	Za+NXF8/i0IE+HU7tmf71nuXCQpxCWWVcWzYoid4iqmDT8FWeAMP+BRE5sV3kd5pAIU3CD5crw23Q
	U0Pq81wI7GVY7OFfBSB4g7zhds3T1IPE3SLJi1VvK9y2mu927lT62s3lhpATFgwrbHhfqNOju65gY
	TNXxsWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvx3-0000000CcnO-1z9X;
	Thu, 11 Apr 2024 15:02:57 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuyl-0000000CJZQ-0Rqb;
	Thu, 11 Apr 2024 14:00:44 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a51ddc783e3so542792866b.0;
        Thu, 11 Apr 2024 07:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844036; x=1713448836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=;
        b=wYKuL1hVM9XYSIuL0oKtkPTu8rCsugubcvQKkOrDV87q47lvOy/a5Ah9QEIBxHlJ7J
         fMAo7QC+0DNv3FXjk+kuA/oVymwoT0WHJl8TX7dEktSErS6t5t5Ao+ozYWOGZezD4gb2
         0gEzGoRBv4xrNOVyeJooH3wpKt5bYCe9J181Ixc11znRwI0I305fLJFEqjzkDNVRxjKQ
         WMju8QmkwwH6M/6EqZ9WvUnK/jH7XfunD/svyuU/egEXTHq3IQhba0uDfAeSnRU8NbKh
         KchObCJdRv6/WEjT+4FMwmSn4Ql3eLtE8U/iy+lTAg0VnZ9qyxDrw5i5EQ0KIz2UE9Ko
         mO/g==
X-Forwarded-Encrypted: i=1; AJvYcCXE+cnYscu8qI7MAYimcb94W1YQ7yH3urqAa+sCtYVFAFNT0sMX9nPFB4S40lVLcp4FtjZ98CrK0UVL/P1A6zzjswBNJsErqL6omVBVuaGxiqsR4p0y49f3NzKrcio5Szm7cUdsAEtqEWSxdVKW9KChZCNHsvNcrB3KZHot2maXiuLWvN7qQW5vDRUSQfo1odP8SvU1ukxdtmn50dLso5tjrB0j7BfzQdDVAWKgrPiUWg==
X-Gm-Message-State: AOJu0YyVOyxpsmvxns4GmtIoX+aKi1sB5t2P8xvdYUghs4c++C+QBw/7
	2XHeIKpI+zV4k6PXjsBfDLS70CO35bxiHIrsNMWe7AaY70FME6Ux
X-Google-Smtp-Source: AGHT+IG9OibV43go6M08d8+CyIo5MAO/xGhgITI9zP+pb207gCt5NYcI9BhXrh1z5SWobKnlsemMOg==
X-Received: by 2002:a17:906:4888:b0:a51:9938:f77c with SMTP id v8-20020a170906488800b00a519938f77cmr3114612ejq.52.1712844036576;
        Thu, 11 Apr 2024 07:00:36 -0700 (PDT)
Received: from localhost (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906468a00b00a522d350674sm104142ejr.184.2024.04.11.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:00:36 -0700 (PDT)
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
Subject: [PATCH net-next v6 08/10] wifi: qtnfmac: Use netdev dummy allocator helper
Date: Thu, 11 Apr 2024 06:59:32 -0700
Message-ID: <20240411135952.1096696-9-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411135952.1096696-1-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_070039_364765_14D5BEC8 
X-CRM114-Status: UNSURE (   9.55  )
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


