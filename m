Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A565CA6015
	for <ath11k@archiver.kernel.org>; Fri,  9 Oct 2026 06:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnvNFscABF4xXX7FDvlAv4KYOnQuQ7419R+Zi6Stu/4=; b=iF52iyUQRr8DIhRT3QKRprClLG
	tro6KvBYCdZteJOGHKDrDVg3sMCRpCuqeWYgMGsR5VGnxaUYbfLTonuKs0KmxuD3mj8MnOuEgBEoi
	jDKlJgE617qGiGnGngQG6zRsn+BSGAUdRksM/T5qY+tESLqaArVBDUuFnCdU+Rrn3q4rNrIPyg8Bh
	QZzsSyceiYEYxYF3RdDYKpcNJh7tmtINMd2Qi3ECSz2bbCQY9Jzcy3MuTzk3qjN7rBYtuF2oI8VIN
	Wk2nNRCM4dxuGJy+FU1RUlfZOsAYE+fqs17wUKcpLppF2Nx7nDOnEVp/q2OWUTNVl5yn9XG4pObWv
	EomzdPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3hk-00000005a18-3GEV;
	Fri, 09 Oct 2026 06:03:40 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3hh-00000005a0j-0VGC
	for ath11k@lists.infradead.org;
	Fri, 09 Oct 2026 06:03:39 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 506751e3b;
	Fri, 9 Oct 2026 14:03:31 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] wifi: ath11k: initialize CFR locks before capability checks
Date: Fri,  9 Oct 2026 14:03:26 +0800
Message-Id: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa11f4276de03a1kunm636de93c439e5e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx9CVh9NGR4eTx8dTEsYHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=I5N8O7m89N49fSkTuU1Rw3Ra8D3ISfIklA+9xG9AK+5MOEUx1izlNnKb8ZZ93cldkV7im3/Cm+vbl2u28gN6e6g2knEGrx5p6s8w5P+GP60UP8RvLGQ7+Q9XnwOpAUw3fZMxOqRGGePX+KjXjTjbHFVbm1HHxBDhq6UHwhMJD44=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=XnvNFscABF4xXX7FDvlAv4KYOnQuQ7419R+Zi6Stu/4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_230337_866746_79B95663 
X-CRM114-Status: UNSURE (   7.37  )
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

ath11k_cfr_init() returns before initializing cfr->lock when CFR
capability is absent.  However, station removal still calls
ath11k_cfr_decrement_peer_count(), which unconditionally takes this
lock.  This leaves a production path using an uninitialized spinlock.

Initialize cfr->lock for every radio before the capability check.  Keep
the CFR ring and lookup-table lock initialization conditional, since
those objects are only used after CFR capability setup.

Fixes: 9b2e3b4ebec7 ("wifi: ath11k: Add initialization and deinitialization sequence for CFR module")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index a91f25fb6..0708ca28b 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -956,6 +956,9 @@ int ath11k_cfr_init(struct ath11k_base *ab)
 	struct ath11k *ar;
 	int i, ret;
 
+	for (i = 0; i < ab->num_radios; i++)
+		spin_lock_init(&ab->pdevs[i].ar->cfr.lock);
+
 	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
 	    !ab->hw_params.cfr_support)
 		return 0;
@@ -971,7 +974,6 @@ int ath11k_cfr_init(struct ath11k_base *ab)
 
 		idr_init(&cfr->rx_ring.bufs_idr);
 		spin_lock_init(&cfr->rx_ring.idr_lock);
-		spin_lock_init(&cfr->lock);
 		spin_lock_init(&cfr->lut_lock);
 
 		num_lut_entries = min_t(u32, CFR_MAX_LUT_ENTRIES, db_cap.min_elem);
-- 
2.34.1

