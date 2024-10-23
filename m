Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02FFD2E021
	for <ath11k@archiver.kernel.org>; Wed, 23 Oct 2024 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lCz9vWBKTzIXW9CVnx5MrMDUVFmO4sXo2pyldlzk2I=; b=k3gwJU3aKidwX22kfp3ireqGpu
	biGXWaa3WVPbJf5WTVcHtramHaU//S5m9HRspEeCMAeg7EZlywVwwp2R5hHhlq7hEaP8KpSlWofa9
	MLXjVDdqvzjnDI7tblsQx1NRqp8YnWvRl8OD6UyLUr5Du8Y0/+zvwBq5tXWZCO9BoGIYoHYBd5JTT
	ClS+R9nE2qjTqgOXIiM/lDob7t8h4/mA/tuEIBF03IV45xf5tD54mz6TNSGbv6x+njXHHzHjHrP9q
	ckjCF8s2yrPbQHazDfGZkTnTQMW3Sr2ocwpGIDPQtorJPf6b1pnSX9DzcRuL+d7/dTFPd0gdcTBcq
	HQMb7wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WCc-0000000DTFa-071t;
	Wed, 23 Oct 2024 07:54:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WBt-0000000DT6f-0ubU
	for ath11k@lists.infradead.org;
	Wed, 23 Oct 2024 07:54:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYLpj4B3Wz10NkR;
	Wed, 23 Oct 2024 15:51:41 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FC301400D8;
	Wed, 23 Oct 2024 15:53:43 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 23 Oct 2024 15:53:42 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	<linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] ath11k: fix return value check in ath11k_spectral_debug_register()
Date: Wed, 23 Oct 2024 15:40:51 +0800
Message-ID: <20241023074051.309-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005401_532119_A74EE56D 
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

Fix the incorrect return value check for debugfs_create_file(), which
returns ERR_PTR(-ERROR) instead of NULL when it fails.

Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 79e091134515b43..4c545231292142a 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -942,7 +942,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 						    0600,
 						    ar->debug.debugfs_pdev, ar,
 						    &fops_scan_ctl);
-	if (!ar->spectral.scan_ctl) {
+	if (IS_ERR(ar->spectral.scan_ctl)) {
 		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
 			    ar->pdev_idx);
 		ret = -EINVAL;
@@ -953,7 +953,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 						      0600,
 						      ar->debug.debugfs_pdev, ar,
 						      &fops_scan_count);
-	if (!ar->spectral.scan_count) {
+	if (IS_ERR(ar->spectral.scan_count)) {
 		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
 			    ar->pdev_idx);
 		ret = -EINVAL;
@@ -964,7 +964,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 						     0600,
 						     ar->debug.debugfs_pdev, ar,
 						     &fops_scan_bins);
-	if (!ar->spectral.scan_bins) {
+	if (IS_ERR(ar->spectral.scan_bins)) {
 		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
 			    ar->pdev_idx);
 		ret = -EINVAL;
-- 
2.34.1


