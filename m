Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3D0ECAAD3
	for <ath11k@archiver.kernel.org>; Wed,  7 Sep 2022 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zZ16deklpKet7I9GFqWH4QprKuTawCK7+pLLPAg5lv0=; b=PeZINIfAUwrJA4
	jnhVr9nlxdCnsn4asfJCMlfSExLhLwRqtjNlIAPjnLEuAVKRbI9VrvHCwnwHMj1pebAXv6mVYNxDU
	SW3VDGSJUXVpmPXD51jybQYOml7hCQPJFCaNb4i0jbdy3wToAwhj8/ThD8m/rmI6LfBp8bFc46cnV
	QGNCAKiFlrBRcPpL3QkBUOo9/7U1/hgmlKfnK7asCHW9IS43hfqfGgexsDoWHnGiENbRozzmfzVtK
	Dlz1EZLRR8X60BYOTuoTuI/WM0uUHxdUfLkykM9r6RRF1MNfEhsBXaqpV/AVzr9VqfqSFZ6tv133p
	gTXWcTtDDRN9YoozvO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVq39-00411M-Sj; Wed, 07 Sep 2022 08:04:43 +0000
Received: from mail-m974.mail.163.com ([123.126.97.4])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpsv-003uz6-3F
	for ath11k@lists.infradead.org; Wed, 07 Sep 2022 07:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5F0Lv
	wMp5Uf995lkO/Kaz7oV49tMvldju3dPm9T1C4Y=; b=e53lznAbnIsVv5a8/sJWR
	iLV+M4ptv14xJo2wWlLLbt9f4oM0WfERvZl67bpjHKNH7oE2cS8UHjPzDUyTOQuU
	0bzRvu6yxYjX8Z+U02/yEp9HxyNmCNwk1ssSTOKBcgTyNsRbs2xqqvAUiqAMkbWd
	pprZXGza2JZWRTYnfc64lY=
Received: from localhost.localdomain (unknown [36.112.3.164])
	by smtp4 (Coremail) with SMTP id HNxpCgAn1cUiShhj2zzxaw--.48992S4;
	Wed, 07 Sep 2022 15:37:17 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: [PATCH] ath11k: mhi: fix potential memory leak in ath11k_mhi_register()
Date: Wed,  7 Sep 2022 15:37:04 +0800
Message-Id: <20220907073704.58806-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: HNxpCgAn1cUiShhj2zzxaw--.48992S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1ruF4UKw1xJFW3uF13XFb_yoW8uFyDpF
	4fW3y7AFyrArs3WFWrtF4kJFy3ua93Ar1DKrZrGw1fGwnavF90q345JF1rXFyakw4xGFyU
	ZF4Ut3W3Gas0qF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziCeHPUUUUU=
X-Originating-IP: [36.112.3.164]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/xtbBOQB1jF-PPLP6bAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_005410_275987_D7ECD1F1 
X-CRM114-Status: GOOD (  10.35  )
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

mhi_alloc_controller() allocates a memory space for mhi_ctrl. When gets
some error, mhi_ctrl should be freed with mhi_free_controller(). But
when ath11k_mhi_read_addr_from_dt() fails, the function returns without
calling mhi_free_controller(), which will lead to a memory leak.

We can fix it by calling mhi_free_controller() when
ath11k_mhi_read_addr_from_dt() fails.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index c44df17719f6..86995e8dc913 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -402,8 +402,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to get msi for mhi\n");
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	if (!test_bit(ATH11K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
@@ -412,7 +411,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	if (test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
 		ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
 		if (ret < 0)
-			return ret;
+			goto free_controller;
 	} else {
 		mhi_ctrl->iova_start = 0;
 		mhi_ctrl->iova_stop = 0xFFFFFFFF;
@@ -440,18 +439,22 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	default:
 		ath11k_err(ab, "failed assign mhi_config for unknown hw rev %d\n",
 			   ab->hw_rev);
-		mhi_free_controller(mhi_ctrl);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_controller;
 	}
 
 	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
 	if (ret) {
 		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	return 0;
+
+free_controller:
+	mhi_free_controller(mhi_ctrl);
+	ab_pci->mhi_ctrl = NULL;
+	return ret;
 }
 
 void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
