Return-Path: <SRS0=PtVs=HO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9DCC433E0
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 11:36:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D64B64E32
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 11:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D64B64E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AC/ox51nmtVq1p/6rPs3iW6Yanjd79HZXP5Gkn9SXy4=; b=PqXTlhX3HzDrk93uMLB5DR1xgk
	nTI++XWG2OYOrfFX4vIje9ck3bXlPzEK5gpkYWazlXkokIKSioiVyaloVeA0E/RKB1ZL6CVR5CVvV
	SeoxSo7XW4jGLnfBMKYjsYqRV9RAdj7f2LfsanpMyVGuj9zXl+v9+QcvsH9lnjEe5WTF6kAoZ1U4A
	1JPfuyuwU2BAII2yvZozeEQPTLfU8t9WSB2A5HxelLmeL0u0pkI3EKGe8yg9nTWdPoqFYFNJGtlpj
	e0xHm1v+4/AseD/VsWkfD7fFrRM6U89UI8L7VryBK3hKyrtce9RQ/g/LAKFyrn2gNc3OQHw75miUh
	HXLkRnog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAWkV-0002jl-Cg; Fri, 12 Feb 2021 11:36:35 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAWkS-0002iy-VM
 for ath11k@lists.infradead.org; Fri, 12 Feb 2021 11:36:33 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lAWkN-0006Xt-LS; Fri, 12 Feb 2021 11:36:27 +0000
From: Colin King <colin.king@canonical.com>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH][next] ath11k: debugfs: Fix spelling mistake "Opportunies" ->
 "Opportunities"
Date: Fri, 12 Feb 2021 11:36:27 +0000
Message-Id: <20210212113627.212787-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_063633_134355_3A28B8A6 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in some debug text, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index e13684343ec3..ec93f14e6d2a 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -3851,7 +3851,7 @@ htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 			   htt_stats_buf->num_non_srg_ppdu_tried);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "Non-SRG success PPDU = %u\n",
 			   htt_stats_buf->num_non_srg_ppdu_success);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG Opportunies = %u\n",
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG Opportunities = %u\n",
 			   htt_stats_buf->num_srg_opportunities);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG tried PPDU = %u\n",
 			   htt_stats_buf->num_srg_ppdu_tried);
-- 
2.30.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
