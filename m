Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B0C61DA4
	for <ath11k@archiver.kernel.org>; Fri, 17 Feb 2023 03:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9eM/gkEW0JI6IDUqyappHG1mkwY8sNzoUvG0yHZu9w=; b=DnCB+Vf2eRTFUJ
	8DAdSW00y7vblBkTWf0gYxrLbFvHAp2l5av5pAcLewarMNIw6f406ju7K83rA34kQ8x+tzeRJ/Aw1
	lf69xvtAxEZjmPfiy5AOK74ZKSRwJucH76Bi/qRLuR+3wSLNQPM//ck4lNFXO2ZHtCvw4z2nWi1Xx
	Unuq17eO1pNUUmJJlsp9+pC3NuLXnaERJxC0jO3ibATmbmArB6TLQzOFpvtlSrx+YKqb8Uq+URlfu
	RL+XEYpKWWpxerr+d/XN87n4NuqOZ0wmPNs4AmAq9xwHhw6YA/zRO+wm6pF7UaCi5IuEVZNQs8XOg
	rOVDQyMLIaZx2U3wmc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqzz-00CShK-Lp; Fri, 17 Feb 2023 03:01:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqzw-00CSfM-Np
	for ath11k@lists.infradead.org; Fri, 17 Feb 2023 03:01:22 +0000
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PHxNq4ZgYzGphk;
	Fri, 17 Feb 2023 10:59:23 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 17 Feb
 2023 11:01:12 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: <kvalo@kernel.org>, <quic_kathirve@quicinc.com>,
	<quic_srirrama@quicinc.com>, <yangyingliang@huawei.com>,
	<liwei391@huawei.com>
Subject: [PATCH -next] wifi: ath11k: fix return value check in ath11k_ahb_probe()
Date: Fri, 17 Feb 2023 11:00:31 +0800
Message-ID: <20230217030031.4021289-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_190120_979335_E18859B6 
X-CRM114-Status: GOOD (  10.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ioremap() returns NULL pointer not PTR_ERR() when it fails,
so replace the IS_ERR() check with NULL pointer check.

Fixes: b42b3678c91f ("wifi: ath11k: remap ce register space for IPQ5018")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 920abce9053a..bad3946b44bf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1174,7 +1174,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		 * to a new space for accessing them.
 		 */
 		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
-		if (IS_ERR(ab->mem_ce)) {
+		if (!ab->mem_ce) {
 			dev_err(&pdev->dev, "ce ioremap error\n");
 			ret = -ENOMEM;
 			goto err_core_free;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
