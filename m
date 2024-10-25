Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB17D11701
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXVImXUIsiGj720+UVOWZCAxpM7UL09imAvxJkatMoA=; b=C45ujY2d127cfzwIIyeTsVfblo
	n0SILjT+qER1+SsEZkTLmXe73RH23xtEOO/ZCe43fQ4xVckY9tUWxPLtt2g29AZTH2CK7HD8Ovnb+
	cxYM+79it4VphoeDywjBhLZ7F1yzlNMTWRam6OvbT1ezbxvBy+kNlUgeMyMPN1ZQ0cGBC4MVu6d5K
	Mr4sxF00PpCZIzTeBpT2dyG/yIhphElZm5Fh7KuZ9xNAq7eXD9NJl/KOWAeyUNWmA7mmp5TfP/GEG
	GR9/EsU0vfKdh1xFkwSDae2pq8UVtrf2Kv0FZkoYkDJdiWeYzkfs4OtUI0e2Isf2O7REBjp1lXaiD
	AvniqeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Dya-00000002her-1jJg;
	Fri, 25 Oct 2024 06:39:12 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Dx5-00000002hSR-1Mwf
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 06:37:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XZY2V1Z6dz2FbLR;
	Fri, 25 Oct 2024 14:36:02 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id B721B180044;
	Fri, 25 Oct 2024 14:37:27 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 25 Oct 2024 14:37:27 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	<linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH] ath11k: remove error checking for debugfs_create_file()
Date: Fri, 25 Oct 2024 14:36:14 +0800
Message-ID: <20241025063614.368-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_233739_590998_FBCAECEE 
X-CRM114-Status: UNSURE (   6.53  )
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

Driver ath11k can work fine even if the debugfs files fail to be created.
Therefore, the return value check of debugfs_create_file() should be
ignored, as it says.

Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 24 ----------------------
 1 file changed, 24 deletions(-)

v1 --> v2:
Remove error checking for debugfs_create_file() instead of fixing it.

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 79e091134515b43..a6426eda023a944 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -925,8 +925,6 @@ void ath11k_spectral_deinit(struct ath11k_base *ab)
 
 static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 {
-	int ret;
-
 	ar->spectral.rfs_scan = relay_open("spectral_scan",
 					   ar->debug.debugfs_pdev,
 					   ATH11K_SPECTRAL_SUB_BUFF_SIZE(ar->ab),
@@ -942,40 +940,18 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 						    0600,
 						    ar->debug.debugfs_pdev, ar,
 						    &fops_scan_ctl);
-	if (!ar->spectral.scan_ctl) {
-		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
-			    ar->pdev_idx);
-		ret = -EINVAL;
-		goto debug_unregister;
-	}
 
 	ar->spectral.scan_count = debugfs_create_file("spectral_count",
 						      0600,
 						      ar->debug.debugfs_pdev, ar,
 						      &fops_scan_count);
-	if (!ar->spectral.scan_count) {
-		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
-			    ar->pdev_idx);
-		ret = -EINVAL;
-		goto debug_unregister;
-	}
 
 	ar->spectral.scan_bins = debugfs_create_file("spectral_bins",
 						     0600,
 						     ar->debug.debugfs_pdev, ar,
 						     &fops_scan_bins);
-	if (!ar->spectral.scan_bins) {
-		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
-			    ar->pdev_idx);
-		ret = -EINVAL;
-		goto debug_unregister;
-	}
 
 	return 0;
-
-debug_unregister:
-	ath11k_spectral_debug_unregister(ar);
-	return ret;
 }
 
 int ath11k_spectral_init(struct ath11k_base *ab)
-- 
2.34.1


