Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A3CD11C2
	for <ath11k@archiver.kernel.org>; Fri,  5 Apr 2024 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=; b=4702ByWeGgtqnjx0MC5Qxgao/e
	xoABU4A3iyuogl/IARcOzp0jIkCvMO7/Mpw6Bk+q9lGHZpJ5ZzAxQ2OtEyk2vul207t/pF8izcfwW
	0etAgLeyVbLybVo9gby+KDML0ZUZ8BvqvdSxzXyDHFNkg7BZ39u/H19eoiFG0IdEzwarAdZVTmNER
	UHgmSUVMJhe+AR6Rg1+CvUUs5CiizsA3CudSQ7ipw0gosB6D1AA8YlzRUQ1+v+H396hr5O5Ok8EJE
	jHXfesCTprP+c7IlNLoKs65Dqviwqty9/pxhAhooMmEgW6HY8mJoJ2QlYX/0bPs3lLHY33vcr7/y5
	PAqCzC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsib2-00000006uWY-2hPS;
	Fri, 05 Apr 2024 12:23:04 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiay-00000006uUK-3t4s;
	Fri, 05 Apr 2024 12:23:02 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4644bde1d4so288498466b.3;
        Fri, 05 Apr 2024 05:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319779; x=1712924579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uOh18J18K7IiJjOdRTp7+wBD9ghOrm4r66dFYnU+6Y=;
        b=qGSJSwgdcnMLQMYApbLXw02/O9OteZFc4vKYOhcQpVleuEYvLZYeJHYcEreYMtWHl+
         H4qbUvJQVpejuKZXQHRCPuQOA2UDFyIJCDhqG9WW7vDGGbALtIjsXDepBVMLYVDGOOd/
         FjoLUmwos1QjE5K/1+gdhmOppikbDaRkTcEUyINucAaswGag46d5mTaHUJycmvXHr8cW
         AkR/lkvh3aRcZPBXK1ZzeuvlxpIXgeK9lIhvToxq8tbSWynSfZJley9SHo9qlCoOaEhb
         jGCO7r6h3g87E7EUlomPnGrbkz+ZcZwE3BaHvslTIL2IS20Q8ZVTgIp+pQzLjhWqCAdi
         yPog==
X-Forwarded-Encrypted: i=1; AJvYcCVCkqlxBJ9O1EuzlWJ50iAfYiFQPlcWx/aWJFK3XN8AJ2ezzlDiVXeNVsLrQVoa/rHj9H98FFY7I/YGk64TgstAwfcM6cUFHhh5nFexU8k8sl9Z//OchNiHG2b+Wk01oEgntS/6YnE=
X-Gm-Message-State: AOJu0Yy/d/qaT/7ab9r0552D9qImFNrtcCMHXfphOLARPV8k4SpuCqqr
	HIrLCQx3pNfk06NSDupCNd8j9AqxqwsTfyHG/HDWrNE1GDUq9PO6
X-Google-Smtp-Source: AGHT+IFdHsxwrbfbqJKvyoc+YkWTyw7/1mQKOsUp9VLVmBgIlDYCc0+Dird1CdX5KOpfcS1gvPdwJQ==
X-Received: by 2002:a17:907:78d7:b0:a47:340b:df71 with SMTP id kv23-20020a17090778d700b00a47340bdf71mr982006ejc.2.1712319778959;
        Fri, 05 Apr 2024 05:22:58 -0700 (PDT)
Received: from localhost (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id z7-20020a17090655c700b00a46d9966ff8sm790247ejp.147.2024.04.05.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:22:58 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	imitsyanko@quantenna.com,
	geomatsi@gmail.com,
	kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/3] wifi: qtnfmac: Use netdev dummy allocator helper
Date: Fri,  5 Apr 2024 05:21:16 -0700
Message-ID: <20240405122123.4156104-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405122123.4156104-1-leitao@debian.org>
References: <20240405122123.4156104-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_052300_990889_11592534 
X-CRM114-Status: UNSURE (   9.72  )
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


